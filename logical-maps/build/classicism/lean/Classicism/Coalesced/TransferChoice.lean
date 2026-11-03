import Classicism.Coalesced.Transfer
import Classicism.Models.SymmetricIdeal
import Classicism.Models.Monoids

/-!
# Intensional Choice at `e`: the model on all surjections, and the transfer to a coalesced root
-/

open CategoryTheory

namespace Classicism.Meta.Intensional.Premodel

variable {C : Type} [SmallCategory C] (B : Premodel Signature.pure C) (M : B.IsModel)
include M

omit M in
theorem mem_ext_map {σ : Ty} {V : C} (k : B.W₀ ⟶ V) (F : B.Dom B.W₀ (.rel (.arr σ .t))) (y : B.Dom V σ) :
    (y, PUnit.unit) ∈ Intension.ext' B.inner (B.incl (σ ⇒ RTy.t) V (((B.inner (.rel (.arr σ .t))).map k) F)) ↔
      (⟨V, (y, PUnit.unit), k⟩ : Tuple B.inner (.arr σ .t) B.W₀) ∈ B.incl _ B.W₀ F := by
  show (⟨V, (y, PUnit.unit), 𝟙 V⟩ : Tuple B.inner (.arr σ .t) V) ∈ B.incl (σ ⇒ RTy.t) V (((B.inner (.rel (.arr σ .t))).map k) F) ↔ _
  rw [B.incl_map, Intension.mem_map, Category.comp_id]

