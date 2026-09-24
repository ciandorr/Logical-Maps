# Answering mathematical questions from the map

Use the root routing guide and the selected topic's `AGENTS.md`. Commands here
run from `logical-maps/`. Read `CLAUDE.md` before editing; its attribution,
certificate, and preservation rules still apply.

## Mathematical work versus Lean work

Mathematical brainstorming is the default. Develop and scrutinize ordinary
proofs, counterexamples, constructions, and obstructions using the records and
write-ups. A request to prove, check, or verify a mathematical claim is not an
implicit request for Lean. Do not browse the Lean library, write `.lean` files,
install toolchains, run `lake`, or run `lean-check` just to make progress on a
mathematical question. Do not make formalization a prerequisite for answering
or recording a sound mathematical argument.

Start formalization or Lean audits only when explicitly requested or already
agreed as part of the task. Reading an existing certificate to report its status
does not require rerunning an audit. Keep mathematical certainty and machine
verification distinct; preserve the actual verification status. A routine export
build may mechanically regenerate statements, but that does not authorize a
separate Lean proof or audit task. Do not routinely end brainstorming by offering
to formalize it; finish the mathematical question the user asked.

## From the user's question to the records

1. **Identify the exact question.** Translate the user's wording into a
   statement, premise set, and target, or into properties a proposed model must
   satisfy and violate. Use conversation context and the topic's lookup table.
   Read `statement`, `formal`, `aliases`, and `notes` in the matching principles;
   names alone do not settle scope. Ask for clarification only if a remaining
   ambiguity changes the mathematics; otherwise state the reading you use.
2. **Fix the framework and assumptions.** Read `topic.yaml` and the relevant
   definitions in `background.md`. `background: []` does not remove the standing
   mathematical framework described in prose. Expand optional packages from
   `background_presets`; a viewer default is not an assumption in every question.
   Preserve restrictions on types, quantifiers, integrability, and signatures.
3. **Read the local evidence.** Find results and models mentioning the relevant
   IDs. Read `premises`/`conclusion`, `proof` or `description`, `notes`, `status`,
   certificates, and relevant `changes`. Open `writeups/<id>.md` if present: it
   can contain the full argument even when the YAML is brief. Follow
   `references` and `sources` into `papers.yaml` for exact attribution/locators;
   consult `extraction.md` when coverage or a transcription choice matters.
4. **Check derived evidence when needed.** No direct record does not mean no
   proof: compose the recorded implications and check model properties under
   closure. Use the recipe below instead of computing every pair or ranking
   every open question. Read the records returned in a proof chain before
   presenting it as an argument. Inspect a witness's construction and caveats,
   not just its flags.
5. **Then reason beyond the database.** If the records settle the question,
   explain why. If they do not, identify the precise gap and work on the user's
   argument or construction using the nearby results and obstructions. The map
   is a starting point, not a limit on reasoning. Clearly distinguish a new
   deduction, a tentative argument, and a recorded result. If a proposed
   argument conflicts with the map, examine definitions, premises, and proofs
   on both sides rather than treating the database as infallible.

In the answer, lead with the mathematical conclusion under explicit assumptions,
then give the proof or obstruction and links to the decisive records/write-ups.
Say what remains unproved when necessary. Avoid a repository tour.

## What the database establishes

- Only `status: proved` results and models supply evidence. `conjectured` records
  may have useful attempted proofs, necessary conditions, or historical answers;
  the status of their question must be checked against current proved evidence.
  An ID beginning `conjectured-` can now have `status: proved`.
- `P ⇒ c`, `P ⇒ ¬c`, and `P ⇏ c` are different. Exclusion means adjoining `c`
  derives False; non-implication requires a model satisfying **all** of `P` and
  failing `c`. To claim independence in both directions, check both directions.
- A model witnesses consistency only for properties it explicitly or derivably
  satisfies. An unlisted property is unknown until checked, not false. No known
  contradiction is not a consistency proof. Report inconsistent premises before
  discussing their consequences; the engine does not use explosion.
- The engine treats principles as propositional atoms and uses recorded Horn
  implications/incompatibilities. It does not discover new mathematics, perform
  type substitutions, or reason with arbitrary disjunctions. “Open” means
  unsettled by these records under these assumptions, not open in the literature.
- `status: proved`, source attribution, an independent check, and a Lean proof
  are separate claims. `lean: stated` is not verification; read the actual
  certificate and the topic's `lean/VERIFICATION.md` when verification matters.

## Small, current queries

First search source records, for example:

```sh
rg -n '^(id|name|aliases):|Barcan|rigid' topics/classicism/principles
rg -l -F 'rigid-comprehension-r' topics/classicism/{results,models,writeups}
rg -l -e 'copula' -e 'comonotonic' topics/unbounded-utility/{principles,models,writeups}
```

For closure or witnesses, adapt this read-only example. It loads current YAML;
no build, generated JSON, `analyse()`, or `Lynchpins` ranking is needed. Use the
project Python environment with `requirements.txt` installed.

```sh
python3 - <<'PYQUERY'
from scripts.pmap import Engine, load_topic

d = load_topic("unbounded-utility")  # or "classicism"
ids = {p["id"] for p in d["principles"]}
rules = [r for r in d["results"] if r["status"] == "proved"]
models = [m for m in d["models"] if m["status"] == "proved"]
E = Engine(sorted(ids), rules, models, d["topic"].get("background", []))
presets = {p["id"]: p["principles"]
           for p in d["topic"].get("background_presets", [])}
P = set(presets["du"])  # use set() for no optional assumptions; add IDs as needed
c = "simple-eu"
assert P <= ids and c in ids

conflict = E.conflict(P)
print("premise conflict:", conflict)
if conflict is None:
    print("entails (yes/no, result IDs):", E.entails(P, c))
    print("excludes (conflict proof or None):", E.excludes(P, c))
    print("countermodels (model IDs, evidence):", E.separates(P, c))
    print("consistency witnesses:", [m["id"] for m in models
          if m["id"] not in E.model_conflicts and P <= E.holds[m["id"]]])
PYQUERY
```

Keep optional assumptions in `P`. Adding them to `Engine.background` while
passing every model would grant them to models that have not verified them.
For a particular model, inspect `E.holds[id]`, `E.fails[id]`, and
`E.fail_why[id]`, after checking it is not in `E.model_conflicts`. For a proposed
model with positive flags `P` and negative flags `N`, check
`E.conflict(P, N)` and seek an existing model with `P <= E.holds[id]` and
`N <= E.fails[id]`; absence of either kind of evidence leaves the question open.

Use `E.package(P)` for a requested package overview. Reserve `status` and
`lynchpins` for requests about the whole map or research priorities, specifying
the topic and (for `lynchpins`) the desired `--background` and `--top`.
