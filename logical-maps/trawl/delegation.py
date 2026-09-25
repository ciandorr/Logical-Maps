"""Durable model-directed tasks and immutable, explicitly handed-off proposals.

The coordinator executes these jobs using the same run budget. Discovery can
inspect its own declared jobs and completed handoffs, never another workspace
or its conversation. A child starts from the pinned source, not shared files.
"""
from __future__ import annotations

from copy import deepcopy
import hashlib
import json
import os
from pathlib import Path, PurePosixPath
import shutil
import tempfile

import jsonschema

from . import core as c


def schema(properties, required=()):
    return {"type": "object", "properties": properties, "required": list(required),
            "additionalProperties": False}


STRING = {"type": "string", "minLength": 1}
FUNCTIONS = [
    {"name": "spawn_subagent",
     "description": "Delegate an independent mathematical task to another model agent. "
         "It runs in parallel as capacity allows, can delegate further, and shares this run's "
         "request/token budget. Give a concrete task and any needed context: it starts with "
         "fresh copies of the pinned published source, without your edits or conversation. "
         "Optionally select another question_id from this topic's central question queue. "
         "Completed, unreviewed proposals arrive in read-only reference/subagents/; inspect "
         "and integrate useful files yourself, preserving their provenance.",
     "parameters": schema({"task": STRING, "context": {"type": "string"},
                           "question_id": STRING}, ("task",))},
    {"name": "subagent_status",
     "description": "Inspect only your own delegated tasks and available handoffs. "
         "Pending includes queued and running work. Use wait_for_subagents when you have "
         "no independent work; repeated status requests consume API calls.",
     "parameters": schema({"subagent_id": STRING})},
    {"name": "wait_for_subagents",
     "description": "Pause your API calls until your currently delegated tasks finish or the run's "
         "budget ends. The coordinator continues the other agents without paid polling. "
         "Save your current work first. Completed handoffs remain unreviewed proposals.",
     "parameters": schema({})},
]
SCHEMAS = {tool["name"]: tool["parameters"] for tool in FUNCTIONS}


def _path(folder, relative, *, directory=False):
    # Lazy import avoids a cycle when workspaces registers these tools.
    from .workspaces import safe_path
    return safe_path(folder, relative, directory=directory)


def _active(folder):
    from .workspaces import ensure_active
    ensure_active(folder)


def _job_path(folder, agent_id, filename):
    return _path(folder, "delegations/" + c.slug(agent_id) + "/" + filename)


def jobs(folder):
    """Read immutable declarations from this workspace only, in creation order."""
    root = _path(folder, "delegations", directory=True)
    if not root.exists():
        return []
    values = []
    for path in root.glob("*/task.json"):
        path = _path(folder, path.relative_to(folder).as_posix())
        job = c.read(path)
        if (job["id"] != path.parent.name or job["parent_workspace"] != folder.name
                or not job["child_workspace"].startswith("workspace-")):
            raise ValueError("subagent job identity mismatch")
        c.slug(job["id"])
        c.slug(job["child_workspace"])
        c.slug(job["family_id"])
        values.append(job)
    return sorted(values, key=lambda value: (value["created_at"], value["id"]))


def outstanding(folder):
    return any(not _job_path(folder, job["id"], "result.json").exists()
               for job in jobs(folder))


def _status(folder, agent_id=None):
    declared = jobs(folder)
    if agent_id is not None:
        c.slug(agent_id)
        declared = [job for job in declared if job["id"] == agent_id]
        if not declared:
            raise ValueError("unknown subagent; only your own declared tasks are accessible")
    result = []
    for job in declared:
        receipt = _job_path(folder, job["id"], "result.json")
        entry = {"subagent_id": job["id"], "task": job["brief"]["task"],
                 "question_id": job["task"]["id"], "status": "pending"}
        if receipt.exists():
            entry.update(status="complete", result=c.read(receipt))
        result.append(entry)
    return {"subagents": result, "pending": sum(item["status"] == "pending" for item in result),
            "verification": "unreviewed"}


