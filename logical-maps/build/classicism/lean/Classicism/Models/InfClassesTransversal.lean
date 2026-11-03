import Classicism.Models.SymmetricIdeal
import Classicism.Models.Monoids
import Classicism.Certified.Schemas

/-!
# Transversal fails at `e` in `symmetric-infinite-classes`

A classifier `F` is pinned down by a finite `N`. For a class `C` missing `N`, the representative `Y`
of the class is pinned down by a finite `P`, and it is fixed by every class-preserving permutation
fixing `N` (by uniqueness). Move `P ∖ N` off `P` by such a permutation `σ`; then `Y` is also pinned
down by `σ[P]`, so its extension at the identity is its extension at any arrow `t` fixing `N`, by a
surjection agreeing with the identity on `P` and with `t ∘ σ⁻¹` on `σ[P]`. For `t` swapping `C` with
another class, this contradicts symmetry.
-/

open CategoryTheory

namespace Classicism.Meta.Intensional.SymIdeal

local notation "A" => model infClasses

/-- An arrow, as a function. -/
abbrev fnC {V U : infClasses.cat.Ob} (k : V ⟶ U) : ℕ → ℕ := FunCat.fn k

/-- A surjection of `ℕ` with prescribed values on a finite set. -/
theorem exists_surj_ext {K : Set ℕ} (hK : K.Finite) (f : ℕ → ℕ) :
    ∃ k : ℕ → ℕ, Function.Surjective k ∧ ∀ x ∈ K, k x = f x := by
  obtain ⟨m, hm⟩ := Monoids.exists_bound hK
  refine ⟨fun x => if x ≤ m then f x else x - (m + 1), fun y => ⟨y + m + 1, ?_⟩, fun x hx => if_pos (hm x hx)⟩
  show (if y + m + 1 ≤ m then f (y + m + 1) else y + m + 1 - (m + 1)) = y
  rw [if_neg (by omega)]; omega

theorem exists_fresh_in_class (c : ℕ) {S : Set ℕ} (hS : S.Finite) : ∃ x, cls x = c ∧ x ∉ S := by
  have hinj : Function.Injective fun s : ℕ => Nat.pair c s := fun s s' e => by
    have := congrArg (fun n => (Nat.unpair n).2) e
    simpa using this
  obtain ⟨x, hx, hxS⟩ := (Set.infinite_range_of_injective hinj).exists_notMem_finite hS
  obtain ⟨s, rfl⟩ := hx
  exact ⟨_, by simp [cls], hxS⟩

