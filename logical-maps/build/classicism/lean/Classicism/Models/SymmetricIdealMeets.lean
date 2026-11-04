import Classicism.Models.SymmetricIdeal
import Classicism.Models.SymTransposable
import Classicism.Models.OldNewBase
import Classicism.Models.FiniteCompressionBase

/-!
# More members of `symmetric-ideally-full`, and more of the members' conditions

- `classReflect`: the class-reflecting surjections of infinitely many infinite classes
  (`models/symmetric-class-reflecting-surjections.yaml`, Cian Dorr with Claude Opus 5.5,
  16 October 2026): over `ℕ`, the classes `cls n`, the first coordinate of `Nat.unpair n`;
  the arrows the surjections that reflect the classes (they identify two points only within
  a class), the symmetries the permutations preserving the classes. Its conditions
  `transposable` (a transposition within a class, as for `infClasses`), `surjective-arrows`
  and infinitely many individuals.
- The conditions `transposable`, `infinitely-many-individuals` and `separable-collapses` of
  members whose Lean base was already here but whose records gave no Lean proof of them: the
  qualitative contrast (`contrastBase`), the two-object model with its second object unpinned
  (`twoBase`), the old/new individuals (`OldNew.base`) and the finite-compression entrance
  (`FiniteCompression.base A`). Each has every permutation of the base object's individuals
  among its symmetries there, so `transposable` is `SymBase.transposable_of_moves'` with a
  transposition. Original formalization (`misc`), 3 November 2026.
-/

namespace Classicism.Meta.Intensional

open CategoryTheory

namespace SymIdeal

/-! ### Fresh points and transpositions -/

/-- A finite set of an infinite type has a point outside it and outside another given point. -/
theorem exists_fresh_of_infinite {α : Type} [Infinite α] {K : Set α} (hK : K.Finite) (y : α) :
    ∃ z ∉ K, z ≠ y := by
  obtain ⟨z, hz⟩ := (hK.union (Set.finite_singleton y)).exists_notMem
  exact ⟨z, fun h => hz (Or.inl h), fun h => hz (Or.inr h)⟩

theorem swap_fix' {α : Type} [DecidableEq α] {y z a : α} {K : Set α} (hy : y ∉ K) (hz : z ∉ K)
    (ha : a ∈ K) : Equiv.swap y z a = a :=
  Equiv.swap_apply_of_ne_of_ne (fun e => hy (e ▸ ha)) (fun e => hz (e ▸ ha))

/-- **`transposable`** for a base whose individuals at the base object form an infinite type
and whose symmetries there include every transposition. -/
theorem transposable_of_swaps (S : SymBase) [Infinite (S.F.X S.W₀)] [DecidableEq (S.F.X S.W₀)]
    (hswap : ∀ y z : S.F.X S.W₀, ∃ g ∈ S.G S.W₀, FunCat.fn g = Equiv.swap y z) :
    S.Transposable :=
  SymBase.transposable_of_moves' (fun _ hK => hK.exists_notMem) fun K hK y hy => by
    obtain ⟨z, hz, hzy⟩ := exists_fresh_of_infinite hK y
    obtain ⟨g, hg, hfn⟩ := hswap y z
    refine ⟨g, hg, fun x hx => ?_, ?_⟩
    · rw [hfn]; exact swap_fix' hy hz hx
    · rw [hfn, Equiv.swap_apply_left]; exact hzy

/-- The map sending `2i + 1` to `2i` and fixing every other point. -/
def twoCollapse (i : ℕ) (x : ℕ) : ℕ := if x = 2 * i + 1 then 2 * i else x

/-! ### The class-reflecting surjections -/

/-- That `f` reflects the classes: it identifies two points only within a class. -/
def ReflectsCls (f : ℕ → ℕ) : Prop := ∀ x y, cls (f x) = cls (f y) → cls x = cls y

/-- The class-reflecting surjections of infinitely many infinite classes; the permutations
preserving the classes. -/
def classReflect : Base where
  Arr f := Function.Surjective f ∧ ReflectsCls f
  arr_id := ⟨Function.surjective_id, fun _ _ h => h⟩
  arr_comp hf hg := ⟨hg.1.comp hf.1, fun x y h => hf.2 x y (hg.2 _ _ h)⟩
  Sym f := Function.Bijective f ∧ ∀ x y, cls (f x) = cls (f y) ↔ cls x = cls y
  sym_arr h := ⟨h.1.2, fun x y => (h.2 x y).1⟩
  sym_bij h := h.1
  sym_inv {f} h := by
    refine ⟨(Equiv.ofBijective f h.1).symm.bijective, fun x y => ?_⟩
    have := h.2 ((Equiv.ofBijective f h.1).symm x) ((Equiv.ofBijective f h.1).symm y)
    rw [Equiv.ofBijective_apply_symm_apply f h.1 x, Equiv.ofBijective_apply_symm_apply f h.1 y] at this
    exact this.symm
  sym_id := ⟨Function.bijective_id, fun _ _ => Iff.rfl⟩
  sym_comp hf hg := ⟨hg.1.comp hf.1, fun x y => (hg.2 _ _).trans (hf.2 x y)⟩

