import Mathlib.CategoryTheory.Category.Preorder
import Classicism.Completeness.CanonicalSyntax
import Classicism.Semantics.Intensional

/-!
# The canonical domains and the canonical inclusion

The pieces of the canonical intensional action premodel, on the preorder of worlds
(`Completeness/Worlds.lean`) read as a category (`Preorder.smallCategory`), so that an
arrow `w ⟶ v` is a proof of `w ≤ v`.

* The **inner domain** at a world `w` and a type `σ` is the set of closed terms of type `σ`
  in `w`'s language, modulo the identities in `w`'s theory (`Dom w σ`). An arrow acts as
  the identity on representatives, which is well defined because languages grow and
  identities persist along accessibility (`inLang_of_le`, `eq_of_le`).
* The **extension** of a closed relational term `a` at a world `v`, for arguments
  `x₁, …, xₙ` (classes at `v`), is whether `a x₁' … xₙ'` is in `v`'s theory, for chosen
  representatives `xₖ'` (`ev`). It does not depend on the representatives, nor on `a` up to
  identity in `v` (`ev_congr`, `ev_congr_arg`), and it is invariant under conversion
  (`ev_conv`).
* The **inclusion** of the class of `a` at `w` is the intension of the tuples
  `⟨v, x̄, w ≤ v⟩` whose extension `a` has at `v` (`incl`). It is natural, since an arrow is
  the identity on representatives; and it is injective by Intensionality, `a = b ↔
  □(a ≡_ρ b)`, the successor lemma, and the reading of coextensiveness (`mem_coext`).

Then the readings of the type-subscripted operations, each by induction on the relational
type through its δ-unfolding (`ev_constR`, `ev_negR`, …, `ev_boxR`, `mem_coext`,
`mem_inclR`): the second induction of the truth lemma (`Completeness/CanonicalTruth.lean`).
-/

namespace Classicism.Meta

namespace Completeness

open CategoryTheory Term Intensional

variable {Sig : Signature}

namespace Canonical

/-! ### Term classes -/

