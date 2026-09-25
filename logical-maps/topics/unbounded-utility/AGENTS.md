# Unbounded Utility records

Use the shared mathematical workflow in the repository's `AGENTS.md` files.
Paths below are relative to `topics/unbounded-utility/`. Start with `topic.yaml`,
`background.md`, and the matching principle records. Read the project's
`CLAUDE.md` before editing, especially its DU/DTU and certificate rules.

## Locate the question

Display names and historical IDs differ. Confirm definitions in
`principles/<id>.yaml`, then search the IDs in `results/`, `models/`, and
`writeups/`. The entries below are navigation aids, not verdicts.

| User's terminology | Principle IDs / entry points |
| --- | --- |
| DU / DTU | `topic.yaml` presets `du` / `dtu`; expand their principle lists |
| Richness, Archimedean assumptions, completeness/totality | `rich-outcomes`, `archimedean-outcomes`, `archimedean-gambles`, `totality`, `restricted-totality` |
| Independence, mixtures, Sure-Thing | `independence` (Mixture Independence), `sure-thing`, `countable-sure-thing`; do not confuse with independent sums |
| Law invariance / dominance | `stochastic-equivalence`, `restricted-stochastic-equivalence`, `stochastic-dominance`, `statewise-dominance` |
| EU, finite/simple EU, relative/folded expectation, CDF areas | `expected-utility`, `simple-eu`, `relative-expectation`, `simple-relative-expectation`, `folded-expectation`, `cdf-area-extension` |
| Sym, symmetry, affine transformations, reflection, neutrality | `shift-invariance`, `scale-invariance`, `positive-affine-invariance`, `negative-affine-anti-invariance`, `reflection-anti-invariance`, `symmetric-neutrality`; inspect the cited result's actual package |
| Background risk, independent addition, preservation vs cancellation | `independent-sum-consistency` (Independent Sum Invariance), `independent-sum-preservation`, `independent-sum-cancellation`, `full-sum-consistency` |
| Copulas, comonotonic / antitonic addition | `comonotonic-sum-consistency`, `antitonic-sum-consistency`, `existential-copula-sum-consistency`, `universal-copula-sum-consistency` (displayed as Invariance) |
| L¹, continuity, transfer of a shift | `l1-continuity`, `vanishing-shift-continuity`, `shift-transfer` |
| Pasadena, Arroyo, alternating St Petersburg, self-similarity | `pasadena-value`, `arroyo-value`, `alternating-st-petersburg-value`, `negative-self-similarity` |

## Constructions and ongoing arguments

- CDF-area orders: `models/cdf-area-preorder.yaml` and
  `models/cdf-conclosure-preorder.yaml`, with matching write-ups. Keep their
  definitions distinct.
- Total comonotonic extension, killing lemma, survival profiles, quantile
  shears, or both-infinite areas: start at
  `models/conjectured-total-comonotonic-area-extension.yaml` and its matching
  `writeups/` file. The write-up includes partial progress; check which parts
  are proved separately from the proposed extension.
- Independent-sum total extensions: start at
  `models/conjectured-total-independent-sum-extension.yaml` and its write-up.
  Read the current `status`; the historical filename does not establish it.
- Clipped expectation: `models/eventual-clipped-expectation.yaml`,
  `total-exact-ultrafilter.yaml`, `total-continuous-ultrafilter.yaml`,
  `asymmetric-continuous-ultrafilter.yaml`, `geometric-continuous-ultrafilter.yaml`,
  and `polynomial-asymmetric-continuous-ultrafilter.yaml` (all under `models/`),
  with matching write-ups. Exact/eventual/continuous comparisons and cutoff
  windows matter.
- Other useful witnesses: `models/finite-support-compensated-dominance.yaml`,
  `finite-shift-total-extension.yaml`, `affine-symmetric-extension.yaml`,
  `lexicographic-folded-extension.yaml`, `lexicographic-nonatomic-mass.yaml`,
  and `finite-two-sample-minimum.yaml` (all under `models/`). Search their flags
  or query closure to choose a witness; do not read them all by default.
- `extraction.md` indexes source results, transcription corrections, deferred
  principles, and dated research batches. Search the relevant heading; its old
  lists of open questions may have been superseded. `papers.yaml` resolves
  source IDs. The unpublished background-risk source has explicit caveats;
  retain them when using its claims.
- `checks/` contains construction-specific numerical checks (e.g.
  `comonotonic_witnesses.py`, `cancellation_preservation.py`,
  `geometric_clipping.py`). Run/read the relevant check when examining that
  witness; numerical checks alone do not prove a general theorem.
- Mathematical brainstorming uses the records and write-ups. Do not start
  Lean work unless explicitly requested or already agreed; asking for a proof
  or an argument check is not a Lean request.
- For requested Lean work use `lean/README.md`, `lean/VERIFICATION.md`, and
  `lean/REVIEW.md`; then the specific definition or proof. Check the translation's
  regularity assumptions. Generated statements are not completed proofs.

## Mathematical guardrails

- Preferences are reflexive and transitive in the fixed framework. Totality
  and Stochastic Equivalence are optional. Gambles are random variables, not
  automatically identified by law; all measurable outcome-valued gambles are
  available on the standing atomless standard probability space.
- DU = Rich Outcomes + Archimedean Outcomes + Stochastic Equivalence +
  Stochastic Dominance + Mixture Independence. DTU adds Totality. Simple EU is
  derived, not assumed; its derivation also needs dominance and independence.
  Restricted Totality is not Totality for arbitrary gambles.
- A randomized mixture selects between gambles. A pointwise utility sum adds
  their values. Preserve the outcome-chart scope and coupling assumptions;
  independent noise is independent of the pair `(X,Y)`. Law-based copula or
  quantile arguments need the stated Stochastic Equivalence assumption.
- Preserve the direction of preservation versus cancellation and the order of
  quantifiers in copula principles: one copula working for all comparisons is
  different from choosing a copula for each comparison.
- “Sym” is package shorthand, not a principle ID. Reflection anti-invariance
  reverses comparisons at one fixed origin; symmetric neutrality is a separate
  condition. EU on integrable variables does not settle every unbounded gamble.
- Clipping moves tail mass to the endpoints; it does not discard the tails.
  Check integrability of differences/combined tails and the exact limit or
  ultrafilter comparison. Do not manipulate undefined differences of infinities.
