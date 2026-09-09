import Mathlib

/-!
# The unbounded-utility framework

Lean statement of the setting recorded in `topics/unbounded-utility/background.md`.
Nothing here is a preference axiom: this file fixes only the objects that the topic
treats as standing conventions.

* Gambles are measurable outcome-valued random variables on a fixed atomless standard
  probability space, represented as the unit interval with Lebesgue measure. Richness
  of that space is framework, not a node in the map.
* Gambles are **not** quotiented by almost-sure equality. Equal random variables are
  the same object, but variables with the same law need not be indifferent, so
  Stochastic Equivalence stays an optional axiom.
* `≽` is a preorder and nothing more. Totality is optional.
* The utility chart is **partial and relational**: `Chart` records which real levels a
  given outcome has, calibrated by binary certainty comparisons. It is deliberately not
  a function `O → ℝ`, so that Rich Outcomes and Archimedean Outcomes remain separate.
-/

open MeasureTheory Set
noncomputable section

namespace UnboundedUtility

/-- The sample space fixed by the framework: the unit interval under Lebesgue measure,
atomless and standard. -/
abbrev Sample := unitInterval

instance : IsProbabilityMeasure (volume : Measure Sample) := inferInstance

/-- Clamp a real into the sample space, giving the mixture lift a total definition.
Clamping only ever applies outside the branch where each formula is used. -/
def proj (x : ℝ) : Sample := projIcc 0 1 zero_le_one x

lemma measurable_proj : Measurable proj := by
  unfold proj
  exact continuous_projIcc.measurable

/-- A gamble: an outcome-valued random variable on the fixed sample space. -/
structure Gamble (O : Type*) [MeasurableSpace O] where
  toFun : Sample → O
  measurable' : Measurable toFun

namespace Gamble
variable {O : Type*} [MeasurableSpace O]

instance : CoeFun (Gamble O) (fun _ => Sample → O) := ⟨toFun⟩

@[simp] lemma coe_mk (f : Sample → O) (h) : ((⟨f, h⟩ : Gamble O) : Sample → O) = f := rfl

lemma measurable (X : Gamble O) : Measurable (X : Sample → O) := X.measurable'

@[ext] lemma ext {X Y : Gamble O} (h : ∀ w, X w = Y w) : X = Y := by
  cases X; cases Y; simpa using funext h

/-- The sure gamble on an outcome. -/
def sure (o : O) : Gamble O := ⟨fun _ => o, measurable_const⟩

@[simp] lemma sure_apply (o : O) (w : Sample) : sure o w = o := rfl

/-- The law of a gamble: its distribution over outcomes. -/
def law (X : Gamble O) : Measure O := Measure.map (X : Sample → O) volume

end Gamble

open Gamble

section Mixture
variable {O : Type*} [MeasurableSpace O]

/-- The fixed randomized-selection lift, exactly as written in the background notes:
on `[0, p)` the mixture replays `X` rescaled, elsewhere it replays `Y` rescaled. This is
a randomized selection between the two variables, **not** the pointwise average
`p • X + (1 - p) • Y`. Endpoint conventions are arbitrary and affect a null set. -/
def mixFun (p : ℝ) (X Y : Gamble O) : Sample → O := fun w =>
  if (w : ℝ) < p then X (proj ((w : ℝ) / p)) else Y (proj (((w : ℝ) - p) / (1 - p)))

lemma measurable_mixFun (p : ℝ) (X Y : Gamble O) : Measurable (mixFun p X Y) := by
  have hc : Measurable (fun w : Sample => (w : ℝ)) := measurable_subtype_coe
  refine Measurable.ite (measurableSet_lt hc measurable_const) ?_ ?_
  · exact X.measurable.comp (measurable_proj.comp (hc.div_const p))
  · exact Y.measurable.comp (measurable_proj.comp ((hc.sub_const p).div_const (1 - p)))

/-- `M_p (X, Y)`: a `p` chance of `X` and a `1 - p` chance of `Y`. -/
def mix (p : ℝ) (X Y : Gamble O) : Gamble O := ⟨mixFun p X Y, measurable_mixFun p X Y⟩

@[simp] lemma mix_apply (p : ℝ) (X Y : Gamble O) (w : Sample) :
    mix p X Y w = if (w : ℝ) < p then X (proj ((w : ℝ) / p)) else Y (proj (((w : ℝ) - p) / (1 - p))) :=
  rfl

