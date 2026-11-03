import Classicism.Semantics.IntensionalTheory
import Classicism.Semantics.IntensionalProperties
import Classicism.Certified.Schemas

/-!
# What holds in every full model

The map's general arguments about full and extensionally full models (`arguments/` in the
topic), as theorems about intensional action models:

- **Relational Choice** holds in every extensionally full model (`holds_rc`), the map's
  `relational-choice-full`; and at every arrow of a full one, so `□`Relational Choice
  (`holds_box_rc`), `relational-choice-full-boxed`.
- **Transversal Choice** holds in every extensionally full model (`holds_tc`).
- **Truths are ND-necessary** holds where the actual world is isolated (`holds_truths_nd_necessary`).
- **Atomicity** and **Rigid Comprehension** hold at every arrow of a full model
  (`holds_box_atomicity`, `holds_box_rigid_comprehension`): below a nonzero relation is the
  singleton of one of its tuples; and the relation whose extension at an arrow is `X`'s
  extension transported along it is rigid and coextensive with `X`.

Lean's metatheory has choice, and the choice is `Classical.choose`; the map's arguments for these
verdicts are marked `choice: uses`, so its variants read without choice do not get them.
-/

namespace Classicism.Meta.Intensional

open CategoryTheory

namespace Premodel

variable {Sig : Signature} {C : Type} [SmallCategory C] (A : Premodel Sig C)

/-- **Extensionally full** at every object: every set of tuples from the domains at an object
is the extension, at the identity arrow, of an element of the domain of the matching
relational type there. -/
def ExtFull : Prop :=
  ∀ (ρ : RTy) (W : C) (E : Set (Args A.inner ρ W)),
    ∃ x : A.Dom W (.rel ρ), (A.incl ρ W x).ext' A.inner = E

