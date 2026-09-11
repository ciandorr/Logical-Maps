import UnboundedUtility.Numerical

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
  ∀ a b c : O, sure a ≻[P] sure b → sure b ≻[P] sure c →
    ∃ p : ℝ, 0 < p ∧ p < 1 ∧ sure b ∼[P] mix p (sure a) (sure c)

/-- **Totality.** Any two gambles are comparable. -/
def Totality (P : Pref O) : Prop := ∀ X Y : Gamble O, X ≽[P] Y ∨ Y ≽[P] X

/-- **Restricted Totality.** Any two simple gambles are comparable. -/
def RestrictedTotality (P : Pref O) : Prop :=
  ∀ X Y : Gamble O, Simple X → Simple Y → X ≽[P] Y ∨ Y ≽[P] X

/-- **Stochastic Equivalence.** Same law implies indifference. The variables remain
distinct objects; this is an additional axiom, not a definition. -/
def StochasticEquivalence (P : Pref O) : Prop :=
  ∀ X Y : Gamble O, X.law = Y.law → X ∼[P] Y

/-- **Restricted Stochastic Equivalence.** The same, for simple gambles only. -/
def RestrictedStochasticEquivalence (P : Pref O) : Prop :=
  ∀ X Y : Gamble O, Simple X → Simple Y → X.law = Y.law → X ∼[P] Y

/-- **Simple Expected Utility.** The chart is total and measurable, and ranks every pair
of simple gambles by expected utility. Surjectivity is deliberately not included; that is
Rich Outcomes. -/
def SimpleEU (P : Pref O) : Prop :=
  ∃ u : O → ℝ, Measurable u ∧ (∀ o : O, P.Chart o (u o)) ∧
    ∀ X Y : Gamble O, Simple X → Simple Y →
      (X ≽[P] Y ↔ ∫ w, u (Y w) ≤ ∫ w, u (X w))

/-- **Expected Utility.** The chart is total and measurable, and ranks gambles by
expectation whenever both are integrable. Expectations are finite Lebesgue expectations:
this says nothing about two infinite expectations or conditionally convergent sums. -/
def ExpectedUtility (P : Pref O) : Prop :=
  ∃ u : O → ℝ, Measurable u ∧ (∀ o : O, P.Chart o (u o)) ∧
    ∀ X Y : Gamble O, Integrable (fun w => u (X w)) → Integrable (fun w => u (Y w)) →
      (X ≽[P] Y ↔ ∫ w, u (Y w) ≤ ∫ w, u (X w))

/-- **Stochastic Dominance.** Weak dominance of upper tails gives `≽`, and one strict
tail inequality gives `≻`. Thresholds use the sure-outcome order. -/
def StochasticDominance (P : Pref O) : Prop :=
  ∀ X Y : Gamble O, (∀ o : O, volume {w | o < Y w} ≤ volume {w | o < X w}) →
    X ≽[P] Y ∧ ((∃ o : O, volume {w | o < Y w} < volume {w | o < X w}) → X ≻[P] Y)

/-- **Statewise Dominance.** Almost-sure pointwise dominance gives `≽`, and a positive
chance of strict improvement gives `≻`. -/
def StatewiseDominance (P : Pref O) : Prop :=
  ∀ X Y : Gamble O, (∀ᵐ w, Y w ≤ X w) →
    X ≽[P] Y ∧ (0 < volume {w | Y w < X w} → X ≻[P] Y)

/-- **Mixture Independence.** Mixing a common component in on both sides preserves and
reflects the comparison. `mix` is randomized selection, so this is not a statement about
pointwise averages. -/
def MixtureIndependence (P : Pref O) : Prop :=
  ∀ (X Y Z : Gamble O) (p : ℝ), 0 < p → p < 1 →
    (X ≽[P] Y ↔ mix p X Z ≽[P] mix p Y Z)

/-- **Sure-Thing.** If two gambles are indifferent on an event, the comparison is settled
on its complement. `X|E` is `X` on `E` and sure `0` elsewhere. -/
def SureThing (P : Pref O) : Prop :=
  ∀ (X Y : Gamble O) {E : Set Sample} (hE : MeasurableSet E),
    0 < volume E → volume E < 1 →
      P.restr X hE ∼[P] P.restr Y hE →
        (X ≽[P] Y ↔ P.restr X hE.compl ≽[P] P.restr Y hE.compl)

/-- **DU**, with Simple EU derived rather than assumed. -/
def DU (P : Pref O) : Prop :=
  RichOutcomes P ∧ ArchimedeanOutcomes P ∧ StochasticEquivalence P ∧
    StochasticDominance P ∧ MixtureIndependence P

/-- **DTU** adds Totality for arbitrary gambles to DU. -/
def DTU (P : Pref O) : Prop := DU P ∧ Totality P

/-- Archimedean continuity over arbitrary gambles. -/
def ArchimedeanGambles (P : Pref O) : Prop :=
  ∀ X Y Z : Gamble O, X ≻[P] Y → Y ≻[P] Z →
    ∃ p : ℝ, 0 < p ∧ p < 1 ∧ Y ∼[P] mix p X Z

