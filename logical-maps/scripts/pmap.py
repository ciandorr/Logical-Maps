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
    """

    def __init__(self, data: dict, background=(), negative_background=()):
        self.names = {FALSE: "False (⊥)", **{p["id"]: p["name"] for p in data["principles"]}}
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
        self._ranked = None
        self._universe()

    # -- closures as bitmasks over ids ∪ {False} ----------------------------
    def _mask(self, F):
        bit = self.bit
        return sum(bit[x] for x in F if x in bit)

    def _cl(self, S):
        return self._mask(self.E.cl(S)[0])

    def _ext(self, F, c):
        """Closure of the closed set F together with c: only a rule that c completes can add more."""
        bit = self.bit
        if c == FALSE:
            return F | bit[FALSE]
        if F & bit[c]:
            return F
        key = (F, c)
        if key not in self._ext_cache:
            if any(pm & ~(F | bit[c]) == 0 for pm in self.by_prem.get(c, ())):
                seed = [self.id_of[b] for b in self._bits(F)] + [c]
                self._ext_cache[key] = self._mask(closure(seed, self.E.rules, self.E.background)[0])
            else:
                self._ext_cache[key] = F | bit[c]
        return self._ext_cache[key]

    @staticmethod
    def _bits(m):
        while m:
            low = m & -m
            m ^= low
            yield low

    @staticmethod
    def _count(m):
        return bin(m).count("1")

    def _universe(self):
        """Enumerate the questions, their status, and the closures the scores need."""
        from itertools import combinations
        E, atoms = self.E, self.proper
        self.bit = bit = {x: 1 << i for i, x in enumerate([*self.ids, FALSE])}
        self.id_of = {b: x for x, b in bit.items()}
        self.BAD = BAD = bit[FALSE] | sum(bit[v] for v in self.negative if v in bit)
        self.ALL = ALL = sum(bit[a] for a in atoms)
        self._ext_cache = {}
        self.by_prem = {}
        for _, prem, _c in E.rules:
            pm = self._mask(prem)
            for x in prem:
                self.by_prem.setdefault(x, []).append(pm)
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
            self.openmask, self.openq, self.T = [], [], {}
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

    # -- status -------------------------------------------------------------
    def open_questions(self):
        """Every open question as (premise ids, conclusion id)."""
        out = [(self.sets[j][0], self.id_of[low]) for j, low in self.openq]
        out += [(S, FALSE) for (S, _, _), st in zip(self.sets, self.qfalse) if st == "open"]
        return out

    def progress(self) -> dict:
        """Share of the questions settled; see the class docstring."""
        by = [[0, 0], [0, 0], [0, 0]]
        for (S, _, _), g, s, st in zip(self.sets, self.qmask, self.settled, self.qfalse):
            by[len(S)][0] += self._count(g) + (st is not None)
            by[len(S)][1] += self._count(s) + (st in ("proved", "refuted"))
        questions, settled = sum(q for q, _ in by), sum(x for _, x in by)
        out = {"premises": PROGRESS_PREMISES, "questions": questions, "settled": settled, "open": questions - settled, "by_premises": by}
        if self.inconsistent:
            out["inconsistent_background"] = True
        return out

    # -- answers ------------------------------------------------------------
    def _subsets_of(self, H):
        """Indices of the premise sets a model holding H holds."""
        from itertools import combinations
        atoms = [self.id_of[low] for low in self._bits(H & self.ALL)]
        out = [0]
        out += [self.set_index[(a,)] for a in atoms if (a,) in self.set_index]
        out += [self.set_index[a, b] for a, b in combinations(atoms, 2) if (a, b) in self.set_index]
        out += [self.set_index[b, a] for a, b in combinations(atoms, 2) if (b, a) in self.set_index]
        return out

    def _total(self, newly, newfalse, skip):
        if skip is not None:
            j, c = skip
            if c == FALSE:
                newfalse.discard(j)
            elif j in newly:
                newly[j] &= ~self.bit[c]
        return sum(self._count(m & self.openmask[j]) for j, m in newly.items()) + sum(1 for j in newfalse if self.qfalse[j] == "open")

    def with_rule(self, premises, conclusion, skip=None) -> int:
        """Other open questions settled by adding the Horn rule premises ⇒ conclusion."""
        bit, BAD, c = self.bit, self.BAD, conclusion
        S = tuple(premises)
        newly, newfalse = {}, set()
        js = -1
        for x in S:
            js &= self.sets_with[x]
        js &= (1 << len(self.sets)) - 1
        for low in self._bits(js):
            j = low.bit_length() - 1
            X = self._ext(self.sets[j][2], c)
            if X & BAD:
                newly[j] = self.openmask[j]
                newfalse.add(j)
            else:
                newly[j] = self.openmask[j] & X
        if c == FALSE or c in self.toward_bad:
            ks = -1
            for x in S:
                ks &= self.tidx[x]
            ks &= (1 << len(self.openq)) - 1
            for low in self._bits(ks):
                j, cb = self.openq[low.bit_length() - 1]
                if newly.get(j, 0) & cb:
                    continue
                if self._ext(self.T[j, cb], c) & BAD:
                    newly[j] = newly.get(j, 0) | cb
        pmS = sum(bit[x] for x in S)
        for i, (H, Fm) in enumerate(self.wit):
            grew = pmS & ~H == 0
            H2 = self._ext(H, c) if grew else H
            if H2 & self.vmask[i]:
                continue  # no longer a model under the rule; impossible for an open question
            D = self.ALL & ~H & ~Fm
            for x in S:
                D &= self.trig[i][x]
            NF = 0
            for low in self._bits(D):
                if self._ext(self._ext(H, self.id_of[low]), c) & self.vmask[i]:
                    NF |= low
            if H2 != H:
                F2 = Fm | NF
                for j in self._subsets_of(H2):
                    newly[j] = newly.get(j, 0) | (self.openmask[j] & F2)
                    newfalse.add(j)
            elif NF:
                for j in self.base[i]:
                    newly[j] = newly.get(j, 0) | (self.openmask[j] & NF)
        return self._total(newly, newfalse, skip)

    def with_model(self, satisfies, violates, skip=None) -> int:
        """Other open questions settled by a model satisfying `satisfies` and violating `violates`."""
        V = self.BAD | self._mask(violates)
        H = self._cl(satisfies)
        if H & V:
            return 0  # not a model
        Fm = 0
        for low in self._bits(self.ALL & ~H):
            if self._ext(H, self.id_of[low]) & V:
                Fm |= low
        newly, newfalse = {}, set()
        for j in self._subsets_of(H):
            newly[j] = self.openmask[j] & Fm
            newfalse.add(j)
        return self._total(newly, newfalse, skip)

    # -- recorded conjectures ------------------------------------------------
    def question_of(self, ids, conclusion):
        """The question a record's premises and conclusion ask, or None if it is not one of ours."""
        rep_of = {x: cls[0] for cls in self.classes for x in cls}
        S = {rep_of[x] for x in ids if x in rep_of and rep_of[x] in self.proper}
        for x in sorted(S, key=self.proper.index):  # drop a premise the others already give
            if x in S and len(S) > 1 and x in self.E.cl(S - {x})[0]:
                S.discard(x)
        if len(S) > 2:
            return None
        c = FALSE if conclusion == FALSE else rep_of.get(conclusion)
        if c is None or c in S or (c != FALSE and c not in self.proper):
            return None
        return tuple(sorted(S, key=self.proper.index)), c

    def _attach_conjectures(self, rows):
        """A row whose question a conjectured record asks carries that record and its notes."""
        by_question = {(tuple(r["premises"]), r["conclusion"]): r for r in rows if r["kind"] == "question"}
        for rec in self.conjectures:
            if "premises" in rec:
                asked = [self.question_of(rec["premises"], rec["conclusion"])]
                kind = "result"
            else:
                asked = [self.question_of(rec["satisfies"], v) for v in [*rec["violates"], FALSE]]
                kind = "model"
            for q in asked:
                row = by_question.get(q)
                if row is not None:
                    row.setdefault("conjectures", []).append({"id": rec["id"], "kind": kind, "notes": (rec.get("notes") or "").strip(),
                                                               "tier": rec.get("tier")})
        # A question unresolved despite work is bronze by itself; a record may raise it to
        # silver or gold, a human judgement of importance and difficulty.
        for row in rows:
            tiers = [c["tier"] or "bronze" for c in row.get("conjectures", []) if c["notes"] or c["tier"]]
            if tiers:
                row["tier"] = max(tiers, key=LYNCHPIN_TIERS.index)

    # -- ranking ------------------------------------------------------------
    def rank(self, top: int = 50) -> dict:
        """Open questions and model checks, best first, each scored for both answers."""
        if self._ranked is None:
            rows = []
            for j, low in self.openq:
                S, c = self.sets[j][0], self.id_of[low]
                rows.append({"kind": "question", "premises": list(S), "conclusion": c,
                             "yes": self.with_rule(S, c, (j, c)), "no": self.with_model(S, [c], (j, c))})
            for j, st in enumerate(self.qfalse):
                if st == "open":
                    S = self.sets[j][0]
                    rows.append({"kind": "question", "premises": list(S), "conclusion": FALSE,
                                 "yes": self.with_rule(S, FALSE, (j, FALSE)), "no": self.with_model(S, [], (j, FALSE))})
            for i, m in enumerate(self.witnesses):
                H, Fm = self.wit[i]
                for low in self._bits(self.ALL & ~H & ~Fm):
                    p = self.id_of[low]
                    rows.append({"kind": "check", "model": m["id"], "principle": p,
                                 "yes": self.with_model([*m["satisfies"], p], m["violates"]),
                                 "no": self.with_model(m["satisfies"], [*m["violates"], p])})
            rows.sort(key=lambda r: (-max(r["yes"], r["no"]), -min(r["yes"], r["no"]), r["kind"], str(r.get("premises", r.get("model"))), str(r.get("conclusion", r.get("principle")))))
            self._attach_conjectures(rows)
            for i, r in enumerate(rows):
                r["rank"] = i + 1
            self._ranked = rows
        p = self.progress()
        rows = self._ranked[:top] + [r for r in self._ranked[top:] if r.get("conjectures")]
        return {"inconsistent_background": self.inconsistent, "classes": self.classes, "trivial": self.trivial,
                "fitting_models": [m["id"] for m in self.witnesses], "progress": p,
                "open": p["open"], "rows": rows}

