"""Persistent discovery workspaces inside the quarantine Git repository.

The tool boundary exposes only copies and a read-only reference tree. No tool
accepts a host path, runs a shell, or writes the published checkout. External
agent hosts must enforce their own mount/permission boundary.
"""
from __future__ import annotations

from collections import Counter
import difflib
import hashlib
import json
import os
from pathlib import Path, PurePosixPath
import shutil
import tempfile

import jsonschema

from . import core as c, prompts, providers


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


def load(quarantine, wid):
    folder = quarantine / "workspaces" / c.slug(wid)
    manifest = c.read(folder / "workspace.json")
    if manifest["id"] != wid:
        raise ValueError("workspace identity mismatch")
    return folder, manifest


def create(quarantine, settings, snapshot, source, task, ranked):
    wid = c.uid("workspace")
    folder = quarantine / "workspaces" / wid
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
                "attempt_key": c.attempt_key(task, settings["discovery"], settings["limits"]),
                "baseline": baseline, "questions_sha256": c.digest(questions),
                "prompt_version": prompts.VERSION}
    c.save(folder / "workspace.json", manifest)
    (folder / "INSTRUCTIONS.md").write_text(prompts.DISCOVER, encoding="utf-8")
    state_save(folder, {"status": "active", "messages": [], "pending": None,
                       "profile": c.actor(settings["discovery"]), "last_note": ""})
    return folder, manifest


def initial_prompt(folder, manifest, settings):
    listing = c.read(folder / "reference" / "central-questions.json")
    limit = settings["limits"].get("central_questions", 20)
    if limit != "all":
        rows = listing["rows"][:limit]
        selected = next(r for r in listing["rows"] if r["selected"])
        if selected not in rows:
            rows.append(selected)
        listing = {**listing, "rows": rows, "included": len(rows),
                   "omitted": listing["total_open"] - len(rows)}
    return json.dumps({"workspace": manifest["id"], "source": manifest["source"],
        "question": manifest["task"], "central_questions": listing,
        "paths": {"work/": "editable copies, new YAML files, writeups, evidence and notes",
                  "reference/source/": "read-only published files at the pinned source commit",
                  "reference/schema/": "read-only database schemas",
                  "reference/central-questions.json": "complete ordered list for this background",
                  "reference/queue.json": "complete queue across selected topics and backgrounds"},
        "save_policy": "Save work throughout the search. No final JSON response is needed."}, ensure_ascii=False)


def schema(properties, required=()):
    return {"type": "object", "properties": properties, "required": list(required), "additionalProperties": False}


STRING = {"type": "string"}
PAGE = {"offset": {"type": "integer", "minimum": 0}, "limit": {"type": "integer", "minimum": 1, "maximum": 1000}}
FUNCTIONS = [
    {"name": "list_files", "description": "List files under work/ or reference/. Paginated; no total-file quota.",
     "parameters": schema({"path": STRING, **PAGE}, ("path",))},
    {"name": "read_file", "description": "Read UTF-8 text at work/ or reference/; offset and limit are characters.",
     "parameters": schema({"path": STRING, "offset": {"type": "integer", "minimum": 0},
                           "limit": {"type": "integer", "minimum": 1, "maximum": 48000}}, ("path",))},
    {"name": "write_file", "description": "Immediately save or replace a file under work/. Drafts and incomplete YAML are allowed.",
     "parameters": schema({"path": STRING, "content": STRING}, ("path", "content"))},
    {"name": "edit_file", "description": "Replace one exact unique text fragment in a work/ file and save immediately.",
     "parameters": schema({"path": STRING, "old_text": {"type": "string", "minLength": 1}, "new_text": STRING},
                          ("path", "old_text", "new_text"))},
    {"name": "delete_file", "description": "Delete a copied or proposed work/ file; the deletion is recorded for review.",
     "parameters": schema({"path": STRING}, ("path",))},
    {"name": "central_questions", "description": "Read the full centrality-ordered question list in pages for the pinned topic/background.",
     "parameters": schema(PAGE)},
]
TOOL_SCHEMAS = {f["name"]: f["parameters"] for f in FUNCTIONS}


