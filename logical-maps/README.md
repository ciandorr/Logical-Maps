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
topics/<topic>/background/<page>.md  Background tab, one page each, in topic.yaml's background_pages order
topics/<topic>/background.md          or a single-page Background tab (markdown)
topics/<topic>/contribute.md          optional Contribute tab message (markdown)
topics/<topic>/principles/<id>.yaml   one principle per file
topics/<topic>/results/<id>.yaml      implication: premises ⇒ conclusion
topics/<topic>/models/<id>.yaml       model: satisfies [...], violates [...]; or a definition and arguments
topics/<topic>/provenance/<id>.yaml   provenance moved verbatim out of model records, named by their arguments
topics/<topic>/groups/<id>.yaml       a model group: shared definition and shared arguments for models written as arguments
topics/<topic>/conditions.yaml        conditions a model may meet, which general arguments require
topics/<topic>/arguments/<id>.yaml    a general argument: any model record meeting its conditions gets it
topics/<topic>/papers.yaml           source-paper catalogue and external links
topics/<topic>/sources/              documents authorised for redistribution
schema/                               JSON schemas
scripts/pmap.py                       validate · build · bundle · status · lynchpins · new-topic · new-principle · new-result · new-model · selftest
viewer/template.html                  the map; data embedded at build
topics/<topic>/writeups/<id>.md       optional hand-written write-up (LaTeX math ok); otherwise generated from the record
topics/<topic>/lean/                  Lean sources, copied into the build when present
build/<topic>/                        index.html (viewer), data.json, source.zip, <topic>-map.zip, writeups/<id>.{md,html}, sources/, lean/, math/, favicon.png
```

```
pip install -r requirements.txt
python3 scripts/pmap.py validate && python3 scripts/pmap.py build    # or: make
```

`build/<topic>/` is a static site: open `index.html` locally or serve the directory. HTML maths uses locally bundled KaTeX, including when Pandoc is absent. Pandoc renders Markdown when available; otherwise the builder uses Python Markdown.

### Mathematical notation

Use `$...$` or `\(...\)` for inline maths and `$$...$$` or `\[...\]` for displayed
equations in principle statements, formal formulations, notes, proofs, model
descriptions and Markdown pages. For example:

```yaml
statement: |-
  Every $X$ with $P(u(X)=(-1)^{n+1}(n+1))=\frac{1}{n(n+1)}$,
  $n\ge 1$, is indifferent to sure utility $\ln 2$.
