import Classicism.Models.FiniteCompressionBase
import Classicism.Models.FiniteSurjectionApproximation

/-!
# Approximate entrance maps with finite quotient control

Original formalization (misc), 23 October 2026.
Source: research/2026-10-23/finite-compression-labelled-entrance.md,
section 7 (unpaginated).
-/

namespace Classicism.Meta.Intensional.FiniteCompression

open CategoryTheory
noncomputable section

def outArrow (V : cat.Ob) (f : Point → Point) (hf : Function.Surjective f) : A ⟶ V :=
  match V with
  | .A => mkRoot f hf
  | .B => mkEntrance f hf

@[simp] theorem fn_outArrow (V : cat.Ob) (f : Point → Point)
    (hf : Function.Surjective f) (x : Point) :
    FunCat.fn (outArrow V f hf) x = point V (f x) := by
  cases V <;> rfl

def pointEnd (V : cat.Ob) (f : Point → Point) (hf : Function.Surjective f) : V ⟶ V :=
  match V with
  | .A => mkRoot f hf
  | .B => topTail f hf

@[simp] theorem fn_pointEnd (V : cat.Ob) (f : Point → Point)
    (hf : Function.Surjective f) (x : Point) :
    FunCat.fn (pointEnd V f hf) (point V x) = point V (f x) := by
  cases V <;> rfl

/-- The target finite pin is explicitly on the old point component. The
factorization is along a finite approximation j, not the original arrow h. -/
theorem root_approximation {V : cat.Ob} (h : A ⟶ V)
    (S : Set Point) (hS : S.Finite) (T : Set Point) (hT : T.Finite) :
    ∃ j : A ⟶ V, AgreeOn cat.De (W := A) S j h ∧
      ∃ P : Set Point, P.Finite ∧ S ⊆ P ∧
        ∀ u : A ⟶ A, AgreeOn cat.De (W := A) P u (𝟙 A) →
          ∃ v : V ⟶ V, AgreeOn cat.De (W := V) (point V '' T) v (𝟙 V) ∧
            u ≫ j = j ≫ v := by
  obtain ⟨f, hf, hag, hfib⟩ := FiniteApproximation.exists_approximation
    Nat.pairEquiv S hS (pointMap h)
  obtain ⟨P, hP, hSP, hquot⟩ :=
    FiniteApproximation.quotient_fixing hf S hS hfib T hT
  refine ⟨outArrow V f hf, ?_, P, hP, hSP, ?_⟩
  · intro x hx
    change FunCat.fn (outArrow V f hf) x = FunCat.fn h x
    exact (fn_outArrow V f hf x).trans
      ((congrArg (point V) (hag x hx)).trans (fn_point h x).symm)
  · intro u hu
    obtain ⟨g, hg, hfix, hfactor⟩ := hquot (FunCat.fn u) u.2 hu
    refine ⟨pointEnd V g hg, ?_, ?_⟩
    · rintro _ ⟨x, hx, rfl⟩
      change FunCat.fn (pointEnd V g hg) (point V x) = point V x
      rw [fn_pointEnd, hfix x hx]
    · apply FunCat.hom_ext
      funext x
      change FunCat.fn (outArrow V f hf) (FunCat.fn u x) =
        FunCat.fn (pointEnd V g hg) (FunCat.fn (outArrow V f hf) x)
      calc
        FunCat.fn (outArrow V f hf) (FunCat.fn u x) =
            point V (f (FunCat.fn u x)) := fn_outArrow V f hf _
        _ = point V (g (f x)) := congrArg (point V) (hfactor x)
        _ = FunCat.fn (pointEnd V g hg) (point V (f x)) :=
          (fn_pointEnd V g hg (f x)).symm
        _ = FunCat.fn (pointEnd V g hg) (FunCat.fn (outArrow V f hf) x) :=
          congrArg (FunCat.fn (pointEnd V g hg)) (fn_outArrow V f hf x).symm

end
end Classicism.Meta.Intensional.FiniteCompression