/-- The closed terms of type `σ` in `w`'s language. -/
def Tm (w : World Sig) (σ : Ty) : Type := {a : Term (ext Sig) [] σ // InLang w.S a}

/-- Identity in `w`'s theory, an equivalence on its closed terms. -/
instance tmSetoid (w : World Sig) (σ : Ty) : Setoid (Tm w σ) where
  r a b := eq' a.1 b.1 ∈ w.Γ
  iseqv := ⟨fun a => World.eq_refl a.2, World.eq_symm, World.eq_trans⟩

/-- The canonical inner domain at `w` and `σ`: term classes. -/
def Dom (w : World Sig) (σ : Ty) : Type := Quotient (tmSetoid w σ)

variable {w v u : World Sig} {σ : Ty}

/-- The class of a closed term of the language. -/
def cls (a : Term (ext Sig) [] σ) (ha : InLang w.S a) : Dom w σ := Quotient.mk _ ⟨a, ha⟩

/-- A chosen representative. -/
noncomputable def rep (x : Dom w σ) : Term (ext Sig) [] σ := (Quotient.out x).1

theorem rep_inLang (x : Dom w σ) : InLang w.S (rep x) := (Quotient.out x).2

@[simp] theorem cls_rep (x : Dom w σ) : cls (rep x) (rep_inLang x) = x := Quotient.out_eq x

theorem cls_eq_cls {a b : Term (ext Sig) [] σ} {ha : InLang w.S a} {hb : InLang w.S b} :
    cls a ha = cls b hb ↔ eq' a b ∈ w.Γ := Quotient.eq

theorem rep_cls (a : Term (ext Sig) [] σ) (ha : InLang w.S a) : eq' (rep (cls a ha)) a ∈ w.Γ :=
  cls_eq_cls.1 (cls_rep (cls a ha))

theorem eq_rep_iff (x y : Dom w σ) : eq' (rep x) (rep y) ∈ w.Γ ↔ x = y := by
  rw [← cls_eq_cls (ha := rep_inLang x) (hb := rep_inLang y), cls_rep, cls_rep]

theorem dom_ind {P : Dom w σ → Prop} (h : ∀ a ha, P (cls a ha)) (x : Dom w σ) : P x :=
  Quotient.inductionOn x fun a => h a.1 a.2

/-- Transport along accessibility: the identity on representatives. -/
def Dom.map (h : w ≤ v) : Dom w σ → Dom v σ :=
  Quotient.map (fun a => ⟨a.1, World.inLang_of_le h a.2⟩) (fun _ _ hab => World.eq_of_le h hab)

@[simp] theorem Dom.map_cls (h : w ≤ v) (a : Term (ext Sig) [] σ) (ha : InLang w.S a) :
    Dom.map h (cls a ha) = cls a (World.inLang_of_le h ha) := rfl

/-- The canonical inner action at `σ`. Reducible, so that its objects are seen to be the
term classes. -/
abbrev inner (σ : Ty) : World Sig ⥤ Type where
  obj w := Dom w σ
  map h := TypeCat.ofHom (Dom.map h.le)
  map_id w := by
    ext x
    induction x using dom_ind
    rfl
  map_comp h k := by
    ext x
    induction x using dom_ind
    rfl

@[simp] theorem inner_map_cls (h : w ⟶ v) (a : Term (ext Sig) [] σ) (ha : InLang w.S a) :
    (inner σ).map h (cls a ha) = cls a (World.inLang_of_le h.le ha) := rfl

theorem rep_map (h : w ⟶ v) (x : Dom w σ) : eq' (rep ((inner σ).map h x)) (rep x) ∈ v.Γ := by
  induction x using dom_ind with
  | h a ha =>
    rw [inner_map_cls]
    exact World.eq_trans (rep_cls a _) (World.eq_symm (World.eq_of_le h.le (rep_cls a ha)))

/-! ### Extensions -/

/-- The extension of a closed relational term at a world, for argument classes there: is
the term applied to their representatives in the world's theory? -/
noncomputable def ev : ∀ (ρ : RTy) (v : World Sig), Term (ext Sig) [] ρ → Args inner ρ v → Prop
  | .t, v, a, _ => a ∈ v.Γ
  | .arr _ ρ, v, a, xs => ev ρ v (.app a (rep xs.1)) xs.2

@[simp] theorem ev_t (a : Sentence (ext Sig)) (xs : Args inner .t v) : ev .t v a xs ↔ a ∈ v.Γ :=
  Iff.rfl

@[simp] theorem ev_arr {σ : Ty} {ρ : RTy} (a : Term (ext Sig) [] (σ ⇒ ρ)) (x : Dom v σ)
    (xs : Args inner ρ v) : ev (.arr σ ρ) v a (x, xs) ↔ ev ρ v (.app a (rep x)) xs := Iff.rfl

/-- The extension depends on the term only up to identity in the world. -/
theorem ev_congr : ∀ (ρ : RTy) {a b : Term (ext Sig) [] ρ} (xs : Args inner ρ v),
    eq' a b ∈ v.Γ → (ev ρ v a xs ↔ ev ρ v b xs)
  | .t, a, b, _, h => by
    have hb : InLang v.S b := (inLang_app.1 (World.inLang_of_mem h)).2
    have ha : InLang v.S a := (inLang_app.1 (inLang_app.1 (World.inLang_of_mem h)).1).2
    exact ⟨fun h' => World.mem_of_th (Derivable.eqMp (World.th_of_mem h) (World.th_of_mem h')) hb,
      fun h' => World.mem_of_th (Derivable.eqMpr (World.th_of_mem h) (World.th_of_mem h')) ha⟩
  | .arr _ ρ, a, b, xs, h => by
    have hc := rep_inLang xs.1
    have hb : InLang v.S b := (inLang_app.1 (World.inLang_of_mem h)).2
    have ha : InLang v.S a := (inLang_app.1 (inLang_app.1 (World.inLang_of_mem h)).1).2
    refine ev_congr ρ xs.2 (World.mem_of_th (Derivable.eqCongrFun (World.th_of_mem h) _) ?_)
    simp [ha, hb, hc]

