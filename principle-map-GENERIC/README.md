# principle-map

Principles, implications, and countermodels for a topic, with derived consequences and an interactive map. Topic-agnostic; seeded with preference axioms over lotteries.

```
topics/<topic>/topic.yaml             title, background principle ids
topics/<topic>/background.md          Background tab (markdown)
topics/<topic>/contribute.md          optional Contribute tab message (markdown)
topics/<topic>/principles/<id>.yaml   one principle per file
topics/<topic>/results/<id>.yaml      implication: premises ⇒ conclusion
topics/<topic>/models/<id>.yaml       model: satisfies [...], violates [...]
topics/<topic>/sources/              original papers and other source documents
schema/                               JSON schemas
scripts/pmap.py                       validate · build · bundle · status · new-topic · new-principle · new-result · new-model · selftest
viewer/template.html                  the map; data embedded at build
topics/<topic>/writeups/<id>.md       optional hand-written write-up (LaTeX math ok); otherwise generated from the record
topics/<topic>/lean/                  Lean sources, copied into the build when present
build/<topic>/                        index.html (viewer), data.json, source.zip, <topic>-map.zip, writeups/<id>.{md,html,pdf}, sources/, lean/
```

```
pip install -r requirements.txt
python3 scripts/pmap.py validate && python3 scripts/pmap.py build    # or: make
```

`build/<topic>/` is a static site: open `index.html` locally or serve the directory. Write-ups are rendered with pandoc (HTML with MathML; PDF via xelatex when available, `--no-pdf` to skip); without pandoc the HTML falls back to python-markdown.

Each topic keeps its original reference material in `topics/<topic>/sources/`.
`new-topic` creates this folder automatically. The build copies it into the
preview's `sources/` folder and includes it in `source.zip`. Add and maintain
source documents in the topic folder so the preview can be rebuilt from it.

## The working bundle

`python3 scripts/pmap.py bundle <topic>` writes `build/<topic>/<topic>-map.zip`, a
single self-contained copy of one topic for handing to a person or an AI. `build`
produces it too, and the viewer offers it as the first download. Unpack it anywhere:

```
<topic>-map/
  MAP.md              every principle, proof, model construction and derived verdict, in one file
  OPEN-QUESTIONS.md   conjectures, open pairs, unknown model verdicts, and how to record an answer
  README.md           the semantics, the record formats, and the sourcing rules
  AGENTS.md CLAUDE.md the same rules in imperative form, picked up automatically by coding agents
  data.json           the records, with the background and extraction prose included
  derived.json        every ordered pair's verdict, the classes, and each package's closure
  topics/<topic>/     the editable YAML tree, write-ups, checks, and the source documents
  scripts/ schema/ viewer/ Makefile requirements.txt
```

`python3 scripts/pmap.py validate`, `status` and `build` all run inside the unpacked
bundle, so an editor can add a record and check it without the rest of this repo.
The topic folder is portable: copy `topics/<topic>/` back over this repo's copy.

## Lean

A topic may carry a formalisation in `topics/<topic>/lean/`, declared by `lean_lib` in
`topic.yaml`. The YAML stays the source of truth for statements: each principle names one
hand-written Lean definition in `lean_def`, and `pmap lean` assembles every result and
model statement from its premises and conclusion into a generated `Statements.lean`. A
proof is supplied by inhabiting the generated `Prop`, so it cannot drift from the recorded
claim.

`pmap lean-check` builds the library and asks Lean which claimed proofs really inhabit
their statement and whether they use `sorryAx`. The `lean` certificate field is `none`,
`stated` (statement elaborates, proof missing), or `verified` (machine-checked, sorry-free);
only `lean-check` may conclude the last. Build caches under `.lake/` are excluded from the
source zip and the bundle.

## Semantics

Relative to the topic background B. Results are Horn clauses; cl(S) is the closure of B ∪ S under them. A model M records sat(M) and viol(M) and witnesses consistency of sat(M) ∪ {¬v : v ∈ viol(M)}. Derived:

- holds(M) = cl(sat(M)); fails(M) = {c : cl(sat(M) ∪ {c}) ∩ viol(M) ≠ ∅}; the rest is unknown in M.
- P ⇒ c iff c ∈ cl(P). P ⇏ c iff some M has P ⊆ holds(M) and c ∈ fails(M). Otherwise open.
- Mutually derivable principles collapse to one graph node.
- holds(M) ∩ viol(M) ≠ ∅ is a validation error; a model subsumed by another, or a result derivable from the others, is a note.

Independences are never recorded directly; a model is the record.

The map is curated and need not contain every true implication. Add useful
connections incrementally. "Open" means not settled by the current records,
not necessarily unresolved in the literature. Tentative user suggestions may
be recorded as human-proposed conjectures, separately from verified literature
results, without attributing an unverified theorem to a cited paper.

## Certificates

