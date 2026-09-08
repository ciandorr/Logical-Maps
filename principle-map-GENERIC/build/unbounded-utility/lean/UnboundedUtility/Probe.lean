import Mathlib

open MeasureTheory
noncomputable section

example : MeasureSpace unitInterval := inferInstance
example : IsProbabilityMeasure (volume : Measure unitInterval) := inferInstance
example : NullSingletonClass (volume : Measure unitInterval) := inferInstance

-- law of a random variable
example (O : Type) [MeasurableSpace O] (X : unitInterval → O) : Measure O := Measure.map X volume
-- expectation
example (X : unitInterval → ℝ) : ℝ := ∫ w, X w
example (X : unitInterval → ℝ) : Prop := Integrable X volume
-- finite range as "simple"
example (O : Type) (X : unitInterval → O) : Prop := (Set.range X).Finite
-- coercion of a real into the interval when in range
example (p : ℝ) (h : p ∈ Set.Icc (0:ℝ) 1) : unitInterval := ⟨p, h⟩
example (w : unitInterval) : ℝ := (w : ℝ)
