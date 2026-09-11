import UnboundedUtility.Framework

/-!
# Finite-chart gambles and dependence

Arithmetic is a relation between actual outcome-valued gambles. A transformation is
eligible only when its resulting outcome-valued gamble exists. We neither identify
same-law variables nor assume the chart covers all outcomes or all real numbers.
-/

open MeasureTheory Set
open scoped ENNReal
noncomputable section
namespace UnboundedUtility
variable {O : Type*} [MeasurableSpace O] [LinearOrder O]

/-- An actual gamble with a measurable, pointwise finite utility coordinate. -/
structure Numeric (P : Pref O) where
  gamble : Gamble O
  utility : Sample → ℝ
  measurable : Measurable utility
  chart : ∀ w, P.Chart (gamble w) (utility w)

namespace Numeric
variable {P : Pref O}

/-- Pointwise affine transformation, with the transformed gamble explicitly supplied. -/
def Affine (X X' : Numeric P) (a b : ℝ) : Prop :=
  ∀ w, X'.utility w = a * X.utility w + b

/-- Pointwise utility sum, with its outcome-valued realization explicitly supplied. -/
def Sum (X Z XZ : Numeric P) : Prop := ∀ w, XZ.utility w = X.utility w + Z.utility w

/-- Independence of the noise from the *pair*, not merely pairwise independence. -/
def IndependentNoise (X Y Z : Numeric P) : Prop :=
  ProbabilityTheory.IndepFun Z.utility (fun w => (X.utility w, Y.utility w)) volume

/-- Common uniform representation. Equalities hold almost surely, including atoms. -/
def Comonotonic (X Z : Numeric P) : Prop :=
  ∃ U : Sample → Sample, Measurable U ∧ Measure.map U volume = volume ∧
    ∃ f g : Sample → ℝ, Measurable f ∧ Measurable g ∧ Monotone f ∧ Monotone g ∧
      (∀ᵐ w, X.utility w = f (U w)) ∧ (∀ᵐ w, Z.utility w = g (U w))

def Antitonic (X Z : Numeric P) : Prop :=
  ∃ U : Sample → Sample, Measurable U ∧ Measure.map U volume = volume ∧
    ∃ f g : Sample → ℝ, Measurable f ∧ Measurable g ∧ Monotone f ∧ Antitone g ∧
      (∀ᵐ w, X.utility w = f (U w)) ∧ (∀ᵐ w, Z.utility w = g (U w))

def cdf (X : Numeric P) (t : ℝ) : ℝ := (volume {w | X.utility w ≤ t}).toReal

def foldedTail (X : Numeric P) (t : ℝ) : ℝ :=
  (volume {w | t < X.utility w}).toReal - (volume {w | X.utility w < -t}).toReal

/-- Extended L1 distance; infinite distances are not silently turned into zero. -/
def distance (X Y : Numeric P) : ℝ≥0∞ :=
  ∫⁻ w, ENNReal.ofReal |X.utility w - Y.utility w|

end Numeric

/-- A Borel probability measure on the unit square with uniform marginals. -/
structure Copula where
  measure : Measure (Sample × Sample)
  probability : IsProbabilityMeasure measure
  fst_uniform : Measure.map Prod.fst measure = volume
  snd_uniform : Measure.map Prod.snd measure = volume

namespace Copula

def cdf (C : Copula) (u v : ℝ) : ℝ :=
  (C.measure {w | (w.1 : ℝ) ≤ u ∧ (w.2 : ℝ) ≤ v}).toReal

/-- Compatibility, not a uniquely assigned copula. This handles atomic marginals. -/
def Admits {P : Pref O} (C : Copula) (X Z : Numeric P) : Prop :=
  ∀ a b : ℝ, (volume {w | X.utility w ≤ a ∧ Z.utility w ≤ b}).toReal =
    C.cdf (X.cdf a) (Z.cdf b)

end Copula
end UnboundedUtility