`certificate.source_id` identifies the direct source of a result or model.
Declare each source in `topic.yaml` under `source_catalog` with `id`, short
`name`, and `kind` (`published-paper`, `online-submission`, or `misc`). The
viewer filters and colors records by their named sources. Use the reserved
`misc` source for one-off prompts, original proofs, and user suggestions;
keep the exact author/model, date, and supporting references in the write-up.
Citing a paper's definitions does not make it the source of a new proof.

`produced_by` credits the mathematical author and `recorded_by` credits the
transcription. `checked_by` records actual checks. Every result/model needs
nonempty `sources`, with optional parallel `source_names` for short labels.
`status: conjectured` is displayed but never used as proved evidence. Source
filters recompute deductions from the surviving records. Legacy author-type
`provenance` is still accepted in old datasets; records without a direct source
are displayed under Misc. until attributed. Lean fields remain optional.

Optional principle categories are declared in topic order as `principle_categories: [{id, name}, ...]`. Set each principle's `category` to one of these ids. The graph sidebar groups its checkboxes with select-all/unselect-all controls per category; these only control visibility. Topics without categories retain the flat list.

`require_sources: true` makes validation reject empty result/model sources. It is enabled for the unbounded-utility topic and new topics; the legacy example retains its existing records until its sources are audited.

Add `source_names` alongside `sources`, with one short label per reference in the same order (for example, `Symmetries of Value`). Pop-ups show these labels; write-ups retain the full references. Original AI work should use its actual author/model and date, never an invented attribution.

## Viewer

Graph: implications, ∧ nodes for multi-premise results, stronger principles higher. Models: principles use the same categories and ordering as Graph; mark them in/out to filter; models known to fit are listed, those whose status is unknown below. Clicking a model highlights its row and its satisfied/violated principles while preserving the model list and current filters. Click a verdict's source badge for its sources and write-up. Derived verdicts list the supporting implications and show every direct source used. Unknown verdicts remain unknown. Conjectures: recorded conjectures (results or models with `status: conjectured`). Changes: every principle, result and model by date; "go to" opens the write-up, with links to its html/pdf/md and to the Lean source when present. Sidebar: the AI bundle zip, data.json, and source.zip.

Use **↓** beside a principle to assume it in the background, and **↑** in the
fixed panel below to return it. Background assumptions leave the ordinary
checkbox list and graph. Their consequences are recomputed, and arrows omit
premises already supplied by the background; their write-ups retain the full
original statement and source. Highlighted nodes follow from the background.
Only models known to satisfy the assumptions can witness non-implication;
models with unknown assumptions remain in the Models tab's Unknown list.

The Models tab has the same **↓**, **↑**, and background reset controls, with
its Background panel above the model list. Both tabs share one background:
changes immediately update model eligibility, the graph, and the saved URL.
The Models panel can be enlarged using its bottom-right resize handle.
Clearing model filters leaves the shared background intact.

The two lists scroll separately. A moved row reserves its space until the
pointer or keyboard focus leaves the list, so another move button cannot jump
under the current click. Category select-all controls apply only to ordinary
principles. Background choices are saved in the URL (`?assume=id,id`) for
reloads and sharing; the source YAML and downloads remain the original topic.
Reset removes the added assumptions. Any background axioms declared in the
source topic are fixed, since its results already presuppose them.

Drag the divider beside the sidebar to change its width, or the divider above
Background to change the list's height. Sizes are remembered in this browser
across topics and constrained to the available window space. Focus a divider
and use arrow keys (Shift for larger steps), or Home/End for its limits.
Double-click or press Enter to restore its default size; Escape cancels a drag.

The unbounded-utility map opens with DU in the background: Rich Outcomes,
Totality, Stochastic Equivalence, Simple EU, Stochastic Dominance, and Mixture
Independence (the DTU package described in the source notes). Basic decision
theory has an **Add DU to background** button to add the package again without
removing other assumptions. These defaults remain removable. An explicit
`?assume=...` selection overrides them; `?assume=` saves an empty background.
Reset clears the removable assumptions, including DU.

Configure such packages with `background_presets` in `topic.yaml`: each has an
`id`, `name`, display `category`, `principles` list, and optional `default: true`.
These are viewer defaults and do not change the mathematical standing background.

When the background implies a principle and its explicitly recorded negation,
the graph is replaced by a red inconsistency warning with links to the conflict
and supporting results. Arrows return when the conflict is removed. This uses
proved results under the current source filters; conjectures and absence
of a known model do not establish inconsistency. Declare `negates: <id>` on
either of two principles to identify a logical negation pair. The validator
also checks fixed backgrounds and model assertions for these conflicts.

## Adding

```
python3 scripts/pmap.py new-principle decision-theory sure-thing
python3 scripts/pmap.py new-result decision-theory stp-from-independence --source misc
python3 scripts/pmap.py new-model decision-theory allais --source misc
python3 scripts/pmap.py new-topic modal-logic
```

For a model, list every principle you have actually checked, both ways; the engine fills in the rest and reports what remains unknown.
