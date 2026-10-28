import Classicism.Models.SymBase
import Mathlib.Data.Nat.ModEq

/-!
# The concrete qualitative-link pinning category

Base 3 from `models/symmetric-qualitative-links.yaml`: Cian Dorr,
*Boolean Completeness does not imply Rigid Comprehension*, 30 July 2026
draft, Definition 47 and Lemma 48, p. 24. The explicit natural-number
collapse and its verification below are an original formalization (`misc`),
23 October 2026. This module establishes the category and actual arrows;
it does not claim the model's Boolean-completeness or rigidity verdicts.
-/

namespace Classicism.Meta.Intensional.QualitativeLinks

open CategoryTheory
noncomputable section

/-- Points, two companions at each point, and countably many links over
each ordered pair of distinct points. -/
inductive Node where
  | point (n : Nat)
  | companion (n : Nat) (side : Bool)
  | link (n m k : Nat) (distinct : n ≠ m)
  deriving DecidableEq

/-- The only qualitative incidences: a repeated point has its two
companions, and distinct points have their link fibre. -/
inductive R : Node → Node → Node → Prop where
  | companion (n : Nat) (b : Bool) :
      R (.point n) (.point n) (.companion n b)
  | link (n m k : Nat) (h : n ≠ m) :
      R (.point n) (.point m) (.link n m k h)

def Preserves (f : Node → Node) : Prop :=
  ∀ ⦃x y z⦄, R x y z → R (f x) (f y) (f z)

/-- Fixing the distinguished two-point set, written as its two possible
permutations. -/
def FixesPair (f : Node → Node) : Prop :=
  (f (.point 0) = .point 0 ∧ f (.point 1) = .point 1) ∨
  (f (.point 0) = .point 1 ∧ f (.point 1) = .point 0)

def Sym (f : Node → Node) : Prop :=
  Function.Bijective f ∧ Preserves f ∧ FixesPair f

def Collapses (f : Node → Node) : Prop :=
  Function.Surjective f ∧ Preserves f ∧ f (.point 0) = f (.point 1)

def Arrow (f : Node → Node) : Prop := Sym f ∨ Collapses f

