# Foundation review — 9 September 2026

Reviewed by Codex at Zach's request, before commissioning formalization agents.
This is a code and semantics review, not certification of the mathematical results.

**Verdict: the project builds, but repair the foundation contract and verification
gate before a large proof campaign.** The existing architecture is useful: genuine
random variables, optional Stochastic Equivalence, an explicit preference parameter,
separate Rich/Archimedean Outcomes, and statements generated from the database.
No existing Lean definitions or mathematical records were changed during this review.

## 1. Enforce the stated chart conventions

`Framework.lean` defines `Pref.ChartSingleValued` but neither `Pref`, `Witness`, nor
the generated theorem statements require it. The background also promises a
measurable, order-compatible partial chart; those requirements are absent too.
`SimpleEU` and `ExpectedUtility` supply a measurable chart selection only when those
particular principles are assumed.

This is a substantive mismatch, not merely a missing lemma. On real outcomes,
ranking gambles by their value at sample point 0 satisfies the current `Pref`
fields. Under that preference, outcome 1 has both chart coordinates 1/2 and 1:
both binary mixtures return 1 at sample point 0. Thus chart uniqueness does not
follow from the current standing assumptions.

Specify the partial chart's domain, uniqueness, measurability and order compatibility
in an explicit framework contract, and carry it through both universal statements
and model witnesses. Keep chart surjectivity and totality separate so that Rich
Outcomes and Archimedean Outcomes retain their intended distinction.

## 2. Supply the intended outcome-space structure

The background says "ordered standard Borel outcome space". The Lean definitions
quantify over an arbitrary `MeasurableSpace` and `LinearOrder`; `Pref` only adds
measurability of upper rays. There is no standard-Borel requirement. Measurable
upper rays alone do not state the full background contract, including the joint
order measurability needed for comparisons of two outcome-valued variables.

Choose the precise outcome-space interface before coupling, rearrangement and
model-construction proofs. Use that interface consistently in principles, generated
statements and witnesses. Replacing the outcome type with real numbers would lose
the distinction between the two outcome principles.

## 3. Settle degenerate mixture endpoints

The current rescaling definition gives

```lean
mix 1 (Gamble.sure (1 : ℝ)) (Gamble.sure 0) (1 : Sample) = 0
```

so `mix 1 X Y = X` does not hold pointwise. This matches the background's permission
to choose arbitrary null-set endpoint values, but that permission is consequential
when almost-sure indifference is optional. In particular, the chart uses probability
1: a preference evaluating sample point 1 does not give the reference outcome 1
chart coordinate 1 under the current definition.

Make `mix 0 X Y = Y` and `mix 1 X Y = X` exact, or explicitly change the chart's
endpoint clauses and document the remaining convention. Do not justify preference
equalities merely by saying that the exceptional event has probability zero.

## 4. Make the verification gate reject failed checks

In `scripts/pmap.py`, `lean_check` prints a failed probe's diagnostics but continues
to accept references whose `#print axioms` output excludes `sorryAx`. For example:

```lean
example : UnboundedUtility.Statements.totality_restricts := True.intro
#print axioms True.intro
```

Lean rejects the example's type, yet reports that `True.intro` has no axioms. The
current parser treats the latter as a positive verdict and does not incorporate the
failed process exit status into that verdict. A wrongly typed reference marked
`verified` can consequently escape rejection.

Fail the audit when a proof probe fails to elaborate; preferably check and report
each reference separately. Parse the complete axiom dependencies and explicitly
reject unapproved custom axioms as well as `sorryAx` (while permitting agreed
standard Lean axioms). Otherwise an unproved result introduced as a custom `axiom`
could also be reported as verified. Add regression checks for a wrong-type reference,
`sorry`, a custom axiom and a valid proof before relying on this gate for agents.

## Current coverage and checks

- `lake build` succeeds with the pinned Lean/Mathlib v4.33.1 setup.
- `pmap lean-check unbounded-utility` reports 12 generated statements out of 61
  result/model records, all 12 still unproved. Another 24 principle definitions
  are needed to state the remaining 49 records.
- No existing result or model claims `lean: verified`; the gate flaw has not
  invalidated any currently claimed formal certificates.
- The project-owned Lean sources contain no `sorry` or custom `axiom` declarations.
- An isolated Lean diagnostic compiled proofs of the mixture endpoint value above,
  the two chart coordinates under evaluation at 0, failure of chart single-valuedness,
  and failure of the reference outcome's coordinate 1 under evaluation at 1.
- An isolated wrong-type probe produced both the expected Lean type error and the
  axiom-free `True.intro` message, confirming the verification parser's failure case.

After the repairs, establish a small end-to-end example: one proved implication,
one implication to `False`, and one model with a proved violation, all checked
against their generated statements. Then divide independent proof modules among
agents while one owner controls the shared framework and principle definitions.


## Follow-up — 10 September 2026

The proof campaign addressed the four foundation/gate issues above:

1. `Pref.Regular` now carries chart uniqueness, order compatibility, measurability,
   and its measurable domain, and is required by generated theorems and `Witness`.
2. That contract also supplies standard-Borel and measurable-order requirements.
3. Mixtures at probabilities 0 and 1 now select the corresponding gamble pointwise;
   `mix_zero`, `mix_one`, `chart_zero`, and `chart_one` are proved in the framework.
4. The audit checks wrapper theorems at generated types, rejects any failed batch,
   and permits only the three standard classical axioms. Actual Lean regression
   cases cover valid proofs, wrong types, `sorry`, custom axioms, and batch failures.

All principle definitions and record statements are now present. Current proof
coverage and unresolved scope issues are recorded in [VERIFICATION.md](VERIFICATION.md).
The historical observations above describe the pre-campaign files, not the current
implementation. No model witness or implication to False has yet been certified.
