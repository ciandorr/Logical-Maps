import Classicism.Models.QualitativeLinksBase
import Classicism.Models.SymTransposable
import Classicism.Models.SymmetricIdeal

/-!
# The qualitative-link model (Base 3) meets the group's conditions

`models/symmetric-qualitative-links.yaml`: Cian Dorr, *Boolean Completeness does not imply
Rigid Comprehension*, draft of 30 July 2026, §8, Definition 47. The base is
`QualitativeLinks.base` (`Models/QualitativeLinksBase.lean`). Here its conditions in the map's
group `symmetric-ideally-full`:

- `transposable`: the property of being a link outside `N`; a link is transposed with another
  link over the same two points, which fixes every point and companion
  (`transposable`);
- `surjective-arrows`, and infinitely many individuals;
- `symmetry-group-pinned` and `actual-world-isolated`: an arrow is a symmetry exactly when it
  does not collapse the distinguished pair, so the group is pinned down by the pair, and a
  composite is a symmetry exactly when both factors are;
- `separable-collapses`: the pairs of points `2i + 2, 2i + 3`, collapsed by the arrow acting on
  the points as `SymIdeal.halfThen i` (`collapseBy`, for any surjection of the points merging
  `0` with `1`: links over points it merges go to companions by the parity of their index).

Original formalization (`misc`), 3 November 2026.
-/

namespace Classicism.Meta.Intensional.QualitativeLinks

open CategoryTheory
noncomputable section

instance : Subsingleton cat.Ob := inferInstanceAs (Subsingleton Unit)

theorem oneObject : base.model.OneObject := Premodel.oneObject_of_subsingleton _

/-! ### Links -/

/-- Being a link. -/
def IsLink : Node → Prop
  | .link _ _ _ _ => True
  | _ => False

theorem isLink_of_sym {f : Node → Node} (hf : Sym f) {x : Node} (hx : IsLink x) : IsLink (f x) := by
  cases x with
  | point _ => exact hx.elim
  | companion _ _ => exact hx.elim
  | link p q j hpq =>
    have hr := hf.2.1 (R.link p q j hpq)
    obtain ⟨a, ha⟩ := preserves_points hf.2.1 p
    obtain ⟨b, hb⟩ := preserves_points hf.2.1 q
    rw [ha, hb] at hr
    have hab : a ≠ b := fun e => by
      subst e
      have := hf.1.1 (ha.trans hb.symm)
      cases this
      exact hpq rfl
    revert hr
    generalize f (.link p q j hpq) = w
    intro hr
    cases hr with
    | companion => exact absurd rfl hab
    | link => trivial