def handle(folder, manifest, name, args, metadata, index):
    """Execute only delegation tools; workspace turn receipts wrap this handler."""
    _active(folder)
    if manifest["id"] != folder.name:
        raise ValueError("workspace identity mismatch")
    if name not in SCHEMAS:
        raise ValueError("unknown subagent tool")
    jsonschema.validate(args, SCHEMAS[name])
    if name == "subagent_status":
        return _status(folder, args.get("subagent_id"))
    if name == "wait_for_subagents":
        return {"wait_for_subagents": True, **_status(folder)}

    if not args["task"].strip():
        raise ValueError("subagent task must describe concrete work")
    c.slug(metadata["trawl_id"])
    if type(index) is not int or index < 0:
        raise ValueError("invalid subagent tool index")
    task = manifest["task"]
    if "question_id" in args:
        ranked = c.read(_path(folder, "reference/queue.json"))
        task = next((row for row in ranked if row["id"] == args["question_id"]
                     and row["topic"] == manifest["task"]["topic"]), None)
        if task is None:
            raise ValueError("question_id must be in this topic's pinned central question queue")
    identity = c.digest([manifest["id"], metadata["trawl_id"], index])[:32]
    aid = "subagent-" + identity
    brief = {"task": args["task"], "context": args.get("context", "")}
    family = manifest.get("family_id", manifest.get("delegation", {}).get("family_id", manifest["id"]))
    job = {"version": 1, "id": aid, "parent_workspace": manifest["id"],
           "child_workspace": "workspace-" + identity, "family_id": c.slug(family),
           "created_at": metadata["at"], "source": deepcopy(manifest["source"]),
           "actor": deepcopy(metadata["actor"]),
           "discovery": deepcopy({key: value for key, value in metadata.items()
                                  if key != "requests_per_run"}),
           "brief": brief, "task": deepcopy(task), "verification": "unreviewed"}
    path = _job_path(folder, aid, "task.json")
    if path.exists():
        if c.read(path) != job:
            raise ValueError("saved subagent intent differs from the replayed request")
    else:
        # This is a finite request-based ceiling, not a user-configured worker count.
        # The coordinator enforces the shared ceiling across all descendants.
        limit = metadata.get("requests_per_run")
        if type(limit) is int and limit > 0 and len(jobs(folder)) >= limit:
            raise ValueError("subagent declarations already reach this run's request ceiling")
        c.save(path, job)
    return {"subagent_id": aid, "status": "pending", "question_id": task["id"],
            "verification": "unreviewed", "shared_budget": True,
            "handoff": "reference/subagents/" + aid + "/"}


def _frozen_candidate(quarantine, checkpoint):
    if isinstance(checkpoint, str):
        cid, expected = checkpoint, None
    else:
        cid = checkpoint.get("checkpoint", checkpoint.get("id"))
        expected = checkpoint.get("candidate_sha256")
    candidate = c.read(_path(quarantine, "candidates/" + c.slug(cid) + ".json"))
    if candidate["id"] != cid or c.digest(candidate["content"]) != candidate["content_sha256"]:
        raise ValueError("subagent checkpoint content hash mismatch")
    if expected is not None and expected != c.digest(candidate):
        raise ValueError("subagent checkpoint hash mismatch")
    return candidate


def _texts(candidate, job, child):
    """Construct a handoff solely from the immutable checkpoint and identities."""
    content = candidate["content"]
    files, changes = {}, []
    for change in content["changes"]:
        name = change["path"]
        # Validate even deletions; they have no bytes to copy but are proposals too.
        if (not isinstance(name, str) or not name or "\\" in name or "\x00" in name
                or PurePosixPath(name).is_absolute() or name == "."
                or name != PurePosixPath(name).as_posix()
                or any(part.casefold() in ("..", ".git") for part in PurePosixPath(name).parts)):
            raise ValueError("subagent checkpoint requires relative file paths")
        if name in files or any(item["path"] == name for item in changes):
            raise ValueError("duplicate path in subagent checkpoint")
        for side in ("before", "after"):
            text = change[side]
            if text is not None and not isinstance(text, str):
                raise ValueError("subagent checkpoint file content must be UTF-8 text")
            actual = None if text is None else hashlib.sha256(text.encode("utf-8")).hexdigest()
            if actual != change[side + "_sha256"]:
                raise ValueError("subagent checkpoint file hash mismatch")
        if change["after"] is not None:
            files[name] = change["after"]
        changes.append({"path": name, "before_sha256": change["before_sha256"],
                        "after_sha256": change["after_sha256"],
                        "operation": "delete" if change["after"] is None else
                                     "add" if change["before"] is None else "change"})

    actors = {}
    for event in content.get("edit_history", []):
        actor = event.get("discovery", {}).get("actor")
        if actor:
            actors[c.digest(actor)] = actor
    for actor in content.get("observed_actors", []):
        actors[c.digest(actor)] = actor
    checkpoint_info = {"id": candidate["id"], "sha256": c.digest(candidate),
                       "content_sha256": candidate["content_sha256"]}
    manifest = {"version": 1, "subagent_id": job["id"],
                "parent_workspace": job["parent_workspace"],
                "child_workspace": job["child_workspace"], "family_id": job["family_id"],
                "verification": "unreviewed", "source": candidate["source"],
                "task": candidate["task"], "brief": job["brief"],
                "requested_by": job["discovery"], "configured_actor": child["actor"],
                "observed_actors": list(actors.values()), "checkpoint": checkpoint_info,
                "changes": changes,
                "edit_provenance": content.get("edit_history", []),
                "subagent_handoffs": content.get("subagents", [])}
    summary = content.get("summary") or "No final summary was saved. Inspect the changed files."
    if not isinstance(summary, str):
        raise ValueError("subagent checkpoint summary must be text")
    summary = "# Unreviewed subagent proposal\n\n" + summary + "\n\n" + (
        "These files are proposals. A completed agent run is not mathematical verification. "
        "The manifest preserves the source, checkpoint and model provenance.\n")
    texts = {"files/" + name: text for name, text in files.items()}
    texts["manifest.json"] = json.dumps(manifest, ensure_ascii=False, indent=2) + "\n"
    texts["summary.md"] = summary
    return texts, manifest


