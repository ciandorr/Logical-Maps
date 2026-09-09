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

Relative to the topic background B, each result is a conjunction of principle
premises implying either another principle or **False**. For example:

```yaml
id: incompatible-example
premises: [a, b, c, d]
conclusion: false
# Add the usual proof, status, certificate, and sources.
```

This says A ∧ B ∧ C ⇒ ¬D, equivalently that A, B, C and D cannot all hold.
It also lets A, B and D rule out C. False is a reserved logical constant,
never a principle, selectable assumption, or premise. YAML `false` and the
string `'false'` are accepted; exported JSON uses the string `"false"`.

The engine computes Horn closure `cl(S)` under the proved records. It does
not enumerate Boolean combinations or create a node for each negation.

- A package is known inconsistent when `False ∈ cl(P)`. Report that conflict
  and its proof; do not display consequences by explosion.
- For a consistent package, P ⇒ c when c ∈ cl(P), and **P ⇒ ¬c** when
  `False ∈ cl(P ∪ {c})`. The latter is an exclusion.
- A model M records `satisfies` and `violates`. Its known positive properties
  follow by closure. It also fails c when adjoining c derives either False
  or one of its explicitly violated principles.
- **P ⇏ c** requires an actual model satisfying P and failing c. It is
  distinct from P ⇒ ¬c, which alone need not establish any model of P.
- Everything else is unknown. Failing to find a model proves no inconsistency.
- Mutually derivable principles collapse to one graph node. Inconsistent
  antecedents are reported separately, rather than collapsing all principles.
- Deriving False or an explicitly violated property from a proved model is
  a validation error. Conjectures never supply proved evidence.

This deliberately supports positive-premise Horn rules and incompatibility
constraints. General disjunctions and arbitrary negative-premise formulas
are outside the current record format. The additional work for exclusions
is a closure query per candidate, not enumeration of all combinations.

Run `python3 scripts/pmap.py selftest` and `python3 scripts/check_falsity.py`
after engine changes. The latter needs Node and checks both engines against
small exhaustive truth tables, plus native Lean False generation. Optional
DOM regression checks are in `scripts/check_falsity_ui.cjs` (requires jsdom).

The map is curated and need not contain every true implication. Add useful
connections incrementally. "Open" means not settled by the current records,
not necessarily unresolved in the literature. Tentative user suggestions may
be recorded as human-proposed conjectures, separately from verified literature
results, without attributing an unverified theorem to a cited paper.

## Certificates

Model names describe the construction or ordering rule, using a consistent
family first and a variant only when needed: for example,
**Clipped expectation: eventual dominance** or
**Clipped expectation: continuous ultrafilter dominance [−t, 2t]**.
The three standard clipped-expectation models use bounds [−t, t]; explicit
bounds distinguish the other variants. Here “continuous” means the ultrafilter
comparison ignores infinitesimal errors. Model names and write-up titles match;
authorship, conjecture status, and satisfied/violated principles have their own
fields. A conjectured extension's name describes the proposed extension without
claiming an unknown construction. Display names can change; record IDs stay fixed.

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

Isolated principles are packed into compact rows just below the connected
graph. Showing or hiding them leaves the connected layout intact. If no
arrows are visible, the principles form a compact grid instead of one long row.

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
Archimedean Outcomes, Stochastic Equivalence, Stochastic Dominance, and Mixture
Independence. **DU does not assume Totality; DTU is DU plus Totality.**
Simple EU is a derived consequence, rather than a preset assumption:
Rich Outcomes, Archimedean Outcomes, Stochastic Dominance and Mixture
Independence [imply Simple EU](topics/unbounded-utility/writeups/rich-archimedean-dominance-independence-imply-simple-eu.md).
Simple EU supplies Restricted Totality (comparison of simple gambles), not
Totality for arbitrary gambles. The source's formulation with Simple EU in
place of Archimedean Outcomes is equivalent, since Simple EU also implies
Archimedean Outcomes.
Basic decision theory has **Add DU to background** and **Add DTU to background**
buttons in both Graph and Models. They add the chosen package without removing
other assumptions; adding DU does not remove a separately selected Totality.
These defaults remain removable. An explicit
`?assume=...` selection overrides them; `?assume=` saves an empty background.
Reset clears the removable assumptions, including DU.

Configure such packages with `background_presets` in `topic.yaml`: each has an
`id`, `name`, display `category`, `principles` list, and optional `default: true`.
These are viewer defaults and do not change the mathematical standing background.
The same packages abbreviate long conjunctions in result and model summaries:
for example, **DTU ∧ L¹ Continuity ⇒ Expected Utility**. The largest matching
package is preferred. Matching uses proved implications under the active source
filters and the fixed framework, so redundant premises such as Archimedean
Outcomes in a record already assuming Simple EU need not be repeated. The
selected background and conjectures never supply missing premises for an abbreviation. Pop-ups offer
**Show full conjunction**, and result write-ups retain every exact premise.

Implications to **False (⊥)** appear as arrows to one special logical node.
A principle ruled out by the selected background has a red outline; its
popup gives the supporting results and sources. False does not appear in the
principle selection list. Model verdicts use the same incompatibility rules
and link their derived failures to the source proofs.

When the background derives False, the graph is replaced by a red warning
and its proof chain. All arrows return when the conflict is removed. This
uses proved results under the current source filters. The same check applies
to Models filters and validation. Conjectures and absence of known models do
not establish inconsistency. Old `negates` nodes should be migrated to rules
concluding false, with model assertions moved to `violates` as appropriate.

## Adding

```
python3 scripts/pmap.py new-principle decision-theory sure-thing
python3 scripts/pmap.py new-result decision-theory stp-from-independence --source misc
python3 scripts/pmap.py new-model decision-theory allais --source misc
python3 scripts/pmap.py new-topic modal-logic
```

For a model, list every principle you have actually checked, both ways; the engine fills in the rest and reports what remains unknown.
