# Logical Maps

Principles, implications, and countermodels for a topic, with derived consequences and an interactive map. Topic-agnostic; seeded with preference axioms over lotteries.

ZACH'S WARNING: THE INNER WORKINGS ARE ALL VIBE-CODED. I DON'T KNOW WHAT HAPPENS IN HERE.

## Collection homepage

Normal builds also generate `build/index.html`, served by the website at
`/logical-maps/`. Write the introduction in [site/introduction.md](site/introduction.md).
It is initially blank on the page. Add future topic IDs to the `maps` list in
[site/config.yaml](site/config.yaml), then rebuild; only built maps are linked.
The config also sets the website and GitHub links. Listed maps receive header
links to the collection homepage, zacharygoodsell.com, and GitHub.

The website importer copies this whole `build/` directory, so the homepage and
starter download travel with the topic pages. Commit and push the exports here,
then redeploy the website. The reusable starter does not include this site's
personal introduction or configuration.

## Reusable starter

`python3 scripts/pmap.py starter` creates `build/logical-maps-starter.zip` from
the curated `starter/` assets and shared tooling. It contains a blank `my-map`
topic, a binary-relation example with executable checks, prebuilt previews,
README/AGENTS instructions, format and update guides, and an MIT licence for
the reusable starter. Research topics and their source documents are not copied
into this archive. See [starter/README.md](starter/README.md).

Normal builds regenerate the archive, copy it beside each topic, and append a
**Create your own logical map** download to Contribute. Publish the complete
topic directory so that relative download works; the central ZIP can also be
linked from a future generic Logical Maps home page. `build --no-starter`
skips regenerating that download when it is not needed.

New result/model scaffolds, schema defaults, and records with omitted status
default to `conjectured`. Existing explicitly proved records keep their status.
`python3 scripts/check_starter.py --python /path/to/clean/venv/bin/python`
tests the downloaded package, its previews and nested bundles, scaffold defaults,
and relative links with Pandoc and Lean absent. Install `requirements.txt` in
that environment first.