def resolve_tool_path(folder, path, *, write=False, directory=False):
    first, sep, rest = path.partition("/")
    if first not in ("work", "reference") or (write and first != "work"):
        raise ValueError("writes require work/; reads require work/ or reference/")
    return safe_path(folder / ("files" if first == "work" else "reference"), rest or ".", directory=directory)


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
    # Provider call IDs are never used as paths. A request/index is unique even
    # across provider/model changes; receipts make response recovery idempotent.
    directory = folder / "turns" / c.slug(metadata["attempt_id"])
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
            if name == "central_questions":
                listing = c.read(folder / "reference" / "central-questions.json")
                start, limit = args.get("offset", 0), args.get("limit", 20)
                result = {**listing, "offset": start, "rows": listing["rows"][start:start + limit]}
            elif name == "list_files":
                root = resolve_tool_path(folder, args["path"], directory=True)
                paths = []
                for path in sorted(root.rglob("*")):
                    if path.is_symlink():
                        raise ValueError("workspace contains a symlink")
                    if path.is_file():
                        paths.append(args["path"].rstrip("/") + "/" + path.relative_to(root).as_posix())
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
    except (ValueError, OSError, KeyError, TypeError, jsonschema.ValidationError) as error:
        result = {"error": str(error)[:1000]}
    c.save(receipt, {"at": c.now(), "call": call, "result": result})
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
               "edit_history": events,
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


def finish_turn(quarantine, folder, manifest, state, settings, aid):
    attempt = quarantine / "attempts" / aid
    request = c.read(attempt / "request.json")
    profile = request["profile"]
    raw = c.read(attempt / "response.json")
    assistant, calls = providers.agent_turn(profile, raw)
    metadata = {"attempt_id": aid, "at": c.read(attempt / "received.json")["at"],
                "actor": c.actor(profile, raw), "prompt_sha256": request["prompt_sha256"],
                "response_sha256": c.digest(raw), "response_id": raw.get("id"),
                "usage": raw.get("usage", {}), "offline": profile["protocol"] == "offline"}
    results = [(call["id"], execute_tool(folder, manifest, call, metadata, i)) for i, call in enumerate(calls)]
    # The persisted state still precedes this turn until all tool receipts exist.
    state["messages"].append(assistant)
    if calls:
        state["messages"].extend(providers.tool_messages(profile, results))
        state["status"] = "active"
    else:
        state["status"] = "complete"
    state["last_note"] = assistant.get("content")
    if not (attempt / "outcome.json").exists():
        c.save(attempt / "outcome.json", {"outcome": state["status"], "workspace": manifest["id"],
               "metadata": metadata, "tool_errors": [v for _, v in results if "error" in v]})
    state["pending"] = None
    state_save(folder, state)
    return results


def recover(quarantine, folder, manifest, state, settings):
    aid = state.get("pending")
    if not aid:
        return
    attempt = quarantine / "attempts" / aid
    if (attempt / "response.json").exists():
        if not (attempt / "received.json").exists():
            c.save(attempt / "received.json", {"at": c.now(), "recovered": True})
        finish_turn(quarantine, folder, manifest, state, settings, aid)
    else:
        if not (attempt / "outcome.json").exists():
            c.save(attempt / "outcome.json", {"outcome": "interrupted", "at": c.now(),
                "note": "Request outcome unknown. Not replayed; previously saved files retained."})
        state.update(pending=None, messages=[], last_note="An earlier request was interrupted. Inspect saved files and progress notes before continuing.")
        state_save(folder, state)


