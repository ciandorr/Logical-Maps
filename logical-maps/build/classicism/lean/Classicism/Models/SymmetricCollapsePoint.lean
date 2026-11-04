import Classicism.Models.SymmetricIdeal
import Classicism.Models.SymTransposable

/-!
# The collapse pair and a point (`symmetric-collapse-pair-and-point`)

A symmetric ideally full model on two objects (Cian Dorr's construction recorded in
`models/symmetric-collapse-pair-and-point.yaml`): `W₀` with base `ℕ` and the pair `{0, 1}`,
`W₁` with one point. The arrows `W₀ → W₀` are the permutations preserving `{0, 1}`, the
surjections collapsing it (Base 2's arrows, `collapsePair.Arr`) and the constant maps; there is
one arrow `W₀ → W₁`, an arrow `W₁ → W₀` for each value, and the identity of `W₁`. The
symmetries are the permutations preserving `{0, 1}` at `W₀` and the identity at `W₁`; both
objects carry the ideal of finite sets.

Its conditions in the group `symmetric-ideally-full`: `transposable` (the points other than `0`
and `1`), infinitely many individuals, `separable-collapses` (as for Base 2),
`symmetry-group-pinned` and `actual-world-isolated` (an arrow is a symmetry exactly when it goes
to `W₀` and does not collapse the pair), and `hull-conditions` with `M₀ = {0, 1}` (as for Base
2: an arrow not separated collapses the pair, and splicing keeps it collapsed).

Original formalization (`misc`), 3 November 2026.
-/

namespace Classicism.Meta.Intensional.SymIdeal

open CategoryTheory

/-- The arrows `W₀ → W₀`: Base 2's, and the constants. -/
def PtArr (f : ℕ → ℕ) : Prop := collapsePair.Arr f ∨ ∃ c, ∀ x, f x = c

theorem ptArr_comp {f g : ℕ → ℕ} (hf : PtArr f) (hg : PtArr g) : PtArr (g ∘ f) := by
  rcases hf with hf | ⟨c, hc⟩
  · rcases hg with hg | ⟨d, hd⟩
    · exact Or.inl (collapsePair.arr_comp hf hg)
    · exact Or.inr ⟨d, fun x => hd _⟩
  · exact Or.inr ⟨g c, fun x => by simp [Function.comp, hc]⟩

/-- The individuals: `ℕ` at `W₀`, one point at `W₁`. -/
abbrev ptX : Bool → Type
  | false => ℕ
  | true => Unit

def ptCat : FunCat where
  Obj := Bool
  X := ptX
  Arr {i j} f := match i, j, f with
    | false, false, f => PtArr f
    | _, _, _ => True
  arr_id i := match i with
    | false => Or.inl collapsePair.arr_id
    | true => trivial
  arr_comp {i j k} {f g} hf hg := match i, j, k, f, g, hf, hg with
    | false, false, false, _, _, hf, hg => ptArr_comp hf hg
    | false, false, true, _, _, _, _ => trivial
    | false, true, false, _, g, _, _ => Or.inr ⟨g (), fun _ => rfl⟩
    | false, true, true, _, _, _, _ => trivial
    | true, _, false, _, _, _, _ => trivial
    | true, _, true, _, _, _, _ => trivial

/-- The symmetries: Base 2's at `W₀`, everything (the identity) at `W₁`. -/
def ptSyms : ∀ V : ptCat.Ob, Set (V ⟶ V)
  | false => {g | collapsePair.Sym (FunCat.fn g)}
  | true => Set.univ

theorem ptSyms_symGroup : SymGroup ptSyms := by
  intro V g hg
  match V, g, hg with
  | false, g, hg =>
    let e := Equiv.ofBijective _ (collapsePair.sym_bij hg)
    refine ⟨FunCat.arr (F := ptCat) (i := false) (j := false) e.symm
      (Or.inl (collapsePair.sym_arr (collapsePair.sym_inv hg))), collapsePair.sym_inv hg, ?_, ?_⟩
    · exact FunCat.hom_ext (funext fun x => e.symm_apply_apply x)
    · exact FunCat.hom_ext (funext fun x => e.apply_symm_apply x)
  | true, g, _ =>
    exact ⟨g, trivial, FunCat.hom_ext (funext fun _ => rfl), FunCat.hom_ext (funext fun _ => rfl)⟩

/-- The base, at `W₀`. -/
def ptBase : SymBase where
  F := ptCat
  G := ptSyms
  G_id V := match V with
    | false => collapsePair.sym_id
    | true => trivial
  G_comp {V} {g s} hg hs := match V, g, s, hg, hs with
    | false, g, s, hg, hs => collapsePair.sym_comp (f := FunCat.fn g) (g := FunCat.fn s) hg hs
    | true, _, _, _, _ => trivial
  G_inv := ptSyms_symGroup
  W₀ := (false : Bool)
  ne V := match V with
    | false => ⟨(0 : ℕ)⟩
    | true => ⟨()⟩
  J := PinIdeal.fin _
  J_base _ h := h

/-! ### Symmetries -/

/-- An arrow `W₀ → W₀` is a symmetry exactly when it does not collapse the pair. -/
theorem pt_sym_iff {f : ℕ → ℕ} (hf : PtArr f) : collapsePair.Sym f ↔ f 0 ≠ f 1 := by
  constructor
  · intro hs e
    exact absurd (hs.1.1 e) (by decide)
  · intro hne
    rcases hf with hf | ⟨c, hc⟩
    · exact hf.resolve_right fun h => hne h.2
    · exact absurd ((hc 0).trans (hc 1).symm) hne

theorem pt_mem_false (k : ptBase.W₀ ⟶ (show ptCat.Ob from false)) :
    (⟨false, PUnit.unit, k⟩ : Tuple (SymT ptBase.F.De ptBase.G ptBase.J) .t ptBase.W₀) ∈ ptBase.groupProp ↔
      collapsePair.Sym (FunCat.fn k) :=
  SymBase.mem_groupProp (S := ptBase) k

theorem pt_not_mem_true (k : ptBase.W₀ ⟶ (show ptCat.Ob from true)) :
    (⟨true, PUnit.unit, k⟩ : Tuple (SymT ptBase.F.De ptBase.G ptBase.J) .t ptBase.W₀) ∉ ptBase.groupProp := by
  rintro ⟨g, -, he⟩
  exact absurd (Sigma.mk.inj_iff.1 he).1 (fun e => by cases e)

/-- An arrow through `W₁` is constant, so not a symmetry. -/
theorem pt_not_sym_through (h : ptBase.W₀ ⟶ (show ptCat.Ob from true))
    (k : (show ptCat.Ob from true) ⟶ (show ptCat.Ob from false)) :
    ¬ collapsePair.Sym (FunCat.fn (h ≫ k)) := fun hs =>
  absurd (hs.1.1 (show FunCat.fn k (FunCat.fn h (0 : ℕ)) = FunCat.fn k (FunCat.fn h (1 : ℕ)) from rfl)) (by decide)

theorem pt_symmetryGroupPinned : ptBase.SymmetryGroupPinned := by
  refine ⟨({0, 1} : Set ℕ), (Set.finite_singleton (1 : ℕ)).insert 0, fun V h i ha => ?_⟩
  ext ⟨U, ⟨⟩, k⟩
  show (⟨U, PUnit.unit, h ≫ k⟩ : Tuple (SymT ptBase.F.De ptBase.G ptBase.J) .t ptBase.W₀) ∈ ptBase.groupProp ↔
    (⟨U, PUnit.unit, i ≫ k⟩ : Tuple (SymT ptBase.F.De ptBase.G ptBase.J) .t ptBase.W₀) ∈ ptBase.groupProp
  cases U with
  | true => exact iff_of_false (pt_not_mem_true _) (pt_not_mem_true _)
  | false =>
    rw [pt_mem_false, pt_mem_false]
    cases V with
    | true => exact iff_of_false (pt_not_sym_through h k) (pt_not_sym_through i k)
    | false =>
      have e0 : FunCat.fn h (0 : ℕ) = FunCat.fn i (0 : ℕ) := ha (0 : ℕ) (Or.inl rfl)
      have e1 : FunCat.fn h (1 : ℕ) = FunCat.fn i (1 : ℕ) := ha (1 : ℕ) (Or.inr rfl)
      rw [pt_sym_iff (h ≫ k).2, pt_sym_iff (i ≫ k).2]
      show FunCat.fn k (FunCat.fn h (0 : ℕ)) ≠ FunCat.fn k (FunCat.fn h (1 : ℕ)) ↔
        FunCat.fn k (FunCat.fn i (0 : ℕ)) ≠ FunCat.fn k (FunCat.fn i (1 : ℕ))
      rw [e0, e1]

theorem pt_actualWorldIsolated : ptBase.model.ActualWorldIsolated :=
  SymBase.actualWorldIsolated_of_pinned pt_symmetryGroupPinned fun {V U} i j hm => by
    cases U with
    | true => exact absurd hm (pt_not_mem_true _)
    | false =>
      rw [pt_mem_false] at hm
      cases V with
      | true => exact absurd hm (pt_not_sym_through i j)
      | false =>
        rw [pt_mem_false, pt_sym_iff i.2]
        intro e
        exact absurd (hm.1.1 (show FunCat.fn j (FunCat.fn i (0 : ℕ)) = FunCat.fn j (FunCat.fn i (1 : ℕ)) from congrArg (FunCat.fn j) e))
          (by decide)

/-! ### `transposable`, infinitely many individuals, separable collapses -/

/-- Being other than `0` and `1`, at `W₀`. -/
def ptP : ∀ V : Bool, ptX V → Prop
  | false, x => x ≠ 0 ∧ x ≠ 1
  | true, _ => True

theorem pt_transposable : ptBase.Transposable := by
  refine SymBase.transposable_of_moves (S := ptBase) ptP (fun V g hg x hx => ?_) (fun (K : Set ℕ) hK => ?_)
    (fun (K : Set ℕ) hK (y : ℕ) hy hyK => ?_)
  · cases V with
    | true => trivial
    | false =>
      have hinj := hg.1.1
      obtain ⟨hx0, hx1⟩ := hx
      rcases hg.2 with ⟨g0, g1⟩ | ⟨g0, g1⟩
      · exact ⟨fun e => hx0 (hinj (e.trans g0.symm)), fun e => hx1 (hinj (e.trans g1.symm))⟩
      · exact ⟨fun e => hx1 (hinj (e.trans g1.symm)), fun e => hx0 (hinj (e.trans g0.symm))⟩
  · have hK' : (K ∪ ({0, 1} : Set ℕ)).Finite := hK.union ((Set.finite_singleton (1 : ℕ)).insert 0)
    obtain ⟨y, hy⟩ := Set.Finite.exists_notMem (α := ℕ) hK'
    exact ⟨y, ⟨fun e => hy (Or.inr (Or.inl e)), fun e => hy (Or.inr (Or.inr e))⟩, fun h => hy (Or.inl h)⟩
  · obtain ⟨hy0, hy1⟩ := hy
    obtain ⟨z, hz, hzy⟩ := exists_fresh (hK.union ((Set.finite_singleton (1 : ℕ)).insert 0)) y
    have hz0 : z ≠ 0 := fun e => hz (Or.inr (Or.inl e))
    have hz1 : z ≠ 1 := fun e => hz (Or.inr (Or.inr e))
    have hs : collapsePair.Sym (Equiv.swap y z) := ⟨(Equiv.swap y z).bijective,
      Or.inl ⟨Equiv.swap_apply_of_ne_of_ne hy0.symm hz0.symm, Equiv.swap_apply_of_ne_of_ne hy1.symm hz1.symm⟩⟩
    refine ⟨FunCat.arr (F := ptCat) (i := false) (j := false) (Equiv.swap y z) (Or.inl (collapsePair.sym_arr hs)),
      hs, fun x hx => swap_fix hyK (fun h => hz (Or.inl h)) hx, ?_⟩
    show Equiv.swap y z y ≠ y
    rw [Equiv.swap_apply_left]; exact hzy

theorem pt_infinitelyManyIndividuals : ptBase.model.InfinitelyManyIndividuals :=
  inferInstanceAs (Infinite ℕ)

theorem pt_separable : ptBase.SeparableCollapses := by
  have harr : ∀ i, PtArr (halfThen i) := fun i =>
    Or.inl (Or.inr ⟨halfThen_surjective i, by simp only [halfThen]; rw [if_pos (by omega), if_pos (by omega)]⟩)
  refine ⟨fun i => (2 * i + 2 : ℕ), fun i => (2 * i + 3 : ℕ), fun i j hij => ?_⟩
  rcases Nat.lt_or_gt_of_ne hij with h | h
  · exact ⟨(false : Bool), FunCat.arr (F := ptCat) (i := false) (j := false) (halfThen i) (harr i),
      Or.inl (halfThen_sep h)⟩
  · exact ⟨(false : Bool), FunCat.arr (F := ptCat) (i := false) (j := false) (halfThen j) (harr j),
      Or.inr (halfThen_sep h)⟩

/-! ### The hull conditions -/

theorem pt_hullConditions : ptBase.HullConditions := by
  classical
  refine ⟨({0, 1} : Set ℕ), (Set.finite_singleton (1 : ℕ)).insert 0,
    fun M _ hM₀ V h hsep h' hag (P Q : Set ℕ) hP hQ hPQ => ?_, fun N P Q hN hP hQ hM₀ => ?_⟩
  · cases V with
    | true => exact ⟨h, fun _ _ => rfl, fun _ _ => rfl⟩
    | false =>
      let f : ℕ → ℕ := FunCat.fn h
      let f' : ℕ → ℕ := FunCat.fn h'
      have h0M : (0 : ℕ) ∈ M := hM₀ (Or.inl rfl)
      have h1M : (1 : ℕ) ∈ M := hM₀ (Or.inr rfl)
      -- an unseparated arrow collapses the pair
      have hc : f 0 = f 1 := by
        by_contra hne
        refine hsep (SymBase.separates_of_mem fun k hk => (pt_sym_iff k.2).2 fun hk' => hne ?_)
        have e0 : f 0 = FunCat.fn k (0 : ℕ) := hk (0 : ℕ) h0M
        have e1 : f 1 = FunCat.fn k (1 : ℕ) := hk (1 : ℕ) h1M
        rw [e0, e1]; exact hk'
      have e0 : f 0 = f' 0 := hag (0 : ℕ) h0M
      have e1 : f 1 = f' 1 := hag (1 : ℕ) h1M
      obtain ⟨K, hK2, hK⟩ := exists_bound (hP.union hQ)
      let j : ℕ → ℕ := fun x => if x = 0 ∨ x = 1 then f 0 else
        if x ∈ P then f' x else if x ∈ Q then f x else x - K
      have hj : Function.Surjective j := fun y => ⟨y + K, by
        have h0 : ¬ (y + K = 0 ∨ y + K = 1) := by omega
        have h1 : y + K ∉ P := fun h => by have := hK _ (Or.inl h); omega
        have h2 : y + K ∉ Q := fun h => by have := hK _ (Or.inr h); omega
        simp only [j]; split_ifs <;> omega⟩
      have hj01 : j 0 = j 1 := by simp [j]
      refine ⟨FunCat.arr (F := ptCat) (i := false) (j := false) j (Or.inl (Or.inr ⟨hj, hj01⟩)),
        fun (x : ℕ) hx => ?_, fun (x : ℕ) hx => ?_⟩
      · show j x = f' x
        simp only [j]
        split_ifs with hx01
        · rcases hx01 with rfl | rfl
          · exact e0
          · exact hc.trans e1
        all_goals first | rfl | contradiction
      · show j x = f x
        have hagx : x ∈ P → f x = f' x := fun hxP => hag x (hPQ ⟨hxP, hx⟩)
        simp only [j]
        split_ifs with hx01 hxP
        · rcases hx01 with rfl | rfl
          · rfl
          · exact hc
        · exact (hagx hxP).symm
        all_goals first | rfl | contradiction
  · obtain ⟨g, hg, hfix, hmove⟩ := move_points (B := collapsePair) {0, 1}
      (fun K hK y hy => by
        obtain ⟨z, hz, -⟩ := exists_fresh (hK.union ((Set.finite_singleton (1 : ℕ)).insert 0)) y
        have hy0 : y ≠ 0 := fun e => hy (Or.inl e)
        have hy1 : y ≠ 1 := fun e => hy (Or.inr e)
        have hz0 : z ≠ 0 := fun e => hz (Or.inr (Or.inl e))
        have hz1 : z ≠ 1 := fun e => hz (Or.inr (Or.inr e))
        exact ⟨z, fun h => hz (Or.inl h), (Equiv.swap y z).bijective,
          Or.inl ⟨Equiv.swap_apply_of_ne_of_ne hy0.symm hz0.symm, Equiv.swap_apply_of_ne_of_ne hy1.symm hz1.symm⟩⟩)
      ((hP.diff (t := N)).toFinset) N Q hN hQ hM₀ fun s hs => ((Set.Finite.mem_toFinset _).1 hs).2
    exact ⟨FunCat.arr (F := ptCat) (i := false) (j := false) g (Or.inl (collapsePair.sym_arr hg)), hg, hfix,
      fun x hx hxN => hmove x ((Set.Finite.mem_toFinset _).2 ⟨hx, hxN⟩)⟩

end Classicism.Meta.Intensional.SymIdeal