def _existing_matches(destination, texts):
    from .workspaces import tree
    if tree(destination) != texts:
        raise ValueError("existing subagent handoff differs from its frozen checkpoint")


def deliver(quarantine, parent_folder, job, child_folder, checkpoint):
    """Publish a frozen handoff atomically; replay never overwrites an earlier one."""
    _active(parent_folder)
    saved = c.read(_job_path(parent_folder, job["id"], "task.json"))
    if saved != job or job["parent_workspace"] != parent_folder.name:
        raise ValueError("subagent delivery does not match the declared job")
    child = c.read(_path(child_folder, "workspace.json"))
    if child_folder.name != job["child_workspace"] or child["id"] != job["child_workspace"]:
        raise ValueError("subagent child identity mismatch")
    if not _path(child_folder, "SEALED.json").exists():
        raise ValueError("only completed, sealed subagents may hand off results")
    candidate = _frozen_candidate(quarantine, checkpoint)
    if (candidate["content"].get("kind") != "workspace"
            or candidate["content"].get("workspace_id") != job["child_workspace"]
            or candidate["source"] != job["source"] or child["source"] != job["source"]
            or candidate["task"] != job["task"]):
        raise ValueError("subagent checkpoint is for another workspace, source or question")
    texts, manifest = _texts(candidate, job, child)
    destination = _path(parent_folder, "reference/subagents/" + job["id"], directory=True)
    if destination.exists():
        _existing_matches(destination, texts)
    else:
        destination.parent.mkdir(parents=True, exist_ok=True)
        # Staging is outside reference/, so discovery cannot read a partial handoff.
        staging = Path(tempfile.mkdtemp(prefix=".handoff-", dir=_job_path(parent_folder, job["id"], "task.json").parent))
        try:
            for name, text in texts.items():
                c.save_text(_path(staging, name), text)
            os.rename(staging, destination)
            directory_fd = os.open(destination.parent, os.O_RDONLY)
            try:
                os.fsync(directory_fd)
            finally:
                os.close(directory_fd)
        finally:
            if staging.exists():
                shutil.rmtree(staging)
    result = {"version": 1, "subagent_id": job["id"], "status": "complete",
              "verification": "unreviewed", "parent_workspace": job["parent_workspace"],
              "child_workspace": job["child_workspace"], "family_id": job["family_id"],
              "source": job["source"], "checkpoint": manifest["checkpoint"],
              "handoff": "reference/subagents/" + job["id"] + "/",
              "handoff_sha256": c.digest(texts), "changed_files": len(manifest["changes"]),
              "requested_by": job["actor"], "configured_actor": child["actor"],
              "observed_actors": manifest["observed_actors"]}
    receipt = _job_path(parent_folder, job["id"], "result.json")
    if receipt.exists():
        existing = c.read(receipt)
        if {key: value for key, value in existing.items() if key != "delivered_at"} != result:
            raise ValueError("subagent result receipt differs from the completed handoff")
        return existing
    result["delivered_at"] = c.now()
    c.save(receipt, result)
    return result