def run(quarantine, settings, snapshot, source, *, workspace=None, prepare_only=False):
    if not prepare_only and settings["discovery"]["protocol"] != "offline" and not settings.get("live_api", False):
        raise ValueError("live API calls are disabled in config")
    ranked = c.plan(snapshot, settings)
    existing = [c.read(p) for p in (quarantine / "workspaces").glob("*/workspace.json")]
    counts = Counter(m["attempt_key"] for m in existing)
    pending = []
    if workspace:
        pending = [load(quarantine, workspace)]
    else:
        for manifest in sorted(existing, key=lambda m: m["created_at"]):
            folder = quarantine / "workspaces" / manifest["id"]
            if (c.read(folder / "state.json")["status"] != "complete"
                    and manifest["source"]["repository"] == source["repository"]
                    and manifest["task"]["topic"] in settings["topics"]):
                pending.append((folder, manifest))
    tasks = [task for task in ranked if counts[c.attempt_key(task, settings["discovery"], settings["limits"])]
             < settings["limits"]["attempts_per_question"]]
    result = {"requests": 0, "workspaces": [], "checkpoints": [], "errors": []}
    while result["requests"] < settings["limits"]["requests_per_run"]:
        if pending:
            folder, manifest = pending.pop(0)
        elif tasks and not workspace:
            folder, manifest = create(quarantine, settings, snapshot, source, tasks.pop(0), ranked)
        else:
            break
        wid = manifest["id"]
        result["workspaces"].append(wid)
        if prepare_only:
            result["files"] = str(folder / "files")
            result["instructions"] = str(folder / "INSTRUCTIONS.md")
            break
        state = c.read(folder / "state.json")
        try:
            recover(quarantine, folder, manifest, state, settings)
            if state["status"] == "complete" and not workspace:
                continue
            profile = settings["discovery"]
            if state.get("profile") != c.actor(profile) or (workspace and state["status"] == "complete"):
                state.update(messages=[], profile=c.actor(profile))
            state["status"] = "active"
            while result["requests"] < settings["limits"]["requests_per_run"]:
                initial = {"role": "user", "content": initial_prompt(folder, manifest, settings)}
                if not state["messages"]:
                    state["messages"] = [initial, {"role": "user", "content": "Continue from saved files and work/notes/progress.md. " + str(state.get("last_note", ""))[:2000]}]
                body = providers.prepare_agent(profile, prompts.DISCOVER, state["messages"], settings["limits"]["max_output_tokens"], FUNCTIONS)
                if len(json.dumps(body, ensure_ascii=False)) > settings["limits"]["max_prompt_chars"]:
                    # Files and the immutable transcript carry long-term memory.
                    state["messages"] = [initial, {"role": "user", "content":
                        "Conversation compacted; your saved files are intact. Read work/notes/progress.md and resume. Last response: " + str(state.get("last_note", ""))[:2000]}]
                    body = providers.prepare_agent(profile, prompts.DISCOVER, state["messages"], settings["limits"]["max_output_tokens"], FUNCTIONS)
                aid = c.uid("attempt")
                attempt = quarantine / "attempts" / aid
                c.save(attempt / "request.json", {"id": aid, "phase": "workspace-discovery", "started_at": c.now(),
                    "workspace": wid, "source": manifest["source"], "task": manifest["task"], "actor": c.actor(profile),
                    "profile": profile, "body": body, "prompt_sha256": c.digest(body), "prompt_version": prompts.VERSION,
                    "runner_sha256": c.digest({p.name: p.read_text() for p in Path(__file__).parent.glob("*.py")}),
                    "engine_sha256": hashlib.sha256((c.ROOT / "scripts/pmap.py").read_bytes()).hexdigest()})
                state["pending"] = aid
                state_save(folder, state)
                result["requests"] += 1
                if len(json.dumps(body, ensure_ascii=False)) > settings["limits"]["max_prompt_chars"]:
                    raise ValueError("initial workspace prompt exceeds max_prompt_chars")
                raw = providers.complete(profile, body, enabled=settings.get("live_api", False), timeout=settings["limits"]["timeout_seconds"])
                c.save(attempt / "response.json", raw)
                c.save(attempt / "received.json", {"at": c.now()})
                values = finish_turn(quarantine, folder, manifest, state, settings, aid)
                result["errors"].extend({"workspace": wid, "attempt": aid, **v} for _, v in values if "error" in v)
                if state["status"] == "complete":
                    break
        except (ValueError, OSError, KeyError, TypeError, IndexError) as error:
            aid = state.get("pending")
            if aid and not (quarantine / "attempts" / aid / "outcome.json").exists():
                c.save(quarantine / "attempts" / aid / "outcome.json", {"outcome": "error", "at": c.now(), "error": type(error).__name__})
            state.update(pending=None, status="paused", messages=[], last_note="Previous turn failed; saved files are intact. Resume by inspecting progress notes.")
            state_save(folder, state)
            result["errors"].append({"workspace": wid, "error": str(error)})
            break
        finally:
            result["checkpoints"].append(checkpoint(quarantine, wid, reason="run-stopped"))
        if workspace:
            break
    return result
