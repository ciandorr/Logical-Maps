"""Persistent discovery workspaces inside the quarantine Git repository.

The tool boundary exposes only copies, read-only references and local engine
reports. No tool accepts a host path, runs a shell, or writes the published
checkout. External agent hosts must enforce their own mount/permission boundary.
"""
from __future__ import annotations

import base64
import difflib
import hashlib
import json
import os
from pathlib import Path, PurePosixPath
import shutil
import tempfile
import time

import jsonschema

from . import core as c, inference, prompts, providers, delegation


def atomic_text(path, text):
    path.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.NamedTemporaryFile(mode="w", encoding="utf-8", dir=path.parent,
                                     prefix=".pending-", delete=False) as stream:
        temp = Path(stream.name)
        try:
            stream.write(text)
            stream.flush()
            os.fsync(stream.fileno())
            os.replace(temp, path)
        finally:
            temp.unlink(missing_ok=True)


def state_save(folder, state):
    if (folder / "SEALED.json").exists():
        raise ValueError("completed workspace is sealed; start a new trawl")
    atomic_text(folder / "state.json", json.dumps(state, ensure_ascii=False, indent=2) + "\n")


def file_text(path):
    return path.read_bytes().decode("utf-8")


def file_hash(text):
    return None if text is None else hashlib.sha256(text.encode()).hexdigest()


def safe_path(root, relative, *, directory=False):
    if not isinstance(relative, str) or not relative or "\\" in relative or "\x00" in relative:
        raise ValueError("use a relative workspace path")
    parts = PurePosixPath(relative).parts
    if PurePosixPath(relative).is_absolute() or any(p.casefold() in ("..", ".git") for p in parts):
        raise ValueError("path is outside the workspace")
    path = root
    if path.is_symlink():
        raise ValueError("workspace symlinks are not supported")
    for part in parts:
        path = path / part
        if path.is_symlink():
            raise ValueError("workspace symlinks are not supported")
    if not path.resolve().is_relative_to(root.resolve()):
        raise ValueError("path is outside the workspace")
    if not directory and path.is_dir():
        raise ValueError("expected a file")
    return path


def tree(root):
    result = {}
    for path in sorted(root.rglob("*")):
        if path.is_symlink():
            raise ValueError("workspace contains a symlink")
        if path.is_file():
            name = path.relative_to(root).as_posix()
            safe_path(root, name)
            result[name] = file_text(path)
    return result


def ensure_active(folder):
    """Discovery may access only its own unfinished work, never closed history."""
    if (folder / "SEALED.json").exists() or c.read(folder / "state.json")["status"] == "complete":
        raise ValueError("completed workspace is sealed; discovery cannot read or edit it")


def seal_workspace(folder):
    marker = folder / "SEALED.json"
    if not marker.exists():
        c.save(marker, {"sealed_at": c.now(), "access": "no discovery reads or writes",
                       "files_sha256": c.digest(tree(folder / "files"))})


def load(quarantine, wid, *, discovery=False):
    folder = quarantine / "workspaces" / c.slug(wid)
    if discovery:
        ensure_active(folder)
    manifest = c.read(folder / "workspace.json")
    if manifest["id"] != wid:
        raise ValueError("workspace identity mismatch")
    return folder, manifest


def create(quarantine, settings, snapshot, source, task, ranked, *, wid=None, assignment=None):
    wid = wid or c.uid("workspace")
    cache = quarantine / "cache"
    cache.mkdir(exist_ok=True)
    staging = Path(tempfile.mkdtemp(prefix="new-agent-", dir=cache))
    try:
        manifest = populate(staging, wid, settings, snapshot, source, task, ranked, assignment)
        destination = quarantine / "workspaces" / wid
        destination.parent.mkdir(exist_ok=True)
        staging.rename(destination)
        return destination, manifest
    finally:
        if staging.exists():
            shutil.rmtree(staging)


def populate(folder, wid, settings, snapshot, source, task, ranked, assignment):
    # Separate copies, never symlinks or hard links to a published checkout/cache.
    reference = folder / "reference" / "source"
    shutil.copytree(snapshot, reference, ignore=shutil.ignore_patterns("snapshot.json"))
    shutil.copytree(reference, folder / "files")
    baseline = {name: file_hash(text) for name, text in tree(reference).items()}
    questions = c.central_question_list(task, ranked, {"central_questions": "all"})
    c.save(folder / "reference" / "central-questions.json", questions)
    c.save(folder / "reference" / "queue.json", ranked)
    shutil.copytree(c.ROOT / "schema", folder / "reference" / "schema")
    manifest = {"version": 1, "id": wid, "created_at": c.now(), "source": source,
                "task": task, "actor": c.actor(settings["discovery"]),
                "trawl_key": c.trawl_key(task, settings["discovery"], settings["limits"]),
                "baseline": baseline, "questions_sha256": c.digest(questions),
                "prompt_version": prompts.VERSION}
    if assignment:
        manifest["delegation"] = assignment
    c.save(folder / "workspace.json", manifest)
    (folder / "INSTRUCTIONS.md").write_text(prompts.DISCOVER, encoding="utf-8")
    (folder / "AGENTS.md").write_text(
        "# Discovery workspace\n\nRead INSTRUCTIONS.md. Use only this workspace's files/ "
        "and reference/ and derived/. Do not read or edit trawl logs, other workspaces, or Git history. "
        "If SEALED.json exists, this entire workspace is closed to discovery.\n")
    state_save(folder, {"status": "active", "messages": [], "pending": None,
                       "profile": c.actor(settings["discovery"]), "last_note": "",
                       "prompt_version": prompts.VERSION,
                       "pass_number": 1, "pass_start_sha256": pass_digest(folder)})
    return manifest