theorem holds_le_lam {σ : Ty} (F G : B.Dom B.W₀ (.rel (.arr σ .t))) :
    B.Holds (𝟙 B.W₀) ((Term.var Var.zero.succ).eq' (Term.lam
        (((Term.var Var.zero.succ).app (Term.var Var.zero)).disj
          ((Term.var Var.zero.succ.succ).app (Term.var Var.zero)))))
      (IEnv.cons G (IEnv.cons F IEnv.nil)) ↔ B.incl _ B.W₀ G ⊆ B.incl _ B.W₀ F := by
  have hs : ∀ {U : C} (x : B.Dom U σ) (i : B.W₀ ⟶ U),
      (⟨U, (x, PUnit.unit), i⟩ : Tuple B.inner (.arr σ .t) B.W₀) ∈ B.sem (𝟙 B.W₀) (Term.lam
        (((Term.var Var.zero.succ).app (Term.var Var.zero)).disj
          ((Term.var Var.zero.succ.succ).app (Term.var Var.zero))))
        (IEnv.cons G (IEnv.cons F IEnv.nil)) ↔
      (⟨U, (x, PUnit.unit), i⟩ : Tuple B.inner (.arr σ .t) B.W₀) ∈ B.incl _ B.W₀ G ∨
      (⟨U, (x, PUnit.unit), i⟩ : Tuple B.inner (.arr σ .t) B.W₀) ∈ B.incl _ B.W₀ F := fun {U} x i => by
    rw [mem_sem_lam, B.sem_disj M]
    show (B.Holds _ _ _ ∨ B.Holds _ _ _) ↔ _
    simp only [holds_app_var1, IEnv.get, Premodel.push_cons, B.mem_ext_map]
  rw [B.holds_eq M]
  constructor
  · intro e ⟨U, ⟨x, ⟨⟩⟩, i⟩ ht
    have e' : B.incl _ B.W₀ F = _ := e
    rw [e']
    exact (hs x i).2 (Or.inl ht)
  · intro hle
    show B.incl _ B.W₀ F = _
    ext ⟨U, ⟨x, ⟨⟩⟩, i⟩
    rw [hs]
    exact ⟨Or.inr, fun h => h.elim (fun h => hle h) id⟩

theorem holds_ic_iff (σ : Ty) : B.HoldsSentence (P.IntensionalChoice.quoted σ) ↔
    ∀ F : B.Dom B.W₀ (.rel (.arr σ .t)),
      (∀ {V : C} (k : B.W₀ ⟶ V), ∃ y : B.Dom V σ,
        (⟨V, (y, PUnit.unit), k⟩ : Tuple B.inner (.arr σ .t) B.W₀) ∈ B.incl _ B.W₀ F) →
      ∃ G : B.Dom B.W₀ (.rel (.arr σ .t)), B.incl _ B.W₀ G ⊆ B.incl _ B.W₀ F ∧
        ∀ {V : C} (k : B.W₀ ⟶ V), ∃ x : B.Dom V σ,
          (⟨V, (x, PUnit.unit), k⟩ : Tuple B.inner (.arr σ .t) B.W₀) ∈ B.incl _ B.W₀ G ∧
          ∀ y : B.Dom V σ, (⟨V, (y, PUnit.unit), k⟩ : Tuple B.inner (.arr σ .t) B.W₀) ∈ B.incl _ B.W₀ G → y = x := by
  simp only [HoldsSentence, P.IntensionalChoice.quoted, B.holds_forall M, B.holds_imp M, B.holds_exists M,
    B.holds_conj M, B.holds_box M, holds_app_var1, B.holds_eq_var M, IEnv.get, IEnv.get_map, B.mem_ext_map,
    B.holds_le_lam M]

end Classicism.Meta.Intensional.Premodel

namespace Classicism.Meta.Intensional.SymIdeal

local notation "A" => model allSurj

/-- An arrow, as a function. -/
abbrev fnS {V U : (allSurj).cat.Ob} (k : V ⟶ U) : ℕ → ℕ := FunCat.fn k

/-- A surjection sending all of `{0, …, m}` to `0`. -/
def crush (m : ℕ) : star allSurj ⟶ star allSurj :=
  FunCat.arr (F := allSurj.cat) (i := ()) (j := ()) ((fun x : ℕ => if x ≤ m then (0 : ℕ) else x - (m + 1)) : ℕ → ℕ) (by
    intro y
    refine ⟨y + m + 1, ?_⟩
    show (if y + m + 1 ≤ m then 0 else y + m + 1 - (m + 1)) = y
    rw [if_neg (by omega)]; omega)

theorem crush_apply {m x : ℕ} (hx : x ≤ m) : fnS (crush m) x = 0 := by
  show (if x ≤ m then (0 : ℕ) else x - (m + 1)) = 0
  exact if_pos hx

/-- **Intensional Choice at `e` fails** in the symmetric model on all surjections
(`intensional-choice-collapse`): `F := λx. x ≠ 0`; a `G ≤ F` necessarily uniquely instantiated is
pinned down by a finite `N`; a surjection `h` sends `N ∪ {0}` to `0`; `G`'s instance `y` at `h` is
not `0`, and a transposition moving `y` and fixing `0` keeps `G` by pinning and moves its instance
by symmetry. -/
theorem allSurj_not_ic : ¬ (A).HoldsSentence (P.IntensionalChoice.quoted .e) := by
  have Mo : (A).IsModel := model_isModel allSurj
  rw [(A).holds_ic_iff Mo]
  intro H
  obtain ⟨F, hF⟩ := avoid_mem (B := allSurj) ({0} : Set ℕ) (Set.finite_singleton 0)
  have hF' : ∀ (x : ℕ) (k : star allSurj ⟶ star allSurj),
      (⟨star allSurj, ((show (A).Dom (star allSurj) .e from x), PUnit.unit), k⟩ :
        Tuple (A).inner (.arr .e .t) (star allSurj)) ∈ (A).incl (.arr .e .t) (star allSurj) F ↔
        x ≠ fnS k 0 := fun x k => by
    rw [hF]
    show x ∉ fnS k '' ({0} : Set ℕ) ↔ _
    simp
  obtain ⟨G, hle, hu⟩ := H F fun {V} k => by
    cases V
    exact ⟨(show ℕ from fnS k 0 + 1), (hF' _ k).2 (by omega)⟩
  obtain ⟨N, hN, hpin⟩ := SymBase.finPinned (S := allSurj.toSym) (.rel _) G
  obtain ⟨m, hm⟩ := Monoids.exists_bound (X := (N : Set ℕ)) hN
  let h := crush m
  obtain ⟨(y : ℕ), hy, huniq⟩ := hu h
  have hy0' : y ≠ 0 := by
    have := (hF' y h).1 (hle hy)
    rwa [show fnS h 0 = 0 from crush_apply (Nat.zero_le _)] at this
  let σ : Equiv.Perm ℕ := Equiv.swap y (y + 1)
  let g : star allSurj ⟶ star allSurj := FunCat.arr (F := allSurj.cat) (i := ()) (j := ()) σ σ.surjective
  have hg : g ∈ syms allSurj (star allSurj) := σ.bijective
  have hσ0 : σ 0 = 0 := Equiv.swap_apply_of_ne_of_ne (Ne.symm hy0') (by omega)
  -- symmetry
  have h1 := SymBase.model_domSym (S := allSurj.toSym) _ (star allSurj) G (star allSurj) (y, PUnit.unit) h g hg hy
  -- pinning: `h ≫ g` agrees with `h` on `N`
  have h2 := hpin (star allSurj) (h ≫ g) h (fun x hx => by
    show σ (fnS h x) = fnS h x
    rw [crush_apply (hm x hx)]; exact hσ0)
  simp only [Outer.map_rel] at h2
  have h3 : (⟨star allSurj, ((show (A).Dom (star allSurj) .e from σ y), PUnit.unit), h⟩ :
      Tuple (A).inner (.arr .e .t) (star allSurj)) ∈ (A).incl _ (star allSurj) G := by
    have e := congrArg (fun X : Intension (A).inner (.arr .e .t) (star allSurj) =>
      (⟨star allSurj, ((show (A).Dom (star allSurj) .e from σ y), PUnit.unit), 𝟙 _⟩ :
        Tuple (A).inner (.arr .e .t) (star allSurj)) ∈ X) h2
    simp only [Intension.mem_map, Category.comp_id] at e
    exact (cast e) h1
  have e4 : σ y = y := huniq _ h3
  rw [show σ y = y + 1 from Equiv.swap_apply_left _ _] at e4
  omega

theorem allSurj_not_ic_consistent :
    AxiomSet.Consistent (AxiomSet.single (Term.neg (P.IntensionalChoice.quoted .e))) :=
  AxiomSet.Consistent.of_model _ (model_isModel allSurj)
    (Premodel.holdsAx_single _ (((A).holdsSentence_neg (model_isModel allSurj) _).2 allSurj_not_ic))

end Classicism.Meta.Intensional.SymIdeal

namespace Classicism.Meta.Coalesced.SumData

open CategoryTheory.Sigma Classicism.Meta.Intensional

variable {D : SumData} (hD : D.DistinguishedArrows)
include hD

/-- **Intensional Choice at `e` fails at the root** (`intensional-choice-component`): a component
refutes it at its root with `F`; a root `G` below the thread universal at the root and elsewhere
with part `F` would have as its part a witness for `F`. -/
theorem not_holds_ic (hF : D.FullestDomains) (hc : D.CompleteComponents) :
    ¬ D.model.HoldsAx P.IntensionalChoice.schemaIn := by
  rw [Premodel.holdsAx_ofPure]
  intro H
  have H0 := (D.model.reduct.holds_ic_iff root_isModel .e).1 (H _ ⟨.e, by decide, rfl⟩)
  obtain ⟨k, hk⟩ := exists_comp hD hc (q := P.IntensionalChoice.quoted .e) (by decide)
    SymIdeal.allSurj_not_ic_consistent
  rw [show (D.A k).reduct.HoldsSentence (P.IntensionalChoice.quoted .e) ↔ _ from
    (D.A k).reduct.holds_ic_iff (compRoot_isModel hD k) .e] at hk
  refine hk fun (X : (D.A k).Dom (D.A k).W₀ (.rel (.arr .e .t))) hX => ?_
  let T := thread hD hF Set.univ (parts (univPart hD (.arr .e .t)) k X)
  obtain ⟨G, hle, hu⟩ := H0 T fun {U} r => by
    cases U with
    | root =>
      obtain ⟨z⟩ := D.ne
      exact ⟨z, (mem_thread_root hD hF _ _ _ r).2 trivial⟩
    | of x =>
      obtain ⟨k', U⟩ := x
      change D.S.R.obj ⟨k', U⟩ at r
      by_cases e : k' = k
      · subst e
        obtain ⟨y, hy⟩ := hX (fac hD r)
        exact ⟨y, (mem_incl_of hD T (k := k') (U := U) (y, PUnit.unit) r).2 (by
          rw [tr_thread, parts_self]; exact hy)⟩
      · obtain ⟨y⟩ := (D.A k').nonempty_e U
        exact ⟨y, (mem_incl_of hD T (k := k') (U := U) (y, PUnit.unit) r).2 (by
          rw [tr_thread, parts_ne _ _ e, incl_univPart]; trivial)⟩
  refine ⟨D.RA.tr _ (distArrow hD k) G, ?_, fun {V : D.C k} (l : (D.A k).W₀ ⟶ V) => ?_⟩
  · have := ((incl_subset_iff hD G T).1 hle).2 k
    rwa [tr_thread, parts_self] at this
  · let r : D.S.R.obj ⟨k, V⟩ := D.S.R.map (SigmaHom.mk l) (distArrow hD k)
    have hfac : fac hD r = l := by
      show fac hD (D.S.R.map (SigmaHom.mk l) (distArrow hD k)) = l
      rw [fac_map, fac_distArrow, Category.id_comp]
    obtain ⟨x, hx, hxu⟩ := hu (CoalescedSum.arr D.S r)
    have conv : ∀ y : (D.A k).Dom V .e, (⟨CoalescedSum.of ⟨k, V⟩, (y, PUnit.unit), CoalescedSum.arr D.S r⟩ :
        Tuple D.RA.inner (.arr .e .t) (CoalescedSum.base D.S)) ∈ D.RI.incl _ G ↔
        (⟨V, (y, PUnit.unit), l⟩ : Tuple (D.A k).inner (.arr .e .t) (D.A k).W₀) ∈
          (D.A k).incl _ _ (D.RA.tr _ (distArrow hD k) G) := fun y => by
      have := mem_incl_of hD G (k := k) (U := V) (y, PUnit.unit) r
      rw [hfac] at this; exact this
    exact ⟨x, (conv x).1 hx, fun y hy => hxu y ((conv y).2 hy)⟩

end Classicism.Meta.Coalesced.SumData
