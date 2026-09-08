import UnboundedUtility.Framework

/-!
# Principles

One Lean definition per principle node in `topics/unbounded-utility/principles/`. Each
`def` is the formal counterpart of that record's `statement` field and is referenced from
the YAML by `lean_def`. Nothing here is proved; these are statements only.
-/

open MeasureTheory Set UnboundedUtility.Gamble
noncomputable section

namespace UnboundedUtility

variable {O : Type*} [MeasurableSpace O] [LinearOrder O]

/-- **Rich Outcomes.** Every real number occurs as the utility level of a sure outcome.
This does not assert that every outcome has a finite level. -/
def RichOutcomes (P : Pref O) : Prop := ∀ r : ℝ, ∃ o : O, P.Chart o r

/-- **Archimedean Outcomes.** For sure outcomes `a ≻ b ≻ c`, some nontrivial mixture of
the outer two is equally good as the middle one. Only the three inputs are sure
outcomes; this is the no-infinite-ratios condition, not continuity over gambles. -/
def ArchimedeanOutcomes (P : Pref O) : Prop :=
  ∀ a b c : O, P.Strict (sure a) (sure b) → P.Strict (sure b) (sure c) →
    ∃ p : ℝ, 0 < p ∧ p < 1 ∧ P.Indiff (sure b) (mix p (sure a) (sure c))

/-- **Totality.** Any two gambles are comparable. -/
def Totality (P : Pref O) : Prop := ∀ X Y : Gamble O, P.pref X Y ∨ P.pref Y X

/-- **Restricted Totality.** Any two simple gambles are comparable. -/
def RestrictedTotality (P : Pref O) : Prop :=
  ∀ X Y : Gamble O, Simple X → Simple Y → P.pref X Y ∨ P.pref Y X

/-- **Stochastic Equivalence.** Same law implies indifference. The variables remain
distinct objects; this is an additional axiom, not a definition. -/
def StochasticEquivalence (P : Pref O) : Prop :=
  ∀ X Y : Gamble O, X.law = Y.law → P.Indiff X Y

/-- **Restricted Stochastic Equivalence.** The same, for simple gambles only. -/
def RestrictedStochasticEquivalence (P : Pref O) : Prop :=
  ∀ X Y : Gamble O, Simple X → Simple Y → X.law = Y.law → P.Indiff X Y

/-- **Simple Expected Utility.** The chart is total and measurable, and ranks every pair
of simple gambles by expected utility. Surjectivity is deliberately not included; that is
Rich Outcomes. -/
def SimpleEU (P : Pref O) : Prop :=
  ∃ u : O → ℝ, Measurable u ∧ (∀ o : O, P.Chart o (u o)) ∧
    ∀ X Y : Gamble O, Simple X → Simple Y →
      (P.pref X Y ↔ ∫ w, u (Y w) ≤ ∫ w, u (X w))

/-- **Expected Utility.** The chart is total and measurable, and ranks gambles by
expectation whenever both are integrable. Expectations are finite Lebesgue expectations:
this says nothing about two infinite expectations or conditionally convergent sums. -/
def ExpectedUtility (P : Pref O) : Prop :=
  ∃ u : O → ℝ, Measurable u ∧ (∀ o : O, P.Chart o (u o)) ∧
    ∀ X Y : Gamble O, Integrable (fun w => u (X w)) → Integrable (fun w => u (Y w)) →
      (P.pref X Y ↔ ∫ w, u (Y w) ≤ ∫ w, u (X w))

/-- **Stochastic Dominance.** Weak dominance of upper tails gives `≽`, and one strict
tail inequality gives `≻`. Thresholds use the sure-outcome order. -/
def StochasticDominance (P : Pref O) : Prop :=
  ∀ X Y : Gamble O, (∀ o : O, volume {w | o < Y w} ≤ volume {w | o < X w}) →
    P.pref X Y ∧ ((∃ o : O, volume {w | o < Y w} < volume {w | o < X w}) → P.Strict X Y)

/-- **Statewise Dominance.** Almost-sure pointwise dominance gives `≽`, and a positive
chance of strict improvement gives `≻`. -/
def StatewiseDominance (P : Pref O) : Prop :=
  ∀ X Y : Gamble O, (∀ᵐ w, Y w ≤ X w) →
    P.pref X Y ∧ (0 < volume {w | Y w < X w} → P.Strict X Y)

/-- **Mixture Independence.** Mixing a common component in on both sides preserves and
reflects the comparison. `mix` is randomized selection, so this is not a statement about
pointwise averages. -/
def MixtureIndependence (P : Pref O) : Prop :=
  ∀ (X Y Z : Gamble O) (p : ℝ), 0 < p → p < 1 →
    (P.pref X Y ↔ P.pref (mix p X Z) (mix p Y Z))

/-- **Sure-Thing.** If two gambles are indifferent on an event, the comparison is settled
on its complement. `X|E` is `X` on `E` and sure `0` elsewhere. -/
def SureThing (P : Pref O) : Prop :=
  ∀ (X Y : Gamble O) {E : Set Sample} (hE : MeasurableSet E),
    0 < volume E → volume E < 1 →
      P.Indiff (P.restr X hE) (P.restr Y hE) →
        (P.pref X Y ↔ P.pref (P.restr X hE.compl) (P.restr Y hE.compl))

/-- **DTU**, the axiom package the 2026 paper assumes, as expanded in background.md.
Preordering and the full random-variable domain are framework, not listed here. -/
def DTU (P : Pref O) : Prop :=
  RichOutcomes P ∧ Totality P ∧ StochasticEquivalence P ∧ SimpleEU P ∧
    StochasticDominance P ∧ MixtureIndependence P

end UnboundedUtility