def initial_prompt(folder, manifest, settings):
    ensure_active(folder)
    listing = c.read(folder / "reference" / "central-questions.json")
    limit = settings["limits"].get("central_questions", 20)
    if limit != "all":
        rows = listing["rows"][:limit]
        selected = next(r for r in listing["rows"] if r["selected"])
        if selected not in rows:
            rows.append(selected)
        listing = {**listing, "rows": rows, "included": len(rows),
                   "omitted": listing["total_open"] - len(rows)}
    topic = "work/logical-maps/topics/" + manifest["task"]["topic"]
    question = manifest["task"]["question"]
    start = ["work/logical-maps/AGENTS.md", topic + "/AGENTS.md", topic + "/topic.yaml", topic + "/background.md"]
    if question.get("model"):
        start.append(topic + "/models/" + c.slug(question["model"]) + ".yaml")
    principles = set(manifest["task"]["assumptions"] + question.get("premises", []))
    principles.update({question.get("principle"), question.get("conclusion")} - {None, False, c.pmap.FALSE})
    start.extend(topic + "/principles/" + c.slug(pid) + ".yaml" for pid in sorted(principles))
    start = [path for path in start if resolve_tool_path(folder, path).is_file()]
    return json.dumps({"workspace": manifest["id"], "source": manifest["source"],
        "question": manifest["task"], "central_questions": listing,
        "subagent_assignment": manifest.get("delegation"),
        "topic_directory": topic, "start_here": start,
        "progress_note_exists": resolve_tool_path(folder, "work/notes/progress.md").is_file(),
        "paths": {"work/": "editable copies, new YAML files, writeups, evidence and notes",
                  "reference/source/": "read-only published files at the pinned source commit",
                  "reference/schema/": "read-only database schemas",
                  "derived/": "read-only Python computation reports for this active workspace",
                  "reference/central-questions.json": "complete ordered list for this background",
                  "reference/queue.json": "complete queue across selected topics and backgrounds"},
        "save_policy": "Save work throughout the search. No final JSON response is needed."}, ensure_ascii=False)


def schema(properties, required=()):
    return {"type": "object", "properties": properties, "required": list(required), "additionalProperties": False}


STRING = {"type": "string"}
PAGE = {"offset": {"type": "integer", "minimum": 0}, "limit": {"type": "integer", "minimum": 1, "maximum": 1000}}
COMPUTE = {"topic": STRING, "scope": {"enum": ["work", "reference"]}, "background": STRING}
IDS = {"type": "array", "items": STRING, "uniqueItems": True}
FUNCTIONS = [
    {"name": "list_files", "description": "List immediate files/directories under work/, reference/ or derived/. Directory paths end in /. Use recursive=true only for a needed subtree. Paginated; no total-file quota.",
     "parameters": schema({"path": STRING, "recursive": {"type": "boolean"}, **PAGE}, ("path",))},
    {"name": "read_file", "description": "Read UTF-8 text at work/, reference/ or derived/; offset and limit are characters.",
     "parameters": schema({"path": STRING, "offset": {"type": "integer", "minimum": 0},
                           "limit": {"type": "integer", "minimum": 1, "maximum": 48000}}, ("path",))},
    {"name": "write_file", "description": "Immediately save or replace a file under work/. Drafts and incomplete YAML are allowed.",
     "parameters": schema({"path": STRING, "content": STRING}, ("path", "content"))},
    {"name": "edit_file", "description": "Replace one exact unique text fragment in a work/ file and save immediately.",
     "parameters": schema({"path": STRING, "old_text": {"type": "string", "minLength": 1}, "new_text": STRING},
                          ("path", "old_text", "new_text"))},
    {"name": "delete_file", "description": "Delete a copied or proposed work/ file; the deletion is recorded for review.",
     "parameters": schema({"path": STRING}, ("path",))},
    {"name": "central_questions", "description": "Read the original pinned centrality list in pages. Use recompute_central_questions for current edits.",
     "parameters": schema(PAGE)},
    {"name": "logical_query", "description": "Run pmap.Engine closure, exclusions and countermodel queries locally. Defaults to work/current background; reference queries published data. Omit conclusions to compute all. Returns proof record IDs, paginated; full report saved under derived/. Work results are conditional, not verified proofs.",
     "parameters": schema({**COMPUTE, "premises": IDS, "conclusions": IDS, **PAGE})},
    {"name": "recompute_central_questions", "description": "Run pmap.Lynchpins on current YAML, including transitive closure, and rank all remaining questions. Defaults to work/current background. Cached by input hashes, paginated, saved under derived/. Proved workspace records are provisional; conjectures are not rules.",
     "parameters": schema({**COMPUTE, **PAGE})},
    {"name": "validate_workspace", "description": "Run pmap.validate_topic on work (default) or reference. Return schema, reference and logical-consistency diagnostics. Does not verify mathematical arguments or change any YAML.",
     "parameters": schema({k: v for k, v in COMPUTE.items() if k != "background"})},
] + delegation.FUNCTIONS
TOOL_SCHEMAS = {f["name"]: f["parameters"] for f in FUNCTIONS}