theorem classReflect_transposable : classReflect.toSym.Transposable :=
  transposable_of ∅ Set.finite_empty fun K hK _ y _ => by
    have hfin : {m | Nat.pair (cls y) m ∈ K ∪ {y}}.Finite :=
      (hK.union (Set.finite_singleton y)).preimage
        (fun a _ b _ e => (Nat.pair_eq_pair.1 e).2)
    obtain ⟨m, hm⟩ := hfin.exists_notMem
    have hc : cls y = cls (Nat.pair (cls y) m) := by simp [cls, Nat.unpair_pair]
    refine ⟨Nat.pair (cls y) m, fun h => hm (Or.inl h), fun h => hm (Or.inr h), (Equiv.swap _ _).bijective,
      fun a b => ?_⟩
    rw [cls_swap hc, cls_swap hc]

theorem classReflect_surjectiveArrows : classReflect.toSym.SurjectiveArrows := fun _ k => k.2.1

/-! ### The permutations of infinitely many infinite classes -/

/-- All permutations; the permutations preserving the classes. -/
def permInfClasses : Base where
  Arr f := Function.Bijective f
  arr_id := Function.bijective_id
  arr_comp hf hg := hg.comp hf
  Sym f := Function.Bijective f ∧ ∀ x y, cls (f x) = cls (f y) ↔ cls x = cls y
  sym_arr h := h.1
  sym_bij h := h.1
  sym_inv {f} h := by
    refine ⟨(Equiv.ofBijective f h.1).symm.bijective, fun x y => ?_⟩
    have := h.2 ((Equiv.ofBijective f h.1).symm x) ((Equiv.ofBijective f h.1).symm y)
    rw [Equiv.ofBijective_apply_symm_apply f h.1 x, Equiv.ofBijective_apply_symm_apply f h.1 y] at this
    exact this.symm
  sym_id := ⟨Function.bijective_id, fun _ _ => Iff.rfl⟩
  sym_comp hf hg := ⟨hg.1.comp hf.1, fun x y => (hg.2 _ _).trans (hf.2 x y)⟩

theorem permInfClasses_transposable : permInfClasses.toSym.Transposable :=
  transposable_of ∅ Set.finite_empty fun K hK _ y _ => by
    have hfin : {m | Nat.pair (cls y) m ∈ K ∪ {y}}.Finite :=
      (hK.union (Set.finite_singleton y)).preimage
        (fun a _ b _ e => (Nat.pair_eq_pair.1 e).2)
    obtain ⟨m, hm⟩ := hfin.exists_notMem
    have hc : cls y = cls (Nat.pair (cls y) m) := by simp [cls, Nat.unpair_pair]
    refine ⟨Nat.pair (cls y) m, fun h => hm (Or.inl h), fun h => hm (Or.inr h), (Equiv.swap _ _).bijective,
      fun a b => ?_⟩
    rw [cls_swap hc, cls_swap hc]

theorem permInfClasses_surjectiveArrows : permInfClasses.toSym.SurjectiveArrows := fun _ k => k.2.2

/-! ### Two objects, `ℕ` and a point, all maps -/

/-- `ℕ` at the first object, one point at the second, and every map between them. -/
def allMapsCat : FunCat where
  Obj := Bool
  X b := match b with
    | false => ℕ
    | true => Unit
  Arr _ := True
  arr_id _ := trivial
  arr_comp _ _ := trivial

/-- The symmetries: the permutations, at both objects. -/
def allMapsSyms (V : allMapsCat.Ob) : Set (V ⟶ V) := {g | Function.Bijective (FunCat.fn g)}

theorem allMapsSyms_symGroup : SymGroup allMapsSyms := by
  intro V g hg
  let e := Equiv.ofBijective _ hg
  refine ⟨FunCat.arr (F := allMapsCat) (i := V) (j := V) e.symm trivial, e.symm.bijective, ?_, ?_⟩
  · exact FunCat.hom_ext (funext fun x => e.symm_apply_apply x)
  · exact FunCat.hom_ext (funext fun x => e.apply_symm_apply x)

/-- The base, at the first object, with the finite sets at both. -/
def allMapsBase : SymBase where
  F := allMapsCat
  G := allMapsSyms
  G_id _ := Function.bijective_id
  G_comp hg hs := hs.comp hg
  G_inv := allMapsSyms_symGroup
  W₀ := (false : Bool)
  ne V := match V with
    | false => ⟨(0 : ℕ)⟩
    | true => ⟨()⟩
  J := PinIdeal.fin _
  J_base _ h := h

