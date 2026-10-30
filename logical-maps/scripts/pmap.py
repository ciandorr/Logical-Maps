#!/usr/bin/env python3
"""pmap — Logical Maps tooling.

Subcommands
  validate [TOPIC ...]      schema + reference + consistency checks
  build    [TOPIC ...]      write build/<topic>/ (viewer, data.json, source.zip, AI bundle, write-ups)
  lean     [TOPIC ...]      regenerate the Lean statements from the records
  lean-check [TOPIC ...]    build the Lean library and verify every lean: claim
  bundle   [TOPIC ...]      write build/<topic>/<topic>-map.zip only: a self-contained
                            working copy (MAP.md, OPEN-QUESTIONS.md, README, records, tooling)
  status   [TOPIC ...]      print a text summary (counts, open pairs, redundancies)
  lynchpins [TOPIC ...]     rank open questions by what each answer would settle
  history  [TOPIC ...]      add the days of the published branch's history to the settled-count ledger
  new-topic TOPIC           scaffold topics/TOPIC/
  new-principle TOPIC ID    scaffold a principle file
  new-result TOPIC ID       scaffold an implication file
  new-model TOPIC ID        scaffold a model (countermodel) file
  starter                  package the reusable Logical Maps starter ZIP
  selftest                  run the derivation engine's unit tests

All commands run from anywhere; paths are resolved relative to the repo root
(the directory containing this scripts/ folder).
"""
from __future__ import annotations

import argparse
import datetime as _dt
import json
import sys
import urllib.parse
from pathlib import Path

try:
    import yaml
    import jsonschema
except ImportError:  # pragma: no cover
    sys.exit("pmap needs pyyaml and jsonschema:  pip install -r requirements.txt")

ROOT = Path(__file__).resolve().parent.parent
TOPICS = ROOT / "topics"
SCHEMA = ROOT / "schema"
BUILD = ROOT / "build"
TEMPLATE = ROOT / "viewer" / "template.html"
FALSE = "false"  # Logical constant, never an ordinary principle or premise.


# ----------------------------------------------------------------------------
# Loading
# ----------------------------------------------------------------------------

def _normalise(obj):
    """YAML turns bare dates into date objects; keep them as ISO strings."""
    if isinstance(obj, dict):
        return {k: _normalise(v) for k, v in obj.items()}
    if isinstance(obj, list):
        return [_normalise(v) for v in obj]
    if isinstance(obj, (_dt.date, _dt.datetime)):
        return obj.isoformat()
    return obj


def _load_yaml(path: Path):
    with path.open(encoding="utf-8") as fh:
        return _normalise(yaml.safe_load(fh) or {})


def _schema(name: str):
    sch = json.loads((SCHEMA / f"{name}.schema.json").read_text(encoding="utf-8"))
    if name == "model":  # inline the certificate definition shared with results
        sch["properties"]["certificate"] = _schema("result")["properties"]["certificate"]
    if name == "group":  # a shared argument is an argument with conditions of application, and an author and date of its own
        model = _schema("model")
        shared = json.loads(json.dumps(model["$defs"]["argument"]))
        for key in ("provenance", "companion_id"):
            shared["properties"].pop(key, None)
        shared["properties"].update(sch["$defs"]["applies"]["properties"])
        shared["required"] = ["id", "by", "date"]
        sch["$defs"]["shared_argument"] = shared
        sch["$defs"]["withdrawal"] = model["$defs"]["withdrawal"]
        sch["properties"]["references"] = model["properties"]["references"]
    if name == "general-argument":  # an argument of the topic's, applied to every record meeting its conditions
        model = _schema("model")
        arg = json.loads(json.dumps(model["$defs"]["argument"]))
        for key in ("provenance", "companion_id", "when"):
            arg["properties"].pop(key, None)
        arg["properties"].update(sch["properties"])
        sch = {**sch, **{k: v for k, v in arg.items() if k != "properties"}, "properties": arg["properties"]}
        sch["required"] = ["id", "requires", "by", "date"]
        sch["$defs"] = {"withdrawal": model["$defs"]["withdrawal"]}
    if name == "provenance":  # and the certificate and references a folded record had
        sch["properties"]["certificate"] = _schema("result")["properties"]["certificate"]
        sch["properties"]["references"] = _schema("model")["properties"]["references"]
    return sch


def list_topics() -> list[str]:
    return sorted(p.name for p in TOPICS.iterdir() if (p / "topic.yaml").exists())


def name_sort_key(s: str) -> tuple:
    """Alphabetical by name, a leading run of symbols (□, ◇ …) counting after the bare
    name: □Actuality right after Actuality, before Actuality (type t). The viewer's
    compareNames orders the same way."""
    m = _re.match(r"^[^\w]+", s)
    prefix = m.group() if m else ""
    rest = s[len(prefix):]
    return (rest.casefold(), rest, prefix)


def load_topic(topic_id: str) -> dict:
    """Load a topic directory into a plain dict. Does not validate."""
    tdir = TOPICS / topic_id
    if not (tdir / "topic.yaml").exists():
        sys.exit(f"no such topic: {topic_id} (expected {tdir / 'topic.yaml'})")
    topic = _load_yaml(tdir / "topic.yaml")
    principles, results = [], []
    groups = []
    for p in sorted((tdir / "groups").glob("*.yaml")):
        d = _load_yaml(p)
        d["_file"] = str(p.relative_to(ROOT))
        groups.append(d)
    groups_by_id = {g.get("id"): g for g in groups}
    # The topic's conditions and general arguments: arguments any record meeting their conditions gets.
    cond_file = _load_yaml(tdir / "conditions.yaml") if (tdir / "conditions.yaml").exists() else {}
    conditions = [c for c in (cond_file.get("conditions") or []) if isinstance(c, dict)] if isinstance(cond_file, dict) else []
    general = []
    for p in sorted((tdir / "arguments").glob("*.yaml")):
        d = _load_yaml(p)
        d["_file"] = str(p.relative_to(ROOT))
        general.append(d)
    library = {"conditions": {c.get("id"): c for c in conditions}, "arguments": general}
    for p in sorted((tdir / "principles").glob("*.yaml")):
        d = _load_yaml(p)
        d["_file"] = str(p.relative_to(ROOT))
        principles.append(d)
    models, sources, retired = [], [], []
    for sub, lst in (("results", results), ("models", models)):
        for p in sorted((tdir / sub).glob("*.yaml")):
            d = _load_yaml(p)
            d["_file"] = str(p.relative_to(ROOT))
            if sub == "results" and d.get("conclusion") is False:
                d["conclusion"] = FALSE
            if sub == "models" and is_argument_record(d):
                d.setdefault("certificate", {}).setdefault("lean", "none")
                full = expand_member(d, groups_by_id, library=library)  # its group's definition and arguments, and the general ones
                if full is not d:
                    full["_raw"] = d  # its own arguments that apply only at other settings are checked from here
                sources.append(full)
                flat = flatten_model(full, raw=d)
                lst += flat
                group = groups_by_id.get(d.get("group"))
                for vs in member_variants(d, group) if flat and isinstance(group, dict) else []:
                    suffix, tag = variant_label(group, d, vs)
                    v = expand_member(d, groups_by_id, vs, library)
                    v.update(id=f"{d['id']}-{suffix}", name=f"{d.get('name', d['id'])} [{tag}]", variant_of=d["id"])
                    v.pop("lean", None)  # the member's Lean model is not the variant's
                    lst += flatten_model(v, raw=d)
                if not flat:  # a withdrawn construction: kept, and validated, but out of the engine
                    retired.append({**full, "_source": d})
                continue
            d.setdefault("status", "conjectured")
            d.setdefault("certificate", {}).setdefault("lean", "none")
            lst.append(d)
    # A generated companion takes the place a file with its id would have.
    models.sort(key=lambda m: str(m.get("id")) + ".yaml" if m.get("_companion_of") else Path(m["_file"]).name)
    provenance = []
    for p in sorted((tdir / "provenance").glob("*.yaml")):
        d = _load_yaml(p)
        d["_file"] = str(p.relative_to(ROOT))
        provenance.append(d)
    papers = _load_yaml(tdir / "papers.yaml") if (tdir / "papers.yaml").exists() else {"papers": []}
    return {"topic": topic, "principles": principles, "results": results, "models": models, "paper_catalogue": papers, "papers": papers.get("papers", []) if isinstance(papers, dict) else [],
            "model_sources": sources, "retired_models": retired, "provenance": provenance, "groups": groups,
            "conditions": conditions, "general_arguments": general, "conditions_file": str((tdir / "conditions.yaml").relative_to(ROOT)),
            "background": load_background(tdir, topic)}


# ----------------------------------------------------------------------------
# Background pages
# ----------------------------------------------------------------------------
#
# A topic's Background is a series of pages, `background/<page>.md`, in the order its
# `topic.yaml` lists under `background_pages`; each page opens with `# Title`. A topic with a
# single `background.md` instead has one page, `background`. A page may contain items, the
# definitions and lemmas that results draw on, as blocks:
#
#     ::: lemma {#weakly-rigid-persistent}
#     title: Weakly rigid relations are persistent
#     lean: Classicism.persistent_of_weaklyRigid
#     credit: Chris Sun, 26 September 2026
#     sources: Dorr, Boolean Completeness does not imply Rigid Comprehension, p. 12
#     ---
#     Statement, then *Proof.* ...
#     :::
#
# The header before `---` is optional; its keys are BACKGROUND_ITEM_KEYS, and `lean` and
# `sources` take a string or a list. An item's id, and a page's, share the namespace of the
# topic's records, so `[[id]]` in any prose links to it. Anywhere in a page's prose,
# `{lean: A, B, C}` cites Lean declarations without an item of their own: "≤ is a partial
# order {lean: le_refl, le_trans, le_antisymm}" becomes one link to all three.

import re as _re

BACKGROUND_KINDS = ("definition", "lemma", "proposition", "theorem", "corollary", "fact", "remark")
BACKGROUND_ITEM_KEYS = ("title", "lean", "credit", "sources")
BACKGROUND_BLOCK = _re.compile(r"^:::[ \t]*(?P<kind>[a-z]+)[ \t]*\{#(?P<id>[^}\s]*)\}[ \t]*\n(?P<content>.*?)^:::[ \t]*$",
                               _re.M | _re.S)
_BACKGROUND_HEADER = _re.compile(r"\A(?P<header>(?:[a-z_]+:.*\n(?:[ \t]+.*\n)*)+)---[ \t]*\n")


def load_background(tdir: Path, topic: dict) -> dict:
    """The topic's Background: {"pages": [...], "items": [...], "errors": [...]}, unvalidated beyond
    what parsing needs. A page is {id, title, md, file}, its md the page with its items in place; an
    item is {id, kind, page, title, lean, credit, sources, body, file}."""
    pages, items, errors = [], [], []
    folder, single = tdir / "background", tdir / "background.md"
    if folder.is_dir():
        order = topic.get("background_pages") or []
        files = {p.stem: p for p in folder.glob("*.md")}
        for pid in order:
            if pid not in files:
                errors.append(f"topic.yaml: background page '{pid}' has no file background/{pid}.md")
        for stem in sorted(set(files) - set(order)):
            errors.append(f"background/{stem}.md: not listed in topic.yaml background_pages")
        sources = [(pid, files[pid]) for pid in order if pid in files]
        if single.exists():
            errors.append(f"{single.name}: a topic with background/ has no background.md")
    else:
        sources = [("background", single)] if single.exists() else []
    listed = lambda v: [v] if isinstance(v, str) else v if isinstance(v, list) else []
    for pid, path in sources:
        text = path.read_text(encoding="utf-8")
        rel = str(path.relative_to(ROOT) if path.is_relative_to(ROOT) else path)
        first, _, rest = text.partition("\n")
        if not folder.is_dir():   # its own H1, if any, is the topic's title, which the page does not repeat
            title, body = "Background", (rest if first.startswith("# ") else text)
        elif first.startswith("# "):
            title, body = first[2:].strip(), rest
        else:
            errors.append(f"{rel}: a background page opens with '# Title'")
            title, body = pid, text
        for m in BACKGROUND_BLOCK.finditer(body):
            content, header = m["content"], {}
            h = _BACKGROUND_HEADER.match(content)
            if h:
                try:
                    header = _normalise(yaml.safe_load(h["header"]) or {})
                    if isinstance(header, dict):  # `title: 4` is the title "4"
                        header = {k: str(v) if isinstance(v, (int, float)) and not isinstance(v, bool) else v for k, v in header.items()}
                except yaml.YAMLError as exc:
                    errors.append(f"{rel}: item {m['id']}: unreadable header ({exc})")
                content = content[h.end():]
            items.append({"id": m["id"], "kind": m["kind"], "page": pid, "file": rel,
                          "title": header.get("title", "") if isinstance(header, dict) else "",
                          "lean": listed(header.get("lean")) if isinstance(header, dict) else [],
                          "credit": header.get("credit", "") if isinstance(header, dict) else "",
                          "sources": listed(header.get("sources")) if isinstance(header, dict) else [],
                          "body": content.strip(), "_header": header})
        pages.append({"id": pid, "title": title, "md": body.strip(), "file": rel,
                      "lean_inline": background_inline_lean(body)})
    return {"pages": pages, "items": items, "errors": errors}


LEAN_INLINE = _re.compile(r"\{lean:\s*([^{}\n]+?)\s*\}")


def background_inline_lean(md: str) -> list[str]:
    """The declarations a page's `{lean: …}` citations name, outside math and code, in order."""
    out = []
    for m in LEAN_INLINE.finditer(_outside_math_or_code(md)):
        out += [n.strip() for n in m[1].split(",") if n.strip() and n.strip() not in out]
    return out


def background_lean_names(data: dict) -> list[tuple[str, str]]:
    """Every Lean declaration the Background cites, with where: an item's header or a page's prose."""
    bg = data.get("background") or {}
    return ([(n, f"{i['file']}: item {i['id']}") for i in bg.get("items", []) for n in i["lean"]]
            + [(n, p["file"]) for p in bg.get("pages", []) for n in p.get("lean_inline", [])])


def background_ids(data: dict) -> set:
    """The ids the Background gives `[[id]]` links to: its pages and items."""
    bg = data.get("background") or {}
    return {p["id"] for p in bg.get("pages", [])} | {i["id"] for i in bg.get("items", [])}


def background_errors(data: dict, linkable: set) -> list[str]:
    """Problems with the Background's pages and items; `linkable` is the records' ids."""
    bg = data.get("background") or {}
    errors = list(bg.get("errors", []))
    seen = set()
    for x in bg.get("pages", []) + bg.get("items", []):
        where = f"{x['file']}: {'item ' + x['id'] if 'kind' in x else 'page'}"
        if not _re.fullmatch(r"[a-z0-9]+(-[a-z0-9]+)*", x["id"]):
            errors.append(f"{where}: id '{x['id']}' is not lowercase-hyphenated")
        if x["id"] == "literature":
            errors.append(f"{where}: the id 'literature' is the Literature page's")
        if x["id"] in seen:
            errors.append(f"{where}: duplicate background id '{x['id']}'")
        elif x["id"] in linkable:
            errors.append(f"{where}: id '{x['id']}' is already a record's id")
        seen.add(x["id"])
    for i in bg.get("items", []):
        where = f"{i['file']}: item {i['id']}"
        if i["kind"] not in BACKGROUND_KINDS:
            errors.append(f"{where}: unknown kind '{i['kind']}' (one of {', '.join(BACKGROUND_KINDS)})")
        header = i["_header"]
        if not isinstance(header, dict):
            errors.append(f"{where}: the header is not a mapping")
            continue
        for k in header:
            if k not in BACKGROUND_ITEM_KEYS:
                errors.append(f"{where}: unknown header key '{k}' (one of {', '.join(BACKGROUND_ITEM_KEYS)})")
        for k in ("title", "credit"):
            if k in header and not isinstance(header[k], str):
                errors.append(f"{where}: {k} is not a string")
        for k in ("lean", "sources"):
            v = header.get(k)
            if v is not None and not (isinstance(v, str) or isinstance(v, list) and all(isinstance(s, str) for s in v)):
                errors.append(f"{where}: {k} is neither a string nor a list of strings")
        if not i["body"]:
            errors.append(f"{where}: empty")
    for n, where in background_lean_names(data):
        if not _re.fullmatch(r"[A-Za-z_][\w'.]*", str(n)):
            errors.append(f"{where}: '{n}' is not a Lean declaration name")
    known = linkable | seen
    for p in bg.get("pages", []):
        for ln in BACKGROUND_BLOCK.sub("", p["md"]).splitlines():
            if ln.startswith(":::"):
                errors.append(f"{p['file']}: unmatched or malformed block line '{ln.strip()}'")
        for ref in sorted(set(CROSS_REF.findall(p["md"]))):
            if ref not in known:
                errors.append(f"{p['file']}: unknown cross-reference [[{ref}]]")
    return errors


# ----------------------------------------------------------------------------
# Model records in the argument format
# ----------------------------------------------------------------------------
#
# A model record either lists satisfies, violates and status, or gives a definition
# and a list of arguments, each naming the principles it settles (holds/fails) and
# saying why. The second format is flattened here into the first, which is all the
# engine reads:
#   - satisfies/violates are the holds/fails of the established, unwithdrawn arguments;
#   - a conjectured construction gives one conjectured model with every verdict;
#   - conjectured arguments add a conjectured companion, holding the established and
#     the conjectured verdicts, whose model_check names the base model and the verdicts
#     only conjectured arguments give, so that only evidence about the base model can
#     resolve it. Its id is <model>-conjectured unless an argument keeps an old one
#     with companion_id.
# certificate, sources and references pass through unchanged. The source record is
# kept as _source for validation; a companion carries _companion_of.

ARGUMENT_REASONS = ("text", "source", "writeup", "like")
TIERS = ("bronze", "silver", "gold")


# ----------------------------------------------------------------------------
# Model groups
# ----------------------------------------------------------------------------
#
# A group (groups/<id>.yaml) holds what a family of argument-format models would otherwise
# copy: a definition with {{parameter}} slots that each member fills, named conditions stated
# in prose, and shared arguments: arguments that apply to every member whose settings match `when`
# and that meets every condition in `requires`. A member names its group and gives its
# settings: for a parameter with named values, one of them or {text: ...} for prose of its
# own; for a prose slot, the prose. Under `meets` it gives a reason for each condition it
# claims. Nothing is inherited by default: a member gets only the shared arguments it matches.
#
# load_topic expands a member before flattening: its definition becomes the group's with the
# slots filled, followed by its own if it has one, and the shared arguments that apply follow its own
# arguments, so its own keep their positions. Each carries `group` and, if it requires any,
# `conditions` with the member's reasons. The engine never sees a group, so upgrading a record
# into one cannot change a verdict that the flattened lists do not change.
#
# A parameter marked `generate` also makes variants. A member's setting for it (or the parameter's
# `default`) gives the member itself; every other value whose `requires` the member meets gives a
# variant: a model of its own, with an id and name derived from the member's, the same file, and
# the arguments that apply at its settings. A member's own argument applies at every setting unless
# its `when` says otherwise; `own` in a `when` matches a setting given as the member's own prose.
#
# A value marked `choiceless` reads the construction in a metatheory without the axiom of choice. A
# model at such a value (a member or a variant) gets only the arguments, its own, its group's and the
# topic's, that are marked `choice: free`, reviewed as not using choice: an unmarked argument is
# unreviewed and does not apply. Its verdicts are relative-consistency claims, and it has no Lean.

import re as _re
SLOT = _re.compile(r"\{\{\s*([a-z0-9]+(?:-[a-z0-9]+)*)\s*\}\}")
# A cross-reference in a record's prose, [[id]] or [[id|text]]: a link to the record with that id.
CROSS_REF = _re.compile(r"\[\[([a-z0-9]+(?:-[a-z0-9]+)*)(?:\|[^\]]*)?\]\]")


def _prose_text(value) -> str:
    """Every string in a record, outside its loader's `_` fields, joined: where cross-references can occur."""
    if isinstance(value, str):
        return value
    if isinstance(value, dict):
        return "\n".join(_prose_text(v) for k, v in value.items() if not str(k).startswith("_"))
    if isinstance(value, list):
        return "\n".join(_prose_text(v) for v in value)
    return ""


def value_entry(param: dict, value: str) -> dict:
    """A named value as {text, label, requires}; a bare string is its text."""
    v = ((param or {}).get("values") or {}).get(value)
    return {"text": v} if isinstance(v, str) else v if isinstance(v, dict) else {}


def setting_text(group: dict, name: str, setting):
    """The prose a member's setting puts in a slot, or None if it gives none."""
    param = (group.get("parameters") or {}).get(name)
    if not isinstance(param, dict):
        return None
    if isinstance(setting, dict):
        return setting.get("text") if isinstance(setting.get("text"), str) else None
    if not isinstance(setting, str):
        return None
    if isinstance(param.get("values"), dict):
        t = value_entry(param, setting).get("text")
        return t if isinstance(t, str) else None
    return setting


def member_settings(group: dict, rec: dict) -> dict:
    """A member's settings, a generated parameter it leaves unset taking the group's default."""
    settings = dict(rec.get("settings") or {}) if isinstance(rec.get("settings"), dict) else {}
    for name, param in (group.get("parameters") or {}).items():
        if isinstance(param, dict) and param.get("generate") and name not in settings and param.get("default"):
            settings[name] = param["default"]
    return settings


def settings_match(when, settings: dict) -> bool:
    """`when`: each named parameter is set to one of the listed values; `own` matches prose of the
    member's own, which no named value matches."""
    for name, want in (when or {}).items():
        want = want if isinstance(want, list) else [want]
        v = settings.get(name)
        if not ((isinstance(v, str) and v in want) or (isinstance(v, dict) and "own" in want)):
            return False
    return True


def choiceless(group: dict | None, settings: dict) -> bool:
    """Whether these settings read the construction without the axiom of choice: some parameter is
    set to a value marked `choiceless`. Such a model gets only the arguments marked `choice: free`."""
    for name, param in ((group or {}).get("parameters") or {}).items():
        if isinstance(param, dict) and isinstance(settings.get(name), str) and value_entry(param, settings[name]).get("choiceless"):
            return True
    return False


def member_variants(rec: dict, group: dict) -> list[dict]:
    """The settings of each variant of a member: every combination of the generated parameters'
    values other than the member's own, each value's `requires` met by the member at those settings,
    so that a value may require a condition another parameter's value meets."""
    import itertools
    base = member_settings(group, rec)
    axes = []
    for name, param in (group.get("parameters") or {}).items():
        if not (isinstance(param, dict) and param.get("generate") and isinstance(param.get("values"), dict)):
            continue
        vals = list(param["values"])
        if not isinstance(base.get(name), str) or base.get(name) not in vals:  # the member's own prose stays one of its choices
            vals = [base.get(name)] + vals
        axes.append((name, vals))
    out = []
    for combo in itertools.product(*[vals for _, vals in axes]):
        s = {**base, **{name: v for (name, _), v in zip(axes, combo)}}
        if not any(s[name] != base.get(name) for name, _ in axes):
            continue
        params = group.get("parameters") or {}
        ok = True
        for name, _ in axes:
            if s[name] == base.get(name) or not isinstance(s[name], str):
                continue
            met = conditions_met(rec, group, s, skip=name)
            if not all(c in met for c in value_entry(params[name], s[name]).get("requires") or []):
                ok = False
        if ok:
            out.append(s)
    return out


def variant_label(group: dict, rec: dict, settings: dict) -> tuple[str, str]:
    """The id suffix and the name tag of a variant: its settings that differ from the member's."""
    base = member_settings(group, rec)
    slugs, tags = [], []
    for name, param in (group.get("parameters") or {}).items():
        v = settings.get(name)
        if v == base.get(name) or not isinstance(v, str):
            continue
        slugs.append(f"{name}-{v}")
        tags.append(value_entry(param, v).get("label") or f"{name} {v}")
    return "-".join(slugs), "; ".join(tags)


def conditions_met(rec: dict, group: dict | None, settings: dict, skip: str | None = None) -> dict:
    """Each condition a record meets, with its reason: from its group (for every member), from the
    values of the group's parameters at these settings, and from the record itself, in that order,
    a later reason replacing an earlier one. `skip` names a parameter whose value's own `meets` are
    left out (a value's `requires` cannot be met by the value itself)."""
    met, conditional = {}, {}
    if isinstance(group, dict):
        for k, v in (group.get("meets") or {}).items():
            if isinstance(v, dict):  # met by the members that meet these conditions
                conditional[k] = v
            else:
                met[k] = v
        for name, param in (group.get("parameters") or {}).items():
            if name != skip and isinstance(param, dict) and isinstance(settings.get(name), str):
                met.update(value_entry(param, settings[name]).get("meets") or {})
    for k, v in (rec.get("meets") if isinstance(rec.get("meets"), dict) else {}).items():
        if isinstance(v, dict):  # met only at the settings its `when` names
            if settings_match(v.get("when"), settings):
                met[k] = v.get("text", "")
        else:
            met[k] = v
    while True:
        ready = [k for k, v in conditional.items() if k not in met and all(c in met for c in v.get("requires") or [])]
        if not ready:
            return met
        for k in ready:
            met[k] = conditional[k].get("text", "")


def _applied(c: dict, mark: dict, met: dict, texts: dict) -> dict:
    import copy
    a = {k: copy.deepcopy(v) for k, v in c.items() if k not in ("when", "requires", "_file")}
    a.update(mark)
    if c.get("requires"):
        a["conditions"] = [{"id": k, "text": str((texts.get(k) or {}).get("text", "")), "reason": met.get(k)} for k in c["requires"]]
    return a


def expand_member(rec: dict, groups: dict, settings: dict | None = None, library: dict | None = None) -> dict:
    """An argument-format record as the build sees it. A group's member, at its own settings or a
    variant's, gets the group's definition completed and its own arguments that apply there, then the
    group's shared arguments that apply. Any record then gets the topic's general arguments whose
    conditions it meets and whose `given` verdicts the arguments so far record as holding."""
    group = groups.get(rec.get("group"))
    library = library or {}
    if not isinstance(group, dict) and not (library.get("arguments") and rec.get("meets")):
        return rec
    out = dict(rec)
    texts = dict(library.get("conditions") or {})
    if isinstance(group, dict):
        settings = settings if settings is not None else member_settings(group, rec)
        out["settings"] = settings
        filled = SLOT.sub(lambda mt: setting_text(group, mt[1], settings.get(mt[1])) or mt[0], str(group.get("definition") or ""))
        out["definition"] = "\n\n".join(x.strip() for x in (filled, rec.get("definition")) if isinstance(x, str) and x.strip())
        texts.update({c.get("id"): c for c in group.get("conditions") or [] if isinstance(c, dict)})
    else:
        settings = {}
    met = conditions_met(rec, group, settings)
    out["met"] = met  # every condition the record meets at these settings, with its reason
    own = [a for a in rec.get("arguments") or [] if not isinstance(a, dict) or settings_match(a.get("when"), settings)]
    shared = [_applied(c, {"group": group.get("id")}, met, texts) for c in (group or {}).get("arguments") or []
              if isinstance(c, dict) and settings_match(c.get("when"), settings) and all(k in met for k in c.get("requires") or [])]
    args = own + shared
    pending = [c for c in library.get("arguments") or [] if isinstance(c, dict) and all(k in met for k in c.get("requires") or [])]
    if choiceless(group, settings):  # without choice, only the arguments reviewed as choice-free
        args = [a for a in args if not isinstance(a, dict) or a.get("choice") == "free"]
        pending = [c for c in pending if c.get("choice") == "free"]
    while True:  # a general argument with `given` waits until the arguments applied record those verdicts
        holds = {p for a in args if isinstance(a, dict) and not a.get("withdrawn") for p in a.get("holds") or []}
        ready = [c for c in pending if set(c.get("given") or []) <= holds]
        if not ready:
            break
        for c in ready:
            pending.remove(c)
            args.append(_applied(c, {"general": c.get("id")}, met, texts))
    out["arguments"] = args
    return out


def is_argument_record(rec) -> bool:
    return isinstance(rec, dict) and ("arguments" in rec or "definition" in rec)


def argument_label(a: dict, i: int) -> str:
    """How messages name an argument: its id (a group's shared argument as <group>#<id>), else its position."""
    if isinstance(a, dict) and a.get("group") and isinstance(a.get("id"), str):
        return f"{a['group']}#{a['id']}"
    if isinstance(a, dict) and a.get("general"):
        return f"arguments/{a['general']}"
    return a["id"] if isinstance(a, dict) and isinstance(a.get("id"), str) else f"arguments[{i}]"


def _arguments(rec: dict) -> list[tuple[int, dict]]:
    args = rec.get("arguments")
    return [(i, a) for i, a in enumerate(args)] if isinstance(args, list) else []


def _live_arguments(rec: dict, standing: str | None = None) -> list[tuple[int, dict]]:
    """Unwithdrawn arguments, optionally of one standing."""
    return [(i, a) for i, a in _arguments(rec) if isinstance(a, dict) and not a.get("withdrawn")
            and (standing is None or a.get("standing", "established") == standing)]


def _settled(args, key: str) -> list:
    return list(dict.fromkeys(p for _, a in args for p in (a.get(key) if isinstance(a.get(key), list) else [])))


def _top_tier(tiers) -> str | None:
    tiers = [t for t in tiers if t in TIERS]
    return max(tiers, key=TIERS.index) if tiers else None


def companion_id(rec: dict) -> str:
    kept = [a["companion_id"] for _, a in _live_arguments(rec, "conjectured") if a.get("companion_id")]
    return kept[0] if kept else f"{rec.get('id')}-conjectured"


def flatten_model(rec: dict, raw: dict | None = None) -> list[dict]:
    """The engine's model records for one argument-format record: none when its construction
    is withdrawn, the model alone, or the model and its conjectured companion. For a group's
    member, rec is expanded and raw is the file as written, which validation checks."""
    import copy
    construction = rec.get("construction") if isinstance(rec.get("construction"), dict) else {}
    if construction.get("withdrawn"):
        return []
    base = {k: v for k, v in rec.items()}
    base["_source"] = copy.deepcopy(raw if raw is not None else rec)
    established, conjectured = _live_arguments(rec, "established"), _live_arguments(rec, "conjectured")
    if construction.get("standing") == "conjectured":
        live = _live_arguments(rec)
        base.update(satisfies=_settled(live, "holds"), violates=_settled(live, "fails"), status="conjectured")
        tier = _top_tier([construction.get("tier"), *(a.get("tier") for _, a in conjectured)])
        if tier:
            base["tier"] = tier
        # A conjecture's notes explain it: here, what remains to check about the construction.
        base["notes"] = "\n\n".join(x.strip() for x in (construction.get("text"), rec.get("notes"))
                                    if isinstance(x, str) and x.strip())
        return [base]
    satisfies, violates = _settled(established, "holds"), _settled(established, "fails")
    base.update(satisfies=satisfies, violates=violates, status="proved")
    extra_sat = [p for p in _settled(conjectured, "holds") if p not in satisfies]
    extra_vio = [p for p in _settled(conjectured, "fails") if p not in violates]
    if not (extra_sat or extra_vio):
        return [base]
    new = set(extra_sat) | set(extra_vio)
    used = [a for _, a in conjectured if new & set(a.get("holds") or []) | new & set(a.get("fails") or [])]
    companion = {
        "id": companion_id(rec), "name": rec.get("name"),
        "satisfies": satisfies + extra_sat, "violates": violates + extra_vio, "status": "conjectured",
        "model_check": {"model": rec.get("id"), "satisfies": extra_sat, "violates": extra_vio},
        **{k: copy.deepcopy(rec[k]) for k in ("certificate", "sources", "source_names", "references", "definition") if k in rec},
        "arguments": copy.deepcopy(used),
        # A conjecture's notes explain it: here, the conjectured arguments.
        "notes": "\n\n".join(a["text"].strip() for a in used if isinstance(a.get("text"), str) and a["text"].strip()),
        "companion_of": rec.get("id"),
        "_companion_of": rec.get("id"), "_file": rec.get("_file"),
    }
    tier = _top_tier(a.get("tier") for a in used)
    if tier:
        companion["tier"] = tier
    return [base, companion]


# ----------------------------------------------------------------------------
# Derivation engine (mirrored in viewer/template.html — keep the two in sync)
# ----------------------------------------------------------------------------
#
# Results are Horn clauses premises ⇒ principle-or-False, relative to background B.
# False is a terminal contradiction, never a principle or an explosion rule.
# P ⇒ ¬c when cl(P ∪ {c}) contains False, provided cl(P) does not.
# A model can additionally refute c when that trial reaches one of its explicit
# violations. Such model witnesses of P ⇏ c are distinct from P ⇒ ¬c.

#
# closure() runs in time linear in the rules its facts touch, but reproduces the
# naive loop "sweep the rules in order until nothing changes" exactly, `why`
# included, so proofs do not depend on the algorithm. A rule fires at the first
# sweep position after its last premise arrives: later in the same sweep if it
# comes after the rule that added that premise, else in the next sweep. Pending
# firings are taken in (sweep, position) order; one whose conclusion is already
# in has lost to an earlier firing, as it would have in the naive loop.

_INDEX: dict = {}


def _rule_index(rules):
    """(rules, premise counts, rules by premise), kept for a tuple of rules, which cannot change."""
    keep = isinstance(rules, tuple)
    if keep and id(rules) in _INDEX:
        return _INDEX[id(rules)]
    rules = tuple(rules)
    need, by_prem = [], {}
    for i, (_, prem, _c) in enumerate(rules):
        prem = set(prem)
        need.append(len(prem))
        for x in prem:
            by_prem.setdefault(x, []).append(i)
    out = (rules, need, by_prem, [i for i, k in enumerate(need) if k == 0])
    if keep:
        if len(_INDEX) > 64:
            _INDEX.clear()
        _INDEX[id(rules)] = out  # the entry holds the tuple, so its id is not reused
    return out


def closure(seed, rules, background=()):
    from heapq import heappush, heappop
    rules, need, by_prem, unconditional = _rule_index(rules)
    n = len(rules) + 1
    facts = set(background) | set(seed)
    why = {f: None for f in facts}
    missing, due = {}, [n + i for i in unconditional]  # sweep 1, position i
    for f in facts:
        for i in by_prem.get(f, ()):
            k = missing[i] = missing.get(i, need[i]) - 1
            if k == 0:
                due.append(n + i)
    due.sort()
    while due:
        t = heappop(due)
        sweep, i = divmod(t, n)
        rid, _, concl = rules[i]
        if concl in facts:
            continue
        facts.add(concl)
        why[concl] = rid
        for j in by_prem.get(concl, ()):
            k = missing[j] = missing.get(j, need[j]) - 1
            if k == 0:
                heappush(due, (sweep if j > i else sweep + 1) * n + j)
    return facts, why


def proof_chain(target, why, rules_by_id):
    out, seen = [], set()

    def visit(f):
        rid = why.get(f)
        if rid is None or rid in seen:
            return
        seen.add(rid)
        for p in sorted(rules_by_id[rid][1]):
            visit(p)
        out.append(rid)

    visit(target)
    return out


class _FailChains(dict):
    """fail_why for one model: the proof that c fails, [model id, *rule ids], made when first asked for."""

    def __init__(self, engine, model, fails):
        super().__init__()
        self.engine, self.model, self.failing = engine, model, fails

    def __missing__(self, c):
        if c not in self.failing:
            raise KeyError(c)
        m = self.model
        hit = self.engine.conflict([*m["satisfies"], c], m["violates"])
        self[c] = chain = [m["id"], *hit["via"]]
        return chain


class Engine:
    def __init__(self, ids, results, models, background=(), negative_background=()):
        self.ids = list(ids)
        self.background = tuple(background)
        self.negative_background = tuple(negative_background)
        self.rules = tuple((r["id"], frozenset(r["premises"]), r["conclusion"]) for r in results)
        self.rules_by_id = {r[0]: r for r in self.rules}
        self.models = list(models)
        self._cache, self._across = {}, {}
        self.holds, self.fails, self.fail_why, self.model_conflicts = {}, {}, {}, {}
        for m in self.models:
            h, _ = self.cl(m["satisfies"])
            self.holds[m["id"]] = h - {FALSE}
            conflict = self.conflict(m["satisfies"], m["violates"])
            if conflict is not None:
                self.model_conflicts[m["id"]] = conflict
            f = set()
            if conflict is None:
                f = {c for c in self.ids if self._reaches(m["satisfies"], c, m["violates"])}
            self.fails[m["id"]], self.fail_why[m["id"]] = f, _FailChains(self, m, f)
        # Bit i of held[p] / failed[p]: the i-th consistent model holds / fails p.
        self._witnesses = [m["id"] for m in self.models if m["id"] not in self.model_conflicts]
        self._held, self._failed = {}, {}
        for i, mid in enumerate(self._witnesses):
            for p in self.holds[mid]:
                self._held[p] = self._held.get(p, 0) | 1 << i
            for p in self.fails[mid]:
                self._failed[p] = self._failed.get(p, 0) | 1 << i

    def cl(self, seed):
        key = frozenset(seed)
        if key not in self._cache:
            self._cache[key] = closure(key, self.rules, self.background)
        return self._cache[key]

    def _reaches(self, seed, c, violates=()):
        """Whether conflict([*seed, c], violates) is not None, without its proof. Usually no rule
        fires on cl(seed) ∪ cl({c}) that did not fire on either part, so that is the closure;
        otherwise cl(seed) is extended by cl({c}), touching only rules the new facts complete."""
        F, G = self.cl(seed)[0], self.cl([c])[0]
        bad = {FALSE, *self.negative_background, *violates}
        if not bad.isdisjoint(F) or not bad.isdisjoint(G):
            return True
        _, _, by_prem, _ = _rule_index(self.rules)
        key = frozenset(seed)
        if key not in self._across:  # the rules cl(seed) leaves unfired, with their missing premises
            self._across[key] = [(prem - F, concl) for _, prem, concl in
                                 (self.rules[i] for i in {i for f in F for i in by_prem.get(f, ())})
                                 if concl not in F]
        if not any(rest <= G and concl not in G for rest, concl in self._across[key]):
            return False
        todo = [x for x in G if x not in F]
        facts = F | G
        while todo:
            for i in by_prem.get(todo.pop(), ()):
                _, prem, concl = self.rules[i]
                if concl not in facts and prem <= facts:
                    if concl in bad:
                        return True
                    facts.add(concl)
                    todo.append(concl)
        return False

    def conflict(self, seed, violates=()):
        """A proof of False, or a fact forbidden by this model/filter; None means unknown."""
        facts, why = self.cl(seed)
        target = FALSE if FALSE in facts else next((v for v in (*self.negative_background, *violates) if v in facts), None)
        if target is None:
            return None
        return {"target": target, "via": proof_chain(target, why, self.rules_by_id)}

    def entails(self, P, c):
        conflict = self.conflict(P)
        if conflict is not None:
            return (True, conflict["via"]) if c == FALSE else (False, [])
        facts, why = self.cl(P)
        # Do not display consequences of an inconsistent package by explosion.
        if FALSE in facts and c != FALSE:
            return False, []
        return (True, proof_chain(c, why, self.rules_by_id)) if c in facts else (False, [])

    def excludes(self, P, c):
        """P entails not-c iff adjoining c reaches False. P must itself be consistent."""
        if self.conflict(P) is not None:
            return None
        return self.conflict([*P, c]) if self._reaches(P, c) else None

    def separates(self, P, c):
        """Model witnesses P does not imply c; distinct from P implying not-c."""
        found = self._failed.get(c, 0)
        for p in set(P):
            found &= self._held.get(p, 0)
        wits = []
        while found:
            low = found & -found
            wits.append(self._witnesses[low.bit_length() - 1])
            found ^= low
        return wits, (self.fail_why[wits[0]][c] if wits else [])

    def resolve_conjecture(self, item):
        """Answer a result/model question using this proved-only engine.

        The caller supplies only models fitting the selected background.
        Historical metadata never supplies evidence. The via list contains rule
        ids for the proof, or for the first of the returned model witnesses.
        """
        def answer(status, via=(), models=()):
            return {"status": status, "via": list(via), "models": list(models)}

        conflict = self.conflict([])
        if conflict is not None:
            return answer("inconsistent-background", conflict["via"])

        valid_models = [m for m in self.models if m["id"] not in self.model_conflicts]

        def witness_answer(status, witnesses, positive, negative=()):
            first = next(m for m in valid_models if m["id"] == witnesses[0])
            _, why = self.cl(first["satisfies"])
            via = []
            for p in positive:
                via.extend(proof_chain(p, why, self.rules_by_id))
            for p in negative:
                # Existing failure evidence starts with its model id.
                via.extend(self.fail_why[first["id"]][p][1:])
            return answer(status, dict.fromkeys(via), witnesses)

        if item.get("model_check"):
            check = item["model_check"]
            model = next((m for m in valid_models if m["id"] == check["model"]), None)
            if model is None:
                return answer("open")
            mid = model["id"]
            positive, negative = check["satisfies"], check["violates"]
            wrong_positive = set(negative) & self.holds[mid]
            wrong_negative = set(positive) & self.fails[mid]
            if wrong_positive or wrong_negative:
                return witness_answer("refuted", [mid], sorted(wrong_positive), sorted(wrong_negative))
            conflict = self.conflict([*model["satisfies"], *positive], [*model["violates"], *negative])
            if conflict is not None:
                return answer("refuted", conflict["via"], [mid])
            if set(positive) <= self.holds[mid] and set(negative) <= self.fails[mid]:
                return witness_answer("proved", [mid], positive, negative)
            return answer("open")

        if "satisfies" in item:
            positive, negative = item["satisfies"], item["violates"]
            conflict = self.conflict(positive, negative)
            if conflict is not None:
                return answer("refuted", conflict["via"])
            witnesses = [m["id"] for m in valid_models
                         if set(positive) <= self.holds[m["id"]]
                         and set(negative) <= self.fails[m["id"]]]
            if witnesses:
                return witness_answer("proved", witnesses, positive, negative)
            return answer("open")

        premises = item["premises"]
        conclusion = FALSE if item["conclusion"] is False else item["conclusion"]
        if conclusion == FALSE:
            proved, via = self.entails(premises, FALSE)
            if proved:
                return answer("proved", via)
            witnesses = [m["id"] for m in valid_models
                         if set(premises) <= self.holds[m["id"]]]
            if witnesses:
                return witness_answer("refuted", witnesses, premises)
            return answer("open")

        conflict = self.conflict(premises)
        if conflict is not None:
            return answer("incompatible", conflict["via"])
        proved, via = self.entails(premises, conclusion)
        if proved:
            return answer("proved", via)
        witnesses, _ = self.separates(premises, conclusion)
        if witnesses:
            return witness_answer("refuted", witnesses, premises, [conclusion])
        # An exclusion without an actual model does not refute an implication.
        return answer("open")

    def package(self, P):
        P = set(P)
        conflict = self.conflict(P)
        out = {"inconsistent": conflict is not None, "via": conflict["via"] if conflict else [],
               "entails": [], "excludes": [], "separated": [], "open": []}
        if conflict is not None:
            return out
        entailed, _ = self.cl(P)
        for c in self.ids:
            if c in P:
                continue
            if c in entailed:
                out["entails"].append(c)
            elif self.excludes(P, c) is not None:
                out["excludes"].append(c)
            elif self.separates(P, c)[0]:
                out["separated"].append(c)
            else:
                out["open"].append(c)
        return out

    def pair(self, a, b):
        conflict = self.conflict([a])
        if conflict is not None:
            return {"status": "inconsistent", "via": conflict["via"]}
        ok, via = self.entails({a}, b)
        if ok:
            return {"status": "implies", "via": via}
        excluded = self.excludes([a], b)
        if excluded is not None:
            return {"status": "excludes", "via": excluded["via"]}
        wits, via = self.separates(P=[a], c=b)
        if wits:
            return {"status": "independent", "via": via, "models": wits}
        return {"status": "open", "via": []}


def analyse(data: dict, *, include_conjectures=False) -> dict:
    topic, principles = data["topic"], data["principles"]
    ids = [p["id"] for p in principles]
    ok = lambda x: x["status"] == "proved" or include_conjectures
    E = Engine(ids, [r for r in data["results"] if ok(r)], [m for m in data["models"] if ok(m)], topic.get("background", []))

    pair = {(a, b): E.pair(a, b) for a in ids for b in ids if a != b}
    classes, seen = [], set()
    for a in ids:
        if a in seen:
            continue
        cls = [a] + [b for b in ids if b != a and pair[(a, b)]["status"] == "implies" and pair[(b, a)]["status"] == "implies"]
        seen.update(cls)
        classes.append(cls)

    problems, infos = [], []
    conflict = E.conflict([])
    if conflict is not None:
        problems.append(f"background is inconsistent: False follows via {conflict['via']}")
    for m in E.models:
        if m["id"] in E.model_conflicts:
            conflict = E.model_conflicts[m["id"]]
            problems.append(f"model {m['id']} is inconsistent: {conflict['target']} follows via {conflict['via']}")
        for m2 in E.models:
            if m2 is not m and set(m["satisfies"]) <= E.holds[m2["id"]] and set(m["violates"]) <= E.fails[m2["id"]]:
                infos.append(f"model {m['id']} is subsumed by {m2['id']}")
                break
    for rid, prem, concl in E.rules:
        if concl in prem:
            problems.append(f"{rid}: conclusion is among its premises")
        others = [x for x in E.rules if x[0] != rid]
        facts, why = closure(set(prem), others, E.background)
        if concl in facts:
            infos.append(f"{rid} is redundant: derivable from {proof_chain(concl, why, {x[0]: x for x in others})}")

    proved_engine = E if not include_conjectures else Engine(
        ids, [r for r in data["results"] if r["status"] == "proved"],
        [m for m in data["models"] if m["status"] == "proved"], topic.get("background", []))
    conjectures = {
        item["id"]: proved_engine.resolve_conjecture(item)
        for item in [*data["results"], *data["models"]]
        if item["status"] == "conjectured" or item.get("was_conjectured", False)
    }

    return {
        "engine": E,
        "pair": pair,
        "classes": classes,
        "problems": problems,
        "infos": infos,
        "open_pairs": [k for k, v in pair.items() if v["status"] == "open"],
        "unknown": {m["id"]: [c for c in ids if c not in E.holds[m["id"]] and c not in E.fails[m["id"]]] for m in E.models},
        "conjectures": conjectures,
    }


# ----------------------------------------------------------------------------
# Lynchpin conjectures
# ----------------------------------------------------------------------------
#
# An open question is a lynchpin when either answer would settle many other
# open questions. The inventory is taken over one representative per
# equivalence class under the chosen background:
#   a ⇒ b ?          implies / excludes / independent / inconsistent / open
#   P consistent ?   for P one principle or two: inconsistent (P ⇒ ⊥),
#                    consistent (a fitting model satisfies all of P), or open
# Each answer is scored by the number of *other* open questions that stop being
# open once it joins the proved records: the rule a ⇒ b or P ⇒ ⊥, or a model
# satisfying P and violating c. A refutation is scored by its least informative
# countermodel, so an actual one settles at least as much. Unknown verdicts in
# recorded models are scored the same way, by adding the principle to the
# model's satisfies or to its violates. Proving a strong conjecture settles
# everything below it and refuting a weak one everything above it, so the two
# scores pull apart; a question scoring well on both is worth answering either
# way. Everything is closure over the same Horn rules, so no engine is rebuilt:
# adding one rule P ⇒ c changes cl(S) to cl(S ∪ {c}) exactly when P ⊆ cl(S),
# because cl(S) is already closed under the other rules and the new rule can
# fire at most once. The statuses mirror Engine.pair and are cross-checked
# against full rebuilds in selftest.


class Lynchpins:
    """The open questions of a topic, relative to a background, scored by what either answer settles.

    A question is S ⇒ c for S a set of at most PROGRESS_PREMISES class representatives (none
    implying another, none inconsistent) and c a representative or False outside S. It exists
    only when no proper subset of S already proves or excludes c, so a pair question is asked
    exactly where single premises leave it open; with no premises it asks whether c is a theorem
    of the background, and with c = False whether S is consistent. It is settled by a proof, by an
    exclusion (S ∧ c ⇒ False) or by a fitting model that holds S and fails c, alike. Each open
    question is scored by the other open questions that a proof of it, or its weakest
    countermodel, would settle. Deciding an unknown principle in a recorded model is scored the
    same way, since a model fact settles questions exactly as a proof does.

    The core questions are those with no premise (whether c is a theorem of the background), those
    with one premise (S ⇒ c, c a principle or False), those of the form A ∧ B ⇒ False, and those of
    the form A ∧ B ⇒ C where C ⇒ A and C ⇒ B are already established: whether C is equivalent to
    A ∧ B. Each answer is scored by the open core questions it would settle, the question itself
    included, and a question by the geometric mean of the two.
    """

    def __init__(self, data: dict, background=(), negative_background=()):
        self.names = {FALSE: "⊥", **{p["id"]: p["name"] for p in data["principles"]}}
        self.ids = ids = [p["id"] for p in data["principles"]]
        results = [r for r in data["results"] if r["status"] == "proved"]
        models = [m for m in data["models"] if m["status"] == "proved"]
        self.conjectures = [r for r in data["results"] + data["models"] if r["status"] == "conjectured"]
        fixed = list(data["topic"].get("background", []))
        extra = [x for x in background if x not in fixed]
        negative = list(negative_background)
        if extra or negative:
            # As in the viewer: a model with unknown or false extra assumptions is no witness.
            judge = Engine(ids, results, models, fixed)
            models = [m for m in models if m["id"] not in judge.model_conflicts
                      and set(extra) <= judge.holds[m["id"]] and set(negative) <= judge.fails[m["id"]]]
        self.background, self.negative = fixed + extra, negative
        self.results, self.models = results, models
        self.E = E = Engine(ids, results, models, self.background, negative)
        self.inconsistent = E.conflict([]) is not None
        self.witnesses = [m for m in models if m["id"] not in E.model_conflicts]
        self.trivial = [] if self.inconsistent else [a for a in ids if a in E.cl([])[0]]
        self.classes, seen = [], set()
        for a in ids:
            if a in seen:
                continue
            cls = [a] + [b for b in ids if b != a and E.entails({a}, b)[0] and E.entails({b}, a)[0]]
            seen.update(cls)
            self.classes.append(cls)
        self.reps = [c[0] for c in self.classes]
        self.proper = [a for a in self.reps if a not in self.trivial]
        self.unknown = {m["id"]: [c for c in ids if c not in E.holds[m["id"]] and c not in E.fails[m["id"]]]
                        for m in self.witnesses}
        self._rows = self._ranked = self._auto = self._recorded_rows = None
        self._universe()

    # -- closures as bitmasks over ids ∪ {False} ----------------------------
    def _mask(self, F):
        bit = self.bit
        return sum(bit[x] for x in F if x in bit)

    def _cl(self, S):
        return self._mask(self.E.cl(S)[0])

    def _ext(self, F, c):
        """Closure of the closed set F together with c, by forward chaining from c alone: F being
        closed, only a rule that a new atom completes can fire, so the rules are indexed by their
        premise atoms and each new atom is checked against its rules. Memoised on (F, c)."""
        bit = self.bit
        if c == FALSE:
            return F | bit[FALSE]
        cb = bit[c]
        if F & cb:
            return F
        key = (F, c)
        X = self._ext_cache.get(key)
        if X is None:
            X = F | cb
            stack, rules_by_atom = [c], self.rules_by_atom
            while stack:
                for pm, kb, k in rules_by_atom.get(stack.pop(), ()):
                    if not X & kb and pm & ~X == 0:
                        X |= kb
                        stack.append(k)
            self._ext_cache[key] = X
        return X

    @staticmethod
    def _bits(m):
        while m:
            low = m & -m
            m ^= low
            yield low

    # Popcount: int.bit_count on Python 3.10 and later, the string count before.
    _count = staticmethod(int.bit_count) if hasattr(int, "bit_count") else staticmethod(lambda m: bin(m).count("1"))

    def _universe(self):
        """Enumerate the questions, their status, and the closures the scores need."""
        from itertools import combinations
        E, atoms = self.E, self.proper
        self.bit = bit = {x: 1 << i for i, x in enumerate([*self.ids, FALSE])}
        self.id_of = {b: x for x, b in bit.items()}
        self.BAD = BAD = bit[FALSE] | sum(bit[v] for v in self.negative if v in bit)
        self.ALL = ALL = sum(bit[a] for a in atoms)
        self._ext_cache = {}
        # Memo tables for the scores (with_rule, with_model): what each depends on is the
        # conclusion, a witness or a closure, not the question being scored, so it is computed
        # once per engine instead of once per question. Filled lazily.
        self._refutes, self._witness_ext, self._witness_nf, self._subsets, self._ext_by = {}, {}, {}, {}, {}
        self.by_prem, self.rules_by_atom = {}, {}
        for _, prem, concl in E.rules:
            pm = self._mask(prem)
            for x in prem:
                self.by_prem.setdefault(x, []).append(pm)
                self.rules_by_atom.setdefault(x, []).append((pm, bit[concl], concl))
        # Premises from which False or a denied principle can be reached: only a rule
        # concluding one of these can turn a question into an exclusion.
        toward, grow = {x for x in self.ids if bit[x] & BAD}, True
        while grow:
            grow = False
            for _, prem, concl in E.rules:
                if (concl == FALSE or concl in toward) and not prem <= toward:
                    toward |= prem
                    grow = True
        self.toward_bad = toward
        # sets[j] = (premise ids, premise mask, closure mask); qmask/settled/openmask are conclusion
        # masks per set; qfalse is the status of the consistency question (None: not asked).
        self.sets, self.qmask, self.settled, self.qfalse = [], [], [], []
        self.wit = [(self._mask(E.holds[m["id"]]), self._mask(E.fails[m["id"]])) for m in self.witnesses]
        if self.inconsistent:
            self.openmask, self.openq, self.T, self.coremask = [], [], {}, []
            return
        single = {a: self._cl((a,)) for a in atoms}
        inconsistent = sum(bit[a] for a in atoms if single[a] & BAD)
        conclusions = ALL & ~inconsistent  # ∅ already excludes an inconsistent principle
        fails0 = 0
        for _, Fm in self.wit:
            fails0 |= Fm
        self.sets.append(((), 0, self._cl(())))
        self.qmask.append(ALL)
        self.settled.append(ALL & (fails0 | inconsistent))
        self.qfalse.append(None)
        cons = [a for a in atoms if not single[a] & BAD]
        pairs = {}
        for a, b in combinations(cons, 2):
            if not (single[a] & bit[b] or single[b] & bit[a]):
                pairs[a, b] = self._cl((a, b))
        excl1 = {a: 0 for a in atoms}
        for (a, b), F in pairs.items():
            if F & BAD:
                excl1[a] |= bit[b]
                excl1[b] |= bit[a]
        for a in atoms:
            F, held = single[a], [Fm for H, Fm in self.wit if H & bit[a]]
            self.sets.append(((a,), bit[a], F))
            if F & BAD:
                self.qmask.append(0)
                self.settled.append(0)
                self.qfalse.append("proved")
                continue
            refuted = 0
            for Fm in held:
                refuted |= Fm
            g = conclusions & ~bit[a]
            self.qmask.append(g)
            self.settled.append(g & (F | excl1[a] | refuted))
            self.qfalse.append("refuted" if held else "open")
        self.T = {}
        for (a, b), F in pairs.items():
            pm = bit[a] | bit[b]
            j = len(self.sets)
            held = [Fm for H, Fm in self.wit if H & pm == pm]
            self.sets.append(((a, b), pm, F))
            if F & BAD:
                self.qmask.append(0)
                self.settled.append(0)
                self.qfalse.append("proved")
                continue
            refuted = 0
            for Fm in held:
                refuted |= Fm
            g = conclusions & ~(pm | single[a] | single[b] | excl1[a] | excl1[b])
            s = g & (F | refuted)
            for low in self._bits(g & ~s):
                X = self._ext(F, self.id_of[low])
                if X & BAD:
                    s |= low
                else:
                    self.T[j, low] = X
            self.qmask.append(g)
            self.settled.append(s)
            self.qfalse.append("refuted" if held else "open")
        self.openmask = [g & ~s for g, s in zip(self.qmask, self.settled)]
        # Core conclusions per set: every conclusion of no premise or one; of two premises a and b,
        # those c already known to entail both (c ⇒ a and c ⇒ b). Consistency questions, asked with
        # one or two premises, are core too (see _total and progress).
        down = {a: 0 for a in atoms}  # down[a]: the conclusions known to entail a
        for c, F in single.items():
            for low in self._bits(F & ALL):
                down[self.id_of[low]] |= bit[c]
        self.coremask = [g & down[S[0]] & down[S[1]] if len(S) == 2 else g
                         for (S, _, _), g in zip(self.sets, self.qmask)]
        for j, (S, pm, F) in enumerate(self.sets):
            if len(S) < 2:
                for low in self._bits(self.openmask[j]):
                    self.T[j, low] = self._ext(F, self.id_of[low])
        # Open questions with a principle conclusion, indexed for the scores.
        self.openq = [(j, low) for j in range(len(self.sets)) for low in self._bits(self.openmask[j])]
        self.sets_with = {a: 0 for a in atoms}   # sets whose closure contains a
        self.tidx = {a: 0 for a in atoms}        # open questions whose closure with the conclusion contains a
        for j, (S, pm, F) in enumerate(self.sets):
            for low in self._bits(F & ALL):
                self.sets_with[self.id_of[low]] |= 1 << j
        for k, (j, low) in enumerate(self.openq):
            for x in self._bits(self.T[j, low] & ALL):
                self.tidx[self.id_of[x]] |= 1 << k
        self.set_index = {S: j for j, (S, _, _) in enumerate(self.sets)}
        # Per witness: unknown conclusions d, cl(sat ∪ {d}), which premise atoms each d would
        # bring in (the only trials a new rule can change), and the sets it already holds.
        self.trig, self.base, self.vmask = [], [], []
        for (H, Fm), m in zip(self.wit, self.witnesses):
            tr = {a: 0 for a in atoms}
            for low in self._bits(ALL & ~H & ~Fm):
                for x in self._bits(self._ext(H, self.id_of[low]) & ALL):
                    tr[self.id_of[x]] |= low
            self.trig.append(tr)
            self.base.append([j for j, (S, pm, F) in enumerate(self.sets) if pm & ~H == 0])
            self.vmask.append(BAD | self._mask(m["violates"]))
        # The scores accumulate the questions an answer settles as one mask over openq, so that a
        # witness or an exclusion contributes with a few big-integer operations instead of a loop:
        # qset[j] the questions of set j, qbit[j][cb] the one with conclusion cb, qcon[cb] all with
        # conclusion cb, coreq the core ones, openfalse the consistency questions still open, and
        # per witness the questions of the sets it holds and those its failures settle.
        self.qidx = {q: k for k, q in enumerate(self.openq)}
        self.qset, self.qbit, self.qcon, self.coreq = [0] * len(self.sets), [dict() for _ in self.sets], {}, 0
        for k, (j, low) in enumerate(self.openq):
            kb = 1 << k
            self.qset[j] |= kb
            self.qbit[j][low] = kb
            self.qcon[low] = self.qcon.get(low, 0) | kb
            if self.coremask[j] & low:
                self.coreq |= kb
        self.openfalse = sum(1 << j for j, st in enumerate(self.qfalse) if st == "open")
        self.base_q = [sum(self.qset[j] for j in b) for b in self.base]
        self.concF = [self._conc(Fm) for _, Fm in self.wit]
        self._subq_cache = {}

    # -- status -------------------------------------------------------------
    def open_questions(self):
        """Every open question as (premise ids, conclusion id)."""
        out = [(self.sets[j][0], self.id_of[low]) for j, low in self.openq]
        out += [(S, FALSE) for (S, _, _), st in zip(self.sets, self.qfalse) if st == "open"]
        return out

    def progress(self, *, include_selection: bool = False) -> dict:
        """Share of the questions settled; optionally include counts filterable by shown principles."""
        by = [[0, 0], [0, 0], [0, 0]]
        for (S, _, _), g, s, st in zip(self.sets, self.qmask, self.settled, self.qfalse):
            by[len(S)][0] += self._count(g) + (st is not None)
            by[len(S)][1] += self._count(s) + (st in ("proved", "refuted"))
        questions, settled = sum(q for q, _ in by), sum(x for _, x in by)
        out = {"premises": PROGRESS_PREMISES, "questions": questions, "settled": settled, "open": questions - settled, "by_premises": by}
        cq = cs = 0
        for (S, _, _), g, s, st, cm in zip(self.sets, self.qmask, self.settled, self.qfalse, self.coremask):
            cq += self._count(cm) + (st is not None)
            cs += self._count(s & cm) + (st in ("proved", "refuted"))
        out["core"] = {"questions": cq, "settled": cs, "open": cq - cs}
        if include_selection:
            # Each group is [premises, question-conclusion mask, settled-conclusion
            # mask, consistency status, core-conclusion mask]. Hex strings preserve masks beyond 53 bits
            # in JavaScript; their bit positions follow the principle IDs below.
            out["selection"] = {"principles": self.ids, "groups": [
                [list(S), hex(g), hex(s), st, hex(cm)]
                for (S, _, _), g, s, st, cm in zip(self.sets, self.qmask, self.settled, self.qfalse, self.coremask)
            ]}
        if self.inconsistent:
            out["inconsistent_background"] = True
        return out

    # -- answers ------------------------------------------------------------
    def _subsets_of(self, H):
        """Indices of the premise sets a model holding H holds; memoised on H."""
        out = self._subsets.get(H)
        if out is None:
            from itertools import combinations
            atoms = [self.id_of[low] for low in self._bits(H & self.ALL)]
            out = [0]
            out += [self.set_index[(a,)] for a in atoms if (a,) in self.set_index]
            out += [self.set_index[a, b] for a, b in combinations(atoms, 2) if (a, b) in self.set_index]
            out += [self.set_index[b, a] for a, b in combinations(atoms, 2) if (b, a) in self.set_index]
            self._subsets[H] = out
        return out

    def _refuted_by(self, c):
        """The open questions (as a mask over openq) whose closure with their conclusion hits a
        denied principle once c is added: the questions a rule concluding c would exclude. Depends
        on c alone."""
        mask = self._refutes.get(c)
        if mask is None:
            BAD, T, ext = self.BAD, self.T, self._ext
            bits = bytearray(len(self.openq) // 8 + 1)   # built as bytes: one big integer at the end
            for k, (j, cb) in enumerate(self.openq):
                if ext(T[j, cb], c) & BAD:
                    bits[k >> 3] |= 1 << (k & 7)
            mask = self._refutes[c] = int.from_bytes(bits, "little")
        return mask

    def _witness_under(self, i, c):
        """For witness i and conclusion c: its closure with c, and the unknown conclusions it would
        have to fail once the rule holds (those whose adjunction, closed with c, hits what it
        violates). Depend on the witness and c alone."""
        key = (i, c)
        out = self._witness_nf.get(key)
        if out is None:
            H, Fm = self.wit[i]
            ext, vmask, id_of = self._ext, self.vmask[i], self.id_of
            NF = 0
            for low in self._bits(self.ALL & ~H & ~Fm):
                if ext(ext(H, id_of[low]), c) & vmask:
                    NF |= low
            out = (ext(H, c), NF)
            self._witness_nf[key] = out
        return out

    def _extensions_of(self, H):
        """[(bit of p, closure of H with p)] for the principles p outside the closed set H; memoised."""
        out = self._ext_by.get(H)
        if out is None:
            ext, id_of = self._ext, self.id_of
            out = [(low, ext(H, id_of[low])) for low in self._bits(self.ALL & ~H)]
            self._ext_by[H] = out
        return out

    def _conc(self, M):
        """The open questions whose conclusion lies in the mask M."""
        out, qcon = 0, self.qcon
        for low in self._bits(M):
            out |= qcon.get(low, 0)
        return out

    def _settled_in(self, j, X):
        """The open questions of set j whose conclusion lies in the closure mask X."""
        out, qb = 0, self.qbit[j]
        for low in self._bits(X & self.openmask[j]):
            out |= qb[low]
        return out

    def _subsets_q(self, H):
        """For a model holding H: the questions of the premise sets it holds, and those sets as a
        mask over set indices; memoised on H."""
        out = self._subq_cache.get(H)
        if out is None:
            qs = ss = 0
            for j in self._subsets_of(H):
                qs |= self.qset[j]
                ss |= 1 << j
            out = (qs, ss)
            self._subq_cache[H] = out
        return out

    def _total(self, newly, newfalse, skip, both=False):
        """Open questions newly settled, from a mask over openq and a mask of sets whose consistency
        question is settled; with both, also the open core questions among them."""
        if skip is not None:
            j, c = skip
            if c == FALSE:
                newfalse &= ~(1 << j)
            else:
                k = self.qidx.get((j, self.bit[c]))
                if k is not None:
                    newly &= ~(1 << k)
        consistency = self._count(newfalse & self.openfalse)  # all have a premise: core
        n = self._count(newly) + consistency
        if not both:
            return n
        return n, self._count(newly & self.coreq) + consistency

    def with_rule(self, premises, conclusion, skip=None, both=False):
        """Other open questions settled by adding the Horn rule premises ⇒ conclusion."""
        bit, BAD, c = self.bit, self.BAD, conclusion
        S = tuple(premises)
        newly = newfalse = 0
        js = -1
        for x in S:
            js &= self.sets_with[x]
        js &= (1 << len(self.sets)) - 1
        for low in self._bits(js):
            j = low.bit_length() - 1
            X = self._ext(self.sets[j][2], c)
            if X & BAD:
                newly |= self.qset[j]
                newfalse |= low
            else:
                newly |= self._settled_in(j, X)
        if c == FALSE or c in self.toward_bad:
            ks = -1
            for x in S:
                ks &= self.tidx[x]
            ks &= (1 << len(self.openq)) - 1
            newly |= ks & self._refuted_by(c)
        pmS = sum(bit[x] for x in S)
        for i, (H, Fm) in enumerate(self.wit):
            grew = pmS & ~H == 0
            H2, NFc = self._witness_under(i, c) if grew else (H, None)
            if H2 & self.vmask[i]:
                continue  # no longer a model under the rule; impossible for an open question
            D = self.ALL & ~H & ~Fm
            for x in S:
                D &= self.trig[i][x]
            NF = (NFc if NFc is not None else self._witness_under(i, c)[1]) & D
            if H2 != H:
                qs, ss = self._subsets_q(H2)
                newly |= qs & (self.concF[i] | self._conc(NF))
                newfalse |= ss
            elif NF:
                newly |= self.base_q[i] & self._conc(NF)
        return self._total(newly, newfalse, skip, both)

    def with_model(self, satisfies, violates, skip=None, both=False):
        """Other open questions settled by a model satisfying `satisfies` and violating `violates`."""
        V = self.BAD | self._mask(violates)
        H = self._cl(satisfies)
        if H & V:
            return (0, 0) if both else 0  # not a model
        Fm = 0
        for low, X in self._extensions_of(H):
            if X & V:
                Fm |= low
        qs, ss = self._subsets_q(H)
        return self._total(qs & self._conc(Fm), ss, skip, both)

    # -- recorded conjectures ------------------------------------------------
    def question_of(self, ids, conclusion):
        """The question a record's premises and conclusion ask, (S, c) over class representatives
        with any premise the others already give dropped; None when c is no conclusion here."""
        rep_of = {x: cls[0] for cls in self.classes for x in cls}
        S = {rep_of[x] for x in ids if x in rep_of and rep_of[x] in self.proper}
        for x in sorted(S, key=self.proper.index):
            if x in S and len(S) > 1 and x in self.E.cl(S - {x})[0]:
                S.discard(x)
        c = FALSE if conclusion == FALSE else rep_of.get(conclusion)
        if c is None or c in S or (c != FALSE and c not in self.proper):
            return None
        return tuple(sorted(S, key=self.proper.index)), c

    def question_status(self, S, c):
        """open, proved, excluded, refuted, inconsistent or consistent; None for a question not asked here."""
        j = self.set_index.get(tuple(S))
        if j is None:
            return None
        F = self.sets[j][2]
        if c == FALSE:
            return {"proved": "inconsistent", "refuted": "consistent", "open": "open"}.get(self.qfalse[j])
        b = self.bit[c]
        if self.openmask[j] & b:
            return "open"
        if F & b:
            return "proved"
        if self._ext(F, c) & self.BAD:
            return "excluded"
        pm = self.sets[j][1]
        return "refuted" if any(H & pm == pm and Fm & b for H, Fm in self.wit) else "open"

    def settled_status(self, S, c):
        """The status of S ⊢ c for a question not asked here, whatever the size of S: one with more
        than two premises, or one that a smaller premise set settles, such as a premise that is
        inconsistent by itself. Inconsistent premises settle every such question, so the status is
        "inconsistent" whatever c is. None while the question stays open."""
        F, pm = self._cl(S), self._mask(S)
        if F & self.BAD:
            return "inconsistent"
        if c == FALSE:
            return "consistent" if any(H & pm == pm for H, _ in self.wit) else None
        b = self.bit[c]
        if F & b:
            return "proved"
        if self._ext(F, c) & self.BAD:
            return "excluded"
        return "refuted" if any(H & pm == pm and Fm & b for H, Fm in self.wit) else None

    def _recorded(self, rows):
        """One row per question a conjectured record asks, in the lynchpin format: the ranked row
        itself when the question is open, else an unranked row carrying the question's status
        ("outside": still open, with more than two premises). The record and its notes travel with
        the row, and a question unresolved despite work is bronze unless a record ranks it silver
        or gold."""
        by_question = {(tuple(r["premises"]), r["conclusion"]): r for r in rows if r["kind"] == "question"}
        by_check = {(r["model"], r["principle"]): r for r in rows if r["kind"] == "check"}
        rep_of = {p: cls[0] for cls in self.classes for p in cls}
        fitting = {m["id"] for m in self.witnesses}
        extra, seen = [], {}
        for rec in self.conjectures:
            if rec.get("model_check"):
                check = rec["model_check"]
                mid = check["model"]
                if mid not in fitting:
                    continue
                entry = {"id": rec["id"], "kind": "model", "notes": (rec.get("notes") or "").strip(), "tier": rec.get("tier")}
                for field, claim in (("satisfies", "entails"), ("violates", "not")):
                    for c in dict.fromkeys(rep_of[p] for p in check[field]):
                        key = (mid, c)
                        row = by_check.get(key)
                        if row is None:
                            status = "proved" if c in self.E.holds[mid] else "refuted" if c in self.E.fails[mid] else "open"
                            row = {"kind": "check", "model": mid, "principle": c, "status": status,
                                   "rank": None, "yes": None, "no": None}
                            by_check[key] = row
                            extra.append(row)
                        if not any(item["id"] == rec["id"] for item in row.get("conjectures", [])):
                            row.setdefault("conjectures", []).append(entry)
                        row.setdefault("claim", claim)
                continue
            if "premises" in rec:
                asked, kind = [(rec["premises"], rec["conclusion"])], "result"
            else:
                asked, kind = [(rec["satisfies"], v) for v in [*rec["violates"], FALSE]], "model"
            entry = {"id": rec["id"], "kind": kind, "notes": (rec.get("notes") or "").strip(), "tier": rec.get("tier")}
            for ids, concl in asked:
                q = self.question_of(ids, concl)
                if q is None or q == ((), FALSE):  # the background's own consistency is no question of the map
                    continue
                S, c = q
                row = by_question.get((S, c)) if len(S) <= 2 else None
                if row is None:
                    row = seen.get((S, c))
                    if row is None:
                        status = self.question_status(S, c) if len(S) <= 2 else None
                        status = status or self.settled_status(S, c) or "outside"
                        row = seen[S, c] = {"kind": "question", "premises": list(S), "conclusion": c,
                                            "rank": None, "yes": None, "no": None, "status": status}
                        extra.append(row)
                row.setdefault("conjectures", []).append(entry)
                # A result conjectures the entailment; a model conjectures against it.
                row.setdefault("claim", "entails" if kind == "result" else "not")
        ranked = [r for r in rows if r.get("conjectures")]
        for row in ranked + extra:
            tiers = [c["tier"] or "bronze" for c in row["conjectures"] if c["notes"] or c["tier"]]
            if tiers:
                row["tier"] = max(tiers, key=LYNCHPIN_TIERS.index)
            if row.get("status", "open") in LYNCHPIN_VERDICTS:
                row["verdict"] = LYNCHPIN_VERDICTS[row["status"]][row["claim"]]
                # Inconsistent premises give an implication only vacuously: incompatible, as resolve_conjecture says.
                if row["status"] == "inconsistent" and row.get("conclusion") != FALSE and row["claim"] == "entails":
                    row["verdict"] = "incompatible"
        ranked.sort(key=lambda r: r.get("rank") or 0)
        extra.sort(key=lambda r: (-LYNCHPIN_TIERS.index(r.get("tier", "bronze")), r["status"],
                                 r.get("premises", []), r.get("model", ""), r.get("conclusion", r.get("principle", ""))))
        return ranked + extra

    # -- ranking ------------------------------------------------------------
    def _question_rows(self):
        rows = [{"kind": "question", "premises": list(self.sets[j][0]), "conclusion": self.id_of[low]} for j, low in self.openq]
        rows += [{"kind": "question", "premises": list(S), "conclusion": FALSE}
                 for (S, _, _), st in zip(self.sets, self.qfalse) if st == "open"]
        for i, m in enumerate(self.witnesses):
            H, Fm = self.wit[i]
            rows += [{"kind": "check", "model": m["id"], "principle": self.id_of[low]} for low in self._bits(self.ALL & ~H & ~Fm)]
        return rows

    def _is_core(self, r):
        if r["kind"] != "question":
            return False
        S, c = tuple(r["premises"]), r["conclusion"]
        return len(S) <= 1 or c == FALSE or bool(self.coremask[self.set_index[S]] & self.bit[c])

    def _score(self, r):
        if r["kind"] == "check":
            m = next(m for m in self.witnesses if m["id"] == r["model"])
            r["yes"] = self.with_model([*m["satisfies"], r["principle"]], m["violates"])
            r["no"] = self.with_model(m["satisfies"], [*m["violates"], r["principle"]])
        else:
            S, c = tuple(r["premises"]), r["conclusion"]
            j = self.set_index[S]
            r["yes"] = self.with_rule(S, c, (j, c))
            r["no"] = self.with_model(S, [c] if c != FALSE else [], (j, c))
        r["score"] = round(2 * r["yes"] * r["no"] / (r["yes"] + r["no"]), 1) if r["yes"] + r["no"] else 0.0

    def _group_questions(self, rows):
        """Equivalent premises, and conclusions equivalent under those premises.

        cl(S) = cl(T) exactly when the premise sets entail each other in the background.
        cl(S + c) = cl(S + d) exactly when each conclusion entails the other given S.
        Scores alone are not evidence of equivalence. Model checks stay separate.
        """
        groups = {}
        for r in rows:
            if r["kind"] == "question":
                S = tuple(r["premises"])
                F = self.sets[self.set_index[S]][2]
                key = ("question", F, self._ext(F, r["conclusion"]))
            else:
                key = ("check", r["model"], r["principle"])
            groups.setdefault(key, []).append(r)
        return list(groups.values())

    @staticmethod
    def _group_summary(group):
        if len(group) == 1:
            return group[0]
        row = dict(group[0])
        premise_sets = list(dict.fromkeys(tuple(r["premises"]) for r in group))
        conclusions = list(dict.fromkeys(r["conclusion"] for r in group))
        if len(premise_sets) > 1:
            row["premise_sets"] = [list(S) for S in premise_sets]
        if len(conclusions) > 1:
            row["conclusions"] = conclusions
        records = {(c["kind"], c["id"]): c for r in group for c in r.get("conjectures", [])}
        if records:
            row["conjectures"] = list(records.values())
        tiers = [r["tier"] for r in group if r.get("tier")]
        if tiers:
            row["tier"] = max(tiers, key=LYNCHPIN_TIERS.index)
        return row

    def rank(self, top: int | None = 50, score_all: bool = True) -> dict:
        """The open questions and model checks scored for both answers, in two orders, and the
        questions recorded conjectures ask. Equivalent premise sets and conditionally equivalent
        conclusions share a ranked row. With top=None, retain every ranked group.

        The central questions are ranked by the harmonic mean of the two scores: if each answer is
        as likely as the map leaves room for it, inversely to how much it would settle, that is the
        number of other questions an answer is expected to settle, so a question that only matters
        if it comes out the implausible way sinks. The automatically generated conjectures are the
        same questions by their larger score, each stated as the answer to expect: ⊢ when a
        refutation would settle more, ⊬ when a proof would. With score_all false, only the recorded
        conjectures are scored and nothing is ranked: what a sparse map still gets.
        """
        full = getattr(self, "_full_rank", None)   # ranked already, in a worker process
        if full is not None and score_all:
            return full if top is None else {**full, "rows": full["rows"][:top], "auto": full["auto"][:top]}
        if self._rows is None:
            self._rows = self._question_rows()
        rows = self._rows
        if score_all and self._ranked is None:
            for r in rows:
                self._score(r)
            name = lambda r: (r["kind"], str(r.get("premises", r.get("model"))), str(r.get("conclusion", r.get("principle"))))
            auto = self._group_questions(sorted(rows, key=lambda r: (-max(r["yes"], r["no"]), -min(r["yes"], r["no"]), *name(r))))
            for i, group in enumerate(auto):
                for r in group:
                    r["auto_rank"] = i + 1
                    r["auto_claim"] = "entails" if r["no"] >= r["yes"] else "not"
            central = self._group_questions(sorted(rows, key=lambda r: (-r["score"], -min(r["yes"], r["no"]), -max(r["yes"], r["no"]), *name(r))))
            for i, group in enumerate(central):
                for r in group:
                    r["rank"] = i + 1
            # The core questions: a group is core when one of its equivalent forms is. Each answer is
            # scored by the open core questions it settles, the question itself included (so at least
            # 1), and the question by the geometric mean of the two.
            core = [g for g in central if any(self._is_core(r) for r in g)]
            for g in core:
                S, c = tuple(g[0]["premises"]), g[0]["conclusion"]
                j = self.set_index[S]
                y = self.with_rule(S, c, (j, c), both=True)[1]
                n = self.with_model(S, [c] if c != FALSE else [], (j, c), both=True)[1]
                for r in g:
                    r["core_yes"], r["core_no"] = y + 1, n + 1
                    r["core_score"] = round(((y + 1) * (n + 1)) ** 0.5, 2)
            core.sort(key=lambda g: (-g[0]["core_score"], -min(g[0]["core_yes"], g[0]["core_no"]), -max(g[0]["core_yes"], g[0]["core_no"]), *name(g[0])))
            for i, group in enumerate(core):
                for r in group:
                    r["core_rank"] = i + 1
            self._ranked, self._auto = central, auto
        if self._recorded_rows is None:  # attach once: the rows are shared, and rank() is asked more than once per build
            self._recorded_rows = self._recorded(rows)
        recorded = self._recorded_rows
        for r in recorded:
            r.setdefault("rank", None)
            if r.get("status", "open") == "open" and "yes" not in r:
                self._score(r)
        p = self.progress()
        return {"inconsistent_background": self.inconsistent, "classes": self.classes, "trivial": self.trivial,
                "fitting_models": [m["id"] for m in self.witnesses], "progress": p, "open": p["open"],
                "rows": [self._group_summary(g) for g in self._ranked[:top]] if self._ranked is not None else [],
                "auto": [self._group_summary(g) for g in self._auto[:top]] if self._auto is not None else [], "recorded": recorded}

LYNCHPIN_MAX_OPEN = 0.75  # bundles skip a map in which more of its implication questions than this are open
PROGRESS_PREMISES = 2  # the settled share counts implication questions with up to this many premises
_PROGRESS_CACHE: dict = {}


def _engines_key(data: dict) -> str:
    """What the engines, and so the rankings, depend on: the records' logical content."""
    return json.dumps([data["topic"].get("id"), data["topic"].get("background", []), data["topic"].get("background_presets", []),
                       [p["id"] for p in data["principles"]],
                       [(r["id"], sorted(r["premises"]), r["conclusion"], r["status"]) for r in data["results"]],
                       [(m["id"], sorted(m["satisfies"]), sorted(m["violates"]), m["status"], m.get("model_check")) for m in data["models"]]],
                      sort_keys=True, default=str)


def _engines(data: dict) -> list:
    """(background id, name, Lynchpins) under the topic background and each preset, cached on the records."""
    key = _engines_key(data)
    if key not in _PROGRESS_CACHE:
        if data["topic"].get("draft"):
            _PROGRESS_CACHE.clear()
            _PROGRESS_CACHE[key] = []  # a draft topic: nothing is ranked, shared or listed
            return []
        engines = [(None, None, Lynchpins(data))]
        engines += [(p["id"], p["name"], Lynchpins(data, p["principles"])) for p in data["topic"].get("background_presets", [])]
        _PROGRESS_CACHE.clear()
        _PROGRESS_CACHE[key] = engines
    return _PROGRESS_CACHE[key]


def _open_share(p: dict) -> float:
    return p["open"] / p["questions"] if p["questions"] else 0.0


def progress_report(data: dict) -> list[dict]:
    """The settled share under the topic background and under each preset; see Lynchpins.progress."""
    return [{"background": bid, "name": name, "principles": L.background, "negative": [], **L.progress(include_selection=True)}
            for bid, name, L in _engines(data)]


# ---------------------------------------------------------------------------- progress history
# The settled counts over time, for the chart on the Changes tab: one point for each day of the
# published branch's first-parent history (its last commit that day), for the whole map under the
# topic background alone. Each commit is loaded by its own pmap.py, which knows its record
# format; only the engine's inputs are kept, and today's Lynchpins counts them, so the series
# stays comparable. Bump HISTORY_VERSION when what counts as a question changes: `pmap.py
# history` then recounts every point. The ledger is written only by that command, never by a
# build, which adds the current records as a live point of its own.
HISTORY_REF = "origin/main"
HISTORY_VERSION = 1
_HISTORY_EXTRACT = r"""
import json, sys
sys.path.insert(0, 'scripts')
import pmap
d = pmap.load_topic(sys.argv[1])
keep = lambda x, ks: {k: x.get(k) for k in ks}
json.dump({"topic": {"id": d["topic"].get("id"), "background": d["topic"].get("background") or []},
           "principles": [keep(p, ("id", "name")) for p in d["principles"]],
           "results": [keep(r, ("id", "premises", "conclusion", "status")) for r in d["results"]],
           "models": [keep(m, ("id", "satisfies", "violates", "status")) for m in d["models"]]},
          open(sys.argv[2], "w"))
"""


def history_path(topic_id: str) -> Path:
    return TOPICS / topic_id / "history.json"


def history_counts(data: dict) -> dict:
    """The counts one point of the history records, under the topic background alone."""
    p = Lynchpins(data).progress()
    return {"principles": len(data["principles"]),
            "results": sum(r.get("status") == "proved" for r in data["results"]),
            "models": sum(m.get("status") == "proved" for m in data["models"]),
            "questions": p["questions"], "settled": p["settled"],
            "core_questions": p["core"]["questions"], "core_settled": p["core"]["settled"]}


def _history_inputs(topic_id: str, commit: str) -> dict | None:
    """The engine's inputs at a commit, read by that commit's own loader; None if it has no topic."""
    import subprocess, tempfile, tarfile, io
    repo = ROOT.parent
    prefix = ROOT.relative_to(repo).as_posix()
    paths = [f"{prefix}/scripts", f"{prefix}/schema", f"{prefix}/topics/{topic_id}"]
    paths = [x for x in paths if subprocess.run(["git", "cat-file", "-e", f"{commit}:{x}"], cwd=repo, capture_output=True).returncode == 0]
    if not any(x.endswith(f"/topics/{topic_id}") for x in paths):
        return None
    tar = subprocess.run(["git", "archive", commit, *paths], cwd=repo, capture_output=True, check=True).stdout
    with tempfile.TemporaryDirectory() as tmp:
        with tarfile.open(fileobj=io.BytesIO(tar)) as t:
            t.extractall(tmp, filter="data")
        out = Path(tmp) / "inputs.json"
        run = subprocess.run([sys.executable, "-c", _HISTORY_EXTRACT, topic_id, str(out)],
                             cwd=Path(tmp) / prefix, capture_output=True, text=True)
        if run.returncode or not out.exists():
            raise RuntimeError(f"{commit[:8]}: its loader failed: {run.stderr.strip().splitlines()[-1:] or run.returncode}")
        inputs = json.loads(out.read_text())
    # Older loaders may leave a status out; read it as the loader of the day did, as proved.
    for x in inputs["results"] + inputs["models"]:
        x["status"] = x.get("status") or "proved"
        for k in ("premises", "satisfies", "violates"):
            if k in x:
                x[k] = x[k] or []
    return inputs


def update_history(topic_id: str, ref: str = HISTORY_REF, rebuild: bool = False) -> Path:
    """Add to the ledger a point for each day of ref's first-parent history it lacks."""
    import subprocess
    path = history_path(topic_id)
    old = json.loads(path.read_text()) if path.exists() else {}
    known = {} if rebuild or old.get("version") != HISTORY_VERSION else {x["commit"]: x for x in old.get("points", [])}
    log = subprocess.run(["git", "log", ref, "--first-parent", "--format=%H %cd", "--date=short"],
                         cwd=ROOT.parent, capture_output=True, text=True, check=True).stdout.split("\n")
    last = {}
    for line in reversed([x for x in log if x.strip()]):   # oldest first; a later commit that day replaces an earlier one
        commit, day = line.split()
        last[day] = commit
    points = []
    for day, commit in sorted(last.items()):
        short = commit[:8]
        if short in known:
            points.append(known[short]); continue
        inputs = _history_inputs(topic_id, commit)
        if inputs is None:
            continue
        point = {"date": day, "commit": short, **history_counts(inputs)}
        print(f"{day} {short}: {point['settled']:,} of {point['questions']:,} settled; core {point['core_settled']:,} of {point['core_questions']:,}")
        points.append(point)
    path.write_text(json.dumps({"version": HISTORY_VERSION, "ref": ref, "points": points}, indent=1) + "\n", encoding="utf-8")
    return path


def history_export(topic_id: str, data: dict) -> dict | None:
    """The ledger's points for the viewer, with the current records as a live point."""
    path = history_path(topic_id)
    ledger = json.loads(path.read_text()) if path.exists() else {}
    points = ledger.get("points", []) if ledger.get("version") == HISTORY_VERSION else []
    live = {"date": _dt.date.today().isoformat(), "live": True, **history_counts(data)}
    return {"ref": ledger.get("ref", HISTORY_REF), "points": points, "live": live}


def lynchpin_report(data: dict, *, sparse_ok: bool = True, top: int | None = 50) -> dict:
    """Rankings under the topic background alone and under each background preset.

    With sparse_ok false, a map in which most questions are still open is not ranked: there
    every answer settles many others only because almost nothing is recorded, and ranking it
    costs minutes for nothing.
    """
    engines = _engines(data)
    if not engines:
        return {"skipped": "a draft topic: nothing is ranked, shared or listed", "reports": []}
    share = _open_share(engines[0][2].progress())
    skipped = (f"{share:.0%} of the questions are open, so the map is too sparse for lynchpins to mean anything"
               if not sparse_ok and share > LYNCHPIN_MAX_OPEN else None)
    if skipped is None:
        _load_cached_rankings(data, engines)
        _rank_in_parallel([L for _, _, L in engines])
        _save_cached_rankings(data, engines)
    return {"skipped": skipped,
            "reports": [{"background": bid, "name": name, "principles": L.background, "negative": [], **L.rank(top, score_all=skipped is None)}
                        for bid, name, L in engines]}


# The rankings depend only on the records the engines are keyed on and on this file, so a build
# whose records have not changed since the last one reads them back instead of scoring again;
# an edit to a write-up, the viewer or a note then costs no ranking time. The cache lives in
# .cache/rankings/, outside the exports and ignored by Git.
RANKINGS_CACHE = ROOT / ".cache" / "rankings"


def _rankings_key(data: dict) -> str:
    import hashlib
    key = json.dumps([_engines_key(data), hashlib.sha256(Path(__file__).read_bytes()).hexdigest()], sort_keys=True, default=str)
    return hashlib.sha256(key.encode("utf-8")).hexdigest()


def _load_cached_rankings(data: dict, engines: list) -> None:
    path = RANKINGS_CACHE / f"{data['topic'].get('id')}-{_rankings_key(data)}.json"
    if not path.exists():
        return
    try:
        cached = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, ValueError):
        return
    if cached.get("backgrounds") != [bid for bid, _, _ in engines]:
        return
    for (bid, _, L), full in zip(engines, cached["full"]):
        if getattr(L, "_full_rank", None) is None and L._ranked is None:
            L._full_rank = full


def _save_cached_rankings(data: dict, engines: list) -> None:
    fulls = [getattr(L, "_full_rank", None) or L.rank(top=None) for _, _, L in engines]
    try:
        RANKINGS_CACHE.mkdir(parents=True, exist_ok=True)
        for old in RANKINGS_CACHE.glob(f"{data['topic'].get('id')}-*.json"):
            old.unlink()
        (RANKINGS_CACHE / f"{data['topic'].get('id')}-{_rankings_key(data)}.json").write_text(
            json.dumps({"backgrounds": [bid for bid, _, _ in engines], "full": fulls}, ensure_ascii=False, default=str), encoding="utf-8")
    except OSError:
        pass


_PARALLEL_ENGINES: list | None = None


def _rank_worker(i: int) -> dict:
    return _PARALLEL_ENGINES[i].rank(top=None)


def _rank_in_parallel(engines: list) -> None:
    """Score the open questions of every background at once, one forked process per background,
    when there is more than one to do and the machine can fork: scoring is pure Python over bit
    sets and takes minutes per background, and the backgrounds are independent. Each engine then
    serves its ranking from `_full_rank`. PMAP_JOBS=1 keeps it serial."""
    import multiprocessing, os
    global _PARALLEL_ENGINES
    todo = [L for L in engines if getattr(L, "_full_rank", None) is None and L._ranked is None]
    jobs = int(os.environ.get("PMAP_JOBS") or (os.cpu_count() or 1))
    if len(todo) < 2 or jobs < 2 or not hasattr(os, "fork"):
        return
    _PARALLEL_ENGINES = todo
    try:
        with multiprocessing.get_context("fork").Pool(min(jobs, len(todo))) as pool:
            results = pool.map(_rank_worker, range(len(todo)))
    except Exception as e:  # pragma: no cover - the serial path then does the work
        print(f"  parallel ranking unavailable ({e}); ranking serially", file=sys.stderr)
        return
    finally:
        _PARALLEL_ENGINES = None
    for L, result in zip(todo, results):
        L._full_rank = result


def progress_text(p: dict) -> str:
    """One line for reports: the share as the viewer shows it, then the counts."""
    if p.get("inconsistent_background") or not p["questions"]:
        return "no settled share: the background is inconsistent" if p.get("inconsistent_background") else "no questions"
    pct = 100 if not p["open"] else min(99, 100 * p["settled"] // p["questions"])
    k = "two" if p["premises"] == 2 else p["premises"]
    return f"{pct}% of questions with up to {k} premises settled ({p['settled']} of {p['questions']})"


def _lynchpin_label(report: dict, names: dict):
    """Name a class representative; the class of theorems is named after the preset, else True as in the viewer."""
    trivial = set(report["trivial"])
    title = report["name"] or "True"
    return lambda x: title if x in trivial else names.get(x, x)


LYNCHPIN_TIERS = ["bronze", "silver", "gold"]
# The verdict on a conjecture from the status of the question it asks, by what it claims.
LYNCHPIN_VERDICTS = {"proved": {"entails": "proved", "not": "refuted"}, "refuted": {"entails": "refuted", "not": "proved"},
                     "excluded": {"entails": "refuted", "not": "proved"}, "inconsistent": {"entails": "proved", "not": "refuted"},
                     "consistent": {"entails": "refuted", "not": "proved"}}


def lynchpin_row_text(r: dict, nm, conjecture: bool = False, auto: bool = False) -> str:
    """S ⊢ c for a question, model: principle for a model check; a starred tier marks a recorded
    conjecture. As a recorded conjecture, ⊬ when the record denies the entailment; as an automatically
    generated one, ⊬ when a proof would be the bigger surprise."""
    star = f" ★ {r['tier']}" if r.get("tier") else ""
    claim = r.get("auto_claim") if auto else r.get("claim") if conjecture else None
    if r["kind"] == "check":
        return f"{r['model']}: {'¬' if claim == 'not' else ''}{nm(r['principle'])}{star}"
    turnstile = "⊬" if claim == "not" else "⊢"
    premise_sets = r.get("premise_sets", [r["premises"]])
    antecedents = []
    for S in premise_sets:
        text = ' ∧ '.join(nm(x) for x in S) or '⊤'
        antecedents.append(f"({text})" if len(premise_sets) > 1 and len(S) > 1 else text)
    conclusions = ' or '.join(nm(c) for c in r.get("conclusions", [r["conclusion"]]))
    return f"{' or '.join(antecedents)} {turnstile} {conclusions}{star}"


def lynchpin_scores(r: dict) -> tuple:
    """(if yes, if no) for a recorded conjecture: what confirming or refuting it would settle."""
    return (r["no"], r["yes"]) if r.get("claim") == "not" else (r["yes"], r["no"])


def lynchpin_auto_scores(r: dict) -> tuple:
    """(if yes, if no) for an automatically generated conjecture, relative to the answer it expects."""
    return (r["no"], r["yes"]) if r.get("auto_claim") == "not" else (r["yes"], r["no"])


def lynchpin_notes(r: dict) -> list:
    """(record id, notes) for each conjectured record with notes that asks this row's question."""
    return [(c["id"], c["notes"]) for c in r.get("conjectures", []) if c["notes"]]


def _lynchpin_heading(report: dict) -> str:
    if report["name"]:
        return f"Under {report['name']}"
    return "Under the topic background" if report["principles"] else "Under no extra assumptions"


def lynchpin_text(report: dict, names: dict, top: int = 10) -> list[str]:
    nm = _lynchpin_label(report, names)
    o = [f"-- {_lynchpin_heading(report)} --"]
    if report["inconsistent_background"]:
        return o + ["background is inconsistent; nothing is open"]
    o.append(f"{len(report['classes'])} classes, {len(report['fitting_models'])} fitting models; "
             f"{report['open']} open questions with up to {PROGRESS_PREMISES} premises")
    o.append(progress_text(report["progress"]))
    if _open_share(report["progress"]) > LYNCHPIN_MAX_OPEN:
        o.append(f"note: {_open_share(report['progress']):.0%} of the questions are open; these scores mostly reflect how little is recorded")
    if report["rows"]:
        o += ["central questions, by the harmonic mean of what either answer settles (rank, if yes / if no; ★ a recorded conjecture: bronze for notes, silver or gold by hand):"]
        o += [f"#{r['rank']:<6d}{r['yes']:5d} /{r['no']:4d}   {lynchpin_row_text(r, nm)}" for r in report["rows"][:top]]
    o += ["conjectures, each as the question it asks (⊢ claims the entailment, ⊬ denies it; if yes / if no are what confirming or refuting it settles; — where it is settled or has more than two premises):"]
    for r in report["recorded"]:
        yes, no = lynchpin_scores(r)
        o.append(f"{'#' + str(r['rank']) if r['rank'] else '—':<7}{_score_text(yes):>5} /{_score_text(no):>4}   {lynchpin_row_text(r, nm, True)}{_status_text(r)}   ({', '.join(c['id'] for c in r['conjectures'])})")
    if not report["recorded"]:
        o.append("        none")
    if report["auto"]:
        o += ["automatically generated conjectures: questions ranked by how many questions would be settled by a negative result (“if no” rank, if yes / if no):"]
        o += [f"#{r['auto_rank']:<6d}{lynchpin_auto_scores(r)[0]:5d} /{lynchpin_auto_scores(r)[1]:4d}   {lynchpin_row_text(r, nm, auto=True)}" for r in report["auto"][:top]]
    return o


def _score_text(x) -> str:
    return "—" if x is None else str(x)


def _status_text(r: dict) -> str:
    """A settled conjecture's verdict, or that it has more than two premises."""
    status = r.get("status", "open")
    return "" if status == "open" else f"  [{'more than two premises' if status == 'outside' else r.get('verdict', status)}]"


def lynchpin_md(lynch: dict, data: dict, topic_id: str, top: int = 5) -> list[str]:
    """Markdown section for OPEN-QUESTIONS.md."""
    names = {p["id"]: p["name"] for p in data["principles"]}
    names[FALSE] = "⊥"
    if lynch["skipped"]:
        o = [f"Not ranked: {lynch['skipped']}. A map is ranked once at most {LYNCHPIN_MAX_OPEN:.0%} of its "
             "questions are open. Its conjectures are still listed and scored below.", ""]
        for rep in lynch["reports"]:
            nm = _lynchpin_label(rep, names)
            o += [f"### {_lynchpin_heading(rep)}", ""]
            if rep["recorded"]:
                o += ["| Rank | Conjecture | if yes | if no | record |", "|---:|---|---:|---:|---|"]
                o += [f"| — | {lynchpin_row_text(r, nm, True)}{_status_text(r)} | {_score_text(lynchpin_scores(r)[0])} | {_score_text(lynchpin_scores(r)[1])} | {', '.join('`' + c['id'] + '`' for c in r['conjectures'])} |" for r in rep["recorded"]]
                o += [""]
            else:
                o += ["No conjectures.", ""]
        return o
    o = ["Answering a central question settles many other open questions. A question is S ⊢ c, whether S "
         "entails c, for S at most two principle classes (True, with none) and c a class or False, asked only "
         "where no smaller premise set already proves or excludes c; S ⊢ False asks whether S is inconsistent. "
         "\"No\" denies the entailment, not the conditional. A "
         "question is settled alike by a proof, by an exclusion (S ∧ c ⇒ False) or by a recorded model "
         "that holds S and fails c. Each row scores an open question by the number of *other* open "
         "questions that stop being open once the answer joins the proved records. Both answers are "
         "scored, because proving a strong conjecture settles everything below it while refuting a weak "
         "one settles everything above it; a question with two high scores is worth answering either "
         "way. A refutation is scored by its least informative countermodel, so an actual model settles "
         "at least as much. A model check (model: principle) scores deciding an unknown verdict inside "
         "a recorded model, which settles questions exactly as a proof does. Under a background, only "
         "models of that background count and the class of its theorems is named after it (True, with "
         f"no preset). Recompute with `python3 scripts/pmap.py lynchpins {topic_id}`.", ""]
    for rep in lynch["reports"]:
        nm = _lynchpin_label(rep, names)
        o += [f"### {_lynchpin_heading(rep)}", ""]
        if rep["inconsistent_background"]:
            o += ["The background is inconsistent; nothing is open under it.", ""]
            continue
        o += [f"{len(rep['classes'])} classes and {len(rep['fitting_models'])} fitting models; "
              f"{rep['open']} open questions. {progress_text(rep['progress']).capitalize()}.", ""]
        rows = rep["rows"][:top]
        if rows:
            o += ["Central questions, by the harmonic mean of what either answer would settle: the questions worth "
                  "working on, since one that only matters if it comes out the implausible way sinks.", "",
                  "| Rank | Question | if yes | if no |", "|---:|---|---:|---:|"]
            o += [f"| {r['rank']} | {lynchpin_row_text(r, nm)} | {r['yes']} | {r['no']} |" for r in rows]
            o += [""]
        elif not lynch["skipped"]:
            o += ["Nothing is open.", ""]
        if rep["recorded"]:
            o += ["Conjectures, each as the question it asks, in the same format: ⊢ claims the entailment and ⊬ "
                  "denies it, and if yes / if no are what confirming or refuting the conjecture would settle. A "
                  "settled conjecture shows its verdict and no rank or scores; one with more than two premises is "
                  "marked. ★ bronze for notes, silver or gold where a record ranks it by importance and difficulty.", "",
                  "| Rank | Conjecture | if yes | if no | record |", "|---:|---|---:|---:|---|"]
            o += [f"| {r['rank'] or '—'} | {lynchpin_row_text(r, nm, True)}{_status_text(r)} | {_score_text(lynchpin_scores(r)[0])} | {_score_text(lynchpin_scores(r)[1])} | {', '.join('`' + c['id'] + '`' for c in r['conjectures'])} |" for r in rep["recorded"]]
            o += [""]
        if rep["auto"]:
            o += ["Automatically generated conjectures: questions ranked by how many questions would be settled by a negative result.", "",
                  "| “If no” rank | Conjecture | if yes | if no |", "|---:|---|---:|---:|"]
            o += [f"| {r['auto_rank']} | {lynchpin_row_text(r, nm, auto=True)} | {lynchpin_auto_scores(r)[0]} | {lynchpin_auto_scores(r)[1]} |" for r in rep["auto"][:top]]
            o += [""]
    return o


def lynchpins(topic_id: str, backgrounds=None, top: int = 10, as_json: bool = False):
    data = load_topic(topic_id)
    names = {FALSE: "⊥", **{p["id"]: p["name"] for p in data["principles"]}}
    presets = {p["id"]: p for p in data["topic"].get("background_presets", [])}
    wanted = backgrounds or ["none", *presets]
    for key in wanted:
        if key != "none" and key not in presets:
            sys.exit(f"{topic_id}: no background preset '{key}' (have: {', '.join(presets) or 'none'})")
    engines = {bid or "none": (name, L) for bid, name, L in _engines(data)}
    if not engines:
        print(f"{topic_id}: a draft topic; nothing is ranked")
        return
    sparse = _open_share(engines["none"][1].progress()) > LYNCHPIN_MAX_OPEN
    if sparse:
        print(f"{topic_id}: over {LYNCHPIN_MAX_OPEN:.0%} of the questions are open; too sparse to rank, conjectures only")
    reports = [{"background": None if key == "none" else key, "name": engines[key][0], "principles": engines[key][1].background,
                "negative": [], **engines[key][1].rank(top, score_all=not sparse)} for key in wanted]
    if as_json:
        print(json.dumps(reports, indent=1, ensure_ascii=False))
        return
    print(f"== {data['topic']['title']} — central questions ==")
    for rep in reports:
        print("\n".join(lynchpin_text(rep, names, top)))


# ----------------------------------------------------------------------------
# Validation
# ----------------------------------------------------------------------------

def _argument_by_date(a: dict, rec: dict) -> tuple[str, str]:
    """An argument's author and date; both default to the record's certificate."""
    cert = rec.get("certificate") if isinstance(rec.get("certificate"), dict) else {}
    return str(a.get("by") or cert.get("produced_by") or ""), str(a.get("date") or cert.get("date") or "")


def _argument_target(data: dict, address: str):
    """The argument that <record>#<id> names, or the shared argument that <group>#<id> names, or None."""
    rid, _, aid = address.partition("#")
    rec = next((s for s in data.get("model_sources", []) if s.get("id") == rid), None)
    if rec is not None:
        return next((a for _, a in _arguments(rec) if isinstance(a, dict) and a.get("id") == aid and not a.get("group") and not a.get("general")), None)
    group = next((g for g in data.get("groups", []) if g.get("id") == rid), None)
    return next((c for c in group.get("arguments") or [] if isinstance(c, dict) and c.get("id") == aid), None) if group else None


def provenance_records(side: dict) -> list:
    """The model records a provenance sidecar belongs to: one folded record, or each record an
    admission added to."""
    if "records" in side:
        return [e.get("record") for e in side.get("records") or [] if isinstance(e, dict)]
    return [side.get("record")]


def trawl_block(side: dict, record_id: str):
    """The certificate.trawl block a record had, rebuilt from its admission's sidecar."""
    entry = next((e for e in side.get("records") or [] if isinstance(e, dict) and e.get("record") == record_id), None)
    if entry is None or not isinstance(side.get("trawl"), dict):
        return None
    return {**side["trawl"], "discovery": entry.get("discovery"), "evidence": entry.get("evidence")}


def _actor_label(actor) -> str:
    """A trawl actor as the trawl runner labels it: provider/model, or a person's name."""
    if not isinstance(actor, dict):
        return str(actor or "")
    if actor.get("kind") == "human":
        return str(actor.get("name", ""))
    return f"{actor.get('provider', '')}/{actor.get('reported_model', actor.get('model', ''))}"


def provenance_chain(side: dict, record_id: str):
    """Who found, reviewed and admitted what a theorem-trawl admission added to a record."""
    block = trawl_block(side, record_id)
    if block is None:
        return None
    found, admitted = block.get("discovery") or {}, block.get("admission") or {}
    reviews = []
    for r in block.get("reviews") or []:
        report = r.get("report") or {}
        reviews.append({"by": _actor_label(r.get("actor")), "at": r.get("at"), "verdict": report.get("verdict"),
                        **{k: report.get(k) for k in ("summary", "argument_check", "source_check", "issues")}})
    return {"found_by": _actor_label(found.get("actor")), "found_at": found.get("at"), "reviews": reviews,
            "admitted_by": admitted.get("by"), "admitted_at": admitted.get("at"),
            "checkpoint": block.get("candidate_id"), "source_commit": (block.get("source") or {}).get("commit")}


def provenance_export(side: dict) -> dict:
    """A provenance sidecar as the viewer reads it: each record's chain, or the record folded in."""
    if "records" in side:
        return {"id": side.get("id"), "file": side.get("_file"),
                "records": {r: provenance_chain(side, r) for r in provenance_records(side)}}
    return {"id": side.get("id"), "file": side.get("_file"), "folded": True, "record": side.get("record")}


def chain_md(chain: dict) -> str:
    """One line: found by, reviewed by (verdict), admitted by, with dates."""
    day = lambda t: str(t or "")[:10]
    parts = [f"Found by {chain['found_by']}, {day(chain['found_at'])}"]
    parts += [f"reviewed by {r['by']}, {day(r['at'])} ({r['verdict']})" for r in chain["reviews"]]
    parts.append(f"admitted by {chain['admitted_by']}, {day(chain['admitted_at'])}")
    return "; ".join(parts) + "."


def _argument_checks(a: dict, where: str, ids, papers, writeups: Path, data: dict) -> list[str]:
    """What is wrong with one argument or shared argument on its own."""
    errors = []
    holds = a.get("holds") if isinstance(a.get("holds"), list) else []
    fails = a.get("fails") if isinstance(a.get("fails"), list) else []
    if not holds and not fails:
        errors.append(f"{where}: settles nothing; give holds or fails")
    if not any(a.get(k) for k in ARGUMENT_REASONS):
        errors.append(f"{where}: gives no reason; give text, source, writeup or like")
    for pid in holds + fails:
        if pid not in ids:
            errors.append(f"{where}: unknown principle '{pid}'")
    if isinstance(a.get("source"), dict) and a["source"].get("paper") not in papers:
        errors.append(f"{where}: unknown paper '{a['source'].get('paper')}'")
    if a.get("writeup") and not (writeups / f"{a['writeup']}.md").exists():
        errors.append(f"{where}: no write-up writeups/{a['writeup']}.md")
    if a.get("like") and _argument_target(data, a["like"]) is None:
        errors.append(f"{where}: like names no argument: '{a['like']}'")
    if "adapt" in a and not a.get("like"):
        errors.append(f"{where}: adapt is used only with like")
    if a.get("standing", "established") != "conjectured":
        for key in ("tier", "companion_id"):
            if key in a:
                errors.append(f"{where}: {key} is for conjectured arguments only")
    return errors


def group_errors(data: dict, ids) -> list[str]:
    """The errors of the topic's conditions and general arguments, of groups, and of what records
    say they meet."""
    errors = []
    papers = {p.get("id") for p in data["papers"] if isinstance(p, dict)}
    topic_conditions = [c.get("id") for c in data.get("conditions", [])]
    cf = data.get("conditions_file", "conditions.yaml")
    if len(topic_conditions) != len(set(topic_conditions)):
        errors.append(f"{cf}: duplicate condition id")
    for c in data.get("conditions", []):
        if not (isinstance(c.get("id"), str) and _re.fullmatch(r"[a-z0-9]+(-[a-z0-9]+)*", c["id"]) and isinstance(c.get("text"), str) and c["text"].strip()):
            errors.append(f"{cf}: a condition needs a kebab-case id and a text: {c!r}"[:300])
    seen_general = set()
    for c in data.get("general_arguments", []):
        f = c["_file"]
        stem = Path(f).stem
        if c.get("id") != stem:
            errors.append(f"{f}: id '{c.get('id')}' must equal file stem '{stem}'")
        if c.get("id") in seen_general:
            errors.append(f"{f}: duplicate general argument id")
        seen_general.add(c.get("id"))
        errors += _argument_checks(c, f, ids, papers, (ROOT / f).parent.parent / "writeups", data)
        if not c.get("requires"):
            errors.append(f"{f}: a general argument requires at least one condition")
        for cond in c.get("requires") or []:
            if cond not in topic_conditions:
                errors.append(f"{f}: requires unknown condition '{cond}' (conditions.yaml)")
        for pid in c.get("given") or []:
            if pid not in ids:
                errors.append(f"{f}: given names unknown principle '{pid}'")
    groups = {}
    for g in data.get("groups", []):
        f = g["_file"]
        stem = Path(f).stem
        if g.get("id") != stem:
            errors.append(f"{f}: id '{g.get('id')}' must equal file stem '{stem}'")
        groups[g.get("id")] = g
        params = g.get("parameters") if isinstance(g.get("parameters"), dict) else {}
        own_conditions = [c.get("id") for c in g.get("conditions") or [] if isinstance(c, dict)]
        if len(own_conditions) != len(set(own_conditions)):
            errors.append(f"{f}: duplicate condition id")
        for cond in set(own_conditions) & set(topic_conditions):
            errors.append(f"{f}: condition '{cond}' is also one of the topic's (conditions.yaml)")
        conditions = own_conditions + topic_conditions
        for cond, why in (g.get("meets") or {}).items():
            if cond not in conditions:
                errors.append(f"{f}: meets '{cond}', which is no condition of the group or the topic")
            for req in (why.get("requires") or []) if isinstance(why, dict) else []:
                if req not in conditions:
                    errors.append(f"{f}: meets '{cond}' for members meeting '{req}', which is no condition of the group or the topic")
        for slot in SLOT.findall(str(g.get("definition") or "")):
            if slot not in params:
                errors.append(f"{f}: the definition's slot {{{{{slot}}}}} is no parameter")
        for name, param in params.items():
            if not isinstance(param, dict):
                continue
            values = param.get("values") if isinstance(param.get("values"), dict) else None
            if param.get("generate") and values is None:
                errors.append(f"{f}: parameter '{name}' is generated but has no named values")
            if param.get("default") is not None and (values is None or param["default"] not in values):
                errors.append(f"{f}: the default of '{name}' is not one of its values")
            for v in values or {}:
                for cond in value_entry(param, v).get("requires") or []:
                    if cond not in conditions:
                        errors.append(f"{f}: value '{v}' of '{name}' requires unknown condition '{cond}'")
                for cond in value_entry(param, v).get("meets") or {}:
                    if cond not in conditions:
                        errors.append(f"{f}: value '{v}' of '{name}' meets '{cond}', which is no condition of the group or the topic")
        seen = set()
        for c in g.get("arguments") or []:
            if not isinstance(c, dict):
                continue
            where = f"{f}: {c.get('id', '?')}"
            if c.get("id") in seen:
                errors.append(f"{where}: duplicate shared argument id")
            seen.add(c.get("id"))
            errors += _argument_checks(c, where, ids, papers, (ROOT / f).parent.parent / "writeups", data)
            for name, want in (c.get("when") or {}).items():
                values = (params.get(name) or {}).get("values") if isinstance(params.get(name), dict) else None
                if not isinstance(values, dict):
                    errors.append(f"{where}: when names '{name}', which is not a parameter with named values")
                    continue
                for v in want if isinstance(want, list) else [want]:
                    if v not in values:
                        errors.append(f"{where}: '{v}' is not a value of {name}")
            for cond in c.get("requires") or []:
                if cond not in conditions:
                    errors.append(f"{where}: requires unknown condition '{cond}'")
    for rec in data.get("model_sources", []):
        if "group" not in rec:
            if "settings" in rec:
                errors.append(f"{rec['_file']}: settings is only for a group's member")
            for cond in rec.get("meets") or {}:
                if cond not in topic_conditions:
                    errors.append(f"{rec['_file']}: meets '{cond}', which is not a condition of the topic (conditions.yaml)")
            continue
        f, g = rec["_file"], groups.get(rec.get("group"))
        if g is None:
            errors.append(f"{f}: no group groups/{rec.get('group')}.yaml")
            continue
        params = g.get("parameters") if isinstance(g.get("parameters"), dict) else {}
        settings = rec.get("settings") if isinstance(rec.get("settings"), dict) else {}
        for name in settings:
            if name not in params:
                errors.append(f"{f}: setting '{name}' is not a parameter of {g.get('id')}")
        for name in params:
            if name not in settings and not (isinstance(params[name], dict) and params[name].get("generate") and params[name].get("default")):
                errors.append(f"{f}: no setting for the parameter '{name}' of {g.get('id')}")
            elif setting_text(g, name, settings[name]) is None:
                values = (params[name] or {}).get("values") if isinstance(params[name], dict) else None
                errors.append(f"{f}: setting '{name}' must be " + (f"one of {sorted(values)} or {{text: ...}}" if isinstance(values, dict) else "prose"))
        conditions = {c.get("id") for c in g.get("conditions") or [] if isinstance(c, dict)} | set(topic_conditions)
        for cond in (rec.get("meets") or {}):
            if cond not in conditions:
                errors.append(f"{f}: meets '{cond}', which is no condition of {g.get('id')} or the topic")
        for i, a in enumerate((rec.get("_raw") or rec).get("arguments") or []):
            if not isinstance(a, dict) or a.get("group") or a.get("general"):
                continue
            for name, want in (a.get("when") or {}).items():
                values = (params.get(name) or {}).get("values") if isinstance(params.get(name), dict) else None
                if not isinstance(values, dict):
                    errors.append(f"{f}: {argument_label(a, i)}: when names '{name}', which is not a parameter with named values")
                    continue
                for v in want if isinstance(want, list) else [want]:
                    if v not in values and v != "own":
                        errors.append(f"{f}: {argument_label(a, i)}: '{v}' is not a value of {name}")
        own = {a.get("id") for a in rec.get("arguments") or [] if isinstance(a, dict) and a.get("id") and not a.get("group") and not a.get("general")}
        for a in rec.get("arguments") or []:
            if isinstance(a, dict) and a.get("group") and a.get("id") in own:
                errors.append(f"{f}: argument id '{a['id']}' is also a shared argument of {g.get('id')} that applies to it")
    return errors


def argument_errors(data: dict, ids) -> list[str]:
    """The errors of argument-format model records that need no engine. A group's shared arguments are
    checked once, in group_errors; here they count only towards a member's clashes."""
    errors = group_errors(data, ids)
    papers = {p.get("id") for p in data["papers"] if isinstance(p, dict)}
    sidecars = {s.get("id"): s for s in data.get("provenance", [])}
    for rec in data.get("model_sources", []):
        f = rec["_file"]
        writeups = (ROOT / f).parent.parent / "writeups"
        seen, companions, settled = set(), set(), {}
        for i, a in _arguments(rec):
            if not isinstance(a, dict):
                continue  # the schema reports it
            where = f"{f}: {argument_label(a, i)}"
            holds = a.get("holds") if isinstance(a.get("holds"), list) else []
            fails = a.get("fails") if isinstance(a.get("fails"), list) else []
            if not a.get("group") and not a.get("general"):
                errors += _argument_checks(a, where, ids, papers, writeups, data)
                if a.get("id") is not None:
                    if a["id"] in seen:
                        errors.append(f"{where}: duplicate argument id")
                    seen.add(a["id"])
                if a.get("standing", "established") == "conjectured" and a.get("companion_id"):
                    companions.add(a["companion_id"])
            if a.get("provenance"):
                side = sidecars.get(a["provenance"])
                if side is None:
                    errors.append(f"{where}: no provenance sidecar provenance/{a['provenance']}.yaml")
                elif rec.get("id") not in provenance_records(side):
                    errors.append(f"{where}: provenance/{a['provenance']}.yaml has nothing for '{rec.get('id')}'")
            if not a.get("withdrawn"):
                for key, pids in (("holds", holds), ("fails", fails)):
                    for pid in pids:
                        settled.setdefault(pid, {}).setdefault(key, []).append(argument_label(a, i))
        present = [a for _, a in _arguments(rec)]
        for i, a in enumerate((rec.get("_raw") or {}).get("arguments") or []):
            if isinstance(a, dict) and not any(a is b for b in present):  # applies only at other settings
                errors += _argument_checks(a, f"{f}: {argument_label(a, i)}", ids, papers, writeups, data)
        for pid, by in settled.items():
            if len(by) == 2:
                errors.append(f"{f}: '{pid}' both holds (arguments: {', '.join(by['holds'])}) and fails (arguments: {', '.join(by['fails'])})")
        if len(companions) > 1:
            errors.append(f"{f}: conjectured arguments name different companion ids {sorted(companions)}; a model has one companion")
    for side in data.get("provenance", []):
        stem = Path(side["_file"]).stem
        if side.get("id") != stem:
            errors.append(f"{side['_file']}: id '{side.get('id')}' must equal file stem '{stem}'")
        owners = provenance_records(side)
        for owner in owners:
            if owner not in {s.get("id") for s in data.get("model_sources", [])}:
                errors.append(f"{side['_file']}: record '{owner}' is not a model in the argument format")
        if len(owners) != len(set(owners)):
            errors.append(f"{side['_file']}: a record has two entries")
    return errors


def conflict_arguments(rec: dict, conflict: dict, E) -> list[str]:
    """The arguments behind an engine conflict in a flattened model: those settling the
    premises of the rules used, and those failing a violated principle it reaches."""
    used = {p for rid in conflict["via"] for p in E.rules_by_id[rid][1]} | {conflict["target"]}
    return [argument_label(a, i) for i, a in _live_arguments(rec)
            if used & set(a.get("holds") or []) or conflict["target"] in (a.get("fails") or [])]


def model_coverage(data: dict, an: dict) -> list[dict]:
    """For each argument-format model: every verdict with its routes, the derived verdicts,
    the conjectures and the unknowns, and the notices a referee would want. Notices never
    block a build."""
    import re
    E, names = an["engine"], {FALSE: "⊥", **{p["id"]: p["name"] for p in data["principles"]}}
    flat = {m["id"]: m for m in data["models"]}
    model_ids = {m.get("id") for m in data["models"]} | {s.get("id") for s in data.get("model_sources", [])}
    out = []
    for rec in data.get("model_sources", []):
        mid, f = rec.get("id"), rec["_file"]
        m = flat.get(mid)
        construction = rec.get("construction") if isinstance(rec.get("construction"), dict) else {}
        verdicts, notices = {}, []
        for i, a in _arguments(rec):
            if not isinstance(a, dict):
                continue
            by, date = _argument_by_date(a, rec)
            route = {"argument": argument_label(a, i), "standing": a.get("standing", "established"),
                     "withdrawn": bool(a.get("withdrawn")), "reasons": [k for k in ARGUMENT_REASONS if a.get(k)],
                     "by": by, "date": date}
            for key, value in (("holds", True), ("fails", False)):
                for pid in a.get(key) or []:
                    verdicts.setdefault((pid, value), []).append(route)
            if a.get("like") and not a.get("withdrawn"):
                target = _argument_target(data, a["like"]) or {}
                later = [r.get("date") for r in target.get("revisions") or [] if str(r.get("date", "")) > date]
                if (target.get("withdrawn") or {}).get("date", "") > date:
                    notices.append(f"{route['argument']}: its like target {a['like']} was withdrawn after it; recheck the adaptation")
                elif later:
                    notices.append(f"{route['argument']}: its like target {a['like']} was revised after it ({', '.join(map(str, later))}); recheck the adaptation")
        for (pid, value), routes in verdicts.items():
            live = [r for r in routes if not r["withdrawn"]]
            settled = [r for r in live if r["standing"] == "established"]
            what = f"{'holds' if value else 'fails'} {pid}"
            if not live:
                notices.append(f"{what}: no route left, every argument for it is withdrawn")
            elif not settled:
                notices.append(f"{what}: conjectured only")
            elif all(r["reasons"] == ["source"] for r in settled):
                notices.append(f"{what}: source only")
        if construction.get("standing") == "conjectured":
            n = len({k for k, rs in verdicts.items() if any(r["standing"] == "established" and not r["withdrawn"] for r in rs)})
            notices.append(f"construction conjectured: {n} verdict(s) established only if it is a model")
        definition = rec.get("definition") if isinstance(rec.get("definition"), str) else ""
        leans = sorted(x for x in model_ids - {mid} if re.search(rf"(?<![a-z0-9-]){re.escape(str(x))}(?![a-z0-9-])", definition))
        if leans:
            notices.append(f"definition leans on record {', '.join(leans)}")
        derived_holds, derived_fails, unknown = [], [], []
        if m is not None and m["status"] == "proved" and mid in E.holds and mid not in E.model_conflicts:
            sat, vio = m["satisfies"], m["violates"]
            # A group's shared argument lists everything its argument shows; only a record's own arguments
            # are held to minimal verdicts.
            shared = {p for _, a in _live_arguments(rec) if a.get("group") or a.get("general") for p in (a.get("holds") or []) + (a.get("fails") or [])}
            redundant = [f"holds {p}" for p in sat if p not in shared and p in E.cl([x for x in sat if x != p])[0]]
            redundant += [f"fails {v}" for v in vio if v not in shared and E._reaches(sat, v, [x for x in vio if x != v])]
            if redundant:
                notices.append("each derivable from the other recorded verdicts: " + ", ".join(redundant))
            derived_holds = [p for p in E.ids if p in E.holds[mid] and p not in sat]
            derived_fails = [p for p in E.ids if p in E.fails[mid] and p not in vio]
            unknown = an["unknown"].get(mid, [])
        conjectures = []
        for c in data["models"]:
            if c.get("_companion_of") == mid:
                st = an["conjectures"].get(c["id"], {}).get("status", "open")
                conjectures += [{"companion": c["id"], "principle": p, "value": value, "status": st, "tier": c.get("tier")}
                                for value, key in ((True, "satisfies"), (False, "violates")) for p in c["model_check"][key]]
        out.append({"id": mid, "file": f, "name": rec.get("name"), "names": names,
                    "construction": construction.get("standing", "established") if not construction.get("withdrawn") else "withdrawn",
                    "verdicts": verdicts, "derived_holds": derived_holds, "derived_fails": derived_fails,
                    "unknown": unknown, "conjectures": conjectures, "notices": notices})
    return out


def coverage_text(cov: dict) -> list[str]:
    """A model's coverage report, as status prints it."""
    nm = cov["names"]
    def route(r):
        bits = [r["argument"], "+".join(r["reasons"]) or "no reason", f"{r['by']}, {r['date']}"]
        if r["standing"] != "established":
            bits.append(r["standing"])
        if r["withdrawn"]:
            bits.append("withdrawn")
        return "[" + "; ".join(bits) + "]"
    lines = [f"coverage {cov['id']} ({cov['name']}), construction {cov['construction']}"]
    for value, label in ((True, "holds"), (False, "fails")):
        rows = [(p, rs) for (p, v), rs in cov["verdicts"].items() if v == value]
        lines.append(f"  {label} ({len(rows)} recorded)")
        lines += [f"    {nm.get(p, p)}: " + " ".join(route(r) for r in rs) for p, rs in rows]
    for label, key in (("derived holds", "derived_holds"), ("derived fails", "derived_fails"), ("unknown", "unknown")):
        lines.append(f"  {label} ({len(cov[key])}): " + ", ".join(nm.get(p, p) for p in cov[key]))
    for c in cov["conjectures"]:
        lines.append(f"  conjectured {'holds' if c['value'] else 'fails'} {nm.get(c['principle'], c['principle'])}: "
                     f"{c['status']}, in {c['companion']}" + (f", {c['tier']}" if c["tier"] else ""))
    lines += [f"  notice: {n}" for n in cov["notices"]]
    return lines


def validate_topic(topic_id: str, *, quiet=False) -> bool:
    data = load_topic(topic_id)
    errors, warnings = [], []
    tschema, pschema, rschema = _schema("topic"), _schema("principle"), _schema("result")

    def check(schema, obj, where):
        clean = {k: v for k, v in obj.items() if not k.startswith("_")} if isinstance(obj, dict) else obj
        for e in jsonschema.Draft202012Validator(schema).iter_errors(clean):
            loc = "/".join(str(x) for x in e.absolute_path) or "(root)"
            errors.append(f"{where}: {loc}: {e.message}")
        if isinstance(obj, dict) and isinstance(obj.get("source_names"), list) and isinstance(obj.get("sources", []), list):
            if len(obj["source_names"]) != len(obj.get("sources", [])):
                errors.append(f"{where}: source_names must have one name for each source")

    check(tschema, data["topic"], f"topics/{topic_id}/topic.yaml")
    if data["topic"].get("id") != topic_id:
        errors.append(f"topic.yaml id '{data['topic'].get('id')}' does not match directory '{topic_id}'")

    check(_schema("papers"), data["paper_catalogue"], f"topics/{topic_id}/papers.yaml")
    papers = data["papers"] if isinstance(data["papers"], list) else []
    paper_ids = [p["id"] for p in papers if isinstance(p, dict) and isinstance(p.get("id"), str)]
    if len(paper_ids) != len(set(paper_ids)):
        errors.append("papers.yaml: duplicate paper id")
    sources_root = (TOPICS / topic_id / "sources").resolve()
    for p in papers:
        if isinstance(p, dict) and isinstance(p.get("file"), str):
            target = (TOPICS / topic_id / p["file"]).resolve()
            if sources_root not in target.parents:
                errors.append(f"papers.yaml: {p.get('id')}: file '{p['file']}' must lie inside sources/")
            elif not target.is_file():
                errors.append(f"papers.yaml: {p.get('id')}: file '{p['file']}' does not exist")
    for item in data["principles"] + data["results"] + data["models"] + data.get("retired_models", []):
        if item.get("_companion_of"):
            continue  # a generated companion repeats its model's references
        refs = item.get("references", [])
        for ref in refs if isinstance(refs, list) else []:
            if isinstance(ref, dict) and isinstance(ref.get("paper"), str) and ref["paper"] not in paper_ids:
                errors.append(f"{item['_file']}: unknown paper '{ref['paper']}'")
    # [[id]] or [[id|text]] in a record's prose links to another record of the topic.
    records = data["principles"] + data["results"] + data["models"] + data.get("groups", []) + data.get("general_arguments", [])
    linkable = {x.get("id") for x in records}
    errors += background_errors(data, linkable)
    linkable |= background_ids(data)
    for item in records:
        if item.get("_companion_of"):
            continue
        for ref in sorted(set(CROSS_REF.findall(_prose_text(item)))):
            if ref not in linkable:
                errors.append(f"{item['_file']}: unknown cross-reference [[{ref}]]")

    ids = set()
    categories = data["topic"].get("principle_categories", [])
    category_ids = [c["id"] for c in categories if isinstance(c, dict) and "id" in c]
    if len(set(category_ids)) != len(category_ids):
        errors.append("topic.yaml: duplicate principle category id")
    for p in data["principles"]:
        check(pschema, p, p["_file"])
        stem = Path(p["_file"]).stem
        if p.get("id") != stem:
            errors.append(f"{p['_file']}: id '{p.get('id')}' must equal file stem '{stem}'")
        if p.get("id") in ids:
            errors.append(f"{p['_file']}: duplicate id {p['id']}")
        variant_ids = [v.get("id") for v in p.get("variants") or [] if isinstance(v, dict)]
        if len(variant_ids) != len(set(variant_ids)):
            errors.append(f"{p['_file']}: duplicate variant id")
        for v in p.get("variants") or []:
            for ref in (v.get("references") or []) if isinstance(v, dict) else []:
                if isinstance(ref, dict) and isinstance(ref.get("paper"), str) and ref["paper"] not in paper_ids:
                    errors.append(f"{p['_file']}: variant {v.get('id')}: unknown paper '{ref['paper']}'")
        if p.get("id") == FALSE:
            errors.append(f"{p['_file']}: false is a reserved logical conclusion, not a principle")
        ids.add(p.get("id"))
        if p.get("category") is not None and p["category"] not in category_ids:
            errors.append(f"{p['_file']}: unknown principle category '{p['category']}'")

    for p in data["principles"]:
        if p.get("negates"):
            errors.append(f"{p['_file']}: migrate negates to a result with the incompatible premises and conclusion: false")

    preset_ids = set()
    source_ids = [s['id'] for s in data['topic'].get('source_catalog', []) if isinstance(s, dict) and isinstance(s.get('id'), str)]
    if len(source_ids) != len(set(source_ids)):
        errors.append('topic.yaml: duplicate source catalog id')
    for preset in data["topic"].get("background_presets", []):
        if not isinstance(preset, dict):
            continue
        preset_id = preset.get("id", "")
        if preset_id in preset_ids:
            errors.append(f"topic.yaml: duplicate background preset '{preset_id}'")
        preset_ids.add(preset_id)
        if preset.get("category") not in category_ids:
            errors.append(f"topic.yaml: unknown category for background preset '{preset_id}'")
        for pid in preset.get("principles", []):
            if pid not in ids:
                errors.append(f"topic.yaml: background preset '{preset_id}' references unknown principle '{pid}'")

    for pid in data["topic"].get("initial_principles", []):
        if pid not in ids:
            errors.append(f"topic.yaml: initial_principles references unknown principle '{pid}'")
    for key, label in (("views", "view"), ("lattice_views", "lattice view")):
        seen, defaults = set(), 0
        for view in data["topic"].get(key, []):
            if not isinstance(view, dict):
                continue
            vid = view.get("id", "")
            if vid in seen:
                errors.append(f"topic.yaml: duplicate {label} '{vid}'")
            seen.add(vid)
            defaults += bool(view.get("default"))
            for pid in view.get("principles", []):
                if pid not in ids:
                    errors.append(f"topic.yaml: {label} '{vid}' references unknown principle '{pid}'")
            if key == "lattice_views" and len(view.get("principles", [])) > 7:
                warnings.append(f"topic.yaml: lattice view '{vid}' has {len(view['principles'])} principles; "
                                "the lattice may exceed its drawing cap")
        if defaults > 1:
            errors.append(f"topic.yaml: more than one default {label}")

    for b in data["topic"].get("background", []):
        if b not in ids:
            errors.append(f"topic.yaml: background principle '{b}' does not exist")

    mschema = _schema("model")
    models_by_id = {m.get("id"): m for m in data["models"]}
    rids = set()
    for r in data["results"] + data["models"] + data.get("retired_models", []):
        if r.get("_companion_of"):  # generated: only its id and its model check are its own
            if r.get("id") in rids:
                errors.append(f"{r['_file']}: the conjectured companion's id '{r['id']}' is already taken; set companion_id")
            rids.add(r.get("id"))
            continue
        if r.get("variant_of"):  # generated from a member's file, which is checked as the member
            if r.get("id") in rids:
                errors.append(f"{r['_file']}: the variant id '{r['id']}' is already taken")
            rids.add(r.get("id"))
            continue
        source = r.get("_source")  # an argument-format record, checked as written
        is_model = "satisfies" in r or source is not None
        check(mschema if is_model else rschema, source if source is not None else r, r["_file"])
        if data["topic"].get("require_sources") and not r.get("sources"):
            errors.append(f"{r['_file']}: a result or model must have at least one source")
        stem = Path(r["_file"]).stem
        if r.get("id") != stem:
            errors.append(f"{r['_file']}: id '{r.get('id')}' must equal file stem '{stem}'")
        if r.get("id") in rids:
            errors.append(f"{r['_file']}: duplicate id {r['id']}")
        rids.add(r.get("id"))
        refs = (r.get("satisfies", []) + r.get("violates", [])) if is_model else (list(r.get("premises", [])) + [r.get("conclusion")])
        if source is not None:
            refs = []  # checked argument by argument
        for pid in refs:
            if pid not in ids and not (not is_model and pid == FALSE and r.get("conclusion") == FALSE and pid not in r.get("premises", [])):
                errors.append(f"{r['_file']}: unknown principle '{pid}'")
        if is_model and source is None and set(r.get("satisfies", [])) & set(r.get("violates", [])):
            errors.append(f"{r['_file']}: a principle is both satisfied and violated")
        if is_model and isinstance(r.get("model_check"), dict):
            mc = r["model_check"]
            base = models_by_id.get(mc.get("model"))
            if base is None or base.get("status") != "proved" or base is r:
                errors.append(f"{r['_file']}: model_check must name a different proved model")
            if not mc.get("satisfies") and not mc.get("violates"):
                errors.append(f"{r['_file']}: model_check must propose at least one verdict")
            for field in ("satisfies", "violates"):
                for pid in mc.get(field, []):
                    if pid not in r.get(field, []):
                        errors.append(f"{r['_file']}: model_check {field} assertion '{pid}' is absent from the record")
        for i, ch in enumerate(r.get("changes") or []):
            for key in ("satisfies", "violates"):
                for pid in ch.get(key, []):
                    if pid not in ids:
                        errors.append(f"{r['_file']}: changes[{i}] names unknown principle '{pid}'")
                    elif pid not in r.get(key, []):
                        errors.append(f"{r['_file']}: changes[{i}] lists '{pid}' under {key} but the record does not")
        cert = r.get("certificate", {})
        if cert.get('source_id', 'misc') not in source_ids + ['misc']:
            errors.append(f"{r['_file']}: unknown direct source '{cert['source_id']}'")
        if not is_model:
            if r.get("status") == "proved" and not (r.get("proof") or "").strip():
                errors.append(f"{r['_file']}: proved result needs a proof")
            if r.get("conclusion") in r.get("premises", []):
                errors.append(f"{r['_file']}: conclusion is among the premises")

    errors += argument_errors(data, ids)
    for side in data.get("provenance", []):
        check(_schema("provenance"), side, side["_file"])
    for g in data.get("groups", []):
        check(_schema("group"), g, g["_file"])
    for c in data.get("general_arguments", []):
        check(_schema("general-argument"), c, c["_file"])

    if not errors:
        an = analyse(data)
        sources = {s["id"]: s for s in data.get("model_sources", [])}
        for p in an["problems"]:
            mid = next((m for m, c in an["engine"].model_conflicts.items()
                        if m in sources and p.startswith(f"model {m} is inconsistent:")), None)
            args = conflict_arguments(sources[mid], an["engine"].model_conflicts[mid], an["engine"]) if mid else []
            errors.append(f"CONTRADICTION: {p}" + (f" (arguments: {', '.join(args)})" if args else ""))
        warnings += an["infos"]
        warnings += [f"{c['file']}: {n}" for c in model_coverage(data, an) for n in c["notices"]]
        # An argument's verdict proved in Lean must be one of its verdicts; a condition proved for a
        # model or a group must be one it meets.
        for a in lean_arguments(data):
            src = next((x for x in data.get("general_arguments", []) if x.get("id") == a["argument"]), None) if not a["group"] \
                else next((x for g in data["groups"] if g["id"] == a["group"] for x in g.get("arguments") or [] if isinstance(x, dict) and x.get("id") == a["argument"]), None)
            if a["principle"] not in ((src or {}).get("holds" if a["holds"] else "fails") or []):
                errors.append(f"{a['_file']}: argument {a['argument']}'s lean entry {'holds' if a['holds'] else 'fails'} "
                              f"'{a['principle']}', which the argument does not")
        for g in data.get("groups", []):
            glean = g.get("lean") or {}
            for c in glean.get("meets") or {}:
                if not isinstance((g.get("meets") or {}).get(c), str):
                    errors.append(f"{g['_file']}: lean.meets '{c}', which the group's every member does not meet")
            for k in glean.get("settings") or {}:
                if k not in (g.get("parameters") or {}):
                    errors.append(f"{g['_file']}: lean.settings names unknown parameter '{k}'")
        for m in data["models"]:
            if isinstance(m.get("lean"), dict) and not m.get("variant_of") and not m.get("_companion_of"):
                for c in m["lean"].get("meets") or {}:
                    if c not in (m.get("met") or {}):
                        errors.append(f"{m['_file']}: lean.meets '{c}', which the record does not meet")
        # A verdict proved in Lean must be one the map gives the model: the map's verdicts are
        # its arguments' (and what follows from them), and Lean only certifies them.
        E, seen = an["engine"], set()
        for v in lean_verdicts(data):
            where, pid, side = v["_file"], v["principle"], "holds" if v["holds"] else "fails"
            if pid not in ids:
                errors.append(f"{where}: lean verdict names unknown principle '{pid}'")
                continue
            if (v["model"], pid) in seen:
                errors.append(f"{where}: lean verdict on '{pid}' given twice")
            seen.add((v["model"], pid))
            mine, other = (E.holds, E.fails) if v["holds"] else (E.fails, E.holds)
            if pid in other.get(v["model"], set()):
                errors.append(f"{where}: lean verdict says '{pid}' {side}, but the map says the opposite")
            elif pid not in mine.get(v["model"], set()):
                errors.append(f"{where}: lean verdict says '{pid}' {side}, which the map does not settle; "
                              "add an argument for it")

    if not quiet:
        for e in errors:
            print(f"ERROR   {e}")
        for w in warnings:
            print(f"note    {w}")
        print(f"{topic_id}: {len(data['principles'])} principles, {len(data['results'])} results, {len(data['models'])} models — "
              f"{'OK' if not errors else str(len(errors)) + ' error(s)'}")
    return not errors


# ----------------------------------------------------------------------------
# Build
# ----------------------------------------------------------------------------

def export_json(topic_id: str, *, data: dict | None = None, an: dict | None = None) -> dict:
    """The topic's records and analysis. A build passes the data and analysis it already has, so
    the rankings, which cost minutes, are computed once per build."""
    data = data if data is not None else load_topic(topic_id)
    an = an if an is not None else analyse(data)
    clean = lambda d: {k: v for k, v in d.items() if not k.startswith("_")}
    return {
        "topic": data["topic"],
        "papers": data["papers"],
        "principles": [clean(p) | {"file": p["_file"]} for p in data["principles"]],
        "results": [clean(r) | {"file": r["_file"]} for r in data["results"]],
        "models": [clean(m) | {"file": m["_file"]} for m in data["models"]],
        "provenance": [provenance_export(x) for x in data.get("provenance", [])],
        "groups": [clean(g) | {"file": g["_file"]} for g in data.get("groups", [])],
        "conditions": data.get("conditions", []),
        "general_arguments": [clean(c) | {"file": c["_file"]} for c in data.get("general_arguments", [])],
        "generated": _dt.datetime.now(_dt.timezone.utc).isoformat(timespec="seconds"),
        "progress": progress_report(data),
        "history": history_export(topic_id, data),
        # The viewer takes its top 30 after applying the shown-principle filter.
        "lynchpins": lynchpin_report(data, sparse_ok=False, top=None),
        "server_analysis": {
            "classes": an["classes"],
            "open_pairs": an["open_pairs"],
            "unknown": an["unknown"],
            "problems": an["problems"],
            "infos": an["infos"],
            "conjectures": an["conjectures"],
        },
    }


PAPER_CATALOGUE_SLOT = '<div id="paper-catalogue"></div>'


def paper_links_md(p: dict, prefix: str = "") -> str:
    """Markdown links to a paper: its external url and its copy in sources/. `prefix` leads from the
    page being written to the topic folder ("" for the viewer, "../" for a write-up)."""
    links = [f"[Paper]({p['url']})"] if p.get("url") else []
    if p.get("file"):
        target = urllib.parse.quote(prefix + p["file"], safe="/")   # file names may contain spaces or parentheses
        links.append(f"[{'PDF' if p['file'].lower().endswith('.pdf') else 'File'}]({target})")
    return " ".join(links)


def literature_md(data: dict, prefix: str = "") -> str:
    cited = {ref["paper"] for kind in ("principles", "results", "models")
             for item in data[kind] for ref in item.get("references", [])}
    lines = []
    for title, used in (("Source literature", True), ("Other relevant literature", False)):
        lines += [f"### {title}", ""]
        for p in data.get("papers", []):
            if (p["id"] in cited) != used:
                continue
            link = (" " + paper_links_md(p, prefix)) if p.get("url") or p.get("file") else ""
            lines += [f"- {p['citation']}{link}" + (f" {p['note']}" if p.get("note") else "")]
        lines += [""]
    return "\n".join(lines)


_MATH_OR_CODE = _re.compile(
    r'(?P<fence>^ {0,3}(?P<ticks>`{3,}|~{3,})[^\n]*\n.*?^ {0,3}(?P=ticks)[ \t]*$)'
    r'|(?P<code>(?P<tick>`+)[^`]*?(?P=tick))'
    r'|(?P<math>(?<!\\)(?:\$\$[\s\S]*?(?<!\\)\$\$|\\\[[\s\S]*?\\\]|\\\([\s\S]*?\\\)|\$(?!\s)(?:\\.|[^$\n])+?(?<![\\\s])\$(?!\d)))',
    _re.M | _re.S)
_CROSS_REF_TEXT = _re.compile(r"\[\[([a-z0-9]+(?:-[a-z0-9]+)*)(?:\|([^\]]*))?\]\]")


def _outside_math_or_code(md: str) -> str:
    """The text with its math and code blanked out, for finding markup that is not inside them."""
    return _MATH_OR_CODE.sub(lambda m: " " * len(m[0]), md)


def _xref_slots(md: str) -> str:
    """[[id]] and [[id|text]] outside math and code as `<span data-xref>` slots, which the viewer
    turns into links labelled as it labels cross-references in records; `{lean: A, B}` as a
    `<span data-lean>` slot, which it turns into one link to the declarations."""
    def slots(text: str) -> str:
        text = _CROSS_REF_TEXT.sub(lambda r: f'<span class="xref-slot" data-xref="{r[1]}">{r[2] or ""}</span>', text)
        return LEAN_INLINE.sub(lambda r: '<span class="lean-ref" data-lean="'
                               + " ".join(n.strip() for n in r[1].split(",") if n.strip()) + '"></span>', text)
    out, end = [], 0
    for m in _MATH_OR_CODE.finditer(md):
        out += [slots(md[end:m.start()]), m[0]]
        end = m.end()
    out.append(slots(md[end:]))
    return "".join(out)


def background_item_label(item: dict) -> str:
    return item["kind"].capitalize() + (f" ({item['title']})" if item.get("title") else "")


def _background_item_meta(item: dict) -> list[str]:
    meta = []
    if item.get("credit"):
        meta.append(f"*Credit:* {item['credit']}")
    if item.get("sources"):
        meta.append("*Sources:* " + "; ".join(item["sources"]))
    return meta


def background_item_md(item: dict) -> str:
    """An item as plain Markdown, for the bundle and the downloaded data.json."""
    lines = [f'<a id="{item["id"]}"></a>**{background_item_label(item)}.** `{item["id"]}`', "", item["body"], ""]
    meta = _background_item_meta(item) + ([f"*Lean:* " + ", ".join(f"`{n}`" for n in item["lean"])] if item.get("lean") else [])
    return "\n".join(lines + ([" ".join(meta), ""] if meta else []))


def render_background(bg: dict, payload: dict, literature: bool = True) -> dict:
    """The Background for the viewer: {"pages": [{id, title, html}], "items": [...], "md": ...}. Each
    item's block becomes a <section data-bg-item> with its heading and its credit and sources; the
    viewer adds its Lean links and what refers to it. A topic with papers gets a last page, the
    Literature, whose catalogue the viewer mounts; the bundle places it itself (`literature=False`)."""
    from html import escape
    items = {i["id"]: i for i in bg.get("items", [])}

    def html_block(m) -> str:
        i = items[m["id"]]
        head = (f'<p class="bg-item-head"><span class="bg-kind">{escape(i["kind"].capitalize())}</span>'
                + (f' <span class="bg-title">({_xref_slots(i["title"])})</span>' if i.get("title") else "") + "</p>")
        meta = _background_item_meta(i)
        return (f'\n<section class="bg-item bg-{i["kind"]}" id="bg-{i["id"]}" data-bg-item="{i["id"]}">\n{head}\n\n'
                f'{_xref_slots(i["body"])}\n\n'
                + (f'<div class="bg-meta">\n{_xref_slots(" · ".join(meta))}\n</div>\n' if meta else "")
                + '</section>\n')

    pages, md = [], []
    for p in bg.get("pages", []):
        # The Literature is a page of its own now: a single background.md's slot for it goes.
        text = _re.sub(r"(^#+ Literature\s*\n\s*)?" + _re.escape(PAPER_CATALOGUE_SLOT), "", p["md"], flags=_re.M).strip()
        # A block is rendered as a whole, so the text around it is given its slots separately.
        end, out = 0, []
        for m in BACKGROUND_BLOCK.finditer(text):
            out += [_xref_slots(text[end:m.start()]), html_block(m) if m["id"] in items else m[0]]
            end = m.end()
        out.append(_xref_slots(text[end:]))
        pages.append({"id": p["id"], "title": p["title"], "html": _md_to_html("".join(out)),
                      "refs": sorted(set(CROSS_REF.findall(BACKGROUND_BLOCK.sub("", text))))})
        md += [f"## {p['title']}", "", _demote(BACKGROUND_BLOCK.sub(lambda m: background_item_md(items[m["id"]]) if m["id"] in items else m[0], text), 1), ""]
    if literature and payload.get("papers"):
        catalogue = literature_md(payload)
        pages.append({"id": "literature", "title": "Literature",
                      "html": '<section id="paper-catalogue">' + _md_to_html(catalogue) + '</section>'})
        md += ["## Literature", "", catalogue, ""]
    out_items = [{k: v for k, v in i.items() if not k.startswith("_") and k != "file"} | {"file": i["file"]} for i in bg.get("items", [])]
    text = LEAN_INLINE.sub(lambda r: "(Lean: " + ", ".join(f"`{n.strip()}`" for n in r[1].split(",") if n.strip()) + ")", "\n".join(md))
    return {"pages": pages, "items": out_items, "md": text.strip() + "\n"}


def enriched_payload(topic_id: str, downloads: dict, *, base: dict | None = None) -> dict:
    """export_json plus the topic's prose, so a downloaded data.json is self-explaining. With `base`,
    an export already made, a deep copy of it is enriched instead of a fresh export."""
    import copy
    payload = copy.deepcopy(base) if base is not None else export_json(topic_id)
    site = site_config()
    if topic_id in site.get("maps", []):
        payload["navigation"] = [
            {"label": site["title"], "url": site["url"]},
            {"label": site["home_label"], "url": site["home_url"]},
        ]
        if site.get("repository_url"):
            payload["repository_url"] = site["repository_url"]
    payload["downloads"] = downloads
    bg = render_background(load_background(TOPICS / topic_id, payload["topic"]), payload)
    if bg["pages"]:
        payload["background_pages"], payload["background_items"] = bg["pages"], bg["items"]
        payload["background_md"] = bg["md"]
    for name, key in (("contribute", "contribute"), ("extraction", "extraction")):
        path = TOPICS / topic_id / f"{name}.md"
        if path.exists():
            md = path.read_text(encoding="utf-8")
            payload[f"{key}_md"] = md
            if key != "extraction":
                payload[f"{key}_html"] = _md_to_html(md)
    if downloads.get("starter"):
        section = ("\n\n## Create your own logical map\n\n"
                   f"[Download the starter project (ZIP)]({downloads['starter']})\n")
        payload["contribute_md"] = payload.get("contribute_md", "# Contribute\n") + section
        payload["contribute_html"] = _md_to_html(payload["contribute_md"])
    return payload


# ----------------------------------------------------------------------------
# Write-ups
# ----------------------------------------------------------------------------

def math_assets() -> dict[str, bytes]:
    """Local, pinned browser assets, shared by pages in each portable export."""
    import re
    vendor = ROOT / "viewer" / "vendor" / "katex"
    files = {str(p.relative_to(vendor)): p.read_bytes() for p in vendor.rglob("*") if p.is_file()}
    # Modern supported browsers use WOFF2; don't leave dangling WOFF/TTF URLs.
    css = re.sub(r'src:[^;}]+', lambda m: 'src:' + re.search(r'url\([^)]*\.woff2\)\s*format\("woff2"\)', m[0])[0], files['katex.min.css'].decode())
    files['katex.min.css'] = (css + '\n' + (ROOT / 'viewer' / 'math.css').read_text()).encode()
    files['math.js'] = (ROOT / 'viewer' / 'math.js').read_bytes()
    return files


FAVICON = ROOT / "viewer" / "favicon.png"


def write_math_assets(outdir: Path) -> None:
    """The KaTeX assets under math/, and the favicon beside them."""
    for name, content in math_assets().items():
        path = outdir / 'math' / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(content)
    (outdir / "favicon.png").write_bytes(FAVICON.read_bytes())


def icon_head(math_path: str | None = 'math') -> str:
    """The favicon: next to the math assets normally, inline for a single-file --out export."""
    if math_path is None:
        import base64
        return f'<link rel="icon" type="image/png" href="data:image/png;base64,{base64.b64encode(FAVICON.read_bytes()).decode()}">'
    prefix = math_path[:-len("math")] if math_path.endswith("math") else math_path + "/"
    return f'<link rel="icon" type="image/png" href="{prefix}favicon.png">'


def math_head(path: str | None = 'math') -> str:
    """Relative assets normally; inline fonts/scripts for single-file --out exports."""
    from html import escape
    scripts = ['katex.min.js', 'contrib/auto-render.min.js', 'math.js']
    if path is not None:
        path = escape(path, quote=True)
        return f'<link rel="stylesheet" href="{path}/katex.min.css">\n' + '\n'.join(
            f'<script defer src="{path}/{name}"></script>' for name in scripts)
    import base64, re
    files = math_assets()
    css = re.sub(r'url\((fonts/[^)]+)\)', lambda m: 'url(data:font/woff2;base64,' + base64.b64encode(files[m[1]]).decode() + ')', files['katex.min.css'].decode())
    licence = '<!-- KaTeX ' + files['VERSION'].decode().strip() + '\n' + files['LICENSE'].decode() + '\n-->\n'
    return licence + f'<style>{css}</style>\n' + '\n'.join('<script>' + files[name].decode().replace('</', '<\\/') + '</script>' for name in scripts)


def theme_head(topic_id: str | None = None, *, math_path: str | None = 'math') -> str:
    """Embed shared assets and optional topic styling in self-contained HTML."""
    viewer = ROOT / "viewer"
    css = (viewer / "theme.css").read_text(encoding="utf-8")
    if topic_id is not None:
        topic_css = TOPICS / topic_id / "theme.css"
        if topic_css.is_file():
            css += "\n" + topic_css.read_text(encoding="utf-8")
    css += "\n" + (viewer / "colourblind.css").read_text(encoding="utf-8")
    js = (viewer / "theme.js").read_text(encoding="utf-8")
    return f"{icon_head(math_path)}\n<style>{css}</style>\n<script>{js}</script>\n{math_head(math_path)}"


def site_config() -> dict:
    path = ROOT / "site" / "config.yaml"
    return yaml.safe_load(path.read_text(encoding="utf-8")) if path.exists() else {}


def build_landing() -> Path | None:
    """Build the optional map collection homepage alongside the topic exports."""
    from html import escape
    site = site_config()
    if not site:
        return None
    links, stars = [], site.get("stars") or {}
    for topic_id in site["maps"]:
        topic = load_topic(topic_id)["topic"]
        # A draft is built but not listed on the homepage.
        if topic.get("draft") or not (BUILD / topic_id / "index.html").exists():
            continue
        tier = stars.get(topic_id)
        star = (f' <span class="star iridescent {escape(tier)}" title="{escape(tier.capitalize())} star">★</span>'
                if tier in ("bronze", "silver", "gold") else "")
        links.append(f'<li><a class="map-link" href="{escape(topic_id)}/">'
                     f'<span class="map-name">{escape(topic["title"])}{star}</span>'
                     '<span class="arrow" aria-hidden="true">→</span></a></li>')
    introduction = ROOT / "site" / "introduction.md"
    intro = _md_to_html(introduction.read_text(encoding="utf-8")) if introduction.exists() else ""
    suggestions = ROOT / "site" / "suggestions.md"
    starter = BUILD / "logical-maps-starter.zip"
    replacements = {
        "<!--__PMAP_THEME__-->": theme_head(),
        "__LANDING_TITLE__": escape(site["title"]),
        "__HOME_URL__": escape(site["home_url"], quote=True),
        "__HOME_LABEL__": escape(site["home_label"]),
        "__REPOSITORY_URL__": escape(site["repository_url"], quote=True),
        "__INTRODUCTION__": intro,
        "__SUGGESTIONS__": _md_to_html(suggestions.read_text(encoding="utf-8")) if suggestions.exists() else "",
        "__MAP_LINKS__": "\n".join(links),
        "__STARTER_LINK__": '<a href="logical-maps-starter.zip">Download the starter project (ZIP)</a>' if starter.exists() else "",
    }
    html = (ROOT / "viewer" / "landing.html").read_text(encoding="utf-8")
    for placeholder, value in replacements.items():
        html = html.replace(placeholder, value)
    BUILD.mkdir(parents=True, exist_ok=True)
    write_math_assets(BUILD)
    output = BUILD / "index.html"
    output.write_text(html, encoding="utf-8")
    return output


WRITEUP_NAV = ('<nav class="writeup-nav" aria-label="Write-up navigation">'
               '<a href="../index.html">← Back to map</a>'
               '<div class="display-toggles">'
               '<button type="button" class="theme-toggle" data-theme-toggle>[Dark mode]</button>'
               '<button type="button" class="theme-toggle" data-colourblind-toggle '
               'aria-label="Colourblind mode" aria-pressed="false">[Colourblind mode: off]</button>'
               '</div></nav>')


def _stmt_line(pid: str, names: dict, stmts: dict) -> str:
    return f"- **{names[pid]}.** {stmts[pid].strip()}"


def paper_references_md(item: dict, data: dict, prefix: str = "") -> str:
    papers = {p["id"]: p for p in data.get("papers", [])}
    lines = []
    for ref in item.get("references", []):
        p = papers[ref["paper"]]
        title = f"[{p['title']}]({p['url']})" if p.get("url") else p["title"]
        copy = f" ({paper_links_md({'file': p['file']}, prefix)})" if p.get("file") else ""
        lines.append(f"- **{ref['role'].capitalize()}: {title}.**{copy} {p['citation']}"
                     + (f" — {ref['locator']}" if ref.get("locator") else "")
                     + (f". {ref['note']}" if ref.get("note") else ""))
    return "\n".join(lines)


def argument_md(item: dict, data: dict, level: int = 3, link=lambda wid: f"[{wid}]({wid}.html)",
                prefix: str = "../") -> list[str]:
    """Markdown for a model in the argument format: its construction's standing, then each argument
    with the verdicts it settles and its reasons. A companion shows its conjectured arguments."""
    names = {FALSE: "⊥", **{p["id"]: p["name"] for p in data["principles"]}}
    papers = {p["id"]: p for p in data.get("papers", [])}
    out = []
    construction = item.get("construction") or {}
    if construction.get("standing") == "conjectured" or construction.get("withdrawn"):
        state = "withdrawn" if construction.get("withdrawn") else "conjectured" + (f", {construction['tier']}" if construction.get("tier") else "")
        out += [f"**Construction {state}.** Every verdict below holds only if this is a model.", ""]
        if (construction.get("text") or "").strip():
            out += [construction["text"].strip(), ""]
    for i, a in _arguments(item):
        by, date = _argument_by_date(a, item)
        head = []
        if a.get("holds"):
            head.append("Holds " + ", ".join(names.get(x, x) for x in a["holds"]) + ".")
        if a.get("fails"):
            head.append("Fails " + ", ".join(names.get(x, x) for x in a["fails"]) + ".")
        if a.get("standing") == "conjectured":
            head.append("Conjectured" + (f", {a['tier']}" if a.get("tier") else "") + ".")
        out += ["#" * level + " " + " ".join(head), ""]
        if a.get("withdrawn"):
            w = a["withdrawn"]
            out += [f"*Withdrawn {w.get('date', '')}" + (f" by {w['by']}" if w.get("by") else "") + f": {w.get('reason', '')}*", ""]
        if (a.get("text") or "").strip():
            out += [a["text"].strip(), ""]
        reasons = []
        if isinstance(a.get("source"), dict):
            paper = papers.get(a["source"].get("paper"), {})
            links = paper_links_md(paper, prefix) if paper else ""
            reasons.append("Source: " + paper.get("title", a["source"].get("paper", ""))
                           + (f", {a['source']['locator']}" if a["source"].get("locator") else "") + "."
                           + (f" {links}" if links else ""))
        if a.get("writeup"):
            reasons.append(f"Write-up: {link(a['writeup'])}.")
        if a.get("like"):
            reasons.append(f"Like `{a['like']}`" + (f": {' '.join(a['adapt'].split())}" if (a.get("adapt") or "").strip()
                                                     else ", word for word.") )
        if a.get("provenance"):
            side = next((x for x in data.get("provenance", []) if x.get("id") == a["provenance"]), {})
            chain = provenance_chain(side, item.get("companion_of") or item["id"])
            if chain:  # the review's report covers the whole admission: it stays in the file
                reasons.append(chain_md(chain))
            reasons.append(f"Provenance: `provenance/{a['provenance']}.yaml`.")
        if a.get("general"):
            reasons.append(f"General argument `arguments/{a['general']}`.")
            reasons += [f"It requires that {' '.join(str(c.get('text', '')).split())} Here: {' '.join(str(c.get('reason') or '').split())}"
                        for c in a.get("conditions") or []]
        elif a.get("group"):
            group = next((g for g in data.get("groups", []) if g.get("id") == a["group"]), {})
            reasons.append(f"From the group *{group.get('name', a['group'])}*, shared argument `{a['group']}#{a.get('id')}`.")
            reasons += [f"It requires that {' '.join(str(c.get('text', '')).split())} Here: {' '.join(str(c.get('reason') or '').split())}"
                        for c in a.get("conditions") or []]
        elif a.get("id"):
            reasons.append(f"Address: `{item.get('companion_of') or item['id']}#{a['id']}`.")
        reasons.append(f"By {_with_date(by, date)}." if by else f"{date}.")
        out += ["*" + " ".join(reasons) + "*", ""]
        for r in a.get("revisions") or []:
            out += [f"*Revised {r.get('date', '')}" + (f" by {r['by']}" if r.get("by") else "") + f":* {' '.join(str(r.get('note', '')).split())}", ""]
    return out


def _with_date(by: str, date: str) -> str:
    """Who and when, without repeating a date that the name already gives, as a certificate's
    produced_by often does ("…, 20 September 2026")."""
    months = ("January", "February", "March", "April", "May", "June", "July", "August",
              "September", "October", "November", "December")
    try:
        d = _dt.date.fromisoformat(str(date)[:10])
        spelled = f"{d.day} {months[d.month - 1]} {d.year}"
    except ValueError:
        spelled = None
    if not date or str(date) in by or (spelled and spelled in by):
        return by
    return f"{by}, {date}" if by else str(date)


def _companion_by(item: dict) -> str:
    """Who proposed a generated companion's conjectured arguments, and when."""
    return "; ".join(dict.fromkeys(_with_date(*_argument_by_date(a, item)) for _, a in _arguments(item)))


def generate_writeup(item: dict, data: dict) -> str:
    """Markdown write-up generated from the YAML record."""
    names = {FALSE: "⊥", **{p["id"]: p["name"] for p in data["principles"]}}
    stmts = {FALSE: "These premises cannot all hold together.", **{p["id"]: p["statement"] for p in data["principles"]}}
    c = item["certificate"]
    source = next((s['name'] for s in data['topic'].get('source_catalog', []) if s['id'] == c.get('source_id')), 'Misc.')
    cert = f"Source: {source}" + (f", Lean `{c['lean_ref']}`" if c.get("lean") == "verified" else "") \
        + (f"; produced by {c['produced_by']}" if c.get("produced_by") else "") \
        + (f"; recorded by {c['recorded_by']}" if c.get("recorded_by") else "") \
        + (f"; checked by {', '.join(c['checked_by'])}" if c.get("checked_by") else "")
    conj = item.get("status") == "conjectured"
    if item.get("companion_of"):  # its certificate is its model's; what it adds is who proposed the conjectured arguments
        cert = f"Source: {source}; conjectured by {_companion_by(item)}"
    out = []
    if "satisfies" in item:
        title = item["name"]
        out += [f"# {title}", "", f"<p class='cert'>Model{' (conjectured)' if conj else ''} — {cert}.</p>", ""]
        out += ["## Package", ""]
        out += [_stmt_line(x, names, stmts) for x in item["satisfies"]]
        out += [f"- **¬ {names[x]}.** {stmts[x].strip()}" for x in item["violates"]]
        if item.get("description", "").strip():
            out += ["", "## Construction", "", item["description"].strip()]
        if item.get("companion_of"):
            base = next((m for m in data["models"] if m["id"] == item["companion_of"]), {})
            out += ["", f"The conjectured verdicts of [{base.get('name', item['companion_of'])}]({item['companion_of']}.html): "
                    "its established verdicts together with those its conjectured arguments propose."]
        if (item.get("definition") or "").strip():
            out += ["", "## Definition", "", item["definition"].strip()]
            group = next((g for g in data.get("groups", []) if g.get("id") == item.get("group")), None)
            if group:
                out += ["", f"*A member of the group {group.get('name', group['id'])}, which supplies this definition "
                        "with the record's settings, and the arguments marked as shared.*"]
        if "arguments" in item:
            out += ["", "## Arguments", ""] + argument_md(item, data)
    else:
        prem = " ∧ ".join(names[x] for x in item["premises"]) or "⊤"
        title = f"{prem} ⇒ {names[item['conclusion']]}"
        out += [f"# {title}", "", f"<p class='cert'>{'Conjecture' if conj else 'Result'} — {cert}.</p>", ""]
        out += ["## Premises", ""] + ([_stmt_line(x, names, stmts) for x in item["premises"]] or ["- ⊤"])
        out += ["", "## Conclusion", "", _stmt_line(item["conclusion"], names, stmts)]
        if item.get("proof", "").strip():
            out += ["", "## Proof", "", item["proof"].strip()]
    if item.get("notes", "").strip() and not item.get("companion_of"):  # a companion's notes are its arguments
        out += ["", "## Notes", "", item["notes"].strip()]
    if item.get("changes"):
        out += ["", "## Revisions", ""] + _change_lines(item, names)
    if item.get("history"):
        out += ["", "## History", "", "The record's revision log before it was written as arguments.", ""] + _change_lines(item, names, key="history")
    if item.get("sources"):
        labels = item.get("source_names", [])
        out += ["", "## Sources", ""] + [f"- **{labels[i]}** — {x}" if i < len(labels) else f"- {x}" for i, x in enumerate(item["sources"])]
    out += ["", f"<p class='cert'>Record: <code>{item['_file']}</code></p>", ""]
    return "\n".join(out)


def _md_to_html(md: str) -> str:
    import shutil, subprocess
    pandoc = shutil.which("pandoc")
    if pandoc:
        return subprocess.run([pandoc, "--katex", "-f", "markdown+tex_math_single_backslash", "-t", "html"], input=md, capture_output=True, text=True, check=True).stdout
    return _markdown_fallback(md)


def _markdown_fallback(md: str) -> str:
    """Protect TeX before Markdown consumes its backslashes and underscores."""
    import re
    import markdown
    from html import escape
    saved = []
    marker = 'PMAPMATHTOKEN'
    while marker in md:
        marker += 'X'
    # Code alternatives come first: examples of TeX remain literal code.
    tokens = re.compile(
        r'(?P<fence>^ {0,3}(?P<ticks>`{3,}|~{3,})[^\n]*\n.*?^ {0,3}(?P=ticks)[ \t]*$)'
        r'|(?P<indent>^(?: {4}|\t)[^\n]*(?:\n(?: {4}|\t)[^\n]*)*)'
        r'|(?P<code>(?P<tick>`+)[^`]*?(?P=tick))'
        r'|(?P<math>(?<!\\)(?:\$\$[\s\S]*?(?<!\\)\$\$|\\\[[\s\S]*?\\\]|\\\([\s\S]*?\\\)|\$(?!\s)(?:\\.|[^$\n])+?(?<![\\\s])\$(?!\d)))',
        re.M | re.S)
    def protect(match):
        if not match.group('math'):
            return match[0]
        raw = match[0]
        display = raw.startswith(('$$', r'\['))
        size = 2 if raw.startswith(('$$', r'\[', r'\(')) else 1
        saved.append(f'<span class="math {"display" if display else "inline"}">{escape(raw[size:-size])}</span>')
        return f'{marker}{len(saved)-1}ENDTOKEN'
    html = markdown.markdown(tokens.sub(protect, md), extensions=['extra', 'sane_lists'])
    return re.sub(marker + r'(\d+)ENDTOKEN', lambda m: saved[int(m[1])], html)


def render_writeups(topic_id: str, data: dict, outdir: Path) -> dict:
    """Write build/<topic>/writeups/<id>.{md,html}; return {id: {md, html, handwritten}}."""
    from html import escape
    wdir = outdir / "writeups"
    wdir.mkdir(parents=True, exist_ok=True)
    src = TOPICS / topic_id / "writeups"
    files = {}
    # A write-up an argument names need not belong to a record of its own; it is published too.
    named = {a["writeup"]: {"id": a["writeup"]} for s in data.get("model_sources", []) for _, a in _arguments(s)
             if isinstance(a, dict) and a.get("writeup")}
    records = {x["id"] for x in data["results"] + data["models"]}
    for item in data["results"] + data["models"] + [x for i, x in named.items() if i not in records]:
        iid = item["id"]
        hand = src / f"{iid}.md"
        md = hand.read_text(encoding="utf-8") if hand.exists() else generate_writeup(item, data)
        refs = paper_references_md(item, data, "../")
        if refs:
            md = md.rstrip() + "\n\n## Paper references\n\n" + refs + "\n"
        title = md.splitlines()[0].lstrip("# ").strip() if md.startswith("#") else iid
        (wdir / f"{iid}.md").write_text(md, encoding="utf-8")
        body = _md_to_html(md.split("\n", 1)[1] if md.startswith("#") else md)   # heading stripped; the page header carries the title
        (wdir / f"{iid}.html").write_text(
            f'<!doctype html><html lang="en"><head><meta charset="utf-8">'
            f'<meta name="viewport" content="width=device-width, initial-scale=1">'
            f'<title>{escape(title)}</title>{theme_head(topic_id, math_path="../math")}</head>'
            f'<body class="writeup-page">{WRITEUP_NAV}'
            f'<header id="title-block-header"><h1>{escape(title)}</h1></header>{body}</body></html>', encoding="utf-8")
        files[iid] = {"md": f"writeups/{iid}.md", "html": f"writeups/{iid}.html", "handwritten": hand.exists()}
    return files


def render_lean_index(data: dict, source: Path, destination: Path) -> None:
    """Keep the Lean download usable on hosts that disable directory listings."""
    from html import escape
    from urllib.parse import quote
    definitions = sum(bool(p.get("lean_def")) for p in data["principles"])
    results = sum(r["certificate"].get("lean") == "verified" for r in data["results"])
    models = sum(m["certificate"].get("lean") == "verified" for m in data["models"])
    verdicts = [v for v in lean_verdicts(data) if v["status"] == "verified"]
    files = sorted(p.relative_to(source) for p in source.rglob("*")
                   if p.is_file() and not any(_ignored(part) for part in p.relative_to(source).parts))
    links = ''.join(f'<li><a href="{quote(str(path))}">{escape(str(path))}</a></li>' for path in files)
    title = escape(data["topic"]["title"] + ' — Lean files')
    html = (f'<!doctype html><html lang="en"><head><meta charset="utf-8">'
            f'<meta name="viewport" content="width=device-width, initial-scale=1">'
            f'<title>{title}</title>{theme_head(data["topic"]["id"], math_path="../math")}</head>'
            f'<body class="writeup-page">{WRITEUP_NAV}<h1>Lean formalisation</h1>'
            f'<p>{definitions}/{len(data["principles"])} principles defined; '
            f'{results}/{len(data["results"])} result proofs verified; '
            f'{models}/{len(data["models"])} model witnesses verified; '
            f'{len(verdicts)} single verdicts verified in {len({v["model"] for v in verdicts})} models.</p>'
            '<p>Definitions and generated statements describe the claims. Only completed, '
            'audited proofs receive a Lean-verified certificate. The verification report '
            'records the remaining work and the formalisation assumptions.</p>'
            f'<ul>{links}</ul></body></html>')
    (destination / "index.html").write_text(html, encoding="utf-8")


def lean_source_links(topic_id: str, data: dict) -> dict | None:
    """Links from records to the Lean sources, from the index lean-check writes.

    Each is a URL made from the topic's `lean.source_url` template, pinned to the commit the
    build runs at, so the lines it points to are the lines that were indexed. Lean changes
    must therefore be committed before building; the build warns when they are not.
    """
    import subprocess
    cfg = data["topic"].get("lean") or {}
    template, index = cfg.get("source_url"), (cfg.get("index") or {}).get("file")
    root = TOPICS / topic_id / "lean"
    if not template or not index or not (root / index).exists():
        return None
    git = lambda *args: subprocess.run(["git", *args], cwd=root, capture_output=True, text=True).stdout.strip()
    commit = git("rev-parse", "HEAD")
    if not commit:
        return None
    if git("status", "--porcelain", "--", "."):
        print(f"warning: {topic_id}: Lean links pin {commit[:7]}, but lean/ has uncommitted changes")
    idx = json.loads((root / index).read_text(encoding="utf-8"))
    link = lambda loc, label: {"label": label, "url": template.format(
        commit=commit, file=loc["file"], start=loc["lines"][0], end=loc["lines"][1])}

    def links(entry: dict, definitions: bool = False) -> list[dict]:
        out = [link(d, "definition") for d in entry.get("definitions", [])[1:]] if definitions else []
        def label(p: dict) -> str:  # a variant's two directions: official ⇒ form, form ⇒ official
            last = p["name"].rsplit(".", 1)[-1]
            return ("argument" if p["name"].startswith("Classicism.Map.Arguments.")
                    else "condition met" if p["name"].startswith("Classicism.Map.Meets.")
                    else "proof ⇒" if last.startswith("to_") else "proof ⇐" if last.startswith("of_")
                    else "proof at every arity" if p["file"].endswith("Arity.lean") else "proof")
        out += [link(p, label(p)) for p in entry.get("proofs", [])]
        out.append(link(entry["certificate"], "certificate"))
        seen, unique = set(), []
        for item in out:
            if item["url"] not in seen:
                seen.add(item["url"]); unique.append(item)
        return unique

    definitions = idx.get("definitions", {})
    principles = {}
    for p in data["principles"]:
        name = p.get("lean_def", "")
        for suffix in (".schemaIn", ".listSchemaIn"):
            name = name.removesuffix(suffix)
        if name in definitions:
            principles[p["id"]] = [link(definitions[name], "definition")]
    # A model's verdict: where the model is defined, then the proof and the certificate.
    verdict_links = lambda e: [link(d, "model") for d in e.get("definitions", [])] + links(e)
    # Verified: indexed after a successful build, resting on the allowed axioms only.
    sound = lambda e: set(e["certificate"].get("axioms", [])) <= LEAN_ALLOWED_AXIOMS
    return {"declarations": {n: {"link": link(d, n.rsplit(".", 1)[-1]), "theory": d.get("classicism")}
                             for n, d in idx.get("declarations", {}).items()},
            "verified": {f"{mid}/{pid}" for mid, vs in idx.get("models", {}).items() for pid, e in vs.items() if sound(e)}
                        | {k for k, e in idx.get("arguments", {}).items() if sound(e)},
            "arguments": {k: links(e) for k, e in idx.get("arguments", {}).items()},
            "results": {rid: links(e) for rid, e in idx.get("results", {}).items()},
            "principles": principles,
            "variants": {pid: {vid: links(e, True) for vid, e in vs.items()}
                         for pid, vs in idx.get("forms", {}).items()},
            "models": {mid: {pid: verdict_links(e) for pid, e in vs.items()}
                       for mid, vs in idx.get("models", {}).items()}}


# Lynchpin row fields whose values are principle or model ids, dictionary-encoded in the viewer
# payload: a string becomes its index in `lynchpins.strings`, a list of them a list of indices.
LYNCHPIN_ID_FIELDS = ("premises", "premise_sets", "conclusion", "conclusions", "principle", "model")


def compact_viewer_payload(payload: dict) -> dict:
    """The payload as the viewer receives it (data.json and the page), encoded to fit the website
    host's 25 MiB limit per file; `decodePayload` in viewer/template.html restores it exactly.

    - Each lynchpin report's `rows` become a table, `{"fields": [...], "data": [[...], ...]}`, a
      missing field null (no row stores a null), with ids dictionary-encoded in `lynchpins.strings`.
    - `auto` is dropped when it is exactly `rows` ordered by `auto_rank`, as `build` makes it; the
      report is marked `auto_from_rows` and the viewer rebuilds it.
    - A model argument occurring more than once (a group's shared arguments, copied into every
      member and generated variant) is stored once in `shared_arguments` and cited as `{"$ref": i}`.
    The input is not modified."""
    out = dict(payload)
    lp = payload.get("lynchpins")
    if isinstance(lp, dict) and lp.get("reports"):
        strings: list[str] = []
        index: dict[str, int] = {}

        def enc(v):
            if isinstance(v, list):
                return [enc(x) for x in v]
            if isinstance(v, str):
                if v not in index:
                    index[v] = len(strings)
                    strings.append(v)
                return index[v]
            return v

        reports = []
        for rep in lp["reports"]:
            rep = dict(rep)
            rows = rep.get("rows")
            if isinstance(rows, list) and rows and not any(v is None for r in rows for v in r.values()):
                if rep.get("auto") == sorted((r for r in rows if r.get("auto_rank") is not None),
                                             key=lambda r: r["auto_rank"]):
                    del rep["auto"]
                    rep["auto_from_rows"] = True
                fields = sorted({k for r in rows for k in r})
                rep["rows"] = {"fields": fields, "data": [
                    [enc(r[f]) if f in LYNCHPIN_ID_FIELDS and f in r else r.get(f) for f in fields]
                    for r in rows]}
            reports.append(rep)
        out["lynchpins"] = {**lp, "reports": reports, "strings": strings}
    seen: dict[str, int] = {}
    for m in payload.get("models", []):
        for a in m.get("arguments") or []:
            k = json.dumps(a, sort_keys=True, ensure_ascii=False)
            seen[k] = seen.get(k, 0) + 1
    shared = [k for k, n in seen.items() if n > 1]
    if shared:
        ref = {k: i for i, k in enumerate(shared)}
        out["shared_arguments"] = [json.loads(k) for k in shared]
        out["models"] = [
            {**m, "arguments": [
                {"$ref": ref[k]} if (k := json.dumps(a, sort_keys=True, ensure_ascii=False)) in ref else a
                for a in m["arguments"]]} if m.get("arguments") else m
            for m in payload.get("models", [])]
    return out


def build_topic(topic_id: str, out: Path | None = None, *, fragment: bool = False, starter_archive: Path | None = None) -> Path:
    """Build build/<topic>/ : index.html (viewer), data.json, source.zip, <topic>-map.zip, writeups/, sources/, lean/.
    With --out, write only the viewer HTML to that path (fragment=True omits the page skeleton)."""
    import shutil
    if not validate_topic(topic_id, quiet=True):
        validate_topic(topic_id)
        sys.exit(f"{topic_id}: fix validation errors before building")
    data = load_topic(topic_id)
    an = analyse(data)
    outdir = BUILD / topic_id
    outdir.mkdir(parents=True, exist_ok=True)
    write_math_assets(outdir)
    generate_lean_statements(topic_id)
    files = render_writeups(topic_id, data, outdir)
    # database + source + lean + AI bundle
    zip_tree(TOPICS / topic_id, topic_id, outdir / "source.zip")
    sources_dir = TOPICS / topic_id / "sources"
    # Replace managed download directories so removed files cannot survive a
    # rebuild. Git ignore rules alone do not govern website copies or ZIPs.
    for directory in ("sources", "lean"):
        destination = outdir / directory
        if destination.exists():
            shutil.rmtree(destination)
    if sources_dir.exists():
        shutil.copytree(sources_dir, outdir / "sources",
                        ignore=shutil.ignore_patterns(*IGNORE))
    lean_dir = TOPICS / topic_id / "lean"
    downloads = {"bundle": f"{topic_id}-map.zip", "json": "data.json", "zip": "source.zip"}
    if starter_archive:
        shutil.copy2(starter_archive, outdir / starter_archive.name)
        downloads["starter"] = starter_archive.name
    if lean_dir.exists() and any(lean_dir.iterdir()):
        shutil.copytree(lean_dir, outdir / "lean", dirs_exist_ok=True,
                        ignore=shutil.ignore_patterns(*IGNORE))
        render_lean_index(data, lean_dir, outdir / "lean")
        downloads["lean"] = "lean/"
    base = export_json(topic_id, data=data, an=an)   # the rankings, once
    payload = enriched_payload(topic_id, downloads, base=base)
    for item in payload["results"] + payload["models"]:
        item["files"] = files.get(item["id"], {})
    lean_links = lean_source_links(topic_id, data)
    if lean_links:
        # A Background item's declarations: linked when indexed, verified when every one passes
        # the check of a shallow proof; `C⁻` when none needs Existence at e.
        if payload.get("background_pages"):
            cited = {n for n, _ in background_lean_names(data)}
            payload["background_lean"] = {n: {"link": d["link"], "theory": d["theory"]}
                                          for n, d in lean_links["declarations"].items() if n in cited}
        for item in payload.get("background_items", []):
            found = [lean_links["declarations"][n] for n in item["lean"] if n in lean_links["declarations"]]
            if found:
                item["lean_links"] = [d["link"] for d in found]
                if len(found) == len(item["lean"]) and all(d["theory"] for d in found):
                    item["lean_status"] = "verified"
                    item["lean_theory"] = "C⁻" if all(d["theory"] == "C⁻" for d in found) else "C"
        for item in payload["results"]:
            if item["id"] in lean_links["results"]:
                item["lean_links"] = lean_links["results"][item["id"]]
        for p in payload["principles"]:
            if p["id"] in lean_links["principles"]:
                p["lean_links"] = lean_links["principles"][p["id"]]
            for v in p.get("variants") or []:
                if v["id"] in lean_links["variants"].get(p["id"], {}):
                    v["lean_links"] = lean_links["variants"][p["id"]][v["id"]]
        # The verdicts the map's arguments give a model in Lean (lean_derived_verdicts) join its
        # own, verified when indexed; an argument's Lean verdicts carry their status and links
        # wherever the argument is shown: on its page, its group's, and each model it applies to.
        derived = {}
        for d in lean_derived_verdicts(data):
            derived.setdefault(d["model"], []).append(
                {"holds" if d["holds"] else "fails": d["principle"], "ref": d["ref"], "via": d["via"],
                 "status": "verified" if f"{d['model']}/{d['principle']}" in lean_links["verified"] else "stated"})
        for m in payload["models"]:
            if m["id"] in derived:
                m["lean"] = {**(m.get("lean") or {}), "verdicts": [*((m.get("lean") or {}).get("verdicts") or []), *derived[m["id"]]]}
            for v in (m.get("lean") or {}).get("verdicts") or []:
                pid = v.get("holds", v.get("fails"))
                if pid in lean_links["models"].get(m["id"], {}):
                    v["lean_links"] = lean_links["models"][m["id"]][pid]

        def mark(entries: list, scope: str) -> list:
            out = []
            for e in entries or []:
                key = f"{scope}/{e.get('holds', e.get('fails'))}"
                out.append({**e, "status": "verified" if key in lean_links["verified"] else "stated",
                            "lean_links": lean_links["arguments"].get(key, [])})
            return out
        for a in payload.get("general_arguments", []):
            if a.get("lean"):
                a["lean"] = mark(a["lean"], a["id"])
        for g in payload.get("groups", []):
            for a in g.get("arguments") or []:
                if isinstance(a, dict) and a.get("lean"):
                    a["lean"] = mark(a["lean"], f"{g['id']}/{a.get('id')}")
        for m in payload["models"]:
            for a in m.get("arguments") or []:
                if isinstance(a, dict) and a.get("lean") and (a.get("general") or a.get("group")):
                    a["lean"] = mark(a["lean"], a["general"] if a.get("general") else f"{a['group']}/{a.get('id')}")
    # Compact: the website host serves no file over 25 MiB, and indentation alone added half again.
    viewer_payload = compact_viewer_payload(payload)
    (outdir / "data.json").write_text(json.dumps(viewer_payload, ensure_ascii=False, separators=(",", ":")), encoding="utf-8")
    bundle_topic(topic_id, data=data, an=an, base=base)
    html = TEMPLATE.read_text(encoding="utf-8").replace("<!--__PMAP_THEME__-->", theme_head(topic_id, math_path=None if out else 'math'))
    blob = json.dumps(viewer_payload, ensure_ascii=False, separators=(",", ":")).replace("</", "<\\/")
    html = html.replace("/*__PMAP_DATA__*/null", blob)
    html = html.replace("__PMAP_TITLE__", payload["topic"]["title"])
    if not fragment:
        head, body = html.split('<div class="app">', 1)
        html = ('<!doctype html>\n<html lang="en">\n<head>\n<meta charset="utf-8">\n'
                '<meta name="viewport" content="width=device-width, initial-scale=1">\n'
                f'{head}</head>\n<body>\n<div class="app">{body}\n</body>\n</html>\n')
    out = out or outdir / "index.html"
    out.write_text(html, encoding="utf-8")
    return out


# ----------------------------------------------------------------------------
# Lean integration
# ----------------------------------------------------------------------------
#
# The YAML is the single source of truth for *statements*. Each principle names one
# hand-written Lean definition in `lean_def`; every result and model statement is then
# generated from its premises and conclusion, in the shape the topic declares under
# `lean:` (see lean_config). A proof cannot silently drift from the
# recorded claim, because the statement it must inhabit is machine-written from the
# record. `lean-check` builds the library and refuses to call anything verified while it
# still depends on `sorryAx`.


def _lean_name(rid: str) -> str:
    return rid.replace("-", "_")


def lean_lib_dir(topic_id: str, data: dict) -> tuple[Path, str] | None:
    lib = data["topic"].get("lean_lib")
    root = TOPICS / topic_id / "lean"
    return (root, lib) if lib and root.exists() else None


def lean_coverage(data: dict) -> dict:
    """Which records can be stated in Lean yet: every principle they mention needs a lean_def."""
    defs = {p["id"]: p["lean_def"] for p in data["principles"] if p.get("lean_def")}
    ready, blocked = [], {}
    for item in data["results"] + data["models"]:
        used = (item["premises"] + [item["conclusion"]]) if "premises" in item \
            else (item["satisfies"] + item["violates"])
        missing = sorted({x for x in used if x != FALSE and x not in defs})
        (ready.append(item) if not missing else blocked.setdefault(item["id"], missing))
    return {"defs": defs, "ready": ready, "blocked": blocked}


LEAN_DEFAULTS = {"definition_check": "example : Prop := {def}",
                 "result": {"binder": "", "principle": "{def}"},
                 "model": {"binder": "", "principle": "{def}"},
                 "verdict": {"imports": [], "holds": "{model} ⊨ {def}", "fails": "¬ ({model} ⊨ {def})",
                             "relative_categories": [], "relative": ""},
                 "argument": {"binder": "∀ M,", "model": "M", "condition": "{cond} {model}", "relative": "",
                              "holds": "{model} ⊨ {def}", "fails": "¬ ({model} ⊨ {def})"}}


def lean_relative_model(m: dict, model: str, is_model: str | None, cfg: dict) -> dict | None:
    """The model a record's verdicts on the relative categories are about, when the topic builds
    one from the record's own by the value of one of its settings (`lean.verdict.relative_models`):
    its term, its proof of being a model, its proof of the `relative` conjunct, its proofs of
    conditions, and how a verdict proved of the record's model carries over. None otherwise."""
    rm = cfg["verdict"].get("relative_models") or {}
    value = (m.get("settings") or {}).get(rm.get("setting"))
    spec = (rm.get("values") or {}).get(value) if isinstance(value, str) else None
    if not spec or not model or not is_model:
        return None
    f = lambda t: t.replace("{model}", model).replace("{is_model}", is_model)
    return {"model": f(spec["model"]), "is_model": f(spec["is_model"]), "relative": f(spec["relative"]),
            "meets": {k: f(v) for k, v in (spec.get("meets") or {}).items()}, "given": spec.get("given")}


def lean_verdicts(data: dict) -> list[dict]:
    """The single verdicts of models proved in Lean: a model record's `lean.verdicts`, each
    with the model's id and Lean term, the principle, whether it holds, and its generated
    statement's name, `Models.<model>.<principle>` under the topic's `Statements`."""
    cfg = lean_config(data)
    relative = {p["id"] for p in data["principles"] if p.get("category") in cfg["verdict"]["relative_categories"]}
    out = []
    for m in data["models"]:
        lean = m.get("lean")
        groups = {g["id"]: g for g in data.get("groups", [])}
        if not isinstance(lean, dict) or m.get("variant_of") or m.get("_companion_of") \
                or choiceless(groups.get(m.get("group")), m.get("settings") or {}):  # Lean's metatheory has choice
            continue
        glean = (groups.get(m.get("group")) or {}).get("lean") or {}
        term = lean.get("model") or (glean["model"].replace("{param}", f"({lean['param']})")
                                     if glean and lean.get("param") else "")
        is_model = lean.get("is_model") or (glean["is_model"].replace("{param}", f"({lean['param']})")
                                            if glean and lean.get("param") else "")
        rm = lean_relative_model(m, term, is_model, cfg)
        for v in lean.get("verdicts") or []:
            holds = "holds" in v
            pid = v.get("holds" if holds else "fails")
            out.append({"model": m["id"], "term": rm["model"] if rm and pid in relative else term,
                        "principle": pid, "holds": holds,
                        "ref": v.get("ref", ""), "status": v.get("status", "stated"), "_file": m["_file"],
                        "statement": f"Models.{_lean_name(m['id'])}.{_lean_name(pid)}"})
    return out


def lean_arguments(data: dict) -> list[dict]:
    """The verdicts of general arguments proved in Lean: a topic argument's or a group's shared
    argument's `lean` entries, each with the conditions and `given` principles it assumes and its
    generated statement's name, `Arguments.<argument>.<principle>` for the topic's,
    `Arguments.<group>.<argument>.<principle>` for a group's."""
    out = []
    sources = [(None, c) for c in data.get("general_arguments", [])]
    sources += [(g, a) for g in data.get("groups", []) for a in g.get("arguments") or [] if isinstance(a, dict)]
    for g, a in sources:
        for e in a.get("lean") or []:
            if not isinstance(e, dict):
                continue
            holds = "holds" in e
            pid = e.get("holds" if holds else "fails")
            scope = f"{_lean_name(g['id'])}." if g else ""
            out.append({"group": g["id"] if g else None, "argument": a.get("id"), "principle": pid, "holds": holds,
                        "ref": e.get("ref", ""), "requires": list(a.get("requires") or []),
                        "given": list(a.get("given") or []), "_file": (g or a)["_file"],
                        "statement": f"Arguments.{scope}{_lean_name(a.get('id', ''))}.{_lean_name(pid)}"})
    return out


def _group_conditions(group: dict | None) -> dict:
    return {c.get("id"): c for c in (group or {}).get("conditions") or [] if isinstance(c, dict)}


def lean_argument_statement(item: dict, data: dict, cfg: dict | None = None) -> str | None:
    """The proposition an argument's verdict asserts: for every model meeting its conditions, and
    holding its `given` principles, the verdict. None while a condition has no Lean predicate or a
    principle no lean_def."""
    cfg = cfg or lean_config(data)
    defs = {p["id"]: p.get("lean_def") for p in data["principles"]}
    topic_conds = {c.get("id"): c for c in data.get("conditions", [])}
    shape = cfg["argument"]
    if item["group"]:
        group = next(g for g in data["groups"] if g["id"] == item["group"])
        glean = group.get("lean") or {}
        if not glean:
            return None
        var = glean["var"]
        model = "(" + glean["model"].replace("{param}", var) + ")"
        binder = f"∀ {glean['binder']},"
        own = _group_conditions(group)
    else:
        model, binder, own = shape["model"], shape["binder"], {}
    hyps = []
    principle = next((p for p in data["principles"] if p["id"] == item["principle"]), {})
    if principle.get("category") in cfg["verdict"]["relative_categories"] and shape.get("relative"):
        hyps.append(shape["relative"].replace("{model}", model))
    for c in item["requires"]:
        if c in own:
            if not own[c].get("lean"):
                return None
            hyps.append(f"{own[c]['lean']} {glean['var']}")
        elif (topic_conds.get(c) or {}).get("lean"):
            hyps.append(shape["condition"].replace("{cond}", topic_conds[c]["lean"]).replace("{model}", model))
        else:
            return None
    for gp in item["given"]:
        if not defs.get(gp):
            return None
        hyps.append(shape["holds"].replace("{model}", model).replace("{def}", defs[gp]))
    if not defs.get(item["principle"]):
        return None
    verdict = shape["holds" if item["holds"] else "fails"].replace("{model}", model).replace("{def}", defs[item["principle"]])
    return " ".join([binder, *(h + " →" for h in hyps), verdict])


def lean_derived_verdicts(data: dict) -> list[dict]:
    """The verdicts a model gets in Lean from the map's general arguments: for each argument the
    map applies to the model (a group's shared argument, or a topic argument whose conditions it
    meets) with a verdict proved in Lean, when the model's record (or its group) proves in Lean
    each condition the argument requires. The certificate applies the argument's to the model;
    `lean_verdicts` gives the model's own verdicts, which take precedence."""
    groups = {g["id"]: g for g in data.get("groups", [])}
    general = {c.get("id"): c for c in data.get("general_arguments", [])}
    defs = {p["id"]: p.get("lean_def") for p in data["principles"]}
    cfg = lean_config(data)
    relative = {p["id"] for p in data["principles"] if p.get("category") in cfg["verdict"]["relative_categories"]}
    by_arg = {(a["group"], a["argument"], a["principle"]): a for a in lean_arguments(data)}
    own = {(v["model"], v["principle"]): v for v in lean_verdicts(data)}
    out = []
    for m in data["models"]:
        lean = m.get("lean")
        if not isinstance(lean, dict) or m.get("variant_of") or m.get("_companion_of") \
                or choiceless(groups.get(m.get("group")), m.get("settings") or {}):  # Lean's metatheory has choice
            continue
        group = groups.get(m.get("group"))
        glean = (group or {}).get("lean") or {}
        param = lean.get("param")
        fill = lambda t: t.replace("{param}", f"({param})") if param else None
        model = lean.get("model") or (fill(glean["model"]) if glean and param else None)
        is_model = lean.get("is_model") or (fill(glean["is_model"]) if glean and param else None)
        if not model or not is_model:
            continue
        in_family = bool(glean and param and settings_match(glean.get("settings"), m.get("settings") or {}))
        gconds = _group_conditions(group)
        meets = dict(lean.get("meets") or {})
        proofs = {}
        for c in (m.get("met") or {}):
            if c in meets:
                proofs[c] = meets[c]
            elif c not in gconds and in_family and c in (glean.get("meets") or {}):
                proofs[c] = fill(glean["meets"][c])
        holding = {v["principle"]: v["ref"] for k, v in own.items() if k[0] == m["id"] and v["holds"]}
        done = {k[1] for k in own if k[0] == m["id"]}
        rm = lean_relative_model(m, model, is_model, cfg)
        # Verdicts on the relative categories second, so that their `given` can cite the others.
        for phase in (False, True):
            if phase and not rm:
                continue
            have = {**proofs, **rm["meets"]} if phase else proofs
            for a in m.get("arguments") or []:
                if not isinstance(a, dict) or a.get("standing") == "conjectured" or a.get("withdrawn"):
                    continue
                gid = a.get("group")
                if gid:
                    if not in_family:
                        continue
                    source = next((x for x in groups[gid].get("arguments") or [] if isinstance(x, dict) and x.get("id") == a.get("id")), None)
                elif a.get("general"):
                    source = general.get(a["general"])
                else:
                    continue
                if not source:
                    continue
                reqs = list(source.get("requires") or [])
                if any(c not in have for c in reqs) or any(gp not in holding for gp in source.get("given") or []):
                    continue
                for e in source.get("lean") or []:
                    holds = "holds" in e
                    pid = e.get("holds" if holds else "fails")
                    item = by_arg.get((gid, source.get("id"), pid))
                    if not item or pid in done or not defs.get(pid) or (pid in relative) != phase:
                        continue
                    args = [f"({have[c]})" for c in reqs]
                    term = model
                    if phase:
                        if gid:
                            continue
                        given = rm["given"] or "{proof}"
                        givens = [f"({given.replace('{proof}', f'({holding[gp]}).2')})" for gp in source.get("given") or []]
                        term = rm["model"]
                        cert = (f"⟨{rm['relative']}, {rm['is_model']}, {e['ref']} ({term}) ({rm['is_model']}) "
                                f"({rm['relative']}) {' '.join(args + givens)}⟩")
                    elif gid:
                        cert = f"⟨{is_model}, {e['ref']} ({param}) {' '.join(args)}⟩"
                    else:
                        givens = [f"({holding[gp]}).2" for gp in source.get("given") or []]
                        cert = f"⟨{is_model}, {e['ref']} ({model}) ({is_model}) {' '.join(args + givens)}⟩"
                    done.add(pid)
                    if holds:
                        holding[pid] = f"Classicism.Map.Models.{_lean_name(m['id'])}.{_lean_name(pid)}"
                    out.append({"model": m["id"], "term": term, "principle": pid, "holds": holds,
                                "ref": f"Classicism.Map.Models.{_lean_name(m['id'])}.{_lean_name(pid)}",
                                "status": "stated", "_file": m["_file"], "cert": cert, "derived": True,
                                "via": {"group": gid, "argument": source.get("id")} if gid else {"argument": source.get("id")},
                                "statement": f"Models.{_lean_name(m['id'])}.{_lean_name(pid)}"})
    return out


def lean_verdict_statement(item: dict, data: dict, cfg: dict | None = None) -> str | None:
    """The proposition a model's verdict asserts, or None while its principle has no lean_def."""
    cfg = cfg or lean_config(data)
    p = next((p for p in data["principles"] if p["id"] == item["principle"]), None)
    if p is None or not p.get("lean_def"):
        return None
    shape = cfg["verdict"]
    fill = lambda t: t.replace("{model}", item["term"]).replace("{def}", p["lean_def"])
    body = fill(shape["holds" if item["holds"] else "fails"])
    if p.get("category") in shape["relative_categories"] and shape["relative"]:
        body = fill(shape["relative"]) + " ∧ " + body
    return body


def lean_config(data: dict) -> dict:
    """How this topic writes a generated Lean statement.

    Declared under `lean:` in topic.yaml: `imports`, `namespace`, a `definition_check`
    template, and for results and models a `binder` and how a `principle` applies, with
    `{def}` standing for the principle's `lean_def`; and for a model's single verdicts
    (`lean_verdicts`) how one that `holds` or `fails` reads, `{model}` standing for the
    record's Lean model, with a `relative` conjunct for principles whose definition
    depends on the model's signature (`relative_categories`). Without a declaration, principles are
    plain propositions and a result reads A → B → C. Nothing here knows any framework.
    """
    lib = data["topic"].get("lean_lib")
    cfg = data["topic"].get("lean") or {}
    defs = [p["lean_def"] for p in data["principles"] if p.get("lean_def")]
    namespace = cfg.get("namespace") or (defs[0].rsplit(".", 1)[0] if defs else lib)
    return {"imports": list(cfg.get("imports") or [f"{lib}.Principles"]), "namespace": namespace,
            "definition_check": cfg.get("definition_check", LEAN_DEFAULTS["definition_check"]),
            "result": {**LEAN_DEFAULTS["result"], **cfg.get("result", {})},
            "model": {**LEAN_DEFAULTS["model"], **cfg.get("model", {})},
            "verdict": {**LEAN_DEFAULTS["verdict"], **cfg.get("verdict", {})},
            "argument": {**LEAN_DEFAULTS["argument"], **cfg.get("argument", {})}}


def generate_lean_statements(topic_id: str) -> Path | None:
    """Write <lib>/Statements.lean: one generated Prop per statable record, in the topic's own shape."""
    data = load_topic(topic_id)
    loc = lean_lib_dir(topic_id, data)
    if loc is None:
        return None
    root, lib = loc
    # The declarations the Background's items cite, for the index script to locate and audit.
    index_file = ((data["topic"].get("lean") or {}).get("index") or {}).get("file")
    if index_file:
        cited = sorted({n for n, _ in background_lean_names(data)})
        target = root / Path(index_file).parent / "background-names.txt"
        text = "".join(n + "\n" for n in cited)
        if cited or target.exists():
            if not target.exists() or target.read_text(encoding="utf-8") != text:
                target.write_text(text, encoding="utf-8")
    cov, cfg = lean_coverage(data), lean_config(data)
    defs, names = cov["defs"], {FALSE: "⊥", **{p["id"]: p["name"] for p in data["principles"]}}
    ns = cfg["namespace"]
    fill = lambda template, pid: template.replace("{def}", defs[pid])

    out = [*(f"import {m}" for m in cfg["imports"]), "",
           "/-!", "# Generated statements", "",
           "Written by `pmap lean " + topic_id + "` from the YAML records. **Do not edit.**",
           "",
           "Each declaration below is the statement of one database record, assembled from its",
           "premises and conclusion. A proof is supplied by inhabiting the corresponding `Prop`,",
           "so a Lean proof cannot drift from the claim the map displays. Regenerate after any",
           "change to a record or to a principle's `lean_def`.", "-/", "",
           f"namespace {ns}.Statements", f"open {ns}", ""]

    # Check definitions even when a principle is not yet used by an edge or model.
    for pid in sorted(defs):
        out += [f"/-- Principle definition check: `{pid}`. -/", *fill(cfg["definition_check"], pid).split("\n"), ""]

    for item in cov["ready"]:
        nm = _lean_name(item["id"])
        conj = item.get("status") == "conjectured"
        shape = cfg["result" if "premises" in item else "model"]
        if "premises" in item:
            head = " ∧ ".join(names[x] for x in item["premises"]) or "⊤"
            out += [f"/-- `{item['id']}`" + ("  (conjectured)" if conj else ""), "",
                    f"{head} ⇒ {names[item['conclusion']]} -/"]
        else:
            out += [f"/-- `{item['id']}`" + ("  (conjectured)" if conj else ""), "",
                    f"{item['name']}: a witness satisfying {len(item['satisfies'])} principles",
                    f"and violating {len(item['violates'])}. -/"]
        out.append(f"def {nm} : Prop :=")
        pad = "  "
        if shape["binder"]:
            out.append("  " + shape["binder"])
            pad = "    "
        if "premises" in item:
            out += [f"{pad}{fill(shape['principle'], x)} →" for x in item["premises"]]
            out += [pad + (shape.get("falsum", "False") if item["conclusion"] == FALSE else fill(shape["principle"], item["conclusion"])), ""]
        else:
            lines = [f"{pad}{fill(shape['principle'], x)}" for x in item["satisfies"]] + \
                    [f"{pad}¬ {fill(shape['principle'], x)}" for x in item["violates"]]
            out += [" ∧\n".join(lines), ""]

    # Variants (equivalent forms) of a principle: each is stated as equivalent to the
    # official form, where its reserved `lean` field names its statement.
    shape = cfg["result"]
    apply = lambda d: shape["principle"].replace("{def}", d)
    for p in data["principles"]:
        for form in p.get("variants") or []:
            ref = (form.get("lean") or {}).get("ref")
            if p["id"] not in defs or not ref:
                continue
            nm = f"{_lean_name(p['id'])}.{_lean_name(form['id'])}"
            out += [f"/-- `{p['id']}`, variant `{form['id']}`", "",
                    f"{names[p['id']]} ⇔ {form.get('name', form['id'])} -/",
                    f"def {nm} : Prop :="]
            pad = "  "
            if shape["binder"]:
                out.append("  " + shape["binder"])
                pad = "    "
            out += [f"{pad}{apply(defs[p['id']])} ↔", f"{pad}  {apply(ref)}", ""]

    out += [f"end {ns}.Statements", ""]
    path = root / lib / "Statements.lean"
    path.write_text("\n".join(out), encoding="utf-8")
    wanted = [f"import {lib}.Statements"]

    # A model's verdicts proved one by one, in a file of their own: they import the models.
    verdicts = lean_verdicts(data) + lean_derived_verdicts(data)
    arguments = lean_arguments(data)
    if verdicts or arguments:
        vout = [*(f"import {m}" for m in [*cfg["imports"], *cfg["verdict"]["imports"]]), "",
                "/-!", "# Generated statements: models' verdicts", "",
                "Written by `pmap lean " + topic_id + "` from the YAML records. **Do not edit.**", "",
                "One declaration per verdict a model record proves in Lean (its `lean.verdicts`): that",
                "the principle holds, or fails, in the record's Lean model.", "-/", "",
                f"namespace {ns}.Statements", f"open {ns}", ""]
        for v in verdicts:
            body = lean_verdict_statement(v, data, cfg)
            if body is None:
                continue
            vout += [f"/-- `{v['model']}`: {names.get(v['principle'], v['principle'])} "
                     + ("holds" if v["holds"] else "fails") + ". -/",
                     f"def {v['statement']} : Prop :=", f"  {body}", ""]
        for a in arguments:
            body = lean_argument_statement(a, data, cfg)
            if body is None:
                continue
            where = f"`{a['group']}`, argument `{a['argument']}`" if a["group"] else f"argument `{a['argument']}`"
            vout += [f"/-- {where}: {names.get(a['principle'], a['principle'])} "
                     + ("holds" if a["holds"] else "fails") + " in every model meeting its conditions. -/",
                     f"def {a['statement']} : Prop :=", f"  {body}", ""]
        vout += [f"end {ns}.Statements", ""]
        (root / lib / "ModelStatements.lean").write_text("\n".join(vout), encoding="utf-8")
        wanted.append(f"import {lib}.ModelStatements")
        derived = [v for v in verdicts if v.get("derived")]
        if derived:
            dout = [f"import {lib}.MapArguments", f"import {lib}.MapModels", "",
                    "/-!", "# Generated certificates: models' verdicts from the map's arguments", "",
                    "Written by `pmap lean " + topic_id + "` from the YAML records. **Do not edit.**", "",
                    "Each verdict a general argument gives a model on the map, certified by applying the",
                    "argument's certificate (`MapArguments.lean`) to the model: to its proof of being a model,",
                    "and its proofs of the conditions the argument requires (its record's `lean.meets`, or its",
                    "group's).", "-/", "", f"namespace {ns}.Map.Models", f"open {ns}", ""]
            for v in derived:
                via = v["via"]
                where = f"`{via['group']}`'s argument `{via['argument']}`" if via.get("group") else f"the argument `{via['argument']}`"
                dout += [f"/-- `{v['model']}`: {names.get(v['principle'], v['principle'])} "
                         + ("holds" if v["holds"] else "fails") + f", by {where}. -/",
                         f"theorem {v['statement'].removeprefix('Models.')} : Statements.{v['statement']} :=",
                         f"  {v['cert']}", ""]
            dout += [f"end {ns}.Map.Models", ""]
            (root / lib / "MapDerived.lean").write_text("\n".join(dout), encoding="utf-8")
            wanted.append(f"import {lib}.MapDerived")

    # keep the library root importing them
    rootfile = root / f"{lib}.lean"
    text = rootfile.read_text(encoding="utf-8") if rootfile.exists() else ""
    missing = [w for w in wanted if w not in text.splitlines()]
    if missing:
        rootfile.write_text(text.rstrip() + "\n" + "\n".join(missing) + "\n", encoding="utf-8")
    return path


LEAN_ALLOWED_AXIOMS = frozenset({"propext", "Classical.choice", "Quot.sound"})


def lean_probe_verdicts(returncode: int, output: str, names: list[str]) -> dict[str, bool]:
    """Fail closed: successful elaboration AND a complete, approved axiom report.

    Audit wrapper theorems at the generated types, never the supplied reference alone.
    A failed batch verifies nothing, including declarations before the error.
    """
    import re
    if returncode != 0:
        return {name: False for name in names}
    reports = {}
    for match in re.finditer(r"'([^']+)' (?:does not depend on any axioms|depends on axioms:\s*\[([^]]*)\])", output):
        axioms = {a.strip() for a in (match.group(2) or "").split(",") if a.strip()}
        reports[match.group(1)] = axioms <= LEAN_ALLOWED_AXIOMS
    return {name: reports.get(name, False) for name in names}


def lean_check(topic_id: str, update: bool = False) -> bool:
    """Check generated types and axiom dependencies; optionally persist certificates."""
    import subprocess, shutil, tempfile, re
    data = load_topic(topic_id)
    loc = lean_lib_dir(topic_id, data)
    if loc is None:
        print(f"{topic_id}: no Lean library configured (not verified)")
        return True
    root, lib = loc
    if not shutil.which("lake"):
        sys.exit("lean-check needs lake on PATH (install Lean via elan)")
    cov = lean_coverage(data)
    generate_lean_statements(topic_id)
    print(f"{topic_id}: building {lib} …", flush=True)
    r = subprocess.run(["lake", "build"], cwd=root, capture_output=True, text=True)
    if r.returncode != 0:
        print(r.stdout[-8000:]); print(r.stderr[-4000:])
        print(f"{topic_id}: LEAN BUILD FAILED")
        return False
    index = (data["topic"].get("lean") or {}).get("index") or {}
    if index.get("script"):
        r = subprocess.run(["lake", "env", "lean", index["script"]], cwd=root, capture_output=True, text=True)
        if r.returncode != 0:
            print(r.stdout[-4000:]); print(r.stderr[-4000:])
            print(f"{topic_id}: LEAN INDEX FAILED ({index['script']})")
            return False
    records = data["results"] + data["models"]
    ready = {i["id"] for i in cov["ready"]}
    ns = lean_config(data)["namespace"]
    references = [i for i in records if i["certificate"].get("lean_ref")]
    probe = ["import " + lib, "namespace PmapAudit"]
    wrappers = {}
    for index, item in enumerate(references):
        wrapper = f"proof_{index}"
        wrappers[item["id"]] = f"PmapAudit.{wrapper}"
        probe += [f"theorem {wrapper} : {ns}.Statements.{_lean_name(item['id'])} := {item['certificate']['lean_ref']}",
                  f"#print axioms {wrapper}"]
    # A principle's variants: each equivalence_ref must inhabit the generated equivalence.
    defined = {p["id"] for p in data["principles"] if p.get("lean_def")}
    variants = [(p, v) for p in data["principles"] for v in p.get("variants") or []
                if (v.get("lean") or {}).get("ref")]
    variant_wrappers = {}
    for index_, (p, v) in enumerate(variants):
        ref = v["lean"].get("equivalence_ref")
        if p["id"] not in defined or not ref:
            continue
        wrapper = f"variant_{index_}"
        variant_wrappers[(p["id"], v["id"])] = f"PmapAudit.{wrapper}"
        probe += [f"theorem {wrapper} : {ns}.Statements.{_lean_name(p['id'])}.{_lean_name(v['id'])} := {ref}",
                  f"#print axioms {wrapper}"]
    # A model's single verdicts: each ref must inhabit the generated statement of the verdict.
    model_verdicts = lean_verdicts(data) + lean_derived_verdicts(data)
    verdict_wrappers = {}
    for index_, v in enumerate(model_verdicts):
        if not v["ref"] or lean_verdict_statement(v, data) is None:
            continue
        wrapper = f"verdict_{index_}"
        verdict_wrappers[(v["model"], v["principle"])] = f"PmapAudit.{wrapper}"
        probe += [f"theorem {wrapper} : {ns}.Statements.{v['statement']} := {v['ref']}",
                  f"#print axioms {wrapper}"]
    # A general argument's verdicts: each ref must inhabit the generated statement of the argument.
    argument_verdicts = lean_arguments(data)
    argument_wrappers = {}
    for index_, a in enumerate(argument_verdicts):
        if not a["ref"] or lean_argument_statement(a, data) is None:
            continue
        wrapper = f"argument_{index_}"
        argument_wrappers[(a["group"], a["argument"], a["principle"])] = f"PmapAudit.{wrapper}"
        probe += [f"theorem {wrapper} : {ns}.Statements.{a['statement']} := {a['ref']}",
                  f"#print axioms {wrapper}"]
    probe += ["end PmapAudit"]
    verdicts, bad = {}, []
    if references or variant_wrappers or verdict_wrappers or argument_wrappers:
        with tempfile.NamedTemporaryFile(mode="w", suffix=".lean", prefix="_pmap_audit_", dir=root, delete=False) as f:
            f.write("\n".join(probe) + "\n")
            pf = Path(f.name)
        try:
            result = subprocess.run(["lake", "env", "lean", str(pf)], cwd=root, capture_output=True, text=True)
        finally:
            pf.unlink(missing_ok=True)
        output = result.stdout + result.stderr
        verdicts = lean_probe_verdicts(result.returncode, output,
                                       list(wrappers.values()) + list(variant_wrappers.values())
                                       + list(verdict_wrappers.values()) + list(argument_wrappers.values()))
        if result.returncode:
            print(output[-10000:])
        for item in references:
            if not verdicts.get(wrappers[item["id"]], False):
                bad.append(f"{item['id']}: proof failed its generated type or axiom audit")
            if item.get("status") == "conjectured":
                bad.append(f"{item['id']}: resolve conjecture status before certifying a proof")
        for (pid, vid), wrapper in variant_wrappers.items():
            if not verdicts.get(wrapper, False):
                bad.append(f"{pid}#{vid}: equivalence failed its generated type or axiom audit")
    for p, v in variants:
        if p["id"] not in defined:
            bad.append(f"{p['id']}#{v['id']}: has a Lean statement but the principle has no lean_def")
        if v["lean"].get("status") == "verified" and not verdicts.get(variant_wrappers.get((p["id"], v["id"])), False):
            bad.append(f"{p['id']}#{v['id']}: claims verified but has no checked equivalence")
    for a in argument_verdicts:
        key, where = (a["group"], a["argument"], a["principle"]), (a["group"] + "#" if a["group"] else "") + str(a["argument"])
        if key not in argument_wrappers:
            bad.append(f"{where}: the argument's verdict on {a['principle']} has no statement (a condition needs its lean, or a principle its lean_def)")
        elif not verdicts.get(argument_wrappers[key], False):
            bad.append(f"{where}: the argument's verdict on {a['principle']} failed its generated type or axiom audit")
    for v in model_verdicts:
        key = (v["model"], v["principle"])
        if key not in verdict_wrappers:
            bad.append(f"{v['model']}: the verdict on {v['principle']} has no statement (its principle needs a lean_def)")
        elif not verdicts.get(verdict_wrappers[key], False):
            bad.append(f"{v['model']}: the verdict on {v['principle']} failed its generated type or axiom audit")
    for item in records:
        state = item["certificate"].get("lean", "none")
        if state in ("stated", "verified") and item["id"] not in ready:
            bad.append(f"{item['id']}: claims {state} but has no generated statement")
        if state == "verified" and not verdicts.get(wrappers.get(item["id"]), False):
            bad.append(f"{item['id']}: claims verified but has no checked proof")
    # The Background's items: each declaration cited must be indexed and pass the topic's own
    # check of a shallow proof (for Classicism, `#classicism_check`: its axioms and the gate).
    index_file = ((data["topic"].get("lean") or {}).get("index") or {}).get("file")
    if index_file and (root / index_file).exists():
        decls = json.loads((root / index_file).read_text(encoding="utf-8")).get("declarations", {})
        for n, where in background_lean_names(data):
            if n not in decls:
                bad.append(f"{where}: no Lean declaration {n}")
            elif not decls[n].get("classicism"):
                bad.append(f"{where}: {n} fails the check: {'; '.join(decls[n].get('errors') or ['no verdict'])}")
    print(f"  principle definitions: {len(cov['defs'])}/{len(data['principles'])}")
    print(f"  generated statements: {len(ready)}/{len(records)}")
    verified = {rid for rid, wrapper in wrappers.items() if verdicts.get(wrapper, False)}
    print(f"  verified proofs: {len(verified)}/{len(records)}")
    verified_variants = {key for key, wrapper in variant_wrappers.items() if verdicts.get(wrapper, False)}
    all_variants = sum(len(p.get("variants") or []) for p in data["principles"])
    print(f"  variants: {len(variants)}/{all_variants} stated, {len(verified_variants)} verified")
    verified_verdicts = {key for key, wrapper in verdict_wrappers.items() if verdicts.get(wrapper, False)}
    print(f"  model verdicts: {len(verdict_wrappers)} stated, {len(verified_verdicts)} verified, "
          f"in {len({v['model'] for v in model_verdicts})} models; "
          f"{sum(bool(v.get('derived')) for v in model_verdicts)} of them from arguments")
    verified_arguments = {k for k, w in argument_wrappers.items() if verdicts.get(w, False)}
    print(f"  argument verdicts: {len(argument_wrappers)} stated, {len(verified_arguments)} verified, "
          f"in {len({(a['group'], a['argument']) for a in argument_verdicts})} arguments")
    for item in records:
        rid = item["id"]
        print(f"  {rid:58} {'verified' if rid in verified else 'stated / proof pending' if rid in ready else 'definition missing'}")
    if update and not bad:
        unwritten = []
        for item in records:
            rid = item["id"]
            state = "verified" if rid in verified else "stated" if rid in ready else "none"
            if state == item["certificate"].get("lean", "none"):
                continue
            if item.get("variant_of") or item.get("_companion_of"):  # generated: no file of its own
                unwritten.append(rid)
                continue
            path = ROOT / item["_file"]
            text = path.read_text(encoding="utf-8")
            # Only certificate metadata changes; preserve mathematical prose and formatting.
            text, count = re.subn(r"(?m)^(  lean:) (?:none|stated|verified)\s*$", lambda m: m.group(1) + " " + state, text)
            if count != 1:  # a record written as arguments, with no certificate lean field
                unwritten.append(rid)
                continue
            path.write_text(text, encoding="utf-8")
        if unwritten:
            print(f"  not written (no certificate lean field of its own): {', '.join(unwritten)}")
        for p, v in variants:
            state = "verified" if (p["id"], v["id"]) in verified_variants else "stated"
            path = TOPICS / topic_id / "principles" / f"{p['id']}.yaml"
            text = path.read_text(encoding="utf-8")
            # The variant's lean block: `- id: <vid>` then `  lean:` and its four-space lines.
            pattern = re.compile(rf"(?m)^(- id: {re.escape(v['id'])}\n  lean:\n(?:    (?!status:).*\n)*)(    status: (?:stated|verified)\n)?")
            text, count = pattern.subn(lambda m: m.group(1) + f"    status: {state}\n", text)
            if count != 1:
                raise ValueError(f"{path}: expected exactly one lean block for variant {v['id']}")
            path.write_text(text, encoding="utf-8")
        for v in model_verdicts:
            if v.get("derived"):  # generated from an argument: its record lists no entry for it
                continue
            state = "verified" if (v["model"], v["principle"]) in verified_verdicts else "stated"
            path = ROOT / v["_file"]
            text = path.read_text(encoding="utf-8")
            # The verdict's entry: `  - holds: <pid>` (or fails), its ref, and its status.
            side = "holds" if v["holds"] else "fails"
            pattern = re.compile(rf"(?m)^(  - {side}: {re.escape(v['principle'])}\n    ref: .*\n)(    status: (?:stated|verified)\n)?")
            text, count = pattern.subn(lambda m: m.group(1) + f"    status: {state}\n", text)
            if count != 1:
                raise ValueError(f"{path}: expected exactly one lean verdict entry for {side} {v['principle']}")
            path.write_text(text, encoding="utf-8")
        print("  updated Lean certificates after successful audit")
    for issue in bad:
        print(f"ERROR   {issue}")
    print(f"{topic_id}: {'OK (pending proofs remain)' if not bad and len(verified) < len(records) else 'OK' if not bad else 'FAILED'}")
    return not bad


# ----------------------------------------------------------------------------
# AI bundle:  one zip that unpacks into a self-contained working copy
# ----------------------------------------------------------------------------
#
# Layout inside the archive (root = <topic>-map/):
#   README.md             what this is, the semantics, how to add records
#   AGENTS.md / CLAUDE.md the same rules in imperative form, auto-read by agents
#   MAP.md                every principle, proof, model and derived verdict
#   OPEN-QUESTIONS.md     everything the map does not settle, and how to settle it
#   data.json derived.json  the same content structured
#   scripts/ schema/ viewer/ topics/ Makefile requirements.txt
# so that `python3 scripts/pmap.py validate` works straight after unzipping.


IGNORE = ("__pycache__", "*.pyc", ".DS_Store", ".lake", "*.olean", "*.ilean", "*.trace",
          ".git", ".private", ".env", ".env.*", ".venv", "*.bundle", "_pmap_audit_*.lean")


def _ignored(name: str) -> bool:
    from fnmatch import fnmatch
    return any(fnmatch(name, pat) for pat in IGNORE)


def zip_tree(root: Path, base: str, dest: Path) -> Path:
    """Zip root as base/... , skipping build caches. Replaces make_archive, which cannot filter."""
    import zipfile
    if dest.exists():
        dest.unlink()
    with zipfile.ZipFile(dest, "w", zipfile.ZIP_DEFLATED) as z:
        for path in sorted(root.rglob("*")):
            rel = path.relative_to(root)
            if any(_ignored(part) for part in rel.parts):
                continue
            if path.is_file():
                z.write(path, str(Path(base) / rel))
    return dest


def _relink(md: str, topic_id: str) -> str:
    """Rewrite topic-relative links for a file that will sit at the bundle root."""
    return (md.replace("](sources/", f"](topics/{topic_id}/sources/")
              .replace("](writeups/", f"](topics/{topic_id}/writeups/"))


def _demote(md: str, levels: int) -> str:
    """Push an inlined write-up's own headings below the section that contains it."""
    out, fence = [], False
    for ln in md.split("\n"):
        if ln.lstrip().startswith("```"):
            fence = not fence
        elif not fence and ln.startswith("#"):
            ln = "#" * levels + ln
        out.append(ln)
    return "\n".join(out)


def _change_lines(item: dict, names: dict, indent: str = "", key: str = "changes") -> list[str]:
    """Markdown bullet per logged revision, newest first."""
    out = []
    for ch in sorted(item.get(key) or [], key=lambda c: str(c.get("date", "")), reverse=True):
        bits = (["(minor)"] if ch.get("minor") else []) + [" ".join(str(ch.get("summary", "")).split())]
        if ch.get("satisfies"):
            bits.append("Now satisfies: " + ", ".join(names.get(x, x) for x in ch["satisfies"]) + ".")
        if ch.get("violates"):
            bits.append("Now violates: " + ", ".join(names.get(x, x) for x in ch["violates"]) + ".")
        who = f" ({ch['by']})" if ch.get("by") else ""
        out.append(f"{indent}- **{ch.get('date', '')}**{who} — " + " ".join(bits))
    return out


def _source_lines(item: dict, indent: str = "") -> list[str]:
    labels = item.get("source_names") or []
    out = []
    for i, s in enumerate(item.get("sources") or []):
        s = " ".join(str(s).split())
        out.append(f"{indent}- **{labels[i]}** — {s}" if i < len(labels) else f"{indent}- {s}")
    return out or [f"{indent}- (none recorded)"]


def _cert_line(item: dict, catalog: dict) -> str:
    c = item.get("certificate", {}) or {}
    bits = [f"source **{catalog.get(c.get('source_id'), 'Misc.')}**"]
    if c.get("provenance"):
        bits.append(f"legacy provenance {c['provenance']}")
    if c.get("produced_by"):
        bits.append(f"produced by {c['produced_by']}")
    if c.get("recorded_by"):
        bits.append(f"recorded by {c['recorded_by']}")
    bits.append("checked by " + (", ".join(c["checked_by"]) if c.get("checked_by") else "nobody"))
    if c.get("lean") and c.get("lean") != "none":
        bits.append(f"Lean {c['lean']}")
    if c.get("date"):
        bits.append(str(c["date"]))
    return "; ".join(bits) + "."


def _para(text: str) -> list[str]:
    text = (text or "").strip()
    return ["", text, ""] if text else []


def _premise_packages(data: dict) -> list[list[str]]:
    """Distinct multi-premise packages actually used by proved results, largest first."""
    seen = {}
    for r in data["results"]:
        if r["status"] == "proved" and len(r["premises"]) > 1:
            seen.setdefault(frozenset(r["premises"]), list(r["premises"]))
    return [v for _, v in sorted(seen.items(), key=lambda kv: (-len(kv[1]), sorted(kv[1])))]


def _handwritten(topic_id: str) -> dict:
    d = TOPICS / topic_id / "writeups"
    return {p.stem: p.read_text(encoding="utf-8") for p in sorted(d.glob("*.md"))} if d.exists() else {}


def bundle_map_md(topic_id: str, data: dict, an: dict) -> str:
    """MAP.md — the whole topic as one readable document."""
    topic = data["topic"]
    names = {FALSE: "⊥", **{p["id"]: p["name"] for p in data["principles"]}}
    catalog = {s["id"]: s["name"] for s in topic.get("source_catalog", [])}
    catalog.setdefault("misc", "Misc.")
    hand = _handwritten(topic_id)
    E, pair = an["engine"], an["pair"]
    ids = [p["id"] for p in data["principles"]]
    proved = [r for r in data["results"] if r["status"] == "proved"]
    conj_r = [r for r in data["results"] if r["status"] != "proved"]
    label = lambda i: f"{names.get(i, i)} (`{i}`)"
    arrow = lambda r: " ∧ ".join(names.get(x, x) for x in r["premises"]) or "⊤"

    o = [f"# {topic['title']} — complete map", ""]
    o += [f"Topic `{topic_id}`. Generated {_dt.datetime.now(_dt.timezone.utc).isoformat(timespec='seconds')}.",
          "",
          f"{len(data['principles'])} principles, {len(proved)} proved results, {len(conj_r)} recorded conjectures, "
          f"{len(data['models'])} models.", "",
          "This file is self-contained. Every principle statement, every proof, every model "
          "construction and every derived verdict in the database is reproduced below. "
          "`README.md` gives the semantics and the rules for adding to it; "
          "`OPEN-QUESTIONS.md` lists what is not settled.", ""]
    if topic.get("description"):
        o += _para(topic["description"])

    o += ["## 1. Framework", ""]
    o += _para(topic.get("framework", ""))
    if topic.get("notation"):
        o += ["**Notation.** " + " ".join(topic["notation"].split()), ""]
    bg = topic.get("background") or []
    o += [f"**Fixed background assumptions.** {', '.join(label(b) for b in bg) if bg else 'None. Every principle below is optional and must be assumed explicitly.'}", ""]
    for pre in topic.get("background_presets", []):
        o += [f"**Named package `{pre['id']}` ({pre['name']}).** " + ", ".join(label(x) for x in pre["principles"]) + "."
              + (" Loaded by default in the viewer." if pre.get("default") else ""), ""]

    if data["background"]["pages"]:
        where = "background/" if (TOPICS / topic_id / "background").is_dir() else "background.md"
        o += ["## 2. Background and standing conventions", "",
              f"*Reproduced from `topics/{topic_id}/{where}`.*", "",
              _relink(_demote(render_background(data["background"], data, literature=False)["md"], 1), topic_id), ""]

    o += ["## 3. Principles", ""]
    cats = topic.get("principle_categories") or []
    groups = [(c["id"], c["name"]) for c in cats] or [(None, "All principles")]
    placed = set()
    for cid, cname in groups:
        members = [p for p in data["principles"] if (p.get("category") == cid or cid is None)]
        if not members:
            continue
        o += [f"### {cname}", ""]
        for p in members:
            placed.add(p["id"])
            o += [f"#### {p['name']} — `{p['id']}`", ""]
            o += _para(p.get("statement", ""))
            if p.get("formal"):
                o += [f"Formal: `{p['formal']}`", ""]
            if (p.get("definitions") or "").strip():
                o += _para(p["definitions"])
            if (p.get("about") or "").strip():
                o += _para(p["about"])
            for v in p.get("variants") or []:
                o += [f"Equivalent form, {v['name']} (`{p['id']}#{v['id']}`):"]
                if v.get("statement"):
                    o += _para(v["statement"])
                if v.get("formal"):
                    o += [f"Formal: `{v['formal']}`", ""]
                if (v.get("definitions") or "").strip():
                    o += _para(v["definitions"])
                o += _para("Equivalence. " + v["equivalence"].strip())
            if p.get("negates"):
                o += [f"Explicit negation of {label(p['negates'])}.", ""]
            if p.get("tags"):
                o += [f"Tags: {', '.join(p['tags'])}.", ""]
            if (p.get("notes") or "").strip():
                o += [f"Notes. {p['notes'].strip()}", ""]
            o += ["Sources:", ""] + _source_lines(p) + [""]
            o += [paper_references_md(p, data, f"topics/{topic_id}/"), ""]
    leftover = [p for p in data["principles"] if p["id"] not in placed]
    if leftover:
        o += ["### Uncategorised", ""]
        for p in leftover:
            o += [f"#### {p['name']} — `{p['id']}`", ""] + _para(p.get("statement", ""))

    def render_result(r):
        out = [f"#### {arrow(r)} ⇒ {names.get(r['conclusion'], r['conclusion'])} — `{r['id']}`", ""]
        out += [("Conjecture" if r["status"] != "proved" else "Proved result") + "; " + _cert_line(r, catalog), ""]
        out += ["Premises:", ""] + ([f"- {label(x)}" for x in r["premises"]] or ["- ⊤ (no premises)"]) + [""]
        out += [f"Conclusion: {label(r['conclusion'])}", ""]
        if (r.get("proof") or "").strip():
            out += ["Proof.", "", r["proof"].strip(), ""]
        elif r["status"] != "proved":
            out += ["No proof is recorded. This is a conjecture only.", ""]
        if (r.get("notes") or "").strip():
            out += [f"Notes. {r['notes'].strip()}", ""]
        if r.get("changes"):
            out += ["Revisions:", ""] + _change_lines(r, names) + [""]
        out += ["Sources:", ""] + _source_lines(r) + [""]
        out += [paper_references_md(r, data, f"topics/{topic_id}/"), ""]
        out += [f"Record: `{r['_file']}`.", ""]
        if r["id"] in hand:
            out += ["<details><summary>Hand-written write-up</summary>", "",
                    _demote(_relink(hand[r["id"]].strip(), topic_id), 3), "", "</details>", ""]
        return out

    o += ["## 4. Results", "",
          "Each result is a Horn clause: the conjunction of its premises entails its conclusion, "
          "relative to the framework above. Premises are sufficient; minimality is not claimed.", ""]
    o += ["### 4.1 Proved", ""]
    for r in proved:
        o += render_result(r)
    if conj_r:
        o += ["### 4.2 Conjectures", "",
              "These are displayed but never used as evidence in any derivation below.", ""]
        for r in conj_r:
            o += render_result(r)

    o += ["## 5. Models", "",
          "A model witnesses consistency, and so refutes every implication from what it satisfies "
          "to what it violates. Independence is never recorded directly; the model is the record.", ""]
    for m in data["models"]:
        o += [f"### {m['name']} — `{m['id']}`", ""]
        if m.get("companion_of"):
            o += [f"Conjectured verdicts of `{m['companion_of']}`; conjectured by {_companion_by(m)}.", ""]
        else:
            o += [("Conjectured model" if m["status"] != "proved" else "Model") + "; " + _cert_line(m, catalog), ""]
        o += ["Satisfies:", ""] + [f"- {label(x)}" for x in m["satisfies"]] + [""]
        o += ["Violates:", ""] + [f"- {label(x)}" for x in m["violates"]] + [""]
        if m["id"] in E.holds and m["id"] not in E.model_conflicts:  # what the results add to the record
            for word, have, mine in (("satisfies", E.holds, m["satisfies"]), ("violates", E.fails, m["violates"])):
                extra = [x for x in ids if x in have[m["id"]] and x not in mine]
                if extra:
                    o += [f"Also {word}, by the results: " + ", ".join(label(x) for x in extra) + ".", ""]
        unk = an["unknown"].get(m["id"], [])
        o += ["Unknown in this model: " + (", ".join(label(x) for x in unk) if unk else "nothing; every principle is settled.") , ""]
        if (m.get("description") or "").strip():
            o += ["Construction.", "", m["description"].strip(), ""]
        if m.get("companion_of"):
            o += [f"Generated from the conjectured arguments of `{m['companion_of']}`: its established verdicts and the conjectured ones.", ""]
        if (m.get("definition") or "").strip():
            o += ["Definition.", "", m["definition"].strip(), ""]
        if "arguments" in m:
            o += ["Arguments:", ""] + argument_md(m, data, 4, link=lambda wid: f"`writeups/{wid}.md`", prefix=f"topics/{topic_id}/")
        if m.get("checks"):
            o += ["Executable checks: " + ", ".join(f"`{c}`" for c in m["checks"]) + ".", ""]
        if (m.get("notes") or "").strip() and not m.get("companion_of"):
            o += [f"Notes. {m['notes'].strip()}", ""]
        if m.get("changes"):
            o += ["Revisions:", ""] + _change_lines(m, names) + [""]
        if m.get("history"):
            o += ["History, before the record was written as arguments:", ""] + _change_lines(m, names, key="history") + [""]
        o += ["Sources:", ""] + _source_lines(m) + [""]
        o += [paper_references_md(m, data, f"topics/{topic_id}/"), ""]
        o += [f"Record: `{m['_file']}`.", ""]
        if m["id"] in hand:
            o += ["Write-up.", "", _demote(_relink(hand[m["id"]].strip(), topic_id), 3), ""]

    # ---- derived state -------------------------------------------------
    o += ["## 6. Derived state", "",
          "Computed from the proved records only, by the closure rules in `README.md`. "
          "Conjectures take no part. A missing entry means *not recorded*, not *false*.", ""]
    multi = [c for c in an["classes"] if len(c) > 1]
    o += ["### 6.1 Interderivable principles", ""]
    o += ([f"- {' ⇔ '.join(label(x) for x in c)}" for c in multi] if multi
          else ["No two principles are currently interderivable."]) + [""]

    imp = sorted(k for k, v in pair.items() if v["status"] == "implies")
    ind = sorted(k for k, v in pair.items() if v["status"] == "independent")
    o += [f"### 6.2 Settled single-premise implications ({len(imp)})", ""]
    if imp:
        o += ["| From | To | Via |", "| --- | --- | --- |"]
        o += [f"| {names.get(a,a)} | {names.get(b,b)} | {', '.join('`%s`' % v for v in pair[(a,b)]['via']) or 'directly'} |" for a, b in imp]
    else:
        o += ["None."]
    o += [""]
    o += [f"### 6.3 Refuted single-premise implications ({len(ind)})", "",
          "Read *A ⇏ B*: assuming A alone does not yield B, as the named model shows.", ""]
    if ind:
        o += ["| From | To | Witness model |", "| --- | --- | --- |"]
        o += [f"| {names.get(a,a)} | {names.get(b,b)} | {', '.join('`%s`' % m for m in pair[(a,b)].get('models', []))} |" for a, b in ind]
    else:
        o += ["None."]
    o += ["", f"### 6.4 Open single-premise pairs ({len(an['open_pairs'])})", "",
          "Listed in `OPEN-QUESTIONS.md`.", ""]

    exc = sorted(k for k, v in pair.items() if v["status"] == "excludes")
    o += [f"### Negative implications ({len(exc)})", "",
          "Read A ⇒ ¬B: A and B cannot hold together. This does not by itself witness a model of A.", ""]
    o += [f"- {label(a)} ⇒ ¬ {label(b)}; via {', '.join(pair[(a,b)]['via'])}." for a, b in exc] or ["None."]
    o += [""]
    packs = _premise_packages(data)
    if packs:
        o += ["### 6.5 What the recorded premise packages entail", "",
              "Every multi-premise package used by a proved result, with its full consequence set.", ""]
        for P in packs:
            res = E.package(P)
            o += [f"#### {' + '.join(names.get(x, x) for x in P)}", ""]
            o += ["Assumes: " + ", ".join(f"`{x}`" for x in P) + ".", ""]
            if res["inconsistent"]:
                o += ["**Inconsistent:** these premises imply False via " + ", ".join(res["via"]) + ". No consequences by explosion are listed.", ""]
                continue
            o += ["- Rules out (entails their negations): " + (", ".join(label(x) for x in res["excludes"]) or "nothing further")]
            o += ["- Entails: " + (", ".join(label(x) for x in res["entails"]) if res["entails"] else "nothing further") ]
            o += ["- Refuted (a model satisfies the package and violates these): "
                  + (", ".join(label(x) for x in res["separated"]) if res["separated"] else "nothing")]
            o += ["- Open: " + (", ".join(label(x) for x in res["open"]) if res["open"] else "nothing") , ""]

    extras = {k: v for k, v in hand.items() if k not in {x["id"] for x in data["results"] + data["models"]}}
    if extras:
        o += ["## 7. Additional write-ups", "",
              "Hand-written notes not attached to a single record.", ""]
        for k, v in extras.items():
            o += [f"### `{k}`", "", _demote(_relink(v.strip(), topic_id), 3), ""]

    if data.get("papers"):
        o += ["## Literature", "", literature_md(data, f"topics/{topic_id}/"), ""]

    o += ["## 8. Where this came from", "",
          f"The paper catalogue is `topics/{topic_id}/papers.yaml`; any included source documents are in `topics/{topic_id}/sources/`. "
          f"The extraction log, with transcription decisions and deliberately deferred items, "
          f"is `topics/{topic_id}/extraction.md`. Read it before trusting any single page reference.", ""]
    return "\n".join(o).rstrip() + "\n"


def bundle_open_md(topic_id: str, data: dict, an: dict, lynch=None) -> str:
    """OPEN-QUESTIONS.md — what is unsettled, and how to settle it."""
    topic = data["topic"]
    names = {FALSE: "⊥", **{p["id"]: p["name"] for p in data["principles"]}}
    label = lambda i: f"{names.get(i, i)} (`{i}`)"
    E = an["engine"]
    conj = [item for item in [*data["results"], *data["models"]]
            if item["status"] == "conjectured" or item.get("was_conjectured", False)]
    resolutions = an["conjectures"]

    o = [f"# Open questions — {topic['title']}", "",
         "Conjectures, their current answers, and remaining gaps where a new "
         "result or model would contribute to the map.", "",
         "**\"Open\" means not settled by the records in this bundle.** It does not mean unsolved "
         "in the literature, and it does not mean hard. Many entries below are routine and simply "
         "have not been added yet. Check the sources before assuming a question is new.", ""]

    o += ["## 1. Conjectures and their answers", "",
          "Answers below are recomputed from proved records under the fixed topic background. "
          "A conjectured record supplies no evidence for its own answer. Records marked "
          "was_conjectured remain in this history after promotion to proved; their proved "
          "status, rather than the historical marker, determines whether they supply evidence. "
          "Original sources and notes are retained below each answer.", ""]
    groups = [
        ("1.1 Unresolved", {"open"}),
        ("1.2 Resolved", {"proved", "refuted"}),
        ("1.3 Incompatible with background", {"incompatible", "inconsistent-background"}),
    ]
    answer_names = {
        "open": "Open", "proved": "Proved", "refuted": "Refuted",
        "incompatible": "Incompatible premises", "inconsistent-background": "Inconsistent background",
    }
    for heading, statuses in groups:
        questions = [c for c in conj if resolutions[c["id"]]["status"] in statuses]
        o += [f"### {heading} ({len(questions)})", ""]
        if not questions:
            o += ["None.", ""]
        for c in questions:
            resolved = resolutions[c["id"]]
            if "premises" in c:
                conclusion = FALSE if c["conclusion"] is False else c["conclusion"]
                head = (" ∧ ".join(names.get(x, x) for x in c["premises"]) or "⊤") + " ⇒ " + names.get(conclusion, conclusion)
            else:
                head = c.get("name", c["id"])
            answer_name = answer_names[resolved["status"]]
            if "satisfies" in c and not c.get("model_check"):
                answer_name = {"proved": "Existence witnessed", "refuted": "Existence refuted"}.get(resolved["status"], answer_name)
            o += [f"#### {head} — `{c['id']}`", "",
                  f"**Answer: {answer_name}.**", ""]
            if c.get("model_check"):
                o += [f"The proposed verdicts concern the existing model `{c['model_check']['model']}`; "
                      "a different model with the same properties does not resolve these checks.", ""]
            elif "satisfies" in c and resolved["status"] == "proved":
                o += ["A proved model meets the recorded satisfies/violates requirements. "
                      "This witnesses their consistency, not necessarily the proposed construction.", ""]
            if resolved["status"] == "incompatible":
                o += ["The premises cannot hold with this background. This is not a countermodel "
                      "and no consequence by explosion is reported.", ""]
            elif resolved["status"] == "inconsistent-background":
                o += ["The fixed background is inconsistent, so no answer to this question is "
                      "reported under it.", ""]
            if resolved["via"]:
                o += ["Supporting result ids: " + ", ".join(f"`{rid}`" for rid in resolved["via"]) + ".", ""]
            if resolved["models"]:
                o += ["Model witness ids: " + ", ".join(f"`{mid}`" for mid in resolved["models"]) + ".", ""]
            if resolved["status"] == "proved" and not resolved["via"] and not resolved["models"]:
                o += ["This follows directly from the stated premises or fixed background.", ""]
            if (c.get("notes") or "").strip():
                o += ["Original record notes:", "", c["notes"].strip(), ""]
            o += _source_lines(c) + ["", f"Record: `{c['_file']}`.", ""]

    o += ["## 2. Central questions", ""]
    o += lynchpin_md(lynch if lynch is not None else lynchpin_report(data, sparse_ok=False), data, topic_id)

    o += ["## 3. Open questions under each recorded package", "",
          "The most useful place to work: these are open *given* assumptions the sources already make.", ""]
    packs = []
    for pre in topic.get("background_presets", []):
        packs.append((pre["name"], pre["principles"]))
    for P in _premise_packages(data):
        nm = " + ".join(names.get(x, x) for x in P)
        if not any(set(p[1]) == set(P) for p in packs):
            packs.append((nm, P))
    for nm, P in packs:
        res = E.package(P)
        if not res["open"]:
            continue
        o += [f"### {nm}", "", "Assuming " + ", ".join(f"`{x}`" for x in P) + ", these remain open:", ""]
        o += [f"- {label(x)}" for x in res["open"]] + [""]

    o += ["## 4. Unknown verdicts inside each model", "",
          "For these principles the model has not been checked either way. Deciding one is a "
          "self-contained calculation in a construction that is already written down.", ""]
    for m in data["models"]:
        unk = an["unknown"].get(m["id"], [])
        o += [f"### {m['name']} — `{m['id']}`", ""]
        o += ([f"- {label(x)}" for x in unk] if unk else ["Fully determined; nothing unknown."]) + [""]

    op = sorted(an["open_pairs"])
    o += [f"## 5. Open single-premise pairs ({len(op)})", "",
          "*A ⇒ B ?* means neither implication nor incompatibility nor a countermodel is currently recorded. "
          "Grouped by antecedent. Most are open only because the obvious model has not been added.", ""]
    by_a = {}
    for a, b in op:
        by_a.setdefault(a, []).append(b)
    for a in sorted(by_a, key=lambda x: name_sort_key(names.get(x, x))):
        o += [f"- **{names.get(a,a)}** (`{a}`) ⇒ " + ", ".join(names.get(b, b) for b in sorted(by_a[a], key=lambda x: name_sort_key(names.get(x, x))))]
    o += [""]

    o += ["## 6. Deliberately deferred", "",
          f"`topics/{topic_id}/extraction.md` has a section listing claims that were **not** recorded "
          "because they need a further reading of the sources. Those are marked deferred rather than "
          "open: the answer is likely in the literature and needs transcribing, not discovering. "
          "Read that section before starting work.", ""]

    o += ["## 7. How to record an answer", "",
          "- Proved an implication? Add `topics/%s/results/<id>.yaml` with the full premise list and the proof." % topic_id,
          "- Refuted one? Add `topics/%s/models/<id>.yaml` listing what you verified in `satisfies` and `violates`." % topic_id,
          "- Settling an existing conjecture? For a proof of the same statement, keep its ID, "
          "set `was_conjectured: true`, and change its status to `proved`. If the statement changes "
          "substantially, retain the original and add a separate record. Refuted proposals stay "
          "`status: conjectured`, with proved refuting evidence recorded separately. Answers under "
          "extra exploration assumptions are contextual, not global record statuses.",
          "- Worked on a question without settling it? Put what you tried and what would settle it in "
          "the conjecture's `notes`; that alone earns it a bronze lynchpin star. Say in the notes whether "
          "you think it deserves silver or gold, by importance and difficulty, and why. Only a human sets "
          "`tier: silver` or `tier: gold`; an agent never does.",
          "- Not sure? Add it with `status: conjectured`, an empty proof, and say in `notes` what would settle it.",
          "- Then run `python3 scripts/pmap.py validate` and `status`. Never hand-edit the derived counts.", "",
          "`README.md` has the exact record shapes and the sourcing rules. Follow them; an unsourced "
          "or misattributed record is worse than an absent one.", ""]
    return "\n".join(o).rstrip() + "\n"


def bundle_readme_md(topic_id: str, data: dict, an: dict) -> str:
    topic = data["topic"]
    proved = [r for r in data["results"] if r["status"] == "proved"]
    cat = topic.get("source_catalog", [])
    o = [f"# {topic['title']} — working bundle", "",
         "A self-contained copy of one logical map: the axioms of a subject, the implications "
         "between them, the countermodels that refute the remaining implications, and the proofs "
         "for all of it. Unzip anywhere and start working.", "",
         f"Contains {len(data['principles'])} principles, {len(proved)} proved results, "
         f"{len(data['results']) - len(proved)} conjectures and {len(data['models'])} models, "
         f"with the source documents they were extracted from.", "",
         "## Read in this order", "",
         "1. **`MAP.md`** — everything, in one file: framework, principle statements, every proof, "
         "every model construction, and the derived verdicts. Start here.",
         "2. **`OPEN-QUESTIONS.md`** — what the map does not settle, grouped so each entry is a "
         "concrete piece of work.",
         f"3. **`topics/{topic_id}/extraction.md`** — how the records were read out of the sources, "
         "which transcription decisions were made, and what was deliberately left out.",
         f"4. **`topics/{topic_id}/sources/`** — the original papers.", "",
         "`data.json` and `derived.json` hold the same content structured, if you would rather "
         "compute over it than read it.", "",
         "## Layout", "", "```",
         f"MAP.md OPEN-QUESTIONS.md      the map as prose",
         f"data.json derived.json        records, and every derived verdict",
         f"topics/{topic_id}/",
         f"  topic.yaml                  title, source catalog, categories, viewer packages",
         f"  background/<page>.md        the framework in full, one topic per page" if (TOPICS / topic_id / "background").is_dir()
         else f"  background.md               the framework in full",
         f"  extraction.md               source inventory, transcription decisions, deferred items",
         f"  principles/<id>.yaml        one principle per file",
         f"  results/<id>.yaml           premises ⇒ conclusion, with its proof",
         f"  models/<id>.yaml            satisfies [...] / violates [...], or a definition and arguments",
         f"  provenance/<id>.yaml        provenance moved out of a model record, named by its arguments",
         f"  writeups/<id>.md            hand-written write-up, overrides the generated one",
         f"  checks/                     executable sanity checks for the models",
         f"  sources/                    original papers",
         "scripts/pmap.py schema/ viewer/  the tooling, so validate and build work here",
         "```", "",
         "## Semantics", "",
         "Everything is relative to the topic background B (see `MAP.md` §1).", "",
         "- A **result** is a Horn clause, premises ⇒ principle or False. `cl(S)` is the closure of B ∪ S "
         "under all proved results.",
         "- A **model** M records `sat(M)` and `viol(M)` and witnesses that "
         "`sat(M) ∪ {¬v : v ∈ viol(M)}` is consistent. Derived: `holds(M) = cl(sat(M))`, and "
         "`fails(M) = {c : cl(sat(M) ∪ {c}) meets viol(M) or contains False}`. Everything else is unknown in M.",
         "- **P ⇒ c** iff `c ∈ cl(P)`. **P ⇏ c** iff some model has `P ⊆ holds(M)` and `c ∈ fails(M)`. "
         "**P ⇒ ¬c** when adjoining c reaches False. This is an exclusion, not a model witness. "
         "Inconsistent packages are reported separately, with no explosion. Otherwise the pair is **open**.",
         "- Mutually derivable principles collapse to one node.",
         "- Conjectures are displayed but never used as evidence.",
         "- Deriving False or an explicitly violated principle from a model is a validation error.", "",
         "**A missing arrow means nothing was recorded.** The map is curated, not exhaustive.", "",
         "## Adding to it", "",
         "```yaml", "# topics/%s/results/<id>.yaml   —   file name must equal the id" % topic_id,
         "id: my-new-result",
         "premises: [principle-a, principle-b]     # every assumption actually used",
         "conclusion: principle-c                 # use false for incompatible premises",
         "status: conjectured                       # promote only after supplying a proof",
         "certificate:",
         "  source_id: misc                         # a source_catalog id; misc for original work",
         "  lean: none",
         "  produced_by: \"who proposed the claim\"",
         "  recorded_by: \"who transcribed it\"       # optional, kept separate",
         "  checked_by: []                          # only actual checkers",
         "  date: 'YYYY-MM-DD'",
         'proof: ""',
         "sources:",
         "  - Full reference, with theorem or section and page.",
         "source_names: [Short label]               # one per source, same order",
         "notes: \"State what would settle this proposal.\"", "```", "",
         "```yaml", "# topics/%s/models/<id>.yaml" % topic_id,
         "id: my-new-model", "name: 'Construction family: ordering rule'",
         "satisfies: [principle-a, principle-b]     # only what you actually verified",
         "violates: [principle-c]                   # the engine derives the rest",
         "status: conjectured                      # promote only after checking the model",
         "certificate: {source_id: misc, lean: none, produced_by: \"...\", checked_by: [], date: 'YYYY-MM-DD'}",
         "description: |", "  The construction, and why it has these properties.",
         "sources: [Full reference or an identifiable original proof]",
         "source_names: [Short label]", "```", "",
         "Give models short, systematic names describing their construction or ordering rule: "
         "family first, then the rule and any distinguishing variant. Match the write-up title. "
         "Keep authorship, conjecture status, and lists of satisfied/violated principles in their "
         "own fields. For a conjectured extension, name the proposed extension without inventing "
         "a construction. Keep existing record IDs unchanged.", "",
         "For A ∧ B ⇒ ¬C, record `premises: [a, b, c]` and `conclusion: false`. "
         "False is a reserved conclusion, not a principle. The same constraint lets A and C rule out B.", "",
         "Counterexamples to implications are recorded as models. A result concluding false "
         "instead proves incompatibility; it does not establish that any premise package has a model.", "",
         "## Sourcing rules", "",
         "These are what make the map worth anything. Follow them exactly.", "",
         "- Every result and model needs a nonempty `sources`. Give the paper with theorem/section "
         "and page, or an identifiable original proof for new work.",
         "- `certificate.source_id` names the **direct** source. Declared sources here:",
         ] + [f"  - `{s['id']}` — {s['name']} ({s['kind']})" for s in cat] + [
         "- Use `misc` for original proofs, one-off prompts and user suggestions. Citing a paper's "
         "definitions does **not** make that paper the source of your new proof.",
         "- `produced_by` credits the mathematics; `recorded_by` credits transcription only.",
         "- Name the person who prompted an AI beside it wherever it is credited, "
         "`Claude Opus 5.5 (Anthropic), prompted by Cian Dorr`, even when they contributed nothing "
         "substantive.",
         "- Leave `checked_by: []` unless a named person actually checked it. A human-authored "
         "source does not mean a human checked this database's translation of it.",
         "- Never invent an author, a date, a page or a submission label. If you are unsure of a "
         "reference, say so in `notes` rather than guessing.",
         "- If you are unsure of the mathematics, record `status: conjectured` with an empty proof "
         "and write in `notes` what would settle it. That is a useful contribution; a wrong "
         "`proved` is not.",
         "- Do not change the mathematical content of an existing published or human-authored "
         "proof. Add a note, or a new record, instead.",
         "- File name equals `id`, kebab-case. Never rename an id that other files reference.",
         "- When an existing record gains content after its certificate date (a newly verified "
         "property of a model, an added proof, a corrected statement), append an entry to its "
         "`changes` list: `{date, by, summary}` plus, for models, the newly verified `satisfies`/"
         "`violates` ids. The Changes tab lists each entry under its own date; leave "
         "`certificate.date` as the record's original date.",
         "- Keep the framework fixed. A principle needing a different setting belongs to a "
         "different topic.", "",
         "## Lean", "",
         "If `topics/%s/lean/` is present, the topic has a formalisation. The YAML is the" % topic_id,
         "source of truth for statements: each principle names its Lean definition in `lean_def`,",
         "and every result and model statement is generated from its premises and conclusion into",
         "`Statements.lean`. To prove a record, inhabit its generated `Prop`. Never edit the",
         "generated file, and never hand-set `lean: verified` -- `pmap lean-check` builds the",
         "library, confirms the proof inhabits the generated statement, and rejects anything",
         "still depending on `sorryAx`. `lean: stated` means the statement elaborates and the",
         "proof is missing. See that folder's README for the modelling choices.", "",
         "## Commands", "", "```sh",
         "pip install -r requirements.txt",
         "python3 scripts/pmap.py validate            # schema, references, consistency. Must pass.",
         "python3 scripts/pmap.py status              # counts, open pairs, redundancies",
         "python3 scripts/pmap.py lynchpins           # open questions ranked by what each answer settles",
         *[f"python3 {p.relative_to(ROOT)}   # topic checks" for p in sorted((TOPICS / topic_id / "checks").glob("*.py"))],
         "python3 scripts/pmap.py build               # regenerate build/<topic>/index.html, the map viewer",
         "python3 scripts/pmap.py selftest            # the derivation engine's own tests",
         "python3 scripts/check_falsity.py            # Python/browser semantics and False; needs Node",
         "python3 scripts/pmap.py lean                # regenerate the Lean statements",
         "python3 scripts/pmap.py lean-check          # build the Lean library and audit lean: claims",
         "```", "",
         "A `CONTRADICTION` from `validate` means the data is inconsistent and must be fixed "
         "before anything else. Rerun `validate` after every batch of edits.", "",
         "## Sending work back", "",
         f"The whole of `topics/{topic_id}/` is portable: copy it back over the same folder in the "
         "main repository, or send the individual new YAML files. Nothing outside that folder "
         "needs to change.", ""]
    contrib = TOPICS / topic_id / "contribute.md"
    if contrib.exists():
        body = contrib.read_text(encoding="utf-8").strip()
        body = "\n".join(body.split("\n")[1:]).strip()
        o += [body, ""]
    if (ROOT / "starter" / "LICENSE").exists():
        o += ["## Tooling licence", "", "The reusable scripts, schemas, viewer, and starter templates "
              "are supplied under [the MIT licence](starter/LICENSE). This does not grant rights "
              "to this topic's papers or other separately supplied content.", ""]
    return "\n".join(o).rstrip() + "\n"


def bundle_agents_md(topic_id: str, data: dict) -> str:
    cat = data["topic"].get("source_catalog", [])
    reading = (
        "Read `MAP.md` before answering anything about this subject. It is the whole database. "
        "`OPEN-QUESTIONS.md` lists what is unsettled. `README.md` has the semantics and the record "
        "formats. This file is the short version of the rules."
    )
    if topic_id in {"classicism", "unbounded-utility"}:
        reading = (
            f"Start with [the topic guide](topics/{topic_id}/AGENTS.md) for terminology, record IDs, "
            "and construction-specific entry points. Run commands from this bundle's root. "
            "Read `topic.yaml`, the relevant Background page (`background/<page>.md`, or `background.md`), and the matching principle "
            f"records under `topics/{topic_id}/`; then follow their IDs into `results/`, `models/`, "
            "and `writeups/`. Search narrowly before reading whole files.\n\n"
            "Translate the user's question into exact premises and a target, preserving the fixed "
            "framework and distinguishing optional presets. Inspect definitions, proofs, model "
            "constructions, status, and source caveats. For derived evidence, use "
            "`scripts.pmap.load_topic` and `Engine` with proved-only records: `entails`, `excludes`, "
            "and `separates` answer different questions. Keep optional assumptions in the queried "
            "premise set, not the engine background, so a countermodel must actually satisfy them.\n\n"
            "`MAP.md`, `derived.json`, and `OPEN-QUESTIONS.md` are searchable references; do not "
            "read the entire database or compute all rankings for one question. Unknown in the "
            "records does not mean false or open in the literature. Once the local evidence is "
            "identified, work on the mathematics; distinguish a new argument from recorded evidence. "
            "A mathematical question alone does not request record edits or a rebuild. "
            "`README.md` supplies the full semantics and record formats.\n\n"
            "Mathematical brainstorming and Lean formalization are separate tasks. Default to "
            "ordinary mathematical arguments. Requests to prove or check a claim do not by "
            "themselves request Lean. Unless Lean work is explicitly requested or already agreed, "
            "do not explore Lean sources, edit `.lean` files, install toolchains, run `lake`, or "
            "run `lean-check`. A sound mathematical proof need not be formalized to answer or "
            "record it; preserve the actual Lean status. Routine export builds may mechanically "
            "regenerate statements without starting a proof or audit task. Do not routinely "
            "offer formalization as the next step in brainstorming."
        )
    return "\n".join([
        "# Instructions for AI agents working in this bundle", "",
        reading, "",
        "## Always", "",
        "- Run `python3 scripts/pmap.py validate` after every batch of edits. It must pass.",
        "- After changing the engine or viewer, run `python3 scripts/pmap.py selftest` and "
        "`python3 scripts/check_falsity.py` (requires Node).",
        "- Give every new result and model a nonempty `sources` with theorem/section and page, and "
        "set `certificate.source_id` to the direct source: "
        + ", ".join(f"`{s['id']}`" for s in cat) + ".",
        "- Record independence as a **model**, never as a result.",
        "- Name models by their construction or ordering rule: family first, then the rule and "
        "any distinguishing variant. Match the write-up title. Keep authorship, conjecture status, "
        "and lists of satisfied/violated principles in their own fields. For conjectured extensions, "
        "do not invent an unknown construction. Keep existing record IDs unchanged.",
        "- List in a model's `satisfies` and `violates` only what you actually verified. The engine "
        "derives the rest and reports what stays unknown.",
        "- Log every later addition to an existing record in its `changes` list (date, by, summary, "
        "and for models the newly verified `satisfies`/`violates` ids). Never move `certificate.date`.",
        "- A model written as a `definition` and `arguments` takes a new verdict as a new argument "
        "with its own `by` and `date`, and a correction in that argument's `revisions`. Its `history` "
        "is frozen, and its `satisfies`/`violates` are computed: never write them. It records only "
        "the verdicts the engine cannot derive from the others, its source's first.",
        "- Write the real proof in `proof`, at referee detail. Put anything longer than a paragraph "
        f"in `topics/{topic_id}/writeups/<id>.md` instead.",
        "- Prefer `status: conjectured` with an empty proof and a note saying what would settle it, "
        "over a `proved` you are not certain of.", "",
        "## Never", "",
        "- Never invent an author, date, page, DOI or submission label. Unsure means say so in `notes`.",
        "- Never cite a paper as `source_id` for a proof you produced yourself. That is `misc`.",
        "- Never put anything in `checked_by` unless a named person actually checked it.",
        "- Never change the mathematical content of an existing published or human-authored proof. "
        "Add a note or a new record.",
        "- Never rename an `id` that other files reference. File name equals id.",
        "- Record incompatible premises with `conclusion: false`, not a duplicate failure principle. "
        "Never use false as a principle, premise, model assertion, or background assumption.",
        "- Never treat a missing arrow as a proof of non-implication. Missing means not recorded.",
        "- Never use a conjecture as evidence for anything.",
        "- Never edit `Statements.lean`; it is generated from the records by `pmap lean`.",
        "- Never set `lean: verified` by hand. Only `pmap lean-check` may conclude that, and only",
        "for a proof that inhabits the generated statement without `sorryAx`.", "",
        "## Reading the derived state", "",
        "`MAP.md` §6 and `derived.json` are computed from the proved records by closure. Do not "
        "hand-edit them; they regenerate. If a verdict looks wrong, the fix is in the YAML.", "",
    ]) + "\n"


def bundle_derived_json(data: dict, an: dict, lynch=None) -> dict:
    names = {FALSE: "⊥", **{p["id"]: p["name"] for p in data["principles"]}}
    pairs = []
    for (a, b), v in sorted(an["pair"].items()):
        row = {"from": a, "to": b, "status": v["status"]}
        if v.get("via"):
            row["via"] = v["via"]
        if v.get("models"):
            row["models"] = v["models"]
        pairs.append(row)
    packages = []
    for P in _premise_packages(data):
        res = an["engine"].package(P)
        packages.append({"premises": P, **res})
    for pre in data["topic"].get("background_presets", []):
        packages.append({"id": pre["id"], "name": pre["name"], "premises": pre["principles"],
                         **an["engine"].package(pre["principles"])})
    return {
        "note": "Derived by closure over proved records only; conjectures excluded. "
                "status excludes means implication to a negation; independent means a countermodel to the positive implication; "
                "inconsistent means the antecedent implies False. No explosion is used. "
                "status open means not recorded, not false. lynchpins scores each open question by the other open questions "
                "either answer would settle, under each background preset, and is skipped for a sparse map; a question is S ⊢ c "
                "for S at most two principle classes and c a class or False, a model check is deciding a principle in a recorded model. "
                "progress is the share of implication questions with up to two premises settled under each background: "
                "S ⇒ c for S at most two principle classes and c a class or False, counted only when no smaller premise set "
                "already proves or excludes c, and settled alike by a proof, an exclusion or a fitting model. "
                "Regenerate with pmap.py; do not hand-edit.",
        "generated": _dt.datetime.now(_dt.timezone.utc).isoformat(timespec="seconds"),
        "principle_names": {k: v for k, v in names.items() if k != FALSE},
        "classes": an["classes"],
        "pairs": pairs,
        "counts": {s: sum(1 for p in pairs if p["status"] == s) for s in ("implies", "excludes", "independent", "inconsistent", "open")},
        "unknown_in_model": an["unknown"],
        "packages": packages,
        "lynchpins": lynch if lynch is not None else lynchpin_report(data, sparse_ok=False),
        "progress": progress_report(data),
        "problems": an["problems"],
        "infos": an["infos"],
    }


def bundle_topic(topic_id: str, *, data: dict | None = None, an: dict | None = None, base: dict | None = None) -> Path:
    """Write build/<topic>/<topic>-map.zip — a self-contained working copy. A build passes its data,
    analysis and export so that nothing is analysed or ranked a second time."""
    import shutil, tempfile
    data = data if data is not None else load_topic(topic_id)
    an = an if an is not None else analyse(data)
    lynch = lynchpin_report(data, sparse_ok=False)
    outdir = BUILD / topic_id
    outdir.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory() as tmp:
        root = Path(tmp) / f"{topic_id}-map"
        (root / "topics").mkdir(parents=True)
        shutil.copytree(TOPICS / topic_id, root / "topics" / topic_id,
                        ignore=shutil.ignore_patterns(*IGNORE))
        (root / "scripts").mkdir()
        shutil.copy2(Path(__file__).resolve(), root / "scripts" / "pmap.py")
        check = ROOT / "scripts" / "check_falsity.py"
        if check.exists():
            shutil.copy2(check, root / "scripts" / check.name)
        if (ROOT / "starter").is_dir():
            shutil.copytree(ROOT / "starter", root / "starter", ignore=shutil.ignore_patterns(*IGNORE))
            shutil.copy2(ROOT / "scripts" / "starter.py", root / "scripts" / "starter.py")
        audit_check = ROOT / "scripts" / "check_lean_audit.py"
        if topic_id == "unbounded-utility" and audit_check.exists():
            shutil.copy2(audit_check, root / "scripts" / audit_check.name)
        shutil.copytree(SCHEMA, root / "schema")
        shutil.copytree(ROOT / "viewer", root / "viewer", ignore=shutil.ignore_patterns(*IGNORE))
        shutil.copy2(ROOT / "requirements.txt", root / "requirements.txt")
        (root / "README.md").write_text(bundle_readme_md(topic_id, data, an), encoding="utf-8")
        (root / "AGENTS.md").write_text(bundle_agents_md(topic_id, data), encoding="utf-8")
        (root / "CLAUDE.md").write_text(
            "See [AGENTS.md](AGENTS.md) for the rules, [MAP.md](MAP.md) for the database, "
            "and [OPEN-QUESTIONS.md](OPEN-QUESTIONS.md) for what is unsettled.\n", encoding="utf-8")
        (root / "MAP.md").write_text(bundle_map_md(topic_id, data, an), encoding="utf-8")
        (root / "OPEN-QUESTIONS.md").write_text(bundle_open_md(topic_id, data, an, lynch), encoding="utf-8")
        (root / "data.json").write_text(json.dumps(
            enriched_payload(topic_id, {"json": "data.json", "derived": "derived.json"}, base=base),
            indent=1, ensure_ascii=False), encoding="utf-8")
        (root / "derived.json").write_text(json.dumps(bundle_derived_json(data, an, lynch), indent=1, ensure_ascii=False), encoding="utf-8")
        (root / "Makefile").write_text(
            "PY ?= python3\n.PHONY: validate status build checks lean\n"
            "validate: ; $(PY) scripts/pmap.py validate\n"
            "status: ; $(PY) scripts/pmap.py status\n"
            "build: ; $(PY) scripts/pmap.py build\n"
            "checks: ; $(PY) scripts/pmap.py selftest\n"
            + "".join(f"\t$(PY) {p.relative_to(ROOT)}\n" for p in sorted((TOPICS / topic_id / "checks").glob("*.py"))) +
            f"lean: ; $(PY) scripts/pmap.py lean-check {topic_id}\n", encoding="utf-8")
        zip_tree(root, root.name, outdir / f"{topic_id}-map.zip")
    return outdir / f"{topic_id}-map.zip"


# ----------------------------------------------------------------------------
# Status
# ----------------------------------------------------------------------------

def status(topic_id: str, model: str | None = None):
    data = load_topic(topic_id)
    an = analyse(data)
    if model is not None:  # one model's coverage report alone
        covs = [c for c in model_coverage(data, an) if c["id"] == model]
        if not covs:
            sys.exit(f"{topic_id}: no model '{model}' in the argument format")
        print("\n".join(coverage_text(covs[0])))
        return
    names = {FALSE: "⊥", **{p["id"]: p["name"] for p in data["principles"]}}
    n = len(data["principles"])
    print(f"== {data['topic']['title']} ==")
    print(f"{n} principles, {len(data['results'])} results, {len(data['models'])} models, background = {data['topic'].get('background', [])}")
    tally = {}
    for kind, lst in (("result", data["results"]), ("model", data["models"])):
        for r in lst:
            key = (kind, r["status"], r["certificate"].get("source_id", "misc"), r["certificate"].get("lean", "none"))
            tally[key] = tally.get(key, 0) + 1
    for k in sorted(tally):
        print(f"  {k[0]:7} {k[1]:11} {k[2]:15} lean={k[3]:9} {tally[k]}")
    counts = {s: 0 for s in ("implies", "excludes", "independent", "inconsistent", "open")}
    for v in an["pair"].values():
        counts[v["status"]] += 1
    print(f"ordered pairs: {counts['implies']} ⇒, {counts['excludes']} ⇒¬, {counts['independent']} ⇏, {counts['inconsistent']} inconsistent, {counts['open']} open (of {n * (n - 1)})")
    for c in an["classes"]:
        if len(c) > 1:
            print("  " + " ⇔ ".join(names[x] for x in c))
    for m in data["models"]:
        u = an["unknown"].get(m["id"], [])
        if u:
            print(f"model {m['id']}: unknown for {', '.join(names[x] for x in u)}")
    if an["open_pairs"]:
        print("open pairs:")
        for a, b in an["open_pairs"]:
            print(f"  {names[a]} ⇒ {names[b]} ?")
    for p in an["problems"]:
        print(f"CONTRADICTION: {p}")
    for i in an["infos"]:
        print(f"note: {i}")
    for c in model_coverage(data, an):
        print("\n".join(coverage_text(c)))


# ----------------------------------------------------------------------------
# Scaffolding
# ----------------------------------------------------------------------------

def new_topic(topic_id: str):
    tdir = TOPICS / topic_id
    if tdir.exists():
        sys.exit(f"{tdir} already exists")
    (tdir / "principles").mkdir(parents=True)
    (tdir / "results").mkdir()
    (tdir / "models").mkdir()
    (tdir / "sources").mkdir()
    (tdir / "topic.yaml").write_text(
        f"""id: {topic_id}
title: {topic_id.replace('-', ' ').title()}
require_sources: true
description: >
  One paragraph on what this map covers.
framework: >
  State the setting every principle lives in: the objects, the primitive
  relation(s) or functions, and any standing conventions (e.g. "≽ is a binary
  relation on Δ(X); ≻ and ~ are its asymmetric and symmetric parts").
background: []
source_catalog:
  - id: misc
    name: Misc.
    kind: misc
notation: ""
""", encoding="utf-8")
    (tdir / "background.md").write_text("## Framework\n\n## Notation\n\n## Conventions\n", encoding="utf-8")
    (tdir / "principles" / ".gitkeep").touch()
    (tdir / "results" / ".gitkeep").touch()
    (tdir / "models" / ".gitkeep").touch()
    (tdir / "sources" / ".gitkeep").touch()
    print(f"created {tdir.relative_to(ROOT)}; add principles with:  pmap new-principle {topic_id} <id>")


def new_principle(topic_id: str, pid: str):
    if pid == FALSE:
        sys.exit("false is a logical conclusion, not a principle")
    path = TOPICS / topic_id / "principles" / f"{pid}.yaml"
    if path.exists():
        sys.exit(f"{path} already exists")
    path.write_text(
        f"""id: {pid}
name: {pid.replace('-', ' ').title()}
statement: >
  Precise informal statement.
formal: ""
aliases: []
tags: []
sources: []
notes: ""
date: {_dt.date.today().isoformat()}
lean: null
""", encoding="utf-8")
    print(f"created {path.relative_to(ROOT)}")


def new_model(topic_id: str, mid: str, source_id: str):
    path = TOPICS / topic_id / "models" / f"{mid}.yaml"
    if path.exists():
        sys.exit(f"{path} already exists")
    path.parent.mkdir(exist_ok=True)
    today = _dt.date.today().isoformat()
    path.write_text(
        f"""id: {mid}
name: {mid.replace('-', ' ').title()}
description: |
  The construction, then the verification of each listed principle.
satisfies: []
violates: []
status: conjectured
certificate:
  source_id: {source_id}
  lean: none
  produced_by: ""
  checked_by: []
  date: {today}
checks: []
sources: []
notes: ""
""", encoding="utf-8")
    print(f"created {path.relative_to(ROOT)}")


def new_result(topic_id: str, rid: str, source_id: str):
    path = TOPICS / topic_id / "results" / f"{rid}.yaml"
    if path.exists():
        sys.exit(f"{path} already exists")
    today = _dt.date.today().isoformat()
    path.write_text(
        f"""id: {rid}
premises: []
conclusion: ""
status: conjectured
certificate:
  source_id: {source_id}
  lean: none
  produced_by: ""
  checked_by: []
  date: {today}
proof: ""
sources: []
notes: ""
""", encoding="utf-8")
    print(f"created {path.relative_to(ROOT)}")


# ----------------------------------------------------------------------------
# Self-test of the engine
# ----------------------------------------------------------------------------

def _selftest_arguments():
    """Flattening and validation of model records in the argument format."""
    cert = {"source_id": "misc", "produced_by": "A", "date": "2026-01-01", "lean": "none"}
    rec = {"id": "m", "name": "M", "certificate": cert, "sources": ["S"], "definition": "D", "_file": "topics/t/models/m.yaml",
           "arguments": [{"holds": ["a", "b"], "text": "x"}, {"fails": ["c"], "source": {"paper": "p"}},
                         {"holds": ["b"], "fails": ["d"], "text": "y"},
                         {"holds": ["e"], "text": "z", "withdrawn": {"date": "2026-01-02", "reason": "wrong"}}]}
    [m] = flatten_model(rec)
    assert (m["satisfies"], m["violates"], m["status"]) == (["a", "b"], ["c", "d"], "proved"), m
    assert "tier" not in m and "model_check" not in m and m["_source"] == rec and m["_source"] is not rec
    rec["arguments"].append({"holds": ["a"], "standing": "conjectured", "text": "restated"})
    assert len(flatten_model(rec)) == 1, "a conjecture of an established verdict adds no companion"
    rec["arguments"] += [{"holds": ["f"], "fails": ["g"], "standing": "conjectured", "tier": "bronze", "text": "  first  "},
                         {"holds": ["h"], "standing": "conjectured", "tier": "silver", "source": {"paper": "p"}}]
    m, c = flatten_model(rec)
    assert (m["satisfies"], m["violates"]) == (["a", "b"], ["c", "d"])
    assert c["id"] == "m-conjectured" and c["status"] == "conjectured" and c["tier"] == "silver"
    assert (c["satisfies"], c["violates"]) == (["a", "b", "f", "h"], ["c", "d", "g"])
    assert c["model_check"] == {"model": "m", "satisfies": ["f", "h"], "violates": ["g"]}
    assert c["notes"] == "first" and c["companion_of"] == "m" and c["certificate"] == cert and c["certificate"] is not cert
    rec["arguments"][-1]["companion_id"] = "m-old"
    assert flatten_model(rec)[1]["id"] == "m-old"
    rec["construction"] = {"standing": "conjectured", "text": "Check it.", "tier": "gold"}
    [m] = flatten_model(rec)
    assert m["status"] == "conjectured" and m["tier"] == "gold" and m["notes"] == "Check it."
    assert (m["satisfies"], m["violates"]) == (["a", "b", "f", "h"], ["c", "d", "g"])
    rec["construction"]["withdrawn"] = {"date": "2026-01-03", "reason": "not a model"}
    assert flatten_model(rec) == []
    del rec["construction"]
    # Both formats validate; a record cannot mix them.
    V = jsonschema.Draft202012Validator(_schema("model"))
    clean = {k: v for k, v in rec.items() if not k.startswith("_")}
    assert V.is_valid(clean), list(V.iter_errors(clean))
    old = {"id": "o", "name": "O", "certificate": cert, "sources": ["S"], "satisfies": [], "violates": [], "status": "proved", "description": "D"}
    assert V.is_valid(old) and not V.is_valid({**old, "arguments": []}) and not V.is_valid({**clean, "status": "proved"})
    assert not V.is_valid({k: v for k, v in clean.items() if k != "definition"}), "a model needs a definition"
    # The errors that need no engine.
    data = {"principles": [{"id": x} for x in "abcdefgh"], "results": [], "papers": [{"id": "p"}], "provenance": [],
            "models": flatten_model(rec), "model_sources": [rec]}
    assert argument_errors(data, set("abcdefgh")) == []
    rec["arguments"] += [{"text": "nothing"}, {"holds": ["a"]}, {"holds": ["zz"], "text": "?"}, {"fails": ["a"], "text": "clash"},
                         {"holds": ["a"], "like": "m#nowhere"}, {"holds": ["a"], "text": "t", "adapt": "x"},
                         {"holds": ["a"], "text": "t", "tier": "gold"}, {"id": "k", "holds": ["a"], "source": {"paper": "q"}}]
    errors = argument_errors(data, set("abcdefgh"))
    for want in ("arguments[7]: settles nothing", "arguments[8]: gives no reason", "unknown principle 'zz'",
                 "'a' both holds (arguments: arguments[0], arguments[4], arguments[8], arguments[11], arguments[12], arguments[13], k) and fails (arguments: arguments[10])",
                 "like names no argument: 'm#nowhere'", "adapt is used only with like", "tier is for conjectured arguments only",
                 "k: unknown paper 'q'"):
        assert any(want in e for e in errors), (want, errors)
    assert len(errors) == 8, errors
    rec["arguments"][-1]["id"] = "nowhere"
    assert not any("like names no argument" in e for e in argument_errors(data, set("abcdefgh")))
    # An admission sidecar is shared by the records it added to; each argument naming it needs an entry.
    side = {"id": "admission-x", "_file": "topics/t/provenance/admission-x.yaml", "trawl": {"reviews": [], "admission": {"id": "admission-x"}},
            "records": [{"record": "m", "discovery": {"trawl_id": "trawl-1"}, "evidence": []}]}
    data = {**data, "provenance": [side]}
    del rec["arguments"][7:]
    rec["arguments"][0]["provenance"] = "admission-x"
    assert argument_errors(data, set("abcdefgh")) == [], argument_errors(data, set("abcdefgh"))
    assert trawl_block(side, "m") == {"reviews": [], "admission": {"id": "admission-x"}, "discovery": {"trawl_id": "trawl-1"}, "evidence": []}
    assert trawl_block(side, "n") is None and provenance_records(side) == ["m"]
    side["records"] = [{**side["records"][0], "record": "n"}, {**side["records"][0], "record": "n"}]
    errors = argument_errors(data, set("abcdefgh"))
    assert any("has nothing for 'm'" in e for e in errors) and any("record 'n' is not a model" in e for e in errors) \
        and any("a record has two entries" in e for e in errors), errors


def _selftest_groups():
    """Expansion and validation of a group's members."""
    import copy
    group = {"id": "g", "name": "G", "_file": "topics/t/groups/g.yaml",
             "definition": "Arrows: {{monoid}}. Shared text. {{sigma}}",
             "parameters": {"monoid": {"text": "The monoid."},
                            "sigma": {"text": "Σ.", "values": {"top": "Σ is top.", "atom": "Σ is an atom."}}},
             "conditions": [{"id": "perturbable", "text": "Some arrow perturbs."}],
             "arguments": [{"id": "always", "holds": ["a"], "text": "Always.", "by": "X", "date": "2026-02-01"},
                          {"id": "top", "fails": ["c"], "when": {"sigma": "top"}, "text": "Top.", "by": "X", "date": "2026-02-01"},
                          {"id": "either", "holds": ["e"], "when": {"sigma": ["top", "atom"]}, "text": "Either.", "by": "X", "date": "2026-02-01"},
                          {"id": "perturbed", "fails": ["d"], "requires": ["perturbable"], "text": "Perturbed.", "by": "Y", "date": "2026-02-02"}]}
    cert = {"source_id": "misc", "produced_by": "A", "date": "2026-01-01", "lean": "none"}
    rec = {"id": "m", "name": "M", "certificate": cert, "sources": ["S"], "_file": "topics/t/models/m.yaml",
           "group": "g", "settings": {"monoid": "the truncations", "sigma": "top"}, "meets": {"perturbable": "g_n does."},
           "definition": "Own text.", "arguments": [{"holds": ["b"], "text": "Own."}]}
    raw = copy.deepcopy(rec)
    full = expand_member(rec, {"g": group})
    assert rec == raw, "expansion leaves the record as written"
    assert full["definition"] == "Arrows: the truncations. Shared text. Σ is top.\n\nOwn text.", full["definition"]
    assert [a.get("id") for a in full["arguments"]] == [None, "always", "top", "either", "perturbed"], "own first, then shared arguments"
    assert all(a["group"] == "g" for a in full["arguments"][1:]) and "when" not in full["arguments"][2]
    assert full["arguments"][4]["conditions"] == [{"id": "perturbable", "text": "Some arrow perturbs.", "reason": "g_n does."}]
    assert argument_label(full["arguments"][4], 4) == "g#perturbed"
    [m] = flatten_model(full, raw=rec)
    assert (m["satisfies"], m["violates"]) == (["b", "a", "e"], ["c", "d"]) and m["_source"] == raw
    # A member's own prose for a parameter matches no `when`; not meeting a condition loses its shared argument.
    other = {**rec, "settings": {"monoid": "permutations", "sigma": {"text": "Σ is contingent."}}, "meets": {}}
    full2 = expand_member(other, {"g": group})
    assert [a.get("id") for a in full2["arguments"]] == [None, "always"] and full2["definition"].startswith("Arrows: permutations. Shared text. Σ is contingent.")
    assert expand_member({**rec, "group": "nowhere"}, {"g": group}) == {**rec, "group": "nowhere"}
    # Schemas: a member may leave its definition to the group; settings need a group.
    V = jsonschema.Draft202012Validator(_schema("model"))
    clean = lambda d: {k: v for k, v in d.items() if not k.startswith("_")}
    member = {k: v for k, v in clean(rec).items() if k != "definition"}
    assert V.is_valid(member), list(V.iter_errors(member))
    assert not V.is_valid({k: v for k, v in member.items() if k != "group"})
    G = jsonschema.Draft202012Validator(_schema("group"))
    assert G.is_valid(clean(group)), list(G.iter_errors(clean(group)))
    assert not G.is_valid({**clean(group), "arguments": [{"id": "x", "holds": ["a"], "text": "t"}]}), "a shared argument needs by and date"
    assert not G.is_valid({**clean(group), "arguments": [{**group["arguments"][0], "provenance": "p"}]})
    # Validation: shared arguments once, in the group; members' settings and meets.
    data = {"principles": [{"id": x} for x in "abcde"], "results": [], "papers": [], "provenance": [], "groups": [group],
            "models": [m], "model_sources": [full]}
    assert argument_errors(data, set("abcde")) == [], argument_errors(data, set("abcde"))
    bad_group = {**group, "definition": "{{monoid}} {{colour}}",
                 "arguments": group["arguments"] + [{"id": "always", "holds": ["zz"], "when": {"monoid": "x", "sigma": "bottom"},
                                                   "requires": ["nowhere"], "text": "t", "by": "X", "date": "2026-02-01"}]}
    bad = {**rec, "settings": {"monoid": "x", "sigma": "bottom", "colour": "red"}, "meets": {"elsewhere": "?"},
           "arguments": [{"id": "always", "holds": ["b"], "text": "Clash."}]}
    data = {**data, "groups": [bad_group], "model_sources": [expand_member(bad, {"g": bad_group}), {**rec, "id": "n", "group": "nowhere"},
                                                            {"id": "o", "_file": "topics/t/models/o.yaml", "settings": {}, "arguments": []}]}
    errors = argument_errors(data, set("abcde"))
    for want in ("slot {{colour}} is no parameter", "always: duplicate shared argument id", "unknown principle 'zz'",
                 "when names 'monoid', which is not a parameter with named values", "'bottom' is not a value of sigma",
                 "requires unknown condition 'nowhere'", "setting 'colour' is not a parameter", "setting 'sigma' must be one of",
                 "meets 'elsewhere', which is no condition", "no group groups/nowhere.yaml", "settings is only for a group's member"):
        assert any(want in e for e in errors), (want, errors)
    clash = {**rec, "arguments": [{"id": "always", "holds": ["b"], "text": "Clash."}, {"fails": ["a"], "text": "No."}]}
    errors = argument_errors({**data, "groups": [group], "model_sources": [expand_member(clash, {"g": group})]}, set("abcde"))
    assert any("argument id 'always' is also a shared argument of g" in e for e in errors), errors
    assert any("'a' both holds (arguments: g#always) and fails (arguments: arguments[1])" in e for e in errors), errors
    assert _argument_target({"model_sources": [], "groups": [group]}, "g#top") is group["arguments"][1]
    # Generated parameters: a variant for every other value the member may take, a default for a
    # member that sets none, own arguments limited by `when`, `own` matching a member's own prose.
    gen = copy.deepcopy(group)
    gen["definition"] = "Arrows: {{monoid}}. {{size}} {{sigma}}"
    gen["parameters"]["size"] = {"text": "Size.", "generate": True, "default": "big", "values": {
        "big": {"text": "Big.", "label": "big"}, "one": {"text": "One.", "label": "one thing"}}}
    gen["parameters"]["sigma"] = {"text": "Σ.", "generate": True, "values": {
        "top": {"text": "Σ is top.", "label": "Σ top"}, "atom": {"text": "Σ is an atom.", "label": "Σ atom", "requires": ["perturbable"]}}}
    mem = {**rec, "definition": None, "arguments": [{"holds": ["b"], "text": "Own.", "when": {"size": "big"}},
                                                   {"fails": ["e"], "text": "Own prose.", "when": {"sigma": "own"}}]}
    assert member_settings(gen, mem) == {"monoid": "the truncations", "sigma": "top", "size": "big"}
    vs = member_variants(mem, gen)
    assert [(v["sigma"], v["size"]) for v in vs] == [("top", "one"), ("atom", "big"), ("atom", "one")], vs
    assert member_variants({**mem, "meets": {}}, gen) == [{"monoid": "the truncations", "sigma": "top", "size": "one"}], "a value's requires is met first"
    assert variant_label(gen, mem, vs[2]) == ("sigma-atom-size-one", "Σ atom; one thing")
    v = expand_member(mem, {"g": gen}, vs[0])
    assert v["definition"] == "Arrows: the truncations. One. Σ is top." and [a.get("id") for a in v["arguments"]] == ["always", "top", "either", "perturbed"]
    prose = {**mem, "settings": {"monoid": "x", "sigma": {"text": "Σ is mine."}}}
    assert [a.get("text") for a in expand_member(prose, {"g": gen})["arguments"]][:2] == ["Own.", "Own prose."]
    assert len(member_variants(prose, gen)) == 5, "the member's own prose stays one of its choices"
    G2 = jsonschema.Draft202012Validator(_schema("group"))
    assert G2.is_valid(clean(gen)), list(G2.iter_errors(clean(gen)))
    assert V.is_valid({k: x for k, x in clean(mem).items() if k != "definition"})
    bad_gen = copy.deepcopy(gen)
    bad_gen["parameters"]["size"]["default"] = "huge"
    bad_gen["parameters"]["sigma"]["values"]["atom"]["requires"] = ["nowhere"]
    bad_mem = {**mem, "arguments": [{"holds": ["b"], "text": "Own.", "when": {"size": "medium"}}]}
    full_bad = expand_member(bad_mem, {"g": bad_gen})
    full_bad["_raw"] = bad_mem
    errors = argument_errors({**data, "groups": [bad_gen], "model_sources": [full_bad]}, set("abcde"))
    for want in ("the default of 'size' is not one of its values", "value 'atom' of 'sigma' requires unknown condition 'nowhere'",
                 "'medium' is not a value of size"):
        assert any(want in e for e in errors), (want, errors)
    # General arguments: any record meeting their conditions gets them, whether it meets them itself,
    # through its group, or through a parameter's value; one with `given` waits for those verdicts.
    lib = {"conditions": {"one-object": {"id": "one-object", "text": "One object."}, "single": {"id": "single", "text": "Single."}},
           "arguments": [{"id": "npc", "requires": ["one-object"], "holds": ["a"], "text": "NPC.", "by": "Z", "date": "2026-04-01"},
                         {"id": "nc", "requires": ["single"], "given": ["a"], "holds": ["c"], "text": "From NPC.", "by": "Z", "date": "2026-04-01"},
                         {"id": "never", "requires": ["one-object"], "given": ["d"], "holds": ["e"], "text": "Never.", "by": "Z", "date": "2026-04-01"}]}
    lg = copy.deepcopy(gen)
    lg["meets"] = {"one-object": "Every member has one object."}
    lg["parameters"]["size"]["values"]["one"]["meets"] = {"single": "One thing."}
    at = lambda settings: [a.get("general") for a in expand_member(mem, {"g": lg}, settings, lib)["arguments"] if a.get("general")]
    assert at(None) == ["npc"], "the group meets one-object for every member"
    assert at(vs[0]) == ["npc", "nc"], "a value meets single; nc waits for npc's verdict"
    cg = copy.deepcopy(lg)
    cg["meets"] = {"one-object": {"text": "Those that perturb have one object.", "requires": ["perturbable"]}}
    assert at.__call__ and [a.get("general") for a in expand_member(mem, {"g": cg}, None, lib)["arguments"] if a.get("general")] == ["npc"], "met through perturbable"
    assert [a.get("general") for a in expand_member({**mem, "meets": {}}, {"g": cg}, None, lib)["arguments"] if a.get("general")] == [], "not without it"
    full_l = expand_member(mem, {"g": lg}, vs[0], lib)
    assert full_l["arguments"][-1]["conditions"] == [{"id": "single", "text": "Single.", "reason": "One thing."}]
    assert argument_label(full_l["arguments"][-1], 0) == "arguments/nc"
    loose = {"id": "x", "_file": "topics/t/models/x.yaml", "meets": {"one-object": "It has one."}, "arguments": [{"fails": ["b"], "text": "Own."}]}
    assert [a.get("general") for a in expand_member(loose, {}, None, lib)["arguments"]] == [None, "npc"], "a record outside any group"
    assert expand_member({**loose, "meets": {}}, {}, None, lib) == {**loose, "meets": {}}
    gl = [{**c, "_file": f"topics/t/arguments/{c['id']}.yaml"} for c in lib["arguments"]]
    gl.append({"id": "wrong", "_file": "topics/t/arguments/other.yaml", "requires": ["nowhere"], "given": ["zz"], "holds": ["a"], "text": "t", "by": "Z", "date": "2026-04-01"})
    ldata = {**data, "groups": [lg], "conditions": list(lib["conditions"].values()), "general_arguments": gl,
             "model_sources": [expand_member(loose, {}, None, lib), {**loose, "id": "y", "_file": "topics/t/models/y.yaml", "meets": {"elsewhere": "?"}}]}
    errors = argument_errors(ldata, set("abcde"))
    for want in ("id 'wrong' must equal file stem 'other'", "requires unknown condition 'nowhere' (conditions.yaml)",
                 "given names unknown principle 'zz'", "meets 'elsewhere', which is not a condition of the topic"):
        assert any(want in e for e in errors), (want, errors)
    assert not any("x.yaml" in e for e in errors), errors
    GA = jsonschema.Draft202012Validator(_schema("general-argument"))
    assert GA.is_valid(lib["arguments"][1]), list(GA.iter_errors(lib["arguments"][1]))
    assert not GA.is_valid({**lib["arguments"][0], "requires": []}) and not GA.is_valid({**lib["arguments"][0], "when": {"x": "y"}})
    # A choiceless value: a model at it gets only the arguments marked `choice: free`, its own, its
    # group's and the topic's; a `given` waits for verdicts of the arguments that survive.
    zg = {"id": "z", "definition": "{{meta}}", "arguments": [{"id": "s-free", "holds": ["s1"], "text": "t", "by": "Z", "date": "2026-04-01", "choice": "free"},
                                                          {"id": "s-uses", "holds": ["s2"], "text": "t", "by": "Z", "date": "2026-04-01", "choice": "uses"}],
          "meets": {"one-object": "One.", "single": "One."},
          "parameters": {"meta": {"text": "Metatheory.", "generate": True, "default": "zfc",
                                  "values": {"zfc": "ZFC.", "zf": {"text": "ZF.", "choiceless": True}}}}}
    zlib = {"conditions": lib["conditions"], "arguments": [{**lib["arguments"][0], "choice": "free"}, {**lib["arguments"][1], "choice": "free"},
                                                           {"id": "chooses", "requires": ["one-object"], "holds": ["f"], "text": "t", "by": "Z", "date": "2026-04-01", "choice": "uses"}]}
    zm = {"id": "zm", "group": "z", "arguments": [{"holds": ["o1"], "text": "free", "choice": "free"}, {"holds": ["o2"], "text": "unreviewed"}]}
    held = lambda settings: sorted(p for a in expand_member(zm, {"z": zg}, settings, zlib)["arguments"] for p in a.get("holds") or [])
    assert held(None) == ["a", "c", "f", "o1", "o2", "s1", "s2"], held(None)
    assert held({"meta": "zf"}) == ["a", "c", "o1", "s1"], held({"meta": "zf"})
    assert choiceless(zg, {"meta": "zf"}) and not choiceless(zg, {"meta": "zfc"})
    # A value may require a condition another parameter's value meets, and a member may meet a
    # condition only at some settings ({text, when}); a value's own meets never satisfy its requires.
    xg = {"id": "x", "definition": "{{ind}} {{meta}}", "parameters": {
        "ind": {"text": "I.", "generate": True, "default": "one", "values": {"one": "One.", "many": {"text": "Many.", "meets": {"infinite": "D."}}}},
        "meta": {"text": "M.", "generate": True, "default": "choice", "values": {
            "choice": "C.", "reals": {"text": "R.", "requires": ["numbered"]},
            "socks": {"text": "S.", "requires": ["infinite"], "meets": {"socks": "S."}},
            "self": {"text": "X.", "requires": ["selfmet"], "meets": {"selfmet": "X."}}}}}}
    xm = {"id": "xm", "group": "x", "meets": {"numbered": {"text": "Arrows to n.", "when": {"meta": ["choice", "reals"]}}}}
    got = sorted(tuple(sorted(v.items())) for v in member_variants(xm, xg))
    assert got == sorted(tuple(sorted(d.items())) for d in [{"ind": "many", "meta": "choice"}, {"ind": "one", "meta": "reals"},
                                                            {"ind": "many", "meta": "reals"}, {"ind": "many", "meta": "socks"}]), got
    assert "numbered" in conditions_met(xm, xg, {"ind": "one", "meta": "reals"}) and "numbered" not in conditions_met(xm, xg, {"ind": "many", "meta": "socks"})

    # A credit does not repeat a date its author string already gives.
    assert _with_date("C, 20 September 2026", "2026-09-20") == "C, 20 September 2026" and _with_date("C", "2026-09-20") == "C, 2026-09-20"


def selftest():
    _selftest_arguments()
    _selftest_groups()
    P = lambda i: {"id": i, "name": i}
    R = lambda i, prem, c: {"id": i, "premises": prem, "conclusion": c, "status": "proved", "certificate": {"provenance": "human", "lean": "none"}}
    M = lambda i, sat, viol: {"id": i, "satisfies": sat, "violates": viol, "status": "proved", "certificate": {"provenance": "human", "lean": "none"}}
    data = {
        "topic": {"id": "t", "title": "t", "framework": "", "background": ["bg"]},
        "principles": [P(x) for x in "bg a b c d e f".split()],
        "results": [R("r1", ["a"], "b"), R("r2", ["b"], "a"), R("r3", ["a", "c"], "d"), R("r6", ["e"], "c")],
        "models": [M("m1", ["a"], ["d"]), M("m2", ["b", "c"], ["e"])],
    }
    an = analyse(data)
    pair, E = an["pair"], an["engine"]
    assert pair[("a", "b")]["status"] == "implies" and pair[("b", "a")]["status"] == "implies"
    assert any(set(c) == {"a", "b"} for c in an["classes"])
    assert pair[("a", "d")]["status"] == "independent"
    assert pair[("b", "d")]["status"] == "independent", "b ⇔ a and m1 separates a from d"
    assert pair[("a", "c")]["status"] == "independent", "c would give d in m1"
    assert pair[("b", "e")]["status"] == "independent"
    assert pair[("d", "a")]["status"] == "open"
    assert E.package(["a", "c"]) == {"inconsistent": False, "via": [], "entails": ["bg", "b", "d"], "excludes": [], "separated": ["e"], "open": ["f"]}, E.package(["a", "c"])
    assert an["unknown"]["m1"] == ["f"] and an["unknown"]["m2"] == ["f"], an["unknown"]
    assert not an["problems"]
    data["models"].append(M("m3", ["a", "c"], ["d"]))
    assert analyse(data)["problems"], "m3 is inconsistent with r3"
    # A+B+C+D -> False supplies each negative orientation without Boolean nodes.
    constraint = R('abcd-impossible', ['a', 'b', 'c', 'd'], FALSE)
    e = Engine(list('abcde'), [constraint], [])
    for candidate in 'abcd':
        premise = [x for x in 'abcd' if x != candidate]
        assert e.excludes(premise, candidate) == {'target': FALSE, 'via': ['abcd-impossible']}
        assert e.package(premise)['excludes'] == [candidate]
    assert e.package(['a','b','c','d'])['inconsistent']
    assert not e.entails(['a','b','c','d'], 'e')[0], 'No explosion'
    assert not e.excludes(['a'], 'b'), 'A missing model or missing comparison proves nothing'
    assert e.pair('a','b')['status'] == 'open'
    # Follow indirect implications before checking a constraint.
    rules = [R('ae',['a'],'e'), R('be-conflict',['b','e'],FALSE)]
    e = Engine(list('abef'), rules, [M('witness',['a'],[])])
    assert e.pair('a','b')['status'] == 'excludes'
    assert e.excludes(['a'],'b')['via'] == ['ae','be-conflict']
    assert e.excludes(['b'],'a')['via'] == ['ae','be-conflict']
    assert 'b' in e.fails['witness'] and 'f' not in e.fails['witness']
    assert e.fail_why['witness']['b'] == ['witness','ae','be-conflict']
    assert Engine(list('ab'), [], [M('m',['a'],['b'])]).pair('a','b')['status'] == 'independent'
    # A conditional failure cannot be upgraded to unconditional incompatibility.
    assert Engine(list('ab'), [], [M('m',['a'],['b'])]).excludes(['a'],'b') is None
    bad = {'topic': {'background': ['a','b']}, 'principles': [P(x) for x in 'abe'],
           'results': rules, 'models': []}
    assert any('background is inconsistent' in p for p in analyse(bad)['problems'])
    bad['topic']['background'] = []
    bad['models'] = [M('invalid',['a','b'],[])]
    assert any('model invalid is inconsistent' in p for p in analyse(bad)['problems'])
    rules[-1]['status'] = 'conjectured'
    assert not analyse(bad)['problems'], 'Conjectures cannot establish inconsistency'
    # False needs no topic principle definition to generate a Lean proposition.
    cov = lean_coverage({'principles': [dict(P('a'), lean_def='Example.A')],
                         'results': [R('not-a',['a'],FALSE)], 'models': []})
    assert len(cov['ready']) == 1 and not cov['blocked']
    # Lynchpin conjectures: hand-checked scores, then agreement with full engine rebuilds.
    ly = {"topic": {"id": "t", "title": "t", "framework": "", "background": []},
          "principles": [P(x) for x in "pqrs"], "results": [R("pq", ["p"], "q")], "models": [M("m1", ["p"], ["s"])]}
    L = Lynchpins(ly)
    assert L.progress()["open"] == 27 and len(L.open_questions()) == 27
    r = L.set_index[("r",)]
    assert L.with_rule(("r",), "p", (r, "p")) == 4, "r ⇒ p also gives r ⇒ q, q ∧ r ⇒ p, r ∧ s ⇒ p and r ∧ s ⇒ q"
    assert L.with_model(("r",), ["p"], (r, "p")) == 2, "a countermodel to r ⇒ p shows r consistent and refutes ⊤ ⇒ p"
    ps = L.set_index[("p", "s")]
    assert L.with_rule(("p", "s"), FALSE, (ps, FALSE)) == 5, "p ∧ s ⇒ ⊥ makes p ∧ s ⇒ r moot and excludes s ⇒ p, q ∧ s ⇒ p, r ∧ s ⇒ p and p ∧ r ⇒ s"
    assert L.with_model(("p", "s"), [], (ps, FALSE)) == 2, "a model of p ∧ s also shows s and q ∧ s consistent"

    def brute(L, rule=None, models=None, skip=None, keep=lambda S, c: True):
        results = L.results + ([{"id": "h", "premises": list(rule[0]), "conclusion": rule[1]}] if rule else [])
        E = Engine(L.ids, results, L.models if models is None else models, L.background, L.negative)
        wit = [(E.holds[m["id"]], E.fails[m["id"]]) for m in E.models if m["id"] not in E.model_conflicts]
        bad = lambda S: E.conflict(S) is not None
        cl = lambda S: E.cl(S)[0]
        refuted = lambda S, c: any(set(S) <= H and (c == FALSE or c in F) for H, F in wit)
        settled = lambda S, c: (bad(S) if c == FALSE else (c in cl(S) or bad([*S, c]))) or refuted(S, c)
        return sum(1 for q in L.open_questions() if q != skip and keep(*q) and settled(*q))

    def agree(L):
        for S, c in L.open_questions():
            j, V = L.set_index[S], [c] if c != FALSE else []
            assert L.with_rule(S, c, (j, c)) == brute(L, rule=(S, c), skip=(S, c)), (S, c, "rule")
            assert L.with_model(S, V, (j, c)) == brute(L, models=[*L.models, M("x", list(S), V)], skip=(S, c)), (S, c, "model")
        for m in L.witnesses:
            others = [x for x in L.models if x is not m]
            for c in L.proper:
                if c in L.E.holds[m["id"]] or c in L.E.fails[m["id"]]:
                    continue
                assert L.with_model([*m["satisfies"], c], m["violates"]) == brute(L, models=[*others, M(m["id"], [*m["satisfies"], c], m["violates"])]), (m["id"], c)
                assert L.with_model(m["satisfies"], [*m["violates"], c]) == brute(L, models=[*others, M(m["id"], m["satisfies"], [*m["violates"], c])]), (m["id"], c)
    agree(L)

    # Core questions: no premise or one; A ∧ B ⇒ ⊥; A ∧ B ⇒ C with C ⇒ A and C ⇒ B established.
    def core_q(L, S, c):
        return len(S) <= 1 or (c == FALSE or {*S} <= L.E.cl([c])[0])

    def agree_core(L):
        for j, (S, _, _) in enumerate(L.sets):
            for c in L.proper:
                if L.qmask[j] & L.bit[c]:
                    assert bool(L.coremask[j] & L.bit[c]) == core_q(L, S, c), (S, c, "core mask")
        keep = lambda S, c: core_q(L, S, c)
        for S, c in L.open_questions():
            j, V = L.set_index[S], [c] if c != FALSE else []
            assert L.with_rule(S, c, (j, c), both=True)[1] == brute(L, rule=(S, c), skip=(S, c), keep=keep), (S, c, "core rule")
            assert L.with_model(S, V, (j, c), both=True)[1] == brute(L, models=[*L.models, M("x", list(S), V)], skip=(S, c), keep=keep), (S, c, "core model")
        p = L.progress()["core"]
        qs = [(S, c) for (S, _, _), g, st in zip(L.sets, L.qmask, L.qfalse) for c in [*(x for x in L.proper if g & L.bit[x]), *([FALSE] if st is not None else [])] if core_q(L, S, c)]
        assert p["questions"] == len(qs) and p["open"] == sum(1 for q in L.open_questions() if core_q(L, *q)), "core progress counts the core questions"
    agree_core(L)
    core_ly = {"topic": ly["topic"], "principles": [P(x) for x in "abcd"],
               "results": [R("c-a", ["c"], "a"), R("c-b", ["c"], "b")], "models": [M("m", ["a"], ["d"])]}
    Lc = Lynchpins(core_ly)
    assert core_q(Lc, ("a", "b"), "c") and not core_q(Lc, ("a", "d"), "c"), "a ∧ b ⇒ c is core since c ⇒ a and c ⇒ b"
    agree_core(Lc)
    crows = [r for r in Lc.rank(top=None)["rows"] if r.get("core_rank") is not None]
    assert crows and all(Lc._is_core(r) or any(Lc._is_core({**r, "premises": S}) for S in r.get("premise_sets", [])) for r in crows)
    chm = lambda r: (r["core_yes"] * r["core_no"]) ** 0.5
    assert all(min(r["core_yes"], r["core_no"]) >= 1 for r in crows), "an answer settles at least the question itself"
    crows.sort(key=lambda r: r["core_rank"])
    assert [r["core_rank"] for r in crows] == list(range(1, len(crows) + 1)) and crows == sorted(crows, key=lambda r: (-chm(r), -min(r["core_yes"], r["core_no"]))), "core questions: by the geometric mean of their core scores"
    assert not any(r["kind"] == "check" for r in crows), "model checks are not core questions"
    ranked = L.rank(top=3)
    top, auto = ranked["rows"], ranked["auto"]
    hm = lambda r: 2 * r["yes"] * r["no"] / (r["yes"] + r["no"]) if r["yes"] + r["no"] else 0
    assert all(set(r) >= {"kind", "yes", "no", "score", "rank", "auto_rank", "auto_claim"} for r in top) and [r["rank"] for r in top] == [1, 2, 3]
    assert top == sorted(top, key=lambda r: (-hm(r), -min(r["yes"], r["no"]))), "central questions: by the harmonic mean, then the smaller side"
    assert auto == sorted(auto, key=lambda r: (-max(r["yes"], r["no"]), -min(r["yes"], r["no"]))) and [r["auto_rank"] for r in auto] == [1, 2, 3]
    assert all(r["auto_claim"] == ("entails" if r["no"] >= r["yes"] else "not") for r in auto), "the answer to expect is the less surprising one"
    assert auto[0]["premises"] == ["r"] and auto[0]["conclusion"] == FALSE and auto[0]["auto_claim"] == "not", "r ⊢ ⊥ at 17/0 is expected to fail: r ⊬ ⊥"
    assert top[0]["kind"] == "check" and top[0]["yes"] == 6 and top[0]["no"] == 3, "m1: r at 6/3 has the best balance"
    # A conjectured record attaches to the row asking its question, premises reduced to the
    # class representatives the question uses; a model attaches to each violation and to consistency.
    noted = {**ly, "results": [*ly["results"], dict(R("rp", ["r"], "p"), status="conjectured", notes="Try a two-point frame.", tier="gold"),
                                dict(R("pqr", ["p", "q"], "r"), status="conjectured", notes="", tier="silver")],
             "models": [*ly["models"], dict(M("m3", ["r", "s"], ["p"]), status="conjectured", notes="Sketched only.")]}
    Ln = Lynchpins(noted)
    assert Ln.progress() == L.progress(), "conjectures are no evidence"
    rows = {(tuple(r["premises"]), r["conclusion"]): r for r in Ln.rank(top=100)["rows"] if r["kind"] == "question"}
    assert [c["id"] for c in rows[("r",), "p"]["conjectures"]] == ["rp"] and lynchpin_notes(rows[("r",), "p"]) == [("rp", "Try a two-point frame.")]
    assert [c["id"] for c in rows[("p",), "r"]["conjectures"]] == ["pqr"], "p ∧ q ⇒ r asks p ⇒ r, since p ⇒ q"
    assert not lynchpin_notes(rows[("p",), "r"]) and rows[("p",), "r"]["tier"] == "silver", "no notes, but a tier given by hand still stars"
    assert rows[("r",), "p"]["tier"] == "gold" and rows[("r", "s"), "p"]["tier"] == "bronze", "notes alone are bronze; a record may raise its question"
    assert "tier" not in rows[("r",), "s"]
    assert [c["id"] for c in rows[("r", "s"), "p"]["conjectures"]] == ["m3"] and [c["id"] for c in rows[("r", "s"), FALSE]["conjectures"]] == ["m3"]
    assert "conjectures" not in rows[("r",), "s"]
    assert [r["rank"] for r in Ln.rank(top=100)["rows"]] == list(range(1, 29)), "every row carries its rank"
    short = Ln.rank(top=2)
    assert [r["rank"] for r in short["rows"]] == [1, 2], "the ranking keeps only its top"
    complete = Ln.rank(top=None)
    assert complete["rows"] == Ln.rank(top=100)["rows"], "unlimited export keeps every central question"
    assert complete["auto"] == Ln.rank(top=100)["auto"], "unlimited export keeps every automatically generated conjecture"
    assert [r["rank"] for r in complete["rows"]] == list(range(1, 29))
    assert sorted(r["rank"] for r in short["recorded"]) == sorted(rows[q]["rank"] for q in [(("r",), "p"), (("p",), "r"), (("r", "s"), "p"), (("r", "s"), FALSE)]), "recorded conjectures are the questions the records ask, at their rank"
    # A named-model conjecture attaches to the existing check, not a large
    # implication package. Its established flags must not hide it from filters.
    named = dict(M("m1-r", ["p", "q", "r"], ["s"]), status="conjectured", notes="Proposed witness.", tier="bronze",
                 model_check={"model": "m1", "satisfies": ["r"], "violates": []})
    named_data = {**ly, "models": [*ly["models"], named]}
    named_L = Lynchpins(named_data)
    named_ranked = named_L.rank(top=None)
    named_row = next(r for r in named_ranked["rows"] if r.get("model") == "m1" and r.get("principle") == "r")
    assert named_L.progress() == L.progress(), "a conjectured model check supplies no evidence"
    assert named_ranked["recorded"] == [named_row] and named_row["tier"] == "bronze"
    assert named_row["claim"] == "entails" and named_row["conjectures"][0]["id"] == named["id"]
    assert "★ bronze" in lynchpin_row_text(named_row, str, True)
    assert named_L.rank(top=None)["recorded"] == [named_row], "repeat ranking must not duplicate the attached record"
    negative_named = {**named, "satisfies": ["p", "q"], "violates": ["s", "r"],
                      "model_check": {"model": "m1", "satisfies": [], "violates": ["r"]}}
    negative_row = Lynchpins({**ly, "models": [*ly["models"], negative_named]}).rank(top=None)["recorded"][0]
    assert negative_row["claim"] == "not" and lynchpin_scores(negative_row) == (negative_row["no"], negative_row["yes"])
    assert ": ¬r ★ bronze" in lynchpin_row_text(negative_row, str, True)
    for holds, expected in ((True, "proved"), (False, "refuted")):
        base = M("m1", ["p", "r"] if holds else ["p"], ["s"] if holds else ["s", "r"])
        resolved = Lynchpins({**ly, "models": [base, named]}).rank(top=None)["recorded"][0]
        assert resolved["status"] == resolved["verdict"] == expected
        assert resolved["rank"] is None and resolved["yes"] is None and resolved["tier"] == "bronze"
    assert not Lynchpins(named_data, background=["r"]).rank(top=None)["recorded"], "a model not known to fit a preset is not assumed to fit"
    named_sparse = Lynchpins(named_data).rank(top=None, score_all=False)
    assert named_sparse["recorded"][0]["rank"] is None and named_sparse["recorded"][0]["yes"] is not None
    # Conditional equivalence: c and d are interchangeable only with BOTH p and q.
    conditional = {"topic": {"background": []}, "principles": [P(x) for x in "pqcde"],
                   "results": [R("pcd", ["p", "c"], "d"), R("qdc", ["q", "d"], "c"),
                               dict(R("pqc", ["p", "q"], "c"), status="conjectured", notes="First route."),
                               dict(R("pqd", ["p", "q"], "d"), status="conjectured", notes="Second route.", tier="gold"),
                               dict(R("pqe", ["p", "q", "c"], "e"), status="conjectured")], "models": []}
    Lc = Lynchpins(conditional)
    grouped = Lc.rank(top=None)
    for key, rank_key in (("rows", "rank"), ("auto", "auto_rank")):
        groups = grouped[key]
        assert [r[rank_key] for r in groups] == list(range(1, len(groups) + 1))
        matching = [r for r in groups if r["premises"] == ["p", "q"] and "c" in r.get("conclusions", [r["conclusion"]])]
        assert len(matching) == 1 and set(matching[0]["conclusions"]) == {"c", "d"}
        assert {c["id"] for c in matching[0]["conjectures"]} == {"pqc", "pqd"} and matching[0]["tier"] == "gold"
        assert lynchpin_row_text(matching[0], lambda x: x).startswith("p ∧ q ⊢ c or d")
        assert any(r["premises"] == ["p", "q"] and r["conclusion"] == "e" and "conclusions" not in r for r in groups), "a conjectured link does not establish equivalence"
        assert all("conclusions" not in r for r in groups if r["premises"] in (["p"], ["q"])), "the exact premise set matters"
    for group in Lc._ranked:
        assert len({(r["yes"], r["no"]) for r in group}) == 1, "equivalent questions keep a single pair of scores"
    rec_cd = [r for r in grouped["recorded"] if r["premises"] == ["p", "q"]]
    assert {r["conclusion"] for r in rec_cd} == {"c", "d"} and len({r["rank"] for r in rec_cd}) == 1
    assert all("conclusions" not in r for r in rec_cd), "recorded claims keep their own conclusions"
    assert Lc.rank(top=2)["rows"] == grouped["rows"][:2], "limit after grouping, including cached calls"
    one_way = Lynchpins({**conditional, "results": [conditional["results"][0]]}).rank(top=None)
    assert all("conclusions" not in r for r in one_way["rows"]), "one-way implication is not equivalence"
    # Equivalent conjunctions and a single principle share a row, on both sides at once.
    antecedent_data = {"topic": {"background": []}, "principles": [P(x) for x in "pqrsucde"],
                       "results": [R("pqu", ["p", "q"], "u"), R("rsu", ["r", "s"], "u"),
                                   *[R("u" + x, ["u"], x) for x in "pqrs"],
                                   R("ucd", ["u", "c"], "d"), R("udc", ["u", "d"], "c"), R("eu", ["e"], "u"),
                                   dict(R("ue", ["u"], "e"), status="conjectured"),
                                   dict(R("pqc", ["p", "q"], "c"), status="conjectured", notes="Pair route."),
                                   dict(R("ud", ["u"], "d"), status="conjectured", notes="Single route.", tier="silver")],
                       "models": []}
    La = Lynchpins(antecedent_data)
    antecedents = La.rank(top=None)
    expected_sets = {("p", "q"), ("r", "s"), ("u",)}
    for key, rank_key in (("rows", "rank"), ("auto", "auto_rank")):
        groups = antecedents[key]
        matches = [r for r in groups if ["u"] in r.get("premise_sets", [r["premises"]])
                   and "c" in r.get("conclusions", [r["conclusion"]])]
        assert len(matches) == 1
        row = matches[0]
        assert set(map(tuple, row["premise_sets"])) == expected_sets and row["conclusions"] == ["c", "d"]
        assert {c["id"] for c in row["conjectures"]} == {"pqc", "ud"} and row["tier"] == "silver"
        assert lynchpin_row_text(row, lambda x: x).startswith("(p ∧ q) or (r ∧ s) or u ⊢ c or d")
        assert [r[rank_key] for r in groups] == list(range(1, len(groups) + 1))
        consistency = [r for r in groups if r["conclusion"] == FALSE and ["u"] in r.get("premise_sets", [r["premises"]])]
        assert len(consistency) == 1 and set(map(tuple, consistency[0]["premise_sets"])) == expected_sets
        assert any(r["premises"] == ["e"] and "c" in r.get("conclusions", [r["conclusion"]]) for r in groups), "one-way or conjectured antecedent links do not merge questions"
    for group in La._ranked:
        assert len({(r["yes"], r["no"]) for r in group}) == 1
        summary = La._group_summary(group)
        assert {(tuple(r["premises"]), r["conclusion"]) for r in group} == {
            (tuple(S), c) for S in summary.get("premise_sets", [summary["premises"]])
            for c in summary.get("conclusions", [summary["conclusion"]])}, "all displayed premise/conclusion combinations are open members"
    rec_routes = [r for r in antecedents["recorded"] if any(c["id"] in ("pqc", "ud") for c in r["conjectures"])]
    assert {tuple(r["premises"]) for r in rec_routes} == {("p", "q"), ("u",)} and len({r["rank"] for r in rec_routes}) == 1
    assert all("premise_sets" not in r and "conclusions" not in r for r in rec_routes), "recorded claims keep their own premises and conclusion"
    assert La.rank(top=2)["rows"] == antecedents["rows"][:2], "equivalent antecedents consume one rank before the limit"
    # A premise equivalence requiring an extra background assumption is local to that background.
    local_antecedents = {"topic": {"background": []}, "principles": [P(x) for x in "bpquc"],
                        "results": [R("bpqu", ["b", "p", "q"], "u"), R("up", ["u"], "p"), R("uq", ["u"], "q")], "models": []}
    for background, expect_group in (([], False), (["b"], True)):
        ranked = Lynchpins(local_antecedents, background).rank(top=None)["rows"]
        assert any({("p", "q"), ("u",)} <= set(map(tuple, r.get("premise_sets", [r["premises"]])))
                   and r["conclusion"] == "c" for r in ranked) == expect_group
    # A settled question and one with more than two premises are listed without rank or scores.
    more = {**noted, "results": [*noted["results"], dict(R("pq2", ["p"], "q"), status="conjectured", notes="Long proved."),
                                  dict(R("prs", ["p", "r", "s"], "q"), status="conjectured", notes="Three premises."),
                                  dict(R("qrs", ["q", "r", "s"], "p"), status="conjectured", notes="Three premises, open.")],
            "models": [*noted["models"], dict(M("m5", ["q"], ["s"]), status="conjectured", notes="Two points.")]}
    Lm = Lynchpins(more)
    rec = {(tuple(r["premises"]), r["conclusion"]): r for r in Lm.rank(top=2)["recorded"]}
    assert rec[("p",), "q"]["status"] == "proved" and rec[("p",), "q"]["rank"] is None and rec[("p",), "q"]["yes"] is None
    # A result claims the entailment, a model denies it; the verdict reads relative to the claim.
    assert rec[("p",), "q"]["claim"] == "entails" and rec[("p",), "q"]["verdict"] == "proved"
    assert rec[("q",), "s"]["claim"] == "not" and rec[("q",), "s"]["status"] == "refuted" and rec[("q",), "s"]["verdict"] == "proved", "m1 refutes q ⊢ s, so the conjecture q ⊬ s holds"
    assert rec[("r", "s"), "p"]["claim"] == "not" and lynchpin_scores(rec[("r", "s"), "p"]) == (rec[("r", "s"), "p"]["no"], rec[("r", "s"), "p"]["yes"])
    assert rec[("r",), "p"]["claim"] == "entails" and lynchpin_scores(rec[("r",), "p"]) == (4, 2)
    again = {(tuple(r["premises"]), r["conclusion"]): r for r in Lm.rank(top=2)["recorded"]}
    assert [c["id"] for c in again[("r",), "p"]["conjectures"]] == ["rp"], "a second ranking attaches nothing twice"
    assert rec[("q", "r", "s"), "p"]["status"] == "outside" and rec[("q", "r", "s"), "p"]["tier"] == "bronze", "open, with three premises"
    assert rec[("p", "r", "s"), "q"]["status"] == "proved" and rec[("p", "r", "s"), "q"]["verdict"] == "proved" \
        and rec[("p", "r", "s"), "q"]["rank"] is None, "three premises, but p ⇒ q settles it"
    assert rec[("r",), "p"]["status" if "status" in rec[("r",), "p"] else "kind"] in ("open", "question") and rec[("r",), "p"]["yes"] == 4
    assert Lm.question_status(("p",), "s") == "refuted" and Lm.question_status(("p",), "q") == "proved" and Lm.question_status(("r",), "s") == "open"
    # A pair with a premise inconsistent by itself is never asked; a model conjectured to hold
    # both is refuted all the same, not left looking open, and an implication from such premises
    # holds only vacuously, so it is incompatible, not proved.
    clash = {**ly, "results": [*ly["results"], R("sx", ["s"], FALSE), dict(R("qsr", ["q", "s"], "r"), status="conjectured", notes="Vacuous.")],
             "models": [*ly["models"], dict(M("m6", ["q", "s"], []), status="conjectured", notes="Hoped consistent.")]}
    Lc = Lynchpins(clash)
    assert Lc.question_status(("q", "s"), FALSE) is None
    clashing = {r["conclusion"]: r for r in Lc.rank(top=None)["recorded"] if r["premises"] == ["q", "s"]}
    assert clashing[FALSE]["status"] == "inconsistent" and clashing[FALSE]["verdict"] == "refuted" and clashing[FALSE]["rank"] is None
    assert clashing["r"]["status"] == "inconsistent" and clashing["r"]["verdict"] == "incompatible" and clashing["r"]["rank"] is None
    # A sparse map is not ranked, but its recorded conjectures are still scored.
    sparse = Lynchpins(more).rank(top=5, score_all=False)
    assert sparse["rows"] == [] and all(r["rank"] is None for r in sparse["recorded"]) and rec_yes == 4 if (rec_yes := next(r["yes"] for r in sparse["recorded"] if r["premises"] == ["r"] and r["conclusion"] == "p")) else True
    assert Ln.question_of(["p", "q", "s"], "r") == (("p", "s"), "r"), "q is dropped as p gives it; the pair remains"
    assert Ln.question_of(["p", "r", "s"], "q") == (("p", "r", "s"), "q"), "three premises that give nothing of each other stay three"

    def brute_progress(L, shown=None):
        import itertools
        E, A = L.E, [a for a in L.reps if a not in L.trivial]
        bad = lambda S: E.conflict(S) is not None
        cl = lambda S: E.cl(S)[0]
        wit = [(E.holds[m["id"]], E.fails[m["id"]]) for m in L.witnesses]
        refuted = lambda S, c: any(set(S) <= H and (c == FALSE or c in F) for H, F in wit)
        settled = lambda S, c: (bad(S) if c == FALSE else (c in cl(S) or bad([*S, c]))) or refuted(S, c)
        qs = [((), c) for c in A]
        for a in A:
            qs.append(((a,), FALSE))
            if not bad([a]):
                qs += [((a,), c) for c in A if c != a and not bad([c])]
        for a, b in itertools.combinations([a for a in A if not bad([a])], 2):
            if b in cl([a]) or a in cl([b]):
                continue
            qs.append(((a, b), FALSE))
            if not bad([a, b]):
                qs += [((a, b), c) for c in A if c not in (a, b) and not bad([c]) and c not in cl([a]) and c not in cl([b])
                       and not bad([a, c]) and not bad([b, c])]
        if shown is not None:
            qs = [(S, c) for S, c in qs if set(S) <= shown and (c == FALSE or c in shown)]
        return len(qs), sum(settled(S, c) for S, c in qs)

    def same_share(L):
        p = L.progress()
        assert brute_progress(L) == (p["questions"], p["settled"]), (p, brute_progress(L))
        selection = L.progress(include_selection=True)["selection"]
        for shown in (set(L.ids), set(), set(L.ids[:1]), set(L.ids[::2]), set(L.ids) - {L.ids[-1]}):
            mask = sum(1 << i for i, pid in enumerate(selection["principles"]) if pid in shown)
            groups = [g for g in selection["groups"] if set(g[0]) <= shown]
            total = sum(L._count(int(g, 16) & mask) + (st is not None) for _, g, s, st, _cm in groups)
            done = sum(L._count(int(s, 16) & mask) + (st in ("proved", "refuted")) for _, g, s, st, _cm in groups)
            # The viewer counts the core questions the same way, from the core masks.
            ctotal = sum(L._count(int(cm, 16) & mask) + (st is not None) for S, g, s, st, cm in groups)
            cdone = sum(L._count(int(s, 16) & int(cm, 16) & mask) + (st in ("proved", "refuted")) for S, g, s, st, cm in groups)
            if shown == set(L.ids):
                assert (ctotal, cdone) == (p["core"]["questions"], p["core"]["settled"]), "core share from the selection"
            assert (total, done) == brute_progress(L, shown), (shown, total, done)
        return p
    # Settled share: 4 theorem questions, 16 with one premise, 13 with two (p ∧ q is redundant);
    # settled: (∅ ⇒ s) refuted by m1; p ⇒ q proved; p ⇒ s, q ⇒ s refuted; p and q consistent.
    pr = same_share(L)
    assert (pr["questions"], pr["settled"], pr["by_premises"]) == (33, 6, [[4, 1], [16, 5], [13, 0]]), pr
    assert same_share(Lynchpins(ly, background=["p"]))["questions"] == 7, "under p only r, s and r ∧ s remain"
    assert same_share(Lynchpins({**ly, "results": [], "models": []})) == {"premises": PROGRESS_PREMISES, "questions": 38, "settled": 0, "open": 38, "by_premises": [[4, 0], [16, 0], [18, 0]],
                                                                       "core": {"questions": 26, "settled": 0, "open": 26}}
    rich = {"topic": {"id": "t", "title": "t", "framework": "", "background": ["bg"]},
            "principles": [P(x) for x in "bg a b c d e f g".split()],
            "results": [R("r1", ["a"], "b"), R("r2", ["b"], "a"), R("r3", ["a", "c"], "d"), R("r6", ["e"], "c"), R("x", ["d", "e"], FALSE), R("g", ["g"], "e")],
            "models": [M("m1", ["a"], ["d"]), M("m2", ["b", "c"], ["e"]), M("m3", ["g"], [])]}
    Lr = Lynchpins(rich)
    for Lx in (Lr, Lynchpins(rich, background=["c"]), Lynchpins(rich, negative_background=["d"])):
        same_share(Lx)
    assert Lynchpins(rich, background=["d", "e"]).progress()["inconsistent_background"], "d ∧ e ⇒ ⊥"
    assert Lr.trivial == ["bg"] and Lr.reps[:2] == ["bg", "a"], (Lr.trivial, Lr.reps)
    agree(Lr)
    agree(Lynchpins(rich, background=["c"]))
    # Under a background, the entailed class collapses and models of other theories do not witness.
    ly["models"].append(M("m2", ["r"], []))
    Lb = Lynchpins(ly, background=["p"])
    assert Lb.trivial == ["p", "q"] and Lb.reps == ["p", "r", "s"] and Lb.witnesses == [ly["models"][0]], (Lb.trivial, Lb.reps)
    assert sorted(Lb.open_questions()) == [((), "r"), (("r",), FALSE), (("r",), "s"), (("r", "s"), FALSE), (("s",), FALSE), (("s",), "r")], Lb.open_questions()
    agree(Lb)
    print("selftest OK")


# ----------------------------------------------------------------------------

def main(argv=None):
    ap = argparse.ArgumentParser(prog="pmap", description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)
    for name in ("validate", "build", "status", "bundle", "lean", "lean-check", "lynchpins", "history"):
        s = sub.add_parser(name)
        s.add_argument("topics", nargs="*")
        if name == "history":
            s.add_argument("--ref", default=HISTORY_REF, help=f"the published branch (default {HISTORY_REF})")
            s.add_argument("--rebuild", action="store_true", help="recount every point, not only the new days")
        if name == "lynchpins":
            s.add_argument("--background", action="append", metavar="PRESET", help="a background preset id, or none; repeatable (default: none and every preset)")
            s.add_argument("--top", type=int, default=10, help="rows per list (default 10)")
            s.add_argument("--json", action="store_true", help="print the full rankings as JSON")
        if name == "status":
            s.add_argument("--model", help="print only this model's coverage report (argument format)")
        if name == "lean-check":
            s.add_argument("--update", action="store_true", help="persist stated/verified certificates after a successful audit")
        if name == "build":
            s.add_argument("--out", help="output HTML path (single topic only)")
            s.add_argument("--fragment", action="store_true", help="omit the <html>/<head>/<body> wrapper")
            s.add_argument("--no-starter", action="store_true", help="skip the reusable starter download")
    s = sub.add_parser("starter")
    s.add_argument("--out", help="output ZIP path (default: build/logical-maps-starter.zip)")
    s = sub.add_parser("new-topic"); s.add_argument("topic")
    s = sub.add_parser("new-principle"); s.add_argument("topic"); s.add_argument("id")
    for name in ("new-result", "new-model"):
        s = sub.add_parser(name); s.add_argument("topic"); s.add_argument("id")
        s.add_argument("--source", default="misc", help="Direct source id from topic.source_catalog (default: misc)")
    sub.add_parser("selftest")
    a = ap.parse_args(argv)

    if a.cmd == "selftest":
        return selftest()
    if a.cmd == "starter":
        from starter import build_starter
        print(f"wrote {build_starter(Path(a.out) if a.out else None)}")
        return
    if a.cmd == "new-topic":
        return new_topic(a.topic)
    if a.cmd == "new-principle":
        return new_principle(a.topic, a.id)
    if a.cmd == "new-result":
        return new_result(a.topic, a.id, a.source)
    if a.cmd == "new-model":
        return new_model(a.topic, a.id, a.source)

    topics = a.topics or list_topics()
    starter_archive = None
    if a.cmd == "build" and not a.no_starter and (ROOT / "starter").is_dir():
        from starter import build_starter
        starter_archive = build_starter()
    ok = True
    for t in topics:
        if a.cmd == "validate":
            ok &= validate_topic(t)
        elif a.cmd == "status":
            status(t, a.model)
        elif a.cmd == "lynchpins":
            lynchpins(t, a.background, a.top, a.json)
        elif a.cmd == "history":
            if load_topic(t)["topic"].get("draft"):
                continue
            print(f"wrote {update_history(t, a.ref, a.rebuild).relative_to(ROOT)}")
        elif a.cmd == "lean":
            path = generate_lean_statements(t)
            print(f"wrote {path.relative_to(ROOT)}" if path else f"{t}: no Lean library configured")
        elif a.cmd == "lean-check":
            ok &= lean_check(t, update=a.update)
        elif a.cmd == "bundle":
            z = bundle_topic(t)
            print(f"wrote {z.relative_to(ROOT)}")
        elif a.cmd == "build":
            out = build_topic(t, Path(a.out) if getattr(a, "out", None) else None, fragment=getattr(a, "fragment", False), starter_archive=starter_archive)
            print(f"built {out.relative_to(ROOT) if out.is_relative_to(ROOT) else out}")
    if not ok:
        sys.exit(1)
    if a.cmd == "build" and not a.out:
        landing = build_landing()
        if landing:
            print(f"built {landing.relative_to(ROOT)}")
        # Cloudflare Pages, which serves the website, refuses a deployment with any file over 25 MiB.
        for path in sorted(BUILD.rglob("*")):
            if path.is_file() and path.stat().st_size > 25 * 1024 * 1024:
                print(f"WARNING: {path.relative_to(ROOT)} is {path.stat().st_size / 2**20:.1f} MiB, over the website host's "
                      "25 MiB limit per file; the website will not deploy", file=sys.stderr)


if __name__ == "__main__":
    main()