def resolve_tool_path(folder, path, *, write=False, directory=False):
    ensure_active(folder)
    first, sep, rest = path.partition("/")
    if first not in ("work", "reference", "derived") or (write and first != "work"):
        raise ValueError("writes require work/; reads require work/, reference/ or derived/")
    return safe_path(folder / ("files" if first == "work" else first), rest or ".", directory=directory)


def apply_edit(folder, event):
    """Replay a journaled write exactly once after a crash, without reverting later edits."""
    path = resolve_tool_path(folder, event["path"], write=True)
    current = file_text(path) if path.exists() else None
    if file_hash(current) == event["after_sha256"]:
        return
    if file_hash(current) != event["before_sha256"]:
        raise ValueError("file changed since the saved edit intent; inspect before resuming")
    if event["content"] is None:
        path.unlink()
    else:
        atomic_text(path, event["content"])


def execute_tool(folder, manifest, call, metadata, index):
    try:
        ensure_active(folder)
    except ValueError as error:
        # Do not even read a previous receipt or append a failure to sealed work.
        return {"error": str(error)}
    # Provider call IDs are never used as paths. A request/index is unique even
    # across provider/model changes; receipts make response recovery idempotent.
    directory = folder / "turns" / c.slug(metadata["trawl_id"])
    receipt = directory / f"{index:06d}-result.json"
    intent = directory / f"{index:06d}-edit.json"
    if receipt.exists():
        return c.read(receipt)["result"]
    try:
        if intent.exists():
            event = c.read(intent)
            apply_edit(folder, event)
            result = {"saved": event["path"], "sha256": event["after_sha256"]}
        else:
            name = call["name"]
            args = call["arguments"]
            if isinstance(args, str):
                args = json.loads(args)
            if name not in TOOL_SCHEMAS:
                raise ValueError("unknown workspace tool")
            jsonschema.validate(args, TOOL_SCHEMAS[name])
            if name in {f["name"] for f in delegation.FUNCTIONS}:
                result = delegation.handle(folder, manifest, name, args, metadata, index)
            elif name in ("logical_query", "recompute_central_questions", "validate_workspace"):
                result = inference.execute(folder, manifest, name, args)
            elif name == "central_questions":
                listing = c.read(folder / "reference" / "central-questions.json")
                start, limit = args.get("offset", 0), args.get("limit", 20)
                result = {**listing, "offset": start, "rows": listing["rows"][start:start + limit]}
            elif name == "list_files":
                root = resolve_tool_path(folder, args["path"], directory=True)
                paths = []
                recursive = args.get("recursive", False)
                for path in sorted(root.rglob("*") if recursive else root.iterdir()):
                    if path.is_symlink():
                        raise ValueError("workspace contains a symlink")
                    if path.is_file() or not recursive:
                        paths.append(args["path"].rstrip("/") + "/" + path.relative_to(root).as_posix()
                                     + ("/" if path.is_dir() else ""))
                start, limit = args.get("offset", 0), args.get("limit", 200)
                result = {"paths": paths[start:start + limit], "total": len(paths), "offset": start}
            elif name == "read_file":
                path = resolve_tool_path(folder, args["path"])
                content = file_text(path)
                start, limit = args.get("offset", 0), args.get("limit", 16000)
                result = {"content": content[start:start + limit], "total_chars": len(content),
                          "offset": start, "sha256": file_hash(content)}
            else:
                path = resolve_tool_path(folder, args["path"], write=True)
                before = file_text(path) if path.exists() else None
                after = args.get("content") if name == "write_file" else None
                if name == "edit_file":
                    if before is None or before.count(args["old_text"]) != 1:
                        raise ValueError("old_text must match exactly once; read the current file first")
                    after = before.replace(args["old_text"], args["new_text"], 1)
                event = {"path": args["path"], "at": c.now(), "tool": name,
                         "before_sha256": file_hash(before), "after_sha256": file_hash(after),
                         "content": after, "discovery": metadata, "source": manifest["source"]}
                c.save(intent, event)  # durable intent precedes each atomic file change
                apply_edit(folder, event)
                result = {"saved": args["path"], "sha256": file_hash(after)}
    except (ValueError, OSError, KeyError, TypeError, c.yaml.YAMLError, jsonschema.ValidationError) as error:
        result = {"error": str(error)[:1000]}
    c.save(receipt, {"at": c.now(), "call": call, "result": result})
    return result


def activity(messages):
    """Summarize the current conversation, never reread audit archives."""
    calls, result = {}, []
    for message in messages:
        for call in message.get("tool_calls") or []:
            function = call["function"]
            try:
                arguments = json.loads(function["arguments"])
            except (ValueError, TypeError):
                arguments = {}
            calls[call["id"]] = (function["name"], arguments)
        content = message.get("content")
        if isinstance(content, list):
            for block in content:
                if block.get("type") == "tool_use":
                    calls[block["id"]] = (block["name"], block["input"])
            outputs = [(block["tool_use_id"], block["content"]) for block in content if block.get("type") == "tool_result"]
        elif message.get("role") == "tool":
            outputs = [(message["tool_call_id"], content)]
        else:
            outputs = []
        for call_id, raw in outputs:
            if call_id not in calls:
                continue
            name, args = calls[call_id]
            if not isinstance(args, dict):
                args = {}
            try:
                value = json.loads(raw)
            except (ValueError, TypeError):
                continue
            if not isinstance(value, dict):
                continue
            # File contents already live in the workspace. Keep read results
            # below, but never duplicate a large write payload in the summary.
            result.append({"tool": name, "arguments": {k: v for k, v in args.items()
                           if k not in ("content", "old_text", "new_text")}, "result": value})
    return result