LYNCHPIN_MAX_OPEN = 0.75  # bundles skip a map in which more of its implication questions than this are open
PROGRESS_PREMISES = 2  # the settled share counts implication questions with up to this many premises
_PROGRESS_CACHE: dict = {}


def _engines(data: dict) -> list:
    """(background id, name, Lynchpins) under the topic background and each preset, cached on the records."""
    key = json.dumps([data["topic"].get("id"), data["topic"].get("background", []), data["topic"].get("background_presets", []),
                      [p["id"] for p in data["principles"]],
                      [(r["id"], sorted(r["premises"]), r["conclusion"], r["status"]) for r in data["results"]],
                      [(m["id"], sorted(m["satisfies"]), sorted(m["violates"]), m["status"]) for m in data["models"]]],
                     sort_keys=True, default=str)
    if key not in _PROGRESS_CACHE:
        engines = [(None, None, Lynchpins(data))]
        engines += [(p["id"], p["name"], Lynchpins(data, p["principles"])) for p in data["topic"].get("background_presets", [])]
        _PROGRESS_CACHE.clear()
        _PROGRESS_CACHE[key] = engines
    return _PROGRESS_CACHE[key]


def _open_share(p: dict) -> float:
    return p["open"] / p["questions"] if p["questions"] else 0.0