```
topics/<topic>/topic.yaml             title, background principle ids
topics/<topic>/background.md          Background tab (markdown)
topics/<topic>/contribute.md          optional Contribute tab message (markdown)
topics/<topic>/principles/<id>.yaml   one principle per file
topics/<topic>/results/<id>.yaml      implication: premises ⇒ conclusion
topics/<topic>/models/<id>.yaml       model: satisfies [...], violates [...]
topics/<topic>/papers.yaml           source-paper catalogue and external links
topics/<topic>/sources/              documents authorised for redistribution
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

Catalogue papers in `topics/<topic>/papers.yaml`. The Background tab’s Literature section
shows citations, external links, and the principles/results/models referencing
each paper. Record `references` distinguish origins, formulations, proofs,
background, and related work. They do not change arrow-source filters or proof
status. See [the data-format guide](starter/DATA_FORMAT.md#source-paper-catalogue).

Only place documents intended and authorised for redistribution in
`topics/<topic>/sources/`: the builder copies that entire folder into the
public site and downloads. External paper links are not downloaded or bundled.

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

`pmap lean-check` builds the library and audits wrapper proofs at the generated
statement types. Failed elaboration, `sorryAx`, and nonstandard axioms are rejected. The `lean` certificate field is `none`,
`stated` (statement elaborates, proof missing), or `verified` (machine-checked, sorry-free);
only `lean-check --update` may persist the last. See the topic's `lean/VERIFICATION.md` for current coverage. Build caches under `.lake/` are excluded from the
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
not enumerate Boolean combinations. The viewer can display a principle and its
negation as separate nodes without adding either to the source records.

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
filters recompute evidence-based verdicts from the surviving records. On the
graph, hidden sources still supply proved consequences of the background;
arrow visibility does not withdraw those automatic facts. Legacy author-type
`provenance` is still accepted in old datasets; records without a direct source
are displayed under Misc. until attributed. Lean fields remain optional.

Optional principle categories are declared in topic order as `principle_categories: [{id, name}, ...]`. Set each principle's `category` to one of these ids. The graph sidebar groups its checkboxes with select-all/unselect-all controls per category; these only control visibility. Topics without categories retain the flat list.

`require_sources: true` makes validation reject empty result/model sources. It is enabled for the unbounded-utility topic and new topics; the legacy example retains its existing records until its sources are audited.

Add `source_names` alongside `sources`, with one short label per reference in the same order (for example, `Symmetries of Value`). Pop-ups show these labels; write-ups retain the full references. Original AI work should use its actual author/model and date, never an invented attribution.

## Viewer

Graph: implications, ∧ nodes for multi-premise results, stronger principles higher. Theory explorer: principles use the same categories and ordering as Graph; mark them positive/negative to edit the shared background; models known to fit are listed, those whose status is unknown below. Clicking a model highlights its row and shows its verdicts beside each principle while preserving the model list and shared assumptions. Click a verdict’s evidence link for its sources and write-up. Click a model for its sources, write-up links, and any unknown assumptions. Derived verdicts list the supporting implications and show every direct source used. Unknown verdicts remain unknown. Conjectures: current and previously conjectured results and models, with answers computed from the selected evidence and background. Changes: every principle, result and model by date; "go to" opens the write-up, with links to its html/pdf/md and to the Lean source when present. Header downloads: **Content bundle (ZIP)** is a complete working copy with topic sources, summaries, viewer, and build tools; **Lean files**, when present, opens the formalisation files. Hover over a link for its contents.

The Conjectures tab shares the background controls. **Show resolved** is off
by default, hiding questions currently proved or refuted. Verdicts are computed
from proved evidence under the selected background and sources; they are not
stored record statuses. Source filters change which proofs and witnesses can
answer a question, not which questions exist. **Open** means no resolution in
all recorded proved evidence under that background. **Unresolved by selected
evidence** distinguishes a missing selected proof or witness from a genuinely
open question; its evidence disclosure shows the verdict and supporting records
available with all evidence. The tab count includes only open questions, so
hiding a source or enabling Lean-only does not inflate it. These comparisons
use the same background and never use conjectures as proofs. For a non-False conclusion,
incompatible premises are shown separately; an inconsistent background
suppresses verdicts. An implication is refuted only by an actual countermodel.
If omitted evidence shows the background is inconsistent, a warning prevents
the remaining questions from being presented as open with all evidence.
A matching model witnesses the background and the conjecture's required
`satisfies`/`violates` flags; it need not verify the particular construction
proposed in its description.

Optional `was_conjectured: true` on a result or model retains its question
history, whether its status is `conjectured` or `proved`. When changing a
conjecture to `proved`, set this flag, retain its stable ID and add the proof.
If the statement changes substantially, retain the original question and add
a separate proved record. A refuted proposal remains `status: conjectured`,
with the proved refuting evidence recorded separately. Never save a verdict
obtained only under a selected background as a global resolution.

Model info pop-ups show the model name, sources, and write-up links. Model
properties are displayed in Theory explorer; the pop-up and model page omit
the redundant conjunction of satisfied and violated principles.

Isolated principles are packed into compact rows just below the connected
graph. Showing or hiding them leaves the connected layout intact. If no
arrows are visible, the principles form a compact grid instead of one long row.

Graph **Arrow sources** and **Lean-verified only** control displayed proofs.
**Published papers** toggles the published sources together; **Show papers**
expands individual choices. Partial selection is shown on the group checkbox.
Background consequences always use all recorded proved results, including
hidden arrows. For example, DTU still supplies Simple Expected Utility in a
conjectures-only view, so conjecture arrows retain only their additional
premises. Transitive proofs retain the supporting background derivations.
Conjectures never supply automatic background facts or exclusions.

Graph **Conjectures only** hides proved arrows. **Unpublished only** restricts
arrows to sources classified as online submissions or miscellaneous sources,
including unpublished manuscripts. Select both to see unpublished conjectures.
These modes temporarily hide isolated principles and leave background
consequences and other tabs' evidence selections intact.

For the same conclusion, the graph suppresses an arrow whose displayed premise
set strictly contains another sufficient displayed premise set. Thus A ⇒ C
replaces the redundant A ∧ B ⇒ C in the current context. This also applies to
transitive conjunction arrows, while ordinary A ⇒ B ⇒ C and A ⇒ C arrows remain.
A conjecture cannot suppress a proved implication. The original records and
their write-ups remain available, and changing background or source filters
recomputes which arrows are redundant.

Results with the same displayed premises share one ∧ node, with one incoming
link per premise and separate outgoing consequences. This grouping is recomputed
after background simplification and equivalence grouping. Click a shared ∧ node
to list its consequences, then select one to inspect its evidence.

Proved arrows are solid: source colours identify recorded results, and neutral
arrows identify derived proofs. Dashed arrows are conjectural. Derived proofs
can use hidden intermediate principles, background facts, or combined premises;
they need not correspond to a simple path visible on the graph. Clicking an
arrow shows its supporting results. Links collecting premises into ∧ have no
arrowheads or flow chevrons, since an individual conjunct does not imply the whole.

Graph controls use **✓** to show a principle and **✗** to show its negation;
both can be displayed together. **Clear** hides both forms. **Background** moves
the principle into the shared assumptions, assuming it positively unless only
✗ was selected. In the background, ✓ and ✗ are exclusive. **Return** displays
the assumed sign on the graph again. Standing topic axioms remain fixed.

Theory explorer edits those same assumptions directly in one principle list.
There is no separate model-filter package or second background panel. Clicking
the selected ✓ or ✗ again removes that assumption. Solid buttons show explicit
assumptions; tinted buttons show consequences. Evidence links sit inline with
principle names, and the Potential models list retains unverified candidates. Contradictory assumptions show their evidence and suppress
inferred graph arrows and model matches. Unknown model properties remain unknown.

Positive assumptions are saved as `?assume=id,id`; negative assumptions use
`deny=id,id`. Both apply to Graph, Theory explorer and Conjectures. Reloading
restores them without changing source YAML, proofs, or downloads. **Clear background** removes all removable positive and negative assumptions.

Negative assumptions are forbidden facts in the Horn engine. A negative conclusion
is proved by adjoining its positive counterpart and deriving a conflict. Signed
graph connections retain the complete contextual premise conjunction: A ∧ B ⇒ C
allows A ∧ ¬C ⇒ ¬B. Source attribution and write-ups remain attached to the
original result; the graph identifies contraposed connections. Negative nodes
have a ¬ prefix and dashed outline. Derived signed arrows use the same proof
queries, without enumerating truth assignments.

Arrow endpoints meet node boundaries along the curve's tangent. Static chevrons
show direction even without highlighting. Highlighted connections have native
SVG chevron motion, capped at 48 moving chevrons, with no per-frame JavaScript.
Motion stops on pointer leave, tab changes, or a hidden document; reduced-motion
preferences retain static chevrons only.

The graph's principle list and background list scroll independently. Moved rows
reserve their space until the pointer or focus leaves the list, preventing the
next move control from jumping under the current click.

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
Basic decision theory has **Background DU** and **Background DTU**
buttons in both Graph and Theory explorer. They add the chosen package without removing
other assumptions; adding DU does not remove a separately selected Totality.
These defaults remain removable. An explicit
`?assume=...` selection overrides them; `?assume=` saves an empty background.
**Clear background** removes the removable assumptions, including DU.

Configure such packages with `background_presets` in `topic.yaml`: each has an
`id`, `name`, display `category`, `principles` list, and optional `default: true`.
These are viewer defaults and do not change the mathematical standing background.
The same packages abbreviate long conjunctions in result and model summaries:
for example, **DTU ∧ L¹ Continuity ⇒ Expected Utility**. The largest matching
package is preferred. Matching uses proved implications under the active source
filters and the fixed framework, so redundant premises such as Archimedean
Outcomes in a record already assuming Simple EU need not be repeated. The
selected background and conjectures never supply missing premises for an abbreviation. Result pop-ups offer
**Show full conjunction**, and result write-ups retain every exact premise.

Implications to **False (⊥)** appear as arrows to one special logical node.
A principle ruled out by the selected background has a red outline; its
popup gives the supporting results and sources. False does not appear in the
principle selection list. Model verdicts use the same incompatibility rules
and link their derived failures to the source proofs.

When the background derives False or a negatively assumed principle, the graph is replaced by a red warning
and its proof chain. All arrows return when the conflict is removed. This
uses all recorded proofs, including hidden arrows. Theory explorer verdicts
continue to use the selected evidence sources; validation checks all proved records.
Conjectures and absence of known models do
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

Run `node scripts/check_signed_ui.cjs` with jsdom available to check signed controls,
URL restoration, contextual contraposition against truth tables, and arrow geometry.
`python3 scripts/check_falsity.py` also checks negative backgrounds and agreement
between the Python and browser engines.