```

YAML block scalars (`|-`) or single-quoted strings preserve TeX backslashes.
Use braces for grouped indices and powers: `X_{n+1}`, `(-1)^{n+1}`.
KaTeX 0.18.7 supports standard mathematical LaTeX commands; see its
[supported notation](https://katex.org/docs/supported). Code blocks and inline
code remain literal. Graph labels retain their existing plain-text notation.
The same renderer handles details opened after selection and fetched write-ups.

### Cross-references

In a record's prose (proofs, notes, descriptions, definitions, arguments), `[[id]]`
links to the page of the result, principle, model, group or general argument with
that id, labelled by its statement or name; `[[id|text]]` labels it `text`. Each page
lists the records that refer to it under **Referenced by**. `validate` rejects an id
that names no record. Write-ups do not yet resolve the syntax.

The scripts, stylesheet, WOFF2 fonts and MIT licence live in
`viewer/vendor/katex/` and are copied into each export's `math/` directory.
Publish/copy the complete topic directory for offline use. Single-file `--out`
exports embed these assets. Maths inherits the current dark/colourblind theme.
Run `python3 scripts/check_math.py` and the UI checks after changing rendering or
mathematical notation; the check requires Node and the Python requirements.

Catalogue papers in `topics/<topic>/papers.yaml`. The Background tab’s Literature section
shows citations, external links, links to any copy in `sources/`, and the
principles/results/models referencing each paper. Record `references` distinguish origins, formulations, proofs,
background, and related work. They do not change arrow-source filters or proof
status. See [the data-format guide](starter/DATA_FORMAT.md#source-paper-catalogue).

Only place documents intended and authorised for redistribution in
`topics/<topic>/sources/`: the builder copies that entire folder into the
public site and downloads. External paper links are not downloaded or bundled.
A paper whose `file:` names such a copy is linked to it wherever it is cited.

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

The shape of a statement is the topic's own, declared under `lean:` in `topic.yaml`:
`imports`, `namespace`, a `definition_check` template, and for results and models a
`binder` and how a `principle` applies, with `{def}` standing for the principle's
`lean_def`. Unbounded utility quantifies over a preference order and a witness; another
topic may use plain propositions, a semantics, or whatever its library provides. Without a
declaration, principles are plain propositions and a result reads `A → B → C`. Nothing in
the tooling knows any particular framework, so topics formalise independently.

A model can also be formalised verdict by verdict, before its whole package is. Its record
gives `lean: {model, verdicts}`: a Lean term for the model, and a list of entries
`{holds: <principle>, ref: …}` or `{fails: <principle>, ref: …}`. Each verdict gets its own
generated statement, `Models.<model>.<principle>`, in `ModelStatements.lean`, from the
topic's `lean.verdict` templates (`holds`, `fails`, with `{model}` and `{def}`; `imports`;
and a `relative` conjunct for principles in `relative_categories`). Validation requires each
such verdict to be one the map already gives the model. The viewer counts the verified ones
on the model's badge and shows each on the argument that gives it. The record covers that model alone: a
group's generated variants do not inherit it.

General arguments are formalised the same way, so that a model's verdicts follow in Lean
along the route the map gives them:

- **A condition** gets `lean:`, a Lean predicate. A topic's condition is a predicate on
  models, applied by the topic's `lean.argument.condition` template. A group's condition is a
  predicate on what the group's `lean.binder` binds.
- **An argument** (in `arguments/` or a group's shared argument) gets `lean:`, a list of its
  verdicts `{holds|fails, ref}`. Each verdict's statement says that every model meeting the
  argument's conditions, and holding its `given` principles, has the verdict. For a topic's
  argument this comes from `lean.argument` in `topic.yaml`; for a group's it comes from the
  group's `lean` (`binder`, `var`, `model` and `is_model` with `{param}`, the `settings` the
  construction covers, and `meets` proofs every member shares).
- **A model** gives `lean.meets`, a proof for each condition it meets. A group member gives
  `lean.param` in place of `model`. `pmap lean` then writes `MapDerived.lean`, which certifies
  each verdict an argument gives the model, wherever the model proves the argument's
  conditions, by applying the argument's certificate. A verdict the record lists itself
  takes precedence.
- **Status:** `lean-check` audits the argument and derived certificates with the rest. The
  build marks them verified when they are in the index on the allowed axioms. The viewer
  marks an argument proved in Lean, and says which argument gives each derived verdict.

`pmap lean-check` builds the library and audits wrapper proofs at the generated
statement types. Failed elaboration, `sorryAx`, and nonstandard axioms are rejected. The `lean` certificate field is `none`,
`stated` (statement elaborates, proof missing), or `verified` (machine-checked, sorry-free);
only `lean-check --update` may persist the last (for a model's single verdicts, their
`status`, `stated` or `verified`). See the topic's `lean/VERIFICATION.md` for current coverage. Build caches under `.lake/` are excluded from the
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
- Mutually derivable principles collapse to one graph node. Principles
  inconsistent with the background share the False box; background consequences
  share the True box, and so do the reader's own assumptions, so a decision to
  background a principle stays visible where its consequences are. A negative
  assumption puts its principle in the False box. The topic's fixed background
  stays off the graph. These display classes do not change evidence readouts.
- A principle the topic's own background already settles, one that follows from
  it or is excluded by it with no further assumption, starts hidden, since it can
  only ever sit beside True or False. The sidebar still offers it.
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

## Theorem trawl

The [theorem-trawl worker](trawl/README.md) fetches a Git snapshot, visits open
questions in centrality order, and gives discovery an editable copy of the YAML
database in a separate quarantine repository. It saves edits and notes throughout
the search, resumes after budget stops, and freezes file diffs for independent
review. Discovery, review and admission have separate evidence records. API providers and models are configurable; live calls
are disabled by default. Run `python3 scripts/check_trawl.py` for offline tests.

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
transcription. An AI credited anywhere is named together with the person who
prompted it, `Claude Opus 5.5 (Anthropic), prompted by Cian Dorr`, whether or not
that person contributed to the content; a person credited in the same entry for the
mathematics or the construction is taken to be the prompter unless another is named. `checked_by` records actual checks. Every result/model needs
nonempty `sources`, with optional parallel `source_names` for short labels.
`status: conjectured` is displayed but never used as proved evidence. Source
filters recompute evidence-based verdicts from the surviving records. On the
graph, hidden sources still supply proved consequences of the background;
arrow visibility does not withdraw those automatic facts. Legacy author-type
`provenance` is still accepted in old datasets; records without a direct source
are displayed under Misc. until attributed. Lean fields remain optional.

An optional `certificate.trawl` preserves structured discovery, evidence, reviewer,
and admission history for accepted trawl contributions. It does not change the
meaning of `source_id`, proof status, or Lean verification. See the
[trawl provenance workflow](trawl/README.md#evidence-storage). A model written as
arguments keeps it in `provenance/<admission id>.yaml` instead, one file per
admission: what the admitted records share (checkpoint, source, reviews, admission)
under `trawl`, and each record's own `discovery` and `evidence` under `records`.
The arguments the admission supplied name the file in `provenance`.

Optional principle categories are declared in topic order as `principle_categories: [{id, name}, ...]`. Set each principle's `category` to one of these ids. The graph sidebar groups its checkboxes with one show-or-hide control per category; these only control visibility. Topics without categories retain the flat list.

A category with `hidden_by_default: true` starts hidden in the graph and conjecture lists. The usual show/hide controls can reveal it. Classicism uses this for signature schemata (Σ).

Each category is collapsible in the three lists that show them: the graph sidebar, the lattice sidebar and the theory explorer. One set of open categories serves all three, so a category opened in one is open in the others. A category's summary carries its name, its count and, on the graph and the lattice, one control that acts on the whole category: **hide** while any of it is showing, **show positive** while none of it is. A closed category can therefore still be shown or hidden without opening it, and still reports how much of it is in play: how many of its principles are shown on the graph, how many are chosen on the lattice, and how many are assumed in the explorer. Categories start closed when a topic declares more than one and has more than `CATEGORY_COLLAPSE_MIN` (16) principles, and open otherwise; searching for a principle opens the category it is in.

`require_sources: true` makes validation reject empty result/model sources. It is enabled for the unbounded-utility topic and new topics; the legacy example retains its existing records until its sources are audited.

Add `source_names` alongside `sources`, with one short label per reference in the same order (for example, `Symmetries of Value`). Pop-ups show these labels; write-ups retain the full references. Original AI work should use its actual author/model and date, never an invented attribution.

## Model records written as arguments

A model record may give a definition and arguments in place of `description`,
`satisfies`, `violates` and `status`:

```yaml
definition: >-                      # what the model is: construction, evaluation point,
  …                                 # interpretation of Σ; no verdicts