def progress_report(data: dict) -> list[dict]:
    """The settled share under the topic background and under each preset; see Lynchpins.progress."""
    return [{"background": bid, "name": name, "principles": L.background, "negative": [], **L.progress()}
            for bid, name, L in _engines(data)]


def lynchpin_report(data: dict, *, sparse_ok: bool = True, top: int = 50) -> dict:
    """Rankings under the topic background alone and under each background preset.

    With sparse_ok false, a map in which most questions are still open is not ranked: there
    every answer settles many others only because almost nothing is recorded, and ranking it
    costs minutes for nothing.
    """
    engines = _engines(data)
    share = _open_share(engines[0][2].progress())
    if not sparse_ok and share > LYNCHPIN_MAX_OPEN:
        return {"skipped": f"{share:.0%} of the questions are open, so the map is too sparse for lynchpins to mean anything",
                "reports": []}
    return {"skipped": None, "reports": [{"background": bid, "name": name, "principles": L.background, "negative": [], **L.rank(top)}
                                         for bid, name, L in engines]}


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


def lynchpin_row_text(r: dict, nm) -> str:
    """S ⊢ c for a question, model: principle for a model check; a starred tier marks a recorded conjecture."""
    if r["kind"] == "check":
        return f"{r['model']}: {nm(r['principle'])}"
    star = f" ★ {r['tier']}" if r.get("tier") else ""
    return f"{' ∧ '.join(nm(x) for x in r['premises']) or 'True (⊤)'} ⊢ {nm(r['conclusion'])}{star}"


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
    o += ["rank, then what either answer settles (if yes / if no; ★ a recorded conjecture: bronze for notes, silver or gold by hand; listed at its rank even below the top):"]
    for r in [x for x in report["rows"] if x["rank"] <= top or x.get("conjectures")]:
        o.append(f"#{r['rank']:<6d}{r['yes']:5d} /{r['no']:4d}   {lynchpin_row_text(r, nm)}")
        o += [f"                    {rid}: {note}" for rid, note in lynchpin_notes(r)]
    return o


