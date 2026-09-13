# Verification report — 13 September 2026

**39/39 principles defined; 103/103 records stated; 23/87 result proofs verified; 0/16 model witnesses verified.**

The remaining **64 results and 16 models are unproved in Lean**. A `stated` certificate
does not certify an implication, the existence of a model, or the correctness of a paper.
Existing mathematical claims and source attribution are unchanged.

## Audit

The 13 September audit reran `lean-check unbounded-utility --update` after
adding `finite-shift-total-extension` and `lexicographic-nonatomic-mass`,
and promoting the cancellation-to-preservation conjecture with its
geometric-noise proof. All generated statements elaborate. These new
mathematical proofs are not formalized; the two Countable Sure-Thing
questions retain their conjectured statements and have separate refuting
model evidence. All 23 existing proof references passed again, and no new
record received a verified certificate.

The audit passed again after expanding `lexicographic-nonatomic-mass`
to classify all 39 principles (23 satisfied, 16 violated). Its expanded
existence statement elaborates, and all 23 existing proof references
still pass. The added classifications, including their bounded-chart
scope qualifications, remain written proofs without a Lean witness.

The original 10 September audit is recorded below.

`python3 scripts/pmap.py lean-check unbounded-utility --update` successfully built the
library and checked the 23 proof references at their exact generated types. Every proof
passed the dependency whitelist (`propext`, `Classical.choice`, `Quot.sound`); none uses
`sorryAx` or a custom axiom. Metadata was updated only after that audit passed.

`check_lean_audit.py` passed actual Lean cases for a valid proof, an incorrectly typed
reference, `sorry`, a custom axiom, and a partially successful batch containing a type
error. Missing and multiline dependency reports are also covered. Database validation,
engine self-tests, and Python/JavaScript/False-generation checks passed.

## Scope decisions and remaining barriers