/-- All countable measurable partitions, including finite ones; restriction retains
zero off the event, and is not conditioning or renormalization. -/
def CountableSureThing (P : Pref O) : Prop :=
  ∀ (I : Type) [Countable I] (E : I → Set Sample) (hE : ∀ i, MeasurableSet (E i)),
    Pairwise (fun i j => Disjoint (E i) (E j)) → (⋃ i, E i) = univ →
    (∀ i, 0 < volume (E i)) → ∀ X Y : Gamble O,
    (∀ i, P.restr X (hE i) ≽[P] P.restr Y (hE i)) →
      X ≽[P] Y ∧ ((∃ i, P.restr X (hE i) ≻[P] P.restr Y (hE i)) → X ≻[P] Y)

def PositiveAffineInvariance (P : Pref O) : Prop :=
  ∀ (X Y X' Y' : Numeric P) (a b : ℝ), 0 < a →
    X.Affine X' a b → Y.Affine Y' a b →
      (X.gamble ≽[P] Y.gamble ↔ X'.gamble ≽[P] Y'.gamble)

def NegativeAffineAntiInvariance (P : Pref O) : Prop :=
  ∀ (X Y X' Y' : Numeric P) (a b : ℝ), 0 < a →
    X.Affine X' (-a) b → Y.Affine Y' (-a) b →
      (X.gamble ≽[P] Y.gamble ↔ Y'.gamble ≽[P] X'.gamble)

def ShiftInvariance (P : Pref O) : Prop :=
  ∀ (X Y X' Y' : Numeric P) (b : ℝ), X.Affine X' 1 b → Y.Affine Y' 1 b →
    (X.gamble ≽[P] Y.gamble ↔ X'.gamble ≽[P] Y'.gamble)

def ScaleInvariance (P : Pref O) : Prop :=
  ∀ (X Y X' Y' : Numeric P) (a : ℝ), 0 < a → X.Affine X' a 0 → Y.Affine Y' a 0 →
    (X.gamble ≽[P] Y.gamble ↔ X'.gamble ≽[P] Y'.gamble)

def ReflectionAntiInvariance (P : Pref O) : Prop :=
  ∀ (X Y X' Y' : Numeric P), X.Affine X' (-1) 0 → Y.Affine Y' (-1) 0 →
    (X.gamble ≽[P] Y.gamble ↔ Y'.gamble ≽[P] X'.gamble)

/-- Both weak and strict forward preservation are required. -/
def IndependentSumPreservation (P : Pref O) : Prop :=
  ∀ X Y Z XZ YZ : Numeric P, X.Sum Z XZ → Y.Sum Z YZ → X.IndependentNoise Y Z →
    (X.gamble ≽[P] Y.gamble → XZ.gamble ≽[P] YZ.gamble) ∧
    (X.gamble ≻[P] Y.gamble → XZ.gamble ≻[P] YZ.gamble)

def IndependentSumCancellation (P : Pref O) : Prop :=
  ∀ X Y Z XZ YZ : Numeric P, X.Sum Z XZ → Y.Sum Z YZ → X.IndependentNoise Y Z →
    (XZ.gamble ≽[P] YZ.gamble → X.gamble ≽[P] Y.gamble)

def IndependentSumConsistency (P : Pref O) : Prop :=
  ∀ X Y Z XZ YZ : Numeric P, X.Sum Z XZ → Y.Sum Z YZ → X.IndependentNoise Y Z →
    (X.gamble ≽[P] Y.gamble ↔ XZ.gamble ≽[P] YZ.gamble)

def FullSumConsistency (P : Pref O) : Prop :=
  ∀ X Y Z XZ YZ : Numeric P, X.Sum Z XZ → Y.Sum Z YZ →
    (X.gamble ≽[P] Y.gamble ↔ XZ.gamble ≽[P] YZ.gamble)

def ComonotonicSumConsistency (P : Pref O) : Prop :=
  ∀ X Y Z XZ YZ : Numeric P, X.Sum Z XZ → Y.Sum Z YZ →
    X.Comonotonic Z → Y.Comonotonic Z →
      (X.gamble ≽[P] Y.gamble ↔ XZ.gamble ≽[P] YZ.gamble)

def AntitonicSumConsistency (P : Pref O) : Prop :=
  ∀ X Y Z XZ YZ : Numeric P, X.Sum Z XZ → Y.Sum Z YZ →
    X.Antitonic Z → Y.Antitonic Z →
      (X.gamble ≽[P] Y.gamble ↔ XZ.gamble ≽[P] YZ.gamble)

/-- A *single fixed* copula is used by both pairs and by every eligible triple. -/
def CopulaSumConsistency (P : Pref O) (C : Copula) : Prop :=
  ∀ X Y Z XZ YZ : Numeric P, X.Sum Z XZ → Y.Sum Z YZ → C.Admits X Z → C.Admits Y Z →
    (X.gamble ≽[P] Y.gamble ↔ XZ.gamble ≽[P] YZ.gamble)

def ExistentialCopulaSumConsistency (P : Pref O) : Prop := ∃ C, CopulaSumConsistency P C