def lynchpin_md(lynch: dict, data: dict, topic_id: str, top: int = 5) -> list[str]:
    """Markdown section for OPEN-QUESTIONS.md."""
    names = {p["id"]: p["name"] for p in data["principles"]}
    names[FALSE] = "False (⊥)"
    if lynch["skipped"]:
        return [f"Not ranked: {lynch['skipped']}. Bundles rank a map once at most {LYNCHPIN_MAX_OPEN:.0%} of its "
                f"questions are open; `python3 scripts/pmap.py lynchpins {topic_id}` ranks it regardless.", ""]
    o = ["Answering a lynchpin conjecture settles many other open questions. A question is S ⊢ c, whether S "
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
        rows = [r for r in rep["rows"] if r["rank"] <= top or r.get("conjectures")]
        if rows:
            o += ["| # | Question | if yes | if no |", "|---:|---|---:|---:|"]
            o += [f"| {r['rank']} | {lynchpin_row_text(r, nm)} | {r['yes']} | {r['no']} |" for r in rows]
            o += [""]
            notes = [(r, rid, note) for r in rows for rid, note in lynchpin_notes(r)]
            if notes:
                o += ["★ A recorded conjecture asks this question, listed at its rank even below the top: bronze for notes, "
                      "silver or gold where a record ranks it by importance and difficulty. Its notes:", ""]
                o += [f"- {lynchpin_row_text(r, nm)} (`{rid}`): {note}" for r, rid, note in notes]
                o += [""]
        else:
            o += ["Nothing is open.", ""]
    return o


def lynchpins(topic_id: str, backgrounds=None, top: int = 10, as_json: bool = False):
    data = load_topic(topic_id)
    names = {FALSE: "False (⊥)", **{p["id"]: p["name"] for p in data["principles"]}}
    presets = {p["id"]: p for p in data["topic"].get("background_presets", [])}
    wanted = backgrounds or ["none", *presets]
    for key in wanted:
        if key != "none" and key not in presets:
            sys.exit(f"{topic_id}: no background preset '{key}' (have: {', '.join(presets) or 'none'})")
    engines = {bid or "none": (name, L) for bid, name, L in _engines(data)}
    reports = [{"background": None if key == "none" else key, "name": engines[key][0], "principles": engines[key][1].background,
                "negative": [], **engines[key][1].rank(top)} for key in wanted]
    if as_json:
        print(json.dumps(reports, indent=1, ensure_ascii=False))
        return
    print(f"== {data['topic']['title']} — lynchpin conjectures ==")
    for rep in reports:
        print("\n".join(lynchpin_text(rep, names, top)))


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
        "progress": progress_report(data),
        "lynchpins": lynchpin_report(data, sparse_ok=False, top=30),
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


def render_writeups(topic_id: str, data: dict, outdir: Path) -> dict:
    """Write build/<topic>/writeups/<id>.{md,html}; return {id: {md, html, handwritten}}."""
    from html import escape
    wdir = outdir / "writeups"
    wdir.mkdir(parents=True, exist_ok=True)
    src = TOPICS / topic_id / "writeups"
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


def build_topic(topic_id: str, out: Path | None = None, *, fragment: bool = False, starter_archive: Path | None = None) -> Path:
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
                 "model": {"binder": "", "principle": "{def}"}}


