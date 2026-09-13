# Lean formalisation

All **39 principle nodes** have Lean definitions. All **103 result/model records**
have generated statements. Completed proofs live separately from statements; defining
a proposition does not prove it. See [VERIFICATION.md](VERIFICATION.md) for the audited
coverage and remaining work.

```
UnboundedUtility/Framework.lean   sample space, gambles, mixtures, preferences, partial chart
UnboundedUtility/Numerical.lean   finite-chart gambles, arithmetic, dependence, copulas
UnboundedUtility/Principles.lean  all 39 principle definitions, plus DU and DTU packages
UnboundedUtility/Statements.lean  GENERATED from YAML; do not edit
UnboundedUtility/Proofs.lean      proofs of generated result statements
```

## Checking and certificates

From the project root:

```sh
python3 scripts/pmap.py lean-check unbounded-utility
python3 scripts/pmap.py lean-check unbounded-utility --update
python3 scripts/check_lean_audit.py
```

The first command builds the library and checks every supplied `lean_ref` against its
**generated theorem type**, through an audit-wrapper theorem. It checks that wrapper's
complete axiom dependencies. Any elaboration failure rejects the whole proof batch.
Only `propext`, `Classical.choice`, and `Quot.sound` are allowed: these are the usual
[classical Lean axioms](https://lean-lang.org/doc/reference/latest/Axioms/).
`sorryAx`, custom axioms, missing reports, and incorrectly typed references fail.

`--update` changes certificate metadata only after a successful audit: `verified` for
checked proofs, `stated` for generated statements whose proofs remain pending, and
`none` for records that cannot yet be stated. It never changes mathematical claims or
conjecture status. Conjectures must first be resolved in the database before receiving
a verified proof certificate. The regression script checks real Lean failures, not
just synthetic success messages.

From this directory, `lake build` checks the library. The pinned Lean and Mathlib
versions remain v4.33.1. Dependency caches are excluded from both ZIP downloads.

## Formalisation contract

* Gambles are measurable outcome-valued functions on the unit interval with Lebesgue
  probability measure. They are **not** quotiented by almost-sure equality or by law.
  Stochastic Equivalence remains an optional principle.
* Preference is a preorder and is carried explicitly as `P`. `X ≽[P] Y`, `X ≻[P] Y`,
  and `X ∼[P] Y` mean weak preference, strict preference, and indifference.
* `mix` is randomized selection, not an arithmetic average. Probability-zero and
  probability-one mixtures now equal their selected gambles **pointwise**. Interior
  probabilities retain the original rescaling construction.
* The normalized chart is relational and partial. Every generated universal theorem
  and every model witness now explicitly requires `Pref.Regular`: a standard Borel
  outcome space, measurable order, unique and order-compatible chart coordinates,
  measurable chart domain, and a measurable extension of the coordinates. Values of
  that extension outside the domain do **not** place those outcomes in the chart.
  These are formalisation assumptions, not conclusions proved from the bare preorder.
  They repair the previously unenforced chart contract described in [REVIEW.md](REVIEW.md).
* Rich Outcomes supplies every real level. It does not make every outcome finite.
  Archimedean Outcomes remains a separate axiom. DU uses Rich Outcomes, Archimedean
  Outcomes, Stochastic Equivalence, Stochastic Dominance, and Mixture Independence;
  DTU adds Totality. Neither package silently assumes Simple EU.
* `Numeric P` bundles an actual gamble with measurable finite chart coordinates.
  Affine transformations and sums quantify over explicitly supplied resulting gambles.
  There is no arbitrary default outcome for an unavailable utility level.
* Independent noise is independent of the **pair** `(X,Y)`. Comonotonic and antitonic
  conditions use common uniform representations almost surely. Copula compatibility
  is the recorded joint-CDF equality, permits atoms and nonunique copulas, and never
  identifies the actual gambles. The existential copula is chosen once, outside the
  quantifier over triples.
* Relative expectation requires integrability of the difference. Folded expectation
  requires absolute Lebesgue integrability of the combined tails. CDF areas and L1
  distances use nonnegative extended-real integrals, avoiding accidental `∞ − ∞`
  or an infinite Bochner integral being read as zero. Continuity closes upper sections
  only. Countable Sure-Thing includes finite as well as infinite partitions.

These choices make the theorem types precise. Lean checks proofs of those types; it
does not itself certify the translation from the papers. Difficult representation,
coupling, integral, and model-construction proofs remain explicit work items.
