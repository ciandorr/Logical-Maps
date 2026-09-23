# Instructions for agents creating a Logical Map

Read README.md and DATA_FORMAT.md first. Work in `topics/my-map/`, or create
a new topic when the user requests one. `topics/example/` is a tutorial;
`starter/` contains reusable templates, not the user's working content.

## Content and evidence

- Establish one precise framework: objects, primitive relations/functions,
  and standing conventions. Principles from a different setting need a different topic.
- Keep stable kebab-case IDs. A record's filename equals its ID; do not rename
  referenced IDs casually. A topic's directory name equals its ID.
- New results and models must start as `conjectured`. Leave conjectured result
  proofs empty and explain what would settle them in `notes`.
- Mark a result `proved` only when an actual proof supports exactly the recorded
  premises and conclusion. Write that proof in the record or its Markdown write-up.
- Mark a model `proved` only after checking the construction and every listed
  satisfied/violated principle. Missing properties remain unknown.
- Every result/model needs a nonempty `sources` list. Use a precise reference,
  or identify an original proof/construction and its author. `source_names`,
  when supplied, has one short label per source. Never invent citations.
- `certificate.source_id` identifies the direct source declared in topic.yaml;
  use `misc` for original connecting work. A paper used for definitions is not
  the direct source of a new agent-generated proof. Credit an existing
  published result to its mathematical source even when recording a later
  presentation or alternative proof; credit adaptations separately.
- Add verified bibliography entries to `papers.yaml`; connect records using
  `references` with `paper`, `role`, and optional `locator`/`note`. Distinguish
  origins and formulations from proofs; explain adaptations explicitly.
  Adding a reference never verifies a claim or changes its direct source.
- Credit the mathematical author in `produced_by` and transcription in
  `recorded_by`. Leave `checked_by: []` unless the user identifies an actual checker.
- Preserve existing published and human-authored mathematical content. Add a
  note or a new record when a correction would change a claim or proof.
- Never use a conjecture as proof evidence, or a missing arrow as non-implication.
- Record counterexamples as models. To express A ∧ B ⇒ ¬C, record premises
  `[a, b, c]` with `conclusion: false`. False is a logical constant, not a principle,
  premise, model flag, or selectable background assumption.
- Preserve resolved conjecture history with `was_conjectured: true`. Computed
  verdicts depend on background/evidence; do not save them as global resolutions.
- A conjecture with notes earns a bronze lynchpin star by itself. Never set
  `tier: silver` or `tier: gold` yourself; that is a human judgement.
- Named background presets are display packages. Preserve all theorem premises
  in YAML even when the viewer abbreviates them or supplies them from background.

## Editing and checks

- Run `python scripts/pmap.py validate <topic>` after every completed batch.
  Resolve validation failures before building. Validation does not verify prose proofs.
- Build with `python scripts/pmap.py build <topic>` and inspect the result.
- Run `python scripts/pmap.py selftest` after changing the tools or viewer.
  For logical-engine changes, also run `python scripts/check_falsity.py` with
  Node installed to check Python/browser agreement against truth tables.
- For changes to the tutorial data, run `python topics/example/checks/relations.py`.
- Edit source YAML, Markdown, or viewer files; do not hand-edit `build/`.
- Add checks for concrete models when practical. Never silently broaden a
  claim to make a test pass.
- Keep private material outside `topics/`: its `sources/` documents are copied
  into public builds and downloads. Add full papers only when redistribution
  is intended and authorised; otherwise use catalogue links. Preserve the
  user's existing data and files.

## Lean is optional

Do not introduce Lean as a prerequisite for using this starter. If the user
chooses formalisation, add a topic-local Lean project and `lean_lib` setting.
Use `lean_def` to connect principles to definitions, and declare the shape of a
statement under `lean:` in `topic.yaml` (binder and how a principle applies; see
the project README); the tooling assumes no framework. Generated Statements.lean
is rebuilt by `pmap lean`; do not edit it by hand. Never set `lean: verified`
manually: `pmap lean-check --update` must verify the exact generated statement
and reject `sorryAx` or unapproved axioms first.

## Updates and packaging

Follow UPDATING.md. Keep reusable code in scripts/, schema/, and viewer/ separate
from user content in topics/. The starter packager copies only curated starter
assets and tooling; do not replace its allowlist with a whole-repository archive.