arguments:
- holds: [atomicity-r]              # and/or fails: [...]
  text: …                           # and/or source: {paper, locator}, writeup: <id>,
                                    # like: <record>#<argument id> with adapt: …
- id: sigma-top                     # optional; addresses the argument as <record>#<id>
  fails: [witnessed-possibility-r]
  text: …
  by: …                             # by and date default to the certificate
  date: '2026-09-22'
  revisions: [{date: '…', by: …, note: …}]   # corrections that leave the verdicts alone
- holds: [transversal-r]
  text: …
  standing: conjectured             # optional tier; withdrawn: {date, by, reason}
notes: …                            # text that supports no verdict
history: [...]                      # the old changes log, frozen when the record was migrated
construction: {standing: conjectured, text: …}   # optional doubt about the model itself
```

`load_topic` flattens such a record into what the engine reads. The holds and fails
of the established, unwithdrawn arguments, in the order of the arguments, are its
`satisfies` and `violates`. Conjectured arguments add a conjectured companion,
`<id>-conjectured` unless an argument keeps an older id with `companion_id`. The
companion holds every verdict, and its `model_check` names the model and lists only
the conjectured ones. A conjectured construction gives a single conjectured model
instead. Certificates, sources and references pass through. The engine explains a
derived failure by the first recorded failure it reaches, so the order of the
arguments can change which explanation is shown, though never a verdict.

`validate` rejects an argument without holds or fails, or without a reason; an
unknown principle, paper, write-up, `like` target or provenance sidecar; a missing
definition; and a principle both held and failed, directly or after closure (named
with its arguments). Its notices never fail: verdicts supported by a citation alone,
recorded verdicts already derivable from the others, conjectured-only verdicts, a
conjectured construction, a definition that leans on another record, and a `like`
target revised or withdrawn since. `status` prints each such model's coverage report
(every verdict with its routes, the derived verdicts, conjectures, unknowns and
notices), and `status --model ID` prints one. After migrating a record, run
`python3 scripts/check_flattening.py`: it compares the flattened records, and every
derived output including the lynchpin rows, with `origin/main` (or `--ref`).

Such a record lists only the verdicts from which the engine derives the rest. Its
source's own verdicts are minimized first, among themselves, so that they never rest on
later additions; a later verdict is recorded only where it adds something. Among
equally few, the simpler is recorded, so an unboxed principle with No Pure Contingency
rather than its boxed form. An argument whose verdicts are all derived is dropped,
unless another argument builds on it. The notice "each derivable from the other recorded
verdicts" lists what remains redundant, and `check_flattening.py --closure` checks that
a shortened record derives the same holds and fails as before.

### Model groups

A group holds what a family of models written as arguments would otherwise copy.
Each member keeps its own file, id and arguments, and names the group:

```yaml
# groups/finite-support-one-object.yaml
id: finite-support-one-object
name: Finite-support action models on one object
definition: >-                      # the shared construction; {{name}} marks a parameter's slot
  {{monoid}} In every part, … Evaluation point: the sole object, at the identity arrow.


  {{sigma}}
parameters:
  monoid: {text: The monoid of arrows.}           # a prose slot
  individuals:
    text: What the individuals are.
    generate: true                                # each member also gives a variant per other value
    default: naturals                             # for a member that sets none
    values:
      naturals: {text: The individuals are the natural numbers …, label: individuals ℕ}
      singleton: {text: There is a single individual …, label: one individual}
  sigma:
    text: The interpretation of Σ.
    generate: true
    values:                                       # named values: their prose fills the slot
      top: …                                      # a string is the text
      true-atom: {text: …, label: Σ true atom, requires: [actual-world-pinned]}
conditions:
- {id: evens-avoidable, text: …}    # stated in prose
arguments:                          # shared arguments, each with its own id, by and date
- id: sigma-top
  when: {sigma: top}                # a conjunction over parameters; a list of values means any
  fails: [witnessed-possibility-r, …]
  text: …
- id: weakly-inextensible-comprehension
  requires: [evens-avoidable]       # every member it applies to meets these
  fails: [weakly-inextensible-comprehension-r]
  text: …

# models/finite-support-truncations.yaml
group: finite-support-one-object
settings:
  monoid: 'Proposition D.5, part 6 (p. 78): …'
  sigma: top                        # or {text: …}: prose of its own, which no `when` matches
meets:
  evens-avoidable: …                # why it meets the condition: here, the witness
definition: …                       # optional: text of its own, after the group's
arguments:                          # what is specific to it
- fails: [barcan-r]
  when: {individuals: naturals}     # only at these settings; `own` matches its own prose
  text: …
```

`load_topic` expands a member before flattening. Its definition becomes the group's
with the slots filled, followed by its own if it has one. The shared arguments whose `when`
its settings match, and whose `requires` it meets, follow its own arguments, marked
with the group and carrying the member's reasons. Nothing is inherited by default: a
member that does not meet a condition does not get the shared argument. The engine never
sees a group. `validate` checks groups once (slots, `when` values, unknown
conditions, duplicate shared arguments) and each member's settings, `meets` and argument ids,
and counts a shared argument's verdicts towards a member's clashes. A shared argument lists
everything its argument shows; only a member's own arguments are held to minimal
verdicts. Moving arguments into a group must leave every closure unchanged:
`check_flattening.py --closure`, against the revision before the move. `like` may name a
shared argument as `<group>#<id>`. The viewer lists a member's own arguments, then the
shared arguments that apply to it, and gives each group a page with its shared arguments and members.