end Mixture

/-- A preference structure: a preorder on gambles, together with the outcome
conventions the framework fixes. Sure comparisons are required to agree with the
linear order on outcomes, which is what "outcomes are linearly ordered by their sure
comparisons, and sure-indifferent outcomes are identified" amounts to. -/
structure Pref (O : Type*) [MeasurableSpace O] [LinearOrder O] where
  /-- `pref X Y` is `X ≽ Y`. -/
  pref : Gamble O → Gamble O → Prop
  pref_refl : ∀ X, pref X X
  pref_trans : ∀ {X Y Z}, pref X Y → pref Y Z → pref X Z
  /-- The two reference outcomes, written `0` and `1` in the sources. -/
  zero : O
  one : O
  zero_lt_one : zero < one
  /-- The outcome order is Borel, part of "ordered standard Borel outcome space". -/
  measurableSet_Ioi : ∀ o : O, MeasurableSet (Ioi o)
  /-- Sure comparisons are exactly the outcome order. -/
  sure_pref : ∀ a b : O, pref (sure a) (sure b) ↔ b ≤ a

/-- `X ≽[P] Y`: `X` is at least as good as `Y` under `P`.

The preference structure stays an explicit parameter rather than a typeclass. Models in
this topic compare several preference structures on one gamble type, so instance
resolution would silently pick the wrong one. -/
scoped notation:50 X:51 " ≽[" P "] " Y:51 => Pref.pref P X Y

namespace Pref
variable {O : Type*} [MeasurableSpace O] [LinearOrder O] (P : Pref O)

/-- `X ∼[P] Y`: indifference. -/
def Indiff (X Y : Gamble O) : Prop := X ≽[P] Y ∧ Y ≽[P] X

/-- `X ≻[P] Y`: strict preference. -/
def Strict (X Y : Gamble O) : Prop := X ≽[P] Y ∧ ¬ Y ≽[P] X

end Pref

@[inherit_doc Pref.Indiff] scoped notation:50 X:51 " ∼[" P "] " Y:51 => Pref.Indiff P X Y
@[inherit_doc Pref.Strict] scoped notation:50 X:51 " ≻[" P "] " Y:51 => Pref.Strict P X Y

namespace Pref
variable {O : Type*} [MeasurableSpace O] [LinearOrder O] (P : Pref O)

/-- The normalized utility chart, defined relationally by binary certainty comparisons
against the reference outcomes, following background.md. `Chart P o r` says the outcome
`o` sits at level `r`. The three branches are the three ranges of `r`; the better
outcome is placed first in each binary mixture. The chart is partial by design: an
outcome may have no level, and Rich Outcomes is the separate claim that every real
level is occupied. -/
def Chart (o : O) (r : ℝ) : Prop :=
  (0 ≤ r ∧ r ≤ 1 ∧ sure o ∼[P] mix r (sure P.one) (sure P.zero))
  ∨ (1 < r ∧ sure P.one ∼[P] mix (1 / r) (sure o) (sure P.zero))
  ∨ (r < 0 ∧ sure P.zero ∼[P] mix (-r / (1 - r)) (sure P.one) (sure o))


open scoped Classical in
/-- Restriction: `X|E` equals `X` on `E` and the reference outcome `0` off `E`. This is
the sources' definition, not a conditional expectation and not a reranking under a
changed measure. -/
def restr (X : Gamble O) {E : Set Sample} (hE : MeasurableSet E) : Gamble O :=
  ⟨E.piecewise (X : Sample → O) (fun _ => P.zero),
    Measurable.piecewise hE X.measurable measurable_const⟩

/-- The background treats the chart as single-valued wherever it is defined. This is a
framework convention, not a node in the map; record it explicitly rather than assuming
it silently. -/
def ChartSingleValued : Prop := ∀ (o : O) (r s : ℝ), P.Chart o r → P.Chart o s → r = s

end Pref

/-- An outcome space bundled with a preference structure on it. Consistency claims
(the map's models) are existential statements about a `Witness`. -/
structure Witness where
  O : Type
  [meas : MeasurableSpace O]
  [ord : LinearOrder O]
  pref : Pref O

attribute [instance] Witness.meas Witness.ord

/-- A gamble is simple when it takes finitely many outcomes. -/
def Simple {O : Type*} [MeasurableSpace O] (X : Gamble O) : Prop :=
  (range (X : Sample → O)).Finite

end UnboundedUtility
