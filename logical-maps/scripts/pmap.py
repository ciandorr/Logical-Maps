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
    return sch


def list_topics() -> list[str]:
    return sorted(p.name for p in TOPICS.iterdir() if (p / "topic.yaml").exists())


def load_topic(topic_id: str) -> dict:
    """Load a topic directory into a plain dict. Does not validate."""
    tdir = TOPICS / topic_id
    if not (tdir / "topic.yaml").exists():
        sys.exit(f"no such topic: {topic_id} (expected {tdir / 'topic.yaml'})")
    topic = _load_yaml(tdir / "topic.yaml")
    principles, results = [], []
    for p in sorted((tdir / "principles").glob("*.yaml")):
        d = _load_yaml(p)
        d["_file"] = str(p.relative_to(ROOT))
        principles.append(d)
    models = []
    for sub, lst in (("results", results), ("models", models)):
        for p in sorted((tdir / sub).glob("*.yaml")):
            d = _load_yaml(p)
            d["_file"] = str(p.relative_to(ROOT))
            if sub == "results" and d.get("conclusion") is False:
                d["conclusion"] = FALSE
            d.setdefault("status", "conjectured")
            d.setdefault("certificate", {}).setdefault("lean", "none")
            lst.append(d)
    papers = _load_yaml(tdir / "papers.yaml") if (tdir / "papers.yaml").exists() else {"papers": []}
    return {"topic": topic, "principles": principles, "results": results, "models": models, "paper_catalogue": papers, "papers": papers.get("papers", []) if isinstance(papers, dict) else []}


# ----------------------------------------------------------------------------
# Derivation engine (mirrored in viewer/template.html — keep the two in sync)
# ----------------------------------------------------------------------------
#
# Results are Horn clauses premises ⇒ principle-or-False, relative to background B.
# False is a terminal contradiction, never a principle or an explosion rule.
# P ⇒ ¬c when cl(P ∪ {c}) contains False, provided cl(P) does not.
# A model can additionally refute c when that trial reaches one of its explicit
# violations. Such model witnesses of P ⇏ c are distinct from P ⇒ ¬c.

def closure(seed, rules, background=()):
    facts = set(background) | set(seed)
    why = {f: None for f in facts}
    changed = True
    while changed:
        changed = False
        for rid, prem, concl in rules:
            if concl not in facts and prem <= facts:
                facts.add(concl)
                why[concl] = rid
                changed = True
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


class Engine:
    def __init__(self, ids, results, models, background=(), negative_background=()):
        self.ids = list(ids)
        self.background = tuple(background)
        self.negative_background = tuple(negative_background)
        self.rules = [(r["id"], frozenset(r["premises"]), r["conclusion"]) for r in results]
        self.rules_by_id = {r[0]: r for r in self.rules}
        self.models = list(models)
        self._cache = {}
        self.holds, self.fails, self.fail_why, self.model_conflicts = {}, {}, {}, {}
        for m in self.models:
            h, _ = self.cl(m["satisfies"])
            self.holds[m["id"]] = h - {FALSE}
            conflict = self.conflict(m["satisfies"], m["violates"])
            if conflict is not None:
                self.model_conflicts[m["id"]] = conflict
            f, fw = set(), {}
            if conflict is None:
                for c in self.ids:
                    hit = self.conflict([*m["satisfies"], c], m["violates"])
                    if hit is not None:
                        f.add(c)
                        fw[c] = [m["id"], *hit["via"]]
            self.fails[m["id"]], self.fail_why[m["id"]] = f, fw

    def cl(self, seed):
        key = frozenset(seed)
        if key not in self._cache:
            self._cache[key] = closure(key, self.rules, self.background)
        return self._cache[key]

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
        return self.conflict([*P, c])

    def separates(self, P, c):
        """Model witnesses P does not imply c; distinct from P implying not-c."""
        P = set(P)
        wits = [m["id"] for m in self.models if m["id"] not in self.model_conflicts
                and P <= self.holds[m["id"]] and c in self.fails[m["id"]]]
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
# Validation
# ----------------------------------------------------------------------------

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
    for item in data["principles"] + data["results"] + data["models"]:
        refs = item.get("references", [])
        for ref in refs if isinstance(refs, list) else []:
            if isinstance(ref, dict) and isinstance(ref.get("paper"), str) and ref["paper"] not in paper_ids:
                errors.append(f"{item['_file']}: unknown paper '{ref['paper']}'")

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

    for b in data["topic"].get("background", []):
        if b not in ids:
            errors.append(f"topic.yaml: background principle '{b}' does not exist")

    mschema = _schema("model")
    rids = set()
    for r in data["results"] + data["models"]:
        is_model = "satisfies" in r
        check(mschema if is_model else rschema, r, r["_file"])
        if data["topic"].get("require_sources") and not r.get("sources"):
            errors.append(f"{r['_file']}: a result or model must have at least one source")
        stem = Path(r["_file"]).stem
        if r.get("id") != stem:
            errors.append(f"{r['_file']}: id '{r.get('id')}' must equal file stem '{stem}'")
        if r.get("id") in rids:
            errors.append(f"{r['_file']}: duplicate id {r['id']}")
        rids.add(r.get("id"))
        refs = (r.get("satisfies", []) + r.get("violates", [])) if is_model else (list(r.get("premises", [])) + [r.get("conclusion")])
        for pid in refs:
            if pid not in ids and not (not is_model and pid == FALSE and r.get("conclusion") == FALSE and pid not in r.get("premises", [])):
                errors.append(f"{r['_file']}: unknown principle '{pid}'")
        if is_model and set(r.get("satisfies", [])) & set(r.get("violates", [])):
            errors.append(f"{r['_file']}: a principle is both satisfied and violated")
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

    if not errors:
        an = analyse(data)
        errors += [f"CONTRADICTION: {p}" for p in an["problems"]]
        warnings += an["infos"]

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

