# Lean formalisation

A Lake project holding the formal counterpart of this topic. It is at **stage one**:
the framework and twelve principles are defined, and statements are generated for every
record they cover. No theorem is proved yet.

```
UnboundedUtility/Framework.lean    the setting: sample space, gambles, mixtures, the chart
UnboundedUtility/Principles.lean   one definition per principle node
UnboundedUtility/Statements.lean   GENERATED from the YAML, do not edit
```

## The point of the generated file

The YAML is the single source of truth for statements. Each principle record names its
Lean definition in `lean_def`. Every result and model statement is then assembled by
`pmap lean` from that record's premises and conclusion. To prove a result you inhabit the
generated `Prop`, so a Lean proof cannot silently drift from the claim the map displays.
Regenerate after changing any record.

`pmap lean-check` builds the library, then asks Lean itself which claimed proofs really
inhabit their generated statement and whether they depend on `sorryAx`. A record may only
say `lean: verified` if that check passes. `lean: stated` means the statement elaborates
and the proof is still missing.

## Deliberate modelling choices

* The sample space is fixed as the unit interval under Lebesgue measure. Its richness is
  framework here, not a principle node, so it is not an axiom you can drop.
* Gambles are **not** quotiented by almost-sure equality. Same-law variables stay distinct
  objects, which is what keeps Stochastic Equivalence an optional axiom.
* The utility chart is partial and relational, `Chart P o r`, calibrated by binary
  certainty comparisons. It is deliberately not a function `O → ℝ`, so Rich Outcomes and
  Archimedean Outcomes stay separate nodes.
* The mixture is the fixed randomized-selection lift written in `background.md`, not a
  pointwise average.
* `Pref.ChartSingleValued` records the background's convention that the chart is
  single-valued where defined. It is stated but never assumed; decide whether it belongs
  in the framework before proving anything that needs it.

## Commands

```sh
lake update && lake build          # first run fetches Mathlib
python3 ../../../scripts/pmap.py lean-check unbounded-utility
```