def resume_note(folder):
    if resolve_tool_path(folder, "work/notes/progress.md").is_file():
        return "Continue from saved files and work/notes/progress.md. "
    return ("No progress note exists yet. Use the exact start_here paths; do not search for notes "
            "or rediscover the repository. Create work/notes/progress.md as you learn useful facts. ")


def compact_messages(folder, state, profile, initial, output_limit, max_chars):
    """Keep the latest complete tool exchanges; summarize only what must be dropped.

    In particular, never discard a just-read file and replace it with a request
    to read a missing progress note. Retained assistant reasoning/tool blocks
    stay intact for providers that require them during a tool continuation.
    """
    messages = state["messages"]
    recent = activity(messages)
    memory = state.get("context_memory", [])
    for item in recent:
        summary = {"tool": item["tool"], "arguments": item["arguments"],
                   "result": {k: v for k, v in item["result"].items()
                              if k in ("error", "saved", "sha256", "offset", "total", "total_chars", "report", "valid")}}
        memory = [old for old in memory if (old["tool"], old["arguments"]) != (summary["tool"], summary["arguments"])]
        memory.append(summary)
    while len(json.dumps(memory, ensure_ascii=False)) > 2500:
        memory.pop(0)
    state["context_memory"] = memory
    notice = {"role": "user", "content": "Earlier conversation compacted. " + resume_note(folder)
              + "Use the retained tool results below; do not restart directory discovery. Save a progress note "
              "with relevant definitions, evidence and next steps before doing more broad exploration. "
              + "Recent activity (metadata, not mathematical verification): " + json.dumps(memory, ensure_ascii=False)}
    if state.get("output_limit_notice"):
        notice["content"] += "\n" + state["output_limit_notice"]
    prefix = [initial, notice]

    def fits(value):
        body = providers.prepare_agent(profile, prompts.DISCOVER, value, output_limit, FUNCTIONS)
        return len(json.dumps(body, ensure_ascii=False)) <= max_chars

    # Preserve a contiguous suffix beginning with an assistant message, so
    # neither protocol receives orphan tool results or missing call IDs.
    retained = []
    for index in reversed(range(len(messages))):
        if messages[index].get("role") != "assistant":
            continue
        candidate = messages[index:]
        if not fits(prefix + candidate):
            break
        retained = candidate
    if retained:
        result = prefix + retained
    else:
        # One enormous exchange (e.g. a batch of reads or a large write) may
        # exceed the entire context allowance. Carry a bounded, explicit recap
        # as user context, not fabricated provider tool-call messages.
        recap = {"role": "user", "content": ""}
        selected = []
        for item in reversed(recent):
            value = json.loads(json.dumps(item))
            added = False
            while True:
                recap["content"] = "Recent tool results retained after compaction: " + json.dumps([value, *selected], ensure_ascii=False)
                if fits(prefix + [recap]):
                    selected.insert(0, value)
                    added = True
                    break
                payload = value["result"]
                if isinstance(payload.get("content"), str) and len(payload["content"]) > 512:
                    payload["content"] = payload["content"][:len(payload["content"]) // 2]
                    payload["context_excerpt"] = True
                    payload["next_offset"] = payload.get("offset", 0) + len(payload["content"])
                elif any(isinstance(payload.get(key), list) and len(payload[key]) > 1 for key in ("paths", "rows")):
                    key = next(key for key in ("paths", "rows") if isinstance(payload.get(key), list) and len(payload[key]) > 1)
                    payload[key] = payload[key][:len(payload[key]) // 2]
                    payload["context_excerpt"] = True
                    payload["next_offset"] = payload.get("offset", 0) + len(payload[key])
                else:
                    break
            if not added:
                break
        if selected:
            recap["content"] = "Recent tool results retained after compaction: " + json.dumps(selected, ensure_ascii=False)
            result = prefix + [recap]
        else:
            if recent:
                raise ValueError("latest tool result cannot fit the available prompt space")
            result = prefix
    if not fits(result):
        raise ValueError("workspace context cannot fit the available prompt space")
    # Detect repeated compaction of exactly the same evidence, not a cap on
    # exploration, tool use or contributions. Pause rather than bill a loop.
    fingerprint = c.digest([memory, recent[-1:] if recent else []])
    repeat = state.get("repeated_compactions", 0) + 1 if state.get("last_compaction") == fingerprint else 0
    state.update(last_compaction=fingerprint, repeated_compactions=repeat,
                 context_compactions=state.get("context_compactions", 0) + 1)
    if repeat >= 2:
        raise ValueError("repeated context compaction with identical tool results; paused to prevent a discovery loop")
    return result


def changes(folder, manifest):
    before = tree(folder / "reference" / "source")
    if {name: file_hash(text) for name, text in before.items()} != manifest["baseline"]:
        raise ValueError("pinned reference files were changed")
    after = tree(folder / "files")
    return [{"path": name, "before": before.get(name), "after": after.get(name),
             "before_sha256": file_hash(before.get(name)), "after_sha256": file_hash(after.get(name))}
            for name in sorted(before.keys() | after.keys()) if before.get(name) != after.get(name)]


def checkpoint(quarantine, wid, *, reason="manual", paths=None):
    folder, manifest = load(quarantine, wid)
    edits = changes(folder, manifest)
    if paths:
        selected = set(paths)
        unknown = selected - {edit["path"] for edit in edits}
        if unknown:
            raise ValueError("checkpoint paths must name changed files: " + ", ".join(sorted(unknown)))
        edits = [edit for edit in edits if edit["path"] in selected]
    selected = {"work/" + edit["path"] for edit in edits}
    events = []
    for path in (folder / "turns").glob("*/*-edit.json"):
        event = c.read(path)
        if event["path"] not in selected:
            continue
        receipt_path = path.with_name(path.name.replace("-edit.json", "-result.json"))
        receipt = c.read(receipt_path) if receipt_path.exists() else None
        events.append({**{k: v for k, v in event.items() if k != "content"},
                       "event_path": path.relative_to(quarantine).as_posix(),
                       "event_sha256": c.digest(event),
                       "tool_result": receipt["result"] if receipt else {"pending": "No receipt yet; the file diff records the current bytes."},
                       "receipt_sha256": c.digest(receipt) if receipt else None})
    events.sort(key=lambda event: (event["at"], event["event_path"]))
    content = {"kind": "workspace", "workspace_id": wid, "changes": edits,
               "summary": c.read(folder / "state.json").get("last_note"),
               "actor": manifest["actor"], "delegation": manifest.get("delegation"),
               "observed_actors": c.read(folder / "state.json").get("observed_actors", []),
               "subagents": [c.read(path) for path in sorted((folder / "delegations").glob("*/result.json"))],
               "edit_history": events,
               "unfinished_responses": c.read(folder / "state.json").get("unfinished_responses", []),
               "computations": [{"path": path.relative_to(quarantine).as_posix(),
                                 "sha256": hashlib.sha256(path.read_bytes()).hexdigest()}
                                for path in sorted((folder / "derived").glob("*.json"))],
               "audit_location": "workspaces/" + wid + "/turns/; full edit intents and tool receipts",
               "baseline": manifest["baseline"]}
    candidate = {"version": 1, "id": c.uid("checkpoint"), "created_at": c.now(),
                 "reason": reason, "source": manifest["source"], "task": manifest["task"],
                 "content": content, "content_sha256": c.digest(content)}
    c.save(quarantine / "candidates" / (candidate["id"] + ".json"), candidate)
    patch = ""
    for edit in edits:
        lines = difflib.unified_diff((edit["before"] or "").splitlines(keepends=True),
                    (edit["after"] or "").splitlines(keepends=True),
                    fromfile="a/" + edit["path"] if edit["before"] is not None else "/dev/null",
                    tofile="b/" + edit["path"] if edit["after"] is not None else "/dev/null")
        patch += "".join(line if line.endswith("\n") else line + "\n\\ No newline at end of file\n" for line in lines)
    (quarantine / "candidates" / (candidate["id"] + ".diff")).write_text(patch, encoding="utf-8")
    return {"checkpoint": candidate["id"], "workspace": wid, "changed_files": len(edits),
            "files": str(folder / "files"), "candidate_sha256": c.digest(candidate)}


def pass_digest(folder):
    # Notes alone do not trigger another mathematical sweep. Proofs and drafts do.
    base = safe_path(folder / "files", "logical-maps/topics", directory=True)
    return c.digest(tree(base))


def end_pass(folder, manifest, state, settings):
    if delegation.outstanding(folder):
        state.update(status="active", waiting_for_subagents=True)
        return
    current = pass_digest(folder)
    number = state.setdefault("pass_number", 1)
    limit = 1 if manifest.get("delegation") else settings["limits"].get("passes_per_workspace", "budget")
    again = (current != state.get("pass_start_sha256", current)
             and (limit == "budget" or number < limit))
    if not again:
        state["status"] = "complete"
        return
    # Do not seal: another pass belongs to this same unfinished search. If the
    # request/token budget is exhausted, this message survives for the next run.
    ranking = inference.execute(folder, manifest, "recompute_central_questions", {"limit": 20})
    state.update(status="active", pass_number=number + 1, pass_start_sha256=current)
    state["messages"].append({"role": "user", "content": json.dumps({
        "pass": number + 1, "instruction": "Saved mathematical files changed. Start another sweep of the current database. "
        "Use logical_query for transitive consequences and recompute_central_questions for priorities. "
        "Repair validation errors first if present. Save further findings as you go. "
        "Proposed facts remain conditional. Finish when a sweep yields no further useful work.",
        "current_ranking": ranking}, ensure_ascii=False)})
    # Retain the report pointer even if the conversation is compacted or switched.
    state["next_pass_report"] = ranking["report"]


def archive_unfinished(quarantine, request, raw, metadata):
    """Preserve long unfinished thinking outside discovery's file boundary.

    This also permits explicitly requested exports of an already sealed response
    without adding to or changing that trawl's historical files.
    """
    aid = c.slug(request["id"])
    profile = request["profile"]
    if not providers.output_limited(profile, raw):
        raise ValueError("response did not end at a length limit")
    reasoning, partial, calls = providers.unfinished_parts(profile, raw)
    provenance = {"trawl_id": aid, "workspace": request["workspace"], "pass": request.get("pass"),
                  "actor": metadata["actor"], "started_at": request["started_at"],
                  "received_at": metadata["at"], "source": request["source"],
                  "response_sha256": metadata["response_sha256"], "usage": raw.get("usage", {})}
    pieces = ["# Unfinished trawl response\n\n"
              "**Incomplete and unverified.** Preserved for curator review, not an accepted proof. "
              "No tool calls from this response were executed. "
              "This archive is outside discovery access; future trawls must not read it.\n\n"
              f"Raw API response: [response.json](../trawls/{aid}/response.json).\n\n"
              "## Provenance\n\n```json\n" + json.dumps(provenance, ensure_ascii=False, indent=2) + "\n```\n"]
    for title, value in (("Unfinished reasoning", reasoning), ("Partial answer", partial)):
        if value:
            pieces.append("\n## " + title + "\n\n" + (value if isinstance(value, str) else json.dumps(value, ensure_ascii=False, indent=2)) + "\n")
    if not reasoning:
        pieces.append("\nNo readable reasoning text was exposed in this response; any opaque fields remain in the raw archive.\n")
    if calls:
        pieces.append("\n## Unexecuted tool calls\n\n```json\n" + json.dumps(calls, ensure_ascii=False, indent=2) + "\n```\n")
    text = "".join(pieces)
    path = quarantine / "unfinished" / (aid + ".md")
    if path.exists():
        if file_text(path) != text:
            raise ValueError("unfinished response archive differs; immutable evidence cannot be overwritten")
    else:
        c.save_text(path, text)
    return {"trawl_id": aid, "path": path.relative_to(quarantine).as_posix(), "sha256": file_hash(text),
            "status": "incomplete-unverified", "at": metadata["at"], "actor": metadata["actor"]}


def finish_turn(quarantine, folder, manifest, state, settings, aid):
    trawl = c.trawl_folder(quarantine, aid)
    request = c.read(trawl / "request.json")
    profile = request["profile"]
    raw = c.read(trawl / "response.json")
    metadata = {"trawl_id": aid, "at": c.read(trawl / "received.json")["at"],
                "actor": c.actor(profile, raw), "prompt_sha256": request["prompt_sha256"],
                "response_sha256": c.digest(raw), "response_id": raw.get("id"),
                "usage": raw.get("usage", {}), "offline": profile["protocol"] == "offline"}
    metadata["requests_per_run"] = request.get("requests_per_run", settings["limits"]["requests_per_run"])
    actors = state.setdefault("observed_actors", [])
    if metadata["actor"] not in actors:
        actors.append(metadata["actor"])
    if providers.output_limited(profile, raw):
        # Keep the raw response and readable reasoning in immutable audit history. A truncated
        # tool batch may include incomplete JSON or a partially planned edit;
        # neither it nor its unfinished reasoning belongs in the next prompt.
        archived = archive_unfinished(quarantine, request, raw, metadata)
        state.setdefault("unfinished_responses", []).append(archived)
        notice = prompts.OUTPUT_LIMIT.format(output_limit=request.get("output_tokens_reserved", settings["limits"]["max_output_tokens"]))
        state["messages"].append({"role": "user", "content": notice})
        state.update(status="active", last_note=notice, output_limit_notice=notice,
                     output_limit_hits=state.get("output_limit_hits", 0) + 1)
        results, outcome = [], "output-limit"
    else:
        assistant, calls = providers.agent_turn(profile, raw)
        state.pop("output_limit_notice", None)
        results = [(call["id"], execute_tool(folder, manifest, call, metadata, i)) for i, call in enumerate(calls)]
        # The persisted state still precedes this turn until all tool receipts exist.
        state["messages"].append(assistant)
        if calls:
            state["messages"].extend(providers.tool_messages(profile, results))
            state["status"] = "active"
            if any(v.get("wait_for_subagents") for _, v in results):
                state["waiting_for_subagents"] = True
        else:
            end_pass(folder, manifest, state, settings)
        state["last_note"] = assistant.get("content")
        outcome = state["status"]
    if not (trawl / "outcome.json").exists():
        c.save(trawl / "outcome.json", {"outcome": outcome, "workspace": manifest["id"],
               "metadata": metadata, "tool_errors": [v for _, v in results if "error" in v],
               **({"unfinished_response": archived} if outcome == "output-limit" else {})})
    c.seal_trawl(trawl)
    state["pending"] = None
    state_save(folder, state)
    if state["status"] == "complete":
        seal_workspace(folder)
    return results


def transport_state(state, outcome):
    """Restore a failed transport receipt, including after a sealing/state-save crash."""
    archived = outcome.get("unfinished_response")
    if archived:
        saved = state.setdefault("unfinished_responses", [])
        if not any(v["path"] == archived["path"] for v in saved):
            saved.append(archived)
    state.update(pending=None, status="active" if outcome["retry"] else "paused",
                 last_note=outcome["message"])


def record_transport_failure(quarantine, aid, error, *, reserved, charged, budget,
                             failures, retry):
    trawl = c.trawl_folder(quarantine, aid)
    at = c.now()
    archived = None
    if error.partial:
        request = c.read(trawl / "request.json")
        path = trawl / "partial-response.json"
        # Preserve exact exposed bytes even if the last UTF-8 character or JSON
        # object was cut in half. Never parse or execute this partial reply.
        c.save(path, {"version": 1, "status": "incomplete-unverified", "at": at,
            "trawl_id": aid, "workspace": request["workspace"], "source": request["source"],
            "actor": request["actor"], "started_at": request["started_at"],
            "prompt_sha256": request["prompt_sha256"], "error_type": error.reason,
            "encoding": "base64", "bytes_received": len(error.partial),
            "body_sha256": hashlib.sha256(error.partial).hexdigest(),
            "body": base64.b64encode(error.partial).decode("ascii"),
            "note": "Incomplete HTTP body exposed by the client. Usage and final model identity unknown. No tool calls applied; curator evidence only."})
        archived = {"trawl_id": aid, "path": path.relative_to(quarantine).as_posix(),
                    "sha256": hashlib.sha256(path.read_bytes()).hexdigest(),
                    "status": "incomplete-unverified", "at": at, "actor": request["actor"]}
    c.save(trawl / "budget.json", {"reserved": reserved, "charged": reserved,
        "reason": "transport-outcome-unknown", "output_tokens_per_run": budget,
        "invocation_output_tokens_charged": charged})
    message = str(error) + (". Retrying within the remaining run budget." if retry else
        ". Paused: three consecutive connection failures or the run budget was reached. Saved files and conversation are intact.")
    outcome = {"outcome": "transport-error", "at": at, "error_type": error.reason,
               "message": message, "retry": retry, "consecutive_failures": failures}
    if archived:
        outcome["unfinished_response"] = archived
    c.save(trawl / "outcome.json", outcome)
    c.seal_trawl(trawl)
    return outcome


def recover(quarantine, folder, manifest, state, settings):
    aid = state.get("pending")
    if not aid:
        return
    trawl = c.trawl_folder(quarantine, aid)
    if (trawl / "response.json").exists():
        if not (trawl / "received.json").exists():
            c.save(trawl / "received.json", {"at": c.now(), "recovered": True})
        finish_turn(quarantine, folder, manifest, state, settings, aid)
    elif (trawl / "outcome.json").exists() and c.read(trawl / "outcome.json").get("outcome") == "context-rejected":
        # A crash between sealing a rejected request and saving workspace state
        # must not turn a known rejection into lost, unknown-outcome context.
        c.seal_trawl(trawl)
        state["pending"] = None
        state_save(folder, state)
    elif (trawl / "outcome.json").exists() and c.read(trawl / "outcome.json").get("outcome") == "transport-error":
        outcome = c.read(trawl / "outcome.json")
        c.seal_trawl(trawl)
        transport_state(state, outcome)
        state_save(folder, state)
    else:
        if not (trawl / "outcome.json").exists():
            c.save(trawl / "outcome.json", {"outcome": "interrupted", "at": c.now(),
                "note": "Request outcome unknown. Not replayed; previously saved files retained."})
        c.seal_trawl(trawl)
        note = "An earlier request was interrupted; no complete response was saved. Continue from the saved files and previous completed tool results. No tool calls from the interrupted response were applied."
        state.update(pending=None, last_note=note)
        state["messages"].append({"role": "user", "content": note})
        state_save(folder, state)


def agent_turns(quarantine, settings, folder, manifest, state, result, control):
    """Cooperative agent: all tools/state stay on the coordinator, only HTTP is yielded.

    None is a budget-wait boundary, (profile, body) is a reserved API request.
    Send a reply or throw its transport exception back to finish that exact turn.
    """
    wid = manifest["id"]
    output_budget = result["output_tokens_budget"]
    def budget_left():
        return (result["requests"] < settings["limits"]["requests_per_run"]
                and result["output_tokens_charged"] < output_budget)
    try:
        state.setdefault("pass_number", 1)
        state.setdefault("pass_start_sha256", pass_digest(folder))
        recover(quarantine, folder, manifest, state, settings)
        if state["status"] == "complete":
            seal_workspace(folder)
            return
        profile = settings["discovery"]
        if state.get("profile") != c.actor(profile):
            state.update(messages=[], profile=c.actor(profile))
        state["status"] = "active"
        prompt_cap = c.prompt_char_limit(settings["limits"])
        context_rejections = 0
        transport_failures = 0
        while not control.stopping:
            yield None  # Ready; only the coordinator grants the next budget reservation.
            if control.stopping or not budget_left():
                break
            initial = {"role": "user", "content": initial_prompt(folder, manifest, settings)}
            if state.get("next_pass_report"):
                initial["content"] += "\nCurrent pass " + str(state["pass_number"]) + "; read " + state["next_pass_report"]
            output_limit = min(settings["limits"]["max_output_tokens"], output_budget - result["output_tokens_charged"])
            if state["messages"] and state.get("prompt_version") != prompts.VERSION:
                # Upgrade unfinished work without replaying its obsolete
                # bootstrap instructions or throwing away recent evidence.
                state["messages"] = compact_messages(folder, state, profile, initial, output_limit,
                                                     prompt_cap)
            state["prompt_version"] = prompts.VERSION
            if not state["messages"]:
                state["messages"] = [initial, {"role": "user", "content": resume_note(folder) + str(state.get("last_note", ""))[:2000]}]
            body = providers.prepare_agent(profile, prompts.DISCOVER, state["messages"], output_limit, FUNCTIONS)
            if len(json.dumps(body, ensure_ascii=False)) > prompt_cap:
                state["messages"] = compact_messages(folder, state, profile, initial, output_limit,
                                                     prompt_cap)
                body = providers.prepare_agent(profile, prompts.DISCOVER, state["messages"], output_limit, FUNCTIONS)
            aid = c.uid("trawl")
            trawl = quarantine / "trawls" / aid
            c.save(trawl / "request.json", {"id": aid, "phase": "workspace-discovery", "started_at": c.now(),
                "workspace": wid, "source": manifest["source"], "task": manifest["task"], "actor": c.actor(profile),
                "profile": profile, "body": body, "prompt_sha256": c.digest(body), "prompt_version": prompts.VERSION,
                "pass": state["pass_number"], "output_tokens_reserved": output_limit,
                "requests_per_run": settings["limits"]["requests_per_run"],
                "delegation": manifest.get("delegation"),
                "runner_sha256": c.digest({p.name: p.read_text() for p in Path(__file__).parent.glob("*.py")}),
                "engine_sha256": hashlib.sha256((c.ROOT / "scripts/pmap.py").read_bytes()).hexdigest()})
            state["pending"] = aid
            state_save(folder, state)
            result["requests"] += 1
            if len(json.dumps(body, ensure_ascii=False)) > prompt_cap:
                raise ValueError("initial workspace prompt exceeds max_prompt_chars")
            # Charge before transport: missing usage or a lost response cannot
            # silently replenish this invocation's budget.
            result["output_tokens_charged"] += output_limit
            try:
                raw = yield (profile, body)
            except providers.TransportError as error:
                transport_failures += 1
                retry = (transport_failures < 3 and not control.stopping
                         and result["requests"] < settings["limits"]["requests_per_run"]
                         and (result["output_tokens_charged"] < output_budget or control.in_flight))
                outcome = record_transport_failure(quarantine, aid, error,
                    reserved=output_limit, charged=result["output_tokens_charged"],
                    budget=output_budget, failures=transport_failures, retry=retry)
                transport_state(state, outcome)
                state_save(folder, state)
                result.setdefault("transport_failures", []).append({"workspace": wid, "trawl": aid, **outcome})
                if not retry:
                    control.stopping = True
                    result["errors"].append({"workspace": wid, "trawl": aid, "error": outcome["message"]})
                    break
                # Every retry is a new logged request, charged above; the
                # missing response never replenishes the output allowance.
                try:
                    time.sleep(2 ** (transport_failures - 1))
                except KeyboardInterrupt:
                    state.update(status="paused", last_note="Connection retry interrupted by the operator; saved files and conversation are intact.")
                    state_save(folder, state)
                    raise
                continue
            except KeyboardInterrupt:
                # Ctrl-C while waiting is a stop request, never a retry.
                c.save(trawl / "budget.json", {"reserved": output_limit, "charged": output_limit,
                    "reason": "interrupted-outcome-unknown", "output_tokens_per_run": output_budget,
                    "invocation_output_tokens_charged": result["output_tokens_charged"]})
                c.save(trawl / "outcome.json", {"outcome": "interrupted", "at": c.now(),
                    "error_type": "KeyboardInterrupt", "note": "Interrupted by the operator while waiting for the API; response and usage unknown."})
                c.seal_trawl(trawl)
                state.update(status="paused", last_note="API request interrupted by the operator; saved files and conversation are intact.")
                state_save(folder, state)
                raise
            except providers.ContextLengthError:
                # No generation occurred. Keep the rejected request immutable,
                # then send a smaller conversation as a new, budgeted turn.
                result["output_tokens_charged"] -= output_limit
                c.save(trawl / "budget.json", {"reserved": output_limit, "charged": 0,
                       "reason": "context-rejected-before-generation", "output_tokens_per_run": output_budget,
                       "invocation_output_tokens_charged": result["output_tokens_charged"]})
                c.save(trawl / "outcome.json", {"outcome": "context-rejected", "at": c.now()})
                c.seal_trawl(trawl)
                state["pending"] = None
                state_save(folder, state)
                if settings["limits"]["max_prompt_chars"] != "model":
                    raise
                context_rejections += 1
                if context_rejections >= 3:
                    raise ValueError("API repeatedly rejected the compacted context; paused after three rejections")
                # Leave room for more tool results, without guessing the
                # provider's tokenizer or permanently imposing a smaller cap.
                smaller = len(json.dumps(body, ensure_ascii=False)) * 3 // 4
                state["messages"] = compact_messages(folder, state, profile, initial, output_limit, smaller)
                state_save(folder, state)
                continue
            context_rejections = 0
            if transport_failures:
                state["last_note"] = ""
            transport_failures = 0
            c.save(trawl / "response.json", raw)
            c.save(trawl / "received.json", {"at": c.now()})
            charged = providers.output_tokens(profile, raw, reserved=output_limit)
            result["output_tokens_charged"] += charged - output_limit
            c.save(trawl / "budget.json", {"reserved": output_limit, "charged": charged,
                   "output_tokens_per_run": output_budget,
                   "invocation_output_tokens_charged": result["output_tokens_charged"]})
            values = finish_turn(quarantine, folder, manifest, state, settings, aid)
            result["errors"].extend({"workspace": wid, "trawl": aid, **v} for _, v in values if "error" in v)
            if state["status"] == "complete":
                break
    except (ValueError, OSError, KeyError, TypeError, IndexError) as error:
        aid = state.get("pending")
        if aid and not (c.trawl_folder(quarantine, aid) / "outcome.json").exists():
            c.save(c.trawl_folder(quarantine, aid) / "outcome.json", {"outcome": "error", "at": c.now(), "error": type(error).__name__,
                "message": str(error) if isinstance(error, providers.ProviderError) else "Runner error; see exception type."})
        if aid:
            c.seal_trawl(c.trawl_folder(quarantine, aid))
        state.update(pending=None, status="paused", messages=[], last_note="Previous turn failed; saved files are intact. Resume by inspecting progress notes.")
        state_save(folder, state)
        result["errors"].append({"workspace": wid, "error": str(error)})
        control.stopping = True
    finally:
        result["checkpoints"].append(checkpoint(quarantine, wid, reason="run-stopped"))


def run(quarantine, settings, snapshot, source, *, workspace=None, prepare_only=False):
    from . import parallel
    return parallel.run(quarantine, settings, snapshot, source,
                        workspace=workspace, prepare_only=prepare_only)