theorem allMaps_transposable : allMapsBase.Transposable := by
  haveI : Infinite (allMapsBase.F.X allMapsBase.W₀) := inferInstanceAs (Infinite ℕ)
  haveI : DecidableEq (allMapsBase.F.X allMapsBase.W₀) := inferInstanceAs (DecidableEq ℕ)
  exact transposable_of_swaps allMapsBase fun y z =>
    ⟨FunCat.arr (F := allMapsCat) (i := false) (j := false) (Equiv.swap y z) trivial,
      (Equiv.swap y z).bijective, rfl⟩

theorem allMaps_infinitelyManyIndividuals : allMapsBase.model.InfinitelyManyIndividuals :=
  inferInstanceAs (Infinite ℕ)

/-- Separable collapses, the pairs `2i, 2i + 1`: every map is an arrow. -/
theorem allMaps_separable : allMapsBase.SeparableCollapses := by
  refine ⟨fun i => (2 * i : ℕ), fun i => (2 * i + 1 : ℕ), fun i j hij => ?_⟩
  refine ⟨(false : Bool), FunCat.arr (F := allMapsCat) (i := false) (j := false) (twoCollapse i) trivial,
    Or.inl ⟨?_, ?_⟩⟩
  · show twoCollapse i (2 * i) = twoCollapse i (2 * i + 1)
    simp only [twoCollapse]; split_ifs <;> omega
  · show twoCollapse i (2 * j) ≠ twoCollapse i (2 * j + 1)
    simp only [twoCollapse]; split_ifs <;> omega