A parameter marked `generate` also makes variants. The member's own setting (or the
parameter's `default`) gives the member itself; every other value whose `requires` the
member meets gives a variant, and so does every combination across generated parameters.
A variant is a model of its own for the engine: its id is the member's followed by its
differing settings (`finite-support-truncations-individuals-singleton-sigma-single-top`),
its name the member's followed by the values' labels, and its `variant_of` names the
member. Its definition is the group's at its settings, and its arguments are the member's
own that apply there and the shared arguments that do. A member's own argument applies at
every setting unless its `when` says otherwise, so an argument that needs, say, infinitely
many individuals must say `when: {individuals: naturals}`. Validation checks the member's
file once; the engine reports any variant whose verdicts clash. The group page shows a
grid of its members, with a generated parameter's variants added as sub-rows on request,
and says what each parameter changes. In the theory explorer a group is one row, counting
its models (members and variants) that fit the assumptions and describing which; it is
listed under Matching when some are known to fit, else under Potential. Inspecting a group
tints each principle by whether it holds in all of those models, fails in all, or splits
them. Lists of witnesses gather a group's models into one entry the same way, and the
group page dims the rows that do not fit the explorer's assumptions.

**The metatheory as a parameter.** A value marked `choiceless: true` reads the construction
in ZF with a named hypothesis instead of with the axiom of choice (`metatheory` in
`full-action-models`, whose values are `choice`, `no-countable-choice-reals`, ZF with a
countable family of nonempty sets of reals that has no choice function, and `socks`, ZF with a
countable family of pairs that has none, whose union is every infinite set the construction
leaves unspecified). A value's `requires` is checked at each combination of settings, so it may
require a condition another parameter's value meets; and a member may meet a condition at some
settings only, giving the reason as `{text, when}`. The value's text
states the hypothesis, which holds in some model of ZF, so its verdicts are relative-consistency
claims of the same standing as the rest. Inheritance at such a value is opt-in: a model at it
gets only the arguments, its own, its group's and the topic's, marked `choice: free`, reviewed
as not using the axiom of choice; an argument marked `choice: uses`, or not marked (unreviewed),
does not apply there. The engine's derivations, being theorems of C, apply as everywhere. Such
a model gets no Lean certificates, Lean's metatheory having choice. Mark an argument
`choice: free` only after reading it for uses of choice, and `choice: uses` when it chooses
(from a serial relation, an equivalence relation, an ultrafilter, a well-ordering).

### General arguments

Some arguments hold far beyond one group: No Pure Contingency in every one-object action
model, Transversal Choice in every extensionally full one. They live once in the topic:

```yaml
# conditions.yaml
conditions:
- {id: one-object-action-model, text: The model is an action model with a single object.}
- {id: sigma-single-top, text: Σ is a single relational constant of type t, denoting ⊤.}

# arguments/sigma-single-top.yaml
id: sigma-single-top
requires: [sigma-single-top]         # conditions of the topic, all of them met
given: [no-pure-contingency-r]       # optional: verdicts the record's other arguments must hold
holds: [no-contingency-signature-r, signature-b-r]
text: …
by: …
date: …
```

A record meets a condition, with its reason, in one of three places: its own `meets`
(any argument-format record, in a group or not), its group's `meets` (every member), or
the `meets` of one of its group's parameter values (every model at that value, variants
included). A group's `meets` entry may also be `{text, requires}`: the members that meet
the listed conditions meet this one too, for that reason (so the finite-support group says
once why its members with a pinned actual world and non-injective arrows have an isolated
actual world). Each model's data carries `met`, every condition it meets with its reason,
which is where a Lean reference for each fact will attach. `expand_member` gives a record its own arguments, then its group's shared
arguments, then every general argument whose `requires` it meets, each carrying the
reasons as its conditions; one with `given` is added only once the arguments already
applied record those verdicts as holding, so a general argument can build on another
without the engine. Validation checks each general argument once, in its own file, and
every `meets` against the group's and the topic's conditions. The viewer gives each
general argument a page (its conditions, its text, the models it applies to), lists a
model's general arguments after its group's, and lists on a group's page the general
arguments its models use and the conditions every member meets. A general argument, and
a reason for meeting a condition, are where Lean references will attach: a theorem for
the argument, a theorem that the model has the property for the reason.

## Viewer

An optional `topics/<topic>/theme.css` overrides the shared palette for that
topic's map, HTML write-ups, and Lean index. Define light and dark CSS variables
inside `@media screen` to preserve the shared print styling. The stylesheet is
embedded in generated pages and included in the topic downloads.

