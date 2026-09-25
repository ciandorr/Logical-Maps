"""Read-only adapters to the installed pmap engine for an active workspace.

Only data is loaded from the workspace. Neither fetched nor proposed Python is
executed. Reports describe consequences of records, not verification of proofs.
"""
from contextlib import redirect_stdout
import hashlib
import io
from pathlib import Path
import sys

from . import core as c


def inputs(folder, manifest, scope, topic):
    from . import workspaces as w
    w.ensure_active(folder)
    c.slug(topic)
    root = folder / ("files" if scope == "work" else "reference/source")
    base = w.safe_path(root, f"logical-maps/topics/{topic}", directory=True)
    if not (base / "topic.yaml").is_file():
        raise ValueError("topic is not present in this workspace")
    # Check directories and all descendants before pmap's loader follows paths.
    contents = w.tree(base)
    hashes = {name: w.file_hash(text) for name, text in contents.items()}
    prefix = f"logical-maps/topics/{topic}/"
    original = {name[len(prefix):]: value for name, value in manifest["baseline"].items()
                if name.startswith(prefix)}
    changed = sorted(name for name in hashes.keys() | original.keys()
                     if hashes.get(name) != original.get(name))
    if scope == "reference" and changed:
        raise ValueError("pinned reference files were changed")
    provenance = {"scope": scope, "topic": topic, "source": manifest["source"],
                  "inputs_sha256": c.digest(hashes), "input_files": hashes,
                  "changed_from_published": changed,
                  "engine_sha256": hashlib.sha256((c.ROOT / "scripts/pmap.py").read_bytes()).hexdigest(),
                  "adapter_sha256": hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
                  "schema_sha256": c.digest({p.name: p.read_text() for p in sorted((c.ROOT / "schema").glob("*.json"))}),
                  "trust": "conditional-on-workspace-proposals" if changed else "published-records",
                  "verification": "Computed consequences only; no proof, source or Lean verification."}
    return root / "logical-maps", provenance


def validated(root, topic):
    stream = io.StringIO()
    with c.database(root), redirect_stdout(stream):
        try:
            valid = c.pmap.validate_topic(topic)
            data = c.pmap.load_topic(topic) if valid else None
        except (ValueError, TypeError, KeyError, AttributeError, c.yaml.YAMLError) as error:
            valid, data = False, None
            print(f"Invalid draft data: {error}")
    return data, {"valid": valid, "diagnostics": stream.getvalue()}


def assumptions(data, manifest, args):
    topic = data["topic"]["id"]
    background = args.get("background", (manifest["task"]["background"] or "base")
                          if topic == manifest["task"]["topic"] else "base")
    extra = []
    if background != "base":
        presets = {p["id"]: p["principles"] for p in data["topic"].get("background_presets", [])}
        if background not in presets:
            raise ValueError("unknown background preset; use base or an id in topic.yaml")
        extra = presets[background]
    return background, list(dict.fromkeys([*data["topic"].get("background", []), *extra]))


def report(folder, manifest, operation, args):
    from . import workspaces as w
    topic = args.get("topic", manifest["task"]["topic"])
    scope = args.get("scope", "work")
    root, provenance = inputs(folder, manifest, scope, topic)
    # Immutable, content-addressed results also avoid recomputing paginated lists.
    request = {k: v for k, v in args.items() if k not in ("offset", "limit")}
    key = c.digest([operation, request, provenance])
    path = w.safe_path(folder / "derived", key + ".json")
    if path.exists():
        return c.read(path), "derived/" + path.name
    data, validation = validated(root, topic)
    result = {"operation": operation, "at": c.now(), "provenance": provenance, **validation}
    if operation != "validate_workspace" and not validation["valid"]:
        result["error"] = "Repair invalid draft YAML before inference; see diagnostics. Published reference remains queryable."
    elif operation != "validate_workspace":
        background, fixed = assumptions(data, manifest, args)
        result.update(background=background, assumptions=fixed)
        if operation == "recompute_central_questions":
            engine = c.pmap.Lynchpins(data, fixed)
            ranked = engine.rank(top=sys.maxsize)
            rows = ranked["rows"] + [r for r in ranked["recorded"] if r.get("status") == "outside"
                    and engine.E.resolve_conjecture(r)["status"] == "open"]
            result["rows"] = [{"id": c.question_key(topic, fixed, row), **row} for row in rows]
            result["total_open"] = len(rows)
        else:
            ids = sorted(p["id"] for p in data["principles"])
            premises = sorted(set(fixed + args.get("premises", [])))
            conclusions = args.get("conclusions", ids)
            unknown = (set(premises) | set(conclusions)) - set(ids) - {c.pmap.FALSE}
            if unknown or c.pmap.FALSE in premises:
                raise ValueError("unknown or invalid principle ids: " + ", ".join(sorted(unknown or {c.pmap.FALSE})))
            rules = [r for r in data["results"] if r["status"] == "proved"]
            models = [m for m in data["models"] if m["status"] == "proved"]
            # Optional assumptions belong in P, never granted to every model.
            engine = c.pmap.Engine(ids, rules, models, data["topic"].get("background", []))
            result.update(premises=premises, conflict=engine.conflict(premises), rows=[])
            for conclusion in conclusions:
                verdict = engine.resolve_conjecture({"premises": premises, "conclusion": conclusion})
                verdict["exclusion"] = engine.excludes(premises, conclusion) if conclusion != c.pmap.FALSE else None
                result["rows"].append({"conclusion": conclusion, **verdict})
            result["total"] = len(result["rows"])
    c.save(path, result)
    return result, "derived/" + path.name


def execute(folder, manifest, operation, args):
    value, path = report(folder, manifest, operation, args)
    start, limit = args.get("offset", 0), args.get("limit", 20)
    result = {k: v for k, v in value.items() if k not in ("rows", "provenance", "diagnostics")}
    result.update(report=path, provenance={k: v for k, v in value["provenance"].items()
                  if k not in ("input_files", "changed_from_published")},
                  changed_files=len(value["provenance"]["changed_from_published"]))
    if "rows" in value:
        result.update(offset=start, rows=value["rows"][start:start + limit],
                      total=len(value["rows"]), omitted=max(0, len(value["rows"]) - start - limit))
    if operation == "validate_workspace" or not value["valid"]:
        result.update(diagnostics=value["diagnostics"][:8000], diagnostics_chars=len(value["diagnostics"]))
    return result