/-- A class-preserving permutation moving `A` off `W` and fixing the rest of `W`. -/
theorem exists_move (A' : Finset ℕ) {W : Set ℕ} (hW : W.Finite) (hA : (A' : Set ℕ) ⊆ W) :
    ∃ σ : Equiv.Perm ℕ, (∀ x, cls (σ x) = cls x) ∧ (∀ x ∈ W, x ∉ A' → σ x = x) ∧ ∀ x ∈ A', σ x ∉ W := by
  classical
  induction A' using Finset.induction_on with
  | empty => exact ⟨1, fun _ => rfl, fun _ _ _ => rfl, fun x hx => absurd hx (by simp)⟩
  | insert a B ha ih =>
    obtain ⟨σ, h1, h2, h3⟩ := ih fun x hx => hA (Finset.mem_insert_of_mem hx)
    have haW : a ∈ W := hA (Finset.mem_insert_self _ _)
    obtain ⟨a', hc, ha'⟩ := exists_fresh_in_class (cls a)
      (hW.union (B.finite_toSet.image σ))
    have ha'W : a' ∉ W := fun h => ha' (Or.inl h)
    have ha'B : ∀ x ∈ B, σ x ≠ a' := fun x hx e => ha' (Or.inr ⟨x, hx, e⟩)
    have hσa : σ a = a := h2 a haW ha
    have hswap : ∀ x, cls (Equiv.swap a a' x) = cls x := fun x => by
      by_cases e1 : x = a
      · subst e1; rw [Equiv.swap_apply_left, hc]
      · by_cases e2 : x = a'
        · subst e2; rw [Equiv.swap_apply_right, hc]
        · rw [Equiv.swap_apply_of_ne_of_ne e1 e2]
    refine ⟨σ.trans (Equiv.swap a a'), fun x => ?_, fun x hx hn => ?_, fun x hx => ?_⟩
    · show cls (Equiv.swap a a' (σ x)) = cls x
      rw [hswap, h1]
    · have hxa : x ≠ a := fun e => hn (e ▸ Finset.mem_insert_self _ _)
      have hxB : x ∉ B := fun e => hn (Finset.mem_insert_of_mem e)
      show Equiv.swap a a' (σ x) = x
      rw [h2 x hx hxB, Equiv.swap_apply_of_ne_of_ne hxa (fun e => ha'W (by rw [← e]; exact hx))]
    · show Equiv.swap a a' (σ x) ∉ W
      rcases Finset.mem_insert.1 hx with rfl | hxB
      · rw [hσa, Equiv.swap_apply_left]; exact ha'W
      · have : σ x ≠ a := fun e => h3 x hxB (e ▸ haW)
        rw [Equiv.swap_apply_of_ne_of_ne this (ha'B x hxB)]
        exact h3 x hxB

/-- The arrow of a permutation preserving the classes' pattern. -/
def symOf (σ : Equiv.Perm ℕ) : star infClasses ⟶ star infClasses :=
  FunCat.arr (F := infClasses.cat) (i := ()) (j := ()) σ σ.surjective

theorem symOf_mem {σ : Equiv.Perm ℕ} (h : ∀ x y, cls (σ x) = cls (σ y) ↔ cls x = cls y) :
    symOf σ ∈ syms infClasses (star infClasses) := ⟨σ.bijective, h⟩

/-- The class of `a`, along each arrow. -/
def classProp (a : ℕ) : Intension (SymT infClasses.cat.De (syms infClasses) (PinIdeal.fin _)) (.arr .e .t)
    (star infClasses) :=
  {p | cls (show ℕ from p.2.1.1) = cls (FunCat.fn p.2.2 a)}

theorem classProp_mem (a : ℕ) : classProp a ∈ Set.range ((A).incl (.arr .e .t) (star infClasses)) := by
  refine (mem_range_symIncl infClasses.cat.De (syms infClasses) (PinIdeal.fin _) _ (star infClasses) _).2
    ⟨⟨{a}, Set.finite_singleton a, fun V h i ha => ?_⟩, ?_⟩
  · ext ⟨U, ⟨x, ⟨⟩⟩, j⟩
    have e' : FunCat.fn h a = FunCat.fn i a := ha a rfl
    show cls x = cls (FunCat.fn j (FunCat.fn h a)) ↔ cls x = cls (FunCat.fn j (FunCat.fn i a))
    rw [e']
  · rintro V ⟨x, ⟨⟩⟩ k g hg (hx : cls x = _)
    exact (hg.2 _ _).2 hx

/-- **Transversal at `e` fails** in the symmetric model on the surjections and the class-preserving
pattern. -/
theorem infClasses_not_transversal : ¬ (A).HoldsSentence (P.Transversal.quoted .e) := by
  have Mo : (A).IsModel := model_isModel infClasses
  simp only [Premodel.HoldsSentence, P.Transversal.quoted, (A).holds_forall Mo, (A).holds_imp Mo,
    (A).holds_exists Mo, (A).holds_conj Mo, Premodel.holds_app_var1,
    Premodel.holds_eq_var Mo, IEnv.get]
  rintro ⟨(F : (A).Dom (star infClasses) (.rel (.arr (.rel (.arr .e .t)) .t))), hF⟩
  obtain ⟨NF₀, hNF₀, hpinF⟩ := SymBase.finPinned (S := infClasses.toSym) (.rel _) F
  let NF : Set ℕ := NF₀
  have hNF' : NF.Finite := hNF₀
  obtain ⟨m, hm⟩ := Monoids.exists_bound (hNF'.image cls)
  let c := m + 1
  let a : ℕ := Nat.pair c 0
  have hca : cls a = c := by simp [a, cls]
  obtain ⟨X, hX⟩ := classProp_mem a
  obtain ⟨(Y : (A).Dom (star infClasses) (.rel (.arr .e .t))), hFY, hco, huniq⟩ := hF X
  obtain ⟨P₀, hP₀, hpinY⟩ := SymBase.finPinned (S := infClasses.toSym) (.rel _) Y
  let P : Set ℕ := P₀
  have hP' : P.Finite := hP₀
  -- reading the coextension at the identity
  let tp : ℕ → (star infClasses ⟶ star infClasses) → Tuple (A).inner (.arr .e .t) (star infClasses) :=
    fun z k => ⟨star infClasses, ((show (A).Dom (star infClasses) .e from z), PUnit.unit), k⟩
  have hcoY : ∀ z : ℕ, tp z (𝟙 _) ∈ (A).incl (.arr .e .t) (star infClasses) Y ↔ cls z = c := fun z => by
    have hXz : tp z (𝟙 _) ∈ (A).incl (.arr .e .t) (star infClasses) X ↔ cls z = c := by
      rw [hX, ← hca]; exact Iff.rfl
    exact ⟨fun h => hXz.1 ((hco z).2 h), fun h => (hco z).1 (hXz.2 h)⟩
  have pinY : ∀ (z : ℕ) (k k' : star infClasses ⟶ star infClasses), (∀ x ∈ P, fnC k x = fnC k' x) →
      (tp z k ∈ (A).incl (.arr .e .t) (star infClasses) Y ↔ tp z k' ∈ (A).incl (.arr .e .t) (star infClasses) Y) := by
    intro z k k' ha
    have h2 := hpinY (star infClasses) k k' (fun x hx => ha x hx)
    simp only [Outer.map_rel] at h2
    have e := congrArg (fun S : Intension (A).inner (.arr .e .t) (star infClasses) =>
      tp z (𝟙 _) ∈ S) h2
    simp only [tp, Intension.mem_map, Category.comp_id] at e
    exact iff_of_eq e
  have hDom := SymBase.model_domSym (S := infClasses.toSym)
  have hsymY : ∀ (g : star infClasses ⟶ star infClasses), g ∈ syms infClasses (star infClasses) →
      ∀ (w : ℕ), (tp (fnC g w) g ∈ (A).incl (.arr .e .t) (star infClasses) Y ↔
        tp w (𝟙 _) ∈ (A).incl (.arr .e .t) (star infClasses) Y) := fun g hg w =>
    Premodel.Sym.at_id_iff (syms_symGroup infClasses) (hDom _ (star infClasses) Y)
      ((show (A).Dom (star infClasses) .e from w), PUnit.unit) hg
  -- moving `P ∖ NF` off `P ∪ NF`
  classical
  let A' : Finset ℕ := (hP'.diff (t := NF)).toFinset
  have memA : ∀ x, x ∈ A' ↔ x ∈ P ∧ x ∉ NF := fun x => Set.Finite.mem_toFinset _
  obtain ⟨σ, h1, h2, h3⟩ := exists_move A' (hP'.union hNF') (fun x hx => Or.inl ((memA x).1 hx).1)
  have hσfix : ∀ x ∈ NF, σ x = x := fun x hx => h2 x (Or.inr hx) (fun h => ((memA x).1 h).2 hx)
  have hσpat : ∀ x y, cls (σ x) = cls (σ y) ↔ cls x = cls y := fun x y => by rw [h1, h1]
  let g := symOf σ
  have hg : g ∈ syms infClasses (star infClasses) := symOf_mem hσpat
  -- the permutation fixes `Y`, by uniqueness
  have hgF : ((A).inner (.rel (.arr .e .t))).map g Y = Y := huniq _ ⟨by
      have h1' := Premodel.Sym.at_id (hDom _ (star infClasses) F) (Y, PUnit.unit) hg hFY
      have h2' := hpinF (star infClasses) g (𝟙 _) (fun x hx => hσfix x hx)
      simp only [Outer.map_rel, Intension.map_id] at h2'
      show (⟨star infClasses, ((((A).inner _).map g Y), PUnit.unit), 𝟙 _⟩ :
        Tuple (A).inner (.arr (.rel (.arr .e .t)) .t) (star infClasses)) ∈ (A).incl _ (star infClasses) F
      have h2'' : Intension.map (A).inner g ((A).incl _ (star infClasses) F) = (A).incl _ (star infClasses) F := h2'
      rw [← h2'', Intension.mem_map, Category.comp_id]
      exact h1', fun (z : ℕ) => by
      have hz : tp z (𝟙 _) ∈ (A).incl (.arr .e .t) (star infClasses) (((A).inner _).map g Y) ↔ cls z = c := by
        have e0 : tp z (𝟙 _) ∈ (A).incl (.arr .e .t) (star infClasses) (((A).inner _).map g Y) ↔
            tp z g ∈ (A).incl (.arr .e .t) (star infClasses) Y := Premodel.mem_incl_map_id _ _ _
        have e1 : fnC g (σ.symm z) = z := σ.apply_symm_apply z
        have e2 := hsymY g hg (σ.symm z)
        rw [e1, hcoY] at e2
        rw [e0, e2, ← h1 (σ.symm z), σ.apply_symm_apply]
      have hXz : tp z (𝟙 _) ∈ (A).incl (.arr .e .t) (star infClasses) X ↔ cls z = c := by
        rw [hX, ← hca]; exact Iff.rfl
      exact ⟨fun h => hz.2 (hXz.1 h), fun h => hXz.2 (hz.1 h)⟩⟩
  have hgY : ∀ (z : ℕ) (k : star infClasses ⟶ star infClasses),
      (tp z (g ≫ k) ∈ (A).incl (.arr .e .t) (star infClasses) Y ↔
        tp z k ∈ (A).incl (.arr .e .t) (star infClasses) Y) := fun z k => by
    have e : (A).incl (.arr .e .t) (star infClasses) (((A).inner (.rel (.arr .e .t))).map g Y) =
        Intension.map (A).inner g ((A).incl (.arr .e .t) (star infClasses) Y) := (A).incl_map _ g Y
    rw [hgF] at e
    exact (Iff.of_eq (congrArg (fun S => tp z k ∈ S) e)).symm
  -- the swap of the class `c` with `c + 1`
  let τ : Equiv.Perm ℕ := Nat.pairEquiv.symm.trans
    ((Equiv.prodCongr (Equiv.swap c (c + 1)) (Equiv.refl ℕ)).trans Nat.pairEquiv)
  have hτcls : ∀ x, cls (τ x) = Equiv.swap c (c + 1) (cls x) := fun x => by
    show (Nat.unpair (Nat.pair (Equiv.swap c (c + 1) (Nat.unpair x).1) (Nat.unpair x).2)).1 = _
    rw [Nat.unpair_pair]; rfl
  have hτpat : ∀ x y, cls (τ x) = cls (τ y) ↔ cls x = cls y := fun x y => by
    rw [hτcls, hτcls]; exact (Equiv.swap c (c + 1)).injective.eq_iff
  have hτfix : ∀ x ∈ NF, τ x = x := fun x hx => by
    have hb : cls x ≤ m := hm _ ⟨x, hx, rfl⟩
    have e : Equiv.swap c (c + 1) (cls x) = cls x :=
      Equiv.swap_apply_of_ne_of_ne (by show cls x ≠ m + 1; omega) (by show cls x ≠ m + 1 + 1; omega)
    show Nat.pair (Equiv.swap c (c + 1) (cls x)) (Nat.unpair x).2 = x
    rw [e]; exact Nat.pair_unpair x
  let t := symOf τ
  have ht : t ∈ syms infClasses (star infClasses) := symOf_mem hτpat
  -- a surjection from the identity on `P` to `τ ∘ σ⁻¹` on `σ[P ∖ NF]`
  obtain ⟨k₁, hk₁s, hk₁⟩ := exists_surj_ext (hP'.union (A'.finite_toSet.image σ))
    (fun y => if y ∈ P then y else τ (σ.symm y))
  let k : star infClasses ⟶ star infClasses := FunCat.arr (F := infClasses.cat) (i := ()) (j := ()) k₁ hk₁s
  have hk1 : ∀ x ∈ P, fnC (𝟙 (star infClasses)) x = fnC k x := fun x hx => by
    show x = k₁ x
    rw [hk₁ x (Or.inl hx)]; exact (if_pos hx).symm
  have hk2 : ∀ x ∈ P, fnC (g ≫ k) x = fnC t x := fun x hx => by
    show k₁ (σ x) = τ x
    by_cases hn : x ∈ NF
    · rw [hσfix x hn, hk₁ x (Or.inl hx), hτfix x hn]; exact if_pos hx
    · have hxA : x ∈ A' := (memA x).2 ⟨hx, hn⟩
      rw [hk₁ (σ x) (Or.inr ⟨x, hxA, rfl⟩)]
      show (if σ x ∈ P then σ x else τ (σ.symm (σ x))) = τ x
      rw [if_neg (fun h => h3 x hxA (Or.inl h)), σ.symm_apply_apply]
  -- the chain
  have ha1 : tp a (𝟙 _) ∈ (A).incl (.arr .e .t) (star infClasses) Y := (hcoY a).2 hca
  have ha2 : tp a t ∈ (A).incl (.arr .e .t) (star infClasses) Y :=
    (pinY a _ _ hk2).1 ((hgY a k).2 ((pinY a _ _ hk1).1 ha1))
  have e1 : fnC t (τ.symm a) = a := τ.apply_symm_apply a
  have e2 := hsymY t ht (τ.symm a)
  rw [e1, hcoY] at e2
  have e3 := e2.1 ha2
  have e4 : cls (τ (τ.symm a)) = Equiv.swap c (c + 1) (cls (τ.symm a)) := hτcls _
  rw [τ.apply_symm_apply, hca, e3, Equiv.swap_apply_left] at e4
  omega

end Classicism.Meta.Intensional.SymIdeal

namespace Classicism.Meta.Intensional.SymIdeal

theorem infClasses_not_transversal_consistent :
    AxiomSet.Consistent (AxiomSet.single (Term.neg (P.Transversal.quoted .e))) :=
  AxiomSet.Consistent.of_model _ (model_isModel infClasses)
    (Premodel.holdsAx_single _ (((model infClasses).holdsSentence_neg (model_isModel infClasses) _).2
      infClasses_not_transversal))

end Classicism.Meta.Intensional.SymIdeal