**Dark mode** and **Colourblind mode** are independent header toggles, remembered
across maps and HTML write-ups. Colourblind mode overrides topic palettes with
one shared light/dark scheme based on [Okabe–Ito](https://jfly.uni-koeln.de/color/#pallet):
sky blue replaces green, orange replaces red, and independence combines both
coloured halves. Open nodes keep their normal fill.

Lattice: a separate Hasse diagram of the conjunctions a chosen handful of
principles generate. It opens with False and True alone. Two routes carry a choice of principles in:
**Show in Lattice**, in the graph's details pane and in the Theory explorer's
Assumptions box, draws the lattice of what is selected or assumed, negations
included, and opens this view; on the lattice itself the pane offers **Hide others**,
which pares the lattice down to the selection and its conjunctions; **from the graph**, beside
the Lattice heading, takes whatever the graph is showing, negations included and
assumptions left out. The graph reads well at seventy principles and the lattice
at about eight, which is why the two keep separate lists rather than one. Past
the node cap nothing is drawn and the readout says how many would be workable.
The sidebar offers the same
choices per principle as the graph, ✓ for the principle, ✗ for its negation and
a move to the background, and each adds its literal together with its meets
against everything already shown. Each group has the graph's own
show-or-hide control as well, under the same node cap. The toolbar is the graph's too:
a box to find a principle, then **Flip** and **Fit**. One query serves both
diagrams; on the lattice a match nobody has chosen to build with has no node,
and the readout says so rather than pretending otherwise. The lattice is not
shaded as the graph is: its order already shows what a selection entails and
excludes, so it marks the selected node and brings forward the arrows rising
from it.

**Flip** turns a diagram over, so the stronger principles sit at the top and the
arrows descend. It is one reflection of the finished layout, so nothing else
moves, and the graph and the lattice share the setting: which way a Hasse
diagram reads is a habit of the reader's rather than a fact about either one. The sidebar is the graph's own, moved
across with the tab as it is for the theory explorer, so the background, the
scrolling and the resizable panes are the same by construction, and so is the
arrow-source selector: the lattice is drawn from the selected sources alone, proofs and models both, so
deselecting a source shows the diagram as it stood without that knowledge. A
model outside the selection still appears in the readout, marked as such, but it
does not make an arrow solid. A meet is drawn under a name only when the reader has chosen a
principle equivalent to it, and then under every such name at once, with the
word equivalent above them as on the graph. False and True always name their
own nodes, and the reader's assumptions name them too: a backgrounded principle
joins the ceiling, or the floor when its negation is assumed. A meet nobody has named is an ∧ in a circle, since where it sits
already says it is the conjunction of the nodes above it; the map's own name
for it, if it has one, waits in the readout. An inconsistent meet is the floor. Nothing nests, since on a Hasse diagram the greatest lower bound of two
nodes is their conjunction. A cover whose converse is ruled out by a model is a
solid arrow with a filled head; one whose converse is still open is dashed with
a hollow head, because whether those two nodes are really distinct is the
question the diagram exists to answer. Clicking works as it does on the graph, through the same selection and the
same detail panel: a principle name gives its name, statement and details link,
an ∧ gives its conjuncts, and an arrow gives the proofs behind it and, where
the converse is settled, the model that settles it. The relation shading and
its legend are the graph's too. The node count grows with the subsets, so the
view stops at a few hundred and says so.

Graph: implications, ∧ nodes for multi-premise results, stronger principles lower and ⊥ at the bottom; see [Graph layout](#graph-layout). The arrow options (conjecture arrows, conjectures only, unpublished only, implied and trivial arrows, isolated principles) are set aside for now and keep their defaults. Theory explorer: principles use the same categories and ordering as Graph; mark them positive/negative as the explorer's own assumptions, and a principle those assumptions settle opens its derivation in place with **why**; models known to fit are listed, those whose status is unknown below. Clicking a model highlights its row and shows its verdicts beside each principle while preserving the model list and shared assumptions. Click a verdict’s evidence link for its sources and write-up; a derived verdict’s **why** opens its derivation in place. Click a model for its sources, write-up links, and any unknown assumptions. A model's own page sorts every principle by what the model says about it, satisfied, violated or unknown, each group counted; the principle leads the row and its evidence follows. A model records a few properties and the rest follow from them, so the derived verdicts of a group wait behind a closed disclosure rather than burying the recorded ones. A derived verdict’s **why** lists the recorded verdicts it starts from and the implications it goes through, each with its own badges. Unknown verdicts remain unknown. Results: every proved result among the principles the sidebar shows, from the selected sources, grouped by what it concludes with incompatibilities last; a box narrows the list by text found anywhere in a statement (a principle's name also finds the principles whose names contain it) or, when the text names a principle, to the results concluding exactly it or using exactly it; a row opens the result. Nothing is assumed in this list, so the sidebar's background controls do not appear on it. Conjectures: current and previously conjectured results and models, with answers computed from the selected evidence and background. Changes: every principle, result and model by date, and every logged revision of a record (its `changes` entries) under the revision's own date; an entry marked `minor: true` (housekeeping that leaves what the record says unchanged) is hidden unless **minor changes** is checked, which shows how many there are, while the record's page and the bundle keep it; the tab's number is what is new, the entries since your last visit in this browser (the last 7 days on a first visit or without storage), which the line above the list spells out with the total shown; the box filters by the same normalised text as Results, redrawing 200 ms after typing pauses, and a long list comes in pages of 300 with a button for the next; the graph, lattice and literature boxes use the same normalised text and the same pause before redrawing (the checks call `flushGraphSearch`, `flushPapers`, `flushChanges` and `flushTheorems` instead of waiting); the details button opens the record page, which shows a hand-written write-up in full when one exists (the record's own summary otherwise, or until the write-up loads), with the Lean source when present. Header downloads: **Content bundle (ZIP)** is a complete working copy with topic sources, summaries, viewer, and build tools; **Lean files**, when present, opens the formalisation files. Hover over a link for its contents.

### Graph layout

Vertical position is logical strength: stronger principles sit lower and
implication arrows ascend. Principles inconsistent with the background share
an **equivalent** box with ⊥, at the bottom. Principles that follow
from the background share a box with ⊤. **Trivial arrows**, off by
default, shows False ⇒ every displayed node and every displayed node ⇒ True.
These logical arrows have their own explanation and do not change source
filters, proof evidence, or the treatment of inconsistent assumptions.

An ∧ collects its premises below them, with solid strokes descending into it,
drawn a little thinner and lighter than an implication arrow, in the tone of
the ∧ glyph itself. When a proved conjunction is equivalent to a principle, the ∧ sits inside
that principle's equivalence box, with the strokes landing directly on its
circle. There is no arrow inside the box. Other consequences retain their
arrows, and clicking the ∧ provides the equivalence proofs and all its
consequences. Mutually implying conjunctions also share an equivalence box,
even when no individual principle represents it; each retains its own ∧ and
premise strokes. An inconsistent conjunction similarly belongs inside False.
A conjectured reverse implication does not establish equivalence.

Panning and zooming persist. Redrawing after a change of content leaves the
view where the reader put it; only the first draw, a resized graph pane and the
fit button restore the whole diagram.

Principles are ranked by their implication order. Barycenter sweeps and
adjacent swaps reduce crossings; separate connected clusters are packed side
by side. Isolated principles occupy compact labelled bands above the diagram.
⊤ always appears, including when every principle is hidden. Both constant
boxes use just their symbols, ⊤ and ⊥, and remain visible when their trivial
arrows are hidden.

Arrowheads are filled. Each arrow's details panel reports the converse, and for multi-premise arrows whether the remaining
premises still suffice without each one. **Transitive reduction**, on by default, hides an
arrow when a chain of other displayed arrows already gives it, as in a Hasse
diagram; a proved arrow is never hidden through a conjectural chain, nothing
is hidden inside a cycle, and node positions do not change, since the layout
always uses the full arrow set. It also hides an arrow that repeats a premise
stroke: when C is equivalent to A ∧ B, the strokes from A and B into the ∧
inside C's box already say what C ⇒ A and C ⇒ B say, so only the strokes are
drawn. A box and the ∧ circles it holds are all equivalent, so when several of
them carry the same consequence only one arrow to it is drawn; two arrows that
both leave the box itself record separate theorems and are both kept.

Clicking a principle (on the graph or in the sidebar), or an ∧, shades other
principles and conjunction circles by their relation to it. The legend first
reports the selection's own standing: consistent with the background and the
model that witnesses it, consistent on evidence outside the selected sources,
not shown consistent, or inconsistent. A selection that nothing settles is
drawn with a dashed border, since every triangle below needs a model of the
selection and such a selection has none. Each circle uses its
full premise set, whether standalone or inside an equivalence box. Entailed principles use solid green and
excluded principles solid red. A green upper-left triangle means a recorded model
satisfies both the selection and the principle; a red lower-right triangle means
a recorded model satisfies the selection and the principle's negation. An
uncoloured half retains the normal node fill. Both coloured halves mean
**independent of selection**: both kinds of model exist. A single
countermodel establishes non-implication, not independence. Proved entailment
or exclusion takes priority over consistency shading. Open questions retain
their normal fill; conjectures use a separate pattern when no proved relation
or consistency witness is available. False and the principles equivalent to it
are excluded by every consistent selection. The legend always shows four keys:
**entailed**, **excluded**, **consistent**, and **negation is consistent**, including
zero counts. A node with both coloured halves contributes to both consistency
counts. Standalone circles contribute to these counts; an enclosed circle is
counted through its equivalence box. Hover text gives a concise relation label.
Proofs come from the arrow engine (displayed
sources plus background proofs), models from the selected evidence, exactly as
in the theory explorer; a witness available only outside the selected sources
is reported as such. **Shift-click** adds or removes principles from a joint
selection; there is no two-principle limit. Clicking a conjunction selects its
members. Related, redundant and equivalent principles remain individually
selected, and shading is relative to the whole selected conjunction.
A background-inconsistent principle or conjunction highlights every box in the
excluded colour, with an inconsistency notice. Proof readouts continue to report
the inconsistent antecedent. The shading survives reading an
arrow's details and clears with Escape or a click on empty space. The details
of a selected principle or joint selection also offer the sidebar's own moves
on it: **Hide** unchecks it, **Add negation** checks its negation, and **Move
to background** assumes it, each with the sign the selection carries. The same
three are offered on the lattice, where they act on the lattice's own choices.

Graph descriptions occupy a reserved bottom panel, with the fixed relation legend
above the scrolling details and a one-line foot below them. The legend leads with
the selection itself, then the four colour keys, then the controls that act on it:
**details**, **Hide**, **Add negation**, **background**, and **hide equivalents**
when the diagram is showing something the background makes equivalent to the
selection without being part of it. They cost no line of their own. Whether the selection can hold with the background, and which
model witnesses it, goes to the foot, out of the way of both. The standing
instruction shows only while nothing is selected. A relation heading such as
Converse rides on the first line it labels rather than taking one. Below the
readout, a selected principle, or several that are all equivalent, lists every
other principle the background makes equivalent to it, shown or not, with
**show** or **hide** for that principle and **replace**, which hides what is
selected, shows the equivalent in its place and selects it. An arrow
states itself once; its drawn form appears separately only when the background
let the graph drop a premise or contrapose it. Drag its divider or use the arrow keys to resize it;
double-click or press Enter to reset. The height is remembered. Opening or closing
details does not cover or resize the graph. The panel lists selected principles with expandable
definitions and individual remove buttons.

The Conjectures tab shares the background controls. Its sections collapse:
**High-Value Questions** ranks open questions by the harmonic mean of what the
two answers would settle. If each answer is as likely as the map leaves room
for it, inversely to how much it would settle, that is the number of other
questions an answer is expected to settle, so a question that only matters if
it comes out the implausible way sinks. **Core Questions**, below it, keeps only
the implications of the form ⊢ C (no premises), A ⊢ C (one premise, C a principle or ⊥), A ∧ B ⊢ ⊥,
or A ∧ B ⊢ C where C ⊢ A and C ⊢ B are already established (whether C is
equivalent to A ∧ B), with no model checks; it ranks them by the geometric mean of how many core
questions each answer would settle, the question itself included, so that a
question one of whose answers would settle much still rises; and it says how many
of them are open, with the share to a tenth of a percent. Both descriptions use
the full width, with their counts on a line of their own. A group of equivalent questions is core when one of its forms is.
**Automatically Generated Conjectures**
lists the same questions by their larger side, each stated as the answer to
expect: ⊢ when a refutation would settle more, ⊬ when a proof would, with "if
yes" and "if no" what confirming or refuting that conjecture would settle. A question is S ⊢ c, whether S entails c, for S at
most two principle classes (True, with none) and c a class or False, asked only
where no smaller premise set already proves or excludes c, and settled alike by
a proof, an exclusion or a fitting model; "no" denies the entailment; a model check (model: principle) is scored the
same way. A row that a recorded conjecture asks about carries a star and a details link
to the record. The star is bronze when the record has notes, and silver or gold
when the record says `tier: silver` or `tier: gold`, a human ranking of the
question by importance and difficulty. The ranking is computed at build time for the topic background and
each preset, so an ad-hoc background shows none, and a topic marked `draft: true`
in its `topic.yaml` gets none at all. **Conjectures** lists each
recorded conjecture as the question it asks, in the same format: ⊢ when a result
claims the entailment, ⊬ when a model denies it, with "if yes" and "if no" what
confirming or refuting the conjecture would settle. An open conjecture sits at
its rank with its scores, whether or not it made the ranking's stored top; a
settled one shows its verdict, proved or refuted, and no rank or scores; one
with more than two premises is listed the same way, marked as such. **Show
resolved** is off by default, hiding the settled ones. A sparse map, too open to
rank, still lists and scores its conjectures. Verdicts come from proved
evidence under the background and never from conjectures; a model witnesses a
conjecture's flags, not its proposed construction. The High-Value Questions description gives the share of
implication questions with up to two premises settled: S ⊢ c for S at most two
principle classes and c a class or False, counted only when no smaller premise
set already proves or excludes c, and settled alike by a proof, an exclusion or
a fitting model. It is computed at build time for the topic background and each
preset; other backgrounds show no share, and hiding a source or enabling
Lean-only does not change it. An inconsistent background shows a warning in
place of both sections.

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

A model's page sorts the principles into three columns, satisfied, violated and
unknown, with the derived verdicts behind a toggle and no source information. Each
principle has one control: for a model written as arguments, to the arguments for it;
otherwise to its evidence. A derived verdict has a **why** disclosure instead, opening
its derivation in place: the recorded verdicts it starts from, each linking to its
argument, then the results it goes through. The Theory explorer uses the same
disclosure for a principle that follows from, or is ruled out by, what is assumed,
and its Assumptions box for an assumption the others settle and for each consequence
it lists; a group's page gives it to each verdict derived in every row, one derivation
per distinct chain across the rows, and its grid's cell panel shows it open. Each
assumption in the explorer's box has **negate**, which swaps its sign, and **remove**. The Arguments
section lists each argument once, in the record's order, headed by the verdicts it
settles, with who supplied it inside (for a theorem-trawl admission, who found,
reviewed and admitted it, with the review's report). A hand-written write-up of such a
model is linked rather than shown in place of its definition. A verdict's pop-up
credits its arguments' sources; source filters still act on whole records.

Isolated principles are packed into compact rows just below the connected
graph. Showing or hiding them leaves the connected layout intact. If no
arrows are visible, the principles form a compact grid instead of one long row.

Graph **Arrow sources** and **Lean-verified only** control displayed proofs.
Sources come in two collapsed groups, **Published papers** and **Unpublished**,
each toggling its members together, with **Show papers** or **Show sources** to
expand individual choices. Partial selection is shown on the group checkbox. The
catch-all `misc` source stands on its own, since neither group describes it.
**Lean-verified only** sits with the sources, so the graph, the lattice and the
conjectures view all reach the one control; a Lean-verified arrow is drawn
thicker than the rest whether or not it is checked. A verdict carries a
**Lean ✓** badge when everything under it is verified, the model and, for a
derived verdict, every result in the chain, which its derivation shows step by step;
the consistency line at the foot of
the details pane carries it beside the witness it names.
Background consequences always use all recorded proved results, including
hidden arrows. For example, DTU still supplies Simple Expected Utility in a
conjectures-only view, so conjecture arrows retain only their additional
premises. Transitive proofs retain the supporting background derivations.
Conjectures never supply automatic background facts or exclusions. The graph
shows only conjectures still open under all recorded proved evidence and the
current background. Resolved questions remain available in the Conjectures tab
under **Show resolved**; they supply neither conjectural arrows nor deductions.

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
both can be displayed together; unchecking each hides it. **Background** moves
the principle into the shared assumptions, assuming it positively unless only
✗ was selected, and shows it in the True box, or the False box for a negative
assumption. In the background, ✓ and ✗ are exclusive. **Return** displays
the assumed sign on the graph again. Standing topic axioms remain fixed.

The Theory explorer keeps assumptions of its own, apart from the graph's
background, and edits them directly in one principle list; its package buttons,
at the foot of the list, say **Assume** rather than Background, and **clear
assumptions** sits on the list's heading line. Clicking the selected ✓ or ✗ again removes
that assumption. Solid buttons show explicit assumptions; tinted buttons show
consequences. An **Assumptions** box heads the model column: it lists what is
assumed, each with a remove link; flags an assumption that the other
assumptions already settle (**also follows**, opening to the proof, and naming
an equivalent assumption when the two settle each other); and counts what
further follows and what is ruled out, each opening to the list, leaving out
what the fixed background gives by itself. Contradictory assumptions show their
evidence in that box and suppress model matches. Evidence links sit inline with
principle names, and the Potential models list retains unverified candidates.
Unknown model properties remain unknown.

Wherever principles are listed by name (the three principle lists, the find box,
the Assumptions box and its lists, the equivalents of a selection, the bundle's
MAP.md index), a leading symbol such as □ counts after the bare name, so
□Actuality follows Actuality and precedes Actuality (type t). A principle's page
lists the results concluding it, fewest premises first, before those using it as
a premise, by what they conclude, with incompatibilities last.

The line under the Graph and the Lattice carries the relation keys and the actions on
the selection; the pane below names the selection. With several principles selected the
pane lists their names, each a link to its page that previews the statement on hover,
with **negate**, which puts its negation in its place, and **remove**, and offers
**Show in Theory explorer**, which assumes the selected
principles there in place of whatever it was assuming; the foot of the pane names one
model of the selection. A single selected principle keeps its fuller pane.

The line's **Hide** takes the selected principles off the diagram; when one of them is
not drawn, as after selecting from the sidebar or negating, it reads **Show** instead
and draws them all.

On the Graph, selecting one or more principles dims every arrow that touches none of
them and thickens the rest, short of a hover's weight, as hovering a box does for that box alone; hovering takes over while it lasts,
and the relation shading stays. In the Lattice sidebar a principle's name selects it,
with a modifier key to extend the selection, as on the graph and in the Graph sidebar.
On the Lattice the heavy arrows rise from the node the whole selection generates, its
conjunction, so they follow the selection as it is extended, shrunk or cleared. With a
selection the Lattice's nodes also take the Graph's colours for their relation to it,
green for entailed, red for excluded, split for consistent either way, white for open,
with the same counted legend; with nothing selected the Lattice stays uncoloured, since
it draws entailment and consistency itself.

Wherever a list names principles (the Graph and Lattice sidebars, the Theory explorer,
Conjectures), resting the pointer on a name for a moment, or focusing it from the
keyboard, shows a preview of the principle's statement beside it, with its formal form
and its equivalents under the background; the preview holds nothing to click and goes
when the pointer leaves, and never appears on a touch screen. Clicking a name selects
the principle on the diagrams and in their sidebars, and in Conjectures, whose pop-up
offers to assume it; in the Theory explorer it opens the principle's page.

Positive assumptions are saved as `?assume=id,id`; negative assumptions use
`deny=id,id`. Both apply to Graph and Conjectures; the Theory explorer's own
assumptions are saved as `theory` and `theory-deny`. Reloading
restores them without changing source YAML, proofs, or downloads. **Clear background** removes all removable positive and negative assumptions; **clear assumptions** does the same in the Theory explorer.

Negative assumptions are forbidden facts in the Horn engine. A negative conclusion
is proved by adjoining its positive counterpart and deriving a conflict. Signed
graph connections retain the complete contextual premise conjunction: A ∧ B ⇒ C
allows A ∧ ¬C ⇒ ¬B. Source attribution and write-ups remain attached to the
original result; the graph identifies contraposed connections. Negative nodes
have a ¬ prefix and dashed outline. Derived signed arrows use the same proof
queries, without enumerating truth assignments.

Arrow endpoints meet node boundaries along the curve's tangent. Static chevrons
show direction. Highlighting a box or arrow thickens its arrows and dims the rest,
and applies once the pointer has rested on it for a moment, lifting a moment after
it leaves, so a pointer crossing the diagram never re-dims every arrow on the way.
Highlighted arrows also carry native SVG chevron motion, capped at 48 moving chevrons
with no per-frame JavaScript, but since adding them relays out every arrow, they start
only after the pointer has lingered on one target for the better part of a second and
stop the moment it moves on, so a pointer in motion never sees a blink. Motion stops on
pointer leave, tab changes, or a hidden document; reduced-motion preferences retain
static chevrons only.

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
buttons in the Graph, and **Assume DU** and **Assume DTU** in the Theory explorer. They add the chosen package without removing
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

Implications to **⊥** appear as arrows to one special logical node.
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
`scripts/check_hasse_layout_ui.cjs` checks the layout convention (floor, ascending
arrows, meets, pinned collapses, bands, filled heads, transitive reduction) on
fixtures and on every graph mode of the built topics; `scripts/check_relations_ui.cjs`
checks relation shading, multiselection, converse readouts and their evidence discipline.
`python3 scripts/check_falsity.py` also checks negative backgrounds and agreement
between the Python and browser engines.