/-- A transposition of two links over the same points fixes every other node. -/
theorem swap_preserves (n m k k' : ℕ) (h : n ≠ m) :
    Preserves (Equiv.swap (Node.link n m k h) (Node.link n m k' h)) := by
  intro a b z hr
  have hpt : ∀ r, Equiv.swap (Node.link n m k h) (Node.link n m k' h) (Node.point r) = Node.point r :=
    fun r => Equiv.swap_apply_of_ne_of_ne (by simp) (by simp)
  cases hr with
  | companion p c =>
    have hc : Equiv.swap (Node.link n m k h) (Node.link n m k' h) (Node.companion p c) = Node.companion p c :=
      Equiv.swap_apply_of_ne_of_ne (by simp) (by simp)
    rw [hpt, hc]
    exact R.companion p c
  | link p q j hpq =>
    rw [hpt, hpt]
    rw [Equiv.swap_apply_def]
    split_ifs with e1 e2
    · simp only [Node.link.injEq] at e1
      obtain ⟨rfl, rfl, rfl⟩ := e1
      exact R.link _ _ _ _
    · simp only [Node.link.injEq] at e2
      obtain ⟨rfl, rfl, rfl⟩ := e2
      exact R.link _ _ _ _
    · exact R.link _ _ _ _

theorem swap_sym (n m k k' : ℕ) (h : n ≠ m) :
    Sym (Equiv.swap (Node.link n m k h) (Node.link n m k' h)) :=
  ⟨(Equiv.swap _ _).bijective, swap_preserves n m k k' h,
    Or.inl ⟨Equiv.swap_apply_of_ne_of_ne (by simp) (by simp),
      Equiv.swap_apply_of_ne_of_ne (by simp) (by simp)⟩⟩

/-- **`transposable`**, with the property of being a link outside `N`. -/
theorem transposable : base.Transposable := by
  classical
  refine SymBase.transposable_of_moves (S := base) (fun _ x => IsLink x)
    (fun _ g hg x hx => isLink_of_sym hg hx) (fun K hK => ?_) (fun K hK y hy hyK => ?_)
  · have hinj : Function.Injective fun k : ℕ => Node.link 0 1 k (by decide) :=
      fun a b e => by simpa using e
    obtain ⟨k, hk⟩ := (hK.preimage hinj.injOn).exists_notMem
    exact ⟨Node.link 0 1 k (by decide), trivial, hk⟩
  · cases y with
    | point _ => exact hy.elim
    | companion _ _ => exact hy.elim
    | link n m k hnm =>
      have hinj : Function.Injective fun k : ℕ => Node.link n m k hnm := fun a b e => by simpa using e
      obtain ⟨k', hk'⟩ := ((hK.union (Set.finite_singleton (Node.link n m k hnm))).preimage
        hinj.injOn).exists_notMem
      have hk'K : Node.link n m k' hnm ∉ K := fun h => hk' (Or.inl h)
      have hk'y : Node.link n m k' hnm ≠ Node.link n m k hnm := fun h => hk' (Or.inr h)
      refine ⟨FunCat.arr (F := cat) (i := star) (j := star) _ (Or.inl (swap_sym n m k k' hnm)),
        swap_sym n m k k' hnm, fun x hx => ?_, ?_⟩
      · exact Equiv.swap_apply_of_ne_of_ne (fun e => hyK (e ▸ hx)) (fun e => hk'K (e ▸ hx))
      · show Equiv.swap _ _ _ ≠ _
        rw [Equiv.swap_apply_left]; exact hk'y

/-! ### Surjective arrows, infinitely many individuals -/

theorem surjectiveArrows : base.SurjectiveArrows := fun _ k => arrow_surjective k.2

instance : Infinite Node :=
  Infinite.of_injective (fun n : ℕ => Node.point n) fun a b e => by simpa using e

theorem infinitelyManyIndividuals : base.model.InfinitelyManyIndividuals :=
  inferInstanceAs (Infinite Node)

/-! ### The symmetry group: the arrows not collapsing the distinguished pair -/

theorem sym_iff {f : Node → Node} (hf : Arrow f) : Sym f ↔ f (.point 0) ≠ f (.point 1) := by
  constructor
  · intro hs e
    have := hs.1.1 e
    simp at this
  · intro hne
    exact hf.resolve_right fun hc => hne hc.2.2

theorem sym_comp_iff {h j : Node → Node} (hh : Arrow h) (hj : Arrow j) :
    Sym (j ∘ h) ↔ Sym h ∧ Sym j := by
  constructor
  · intro hs
    have hinj := hs.1.1
    have hS : Sym h := (sym_iff hh).2 fun e => by
      have := hinj (a₁ := .point 0) (a₂ := .point 1) (by simp only [Function.comp_apply, e])
      simp at this
    refine ⟨hS, (sym_iff hj).2 fun e => ?_⟩
    rcases hS.2.2 with ⟨a, b⟩ | ⟨a, b⟩
    · have := hinj (a₁ := .point 0) (a₂ := .point 1) (by simp only [Function.comp_apply, a, b, e])
      simp at this
    · have := hinj (a₁ := .point 0) (a₂ := .point 1) (by simp only [Function.comp_apply, a, b, e])
      simp at this
  · rintro ⟨hh, hj⟩
    exact sym_comp hh hj

theorem symmetryGroupPinned : base.SymmetryGroupPinned := by
  refine SymBase.symmetryGroupPinned_of_one (S := base) (fun _ => rfl) {.point 0, .point 1} (Set.toFinite _)
    fun h i k ha => ?_
  have e0 : FunCat.fn h (.point 0) = FunCat.fn i (.point 0) := ha _ (by simp)
  have e1 : FunCat.fn h (.point 1) = FunCat.fn i (.point 1) := ha _ (by simp)
  show Sym (FunCat.fn k ∘ FunCat.fn h) ↔ Sym (FunCat.fn k ∘ FunCat.fn i)
  rw [sym_iff (arrow_comp h.2 k.2), sym_iff (arrow_comp i.2 k.2)]
  simp only [Function.comp_apply, e0, e1]

theorem actualWorldIsolated : base.model.ActualWorldIsolated := by
  refine SymBase.actualWorldIsolated_of_pinned (S := base) symmetryGroupPinned fun {V U} i j hm => ?_
  cases V; cases U
  rw [SymBase.mem_groupProp] at hm ⊢
  exact ((sym_comp_iff i.2 j.2).1 hm).1

/-! ### Separable collapses -/

/-- The arrow acting on the points as `φ`, on companions alongside, and sending a link over
two points that `φ` merges to a companion, by the parity of its index. -/
def collapseBy (φ : ℕ → ℕ) : Node → Node
  | .point n => .point (φ n)
  | .companion n b => .companion (φ n) b
  | .link n m k _ =>
      if h : φ n ≠ φ m then .link (φ n) (φ m) k h
      else .companion (φ n) (decide (k % 2 = 1))

theorem collapseBy_preserves (φ : ℕ → ℕ) : Preserves (collapseBy φ) := by
  intro x y z h
  cases h with
  | companion n b => exact R.companion (φ n) b
  | link n m k hnm =>
      simp only [collapseBy]
      split
      · exact R.link _ _ _ _
      · rename_i h
        have he : φ n = φ m := not_not.mp h
        rw [← he]
        exact R.companion _ _

theorem collapseBy_surjective {φ : ℕ → ℕ} (hφ : Function.Surjective φ) :
    Function.Surjective (collapseBy φ) := by
  intro x
  cases x with
  | point c =>
      obtain ⟨n, rfl⟩ := hφ c
      exact ⟨.point n, rfl⟩
  | companion c b =>
      obtain ⟨n, rfl⟩ := hφ c
      exact ⟨.companion n b, rfl⟩
  | link c d k hcd =>
      obtain ⟨n, rfl⟩ := hφ c
      obtain ⟨m, rfl⟩ := hφ d
      have hnm : n ≠ m := fun e => hcd (e ▸ rfl)
      exact ⟨.link n m k hnm, by simp [collapseBy, hcd]⟩

theorem collapseBy_arrow {φ : ℕ → ℕ} (hφ : Function.Surjective φ) (h01 : φ 0 = φ 1) :
    Arrow (collapseBy φ) :=
  Or.inr ⟨collapseBy_surjective hφ, collapseBy_preserves φ, by simp [collapseBy, h01]⟩

theorem halfThen_01 (i : ℕ) : SymIdeal.halfThen i 0 = SymIdeal.halfThen i 1 := by
  simp only [SymIdeal.halfThen]; rw [if_pos (by omega), if_pos (by omega)]

/-- **`separable-collapses`**, the pairs of points `2i + 2, 2i + 3`. -/
theorem separable : base.SeparableCollapses := by
  let k : ℕ → (star ⟶ star) := fun i =>
    FunCat.arr (F := cat) (i := star) (j := star) (collapseBy (SymIdeal.halfThen i))
      (collapseBy_arrow (SymIdeal.halfThen_surjective i) (halfThen_01 i))
  have hk : ∀ i x, FunCat.fn (k i) (.point x) = .point (SymIdeal.halfThen i x) := fun _ _ => rfl
  refine ⟨fun i => .point (2 * i + 2), fun i => .point (2 * i + 3), fun i j hij => ?_⟩
  rcases Nat.lt_or_gt_of_ne hij with h | h
  · refine ⟨star, k i, Or.inl ⟨?_, ?_⟩⟩
    · show FunCat.fn (k i) (.point (2 * i + 2)) = FunCat.fn (k i) (.point (2 * i + 3))
      rw [hk, hk, (SymIdeal.halfThen_sep h).1]
    · show FunCat.fn (k i) (.point (2 * j + 2)) ≠ FunCat.fn (k i) (.point (2 * j + 3))
      rw [hk, hk]; exact fun c => (SymIdeal.halfThen_sep h).2 (by simpa using c)
  · refine ⟨star, k j, Or.inr ⟨?_, ?_⟩⟩
    · show FunCat.fn (k j) (.point (2 * j + 2)) = FunCat.fn (k j) (.point (2 * j + 3))
      rw [hk, hk, (SymIdeal.halfThen_sep h).1]
    · show FunCat.fn (k j) (.point (2 * i + 2)) ≠ FunCat.fn (k j) (.point (2 * i + 3))
      rw [hk, hk]; exact fun c => (SymIdeal.halfThen_sep h).2 (by simpa using c)

end
end Classicism.Meta.Intensional.QualitativeLinks
