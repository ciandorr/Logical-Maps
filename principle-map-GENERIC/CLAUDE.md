# Working in this repo

This is a database of principles and the logical connections between them, with
a build step that derives consequences and renders an interactive map. Read
README.md first.

## Commands

- `python3 scripts/pmap.py validate` — must pass before any commit.
- `python3 scripts/pmap.py build` — regenerates `build/<topic>/index.html`,
  `data.json`, write-ups, and downloadable topic files.
- `python3 scripts/pmap.py status` — counts, open pairs, redundancies.
- `python3 scripts/pmap.py bundle` — writes `build/<topic>/<topic>-map.zip`, the
  self-contained working copy handed to a person or an AI (MAP.md, OPEN-QUESTIONS.md,
  README/AGENTS rules, data.json, derived.json, the YAML tree, and the tooling).
  `build` runs it too. Regenerate it after changing records, and never hand-edit
  its generated Markdown — the generators live in `scripts/pmap.py`.
- `python3 scripts/pmap.py lean` — regenerate `<lib>/Statements.lean` from the records.
  `build` runs it too. Never edit that file by hand.
- `python3 scripts/pmap.py lean-check` — build the topic's Lean library and audit every
  `lean:` claim. A record may say `lean: verified` only when this passes: the proof must
  inhabit the generated statement and must not depend on `sorryAx`. `lean: stated` means
  the statement elaborates and the proof is missing. Never set `verified` by hand.
- `python3 scripts/pmap.py selftest` — engine unit tests. Run after touching the
  derivation code in `scripts/pmap.py` **or** `viewer/template.html` — the two
  implementations must stay in sync.
- `python3 topics/decision-theory/checks/countermodels.py` — numerical sanity
  checks of the AI-produced countermodels for that topic.

## Certificate discipline (important)

When you (an AI) add or edit a result or model:

- Set `certificate.source_id` to the direct source in `topic.yaml`'s
  `source_catalog`. Each source has `id`, short `name`, and `kind`:
  `published-paper`, `online-submission`, or `misc`. Filters and badges name
  the source itself, rather than classifying human versus AI authorship.
- Use `source_id: misc` for one-off prompts, original connecting proofs, and
  user suggestions. Preserve the actual author/model, date, prompt or proof,
  and supporting citations in the record. A paper used for definitions is not
  the direct source of an original proof. Legacy `provenance` is accepted for
  old records, but new records should use `source_id`.
- `produced_by` credits the author of the mathematical content; `recorded_by`
  separately credits transcription or translation.
- Keep `checked_by: []` unless the user supplies an actual checker. A human
  literature source does not mean a human has checked the database translation.
- Every result and model must have a nonempty `sources` list. Give the paper,
  theorem/section and page, or an identifiable original proof for new work.
- Add `source_names` with one short label per `sources` entry in the same
  order, e.g. "Symmetries of Value" or "GPT-6 generated 8 Sep". Preserve full
  references in `sources`; never invent an author, date, or submission label.
- Write the actual proof or countermodel in `proof` / `description`, at the level
  of detail a referee would want. For anything longer than a paragraph, put a
  hand-written write-up in `topics/<topic>/writeups/<id>.md` (LaTeX math allowed);
  it replaces the generated one in the build.
- If you are not sure, record it as `status: conjectured` with an empty proof
  and say in `notes` what would settle it.
- Do not edit an existing paper/submission proof or a legacy human-authored
  proof to change its mathematical content — add a note or a new result instead.
- Independences are recorded as models (`models/<id>.yaml`), never as results.
  For a model, list every principle you have actually verified in `satisfies`
  and `violates` — the engine derives the rest and lists what is unknown. Add a
  numerical sanity check under the topic's `checks/` when the model is concrete.

## Editing data

- Keep each topic's original papers and other source documents in
  `topics/<topic>/sources/`. This is the standard layout for all projects.
  The build copies them to `build/<topic>/sources/` and includes them in
  `source.zip`. Add originals to the topic folder, not only to generated output.
  Keep a source inventory with short names and full references in the topic.
- File name = `id`. Kebab-case. Never rename an id that other files reference.
- Give models short, systematic names describing their construction or ordering
  rule: family first, then the rule and any distinguishing variant. For example,
  `Clipped expectation: eventual dominance` and
  `Clipped expectation: continuous ultrafilter dominance [−t, 2t]`.
  Keep authorship, conjecture status, and lists of satisfied/violated principles
  in their existing metadata fields, not in the model name. Match the write-up
  title to the model name. For conjectured extensions, name the proposed extension
  without inventing a construction that has not been supplied.
- Run `validate` after every batch of edits; a CONTRADICTION means the data is
  inconsistent and must be fixed before building.
- Keep the topic's framework fixed. A principle that needs a different setting
  belongs in a different topic.
- Record incompatibility as ordinary premises with `conclusion: false`.
  For A + B ⇒ ¬C, store premises [a, b, c] and conclude false. False is a
  logical constant, never a principle, premise, model assertion or background
  assumption. Do not introduce separate failure/negates nodes.
- Keep exclusions (P ⇒ ¬C) distinct from countermodels (P ⇏ C). The former
  need not establish a model of P. Unknown is neither true nor false.
- After engine changes, also run `python3 scripts/check_falsity.py` (needs
  Node) to compare Python and browser semantics against truth-table oracles.
- Optional display categories are declared in `topic.yaml` as ordered
  `principle_categories: [{id, name}, ...]`; assign each principle a `category`
  id. These group graph filters and do not change logical inference.
- Use `background_presets` for named viewer assumption packages, with `id`,
  `name`, `category`, `principles`, and optional `default: true`. Defaults are
  removable and overridden by explicit URL selections; do not promote them
  to fixed `background` assumptions or remove premises from recorded theorems.
- In unbounded utility, **DU excludes Totality; DTU = DU + Totality**. The DU
  preset uses Rich Outcomes, Archimedean Outcomes, Stochastic Equivalence,
  Stochastic Dominance and Mixture Independence. **Simple EU is derived, not
  assumed in the preset**: the recorded result
  `rich-archimedean-dominance-independence-imply-simple-eu` uses Rich Outcomes,
  Archimedean Outcomes, Stochastic Dominance and Mixture Independence; do not
  claim that Rich Outcomes and Archimedean Outcomes alone suffice. Restricted
  Totality follows from Simple EU; it is not Totality for arbitrary gambles.
  The source formulation with Simple EU instead of Archimedean Outcomes is
  equivalent under the other DU assumptions. Preserve each result's explicit
  premises, and call the package with Totality DTU in summaries and sources.
  Named conjunctions are display abbreviations, never principle IDs to insert
  into result premises or model assertions.