def lean_config(data: dict) -> dict:
    """How this topic writes a generated Lean statement.

    Declared under `lean:` in topic.yaml: `imports`, `namespace`, a `definition_check`
    template, and for results and models a `binder` and how a `principle` applies, with
    `{def}` standing for the principle's `lean_def`. Without a declaration, principles are
    plain propositions and a result reads A → B → C. Nothing here knows any framework.
    """
    lib = data["topic"].get("lean_lib")
    cfg = data["topic"].get("lean") or {}
    defs = [p["lean_def"] for p in data["principles"] if p.get("lean_def")]
    namespace = cfg.get("namespace") or (defs[0].rsplit(".", 1)[0] if defs else lib)
    return {"imports": list(cfg.get("imports") or [f"{lib}.Principles"]), "namespace": namespace,
            "definition_check": cfg.get("definition_check", LEAN_DEFAULTS["definition_check"]),
            "result": {**LEAN_DEFAULTS["result"], **cfg.get("result", {})},
            "model": {**LEAN_DEFAULTS["model"], **cfg.get("model", {})}}


def generate_lean_statements(topic_id: str) -> Path | None:
    """Write <lib>/Statements.lean: one generated Prop per statable record, in the topic's own shape."""
    data = load_topic(topic_id)
    loc = lean_lib_dir(topic_id, data)
    if loc is None:
        return None
    root, lib = loc
    cov, cfg = lean_coverage(data), lean_config(data)
    defs, names = cov["defs"], {FALSE: "False (⊥)", **{p["id"]: p["name"] for p in data["principles"]}}
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
            out += [pad + ("False" if item["conclusion"] == FALSE else fill(shape["principle"], item["conclusion"])), ""]
        else:
            lines = [f"{pad}{fill(shape['principle'], x)}" for x in item["satisfies"]] + \
                    [f"{pad}¬ {fill(shape['principle'], x)}" for x in item["violates"]]
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
    ns = lean_config(data)["namespace"]
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


def bundle_open_md(topic_id: str, data: dict, an: dict, lynch=None) -> str:
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

    o += ["## 2. Lynchpin conjectures", ""]
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
    for a in sorted(by_a, key=lambda x: names.get(x, x)):
        o += [f"- **{names.get(a,a)}** (`{a}`) ⇒ " + ", ".join(names.get(b, b) for b in sorted(by_a[a], key=lambda x: names.get(x, x)))]
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
          "the conjecture's `notes`; that alone earns it a bronze lynchpin star. Never set `tier: silver` "
          "or `tier: gold` yourself: that is a human ranking by importance and difficulty.",
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