/-- `g'` on `P`, `g` elsewhere. -/
noncomputable def natSplice (P : Set ℕ) (g g' : ℕ → ℕ) (x : ℕ) : ℕ := by
  classical
  exact if x ∈ P then g' x else g x

/-- `g'` on `P`, `g` on `Q`, shifted down by `K` elsewhere. -/
noncomputable def natSplice3 (P Q : Set ℕ) (K : ℕ) (g g' : ℕ → ℕ) (x : ℕ) : ℕ := by
  classical
  exact if x ∈ P then g' x else if x ∈ Q then g x else x - K

theorem natSplice3_surjective {P Q : Set ℕ} {K : ℕ} (hK : ∀ x ∈ P ∪ Q, x < K) (g g' : ℕ → ℕ) :
    Function.Surjective (natSplice3 P Q K g g') := fun y => ⟨y + K, by
  have h1 : y + K ∉ P := fun h => by have := hK _ (Or.inl h); omega
  have h2 : y + K ∉ Q := fun h => by have := hK _ (Or.inr h); omega
  simp only [natSplice3, if_neg h1, if_neg h2]; omega⟩

theorem natSplice3_P {P Q : Set ℕ} {K : ℕ} {g g' : ℕ → ℕ} {x : ℕ} (hx : x ∈ P) :
    natSplice3 P Q K g g' x = g' x := by
  simp only [natSplice3, if_pos hx]

theorem natSplice3_Q {P Q : Set ℕ} {K : ℕ} {g g' : ℕ → ℕ} {x : ℕ} (hx : x ∈ Q) (hag : x ∈ P → g x = g' x) :
    natSplice3 P Q K g g' x = g x := by
  simp only [natSplice3]
  split_ifs with hxP
  · exact (hag hxP).symm
  · rfl

theorem natSplice3_zero {P Q : Set ℕ} {K : ℕ} {g g' : ℕ → ℕ} (C : Set ℕ) (h0 : (0 : ℕ) ∈ C)
    (hg : g 0 ∈ C) (hg' : g' 0 ∈ C) : natSplice3 P Q K g g' 0 ∈ C := by
  simp only [natSplice3]
  split_ifs
  · exact hg'
  · exact hg
  · simpa using h0

theorem natSplice_P {P : Set ℕ} {g g' : ℕ → ℕ} {x : ℕ} (hx : x ∈ P) : natSplice P g g' x = g' x := by
  simp only [natSplice, if_pos hx]

theorem natSplice_Q {P : Set ℕ} {g g' : ℕ → ℕ} {x : ℕ} (hag : x ∈ P → g x = g' x) :
    natSplice P g g' x = g x := by
  simp only [natSplice]
  split_ifs with hxP
  · exact (hag hxP).symm
  · rfl

/-- **The hull conditions** with `M₀ = ∅`: every map is an arrow, so prescriptions agreeing on
`P ∩ Q` splice, and into the point there is one arrow; the permutations move points. -/
theorem allMaps_hullConditions : allMapsBase.HullConditions := by
  classical
  refine ⟨∅, Set.finite_empty, fun M _ _ V h _ h' hag (P Q : Set ℕ) _ _ hPQ => ?_, fun N P Q hN hP hQ _ => ?_⟩
  · cases V with
    | false =>
      refine ⟨FunCat.arr (F := allMapsCat) (i := false) (j := false) (natSplice P (FunCat.fn h) (FunCat.fn h'))
        trivial, fun (x : ℕ) hx => natSplice_P hx, fun (x : ℕ) hx => natSplice_Q fun hxP => ?_⟩
      have := hag x (hPQ ⟨hxP, hx⟩)
      exact this
    | true => exact ⟨h, fun _ _ => rfl, fun _ _ => rfl⟩
  · obtain ⟨g, hg, hfix, hmove⟩ := move_points (B := allSurj) ∅
      (fun K hK y _ => by
        obtain ⟨z, hz, -⟩ := exists_fresh hK y
        exact ⟨z, hz, (Equiv.swap y z).bijective⟩)
      ((hP.diff (t := N)).toFinset) N Q hN hQ (Set.empty_subset _)
      fun s hs => ((Set.Finite.mem_toFinset _).1 hs).2
    exact ⟨FunCat.arr (F := allMapsCat) (i := false) (j := false) g trivial, hg, hfix,
      fun x hx hxN => hmove x ((Set.Finite.mem_toFinset _).2 ⟨hx, hxN⟩)⟩

/-! ### The qualitative contrast -/

theorem contrast_transposable : contrastBase.Transposable := by
  haveI : Infinite (contrastBase.F.X contrastBase.W₀) := inferInstanceAs (Infinite ℕ)
  haveI : DecidableEq (contrastBase.F.X contrastBase.W₀) := inferInstanceAs (DecidableEq ℕ)
  exact transposable_of_swaps contrastBase fun y z =>
    ⟨FunCat.arr (F := contrastCat) (i := W₀) (j := W₀) (Equiv.swap y z) (Equiv.swap y z).bijective,
      trivial, rfl⟩

/-! ### Two objects, the second unpinned -/

theorem two_transposable : twoBase.Transposable := by
  haveI : Infinite (twoBase.F.X twoBase.W₀) := inferInstanceAs (Infinite ℕ)
  haveI : DecidableEq (twoBase.F.X twoBase.W₀) := inferInstanceAs (DecidableEq ℕ)
  exact transposable_of_swaps twoBase fun y z =>
    ⟨FunCat.arr (F := twoCat) (i := false) (j := false) (Equiv.swap y z) (Equiv.swap y z).bijective,
      (Equiv.swap y z).bijective, rfl⟩

theorem two_infinitelyManyIndividuals : twoBase.model.InfinitelyManyIndividuals :=
  inferInstanceAs (Infinite ℕ)

/-- Separable collapses, the pairs `2i, 2i + 1`: every function into the second object is an
arrow, and `twoCollapse i` collapses the `i`th pair and no other. -/
theorem two_separable : twoBase.SeparableCollapses := by
  refine ⟨fun i => (2 * i : ℕ), fun i => (2 * i + 1 : ℕ), fun i j hij => ?_⟩
  refine ⟨(true : Bool), FunCat.arr (F := twoCat) (i := false) (j := true) (twoCollapse i) trivial, Or.inl ⟨?_, ?_⟩⟩
  · show twoCollapse i (2 * i) = twoCollapse i (2 * i + 1)
    simp only [twoCollapse]; split_ifs <;> omega
  · show twoCollapse i (2 * j) ≠ twoCollapse i (2 * j + 1)
    simp only [twoCollapse]; split_ifs <;> omega

/-- In the two-object model with the second object unpinned, a world is in the symmetry group
exactly when its arrow goes to the first object: the arrows there are all permutations. -/
theorem two_mem_groupProp (U : twoCat.Ob) (k : twoBase.W₀ ⟶ U) :
    (⟨U, PUnit.unit, k⟩ : Tuple (SymT twoBase.F.De twoBase.G twoBase.J) .t twoBase.W₀) ∈ twoBase.groupProp ↔
      U = false := by
  cases U with
  | false => exact iff_of_true ⟨k, k.2, rfl⟩ rfl
  | true =>
    refine iff_of_false ?_ (fun e => by cases e)
    rintro ⟨g, -, he⟩
    exact absurd (Sigma.mk.inj_iff.1 he).1 (fun e => by cases e)

theorem two_symmetryGroupPinned : twoBase.SymmetryGroupPinned := by
  refine ⟨∅, Set.finite_empty, fun V h i _ => ?_⟩
  ext ⟨U, ⟨⟩, k⟩
  show (⟨U, PUnit.unit, h ≫ k⟩ : Tuple (SymT twoBase.F.De twoBase.G twoBase.J) .t twoBase.W₀) ∈ twoBase.groupProp ↔
    (⟨U, PUnit.unit, i ≫ k⟩ : Tuple (SymT twoBase.F.De twoBase.G twoBase.J) .t twoBase.W₀) ∈ twoBase.groupProp
  exact (two_mem_groupProp U (h ≫ k)).trans (two_mem_groupProp U (i ≫ k)).symm

/-- **`actual-world-isolated`**: no arrow returns from the second object to the first. -/
theorem two_actualWorldIsolated : twoBase.model.ActualWorldIsolated :=
  SymBase.actualWorldIsolated_of_pinned two_symmetryGroupPinned fun {V U} i j hm => by
    have hm' := (two_mem_groupProp U (i ≫ j)).1 hm
    refine (two_mem_groupProp V i).2 ?_
    subst hm'
    cases V with
    | false => rfl
    | true => exact j.2.elim

/-! ### The qualitative contrast, evaluated at `W₁` -/

/-- The qualitative-contrast base, with `W₁` as the base object. -/
def contrastBaseW₁ : SymBase := { contrastBase with W₀ := W₁ }

theorem contrastW₁_infinitelyManyIndividuals : contrastBaseW₁.model.InfinitelyManyIndividuals :=
  inferInstanceAs (Infinite ℕ)

/-! ### Recurrent colours -/

/-- The coloured points of an object: `{0, …, m}` at `W_{m+1}` (`some m`), the even numbers at
`W_∞` (`none`). -/
def colour : Option ℕ → Set ℕ
  | some m => {x | x ≤ m}
  | none => {x | Even x}

/-- An object for each positive integer, `some m` for `W_{m+1}`, and `W_∞`, `none`, each with
base `ℕ`; the arrows the surjections sending coloured points to coloured points. -/
def colourCat : FunCat where
  Obj := Option ℕ
  X _ := ℕ
  Arr {V W} f := Function.Surjective f ∧ ∀ x ∈ colour V, f x ∈ colour W
  arr_id _ := ⟨Function.surjective_id, fun _ h => h⟩
  arr_comp hf hg := ⟨hg.1.comp hf.1, fun x hx => hg.2 _ (hf.2 x hx)⟩

/-- The symmetries: the permutations preserving the colour set. -/
def colourSyms (V : colourCat.Ob) : Set (V ⟶ V) :=
  {g | Function.Bijective (FunCat.fn g) ∧ ∀ x, FunCat.fn g x ∈ colour V ↔ x ∈ colour V}

theorem colourSyms_symGroup : SymGroup colourSyms := by
  intro V g hg
  let e := Equiv.ofBijective _ hg.1
  have hp : ∀ x, e.symm x ∈ colour V ↔ x ∈ colour V := fun x => by
    have := hg.2 (e.symm x)
    rw [show FunCat.fn g (e.symm x) = x from e.apply_symm_apply x] at this
    exact this.symm
  refine ⟨FunCat.arr (F := colourCat) (i := V) (j := V) e.symm ⟨e.symm.surjective, fun x hx => (hp x).2 hx⟩,
    ⟨e.symm.bijective, hp⟩, ?_, ?_⟩
  · exact FunCat.hom_ext (funext fun x => e.symm_apply_apply x)
  · exact FunCat.hom_ext (funext fun x => e.apply_symm_apply x)

/-- The base, at `W₁`, with the finite sets everywhere. -/
def colourBase : SymBase where
  F := colourCat
  G := colourSyms
  G_id _ := ⟨Function.bijective_id, fun _ => Iff.rfl⟩
  G_comp hg hs := ⟨hs.1.comp hg.1, fun x => (hs.2 _).trans (hg.2 x)⟩
  G_inv := colourSyms_symGroup
  W₀ := (some 0 : Option ℕ)
  ne _ := ⟨(0 : ℕ)⟩
  J := PinIdeal.fin _
  J_base _ h := h

/-- A transposition of two uncoloured points preserves the colour set. -/
theorem colour_swap {V : Option ℕ} {y z : ℕ} (hy : y ∉ colour V) (hz : z ∉ colour V) (x : ℕ) :
    Equiv.swap y z x ∈ colour V ↔ x ∈ colour V := by
  rcases eq_or_ne x y with rfl | hxy
  · rw [Equiv.swap_apply_left]; exact iff_of_false hz hy
  rcases eq_or_ne x z with rfl | hxz
  · rw [Equiv.swap_apply_right]; exact iff_of_false hy hz
  rw [Equiv.swap_apply_of_ne_of_ne hxy hxz]

/-- **`transposable`**, with the property of being uncoloured and outside `N`. -/
theorem colour_transposable : colourBase.Transposable := by
  refine SymBase.transposable_of_moves (S := colourBase) (fun V x => x ∉ colour V)
    (fun V g hg x hx h => hx ((hg.2 x).1 h)) (fun (K : Set ℕ) hK => ?_) (fun (K : Set ℕ) hK (y : ℕ) hy hyK => ?_)
  · obtain ⟨z, hz, hz0⟩ := exists_fresh hK 0
    exact ⟨z, fun h => hz0 (Nat.le_zero.1 h), hz⟩
  · obtain ⟨z, hz, hzy⟩ := exists_fresh (hK.union (Set.finite_singleton (0 : ℕ))) y
    have hzc : z ∉ colour (some 0) := fun h => hz (Or.inr (Nat.le_zero.1 h))
    refine ⟨FunCat.arr (F := colourCat) (i := some 0) (j := some 0) (Equiv.swap y z)
      ⟨(Equiv.swap y z).surjective, fun x hx => (colour_swap hy hzc x).2 hx⟩,
      ⟨(Equiv.swap y z).bijective, colour_swap hy hzc⟩, fun x hx => ?_, ?_⟩
    · exact swap_fix hyK (fun h => hz (Or.inl h)) hx
    · show Equiv.swap y z y ≠ y
      rw [Equiv.swap_apply_left]; exact hzy

theorem colour_surjectiveArrows : colourBase.SurjectiveArrows := fun _ k => k.2.1

theorem colour_infinitelyManyIndividuals : colourBase.model.InfinitelyManyIndividuals :=
  inferInstanceAs (Infinite ℕ)

/-- Separable collapses, the pairs `2i + 2, 2i + 3`, uncoloured at `W₁`: `halfThen i` fixes the
coloured point `0`. -/
theorem colour_separable : colourBase.SeparableCollapses := by
  have h0 : ∀ i, halfThen i 0 = 0 := fun i => by simp only [halfThen]; rw [if_pos (by omega)]
  let k : ℕ → ((show colourCat.Ob from some 0) ⟶ (show colourCat.Ob from some 0)) := fun i =>
    FunCat.arr (F := colourCat) (i := some 0) (j := some 0) (halfThen i)
      ⟨halfThen_surjective i, fun x hx => by
        have : x = 0 := Nat.le_zero.1 hx
        subst this; show halfThen i 0 ≤ 0; rw [h0]⟩
  refine ⟨fun i => 2 * i + 2, fun i => 2 * i + 3, fun i j hij => ?_⟩
  rcases Nat.lt_or_gt_of_ne hij with h | h
  · exact ⟨some 0, k i, Or.inl (halfThen_sep h)⟩
  · exact ⟨some 0, k j, Or.inr (halfThen_sep h)⟩

/-- **The hull conditions** for recurrent colours, with `M₀ = {0}`, the coloured point of
`W₁`: a prescription agreeing with `h'` on `P` and with `h` on `Q` extends to a surjection, which
sends `0` to a coloured point, every object's colour set containing `0`; and a permutation fixing
`0` and `N` pointwise moves the points of `P` outside `N` off `Q`. -/
theorem colour_hullConditions : colourBase.HullConditions := by
  classical
  have h0c : ∀ V, (0 : ℕ) ∈ colour V := fun V => by
    cases V with
    | some m => exact Nat.zero_le m
    | none => exact ⟨0, rfl⟩
  refine ⟨({0} : Set ℕ), Set.finite_singleton _, fun M _ hM₀ V h _ h' hag (P Q : Set ℕ) hP hQ hPQ => ?_,
    fun N P Q hN hP hQ hM₀ => ?_⟩
  · obtain ⟨K, -, hK⟩ := exists_bound (hP.union hQ)
    have hjc : ∀ x ∈ colour (some 0), natSplice3 P Q K (FunCat.fn h) (FunCat.fn h') x ∈ colour V :=
      fun x hx => by
        have hx0 : x = 0 := Nat.le_zero.1 hx
        subst hx0
        exact natSplice3_zero _ (h0c V) (h.2.2 0 (le_refl 0)) (h'.2.2 0 (le_refl 0))
    refine ⟨FunCat.arr (F := colourCat) (i := some 0) (j := V) (natSplice3 P Q K (FunCat.fn h) (FunCat.fn h'))
      ⟨natSplice3_surjective hK _ _, hjc⟩, fun (x : ℕ) hx => natSplice3_P hx,
      fun (x : ℕ) hx => natSplice3_Q hx fun hxP => ?_⟩
    have := hag x (hPQ ⟨hxP, hx⟩)
    exact this
  · obtain ⟨g, hg, hfix, hmove⟩ := b2_fix0 (B := rangeGap) Iff.rfl N P Q hN hP hQ hM₀
    let gf : ℕ → ℕ := FunCat.fn g
    have hg0 : gf 0 = 0 := hg.2
    have hinj : Function.Injective gf := hg.1.1
    have hcol : ∀ x : ℕ, gf x ∈ colour (some 0) ↔ x ∈ colour (some 0) := fun x => by
      show gf x ≤ 0 ↔ x ≤ 0
      rw [Nat.le_zero, Nat.le_zero]
      exact ⟨fun e => hinj (e.trans hg0.symm), fun e => e ▸ hg0⟩
    exact ⟨FunCat.arr (F := colourCat) (i := some 0) (j := some 0) gf
      ⟨hg.1.2, fun x hx => (hcol x).2 hx⟩, ⟨hg.1, hcol⟩, hfix, hmove⟩

end SymIdeal

/-! ### The old and new individuals -/

namespace OldNew

theorem transposable : base.Transposable := by
  haveI : Infinite (base.F.X base.W₀) := inferInstanceAs (Infinite ℕ)
  haveI : DecidableEq (base.F.X base.W₀) := inferInstanceAs (DecidableEq ℕ)
  exact SymIdeal.transposable_of_swaps base fun y z =>
    ⟨FunCat.arr (F := cat) (i := E) (j := E) (Equiv.swap y z) ⟨(Equiv.swap y z).injective, trivial⟩,
      ⟨(Equiv.swap y z).bijective, fun _ => Iff.rfl⟩, rfl⟩

theorem infinitelyManyIndividuals : base.model.InfinitelyManyIndividuals :=
  inferInstanceAs (Infinite ℕ)

end OldNew

/-! ### The finite-compression entrance -/

namespace FiniteCompression

theorem transposable : (base A).Transposable := by
  haveI : Infinite ((base A).F.X (base A).W₀) := inferInstanceAs (Infinite (ℕ × ℕ))
  haveI : DecidableEq ((base A).F.X (base A).W₀) := inferInstanceAs (DecidableEq (ℕ × ℕ))
  refine SymIdeal.transposable_of_swaps (base A) fun y z => ?_
  let g := mkRoot (Equiv.swap y z) (Equiv.swap y z).surjective
  have hgg : g ≫ g = 𝟙 A := FunCat.hom_ext (funext fun x => Equiv.swap_apply_self y z x)
  exact ⟨g, ⟨g, hgg, hgg⟩, rfl⟩

theorem infinitelyManyIndividuals : (base A).model.InfinitelyManyIndividuals :=
  inferInstanceAs (Infinite (ℕ × ℕ))

/-- Separable collapses: through `Nat.pairEquiv`, the pairs `2i + 2, 2i + 3` of `ℕ` and the
surjections `halfThen i`, which collapse the `i`th pair and no later one. -/
theorem separable : (base A).SeparableCollapses := by
  let e := Nat.pairEquiv
  have key : ∀ i : ℕ, (base A).F.Arr (i := A) (j := A) (e.symm ∘ SymIdeal.halfThen i ∘ e) :=
    fun i => e.symm.surjective.comp ((SymIdeal.halfThen_surjective i).comp e.surjective)
  refine ⟨fun i => e.symm (2 * i + 2), fun i => e.symm (2 * i + 3), fun i j hij => ?_⟩
  have hk : ∀ i x, FunCat.fn (FunCat.arr (F := cat) (i := A) (j := A) _ (key i)) (e.symm x) =
      e.symm (SymIdeal.halfThen i x) :=
    fun i x => by
      show e.symm (SymIdeal.halfThen i (e (e.symm x))) = _
      rw [e.apply_symm_apply]
  rcases Nat.lt_or_gt_of_ne hij with h | h
  · refine ⟨A, FunCat.arr (F := cat) (i := A) (j := A) _ (key i), Or.inl ⟨?_, ?_⟩⟩
    · rw [hk, hk, (SymIdeal.halfThen_sep h).1]
    · rw [hk, hk]; exact fun c => (SymIdeal.halfThen_sep h).2 (e.symm.injective c)
  · refine ⟨A, FunCat.arr (F := cat) (i := A) (j := A) _ (key j), Or.inr ⟨?_, ?_⟩⟩
    · rw [hk, hk, (SymIdeal.halfThen_sep h).1]
    · rw [hk, hk]; exact fun c => (SymIdeal.halfThen_sep h).2 (e.symm.injective c)

/-- A bound beyond the first coordinates of a finite set of points. -/
theorem exists_fst_bound {P : Set Point} (hP : P.Finite) : ∃ K : ℕ, ∀ x ∈ P, x.1 < K := by
  obtain ⟨K, -, hK⟩ := SymIdeal.exists_bound (hP.image Prod.fst)
  exact ⟨K, fun x hx => hK _ ⟨x, hx, rfl⟩⟩

/-- A prescription by `g'` on `P` and by `g` on `Q`, shifted down beyond them: a surjection. -/
noncomputable def splice (P Q : Set Point) (K : ℕ) (g g' : Point → Point) (x : Point) : Point := by
  classical
  exact if x ∈ P then g' x else if x ∈ Q then g x else (x.1 - K, x.2)

theorem splice_surjective {P Q : Set Point} {K : ℕ} (hK : ∀ x ∈ P ∪ Q, x.1 < K) (g g' : Point → Point) :
    Function.Surjective (splice P Q K g g') := fun y => ⟨(y.1 + K, y.2), by
  have h1 : (y.1 + K, y.2) ∉ P := fun h => by have := hK _ (Or.inl h); simp at this
  have h2 : (y.1 + K, y.2) ∉ Q := fun h => by have := hK _ (Or.inr h); simp at this
  simp only [splice, if_neg h1, if_neg h2]
  ext <;> simp⟩

theorem splice_P {P Q : Set Point} {K : ℕ} {g g' : Point → Point} {x : Point} (hx : x ∈ P) :
    splice P Q K g g' x = g' x := by
  simp only [splice, if_pos hx]

theorem splice_Q {P Q : Set Point} {K : ℕ} {g g' : Point → Point} {x : Point} (hx : x ∈ Q)
    (hag : x ∈ P → g x = g' x) : splice P Q K g g' x = g x := by
  simp only [splice]
  split_ifs with hxP
  · exact (hag hxP).symm
  · rfl

/-- **The hull conditions** with `M₀ = ∅`: the arrows out of `A` are the surjections of the
points, into `A` or onto `B`'s points, so prescriptions agreeing on `P ∩ Q` splice; and a
permutation of the points, conjugated from `ℕ`, moves points off a finite set. -/
theorem hullConditions : (base A).HullConditions := by
  classical
  refine ⟨∅, Set.finite_empty, fun M _ _ V h _ h' hag (P Q : Set Point) hP hQ hPQ => ?_,
    fun (N P Q : Set Point) hN hP hQ _ => ?_⟩
  · obtain ⟨K, hK⟩ := exists_fst_bound (hP.union hQ)
    cases V with
    | A =>
      refine ⟨mkRoot (splice P Q K (FunCat.fn h) (FunCat.fn h')) (splice_surjective hK _ _),
        fun x hx => splice_P hx, fun x hx => splice_Q hx fun hxP => hag x (hPQ ⟨hxP, hx⟩)⟩
    | B =>
      obtain ⟨k, -, hkh⟩ := h.2
      obtain ⟨k', -, hkh'⟩ := h'.2
      have ek : ∀ x, FunCat.fn h x = Sum.inl (k x) := fun x => congrFun hkh x
      have ek' : ∀ x, FunCat.fn h' x = Sum.inl (k' x) := fun x => congrFun hkh' x
      refine ⟨mkEntrance (splice P Q K k k') (splice_surjective hK _ _), fun x hx => ?_, fun x hx => ?_⟩
      · show Sum.inl (splice P Q K k k' x) = FunCat.fn h' x
        exact (congrArg Sum.inl (splice_P hx)).trans (ek' x).symm
      · show Sum.inl (splice P Q K k k' x) = FunCat.fn h x
        refine (congrArg Sum.inl (splice_Q hx fun hxP => ?_)).trans (ek x).symm
        have := hag x (hPQ ⟨hxP, hx⟩)
        change FunCat.fn h x = FunCat.fn h' x at this
        rw [ek, ek'] at this
        exact Sum.inl_injective this
  · let e := Nat.pairEquiv
    obtain ⟨σ, hσ, hfix, hmove⟩ := SymIdeal.move_points (B := SymIdeal.allSurj) ∅
      (fun K hK y _ => by
        obtain ⟨z, hz, -⟩ := SymIdeal.exists_fresh hK y
        exact ⟨z, hz, (Equiv.swap y z).bijective⟩)
      (((hP.diff (t := N)).image e).toFinset) (e '' N) (e '' Q) (hN.image e) (hQ.image e)
      (Set.empty_subset _) fun s hs => by
        obtain ⟨x, ⟨-, hxN⟩, rfl⟩ := (Set.Finite.mem_toFinset _).1 hs
        rintro ⟨y, hy, hyx⟩
        exact hxN (e.injective hyx ▸ hy)
    let gE : Equiv.Perm Point := (e.trans (Equiv.ofBijective σ hσ)).trans e.symm
    have hgE : ∀ x, gE x = e.symm (σ (e x)) := fun x => rfl
    let g := mkRoot gE gE.surjective
    let gi := mkRoot gE.symm gE.symm.surjective
    have h1 : g ≫ gi = 𝟙 A := FunCat.hom_ext (funext fun x => gE.symm_apply_apply x)
    have h2 : gi ≫ g = 𝟙 A := FunCat.hom_ext (funext fun x => gE.apply_symm_apply x)
    refine ⟨g, ⟨gi, h1, h2⟩, fun (x : Point) hx => ?_, fun (x : Point) hx hxN => ?_⟩
    · show e.symm (σ (e x)) = x
      rw [hfix (e x) ⟨x, hx, rfl⟩, e.symm_apply_apply]
    · show e.symm (σ (e x)) ∉ Q
      intro hq
      refine hmove (e x) ((Set.Finite.mem_toFinset _).2 ⟨x, ⟨hx, hxN⟩, rfl⟩) ⟨e.symm (σ (e x)), hq, ?_⟩
      rw [e.apply_symm_apply]

end FiniteCompression

end Classicism.Meta.Intensional
