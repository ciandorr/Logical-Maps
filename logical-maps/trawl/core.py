"""Git snapshots, centrality scheduling, append-only artifacts and admission.

Only the locally installed pmap engine is executed. Fetched repository content
and model responses are data, never executable plugins or shell commands.
"""
from __future__ import annotations

import argparse
from contextlib import contextmanager
from copy import deepcopy
from datetime import datetime, timezone
import fcntl
import hashlib
import io
import json
import os
from pathlib import Path, PurePosixPath
import re
import shutil
import subprocess
import sys
import tarfile
import tempfile
from urllib.parse import urlsplit
import uuid

import jsonschema
import yaml

# Trusted tooling, even when reading a different Git snapshot.
sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "scripts"))
import pmap
from . import prompts, providers

ROOT = Path(__file__).resolve().parents[1]
SLUG = re.compile(r"^[a-z0-9]+(?:-[a-z0-9]+)*$")


def now():
    return datetime.now(timezone.utc).isoformat(timespec="microseconds")


def uid(prefix):
    return prefix + "-" + uuid.uuid4().hex


def digest(value):
    return hashlib.sha256(json.dumps(value, sort_keys=True, ensure_ascii=False,
                                     separators=(",", ":")).encode()).hexdigest()


def read(path):
    path = Path(path)
    value = json.loads(path.read_text()) if path.suffix == ".json" else yaml.safe_load(path.read_text())
    return pmap._normalise({} if value is None else value)


def save(path, value):
    """Atomic creation only: an attempt/review/candidate is never overwritten."""
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.NamedTemporaryFile(mode="w", encoding="utf-8", dir=path.parent,
                                     prefix=".pending-", delete=False) as stream:
        temp = Path(stream.name)
        try:
            json.dump(value, stream, ensure_ascii=False, indent=2)
            stream.write("\n")
            stream.flush()
            os.fsync(stream.fileno())
            os.link(temp, path)  # atomically create; never replace an existing artifact
        finally:
            temp.unlink(missing_ok=True)


def git(repo, *args, binary=False):
    proc = subprocess.run(["git", "-C", str(repo), *args], capture_output=True,
                          text=not binary, timeout=180)
    if proc.returncode:
        # Git URLs/error messages may contain credentials; do not persist stderr.
        raise ValueError("Git operation failed: " + args[0])
    return proc.stdout if binary else proc.stdout.strip()


def slug(value):
    if not isinstance(value, str) or not SLUG.fullmatch(value):
        raise ValueError("expected a kebab-case identifier")
    return value


def safe_repository(value):
    if not isinstance(value, str) or not value or value.startswith("-"):
        raise ValueError("invalid source repository")
    parsed = urlsplit(value)
    if parsed.scheme in ("http", "https") and (parsed.username or parsed.password or parsed.query):
        raise ValueError("use credential-free Git URLs and a Git credential helper")
    if parsed.scheme == "ext":
        raise ValueError("external Git transports are not supported")
    return value


def config(path):
    data = read(path)
    if data.get("version") != 1:
        raise ValueError("config version must be 1")
    source = data["source"]
    safe_repository(source["repository"])
    if not isinstance(source["ref"], str) or source["ref"].startswith("-"):
        raise ValueError("invalid source ref")
    for topic in data["topics"]:
        slug(topic)
    if not data["topics"] or len(data["topics"]) != len(set(data["topics"])):
        raise ValueError("topics must be nonempty and unique")
    for name in ("discovery", "review"):
        providers.validate_profile(data[name])
    limits = data["limits"]
    for key in ("requests_per_run", "max_output_tokens", "max_prompt_chars",
                "attempts_per_question", "related_records", "timeout_seconds"):
        if type(limits.get(key)) is not int or limits[key] < 1:
            raise ValueError(f"limits.{key} must be a positive integer")
    question_limit = limits.get("central_questions", 20)
    if question_limit != "all" and (type(question_limit) is not int or question_limit < 1):
        raise ValueError("limits.central_questions must be a positive integer or all")
    if not isinstance(data.get("live_api", False), bool):
        raise ValueError("live_api must be boolean")
    return data