def bundle_derived_json(data: dict, an: dict, lynch=None) -> dict:
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


def bundle_topic(topic_id: str) -> Path:
    """Write build/<topic>/<topic>-map.zip — a self-contained working copy."""
    import shutil, tempfile
    data = load_topic(topic_id)
    an = analyse(data)
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
            enriched_payload(topic_id, {"json": "data.json", "derived": "derived.json"}),
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

    def brute(L, rule=None, models=None, skip=None):
        results = L.results + ([{"id": "h", "premises": list(rule[0]), "conclusion": rule[1]}] if rule else [])
        E = Engine(L.ids, results, L.models if models is None else models, L.background, L.negative)
        wit = [(E.holds[m["id"]], E.fails[m["id"]]) for m in E.models if m["id"] not in E.model_conflicts]
        bad = lambda S: E.conflict(S) is not None
        cl = lambda S: E.cl(S)[0]
        refuted = lambda S, c: any(set(S) <= H and (c == FALSE or c in F) for H, F in wit)
        settled = lambda S, c: (bad(S) if c == FALSE else (c in cl(S) or bad([*S, c]))) or refuted(S, c)
        return sum(1 for q in L.open_questions() if q != skip and settled(*q))

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
    top = L.rank(top=3)["rows"]
    assert all(set(r) >= {"kind", "yes", "no"} for r in top) and top == sorted(top, key=lambda r: (-max(r["yes"], r["no"]), -min(r["yes"], r["no"]))), top
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
    short = Ln.rank(top=2)["rows"]
    assert [r["rank"] for r in short[:2]] == [1, 2] and all(r.get("conjectures") for r in short[2:]) and len(short) == 2 + 4, "rows a conjecture asks about are carried below the top, at their rank"
    assert Ln.question_of(["p", "q", "s"], "r") == (("p", "s"), "r"), "q is dropped as p gives it; the pair remains"
    assert Ln.question_of(["p", "r", "s"], "q") is None, "three premises that give nothing of each other ask no question here"

    def brute_progress(L):
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
        return len(qs), sum(settled(S, c) for S, c in qs)

    def same_share(L):
        p = L.progress()
        assert brute_progress(L) == (p["questions"], p["settled"]), (p, brute_progress(L))
        return p
    # Settled share: 4 theorem questions, 16 with one premise, 13 with two (p ∧ q is redundant);
    # settled: (∅ ⇒ s) refuted by m1; p ⇒ q proved; p ⇒ s, q ⇒ s refuted; p and q consistent.
    pr = same_share(L)
    assert (pr["questions"], pr["settled"], pr["by_premises"]) == (33, 6, [[4, 1], [16, 5], [13, 0]]), pr
    assert same_share(Lynchpins(ly, background=["p"]))["questions"] == 7, "under p only r, s and r ∧ s remain"
    assert same_share(Lynchpins({**ly, "results": [], "models": []})) == {"premises": PROGRESS_PREMISES, "questions": 38, "settled": 0, "open": 38, "by_premises": [[4, 0], [16, 0], [18, 0]]}
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
    for name in ("validate", "build", "status", "bundle", "lean", "lean-check", "lynchpins"):
        s = sub.add_parser(name)
        s.add_argument("topics", nargs="*")
        if name == "lynchpins":
            s.add_argument("--background", action="append", metavar="PRESET", help="a background preset id, or none; repeatable (default: none and every preset)")
            s.add_argument("--top", type=int, default=10, help="rows per list (default 10)")
            s.add_argument("--json", action="store_true", help="print the full rankings as JSON")
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
            status(t)
        elif a.cmd == "lynchpins":
            lynchpins(t, a.background, a.top, a.json)
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


if __name__ == "__main__":
    main()
