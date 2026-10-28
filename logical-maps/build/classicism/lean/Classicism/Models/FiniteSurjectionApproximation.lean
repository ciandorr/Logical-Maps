import Mathlib.Data.Nat.Nth
import Mathlib.Logic.Equiv.Nat
import Mathlib.Data.Set.Finite.Basic

/-!
# Finite approximations by surjections with controlled fibres

Original metatheoretic helper (misc), 23 October 2026.
Source: research/2026-10-23/finite-compression-labelled-entrance.md,
section 7 (unpaginated). This is a theorem about ordinary sets and maps,
not an additional object-language axiom.
-/

namespace Classicism.Meta.FiniteApproximation

noncomputable section

theorem exists_nat_approximation (S : Set Nat) (hS : S.Finite) (f : Nat → Nat) :
    ∃ j : Nat → Nat, Function.Surjective j ∧
      (∀ x ∈ S, j x = f x) ∧
      ∀ x y, j x = j y → x = y ∨ (x ∈ S ∧ y ∈ S) := by
  classical
  have hE : (f '' S).Finite := hS.image f
  letI : Infinite (Sᶜ : Set Nat) := hS.infinite_compl.to_subtype
  letI : Infinite ((f '' S)ᶜ : Set Nat) := hE.infinite_compl.to_subtype
  let e : (Sᶜ : Set Nat) ≃ ((f '' S)ᶜ : Set Nat) :=
    (Nat.Subtype.orderIsoOfNat _).toEquiv.symm.trans
      (Nat.Subtype.orderIsoOfNat _).toEquiv
  let j : Nat → Nat := fun x => if hx : x ∈ S then f x else (e ⟨x, hx⟩).val
  have hon : ∀ x ∈ S, j x = f x := fun x hx => by simp only [j, dif_pos hx]
  have hoff : ∀ x (hx : x ∉ S), j x = (e ⟨x, hx⟩).val :=
    fun x hx => by simp only [j, dif_neg hx]
  have hout : ∀ x, x ∉ S → j x ∉ f '' S := by
    intro x hx
    rw [hoff x hx]
    exact (e ⟨x, hx⟩).property
  refine ⟨j, ?_, hon, ?_⟩
  · intro y
    by_cases hy : y ∈ f '' S
    · obtain ⟨x, hx, he⟩ := hy
      exact ⟨x, (hon x hx).trans he⟩
    · refine ⟨(e.symm ⟨y, hy⟩).val, ?_⟩
      rw [hoff _ (e.symm ⟨y, hy⟩).property]
      exact congrArg Subtype.val (e.apply_symm_apply ⟨y, hy⟩)
  · intro x y he
    by_cases hx : x ∈ S
    · by_cases hy : y ∈ S
      · exact Or.inr ⟨hx, hy⟩
      · exfalso
        exact hout y hy ⟨x, hx, (hon x hx).symm.trans he⟩
    · by_cases hy : y ∈ S
      · exfalso
        exact hout x hx ⟨y, hy, (hon y hy).symm.trans he.symm⟩
      · left
        have heq : e ⟨x, hx⟩ = e ⟨y, hy⟩ := Subtype.ext (by
          simpa only [hoff x hx, hoff y hy] using he)
        exact congrArg Subtype.val (e.injective heq)

theorem exists_approximation {α : Type} (e : α ≃ Nat)
    (S : Set α) (hS : S.Finite) (f : α → α) :
    ∃ j : α → α, Function.Surjective j ∧
      (∀ x ∈ S, j x = f x) ∧
      ∀ x y, j x = j y → x = y ∨ (x ∈ S ∧ y ∈ S) := by
  classical
  obtain ⟨k, hk, hag, hfib⟩ := exists_nat_approximation (e '' S) (hS.image e)
    (fun n => e (f (e.symm n)))
  let j : α → α := fun x => e.symm (k (e x))
  refine ⟨j, ?_, ?_, ?_⟩
  · intro y
    obtain ⟨n, hn⟩ := hk (e y)
    refine ⟨e.symm n, ?_⟩
    simp only [j, e.apply_symm_apply, hn, e.symm_apply_apply]
  · intro x hx
    have h := hag (e x) ⟨x, hx, rfl⟩
    simpa only [j, e.symm_apply_apply] using congrArg e.symm h
  · intro x y hxy
    have hkxy : k (e x) = k (e y) := e.symm.injective hxy
    rcases hfib (e x) (e y) hkxy with he | ⟨hx, hy⟩
    · exact Or.inl (e.injective he)
    · right
      constructor
      · obtain ⟨z, hz, he⟩ := hx
        exact e.injective he ▸ hz
      · obtain ⟨z, hz, he⟩ := hy
        exact e.injective he ▸ hz

/-- Fixing the finite exceptional fibres and finitely many chosen preimages
lets a surjection descend through the approximating quotient. -/
theorem quotient_fixing {α : Type} {j : α → α} (hj : Function.Surjective j)
    (S : Set α) (hS : S.Finite)
    (hfib : ∀ x y, j x = j y → x = y ∨ (x ∈ S ∧ y ∈ S))
    (T : Set α) (hT : T.Finite) :
    ∃ P : Set α, P.Finite ∧ S ⊆ P ∧
      ∀ u : α → α, Function.Surjective u → (∀ x ∈ P, u x = x) →
        ∃ v : α → α, Function.Surjective v ∧ (∀ t ∈ T, v t = t) ∧
          ∀ x, j (u x) = v (j x) := by
  classical
  let s : α → α := fun y => Classical.choose (hj y)
  have hs : ∀ y, j (s y) = y := fun y => Classical.choose_spec (hj y)
  refine ⟨S ∪ s '' T, hS.union (hT.image s), Set.subset_union_left, ?_⟩
  intro u hu hfix
  have hconst : ∀ x y, j x = j y → j (u x) = j (u y) := by
    intro x y he
    rcases hfib x y he with rfl | ⟨hx, hy⟩
    · rfl
    · rw [hfix x (Or.inl hx), hfix y (Or.inl hy)]
      exact he
  let v : α → α := fun y => j (u (s y))
  have hfactor : ∀ x, j (u x) = v (j x) := by
    intro x
    exact hconst x (s (j x)) (hs (j x)).symm
  refine ⟨v, ?_, ?_, hfactor⟩
  · intro y
    obtain ⟨x, hx⟩ := (hj.comp hu) y
    exact ⟨j x, (hfactor x).symm.trans hx⟩
  · intro t ht
    change j (u (s t)) = t
    rw [hfix (s t) (Or.inr ⟨t, ht, rfl⟩), hs t]

end
end Classicism.Meta.FiniteApproximation