def init_quarantine(path):
    path = Path(path).resolve()
    if path.is_relative_to(ROOT.parent):
        raise ValueError("quarantine must be outside the public Logical Maps checkout")
    if path.exists() and any(path.iterdir()):
        raise ValueError("quarantine init requires an empty directory")
    path.mkdir(parents=True, exist_ok=True)
    git(path, "init", "-b", "main")
    (path / ".gitignore").write_text("cache/\n.lock\n.env\n.env.*\nconfig.local.yaml\n")
    save(path / "quarantine.json", {"version": 1, "id": uid("quarantine"), "created_at": now()})
    (path / "README.md").write_text(
        "# Theorem trawl quarantine\n\nCandidates here are untrusted mathematical proposals. "
        "Reviews are informal checks; admission to Logical Maps is a separate step.\n\n"
        "The runner is in Logical-Maps/logical-maps/trawl. Configure config.local.yaml; "
        "credentials belong in environment variables. cache/ is disposable. "
        "Keep workspaces/, attempts/, candidates/, reviews/ and admissions/ when committing this repo. "
        "Model-generated programs are never executed by this runner. No main-repository write or push happens during a run.\n")
    shutil.copy2(ROOT / "trawl" / "example.yaml", path / "config.local.yaml")
    return path


@contextmanager
def locked(path):
    path = Path(path).resolve()
    if not (path / ".git").is_dir() or git(path, "rev-parse", "--show-toplevel") != str(path):
        raise ValueError("quarantine must be its own Git repository")
    if not (path / "quarantine.json").is_file():
        raise ValueError("missing quarantine manifest")
    with (path / ".lock").open("a") as stream:
        try:
            fcntl.flock(stream, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError:
            raise ValueError("another trawler is using this quarantine") from None
        yield path


def source_snapshot(quarantine, settings, *, fetch=True):
    source = settings["source"]
    repository = safe_repository(source["repository"])
    cache = quarantine / "cache"
    mirror = cache / (digest(repository)[:20] + ".git")
    mirror.mkdir(parents=True, exist_ok=True)
    if not (mirror / "HEAD").exists():
        git(mirror, "init", "--bare")
    if fetch:
        git(mirror, "fetch", "--no-tags", "--depth=1", repository, source["ref"])
    commit = git(mirror, "rev-parse", "FETCH_HEAD^{commit}")
    snapshot = cache / "snapshots" / (commit + "-" + digest(sorted(settings["topics"]))[:12])
    marker = snapshot / "snapshot.json"
    if not marker.exists():
        selected = []
        entries = git(mirror, "ls-tree", "-rz", "--full-tree", commit, binary=True)
        for entry in entries.split(b"\0"):
            if not entry:
                continue
            meta, rawpath = entry.split(b"\t", 1)
            name = rawpath.decode()
            parts = PurePosixPath(name).parts
            allowed = name in ("AGENTS.md", "logical-maps/AGENTS.md", "logical-maps/CLAUDE.md")
            if (len(parts) >= 4 and parts[:2] == ("logical-maps", "topics")
                    and parts[2] in settings["topics"]):
                local = parts[3:]
                allowed = (len(local) == 1 and local[0] in
                           ("topic.yaml", "background.md", "papers.yaml", "AGENTS.md")) or (
                    len(local) == 2 and local[0] in ("principles", "results", "models", "writeups")
                    and Path(local[1]).suffix in (".yaml", ".md"))
            if allowed:
                if meta.split()[0] not in (b"100644", b"100755"):
                    raise ValueError("source contains a non-regular database file")
                selected.append(name)
        if not selected:
            raise ValueError("no Logical Maps source files at selected ref")
        archive = git(mirror, "archive", commit, "--", *selected, binary=True)
        snapshot.mkdir(parents=True, exist_ok=True)
        with tarfile.open(fileobj=io.BytesIO(archive)) as tar:
            for member in tar:
                if member.name in selected and member.isfile():
                    dest = snapshot / member.name
                    dest.parent.mkdir(parents=True, exist_ok=True)
                    dest.write_bytes(tar.extractfile(member).read())
        save(marker, {"repository": repository, "commit": commit})
    return snapshot, {"repository": repository, "ref": source["ref"], "commit": commit}


@contextmanager
def database(root):
    previous = pmap.ROOT, pmap.TOPICS
    pmap.ROOT, pmap.TOPICS = root, root / "topics"
    try:
        yield
    finally:
        pmap.ROOT, pmap.TOPICS = previous
        pmap._PROGRESS_CACHE.clear()


def load_data(snapshot, topic):
    with database(snapshot / "logical-maps"):
        if not pmap.validate_topic(topic, quiet=True):
            raise ValueError(f"source topic fails validation: {topic}")
        return pmap.load_topic(topic)


def topic_digest(snapshot, topic):
    base = snapshot / "logical-maps" / "topics" / topic
    return digest({str(p.relative_to(base)): p.read_text() for p in sorted(base.rglob("*")) if p.is_file()})


def question_key(topic, assumptions, row):
    fields = {k: row[k] for k in ("kind", "premises", "conclusion", "model", "principle") if k in row}
    if "premises" in fields:
        fields["premises"] = sorted(fields["premises"])
    return digest({"topic": topic, "assumptions": sorted(assumptions), **fields})


def plan(snapshot, settings):
    fingerprints = {t: topic_digest(snapshot, t) for t in settings["topics"]}
    cache_key = digest([fingerprints, settings.get("backgrounds", ["all"]),
                        (ROOT / "scripts/pmap.py").read_text(), Path(__file__).read_text()])
    cache = snapshot.parent.parent / "queues" / (cache_key + ".json")
    if cache.exists():
        return read(cache)
    queue = []
    for topic in settings["topics"]:
        data = load_data(snapshot, topic)
        if data["topic"].get("draft"):
            continue
        fingerprint = fingerprints[topic]
        for background, name, engine in pmap._engines(data):
            requested = settings.get("backgrounds", ["all"])
            if "all" not in requested and (background or "base") not in requested:
                continue
            report = engine.rank(top=sys.maxsize)
            rows = report["rows"] + [r for r in report["recorded"] if r.get("status") == "outside"]
            for row in rows:
                # Larger recorded questions have no centrality score, but still get a turn.
                if row.get("status") == "outside":
                    verdict = engine.E.resolve_conjecture({"premises": row["premises"],
                                                         "conclusion": row["conclusion"]})
                    if verdict["status"] != "open":
                        continue
                queue.append({"id": question_key(topic, engine.background, row), "topic": topic,
                              "topic_sha256": fingerprint, "background": background,
                              "assumptions": engine.background, "question": row})
        pmap._PROGRESS_CACHE.clear()
    # Same expanded assumptions can appear under multiple preset names.
    unique = {q["id"]: q for q in queue}
    result = sorted(unique.values(), key=lambda q: (q["question"].get("score") is None,
                    -(q["question"].get("score") or 0), q["id"]))
    save(cache, result)
    return result


def clean(record):
    return {k: v for k, v in record.items() if not k.startswith("_")}


def central_question_list(task, queue, limits):
    """Centrality order for this topic/assumption set, independent of retry order."""
    ranked = sorted((q for q in queue if q["topic"] == task["topic"]
                     and set(q["assumptions"]) == set(task["assumptions"])),
                    key=lambda q: (q["question"].get("rank") is None,
                                   q["question"].get("rank") or sys.maxsize, q["id"]))
    limit = limits.get("central_questions", 20)
    selected = ranked if limit == "all" else ranked[:limit]
    # Preserve a lower-ranked scheduled target alongside the top questions.
    if all(q["id"] != task["id"] for q in selected):
        selected = [*selected, task]
    rows = [{"id": q["id"], "selected": q["id"] == task["id"],
             **{k: q["question"][k] for k in ("kind", "rank", "score", "yes", "no",
                  "premises", "conclusion", "model", "principle") if k in q["question"]}}
            for q in selected]
    return {"topic": task["topic"], "background": task["background"],
            "assumptions": task["assumptions"], "total_open": len(ranked),
            "included": len(rows), "omitted": len(ranked) - len(rows), "limit": limit,
            "ordering": "pmap centrality rank; unscored recorded questions follow scored questions",
            "rows": rows}


def context(snapshot, task, limits, extra_ids=(), *, central_questions=None, continuation=None):
    topic = task["topic"]
    data = load_data(snapshot, topic)
    base = snapshot / "logical-maps" / "topics" / topic
    row = task["question"]
    focus = set(task["assumptions"]) | set(row.get("premises", [])) | set(extra_ids)
    focus |= {row.get("conclusion"), row.get("principle")}
    focus.discard(None)
    focus.discard(pmap.FALSE)
    focus.discard(False)
    definitions = set(focus)
    if central_questions is not None:
        for question in central_questions["rows"]:
            definitions.update(question.get("premises", []))
            definitions.update({question.get("conclusion"), question.get("principle")} - {None, False, pmap.FALSE})
    files = {}

    def include(path, into):
        if path.is_file():
            into[str(path.relative_to(snapshot))] = path.read_text()

    for path in (snapshot / "AGENTS.md", snapshot / "logical-maps/AGENTS.md",
                 snapshot / "logical-maps/CLAUDE.md", base / "AGENTS.md",
                 base / "topic.yaml", base / "background.md", base / "papers.yaml"):
        include(path, files)
    for pid in sorted(definitions):
        include(base / "principles" / f"{slug(pid)}.yaml", files)
    result = {"question": task, "available_principles": [p["id"] for p in data["principles"]],
              "scope": "This packet contains the supplied files only. Other source material is not included."}
    if central_questions is not None:
        result["central_questions"] = central_questions
    if continuation is not None:
        result["continuation"] = continuation
    records = data["results"] + data["models"]
    selected, omitted = [], []
    related = sorted(records, key=lambda r: (
        r["id"] != row.get("model"),
        -len(focus & set(r.get("premises", []) + r.get("satisfies", []) + r.get("violates", [])
                        + [r.get("conclusion")])), r["id"]))
    for record in related:
        ids = set(record.get("premises", []) + record.get("satisfies", []) + record.get("violates", [])
                  + [record.get("conclusion")]) - {None, pmap.FALSE}
        if not ids & focus and record["id"] != row.get("model"):
            continue
        addition = {}
        include(snapshot / "logical-maps" / record["_file"], addition)
        include(base / "writeups" / f"{record['id']}.md", addition)
        for pid in ids:
            include(base / "principles" / f"{slug(pid)}.yaml", addition)
        trial = {**files, **addition}
        if record["id"] == row.get("model") or (len(selected) < limits["related_records"] and
                len(json.dumps({**result, "files": trial}, ensure_ascii=False)) < limits["max_prompt_chars"] * 0.85):
            files = trial
            selected.append(record["id"])
        else:
            omitted.append(record["id"])
    result.update(files=files, omitted_related_records=omitted)
    return result


def actor(profile, raw=None):
    raw = raw or {}
    result = {"kind": "model", "provider": profile["provider"], "model": profile["model"],
              "protocol": profile["protocol"]}
    if profile.get("endpoint"):
        result["endpoint"] = profile["endpoint"]
    if raw.get("model"):
        result["reported_model"] = str(raw["model"])
    return result


def actor_label(value):
    if value["kind"] == "human":
        return value["name"]
    return value["provider"] + "/" + value.get("reported_model", value["model"])


def attempt_key(task, profile, limits):
    context_settings = {"central_questions": limits.get("central_questions", 20),
                        "related_records": limits["related_records"],
                        "max_prompt_chars": limits["max_prompt_chars"],
                        "max_output_tokens": limits["max_output_tokens"]}
    return digest([task["id"], task["topic_sha256"], actor(profile), profile.get("parameters", {}),
                   prompts.VERSION, context_settings])


def attempts(quarantine):
    return [read(path) for path in sorted((quarantine / "attempts").glob("*/request.json"))]


def invoke(quarantine, settings, phase, prompt, source, task=None, candidate_sha=None, continuation_of=None):
    profile = settings["discovery" if phase == "discovery" else "review"]
    limits = settings["limits"]
    system = prompts.DISCOVER if phase == "discovery" else prompts.REVIEW
    body = providers.prepare(profile, system, prompt, limits["max_output_tokens"])
    aid = uid("attempt")
    folder = quarantine / "attempts" / aid
    request = {"id": aid, "phase": phase, "started_at": now(), "source": source,
               "actor": actor(profile), "prompt_version": prompts.VERSION,
               "runner_sha256": digest({p.name: p.read_text() for p in Path(__file__).parent.glob("*.py")}),
               "engine_sha256": hashlib.sha256((ROOT / "scripts/pmap.py").read_bytes()).hexdigest(),
               "body": body, "prompt_sha256": digest(body), "task": task,
               "candidate_sha256": candidate_sha, "continuation_of": continuation_of,
               "attempt_key": attempt_key(task, profile, limits) if task and phase == "discovery" else None}
    # Reservation happens before the network call, so interruption cannot silently rebill it.
    save(folder / "request.json", request)
    try:
        if len(system) + len(prompt) > limits["max_prompt_chars"]:
            raise ValueError("prompt exceeds max_prompt_chars; raise the cap or reduce related_records")
        raw = providers.complete(profile, body, enabled=settings.get("live_api", False),
                                 timeout=limits["timeout_seconds"])
        save(folder / "response.json", raw)
        output = providers.unpack(profile, raw)
        metadata = {"attempt_id": aid, "at": now(), "actor": actor(profile, raw),
                    "prompt_sha256": request["prompt_sha256"], "response_sha256": digest(raw),
                    "usage": raw.get("usage", {}), "response_id": raw.get("id"),
                    "offline": profile["protocol"] == "offline"}
        return output, metadata, folder
    except Exception as error:
        save(folder / "outcome.json", {"outcome": "error", "at": now(),
             "error": str(error) if isinstance(error, providers.ProviderError) else type(error).__name__})
        raise


EVIDENCE_SCHEMA = {"type": "array", "minItems": 1, "items": {
    "type": "object", "additionalProperties": False,
    "required": ["kind", "citation", "locator", "role", "verification"],
    "properties": {
        "kind": {"enum": ["original-argument", "database-record", "literature", "computation"]},
        "citation": {"type": "string", "minLength": 1}, "locator": {"type": "string", "minLength": 1},
        "role": {"enum": ["origin", "proof", "background", "related"]},
        "verification": {"enum": ["supplied-context", "unverified", "argument-in-writeup"]}}}}
REVIEW_SCHEMA = {"type": "object", "additionalProperties": False,
    "required": ["verdict", "summary", "argument_check", "source_check", "issues"],
    "properties": {"verdict": {"enum": ["accept", "revise", "reject", "inconclusive"]},
        **{k: {"type": "string", "pattern": r"\S"} for k in ("summary", "argument_check", "source_check")},
        "issues": {"type": "array", "items": {"type": "string", "minLength": 1}}}}


def check_record(kind, record, data):
    if kind not in ("result", "model"):
        raise ValueError("candidate kind must be result or model")
    jsonschema.validate(record, pmap._schema(kind))
    slug(record["id"])
    if any(record["id"] == r["id"] for r in data["results"] + data["models"]):
        raise ValueError("candidate must use a new record id; existing content is never overwritten")
    ids = {p["id"] for p in data["principles"]}
    refs = record.get("premises", []) + record.get("satisfies", []) + record.get("violates", [])
    if not set(refs) <= ids or (kind == "result" and record["conclusion"] not in ids | {False, pmap.FALSE}):
        raise ValueError("candidate references unknown principles")
    if set(record.get("satisfies", [])) & set(record.get("violates", [])):
        raise ValueError("model both satisfies and violates a principle")
    if record.get("conclusion") in record.get("premises", []):
        raise ValueError("candidate conclusion is a premise")
    if not record.get("sources") or len(record.get("source_names", [])) != len(record["sources"]):
        raise ValueError("candidate needs sources and matching source_names")
    if not record.get("proof" if kind == "result" else "description", "").strip():
        raise ValueError("candidate needs an explicit argument")
    cert = record["certificate"]
    source_ids = {s["id"] for s in data["topic"].get("source_catalog", [])} | {"misc"}
    if cert.get("source_id") not in source_ids:
        raise ValueError("unknown direct mathematical source")
    if any(r["paper"] not in {p["id"] for p in data["papers"]} for r in record.get("references", [])):
        raise ValueError("unknown literature reference")


def make_candidate(item, task, source, metadata, data):
    if set(item) != {"kind", "record", "writeup", "evidence"}:
        raise ValueError("candidate requires kind, record, writeup and evidence only")
    if not isinstance(item["writeup"], str) or not item["writeup"].strip():
        raise ValueError("candidate needs a complete writeup")
    jsonschema.validate(item["evidence"], EVIDENCE_SCHEMA)
    record = deepcopy(item["record"])
    if set(record) & {"status", "tier", "changes", "checks", "was_conjectured"}:
        raise ValueError("candidate supplied runner-owned or executable fields")
    cert = record.get("certificate", {})
    if set(cert) - {"source_id", "produced_by"}:
        raise ValueError("candidate supplied verification metadata")
    if cert.get("source_id") == "misc":
        cert["produced_by"] = actor_label(metadata["actor"])
    elif not cert.get("produced_by", "").strip():
        raise ValueError("published result needs its mathematical author")
    cert.update(recorded_by=actor_label(metadata["actor"]), checked_by=[],
                date=metadata["at"][:10], lean="none")
    record["certificate"] = cert
    record["status"] = "conjectured"
    check_record(item["kind"], record, data)
    content = {**item, "record": record}
    return {"version": 1, "id": uid("candidate"), "task": task, "source": source,
            "discovery": metadata, "content": content, "content_sha256": digest(content)}


def load_candidate(quarantine, cid):
    candidate = read(quarantine / "candidates" / f"{slug(cid)}.json")
    if candidate["content_sha256"] != digest(candidate["content"]):
        raise ValueError("candidate was edited; preserve it and submit a new candidate")
    return candidate


def run(quarantine, settings, snapshot, source, **options):
    from . import workspaces
    return workspaces.run(quarantine, settings, snapshot, source, **options)


def review_context(snapshot, settings, candidate):
    record = candidate["content"].get("record", {})
    ids = record.get("premises", []) + record.get("satisfies", []) + record.get("violates", [])
    if record.get("conclusion") not in (None, False, pmap.FALSE):
        ids.append(record["conclusion"])
    ctx = context(snapshot, candidate["task"], settings["limits"], ids)
    if candidate["content"].get("kind") == "workspace":
        # Include current versions of every proposed edit, even if the original
        # discovery revision is older. Before/after bytes are in the checkpoint.
        ctx["current_changed_files"] = {}
        for change in candidate["content"]["changes"]:
            from .workspaces import safe_path
            path = safe_path(snapshot, change["path"])
            ctx["current_changed_files"][change["path"]] = path.read_text() if path.exists() else None
    return ctx


def record_review(quarantine, candidate, report, reviewer, source, metadata=None, reviewed_at=None):
    jsonschema.validate(report, REVIEW_SCHEMA)
    reviewed_at = reviewed_at or now()
    timestamp = datetime.fromisoformat(reviewed_at)
    if timestamp.tzinfo is None or timestamp > datetime.now(timezone.utc):
        raise ValueError("reviewed_at must be a real, non-future timestamp with a timezone")
    reviewed_at = timestamp.astimezone(timezone.utc).isoformat(timespec="microseconds")
    if report["verdict"] == "accept" and report["issues"]:
        raise ValueError("accept review may not have unresolved issues")
    review = {"version": 1, "id": uid("review"), "candidate_id": candidate["id"],
              "candidate_sha256": digest(candidate), "at": reviewed_at, "recorded_at": now(), "actor": reviewer,
              "source": source, "report": report, "method": "informal-mathematical-review"}
    if metadata:
        review["attempt"] = metadata
    save(quarantine / "reviews" / (review["id"] + ".json"), review)
    return review


def review_api(quarantine, settings, snapshot, source, candidate):
    if settings["review"]["protocol"] == "offline":
        raise ValueError("offline provider cannot review mathematics; use a real model or manual review")
    ctx = review_context(snapshot, settings, candidate)
    prompt = json.dumps({"candidate": candidate, "current_database": ctx}, ensure_ascii=False)
    output, metadata, folder = invoke(quarantine, settings, "review", prompt, source,
                                      candidate_sha=digest(candidate))
    try:
        review = record_review(quarantine, candidate, output, metadata["actor"], source, metadata)
        save(folder / "outcome.json", {"outcome": "review", "review_id": review["id"]})
        return review
    except (ValueError, jsonschema.ValidationError, TypeError):
        save(folder / "outcome.json", {"outcome": "invalid-review"})
        raise


def admit(quarantine, candidate, destination, reviewer_id, admitted_by):
    """Explicit local admission. No commit/push, no overwrites, no executable checks."""
    if candidate["content"].get("kind") == "workspace":
        raise ValueError("Workspace checkpoints are reviewed as file diffs; apply accepted changes through the curator/PR workflow. Automatic admission currently supports individual result/model candidates only.")
    target = Path(destination).resolve()
    if git(target, "rev-parse", "--show-toplevel") != str(target):
        raise ValueError("destination must be the main repository root")
    if git(target, "status", "--porcelain", "--untracked-files=all"):
        raise ValueError("admission needs a clean destination checkout")
    head = git(target, "rev-parse", "HEAD")
    review = read(quarantine / "reviews" / f"{slug(reviewer_id)}.json")
    if review["candidate_id"] != candidate["id"] or review["candidate_sha256"] != digest(candidate):
        raise ValueError("review does not bind to this exact candidate")
    jsonschema.validate(review["report"], REVIEW_SCHEMA)
    if review["report"]["verdict"] != "accept" or review["report"]["issues"]:
        raise ValueError("admission requires an accepting review without unresolved issues")
    if review["source"]["repository"] != candidate["source"]["repository"]:
        raise ValueError("review belongs to a different source repository")
    if review["source"]["commit"] != head:
        raise ValueError("database changed since review; review against the current commit")
    if candidate["discovery"].get("offline") or review.get("attempt", {}).get("offline"):
        raise ValueError("offline test output cannot be admitted")
    if not admitted_by.strip():
        raise ValueError("admission needs the responsible curator's identity")
    topic = slug(candidate["task"]["topic"])
    record = deepcopy(candidate["content"]["record"])
    rid = slug(record["id"])
    kind = candidate["content"]["kind"]
    root = target / "logical-maps"
    with database(root):
        data = pmap.load_topic(topic)
        check_record(kind, record, data)
    if data["topic"].get("draft"):
        raise ValueError("draft topics are outside the trawl")
    # Review must cover every preserved event about this exact candidate; a later
    # rejection/revision prevents selecting an older acceptance to bypass it.
    reviews = [read(p) for p in (quarantine / "reviews").glob("*.json")]
    reviews = [r for r in reviews if r["candidate_id"] == candidate["id"]]
    if any(r["recorded_at"] >= review["recorded_at"] and r["report"]["verdict"] in ("revise", "reject") for r in reviews):
        raise ValueError("candidate has an unresolved adverse review")
    admission = {"id": uid("admission"), "at": now(), "by": admitted_by,
                 "base_commit": head, "candidate_sha256": digest(candidate), "review_id": reviewer_id}
    record["status"] = "proved"
    record["certificate"]["lean"] = "none"
    record["certificate"]["checked_by"] = [
        actor_label(review["actor"]) + " (informal review, " + review["at"][:10] + ")"]
    record["certificate"]["trawl"] = {
        "quarantine_id": read(quarantine / "quarantine.json")["id"], "candidate_id": candidate["id"],
        "candidate_sha256": digest(candidate), "source": candidate["source"],
        "discovery": candidate["discovery"], "evidence": candidate["content"]["evidence"],
        "reviews": sorted(reviews, key=lambda r: (r["at"], r["id"])), "admission": admission}
    record.setdefault("changes", []).append({"date": admission["at"][:10], "by": admitted_by,
        "summary": f"Admitted from theorem trawl {candidate['id']} after informal review {reviewer_id}."})
    path = Path("topics") / topic / ("results" if kind == "result" else "models") / f"{rid}.yaml"
    writeup_path = Path("topics") / topic / "writeups" / f"{rid}.md"
    for rel in (path, writeup_path):
        if (root / rel).exists() or (root / rel).is_symlink():
            raise ValueError("admission would overwrite an existing file")
        if (root / rel).resolve().is_relative_to(root) is False:
            raise ValueError("admission path escapes destination")
    writeup = candidate["content"]["writeup"] + (
        "\n\n## Evidence history\n\n"
        f"Found by {actor_label(candidate['discovery']['actor'])} on {candidate['discovery']['at']}. "
        f"Source revision: `{candidate['source']['commit']}`.\n\n"
        f"Informally checked by {actor_label(review['actor'])} on {review['at']}. "
        f"Admitted by {admitted_by} on {admission['at']}. Lean: none.\n\n"
        f"Candidate `{candidate['id']}`; review `{reviewer_id}`. "
        "Full structured evidence history is in the YAML certificate.\n")
    record_text = yaml.safe_dump(record, sort_keys=False, allow_unicode=True)
    # Validate a staged copy with the trusted local engine, before writing the destination.
    with tempfile.TemporaryDirectory(prefix="trawl-admission-") as tmp:
        staged = Path(tmp)
        shutil.copytree(root / "topics" / topic, staged / "topics" / topic,
                        ignore=shutil.ignore_patterns("lean", "sources", "checks", "__pycache__"))
        (staged / path).parent.mkdir(parents=True, exist_ok=True)
        (staged / path).write_text(record_text)
        with database(staged):
            if not pmap.validate_topic(topic):
                raise ValueError("candidate conflicts with current database")
    if git(target, "rev-parse", "HEAD") != head or git(target, "status", "--porcelain"):
        raise ValueError("destination changed during admission")
    created = []
    try:
        for rel, text in ((path, record_text), (writeup_path, writeup)):
            (root / rel).parent.mkdir(parents=True, exist_ok=True)
            with (root / rel).open("x") as stream:
                created.append(root / rel)
                stream.write(text)
        save(quarantine / "admissions" / f"{admission['id']}.json", {
            **admission, "candidate_id": candidate["id"], "record_path": str(path),
            "record_sha256": hashlib.sha256(record_text.encode()).hexdigest(),
            "state": "written-to-checkout", "publication_commit": None})
    except Exception:
        for made in created:
            made.unlink()
        raise
    return {"record": str(root / path), "writeup": str(root / writeup_path),
            "admission": admission["id"], "state": "written-to-checkout; not committed or published"}


def review_packet(quarantine, settings, snapshot, source, candidate):
    packet = {"id": uid("packet"), "candidate_sha256": digest(candidate), "source": source,
              "candidate": candidate, "review_instructions": prompts.REVIEW,
              "context": review_context(snapshot, settings, candidate)}
    save(quarantine / "packets" / (packet["id"] + ".json"), packet)
    return packet


def publication(quarantine, admission_id, destination, ref, by):
    receipt = read(quarantine / "admissions" / f"{slug(admission_id)}.json")
    target = Path(destination).resolve()
    if git(target, "rev-parse", "--show-toplevel") != str(target):
        raise ValueError("destination must be a Git repository root")
    if ref.startswith("-"):
        raise ValueError("invalid publication ref")
    commit = git(target, "rev-parse", "--verify", ref + "^{commit}")
    raw = git(target, "show", commit + ":logical-maps/" + receipt["record_path"], binary=True)
    if hashlib.sha256(raw).hexdigest() != receipt["record_sha256"]:
        raise ValueError("committed record differs from the admitted record")
    result = {"id": uid("publication"), "admission_id": admission_id,
              "candidate_id": receipt["candidate_id"], "recorded_at": now(), "by": by,
              "commit": commit, "commit_date": git(target, "show", "-s", "--format=%cI", commit),
              "ref": ref, "record_sha256": receipt["record_sha256"]}
    save(quarantine / "publications" / (result["id"] + ".json"), result)
    return result


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--quarantine", type=Path, required=True)
    parser.add_argument("--config", type=Path)
    subs = parser.add_subparsers(dest="command", required=True)
    subs.add_parser("init")
    for command in ("plan", "run", "prepare-workspace", "review", "review-packet"):
        sub = subs.add_parser(command)
        sub.add_argument("--cached", action="store_true", help="use last fetched source, without network")
        if command in ("run", "prepare-workspace"):
            sub.add_argument("--workspace", help="resume this workspace, retaining its pinned source and saved files")
        if command == "plan":
            sub.add_argument("--top", type=int, default=20)
        if command in ("review", "review-packet"):
            sub.add_argument("candidate")
        if command == "review":
            sub.add_argument("--report", type=Path, help="record an actual manual review instead of calling an API")
            sub.add_argument("--reviewer", help="actual human name or exact model identifier for manual review")
            sub.add_argument("--reviewer-kind", choices=("human", "model"), default="human")
            sub.add_argument("--provider", help="provider for a manual model review")
    sub = subs.add_parser("admit")
    sub.add_argument("candidate")
    sub.add_argument("--review", required=True)
    sub.add_argument("--destination", type=Path, required=True)
    sub.add_argument("--by", required=True)
    sub = subs.add_parser("record-publication")
    sub.add_argument("admission")
    sub.add_argument("--destination", type=Path, required=True)
    sub.add_argument("--ref", default="main")
    sub.add_argument("--by", required=True)
    sub = subs.add_parser("checkpoint")
    sub.add_argument("workspace")
    sub.add_argument("--path", action="append", help="checkpoint only this changed file; repeat for related YAML, writeups and evidence")
    subs.add_parser("status")
    args = parser.parse_args(argv)
    if args.command == "init":
        print(init_quarantine(args.quarantine))
        return
    with locked(args.quarantine) as quarantine:
        if args.command == "status":
            print(json.dumps({name: len(list((quarantine / name).glob(pattern))) for name, pattern in
                  (("attempts", "*/request.json"), ("workspaces", "*/workspace.json"), ("candidates", "*.json"),
                   ("reviews", "*.json"), ("admissions", "*.json"), ("publications", "*.json"))}, indent=2))
            return
        if args.command == "checkpoint":
            from . import workspaces
            result = workspaces.checkpoint(quarantine, args.workspace, paths=args.path)
        elif args.command == "record-publication":
            result = publication(quarantine, args.admission, args.destination, args.ref, args.by)
        elif args.command == "admit":
            result = admit(quarantine, load_candidate(quarantine, args.candidate),
                           args.destination, args.review, args.by)
        else:
            settings = config(args.config or quarantine / "config.local.yaml")
            snapshot, source = source_snapshot(quarantine, settings, fetch=not args.cached)
            if args.command == "plan":
                queue = plan(snapshot, settings)
                result = {"source": source, "questions": len(queue), "top": queue[:args.top]}
            elif args.command in ("run", "prepare-workspace"):
                result = run(quarantine, settings, snapshot, source, workspace=args.workspace,
                             prepare_only=args.command == "prepare-workspace")
            else:
                candidate = load_candidate(quarantine, args.candidate)
                if args.command == "review-packet":
                    packet = review_packet(quarantine, settings, snapshot, source, candidate)
                    print(quarantine / "packets" / (packet["id"] + ".json"))
                    return
                if args.report:
                    if not args.reviewer or (args.reviewer_kind == "model" and not args.provider):
                        raise ValueError("manual review needs --reviewer and, for a model, --provider")
                    who = ({"kind": "human", "name": args.reviewer} if args.reviewer_kind == "human" else
                           {"kind": "model", "provider": args.provider, "model": args.reviewer})
                    supplied = read(args.report)
                    if supplied.get("candidate_sha256") != digest(candidate) or supplied.get("source_commit") != source["commit"]:
                        raise ValueError("manual report must bind to the candidate hash and current source commit from its review packet")
                    result = record_review(quarantine, candidate, supplied["report"], who, source,
                                           reviewed_at=supplied["reviewed_at"])
                else:
                    result = review_api(quarantine, settings, snapshot, source, candidate)
        print(json.dumps(result, ensure_ascii=False, indent=2))
        if args.command == "run" and result["errors"]:
            raise SystemExit(1)
