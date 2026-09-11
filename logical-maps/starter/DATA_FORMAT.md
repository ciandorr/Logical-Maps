# Data format

Each topic has one framework. All results and model assertions refer to that
framework. Files live under `topics/<topic>/`; filenames equal record IDs.
Use stable lowercase IDs separated by hyphens. The JSON schemas in `schema/`
list every supported field and are enforced by `pmap validate`.

## Topic

`topic.yaml` declares `id`, `title`, `framework`, and optional `description`,
`notation`, and `background`. `background` is a list of standing principle IDs;
leave it empty unless every theorem is meant relative to those axioms.
`require_sources: true` requires sources on results and models.

Declare direct sources in `source_catalog`, for example:

```yaml
source_catalog:
  - id: foundational-paper
    name: Short paper title
    kind: published-paper
  - id: misc
    name: Misc.
    kind: misc
```

The other source kind is `online-submission`. Categories can be declared as
`principle_categories: [{id: basic, name: Basic principles}]`; records use
`category: basic`. Optional `background_presets` have `id`, `name`, `category`,
and a nonempty list of `principles`. `default: true` selects a removable preset
on first opening the map. Presets never replace the original theorem premises.

## Source-paper catalogue

An optional `papers.yaml` contains the bibliography, independently of the
`source_catalog` used to filter direct proof evidence:

```yaml
papers:
  - id: paper-id
    title: Paper title
    citation: Full bibliographic citation
    url: https://example.org/paper
```

Replace these placeholders with verified references. `url` is optional and
must use HTTP(S); `note` can describe a version or availability. Use `papers: []`
for an empty catalogue. Missing catalogues are also supported.

Principles, results, and models can link to entries:

```yaml
references:
  - paper: paper-id
    role: formulation
    locator: Section 2, Definition 3
    note: Explain any difference from the paper's formulation.
```

Roles are `origin`, `formulation`, `proof`, `background`, and `related`.
Credit the original mathematical result in `certificate.source_id`; identify
any strengthening or alternative proof separately in the references and notes.
Use `proof` only where the cited argument establishes the recorded claim;
references to definitions or inspiration are not proof attributions. Original
connecting work retains `certificate.source_id: misc`. Existing `sources`
remain the record's detailed provenance and are still required where configured.
The Background tab’s Literature section links papers to their records; references also appear in
write-ups and the AI bundle. Adding a paper does not create an arrow filter.
Papers referenced by records appear under **Source literature**; uncited entries
appear under **Other relevant literature**. To choose the catalogue’s location,
put `<div id="paper-catalogue"></div>` below a Literature heading in
`background.md`; otherwise it is appended to the Background tab.

Catalogue URLs are external links, never downloads made by the build. Only
put full documents in `sources/` when they are intended and authorised for
redistribution: that folder is included in public builds and ZIPs. Keep
private reading copies outside `topics/` and public Git history.

## Principle

`principles/reflexive.yaml` in the worked example:

```yaml
id: reflexive
name: Reflexive
statement: Every object is related to itself.
category: relation-properties
sources: [Definition in the Logical Maps starter example.]
source_names: [Starter definitions]
```

Optional `aliases` help search. `formal`, `notes`, `tags`, and `date` supply
additional presentation information. Lean fields can be omitted.

## Result or conjecture

```yaml
id: proposed-implication
premises: [principle-a, principle-b]
conclusion: principle-c
status: conjectured
certificate:
  source_id: misc
  lean: none
  produced_by: "Name of the person or agent proposing this claim"
  checked_by: []
proof: ""
sources: ["Identify the proposal or original argument here."]
source_names: [Original proposal]
notes: State what would settle the conjecture.
```

This is A ∧ B ⇒ C. The sources above illustrate the format: replace placeholders
with real attribution. For a proved result, supply the actual proof and use
`status: proved`. For a longer proof, write `writeups/proposed-implication.md`.
An existing question that becomes proved should retain its ID and gain
`was_conjectured: true`. Keep refuted proposals conjectured and record the
refuting model separately.

To record A ∧ B ⇒ ¬C, use `premises: [principle-a, principle-b, principle-c]`
and `conclusion: false`. Do not create a principle called false or a duplicate
negative principle. The viewer supplies negative forms and contraposition.

## Model or countermodel

```yaml
id: proposed-construction
name: Family name: construction rule
description: Describe the construction and verification of its properties.
satisfies: [principle-a]
violates: [principle-b]
status: conjectured
certificate:
  source_id: misc
  lean: none
  produced_by: "Name of the proposer"
  checked_by: []
sources: ["Identify the proposed construction here."]
source_names: [Original proposal]
notes: State the outstanding verification.
```

A **proved** model satisfying A and violating B refutes A ⇒ B. A missing arrow
does not. List only checked properties before promoting a model to proved;
everything else stays unknown unless the engine derives it. For concrete
constructions, add executable checks under `checks/`.

## What the viewer derives

Only proved records support deductions. Implications use Horn closure over
conjoined positive premises; contradictions conclude False. Negative assumptions
forbid their positive facts, without treating absence as falsity. Inconsistency
does not generate arbitrary conclusions. Equivalent positive principles share
a node; conjunction arrows retain the whole premise package. Results with the
same displayed premise set share one ∧ node and separate outgoing consequences.
Click the shared node to inspect its consequences and their evidence.
Proved arrows are solid; neutral arrows are derived proofs, which may use hidden
intermediates or combined premises. Dashed arrows are conjectural. Incoming ∧
links collect premises and do not themselves assert implications.
When a displayed A ⇒ C already suffices, the graph hides the redundant
A ∧ B ⇒ C in that context. A conjecture never hides a proved implication.
The records remain available even when their graph arrows are redundant.

Graph source filters control drawn arrows while all proved background
consequences remain available. **Conjectures only** hides proved arrows;
**Unpublished only** includes `online-submission` and `misc` sources and excludes
`published-paper` sources. Both together show unpublished conjectures. These
modes temporarily hide isolated principles. Theory explorer and selected-evidence verdicts
use their selected sources. On Conjectures, **Open** means unresolved by all
recorded proved evidence under the current background. **Unresolved by selected
evidence** means omitted records supply a verdict or incompatible premises.
This describes the database, not the state of all mathematical knowledge.

## Prose, files, and Lean

`background.md` and `contribute.md` populate their tabs. Markdown supports links,
lists, and tables. Put longer result/model accounts in `writeups/<record-id>.md`.
Pandoc, when available, adds MathML rendering; without it the Python Markdown
fallback renders ordinary Markdown. Lean requires a separate optional topic-local
formalisation. The starter has no Lean project and needs none to build.

`sources/` holds documents intended for public distribution. The build copies
them and includes them in downloads. Generated HTML and ZIPs go in `build/`;
never use that directory as the only copy of your editable content.
