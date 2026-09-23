# Working in this repo

This is a database of principles and the logical connections between them, with
a build step that derives consequences and renders an interactive map. Read
README.md first.

## Private work

The outer checkout's `.private/` directory is a separate private repository,
ignored by the public repository and outside build inputs. Keep private drafts
and research-session notes there. Do not copy their contents into public files
or downloads without authorization to share them. Check the repository root
and remote before committing or pushing; never force-add `.private/` or turn it
into a public submodule. Public files remain public even during private work.

## Presentation preference

Keep interface copy concise and functional. Do not add unsolicited editorial
sentences, promotional descriptions, or commentary beneath headings and links.

Keep the collection maps' contribution protocol consistent with
`topics/unbounded-utility/contribute.md`, including supporting documents and
crediting contributors. Use `[Logical Maps] <topic title>` for topic-specific
email subjects and `[Logical Maps]` for general project suggestions; prefill
the topic subject in each map's email link.

## Commands

- `python3 scripts/pmap.py validate` — must pass before any commit.
- `python3 scripts/pmap.py build` — regenerates `build/<topic>/index.html`,
  `data.json`, write-ups, and downloadable topic files.
- `python3 scripts/pmap.py status` — counts, open pairs, redundancies.
- `python3 scripts/pmap.py lynchpins` — open questions ranked by how many other open
  questions each answer would settle, under no extra assumptions and under each
  background preset (`--background du`, `--top 20`, `--json`). A question is S ⊢ c
  for S at most two principle classes and c a class or False, asked only where no
  smaller premise set already proves or excludes c, and settled alike by a proof,
  an exclusion or a fitting model; a model check is scored the same way. A row that a
  recorded conjecture asks about carries that record and its notes (a bronze star; silver
  or gold when the record sets `tier`) and is kept at its rank even below the stored top.
  `Lynchpins`
  in `scripts/pmap.py` is the only implementation: `build` stores its rankings and
  settled share per background preset in `data.json` (also `derived.json` and the
  bundle's OPEN-QUESTIONS.md §2, which skip a sparse map with over three quarters of
  its questions open), and the viewer's Conjectures tab only looks them up, so an
  ad-hoc background shows none. `check_lynchpins_ui.cjs` guards the tab.
- `python3 scripts/pmap.py starter` — build the reusable starter ZIP. Normal
  builds also regenerate it and add a relative Contribute download. Keep its
  allowlist limited to shared tooling and `starter/` assets. Run
  `python3 scripts/check_starter.py` after changing packaging or scaffolding;
  `--python /path/to/venv/bin/python` tests a clean requirements-only environment.
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
- `NODE_PATH=<node_modules with jsdom> node scripts/check_<name>_ui.cjs` — DOM
  checks of the viewer. Run them all after touching `viewer/template.html`;
  `check_lattice_ui.cjs` guards the separate lattice view, and
  `check_categories_ui.cjs` the collapsible principle categories shared by the
  graph sidebar, the lattice sidebar and the theory explorer, and
  `check_model_verdicts_ui.cjs` the verdict grouping on a model's page.
  `check_hasse_layout_ui.cjs` and `check_relations_ui.cjs` guard the graph
  layout convention (⊥ is the floor, arrows ascend, ∧ below its premises) and
  the relation shading and comparison readouts. Keep those invariants.
- `python3 topics/decision-theory/checks/countermodels.py` — numerical sanity
  checks of the AI-produced countermodels for that topic.

## Certificate discipline (important)

When you (an AI) add or edit a result or model:

- Set `certificate.source_id` to the direct source in `topic.yaml`'s
  `source_catalog`. Each source has `id`, short `name`, and `kind`:
  `published-paper`, `online-submission`, or `misc`. Filters and badges name
  the source itself, rather than classifying human versus AI authorship.
- Credit the original mathematical result in `source_id`, even when the map
  transcribes a later presentation or retains an alternative proof. Identify
  any strengthening, changed assumptions, translation, or alternative proof
  separately in `references`, `produced_by`, and the notes. Do not label a
  published theorem as original agent work merely because an agent rebuilt
  its proof. A paper supplying only a principle’s definition is still not a
  source for every connecting result involving that principle.
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
  and say in `notes` what would settle it. A conjecture with notes earns a bronze
  lynchpin star by itself; only a human sets `tier: silver` or `tier: gold`, by
  importance and difficulty. Never set a tier yourself.
- New scaffolds and omitted statuses default to conjectured. Do not restore a
  proved default. Explicitly promote a record only after its proof or model
  verification is supplied.
- Preserve conjecture history with optional `was_conjectured: true` on results
  and models. When changing a conjecture to `proved`, set this flag, keep its
  stable ID and add the proof of the same statement. For a substantially
  changed statement, keep the original question and add a separate proved record.
  A refuted proposal stays `status: conjectured`; record its proved refuting
  evidence separately. Do not add a `refuted` proof status.
- Conjecture verdicts are computed from the selected background and proved
  sources, not persisted as global resolutions. Source filters restrict answer
  evidence, not the question inventory. For non-False conclusions, incompatible
  premises are reported separately; an inconsistent background suppresses verdicts.
  Refuting an implication requires an actual countermodel; matching a model's required flags
  proves existence, not necessarily its proposed construction. The viewer hides
  currently proved/refuted questions unless **Show resolved** is checked.
- Do not edit an existing paper/submission proof or a legacy human-authored
  proof to change its mathematical content — add a note or a new result instead.
- When you add content to an existing record after its certificate date (a
  newly verified property of a model, an added proof, a corrected statement),
  append an entry to its `changes` list: `date`, `by`, `summary`, and for models
  the newly verified `satisfies`/`violates` ids. The Changes tab lists each entry
  under its own date. Never move `certificate.date`; it is the record's origin.
- Independences are recorded as models (`models/<id>.yaml`), never as results.
  For a model, list every principle you have actually verified in `satisfies`
  and `violates` — the engine derives the rest and lists what is unknown. Add a
  numerical sanity check under the topic's `checks/` when the model is concrete.

## Editing data

- Catalogue source papers in `topics/<topic>/papers.yaml`, with citations and
  external URLs. Connect records with `references` entries (`paper`, `role`,
  optional `locator` and `note`). Roles are `origin`, `formulation`, `proof`,
  `background`, or `related`; explain adapted formulations. A reference does
  not change `certificate.source_id` or verify a result.
- Put documents in `topics/<topic>/sources/` only when they are intended for
  redistribution and permission or a suitable licence allows it. The build
  copies the entire folder into public outputs and downloads. Catalogue links
  are never fetched or packaged as PDFs. Keep private reading copies outside
  `topics/` and out of public Git history.
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