def export_json(topic_id: str) -> dict:
    data = load_topic(topic_id)
    an = analyse(data)
    clean = lambda d: {k: v for k, v in d.items() if not k.startswith("_")}
    return {
        "topic": data["topic"],
        "papers": data["papers"],
        "principles": [clean(p) | {"file": p["_file"]} for p in data["principles"]],
        "results": [clean(r) | {"file": r["_file"]} for r in data["results"]],
        "models": [clean(m) | {"file": m["_file"]} for m in data["models"]],
        "generated": _dt.datetime.now(_dt.timezone.utc).isoformat(timespec="seconds"),
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


def literature_md(data: dict) -> str:
    cited = {ref["paper"] for kind in ("principles", "results", "models")
             for item in data[kind] for ref in item.get("references", [])}
    lines = []
    for title, used in (("Source literature", True), ("Other relevant literature", False)):
        lines += [f"### {title}", ""]
        for p in data.get("papers", []):
            if (p["id"] in cited) != used:
                continue
            link = f" [Paper]({p['url']})" if p.get("url") else ""
            lines += [f"- {p['citation']}{link}" + (f" {p['note']}" if p.get("note") else "")]
        lines += [""]
    return "\n".join(lines)


def enriched_payload(topic_id: str, downloads: dict) -> dict:
    """export_json plus the topic's prose, so a downloaded data.json is self-explaining."""
    payload = export_json(topic_id)
    site = site_config()
    if topic_id in site.get("maps", []):
        payload["navigation"] = [
            {"label": site["title"], "url": site["url"]},
            {"label": site["home_label"], "url": site["home_url"]},
        ]
        if site.get("repository_url"):
            payload["repository_url"] = site["repository_url"]
    payload["downloads"] = downloads
    for name, key in (("background", "background"), ("contribute", "contribute"), ("extraction", "extraction")):
        path = TOPICS / topic_id / f"{name}.md"
        if path.exists():
            md = path.read_text(encoding="utf-8")
            if key == "background" and payload.get("papers"):
                if PAPER_CATALOGUE_SLOT not in md:
                    md += "\n\n## Literature\n\n" + PAPER_CATALOGUE_SLOT
                catalogue = literature_md(payload)
                payload[f"{key}_md"] = md.replace(PAPER_CATALOGUE_SLOT, catalogue)
                payload[f"{key}_html"] = _md_to_html(md.replace(PAPER_CATALOGUE_SLOT, "<!-- PMAP_LITERATURE -->")).replace("<!-- PMAP_LITERATURE -->",
                    '<section id="paper-catalogue">' + _md_to_html(catalogue) + '</section>')
            else:
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


def write_math_assets(outdir: Path) -> None:
    for name, content in math_assets().items():
        path = outdir / 'math' / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(content)


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
    return f"<style>{css}</style>\n<script>{js}</script>\n{math_head(math_path)}"


def site_config() -> dict:
    path = ROOT / "site" / "config.yaml"
    return yaml.safe_load(path.read_text(encoding="utf-8")) if path.exists() else {}


def build_landing() -> Path | None:
    """Build the optional map collection homepage alongside the topic exports."""
    from html import escape
    site = site_config()
    if not site:
        return None
    links = []
    for topic_id in site["maps"]:
        topic = load_topic(topic_id)["topic"]
        if not (BUILD / topic_id / "index.html").exists():
            continue
        links.append(f'<li><a class="map-link" href="{escape(topic_id)}/">'
                     f'<span class="map-name">{escape(topic["title"])}</span>'
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


def paper_references_md(item: dict, data: dict) -> str:
    papers = {p["id"]: p for p in data.get("papers", [])}
    lines = []
    for ref in item.get("references", []):
        p = papers[ref["paper"]]
        title = f"[{p['title']}]({p['url']})" if p.get("url") else p["title"]
        lines.append(f"- **{ref['role'].capitalize()}: {title}.** {p['citation']}"
                     + (f" — {ref['locator']}" if ref.get("locator") else "")
                     + (f". {ref['note']}" if ref.get("note") else ""))
    return "\n".join(lines)


def generate_writeup(item: dict, data: dict) -> str:
    """Markdown write-up generated from the YAML record."""
    names = {FALSE: "False (⊥)", **{p["id"]: p["name"] for p in data["principles"]}}
    stmts = {FALSE: "These premises cannot all hold together.", **{p["id"]: p["statement"] for p in data["principles"]}}
    c = item["certificate"]
    source = next((s['name'] for s in data['topic'].get('source_catalog', []) if s['id'] == c.get('source_id')), 'Misc.')
    cert = f"Source: {source}" + (f", Lean `{c['lean_ref']}`" if c.get("lean") == "verified" else "") \
        + (f"; produced by {c['produced_by']}" if c.get("produced_by") else "") \
        + (f"; recorded by {c['recorded_by']}" if c.get("recorded_by") else "") \
        + (f"; checked by {', '.join(c['checked_by'])}" if c.get("checked_by") else "")
    conj = item.get("status") == "conjectured"
    out = []
    if "satisfies" in item:
        title = item["name"]
        out += [f"# {title}", "", f"<p class='cert'>Model{' (conjectured)' if conj else ''} — {cert}.</p>", ""]
        out += ["## Package", ""]
        out += [_stmt_line(x, names, stmts) for x in item["satisfies"]]
        out += [f"- **¬ {names[x]}.** {stmts[x].strip()}" for x in item["violates"]]
        if item.get("description", "").strip():
            out += ["", "## Construction", "", item["description"].strip()]
    else:
        prem = " ∧ ".join(names[x] for x in item["premises"]) or "⊤"
        title = f"{prem} ⇒ {names[item['conclusion']]}"
        out += [f"# {title}", "", f"<p class='cert'>{'Conjecture' if conj else 'Result'} — {cert}.</p>", ""]
        out += ["## Premises", ""] + ([_stmt_line(x, names, stmts) for x in item["premises"]] or ["- ⊤"])
        out += ["", "## Conclusion", "", _stmt_line(item["conclusion"], names, stmts)]
        if item.get("proof", "").strip():
            out += ["", "## Proof", "", item["proof"].strip()]
    if item.get("notes", "").strip():
        out += ["", "## Notes", "", item["notes"].strip()]
    if item.get("changes"):
        out += ["", "## Revisions", ""] + _change_lines(item, names)
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


def render_writeups(topic_id: str, data: dict, outdir: Path, *, pdf: bool = True) -> dict:
    """Write build/<topic>/writeups/<id>.{md,html,pdf}; return {id: {md, html, pdf}}."""
    import shutil, subprocess
    wdir = outdir / "writeups"
    wdir.mkdir(parents=True, exist_ok=True)
    src = TOPICS / topic_id / "writeups"
    pandoc = shutil.which("pandoc")
    xelatex = shutil.which("xelatex")
    files = {}
    for item in data["results"] + data["models"]:
        iid = item["id"]
        hand = src / f"{iid}.md"
        md = hand.read_text(encoding="utf-8") if hand.exists() else generate_writeup(item, data)
        refs = paper_references_md(item, data)
        if refs:
            md = md.rstrip() + "\n\n## Paper references\n\n" + refs + "\n"
        title = md.splitlines()[0].lstrip("# ").strip() if md.startswith("#") else iid
        (wdir / f"{iid}.md").write_text(md, encoding="utf-8")
        body_md = wdir / f".{iid}.body.md"   # heading stripped; pandoc gets the title as metadata
        body_md.write_text(md.split("\n", 1)[1] if md.startswith("#") else md, encoding="utf-8")
        entry = {"md": f"writeups/{iid}.md", "handwritten": hand.exists()}
        html_path = wdir / f"{iid}.html"
        from html import escape
        body = _md_to_html(body_md.read_text(encoding='utf-8'))
        html_path.write_text(
            f'<!doctype html><html lang="en"><head><meta charset="utf-8">'
            f'<meta name="viewport" content="width=device-width, initial-scale=1">'
            f'<title>{escape(title)}</title>{theme_head(topic_id, math_path="../math")}</head>'
            f'<body class="writeup-page">{WRITEUP_NAV}'
            f'<header id="title-block-header"><h1>{escape(title)}</h1></header>{body}</body></html>', encoding="utf-8")
        entry["html"] = f"writeups/{iid}.html"
        if pdf and pandoc and xelatex:
            r = subprocess.run([pandoc, str(body_md), "-o", str(wdir / f"{iid}.pdf"), "--pdf-engine=xelatex",
                                f"--template={ROOT / 'viewer' / 'writeup.tex'}", "--metadata", f"title={title}",
                                "-V", "mainfont=DejaVu Sans"], capture_output=True, text=True)
            if r.returncode == 0:
                entry["pdf"] = f"writeups/{iid}.pdf"
            else:
                print(f"  pdf failed for {iid}: {r.stderr.strip().splitlines()[-1] if r.stderr.strip() else '?'}")
        body_md.unlink()
        files[iid] = entry
    return files


def render_lean_index(data: dict, source: Path, destination: Path) -> None:
    """Keep the Lean download usable on hosts that disable directory listings."""
    from html import escape
    from urllib.parse import quote
    definitions = sum(bool(p.get("lean_def")) for p in data["principles"])
    results = sum(r["certificate"].get("lean") == "verified" for r in data["results"])
    models = sum(m["certificate"].get("lean") == "verified" for m in data["models"])
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
            f'{models}/{len(data["models"])} model witnesses verified.</p>'
            '<p>Definitions and generated statements describe the claims. Only completed, '
            'audited proofs receive a Lean-verified certificate. The verification report '
            'records the remaining work and the formalisation assumptions.</p>'
            f'<ul>{links}</ul></body></html>')
    (destination / "index.html").write_text(html, encoding="utf-8")


def build_topic(topic_id: str, out: Path | None = None, *, fragment: bool = False, pdf: bool = True, starter_archive: Path | None = None) -> Path:
    """Build build/<topic>/ : index.html (viewer), data.json, source.zip, <topic>-map.zip, writeups/, sources/, lean/.
    With --out, write only the viewer HTML to that path (fragment=True omits the page skeleton)."""
    import shutil
    if not validate_topic(topic_id, quiet=True):
        validate_topic(topic_id)
        sys.exit(f"{topic_id}: fix validation errors before building")
    data = load_topic(topic_id)
    outdir = BUILD / topic_id
    outdir.mkdir(parents=True, exist_ok=True)
    write_math_assets(outdir)
    generate_lean_statements(topic_id)
    files = render_writeups(topic_id, data, outdir, pdf=pdf and out is None)
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
    payload = enriched_payload(topic_id, downloads)
    for item in payload["results"] + payload["models"]:
        item["files"] = files.get(item["id"], {})
    (outdir / "data.json").write_text(json.dumps(payload, indent=1, ensure_ascii=False), encoding="utf-8")
    bundle_topic(topic_id)
    html = TEMPLATE.read_text(encoding="utf-8").replace("<!--__PMAP_THEME__-->", theme_head(topic_id, math_path=None if out else 'math'))
    blob = json.dumps(payload, ensure_ascii=False).replace("</", "<\\/")
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
# generated from its premises and conclusion. A proof cannot silently drift from the
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


def generate_lean_statements(topic_id: str) -> Path | None:
    """Write <lib>/Statements.lean: one generated Prop per statable record."""
    data = load_topic(topic_id)
    loc = lean_lib_dir(topic_id, data)
    if loc is None:
        return None
    root, lib = loc
    cov = lean_coverage(data)
    defs, names = cov["defs"], {FALSE: "False (⊥)", **{p["id"]: p["name"] for p in data["principles"]}}
    ns = defs[next(iter(defs))].rsplit(".", 1)[0] if defs else lib

    out = [f"import {lib}.Principles", "",
           "/-!", "# Generated statements", "",
           "Written by `pmap lean " + topic_id + "` from the YAML records. **Do not edit.**",
           "",
           "Each declaration below is the statement of one database record, assembled from its",
           "premises and conclusion. A proof is supplied by inhabiting the corresponding `Prop`,",
           "so a Lean proof cannot drift from the claim the map displays. Regenerate after any",
           "change to a record or to a principle's `lean_def`.", "-/", "",
           f"namespace {ns}.Statements", f"open {ns}", ""]

    # Check definitions even when a principle is not yet used by an edge or model.
    for pid, definition in sorted(defs.items()):
        out += [f"/-- Principle definition check: `{pid}`. -/",
                "example {O : Type*} [MeasurableSpace O] [LinearOrder O] (P : Pref O) : Prop :=",
                f"  {definition} P", ""]

    for item in cov["ready"]:
        nm = _lean_name(item["id"])
        conj = item.get("status") == "conjectured"
        if "premises" in item:
            head = " ∧ ".join(names[x] for x in item["premises"]) or "⊤"
            out += [f"/-- `{item['id']}`" + ("  (conjectured)" if conj else ""), "",
                    f"{head} ⇒ {names[item['conclusion']]} -/",
                    f"def {nm} : Prop :=",
                    "  ∀ {O : Type*} [MeasurableSpace O] [LinearOrder O] (P : Pref O) [P.Regular],"]
            for x in item["premises"]:
                out.append(f"    {defs[x]} P →")
            conclusion = "False" if item["conclusion"] == FALSE else f"{defs[item['conclusion']]} P"
            out += [f"    {conclusion}", ""]
        else:
            out += [f"/-- `{item['id']}`" + ("  (conjectured)" if conj else ""), "",
                    f"{item['name']}: a witness satisfying {len(item['satisfies'])} principles",
                    f"and violating {len(item['violates'])}. -/",
                    f"def {nm} : Prop :=", "  ∃ W : Witness,"]
            lines = [f"    {defs[x]} W.pref" for x in item["satisfies"]] + \
                    [f"    ¬ {defs[x]} W.pref" for x in item["violates"]]
            out += [" ∧\n".join(lines), ""]

    out += [f"end {ns}.Statements", ""]
    path = root / lib / "Statements.lean"
    path.write_text("\n".join(out), encoding="utf-8")

    # keep the library root importing it
    rootfile = root / f"{lib}.lean"
    want = f"import {lib}.Statements"
    text = rootfile.read_text(encoding="utf-8") if rootfile.exists() else ""
    if want not in text:
        rootfile.write_text(text.rstrip() + "\n" + want + "\n", encoding="utf-8")
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
    records = data["results"] + data["models"]
    ready = {i["id"] for i in cov["ready"]}
    ns = cov["defs"][next(iter(cov["defs"]))].rsplit(".", 1)[0] if cov["defs"] else lib
    references = [i for i in records if i["certificate"].get("lean_ref")]
    probe = ["import " + lib, "namespace PmapAudit"]
    wrappers = {}
    for index, item in enumerate(references):
        wrapper = f"proof_{index}"
        wrappers[item["id"]] = f"PmapAudit.{wrapper}"
        probe += [f"theorem {wrapper} : {ns}.Statements.{_lean_name(item['id'])} := {item['certificate']['lean_ref']}",
                  f"#print axioms {wrapper}"]
    probe += ["end PmapAudit"]
    verdicts, bad = {}, []
    if references:
        with tempfile.NamedTemporaryFile(mode="w", suffix=".lean", prefix="_pmap_audit_", dir=root, delete=False) as f:
            f.write("\n".join(probe) + "\n")
            pf = Path(f.name)
        try:
            result = subprocess.run(["lake", "env", "lean", str(pf)], cwd=root, capture_output=True, text=True)
        finally:
            pf.unlink(missing_ok=True)
        output = result.stdout + result.stderr
        verdicts = lean_probe_verdicts(result.returncode, output, list(wrappers.values()))
        if result.returncode:
            print(output[-10000:])
        for item in references:
            if not verdicts.get(wrappers[item["id"]], False):
                bad.append(f"{item['id']}: proof failed its generated type or axiom audit")
            if item.get("status") == "conjectured":
                bad.append(f"{item['id']}: resolve conjecture status before certifying a proof")
    for item in records:
        state = item["certificate"].get("lean", "none")
        if state in ("stated", "verified") and item["id"] not in ready:
            bad.append(f"{item['id']}: claims {state} but has no generated statement")
        if state == "verified" and not verdicts.get(wrappers.get(item["id"]), False):
            bad.append(f"{item['id']}: claims verified but has no checked proof")
    print(f"  principle definitions: {len(cov['defs'])}/{len(data['principles'])}")
    print(f"  generated statements: {len(ready)}/{len(records)}")
    verified = {rid for rid, wrapper in wrappers.items() if verdicts.get(wrapper, False)}
    print(f"  verified proofs: {len(verified)}/{len(records)}")
    for item in records:
        rid = item["id"]
        print(f"  {rid:58} {'verified' if rid in verified else 'stated / proof pending' if rid in ready else 'definition missing'}")
    if update and not bad:
        for item in records:
            rid = item["id"]
            state = "verified" if rid in verified else "stated" if rid in ready else "none"
            kind = "results" if "premises" in item else "models"
            path = TOPICS / topic_id / kind / f"{rid}.yaml"
            text = path.read_text(encoding="utf-8")
            # Only certificate metadata changes; preserve mathematical prose and formatting.
            text, count = re.subn(r"(?m)^(  lean:) (?:none|stated|verified)\s*$", lambda m: m.group(1) + " " + state, text)
            if count != 1:
                raise ValueError(f"{path}: expected exactly one certificate lean field")
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


def _change_lines(item: dict, names: dict, indent: str = "") -> list[str]:
    """Markdown bullet per logged revision, newest first."""
    out = []
    for ch in sorted(item.get("changes") or [], key=lambda c: str(c.get("date", "")), reverse=True):
        bits = [" ".join(str(ch.get("summary", "")).split())]
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
    names = {FALSE: "False (⊥)", **{p["id"]: p["name"] for p in data["principles"]}}
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

    bgmd = (TOPICS / topic_id / "background.md")
    if bgmd.exists():
        body = bgmd.read_text(encoding="utf-8").strip().replace(PAPER_CATALOGUE_SLOT, literature_md(data))
        body = "\n".join(body.split("\n")[1:]).strip()          # drop its own H1
        body = _demote(body, 1)
        o += ["## 2. Background and standing conventions", "",
              "*Reproduced from `topics/%s/background.md`.*" % topic_id, "",
              _relink(body, topic_id), ""]

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
            if p.get("negates"):
                o += [f"Explicit negation of {label(p['negates'])}.", ""]
            if p.get("tags"):
                o += [f"Tags: {', '.join(p['tags'])}.", ""]
            if (p.get("notes") or "").strip():
                o += [f"Notes. {p['notes'].strip()}", ""]
            o += ["Sources:", ""] + _source_lines(p) + [""]
            o += [paper_references_md(p, data), ""]
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
        out += [paper_references_md(r, data), ""]
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
        o += ["### 4.2 Recorded conjectures", "",
              "These are displayed but never used as evidence in any derivation below.", ""]
        for r in conj_r:
            o += render_result(r)

    o += ["## 5. Models", "",
          "A model witnesses consistency, and so refutes every implication from what it satisfies "
          "to what it violates. Independence is never recorded directly; the model is the record.", ""]
    for m in data["models"]:
        o += [f"### {m['name']} — `{m['id']}`", ""]
        o += [("Conjectured model" if m["status"] != "proved" else "Model") + "; " + _cert_line(m, catalog), ""]
        o += ["Satisfies:", ""] + [f"- {label(x)}" for x in m["satisfies"]] + [""]
        o += ["Violates:", ""] + [f"- {label(x)}" for x in m["violates"]] + [""]
        unk = an["unknown"].get(m["id"], [])
        o += ["Unknown in this model: " + (", ".join(label(x) for x in unk) if unk else "nothing; every principle is settled.") , ""]
        if (m.get("description") or "").strip():
            o += ["Construction.", "", m["description"].strip(), ""]
        if m.get("checks"):
            o += ["Executable checks: " + ", ".join(f"`{c}`" for c in m["checks"]) + ".", ""]
        if (m.get("notes") or "").strip():
            o += [f"Notes. {m['notes'].strip()}", ""]
        if m.get("changes"):
            o += ["Revisions:", ""] + _change_lines(m, names) + [""]
        o += ["Sources:", ""] + _source_lines(m) + [""]
        o += [paper_references_md(m, data), ""]
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

    if data.get("papers") and (not bgmd.exists() or PAPER_CATALOGUE_SLOT not in bgmd.read_text(encoding="utf-8")):
        o += ["## Literature", "", literature_md(data), ""]

    o += ["## 8. Where this came from", "",
          f"The paper catalogue is `topics/{topic_id}/papers.yaml`; any included source documents are in `topics/{topic_id}/sources/`. "
          f"The extraction log, with transcription decisions and deliberately deferred items, "
          f"is `topics/{topic_id}/extraction.md`. Read it before trusting any single page reference.", ""]
    return "\n".join(o).rstrip() + "\n"


def bundle_open_md(topic_id: str, data: dict, an: dict) -> str:
    """OPEN-QUESTIONS.md — what is unsettled, and how to settle it."""
    topic = data["topic"]
    names = {FALSE: "False (⊥)", **{p["id"]: p["name"] for p in data["principles"]}}
    label = lambda i: f"{names.get(i, i)} (`{i}`)"
    E = an["engine"]
    conj = [item for item in [*data["results"], *data["models"]]
            if item["status"] == "conjectured" or item.get("was_conjectured", False)]
    resolutions = an["conjectures"]

    o = [f"# Open questions — {topic['title']}", "",
         "Recorded conjectures, their current answers, and remaining gaps where a new "
         "result or model would contribute to the map.", "",
         "**\"Open\" means not settled by the records in this bundle.** It does not mean unsolved "
         "in the literature, and it does not mean hard. Many entries below are routine and simply "
         "have not been added yet. Check the sources before assuming a question is new.", ""]

    o += ["## 1. Recorded conjectures and their answers", "",
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
            if "satisfies" in c:
                answer_name = {"proved": "Existence witnessed", "refuted": "Existence refuted"}.get(resolved["status"], answer_name)
            o += [f"#### {head} — `{c['id']}`", "",
                  f"**Answer: {answer_name}.**", ""]
            if "satisfies" in c and resolved["status"] == "proved":
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

    o += ["## 2. Open questions under each recorded package", "",
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

    o += ["## 3. Unknown verdicts inside each model", "",
          "For these principles the model has not been checked either way. Deciding one is a "
          "self-contained calculation in a construction that is already written down.", ""]
    for m in data["models"]:
        unk = an["unknown"].get(m["id"], [])
        o += [f"### {m['name']} — `{m['id']}`", ""]
        o += ([f"- {label(x)}" for x in unk] if unk else ["Fully determined; nothing unknown."]) + [""]

    op = sorted(an["open_pairs"])
    o += [f"## 4. Open single-premise pairs ({len(op)})", "",
          "*A ⇒ B ?* means neither implication nor incompatibility nor a countermodel is currently recorded. "
          "Grouped by antecedent. Most are open only because the obvious model has not been added.", ""]
    by_a = {}
    for a, b in op:
        by_a.setdefault(a, []).append(b)
    for a in sorted(by_a, key=lambda x: names.get(x, x)):
        o += [f"- **{names.get(a,a)}** (`{a}`) ⇒ " + ", ".join(names.get(b, b) for b in sorted(by_a[a], key=lambda x: names.get(x, x)))]
    o += [""]

    o += ["## 5. Deliberately deferred", "",
          f"`topics/{topic_id}/extraction.md` has a section listing claims that were **not** recorded "
          "because they need a further reading of the sources. Those are marked deferred rather than "
          "open: the answer is likely in the literature and needs transcribing, not discovering. "
          "Read that section before starting work.", ""]

    o += ["## 6. How to record an answer", "",
          "- Proved an implication? Add `topics/%s/results/<id>.yaml` with the full premise list and the proof." % topic_id,
          "- Refuted one? Add `topics/%s/models/<id>.yaml` listing what you verified in `satisfies` and `violates`." % topic_id,
          "- Settling an existing conjecture? For a proof of the same statement, keep its ID, "
          "set `was_conjectured: true`, and change its status to `proved`. If the statement changes "
          "substantially, retain the original and add a separate record. Refuted proposals stay "
          "`status: conjectured`, with proved refuting evidence recorded separately. Answers under "
          "extra exploration assumptions are contextual, not global record statuses.",
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
         f"  background.md               the framework in full",
         f"  extraction.md               source inventory, transcription decisions, deferred items",
         f"  principles/<id>.yaml        one principle per file",
         f"  results/<id>.yaml           premises ⇒ conclusion, with its proof",
         f"  models/<id>.yaml            satisfies [...] / violates [...]",
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
         *[f"python3 {p.relative_to(ROOT)}   # topic checks" for p in sorted((TOPICS / topic_id / "checks").glob("*.py"))],
         "python3 scripts/pmap.py build --no-pdf      # regenerate build/<topic>/index.html, the map viewer",
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
    return "\n".join([
        "# Instructions for AI agents working in this bundle", "",
        "Read `MAP.md` before answering anything about this subject. It is the whole database. "
        "`OPEN-QUESTIONS.md` lists what is unsettled. `README.md` has the semantics and the record "
        "formats. This file is the short version of the rules.", "",
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


def bundle_derived_json(data: dict, an: dict) -> dict:
    names = {FALSE: "False (⊥)", **{p["id"]: p["name"] for p in data["principles"]}}
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
                "status open means not recorded, not false. Regenerate with pmap.py; do not hand-edit.",
        "generated": _dt.datetime.now(_dt.timezone.utc).isoformat(timespec="seconds"),
        "principle_names": {k: v for k, v in names.items() if k != FALSE},
        "classes": an["classes"],
        "pairs": pairs,
        "counts": {s: sum(1 for p in pairs if p["status"] == s) for s in ("implies", "excludes", "independent", "inconsistent", "open")},
        "unknown_in_model": an["unknown"],
        "packages": packages,
        "problems": an["problems"],
        "infos": an["infos"],
    }


def bundle_topic(topic_id: str) -> Path:
    """Write build/<topic>/<topic>-map.zip — a self-contained working copy."""
    import shutil, tempfile
    data = load_topic(topic_id)
    an = analyse(data)
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
        (root / "OPEN-QUESTIONS.md").write_text(bundle_open_md(topic_id, data, an), encoding="utf-8")
        (root / "data.json").write_text(json.dumps(
            enriched_payload(topic_id, {"json": "data.json", "derived": "derived.json"}),
            indent=1, ensure_ascii=False), encoding="utf-8")
        (root / "derived.json").write_text(json.dumps(bundle_derived_json(data, an), indent=1, ensure_ascii=False), encoding="utf-8")
        (root / "Makefile").write_text(
            "PY ?= python3\n.PHONY: validate status build checks lean\n"
            "validate: ; $(PY) scripts/pmap.py validate\n"
            "status: ; $(PY) scripts/pmap.py status\n"
            "build: ; $(PY) scripts/pmap.py build --no-pdf\n"
            "checks: ; $(PY) scripts/pmap.py selftest\n"
            + "".join(f"\t$(PY) {p.relative_to(ROOT)}\n" for p in sorted((TOPICS / topic_id / "checks").glob("*.py"))) +
            f"lean: ; $(PY) scripts/pmap.py lean-check {topic_id}\n", encoding="utf-8")
        zip_tree(root, root.name, outdir / f"{topic_id}-map.zip")
    return outdir / f"{topic_id}-map.zip"


# ----------------------------------------------------------------------------
# Status
# ----------------------------------------------------------------------------

def status(topic_id: str):
    data = load_topic(topic_id)
    an = analyse(data)
    names = {FALSE: "False (⊥)", **{p["id"]: p["name"] for p in data["principles"]}}
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

def selftest():
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
    print("selftest OK")


# ----------------------------------------------------------------------------

def main(argv=None):
    ap = argparse.ArgumentParser(prog="pmap", description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)
    for name in ("validate", "build", "status", "bundle", "lean", "lean-check"):
        s = sub.add_parser(name)
        s.add_argument("topics", nargs="*")
        if name == "lean-check":
            s.add_argument("--update", action="store_true", help="persist stated/verified certificates after a successful audit")
        if name == "build":
            s.add_argument("--out", help="output HTML path (single topic only)")
            s.add_argument("--fragment", action="store_true", help="omit the <html>/<head>/<body> wrapper")
            s.add_argument("--no-pdf", action="store_true", help="skip PDF write-ups")
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
            status(t)
        elif a.cmd == "lean":
            path = generate_lean_statements(t)
            print(f"wrote {path.relative_to(ROOT)}" if path else f"{t}: no Lean library configured")
        elif a.cmd == "lean-check":
            ok &= lean_check(t, update=a.update)
        elif a.cmd == "bundle":
            z = bundle_topic(t)
            print(f"wrote {z.relative_to(ROOT)}")
        elif a.cmd == "build":
            out = build_topic(t, Path(a.out) if getattr(a, "out", None) else None, fragment=getattr(a, "fragment", False), pdf=not getattr(a, "no_pdf", False), starter_archive=starter_archive)
            print(f"built {out.relative_to(ROOT) if out.is_relative_to(ROOT) else out}")
    if not ok:
        sys.exit(1)
    if a.cmd == "build" and not a.out:
        landing = build_landing()
        if landing:
            print(f"built {landing.relative_to(ROOT)}")


if __name__ == "__main__":
    main()