def UniversalCopulaSumConsistency (P : Pref O) : Prop := ∀ C, CopulaSumConsistency P C

def RelativeExpectation (P : Pref O) : Prop :=
  ∀ X Y : Numeric P, Integrable (fun w => X.utility w - Y.utility w) →
    (X.gamble ≽[P] Y.gamble ↔ 0 ≤ ∫ w, X.utility w - Y.utility w)

def SimpleRelativeExpectation (P : Pref O) : Prop :=
  ∀ X Y : Numeric P, (range (fun w => X.utility w - Y.utility w)).Finite →
    (X.gamble ≽[P] Y.gamble ↔ 0 ≤ ∫ w, X.utility w - Y.utility w)

/-- Absolute Lebesgue integrability of the *combined* tail difference. -/
def FoldedExpectation (P : Pref O) : Prop :=
  ∀ X Y : Numeric P, IntegrableOn X.foldedTail (Ici 0) → IntegrableOn Y.foldedTail (Ici 0) →
    (X.gamble ≽[P] Y.gamble ↔ (∫ t in Ici 0, Y.foldedTail t) ≤ ∫ t in Ici 0, X.foldedTail t)

/-- No subtraction of infinities: areas are nonnegative extended-real integrals. -/
def CDFAreaExtension (P : Pref O) : Prop :=
  ∃ u : O → ℝ, Measurable u ∧ (∀ o, P.Chart o (u o)) ∧
    ∀ X Y : Gamble O,
      let d := fun t : ℝ => (volume {w | t < u (X w)}).toReal -
        (volume {w | t < u (Y w)}).toReal
      let pos := ∫⁻ t, ENNReal.ofReal (d t)
      let neg := ∫⁻ t, ENNReal.ofReal (-d t)
      (pos ≠ ⊤ ∨ neg ≠ ⊤) → (X ≽[P] Y ↔ neg ≤ pos)

/-- Only upper sections are closed; distance is the actual-coupling extended L1 distance. -/
def L1Continuity (P : Pref O) : Prop :=
  ∀ (Xs : ℕ → Numeric P) (X Y : Numeric P),
    Filter.Tendsto (fun n => (Xs n).distance X) Filter.atTop (nhds 0) →
    (∀ n, (Xs n).gamble ≽[P] Y.gamble) → X.gamble ≽[P] Y.gamble

/-- Every positive shift must be available and dominate Y; no shift-invariance assumed. -/
def VanishingShiftContinuity (P : Pref O) : Prop :=
  ∀ X Y : Numeric P,
    (∀ ε : ℝ, 0 < ε → ∃ X' : Numeric P, X.Affine X' 1 ε ∧ X'.gamble ≽[P] Y.gamble) →
    X.gamble ≽[P] Y.gamble

def ShiftTransfer (P : Pref O) : Prop :=
  ∀ (X Y X' Y' : Numeric P) (b p : ℝ), 0 < p → p < 1 →
    X.Affine X' 1 (b / p) → Y.Affine Y' 1 (b / (1 - p)) →
      mix p X'.gamble Y.gamble ∼[P] mix p X.gamble Y'.gamble

def SymmetricNeutrality (P : Pref O) : Prop :=
  ∀ X : Numeric P, Measure.map X.utility volume = Measure.map (fun w => -X.utility w) volume →
    X.gamble ∼[P] sure P.zero

/-- Uniqueness in preference value, without assuming existence of a fixed point. -/
def NegativeSelfSimilarity (P : Pref O) : Prop :=
  ∀ (X Y X' Y' : Numeric P) (Z : Gamble O) (p a b : ℝ), 0 < p → p < 1 → 0 < a →
    X.Affine X' (-a) b → Y.Affine Y' (-a) b →
    X.gamble ∼[P] mix p X'.gamble Z →
    Y.gamble ∼[P] mix p Y'.gamble Z → X.gamble ∼[P] Y.gamble

/-- Discrete laws use indices n+1, so the displayed masses begin at n=1. -/
def DiscreteValue (P : Pref O) (values weights : ℕ → ℝ) (value : ℝ) : Prop :=
  ∀ (X : Numeric P) (o : O), P.Chart o value →
    (∀ n : ℕ, volume {w | X.utility w = values (n + 1)} = ENNReal.ofReal (weights (n + 1))) →
    X.gamble ∼[P] sure o

def AlternatingStPetersburgValue (P : Pref O) : Prop :=
  DiscreteValue P (fun n => (-2 : ℝ)^n) (fun n => (2 : ℝ)^(-(n : ℤ))) (-1 / 2)

def PasadenaValue (P : Pref O) : Prop :=
  DiscreteValue P (fun n => -(-2 : ℝ)^n / n) (fun n => (2 : ℝ)^(-(n : ℤ))) (Real.log 2)

def ArroyoValue (P : Pref O) : Prop :=
  DiscreteValue P (fun n => (-1 : ℝ)^(n+1) * (n+1)) (fun n => 1 / ((n : ℝ) * (n+1))) (Real.log 2)

end UnboundedUtility