theorem R.endpoints_unique {x y z x' y' : Node}
    (h : R x y z) (h' : R x' y' z) : x = x' ∧ y = y' := by
  cases h <;> cases h' <;> exact ⟨rfl, rfl⟩

theorem R.left_point {x y z : Node} (h : R x y z) : ∃ n, x = .point n := by
  cases h <;> exact ⟨_, rfl⟩

def Nonpoint : Node → Prop
  | .point _ => False
  | .companion _ _ => True
  | .link _ _ _ _ => True

theorem R.nonpoint {x y z : Node} (h : R x y z) : Nonpoint z := by
  cases h <;> trivial

theorem preserves_points {f : Node → Node} (hf : Preserves f) (n : Nat) :
    ∃ m, f (.point n) = .point m :=
  (hf (R.companion n false)).left_point

/-- For this concrete incidence structure, injective preservation already
reflects the relation. Thus “relation-preserving permutation” really is
closed under inversion; reflection is not an extra arrow assumption. -/
theorem reflects {f : Node → Node} (hf : Preserves f)
    (hi : Function.Injective f) {x y z : Node} :
    R (f x) (f y) (f z) → R x y z := by
  intro hr
  cases z with
  | point n =>
      obtain ⟨m, hm⟩ := preserves_points hf n
      have hn := hr.nonpoint
      rw [hm] at hn
      exact hn.elim
  | companion n b =>
      obtain ⟨hx, hy⟩ := hr.endpoints_unique (hf (R.companion n b))
      have hx' := hi hx
      have hy' := hi hy
      subst x
      subst y
      exact R.companion n b
  | link n m k hnm =>
      obtain ⟨hx, hy⟩ := hr.endpoints_unique (hf (R.link n m k hnm))
      have hx' := hi hx
      have hy' := hi hy
      subst x
      subst y
      exact R.link n m k hnm

theorem preserves_id : Preserves id := fun {_ _ _} h => h

theorem preserves_comp {f g : Node → Node} (hf : Preserves f) (hg : Preserves g) :
    Preserves (g ∘ f) := fun {_ _ _} h => hg (hf h)

theorem fixesPair_id : FixesPair id := Or.inl ⟨rfl, rfl⟩

theorem fixesPair_comp {f g : Node → Node} (hf : FixesPair f) (hg : FixesPair g) :
    FixesPair (g ∘ f) := by
  rcases hf with ⟨hf0, hf1⟩ | ⟨hf0, hf1⟩ <;>
    rcases hg with ⟨hg0, hg1⟩ | ⟨hg0, hg1⟩ <;>
    simp [FixesPair, hf0, hf1, hg0, hg1]

theorem sym_id : Sym id := ⟨Function.bijective_id, preserves_id, fixesPair_id⟩

theorem sym_comp {f g : Node → Node} (hf : Sym f) (hg : Sym g) : Sym (g ∘ f) :=
  ⟨hg.1.comp hf.1, preserves_comp hf.2.1 hg.2.1, fixesPair_comp hf.2.2 hg.2.2⟩

theorem arrow_surjective {f : Node → Node} (hf : Arrow f) : Function.Surjective f := by
  rcases hf with hf | hf
  · exact hf.1.2
  · exact hf.1

theorem arrow_preserves {f : Node → Node} (hf : Arrow f) : Preserves f := by
  rcases hf with hf | hf <;> exact hf.2.1

theorem arrow_comp {f g : Node → Node} (hf : Arrow f) (hg : Arrow g) :
    Arrow (g ∘ f) := by
  rcases hf with hf | hf
  · rcases hg with hg | hg
    · exact Or.inl (sym_comp hf hg)
    · apply Or.inr
      refine ⟨hg.1.comp hf.1.2, preserves_comp hf.2.1 hg.2.1, ?_⟩
      rcases hf.2.2 with ⟨h0, h1⟩ | ⟨h0, h1⟩
      · simpa only [Function.comp_apply, h0, h1] using hg.2.2
      · simpa only [Function.comp_apply, h0, h1] using hg.2.2.symm
  · exact Or.inr ⟨(arrow_surjective hg).comp hf.1,
      preserves_comp hf.2.1 (arrow_preserves hg), congrArg g hf.2.2⟩

theorem preserves_symm (e : Node ≃ Node) (he : Preserves e) : Preserves e.symm := by
  intro x y z h
  apply reflects he e.injective
  simpa only [e.apply_symm_apply] using h

theorem fixesPair_symm (e : Node ≃ Node) (he : FixesPair e) : FixesPair e.symm := by
  rcases he with ⟨h0, h1⟩ | ⟨h0, h1⟩
  · apply Or.inl
    constructor
    · apply e.injective
      simpa only [e.apply_symm_apply] using h0.symm
    · apply e.injective
      simpa only [e.apply_symm_apply] using h1.symm
  · apply Or.inr
    constructor
    · apply e.injective
      simpa only [e.apply_symm_apply] using h1.symm
    · apply e.injective
      simpa only [e.apply_symm_apply] using h0.symm

theorem sym_inverse {f : Node → Node} (hf : Sym f) :
    Sym (Equiv.ofBijective f hf.1).symm :=
  ⟨(Equiv.ofBijective f hf.1).symm.bijective,
    preserves_symm _ hf.2.1, fixesPair_symm _ hf.2.2⟩

/-- The actual Base 3 category, with one object. -/
abbrev cat : FunCat where
  Obj := Unit
  X _ := Node
  Arr := fun f => Arrow f
  arr_id _ := Or.inl sym_id
  arr_comp := arrow_comp

abbrev star : cat.Ob := ()

def syms (W : cat.Ob) : Set (W ⟶ W) := {g | Sym (FunCat.fn g)}

theorem syms_inv : SymGroup syms := by
  intro W g hg
  let e := Equiv.ofBijective (FunCat.fn g) hg.1
  let gi : W ⟶ W := FunCat.arr e.symm (Or.inl (sym_inverse hg))
  refine ⟨gi, sym_inverse hg, ?_, ?_⟩
  · exact FunCat.hom_ext (funext e.symm_apply_apply)
  · exact FunCat.hom_ext (funext e.apply_symm_apply)

/-- Base data only. The intended singleton-individual interpretation is
separate from this pinning category. -/
abbrev base : SymBase where
  F := cat
  G := syms
  G_id _ := sym_id
  G_comp {V} {g} {s} hg hs :=
    sym_comp (f := FunCat.fn g) (g := FunCat.fn s) hg hs
  G_inv := syms_inv
  W₀ := star
  ne _ := ⟨.point 0⟩
  J := PinIdeal.fin _
  J_base _ h := h

/-- An explicit collapse of the distinguished pair and of the two
companions at point zero. The collapsed link fibre still covers both
companions through the parity of its link index. -/
def collapseFn : Node → Node
  | .point n => .point n.pred
  | .companion n b => .companion n.pred (if n = 0 then false else b)
  | .link n m k _ =>
      if h : n.pred ≠ m.pred then .link n.pred m.pred k h
      else .companion n.pred (decide (k % 2 = 1))

theorem collapse_preserves : Preserves collapseFn := by
  intro x y z h
  cases h with
  | companion n b => exact R.companion n.pred (if n = 0 then false else b)
  | link n m k hnm =>
      simp only [collapseFn]
      split
      · exact R.link _ _ _ _
      · rename_i h
        have he : n.pred = m.pred := not_not.mp h
        rw [← he]
        exact R.companion _ _

theorem collapse_surjective : Function.Surjective collapseFn := by
  intro x
  cases x with
  | point n => exact ⟨.point (n + 1), rfl⟩
  | companion n b =>
      refine ⟨.companion (n + 1) b, ?_⟩
      simp [collapseFn]
  | link n m k hnm =>
      refine ⟨.link (n + 1) (m + 1) k (by omega), ?_⟩
      simp [collapseFn, hnm]

@[simp] theorem collapse_point_zero : collapseFn (.point 0) = .point 0 := rfl
@[simp] theorem collapse_point_one : collapseFn (.point 1) = .point 0 := rfl

@[simp] theorem collapse_companion_zero (b : Bool) :
    collapseFn (.companion 0 b) = .companion 0 false := rfl

theorem collapse_collapses : Collapses collapseFn :=
  ⟨collapse_surjective, collapse_preserves, rfl⟩

def collapse : star ⟶ star := FunCat.arr collapseFn (Or.inr collapse_collapses)

theorem collapse_not_injective : ¬ Function.Injective collapseFn := by
  intro h
  have he := h (show collapseFn (.point 0) = collapseFn (.point 1) from rfl)
  cases he

theorem collapse_not_sym : ¬ collapse ∈ syms star := fun h => collapse_not_injective h.1.1

end
end Classicism.Meta.Intensional.QualitativeLinks