/-- A full model is extensionally full. -/
theorem Full.extFull (h : A.Full) : A.ExtFull := by
  intro ρ W E
  obtain ⟨x, hx⟩ := h ρ W {p | ∃ a ∈ E, p = ⟨W, a, 𝟙 W⟩}
  refine ⟨x, ?_⟩
  ext a
  simp only [Intension.ext', hx, Set.mem_ofPred_eq]
  constructor
  · rintro ⟨a', ha', e⟩
    cases e
    exact ha'
  · intro ha
    exact ⟨a, ha, rfl⟩

variable {A}

/-- A relation variable applied to two variables holds iff its extension contains them. -/
theorem holds_app_var2 {Γ : Ctx} {W : C} (h : A.W₀ ⟶ W) (g : IEnv (A.Dom W) Γ) {σ τ : Ty}
    (R : Var Γ (.rel (.arr σ (.arr τ .t)))) (x : Var Γ σ) (y : Var Γ τ) :
    A.Holds h (.app (.app (.var R) (.var x)) (.var y)) g ↔
      (g.get x, (g.get y, PUnit.unit)) ∈ (A.incl _ W (g.get R)).ext' A.inner := by
  rw [A.holds_app h g (.app (.var R) (.var x)) (.var y) (a' := g.get y) rfl]
  show _ ∈ A.apply (A.sem h (.var R) g) (A.Incl σ W (g.get x)) ↔ _
  rw [A.apply_Incl]
  simp [Intension.ext']
  rfl

/-- A relation variable applied to one variable. -/
theorem holds_app_var1 {Γ : Ctx} {W : C} (h : A.W₀ ⟶ W) (g : IEnv (A.Dom W) Γ) {σ : Ty}
    (F : Var Γ (.rel (.arr σ .t))) (x : Var Γ σ) :
    A.Holds h (.app (.var F) (.var x)) g ↔
      (g.get x, PUnit.unit) ∈ (A.incl _ W (g.get F)).ext' A.inner := by
  rw [A.holds_app h g (.var F) (.var x) (a' := g.get x) rfl]
  rfl

/-- Two variables are equal iff their values are. -/
theorem holds_eq_var (M : A.IsModel) {Γ : Ctx} {W : C} (h : A.W₀ ⟶ W) (g : IEnv (A.Dom W) Γ)
    {σ : Ty} (x y : Var Γ σ) : A.Holds h (Term.eq' (.var x) (.var y)) g ↔ g.get x = g.get y := by
  rw [A.holds_eq M]
  exact ⟨fun e => A.Incl_injective σ W e, fun e => congrArg (A.Incl σ W) e⟩

/-! ### Relational Choice -/

/-- Relational Choice at `σ`, `τ`, at an arrow into an object where the model is extensionally
full: a serial relation's extension has a functional subset by choice, and that subset is the
extension of an element of the domain. -/
theorem holds_rc_at {B : Premodel Signature.pure C} (M : B.IsModel) {W : C}
    (hE : ∀ (ρ : RTy) (E : Set (Args B.inner ρ W)), ∃ x : B.Dom W (.rel ρ), (B.incl ρ W x).ext' B.inner = E)
    (h : B.W₀ ⟶ W) (σ τ : Ty) : B.Holds h (P.RelationalChoice.quoted σ τ) .nil := by
  simp only [P.RelationalChoice.quoted, B.holds_forall M, B.holds_imp M, B.holds_exists M,
    B.holds_conj M, holds_app_var2, holds_eq_var M, IEnv.get]
  intro U hU
  choose f hf using hU
  obtain ⟨S, hS⟩ := hE (.arr σ (.arr τ .t)) {a | a.2.1 = f a.1}
  refine ⟨S, fun x => ⟨f x, ?_, fun z hz => ?_⟩, fun x y hxy => ?_⟩
  · rw [hS]; rfl
  · rw [hS] at hz; exact hz.symm
  · rw [hS] at hxy
    have hy : y = f x := hxy
    exact hy ▸ hf x

/-- Relational Choice at `σ`, `τ`, at any arrow of an extensionally full model. -/
theorem holds_rc {B : Premodel Signature.pure C} (M : B.IsModel) (hE : B.ExtFull) {W : C}
    (h : B.W₀ ⟶ W) (σ τ : Ty) : B.Holds h (P.RelationalChoice.quoted σ τ) .nil :=
  holds_rc_at M (hE · W) h σ τ

/-- `□`Relational Choice: Relational Choice at every arrow, every object being extensionally
full. -/
theorem holds_box_rc {B : Premodel Signature.pure C} (M : B.IsModel) (hE : B.ExtFull) {W : C}
    (h : B.W₀ ⟶ W) (σ τ : Ty) : B.Holds h (P.NecRelationalChoice.quoted σ τ) .nil := by
  show B.Holds h (Term.box (P.RelationalChoice.quoted σ τ)) .nil
  rw [B.holds_box M]
  intro V k
  exact holds_rc M hE (h ≫ k) σ τ

/-! ### Transversal Choice -/

/-- Transversal Choice at `σ`, at any arrow of an extensionally full model: the
representatives of the cells of an equivalence relation's extension, chosen by
`Quotient.out`, are the extension of an element of the domain. -/
theorem holds_tc {B : Premodel Signature.pure C} (M : B.IsModel) (hE : B.ExtFull) {W : C}
    (h : B.W₀ ⟶ W) (σ : Ty) : B.Holds h (P.TransversalChoice.quoted σ) .nil := by
  simp only [P.TransversalChoice.quoted, B.holds_forall M, B.holds_imp M, B.holds_exists M,
    B.holds_conj M, holds_app_var2, holds_app_var1, holds_eq_var M, IEnv.get]
  rintro R ⟨hrefl, hsymm, htrans⟩
  let r : Setoid (B.Dom W σ) :=
    ⟨fun x y => (x, (y, PUnit.unit)) ∈ (B.incl _ W R).ext' B.inner, ⟨hrefl, hsymm _ _, htrans _ _ _⟩⟩
  obtain ⟨F, hF⟩ := hE (.arr σ .t) W {a | a.1 = (Quotient.mk r a.1).out}
  refine ⟨F, fun x => ⟨(Quotient.mk r x).out, ?_, ?_, fun z ⟨hxz, hz⟩ => ?_⟩⟩
  · exact hsymm _ _ (Quotient.mk_out (s := r) x)
  · rw [hF]
    show _ = (Quotient.mk r (Quotient.mk r x).out).out
    rw [Quotient.out_eq]
  · rw [hF] at hz
    have hz : z = (Quotient.mk r z).out := hz
    rw [hz, Quotient.sound (s := r) (hsymm _ _ hxz)]

/-! ### Truths are ND-necessary -/

variable (A) in
/-- **The actual world is isolated**: the actual-world proposition `a`, true and entailing
every truth, is in the domain at the evaluation object, and no world outside `a` sees a world
in `a`. -/
def ActualWorldIsolated : Prop :=
  ∃ a : A.Dom A.W₀ (.rel .t), (A.incl .t A.W₀ a).True A.inner ∧
    (∀ p : A.Dom A.W₀ (.rel .t), (A.incl .t A.W₀ p).True A.inner → A.incl .t A.W₀ a ⊆ A.incl .t A.W₀ p) ∧
    ∀ {V U : C} (i : A.W₀ ⟶ V) (j : V ⟶ U), (⟨V, PUnit.unit, i⟩ : Tuple A.inner .t A.W₀) ∉ A.incl .t A.W₀ a →
      (⟨U, PUnit.unit, i ≫ j⟩ : Tuple A.inner .t A.W₀) ∉ A.incl .t A.W₀ a

/-- Truths are ND-necessary where the actual world is isolated: for a true `p`, take
`q := a`; at a world in `a`, `p` holds, and at a world outside it `◇a` fails. -/
theorem holds_truths_nd_necessary {B : Premodel Signature.pure C} (M : B.IsModel) (hI : B.ActualWorldIsolated) :
    B.HoldsSentence P.TruthsAreNDNecessary.quoted := by
  obtain ⟨a, ha, hle, hiso⟩ := hI
  simp only [Premodel.HoldsSentence, P.TruthsAreNDNecessary.quoted, B.holds_forall M,
    B.holds_imp M, B.holds_exists M, B.holds_conj M, B.holds_box M, B.holds_dia M, holds_var,
    IEnv.get, IEnv.get_map, B.incl_map, Intension.mem_map, Category.comp_id, Category.id_comp]
  intro p hp
  refine ⟨a, ha, fun {V} k ⟨U, j, hj⟩ => ?_⟩
  by_contra hk
  exact hiso k j (fun h => hk (hle p hp h)) hj

/-! ### The relational constants, applied -/

theorem sem_var {Γ : Ctx} {W : C} (h : A.W₀ ⟶ W) (g : IEnv (A.Dom W) Γ) {ρ : RTy}
    (v : Var Γ (.rel ρ)) : A.sem h (.var v) g = A.incl ρ W (g.get v) := rfl

section Constants

variable (M : A.IsModel)
include M

theorem sem_negR {Γ : Ctx} {W : C} (h : A.W₀ ⟶ W) (g : IEnv (A.Dom W) Γ) (ρ : RTy)
    (a : Term Sig Γ ρ) : A.sem h (.app (.negR ρ) a) g = (A.sem h a g)ᶜ := by
  obtain ⟨a', ha⟩ := Set.mem_range.mp (M h a g)
  show A.apply (A.negRead ρ W) (A.sem h a g) = _
  rw [← ha, A.apply_Incl]
  exact A.app_negRead a'

theorem sem_boxR {Γ : Ctx} {W : C} (h : A.W₀ ⟶ W) (g : IEnv (A.Dom W) Γ) (ρ : RTy)
    (a : Term Sig Γ ρ) : A.sem h (.app (.boxR ρ) a) g =
      {p | ∀ (U : C) (k : p.1 ⟶ U), (⟨U, Args.map A.inner ρ k p.2.1, p.2.2 ≫ k⟩ : Tuple A.inner ρ W) ∈ A.sem h a g} := by
  obtain ⟨a', ha⟩ := Set.mem_range.mp (M h a g)
  show A.apply (A.boxRead ρ W) (A.sem h a g) = _
  rw [← ha, A.apply_Incl]
  exact A.app_boxRead a'

theorem holds_inclR {Γ : Ctx} {W : C} (h : A.W₀ ⟶ W) (g : IEnv (A.Dom W) Γ) (ρ : RTy)
    (a b : Term Sig Γ ρ) : A.Holds h (.app (.app (.inclR ρ) a) b) g ↔
      ∀ x : Args A.inner ρ W, (⟨W, x, 𝟙 W⟩ : Tuple A.inner ρ W) ∈ A.sem h a g →
        (⟨W, x, 𝟙 W⟩ : Tuple A.inner ρ W) ∈ A.sem h b g := by
  obtain ⟨a', ha⟩ := Set.mem_range.mp (M h a g)
  obtain ⟨b', hb⟩ := Set.mem_range.mp (M h b g)
  unfold Holds
  show _ ∈ A.apply (A.apply (A.inclRead ρ W) (A.sem h a g)) (A.sem h b g) ↔ _
  rw [← ha, ← hb, A.apply_Incl, A.apply_Incl, A.app_inclRead]
  rfl

theorem holds_coextR {Γ : Ctx} {W : C} (h : A.W₀ ⟶ W) (g : IEnv (A.Dom W) Γ) (ρ : RTy)
    (a b : Term Sig Γ ρ) : A.Holds h (.app (.app (.coextR ρ) a) b) g ↔
      ∀ x : Args A.inner ρ W, (⟨W, x, 𝟙 W⟩ : Tuple A.inner ρ W) ∈ A.sem h a g ↔
        (⟨W, x, 𝟙 W⟩ : Tuple A.inner ρ W) ∈ A.sem h b g := by
  obtain ⟨a', ha⟩ := Set.mem_range.mp (M h a g)
  obtain ⟨b', hb⟩ := Set.mem_range.mp (M h b g)
  unfold Holds
  show _ ∈ A.apply (A.apply (A.coextRead ρ W) (A.sem h a g)) (A.sem h b g) ↔ _
  rw [← ha, ← hb, A.apply_Incl, A.apply_Incl, A.app_coextRead]
  rfl

end Constants

/-! ### Atomicity -/

/-- Atomicity at `ρ`, at any arrow to an object where the model is full: below a nonzero
relation is the singleton of one of its tuples, an atom, entailment being inclusion. -/
theorem holds_atomicity {B : Premodel Signature.pure C} (M : B.IsModel) (hF : B.Full) {W : C}
    (h : B.W₀ ⟶ W) (ρ : RTy) : B.Holds h (P.Atomicity.quoted ρ) .nil := by
  simp only [P.Atomicity.quoted, B.holds_forall M, B.holds_disj M, B.holds_exists M, B.holds_conj M,
    B.holds_neg M, B.holds_eq M, B.sem_orR M, sem_negR M, sem_var, IEnv.get]
  have e1 : ∀ S : Set (Tuple B.inner ρ W), Sᶜ = S ∪ Sᶜ ↔ S = ∅ := fun S => by
    rw [Set.union_compl_self, Set.compl_univ_iff]
  intro x
  by_cases hx : B.incl ρ W x = ∅
  · exact Or.inl ((e1 _).2 hx)
  · right
    obtain ⟨p, hp⟩ := Set.nonempty_iff_ne_empty.2 hx
    obtain ⟨y, hy⟩ := hF ρ W {p}
    have e2 : ∀ S : Set (Tuple B.inner ρ W), ({p} = S ∪ {p} ∧ ¬ S = {p}) ↔ S = ∅ := fun S => by
      constructor
      · rintro ⟨h1, h2⟩
        have hs : S ⊆ {p} := Set.union_eq_right.1 h1.symm
        exact (Set.subset_singleton_iff_eq.1 hs).resolve_right h2
      · rintro rfl
        exact ⟨(Set.empty_union _).symm, fun e => Set.singleton_ne_empty p e.symm⟩
    refine ⟨y, fun z => ?_, ?_⟩
    · rw [hy, e1, e2]
      tauto
    · rw [hy]
      exact (Set.union_eq_right.2 (Set.singleton_subset_iff.2 hp)).symm

/-! ### Rigid Comprehension -/

/-- Rigid Comprehension at `ρ`, at any arrow to an object where the model is full: for `X`,
the relation `Y` whose extension at an arrow `i` is `X`'s extension at `W` transported along `i`
is coextensive with `X`, persistent, and inextensible. -/
theorem holds_rigid_comprehension {B : Premodel Signature.pure C} (M : B.IsModel) (hF : B.Full)
    {W : C} (h : B.W₀ ⟶ W) (ρ : RTy) : B.Holds h (P.RigidComprehension.quoted ρ) .nil := by
  simp only [P.RigidComprehension.quoted, B.holds_forall M, B.holds_exists M, B.holds_conj M,
    B.holds_box M, B.holds_imp M, holds_inclR M, holds_coextR M, sem_boxR M, sem_var, IEnv.get,
    IEnv.get_map, B.incl_map, Intension.mem_map, Set.mem_ofPred_eq, Category.comp_id,
    Category.id_comp]
  intro X
  obtain ⟨Y, hY⟩ := hF ρ W {p | ∃ e, (⟨W, e, 𝟙 W⟩ : Tuple B.inner ρ W) ∈ B.incl ρ W X ∧
    p.2.1 = Args.map B.inner ρ p.2.2 e}
  refine ⟨Y, ⟨fun k x hx U k₁ => ?_, fun k Z hZ V₁ k₁ x hx => ?_⟩, fun x => ?_⟩
  · rw [hY] at hx ⊢
    obtain ⟨e, he, hxe⟩ := hx
    change x = Args.map B.inner ρ k e at hxe
    subst hxe
    exact ⟨e, he, (Args.map_comp _ ρ k k₁ e).symm⟩
  · rw [hY] at hx
    obtain ⟨e, he, hxe⟩ := hx
    change x = Args.map B.inner ρ (k ≫ k₁) e at hxe
    subst hxe
    have := hZ (Args.map B.inner ρ k e) (by rw [hY]; exact ⟨e, he, rfl⟩) V₁ k₁
    rwa [← Args.map_comp] at this
  · rw [hY]
    constructor
    · intro hx
      exact ⟨x, hx, (Args.map_id _ ρ W x).symm⟩
    · rintro ⟨e, he, hx⟩
      rw [show x = e from hx.trans (Args.map_id _ ρ W e)]
      exact he

/-- `□`Atomicity: Atomicity at every arrow, every object being full. -/
theorem holds_box_atomicity {B : Premodel Signature.pure C} (M : B.IsModel) (hF : B.Full) {W : C}
    (h : B.W₀ ⟶ W) (ρ : RTy) : B.Holds h (P.NecAtomicity.quoted ρ) .nil := by
  show B.Holds h (Term.box (P.Atomicity.quoted ρ)) .nil
  rw [B.holds_box M]
  intro V k
  exact holds_atomicity M hF (h ≫ k) ρ

/-- `□`Rigid Comprehension: Rigid Comprehension at every arrow, every object being full. -/
theorem holds_box_rigid_comprehension {B : Premodel Signature.pure C} (M : B.IsModel) (hF : B.Full)
    {W : C} (h : B.W₀ ⟶ W) (ρ : RTy) : B.Holds h (P.NecRigidComprehension.quoted ρ) .nil := by
  show B.Holds h (Term.box (P.RigidComprehension.quoted ρ)) .nil
  rw [B.holds_box M]
  intro V k
  exact holds_rigid_comprehension M hF (h ≫ k) ρ

end Premodel

end Classicism.Meta.Intensional