- Universal statements and witnesses explicitly carry `Pref.Regular`; see the
  [formalisation contract](README.md#formalisation-contract). Lean proves these precise
  formulations, rather than checking their translation from natural-language sources.
- Partial-chart arithmetic does not supply outcomes at every real level. In particular,
  deriving shift invariance by taking noise to be sure utility `b` needs that outcome
  to exist. The sum-to-shift edges without Rich Outcomes retain their original generated
  statements and remain unverified. Settle this availability/scope obligation before
  attempting to certify them; do not silently add an assumption to an existing edge.
- Representation theorems need the utility-chart and mixture-law development. Coupling
  and quantile results need measurable realizations, including atoms. Tail/CDF proofs
  need the corresponding integral identities. These are deferred proof tasks.
- Countermodels require an actual regular preference witness and proofs of every
  recorded satisfaction/violation. Numerical checks and existence prose have not been
  promoted to Lean certificates. No implication to `False` is certified yet.
- This campaign covers the existing **Unbounded Utility** Lean project. The
  Decision Theory demo has no configured Lean library and is not certified.

## Verified results

| Record | Checked declaration |
| --- | --- |
| `archimedean-gambles-restricts` | `UnboundedUtility.Proofs.archimedean_gambles_restricts` |
| `dominance-implies-equivalence` | `UnboundedUtility.Proofs.dominance_implies_equivalence` |
| `expected-utility-implies-simple` | `UnboundedUtility.Proofs.expected_utility_implies_simple` |
| `full-sum-implies-antitonic` | `UnboundedUtility.Proofs.full_sum_implies_antitonic` |
| `full-sum-implies-comonotonic` | `UnboundedUtility.Proofs.full_sum_implies_comonotonic` |
| `full-sum-implies-independent` | `UnboundedUtility.Proofs.full_sum_implies_independent` |
| `full-sum-implies-universal-copula` | `UnboundedUtility.Proofs.full_sum_implies_universal_copula` |
| `independent-sum-implies-cancellation` | `UnboundedUtility.Proofs.independent_sum_implies_cancellation` |
| `independent-sum-implies-preservation` | `UnboundedUtility.Proofs.independent_sum_implies_preservation` |
| `l1-implies-vanishing-shift-continuity` | `UnboundedUtility.Proofs.l1_implies_vanishing_shift_continuity` |
| `negative-affine-implies-reflection` | `UnboundedUtility.Proofs.negative_affine_implies_reflection` |
| `positive-affine-implies-scale` | `UnboundedUtility.Proofs.positive_affine_implies_scale` |
| `positive-affine-implies-shift` | `UnboundedUtility.Proofs.positive_affine_implies_shift` |
| `preservation-cancellation-imply-independent-sum` | `UnboundedUtility.Proofs.preservation_cancellation_imply_independent_sum` |
| `relative-implies-simple-relative` | `UnboundedUtility.Proofs.relative_implies_simple_relative` |
| `simple-eu-implies-restricted-equivalence` | `UnboundedUtility.Proofs.simple_eu_implies_restricted_equivalence` |
| `simple-eu-implies-restricted-totality` | `UnboundedUtility.Proofs.simple_eu_implies_restricted_totality` |
| `stochastic-equivalence-restricts` | `UnboundedUtility.Proofs.stochastic_equivalence_restricts` |
| `symmetry-implies-negative-self-similarity` | `UnboundedUtility.Proofs.symmetry_implies_negative_self_similarity` |
| `total-preservation-implies-independent-cancellation` | `UnboundedUtility.Proofs.total_preservation_implies_independent_cancellation` |
| `totality-independence-negative-affine-imply-self-similarity` | `UnboundedUtility.Proofs.totality_independence_negative_affine_imply_self_similarity` |
| `totality-restricts` | `UnboundedUtility.Proofs.totality_restricts` |
| `universal-copula-implies-existential` | `UnboundedUtility.Proofs.universal_copula_implies_existential` |

## Principle definitions

| Principle | Lean definition |
| --- | --- |
| Alternating St Petersburg = −1/2 | `UnboundedUtility.AlternatingStPetersburgValue` |
| Antitonic Sum Invariance | `UnboundedUtility.AntitonicSumConsistency` |
| Archimedean Gambles | `UnboundedUtility.ArchimedeanGambles` |
| Archimedean Outcomes | `UnboundedUtility.ArchimedeanOutcomes` |
| Arroyo = ln 2 | `UnboundedUtility.ArroyoValue` |
| CDF-Area Extension | `UnboundedUtility.CDFAreaExtension` |
| Comonotonic Sum Invariance | `UnboundedUtility.ComonotonicSumConsistency` |
| Countable Sure-Thing | `UnboundedUtility.CountableSureThing` |
| Existential Copula Sum Invariance | `UnboundedUtility.ExistentialCopulaSumConsistency` |
| Expected Utility | `UnboundedUtility.ExpectedUtility` |
| Folded Expectation | `UnboundedUtility.FoldedExpectation` |
| Full Sum Invariance | `UnboundedUtility.FullSumConsistency` |
| Mixture Independence | `UnboundedUtility.MixtureIndependence` |
| Independent Sum Cancellation | `UnboundedUtility.IndependentSumCancellation` |
| Independent Sum Invariance | `UnboundedUtility.IndependentSumConsistency` |
| Independent Sum Preservation | `UnboundedUtility.IndependentSumPreservation` |
| L¹ Continuity (random variables) | `UnboundedUtility.L1Continuity` |
| Negative Affine Anti-Invariance | `UnboundedUtility.NegativeAffineAntiInvariance` |
| Uniqueness of Negative Self-Similarity | `UnboundedUtility.NegativeSelfSimilarity` |
| Pasadena = ln 2 | `UnboundedUtility.PasadenaValue` |
| Positive Affine Invariance | `UnboundedUtility.PositiveAffineInvariance` |
| Reflection Anti-Invariance | `UnboundedUtility.ReflectionAntiInvariance` |
| Relative Expectation | `UnboundedUtility.RelativeExpectation` |
| Restricted Stochastic Equivalence | `UnboundedUtility.RestrictedStochasticEquivalence` |
| Restricted Totality | `UnboundedUtility.RestrictedTotality` |
| Rich Outcomes | `UnboundedUtility.RichOutcomes` |
| Scale Invariance | `UnboundedUtility.ScaleInvariance` |
| Shift Invariance | `UnboundedUtility.ShiftInvariance` |
| Transfer of a Shift Across a Mixture | `UnboundedUtility.ShiftTransfer` |
| Simple Expected Utility | `UnboundedUtility.SimpleEU` |
| Simple Relative Expectation | `UnboundedUtility.SimpleRelativeExpectation` |
| Statewise Dominance | `UnboundedUtility.StatewiseDominance` |
| Stochastic Dominance | `UnboundedUtility.StochasticDominance` |
| Stochastic Equivalence | `UnboundedUtility.StochasticEquivalence` |
| Sure-Thing | `UnboundedUtility.SureThing` |
| Symmetric Gambles Are Neutral | `UnboundedUtility.SymmetricNeutrality` |
| Totality | `UnboundedUtility.Totality` |
| Universal Copula Sum Invariance | `UnboundedUtility.UniversalCopulaSumConsistency` |
| Continuity under Vanishing Shifts | `UnboundedUtility.VanishingShiftContinuity` |

## Pending result proofs

- `antitonic-sum-and-equivalence-imply-existential-copula`
- `antitonic-sum-implies-shift`
- `cdf-area-implies-dominance`
- `cdf-area-implies-eu`
- `cdf-area-implies-relative`
- `comonotonic-sum-and-equivalence-imply-existential-copula`
- `comonotonic-sum-implies-shift`
- `conjectured-dtu-cancellation-implies-preservation`
- `conjectured-dtu-shift-implies-transfer`
- `continuous-total-cancellation-implies-preservation`
- `countable-sure-thing-outcomes-to-gambles`
- `countable-sure-thing-simple-to-full-eu`
- `dominance-implies-statewise`
- `dominance-refutes-antitonic-sum`
- `dominance-refutes-full-sum`
- `dtu-l1-implies-eu`
- `dtu-refutes-archimedean-gambles`
- `du-l1-implies-relative`
- `du-vanishing-shifts-imply-relative`
- `equivalence-and-statewise-imply-dominance`
- `eu-independence-l1-imply-relative`
- `existential-copula-implies-shift`
- `folded-evaluates-arroyo`
- `folded-implies-eu`
- `folded-implies-symmetric-neutrality`
- `folded-independence-imply-relative`
- `independence-shift-transfer-imply-shift`
- `independence-to-sure-thing`
- `independent-sum-and-equivalence-imply-existential-copula`
- `independent-sum-implies-shift`
- `levy-refutes-neutral-independent-preservation`
- `negative-affine-implies-positive-affine`
- `negative-self-similarity-evaluates-alternating`
- `neutrality-shift-imply-shift-transfer`
- `neutrality-totality-independence-imply-reflection`
- `original-dtu-implies-simple-eu`
- `positive-reflection-imply-negative`
- `reflection-implies-symmetric-neutrality`
- `relative-dominance-imply-cdf-area`
- `relative-implies-eu`
- `relative-neutrality-shift-imply-folded`
- `relative-self-similarity-evaluates-pasadena`
- `relative-vanishing-shifts-imply-l1`
- `rich-archimedean-dominance-independence-imply-simple-eu`
- `rich-simple-dominance-refutes-archimedean-gambles`
- `rich-simple-sure-thing-refutes-countable`
- `shift-scale-imply-positive-affine`
- `shift-transfer-implies-simple-relative`
- `simple-eu-implies-archimedean-outcomes`
- `simple-relative-implies-shift-transfer`
- `simple-relative-l1-imply-relative`
- `sure-thing-to-independence`
- `symmetric-dtu-refutes-independent-sum-candidate`
- `symmetry-evaluates-alternating`
- `symmetry-implies-shift-transfer`
- `symmetry-implies-simple-relative`
- `symmetry-l1-evaluates-arroyo`
- `symmetry-l1-evaluates-pasadena`
- `symmetry-l1-implies-folded`
- `symmetry-l1-implies-relative`
- `symmetry-relative-implies-l1`
- `universal-copula-implies-antitonic`
- `universal-copula-implies-comonotonic`
- `universal-copula-implies-independent`

## Pending model witnesses

- `affine-symmetric-extension`
- `asymmetric-continuous-ultrafilter`
- `cdf-area-preorder`
- `cdf-conclosure-preorder`
- `conjectured-total-comonotonic-area-extension`
- `conjectured-total-independent-sum-extension`
- `eventual-clipped-expectation`
- `finite-support-compensated-dominance`
- `finite-shift-total-extension`
- `finite-two-sample-minimum`
- `geometric-continuous-ultrafilter`
- `lexicographic-folded-extension`
- `lexicographic-nonatomic-mass`
- `polynomial-asymmetric-continuous-ultrafilter`
- `total-continuous-ultrafilter`
- `total-exact-ultrafilter`