/-- … and on the argument only up to identity. -/
theorem ev_congr_arg {σ : Ty} (ρ : RTy) {a : Term (ext Sig) [] (σ ⇒ ρ)} (ha : InLang v.S a)
    {c c' : Term (ext Sig) [] σ} (xs : Args inner ρ v) (h : eq' c c' ∈ v.Γ) :
    ev ρ v (.app a c) xs ↔ ev ρ v (.app a c') xs := by
  have hc : InLang v.S c := (inLang_app.1 (inLang_app.1 (World.inLang_of_mem h)).1).2
  have hc' : InLang v.S c' := (inLang_app.1 (World.inLang_of_mem h)).2
  exact ev_congr ρ xs (World.mem_of_th (Derivable.eqCongr a (World.th_of_mem h)) (by simp [ha, hc, hc']))

/-- The extension is invariant under conversion. -/
theorem ev_conv : ∀ (ρ : RTy) {a b : Term (ext Sig) [] ρ} (xs : Args inner ρ v),
    a ≡ b → InLang v.S a → InLang v.S b → (ev ρ v a xs ↔ ev ρ v b xs)
  | .t, _, _, _, h, ha, hb => World.mem_iff_conv h ha hb
  | .arr _ ρ, _, _, xs, h, ha, hb => by
    have hc := rep_inLang xs.1
    exact ev_conv ρ xs.2 (Conv.app_congr h (Conv.refl _)) (by simp [ha, hc]) (by simp [hb, hc])

/-- A member of the extension is in the language. -/
theorem inLang_of_ev : ∀ (ρ : RTy) {a : Term (ext Sig) [] ρ} (xs : Args inner ρ v),
    ev ρ v a xs → InLang v.S a
  | .t, _, _, h => World.inLang_of_mem h
  | .arr _ ρ, _, xs, h => (inLang_app.1 (inLang_of_ev ρ xs.2 h)).1

/-! ### The inclusion -/

/-- The canonical inclusion: the class of `a` at `w` is the intension of the tuples
`⟨v, x̄, w ≤ v⟩` with `x̄` in the extension of `a` at `v`. -/
noncomputable def incl (ρ : RTy) (w : World Sig) : Dom w (.rel ρ) → Intension inner ρ w :=
  Quotient.lift (fun a => {p | ev ρ p.1 a.1 p.2.1}) (fun _ _ hab =>
    Set.ext fun p => ev_congr ρ p.2.1 (World.eq_of_le p.2.2.le hab))

@[simp] theorem mem_incl_cls (ρ : RTy) (a : Term (ext Sig) [] ρ) (ha : InLang w.S a)
    (p : Tuple inner ρ w) : p ∈ incl ρ w (cls a ha) ↔ ev ρ p.1 a p.2.1 := Iff.rfl

theorem mem_incl (ρ : RTy) (X : Dom w (.rel ρ)) (p : Tuple inner ρ w) :
    p ∈ incl ρ w X ↔ ev ρ p.1 (rep X) p.2.1 := by
  conv_lhs => rw [← cls_rep X]
  exact Iff.rfl

theorem incl_map (ρ : RTy) (h : w ⟶ v) (x : Dom w (.rel ρ)) :
    incl ρ v ((inner (Ty.rel ρ)).map h x) = Intension.map inner h (incl ρ w x) := by
  induction x using dom_ind
  rfl

/-- Application of the inclusion of a class to a class: the inclusion of the class of the
application. -/
theorem incl_app {σ : Ty} {ρ : RTy} (F : Term (ext Sig) [] (σ ⇒ ρ)) (hF : InLang w.S F)
    (A : Term (ext Sig) [] σ) (hA : InLang w.S A) :
    (incl (.arr σ ρ) w (cls F hF)).app inner (cls A hA)
      = incl ρ w (cls (.app F A) (inLang_app.2 ⟨hF, hA⟩)) := by
  ext ⟨V, xs, k⟩
  rw [Intension.mem_app, inner_map_cls, mem_incl_cls, mem_incl_cls]
  exact ev_congr_arg ρ (World.inLang_of_le k.le hF) xs (rep_cls A _)

/-! ### The type-subscripted operations, by induction on the type -/

section Operations

theorem conv_delta {Γ : Ctx} {τ : Ty} {a b : Term (ext Sig) Γ τ} (h : a.unfoldR = some b) : a ≡ b :=
  Conv.delta h

/-- `const_ρ p` holds of anything iff `p` is true. -/
theorem ev_constR : ∀ (ρ : RTy) {p : Sentence (ext Sig)} (xs : Args inner ρ v), InLang v.S p →
    (ev ρ v (.app (.constR ρ) p) xs ↔ p ∈ v.Γ)
  | .t, p, xs, hp => by
    rw [ev_t]
    refine World.mem_iff_conv ?_ (by simp [hp]) hp
    exact Conv.trans (Conv.app_congr (conv_delta rfl) (Conv.refl _)) (Conv.beta _ _)
  | .arr _ ρ, p, ⟨x, xs⟩, hp => by
    have hc := rep_inLang x
    rw [ev_arr, ← ev_constR ρ xs hp]
    refine ev_conv ρ xs ?_ (by simp [hp, hc]) (by simp [hp])
    exact Conv.trans (Conv.app_congr (Conv.app_congr (conv_delta rfl) (Conv.refl _)) (Conv.refl _))
      (conv_beta2 (Term.app (.constR ρ) Term.v1) p _)

/-- `¬_ρ X` holds of `x̄` iff `X` does not. -/
theorem ev_negR : ∀ (ρ : RTy) {a : Term (ext Sig) [] ρ} (xs : Args inner ρ v), InLang v.S a →
    (ev ρ v (.app (.negR ρ) a) xs ↔ ¬ ev ρ v a xs)
  | .t, a, xs, ha => by
    rw [ev_t, ev_t, ← World.mem_neg_iff ha]
    exact World.mem_iff_conv (Conv.app_congr (conv_delta rfl) (Conv.refl _)) (by simp [ha]) (by simp [ha])
  | .arr _ ρ, a, ⟨x, xs⟩, ha => by
    have hc := rep_inLang x
    rw [ev_arr, ev_arr, ← ev_negR ρ xs (by simp [ha, hc])]
    refine ev_conv ρ xs ?_ (by simp [ha, hc]) (by simp [ha, hc])
    exact Conv.trans (Conv.app_congr (Conv.app_congr (conv_delta rfl) (Conv.refl _)) (Conv.refl _))
      (conv_beta2 (Term.app (.negR ρ) (Term.app Term.v1 Term.v0)) a _)

/-- `X ∧_ρ Y` holds of `x̄` iff both do. -/
theorem ev_andR : ∀ (ρ : RTy) {a b : Term (ext Sig) [] ρ} (xs : Args inner ρ v), InLang v.S a →
    InLang v.S b → (ev ρ v (.app (.app (.andR ρ) a) b) xs ↔ ev ρ v a xs ∧ ev ρ v b xs)
  | .t, a, b, xs, ha, hb => by
    rw [ev_t, ev_t, ev_t, ← World.mem_conj_iff ha hb]
    exact World.mem_iff_conv (Conv.app_congr (Conv.app_congr (conv_delta rfl) (Conv.refl _)) (Conv.refl _))
      (by simp [ha, hb]) (by simp [ha, hb])
  | .arr _ ρ, a, b, ⟨x, xs⟩, ha, hb => by
    have hc := rep_inLang x
    rw [ev_arr, ev_arr, ev_arr, ← ev_andR ρ xs (by simp [ha, hc]) (by simp [hb, hc])]
    refine ev_conv ρ xs ?_ (by simp [ha, hb, hc]) (by simp [ha, hb, hc])
    exact Conv.trans (Conv.app_congr (Conv.app_congr (Conv.app_congr (conv_delta rfl) (Conv.refl _))
        (Conv.refl _)) (Conv.refl _))
      (conv_beta3 (Term.app (Term.app (.andR ρ) (Term.app Term.v2 Term.v0)) (Term.app Term.v1 Term.v0)) a b _)

/-- `X ∨_ρ Y` holds of `x̄` iff either does. -/
theorem ev_orR : ∀ (ρ : RTy) {a b : Term (ext Sig) [] ρ} (xs : Args inner ρ v), InLang v.S a →
    InLang v.S b → (ev ρ v (.app (.app (.orR ρ) a) b) xs ↔ ev ρ v a xs ∨ ev ρ v b xs)
  | .t, a, b, xs, ha, hb => by
    rw [ev_t, ev_t, ev_t, ← World.mem_disj_iff ha hb]
    exact World.mem_iff_conv (Conv.app_congr (Conv.app_congr (conv_delta rfl) (Conv.refl _)) (Conv.refl _))
      (by simp [ha, hb]) (by simp [ha, hb])
  | .arr _ ρ, a, b, ⟨x, xs⟩, ha, hb => by
    have hc := rep_inLang x
    rw [ev_arr, ev_arr, ev_arr, ← ev_orR ρ xs (by simp [ha, hc]) (by simp [hb, hc])]
    refine ev_conv ρ xs ?_ (by simp [ha, hb, hc]) (by simp [ha, hb, hc])
    exact Conv.trans (Conv.app_congr (Conv.app_congr (Conv.app_congr (conv_delta rfl) (Conv.refl _))
        (Conv.refl _)) (Conv.refl _))
      (conv_beta3 (Term.app (Term.app (.orR ρ) (Term.app Term.v2 Term.v0)) (Term.app Term.v1 Term.v0)) a b _)

/-- A universal sentence `∀z. P` with `P` an application of closed terms to `z`, read
through its instances. -/
theorem mem_forall_iff {τ : Ty} (P : Formula (ext Sig) [τ]) (hP : InLang v.S P) :
    Term.forall' P ∈ v.Γ ↔ ∀ c : Term (ext Sig) [] τ, InLang v.S c → P.instantiate c ∈ v.Γ := by
  rw [World.mem_all_iff (inLang_lam.2 hP)]
  refine forall_congr' fun c => forall_congr' fun hc => ?_
  exact World.mem_iff_conv (Conv.beta _ _) (by simp [hP, hc]) (inLang_instantiate hP hc)

theorem instantiate_app_weaken {σ : Ty} {ρ : RTy} (a : Term (ext Sig) [] (σ ⇒ ρ)) (c : Term (ext Sig) [] σ) :
    (Term.app a.weaken Term.v0 : Term (ext Sig) [σ] ρ).instantiate c = Term.app a c := by
  show Term.app (a.weaken.instantiate c) c = _
  rw [Term.instantiate_weaken]

/-- The unfolding of a pointwise binary operation at `τ → ρ` (coextensiveness or
implication), applied to closed terms and then instantiated. -/
theorem instantiate_pointwise {τ : Ty} {ρ : RTy} (K : Term (ext Sig) [τ] (ρ ⇒ ρ ⇒ RTy.t))
    (K' : Term (ext Sig) [] (ρ ⇒ ρ ⇒ RTy.t)) (hK : ∀ c : Term (ext Sig) [] τ, K.instantiate c = K')
    (a b : Term (ext Sig) [] (τ ⇒ ρ)) (c : Term (ext Sig) [] τ) :
    (Term.app (Term.app K (Term.app a.weaken Term.v0)) (Term.app b.weaken Term.v0)).instantiate c
      = Term.app (Term.app K' (Term.app a c)) (Term.app b c) := by
  show Term.app (Term.app (K.instantiate c) ((Term.app a.weaken Term.v0).instantiate c))
    ((Term.app b.weaken Term.v0).instantiate c) = _
  rw [hK, instantiate_app_weaken, instantiate_app_weaken]

/-- Coextensiveness at `ρ` is in the theory iff the extensions agree: the reading that
makes the inclusion injective. -/
theorem mem_coext : ∀ (ρ : RTy) {a b : Term (ext Sig) [] ρ}, InLang v.S a → InLang v.S b →
    (Term.app (.app (.coextR ρ) a) b ∈ v.Γ ↔ ∀ xs : Args inner ρ v, ev ρ v a xs ↔ ev ρ v b xs)
  | .t, a, b, ha, hb => by
    have hc : Term.app (.app (.coextR .t) a) b ≡ Term.iff a b :=
      Conv.trans (Conv.app_congr (Conv.app_congr (conv_delta rfl) (Conv.refl _)) (Conv.refl _))
        (conv_beta2 (Term.iff Term.v1 Term.v0) a b)
    rw [World.mem_iff_conv hc (by simp [ha, hb]) (by simp [ha, hb]), World.mem_iff_iff ha hb]
    exact ⟨fun h _ => h, fun h => h PUnit.unit⟩
  | .arr τ ρ, a, b, ha, hb => by
    have hP : InLang v.S (Term.app (Term.app (Term.coextR ρ) (Term.app a.weaken Term.v0))
        (Term.app b.weaken Term.v0) : Formula (ext Sig) [τ]) := by simp [ha, hb]
    have hc : Term.app (.app (.coextR (τ ⇒ ρ)) a) b ≡ Term.forall' (Term.app (Term.app (Term.coextR ρ)
        (Term.app a.weaken Term.v0)) (Term.app b.weaken Term.v0)) :=
      Conv.trans (Conv.app_congr (Conv.app_congr (conv_delta rfl) (Conv.refl _)) (Conv.refl _))
        (conv_beta2 _ a b)
    rw [World.mem_iff_conv hc (by simp [ha, hb]) (by simpa using hP), mem_forall_iff _ hP]
    simp only [instantiate_pointwise (Term.coextR ρ) (Term.coextR ρ) (fun _ => rfl)]
    constructor
    · rintro h ⟨x, xs⟩
      have hx := rep_inLang x
      rw [ev_arr, ev_arr]
      exact (mem_coext ρ (by simp [ha, hx]) (by simp [hb, hx])).1 (h (rep x) hx) xs
    · intro h c hc
      refine (mem_coext ρ (by simp [ha, hc]) (by simp [hb, hc])).2 fun xs => ?_
      have hx := rep_cls c hc
      rw [← ev_congr_arg ρ ha xs hx, ← ev_congr_arg ρ hb xs hx]
      exact h (cls c hc, xs)

/-- Pointwise implication at `ρ` is in the theory iff the extensions are included. -/
theorem mem_inclR : ∀ (ρ : RTy) {a b : Term (ext Sig) [] ρ}, InLang v.S a → InLang v.S b →
    (Term.app (.app (.inclR ρ) a) b ∈ v.Γ ↔ ∀ xs : Args inner ρ v, ev ρ v a xs → ev ρ v b xs)
  | .t, a, b, ha, hb => by
    have hc : Term.app (.app (.inclR .t) a) b ≡ Term.imp a b :=
      Conv.trans (Conv.app_congr (Conv.app_congr (conv_delta rfl) (Conv.refl _)) (Conv.refl _))
        (conv_beta2 (Term.imp Term.v1 Term.v0) a b)
    rw [World.mem_iff_conv hc (by simp [ha, hb]) (by simp [ha, hb]), World.mem_imp_iff ha hb]
    exact ⟨fun h _ => h, fun h => h PUnit.unit⟩
  | .arr τ ρ, a, b, ha, hb => by
    have hP : InLang v.S (Term.app (Term.app (Term.inclR ρ) (Term.app a.weaken Term.v0))
        (Term.app b.weaken Term.v0) : Formula (ext Sig) [τ]) := by simp [ha, hb]
    have hc : Term.app (.app (.inclR (τ ⇒ ρ)) a) b ≡ Term.forall' (Term.app (Term.app (Term.inclR ρ)
        (Term.app a.weaken Term.v0)) (Term.app b.weaken Term.v0)) :=
      Conv.trans (Conv.app_congr (Conv.app_congr (conv_delta rfl) (Conv.refl _)) (Conv.refl _))
        (conv_beta2 _ a b)
    rw [World.mem_iff_conv hc (by simp [ha, hb]) (by simpa using hP), mem_forall_iff _ hP]
    simp only [instantiate_pointwise (Term.inclR ρ) (Term.inclR ρ) (fun _ => rfl)]
    constructor
    · rintro h ⟨x, xs⟩
      have hx := rep_inLang x
      rw [ev_arr, ev_arr]
      exact (mem_inclR ρ (by simp [ha, hx]) (by simp [hb, hx])).1 (h (rep x) hx) xs
    · intro h c hc
      refine (mem_inclR ρ (by simp [ha, hc]) (by simp [hb, hc])).2 fun xs => ?_
      have hx := rep_cls c hc
      rw [← ev_congr_arg ρ ha xs hx, ← ev_congr_arg ρ hb xs hx]
      exact h (cls c hc, xs)

/-- `□p` is in the theory iff `p` is in every accessible world's: by the definition of
accessibility one way, by the successor lemma the other. -/
theorem mem_box_iff [Countable Sig.Const] {p : Sentence (ext Sig)} (hp : InLang v.S p) :
    Term.box p ∈ v.Γ ↔ ∀ (U : World Sig) (_ : v ⟶ U), p ∈ U.Γ := by
  constructor
  · intro h U j
    exact j.le p h
  · intro h
    by_contra hn
    obtain ⟨U, hU, hnU⟩ := World.exists_le_of_not_box hp hn
    exact World.not_mem_and_neg (h U hU.hom) hnU

/-- `□_ρ X` holds of `x̄` iff `X` holds of `x̄` at every accessible world. -/
theorem ev_boxR [Countable Sig.Const] : ∀ (ρ : RTy) {a : Term (ext Sig) [] ρ} (xs : Args inner ρ v),
    InLang v.S a →
    (ev ρ v (.app (.boxR ρ) a) xs ↔ ∀ (U : World Sig) (j : v ⟶ U), ev ρ U a (Args.map inner ρ j xs))
  | .t, a, xs, ha => by
    have hc : Term.app (.boxR .t) a ≡ Term.box a :=
      Conv.trans (Conv.app_congr (conv_delta rfl) (Conv.refl _)) (Conv.beta (Term.box Term.v0) a)
    rw [ev_t, World.mem_iff_conv hc (by simp [ha]) (by simp [ha])]
    exact mem_box_iff ha
  | .arr _ ρ, a, ⟨x, xs⟩, ha => by
    have hc := rep_inLang x
    have hcv : Term.app (Term.app (.boxR (_ ⇒ ρ)) a) (rep x)
        ≡ Term.app (.boxR ρ) (Term.app a (rep x)) :=
      Conv.trans (Conv.app_congr (Conv.app_congr (conv_delta rfl) (Conv.refl _)) (Conv.refl _))
        (conv_beta2 (Term.app (.boxR ρ) (Term.app Term.v1 Term.v0)) a _)
    rw [ev_arr, ev_conv ρ xs hcv (by simp [ha, hc]) (by simp [ha, hc])]
    rw [ev_boxR ρ xs (by simp [ha, hc])]
    refine forall_congr' fun U => forall_congr' fun j => ?_
    show _ ↔ ev ρ U (.app a (rep ((inner _).map j x))) (Args.map inner ρ j xs)
    exact (ev_congr_arg ρ (World.inLang_of_le j.le ha) _ (rep_map j x)).symm

end Operations

end Canonical

end Completeness

end Classicism.Meta
