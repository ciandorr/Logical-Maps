import Classicism.Models.FiniteCompressionLogic

/-!
# Object-language rigidity and the finite-compression power properties

Original semantic bridge (misc), 23 October 2026. Source:
research/2026-10-23/finite-compression-labelled-entrance.md, sections 7–8
(unpaginated). Every entity below is the value of an actual object-language
lambda term, admitted by `isModel`. No closure or power principle is assumed.

The quotation procedure expands relational operations at constructor types.
Consequently the outer rigidity clauses of the quoted power principles are
handled explicitly as unary formulas, rather than identified definitionally
with a primitive `inclR` at the power type.
-/

namespace Classicism.Meta.Intensional.FiniteCompression

open CategoryTheory
noncomputable section

def formulaIncl {Γ : Ctx} {ρ : RTy}
    (s t : Term Signature.pure Γ ρ) : Formula Signature.pure Γ :=
  .app (.app (.inclR ρ) s) t

def formulaLe {Γ : Ctx} {ρ : RTy}
    (s t : Term Signature.pure Γ ρ) : Formula Signature.pure Γ :=
  Term.box (formulaIncl s t)

/-- The algebraic order in the quoted power body. This has the same
semantics as `formulaLe`, but its syntax is equality with a join. -/
def formulaOrder {Γ : Ctx} {ρ : RTy}
    (s t : Term Signature.pure Γ ρ) : Formula Signature.pure Γ :=
  Term.leR ρ s t

def formulaTest {Γ : Ctx} {ρ : RTy}
    (s t : Term Signature.pure Γ ρ) : Formula Signature.pure Γ :=
  formulaIncl s (.app (.boxR ρ) t)

def formulaWP {Γ : Ctx} {ρ : RTy}
    (t : Term Signature.pure Γ ρ) : Formula Signature.pure Γ :=
  formulaTest t t

def formulaWI {Γ : Ctx} {ρ : RTy}
    (t : Term Signature.pure Γ ρ) : Formula Signature.pure Γ :=
  Term.forall' (Term.imp (formulaTest t.weaken (.var .zero))
    (formulaLe t.weaken (.var .zero)))

def formulaWeak {Γ : Ctx} {ρ : RTy}
    (t : Term Signature.pure Γ ρ) : Formula Signature.pure Γ :=
  Term.conj (formulaWP t) (formulaWI t)

def formulaRigid {Γ : Ctx} {ρ : RTy}
    (t : Term Signature.pure Γ ρ) : Formula Signature.pure Γ :=
  Term.conj (Term.box (formulaWP t)) (Term.box (formulaWI t))

def WPData {ρ : RTy} {W : cat.Ob} (F : RD W ρ) : Prop :=
  ∀ a : TA ρ W, prof F (𝟙 W) a → ∀ {V : cat.Ob} (k : W ⟶ V),
    prof F k (Args.map model.inner ρ k a)

def WIData {ρ : RTy} {W : cat.Ob} (F : RD W ρ) : Prop :=
  ∀ Z : RD W ρ, (∀ a : TA ρ W, prof F (𝟙 W) a →
    ∀ {V : cat.Ob} (k : W ⟶ V), prof Z k (Args.map model.inner ρ k a)) →
      model.incl ρ W F ⊆ model.incl ρ W Z

theorem sem_eq_transport {Γ : Ctx} {ρ : RTy} {W V : cat.Ob}
    (h : model.W₀ ⟶ W) (t : Term Signature.pure Γ ρ) (g : IEnv (model.Dom W) Γ)
    (F : RD W ρ) (he : model.sem h t g = model.incl ρ W F) (k : W ⟶ V) :
    model.sem (h ≫ k) t (model.push k g) =
      model.incl ρ V ((model.inner (.rel ρ)).map k F) := by
  rw [model.sem_push, he]
  exact (model.incl_map ρ k F).symm

theorem holds_formulaTest {Γ : Ctx} {ρ : RTy} {W : cat.Ob}
    (h : model.W₀ ⟶ W) (g : IEnv (model.Dom W) Γ)
    (s t : Term Signature.pure Γ ρ) (F Z : RD W ρ)
    (hs : model.sem h s g = model.incl ρ W F)
    (ht : model.sem h t g = model.incl ρ W Z) :
    model.Holds h (formulaTest s t) g ↔
      ∀ a : TA ρ W, prof F (𝟙 W) a → ∀ {V : cat.Ob} (k : W ⟶ V),
        prof Z k (Args.map model.inner ρ k a) := by
  simp only [formulaTest, formulaIncl, Premodel.holds_inclR isModel,
    Premodel.sem_boxR isModel, hs, ht, Set.mem_ofPred_eq, Category.id_comp, prof]

theorem holds_formulaLe {Γ : Ctx} {ρ : RTy} {W : cat.Ob}
    (h : model.W₀ ⟶ W) (g : IEnv (model.Dom W) Γ)
    (s t : Term Signature.pure Γ ρ) (F Z : RD W ρ)
    (hs : model.sem h s g = model.incl ρ W F)
    (ht : model.sem h t g = model.incl ρ W Z) :
    model.Holds h (formulaLe s t) g ↔ model.incl ρ W F ⊆ model.incl ρ W Z := by
  simp only [formulaLe, formulaIncl, model.holds_box isModel,
    Premodel.holds_inclR isModel, model.sem_push, hs, ht, Outer.map_rel,
    Intension.mem_map, Category.comp_id]
  constructor
  · intro hh
    rintro ⟨V, a, k⟩ ha
    exact hh k a ha
  · intro hh V k a ha
    exact hh ha

theorem holds_formulaWP {Γ : Ctx} {ρ : RTy} {W : cat.Ob}
    (h : model.W₀ ⟶ W) (g : IEnv (model.Dom W) Γ)
    (t : Term Signature.pure Γ ρ) (F : RD W ρ)
    (he : model.sem h t g = model.incl ρ W F) :
    model.Holds h (formulaWP t) g ↔ WPData F :=
  holds_formulaTest h g t t F F he he

theorem holds_formulaOrder {Γ : Ctx} {ρ : RTy} {W : cat.Ob}
    (h : model.W₀ ⟶ W) (g : IEnv (model.Dom W) Γ)
    (s t : Term Signature.pure Γ ρ) (F Z : RD W ρ)
    (hs : model.sem h s g = model.incl ρ W F)
    (ht : model.sem h t g = model.incl ρ W Z) :
    model.Holds h (formulaOrder s t) g ↔ model.incl ρ W F ⊆ model.incl ρ W Z := by
  rw [formulaOrder, model.holds_leR isModel, hs, ht]

theorem holds_formulaWI {Γ : Ctx} {ρ : RTy} {W : cat.Ob}
    (h : model.W₀ ⟶ W) (g : IEnv (model.Dom W) Γ)
    (t : Term Signature.pure Γ ρ) (F : RD W ρ)
    (he : model.sem h t g = model.incl ρ W F) :
    model.Holds h (formulaWI t) g ↔ WIData F := by
  simp only [formulaWI, model.holds_forall isModel, model.holds_imp isModel]
  have hs (Z : RD W ρ) : model.sem h t.weaken (.cons Z g) = model.incl ρ W F := by
    rw [model.sem_weaken]
    exact he
  constructor
  · intro hh Z hZ
    exact (holds_formulaLe h (.cons Z g) t.weaken (.var .zero) F Z (hs Z) rfl).1
      (hh Z ((holds_formulaTest h (.cons Z g) t.weaken (.var .zero) F Z (hs Z) rfl).2 hZ))
  · intro hh Z hZ
    exact (holds_formulaLe h (.cons Z g) t.weaken (.var .zero) F Z (hs Z) rfl).2
      (hh Z ((holds_formulaTest h (.cons Z g) t.weaken (.var .zero) F Z (hs Z) rfl).1 hZ))

theorem holds_formulaWeak {Γ : Ctx} {ρ : RTy} {W : cat.Ob}
    (h : model.W₀ ⟶ W) (g : IEnv (model.Dom W) Γ)
    (t : Term Signature.pure Γ ρ) (F : RD W ρ)
    (he : model.sem h t g = model.incl ρ W F) :
    model.Holds h (formulaWeak t) g ↔ WeakData F := by
  rw [formulaWeak, model.holds_conj isModel,
    holds_formulaWP h g t F he, holds_formulaWI h g t F he]
  rfl

theorem holds_formulaRigid {Γ : Ctx} {ρ : RTy} {W : cat.Ob}
    (h : model.W₀ ⟶ W) (g : IEnv (model.Dom W) Γ)
    (t : Term Signature.pure Γ ρ) (F : RD W ρ)
    (he : model.sem h t g = model.incl ρ W F) :
    model.Holds h (formulaRigid t) g ↔ RigidData F := by
  simp only [formulaRigid, model.holds_conj isModel, model.holds_box isModel]
  constructor
  · rintro ⟨hp, hi⟩ V k
    exact ⟨(holds_formulaWP (h ≫ k) (model.push k g) t _
      (sem_eq_transport h t g F he k)).1 (hp k),
      (holds_formulaWI (h ≫ k) (model.push k g) t _
        (sem_eq_transport h t g F he k)).1 (hi k)⟩
  · intro hr
    exact ⟨fun {V} k => (holds_formulaWP (h ≫ k) (model.push k g) t _
      (sem_eq_transport h t g F he k)).2 (hr k).1,
      fun {V} k => (holds_formulaWI (h ≫ k) (model.push k g) t _
        (sem_eq_transport h t g F he k)).2 (hr k).2⟩

/-- The value of a relation term, using the actual model condition. -/
def termEntity {Γ : Ctx} {ρ : RTy} {W : cat.Ob} (h : model.W₀ ⟶ W)
    (t : Term Signature.pure Γ ρ) (g : IEnv (model.Dom W) Γ) : RD W ρ :=
  Classical.choose (isModel h t g)

theorem incl_termEntity {Γ : Ctx} {ρ : RTy} {W : cat.Ob} (h : model.W₀ ⟶ W)
    (t : Term Signature.pure Γ ρ) (g : IEnv (model.Dom W) Γ) :
    model.incl ρ W (termEntity h t g) = model.sem h t g :=
  Classical.choose_spec (isModel h t g)

def rigidPowerBody {Γ : Ctx} {ρ : RTy} (t : Term Signature.pure Γ ρ) :
    Formula Signature.pure (.rel ρ :: Γ) :=
  Term.conj (formulaRigid (.var .zero)) (formulaOrder (.var .zero) t.weaken)

def weakPowerBody {Γ : Ctx} {ρ : RTy} (t : Term Signature.pure Γ ρ) :
    Formula Signature.pure (.rel ρ :: Γ) :=
  Term.conj (formulaWeak (.var .zero)) (formulaOrder (.var .zero) t.weaken)

def rigidPowerEntity {ρ : RTy} {W : cat.Ob} (h : model.W₀ ⟶ W) (F : RD W ρ) :
    RD W (.arr (.rel ρ) .t) :=
  termEntity h (.lam (rigidPowerBody (.var .zero))) (.cons F .nil)

def weakPowerEntity {ρ : RTy} {W : cat.Ob} (h : model.W₀ ⟶ W) (F : RD W ρ) :
    RD W (.arr (.rel ρ) .t) :=
  termEntity h (.lam (weakPowerBody (.var .zero))) (.cons F .nil)

def rigidTestEntity {W : cat.Ob} (h : model.W₀ ⟶ W) (ρ : RTy) :
    RD W (.arr (.rel ρ) .t) :=
  termEntity h (.lam (formulaRigid (.var .zero))) .nil

theorem holds_rigidPowerBody {Γ : Ctx} {ρ : RTy} {W : cat.Ob}
    (h : model.W₀ ⟶ W) (g : IEnv (model.Dom W) Γ) (t : Term Signature.pure Γ ρ)
    (F X : RD W ρ) (he : model.sem h t g = model.incl ρ W F) :
    model.Holds h (rigidPowerBody t) (.cons X g) ↔
      RigidData X ∧ model.incl ρ W X ⊆ model.incl ρ W F := by
  rw [rigidPowerBody, model.holds_conj isModel]
  exact and_congr (holds_formulaRigid h (.cons X g) (.var .zero) X rfl)
    (holds_formulaOrder h (.cons X g) (.var .zero) t.weaken X F rfl
      (by rw [model.sem_weaken]; exact he))

theorem holds_weakPowerBody {Γ : Ctx} {ρ : RTy} {W : cat.Ob}
    (h : model.W₀ ⟶ W) (g : IEnv (model.Dom W) Γ) (t : Term Signature.pure Γ ρ)
    (F X : RD W ρ) (he : model.sem h t g = model.incl ρ W F) :
    model.Holds h (weakPowerBody t) (.cons X g) ↔
      WeakData X ∧ model.incl ρ W X ⊆ model.incl ρ W F := by
  rw [weakPowerBody, model.holds_conj isModel]
  exact and_congr (holds_formulaWeak h (.cons X g) (.var .zero) X rfl)
    (holds_formulaOrder h (.cons X g) (.var .zero) t.weaken X F rfl
      (by rw [model.sem_weaken]; exact he))

theorem prof_rigidPowerEntity {ρ : RTy} {W V : cat.Ob}
    (h : model.W₀ ⟶ W) (F : RD W ρ) (k : W ⟶ V) (X : RD V ρ) :
    prof (rigidPowerEntity h F) k (X, PUnit.unit) ↔
      RigidData X ∧ model.incl ρ V X ⊆
        model.incl ρ V ((model.inner (.rel ρ)).map k F) := by
  unfold prof rigidPowerEntity
  rw [incl_termEntity, model.mem_sem_lam]
  change model.Holds (h ≫ k) (rigidPowerBody (.var .zero))
    (.cons X (model.push k (.cons F .nil))) ↔ _
  exact holds_rigidPowerBody (h ≫ k) (model.push k (.cons F .nil))
    (.var .zero) _ X rfl

theorem prof_weakPowerEntity {ρ : RTy} {W V : cat.Ob}
    (h : model.W₀ ⟶ W) (F : RD W ρ) (k : W ⟶ V) (X : RD V ρ) :
    prof (weakPowerEntity h F) k (X, PUnit.unit) ↔
      WeakData X ∧ model.incl ρ V X ⊆
        model.incl ρ V ((model.inner (.rel ρ)).map k F) := by
  unfold prof weakPowerEntity
  rw [incl_termEntity, model.mem_sem_lam]
  change model.Holds (h ≫ k) (weakPowerBody (.var .zero))
    (.cons X (model.push k (.cons F .nil))) ↔ _
  exact holds_weakPowerBody (h ≫ k) (model.push k (.cons F .nil))
    (.var .zero) _ X rfl

theorem prof_rigidTestEntity {ρ : RTy} {W V : cat.Ob}
    (h : model.W₀ ⟶ W) (k : W ⟶ V) (X : RD V ρ) :
    prof (rigidTestEntity h ρ) k (X, PUnit.unit) ↔ RigidData X := by
  unfold prof rigidTestEntity
  rw [incl_termEntity, model.mem_sem_lam]
  exact holds_formulaRigid (h ≫ k) (.cons X (model.push k .nil)) (.var .zero) X rfl

/-! The constructor-type expansion used by the actual quotation procedure. -/

def formulaUnaryWP {Γ : Ctx} {σ : Ty}
    (b : Formula Signature.pure (σ :: Γ)) : Formula Signature.pure Γ :=
  Term.forall' (Term.imp b (Term.box b))

def formulaSkip {Γ : Ctx} {σ τ : Ty}
    (b : Formula Signature.pure (σ :: Γ)) : Formula Signature.pure (σ :: τ :: Γ) :=
  b.rename (Ren.lift Ren.shift)

def formulaUnaryWI {Γ : Ctx} {σ : Ty}
    (b : Formula Signature.pure (σ :: Γ)) : Formula Signature.pure Γ :=
  Term.forall' (σ := .rel (.arr σ .t))
    (Term.imp
      (Term.forall' (Term.imp (formulaSkip b)
        (Term.box (.app (.var (.succ .zero)) (.var .zero)))))
      (Term.box (Term.forall' (Term.imp (formulaSkip b)
        (.app (.var (.succ .zero)) (.var .zero))))))

def formulaUnaryWeak {Γ : Ctx} {σ : Ty}
    (b : Formula Signature.pure (σ :: Γ)) : Formula Signature.pure Γ :=
  Term.conj (formulaUnaryWP b) (formulaUnaryWI b)

def formulaUnaryRigid {Γ : Ctx} {σ : Ty}
    (b : Formula Signature.pure (σ :: Γ)) : Formula Signature.pure Γ :=
  Term.conj (Term.box (formulaUnaryWP b)) (Term.box (formulaUnaryWI b))

theorem holds_formulaSkip {Γ : Ctx} {σ τ : Ty} {W : cat.Ob}
    (h : model.W₀ ⟶ W) (g : IEnv (model.Dom W) Γ)
    (b : Formula Signature.pure (σ :: Γ)) (x : model.Dom W σ) (y : model.Dom W τ) :
    model.Holds h (formulaSkip b) (.cons x (.cons y g)) ↔
      model.Holds h b (.cons x g) := by
  unfold Premodel.Holds formulaSkip
  rw [model.sem_rename, IEnv.ren_lift, IEnv.ren_shift]

theorem holds_test_app {Γ : Ctx} {σ : Ty} {W : cat.Ob}
    (h : model.W₀ ⟶ W) (g : IEnv (model.Dom W) Γ)
    (x : model.Dom W σ) (Z : RD W (.arr σ .t)) :
    model.Holds h (.app (.var (.succ .zero)) (.var .zero)) (.cons x (.cons Z g)) ↔
      prof Z (𝟙 W) (x, PUnit.unit) := by
  exact model.holds_app h (.cons x (.cons Z g))
    (.var (.succ .zero)) (.var .zero) (a' := x) rfl

theorem holds_lambda_body_at {Γ : Ctx} {σ : Ty} {W : cat.Ob}
    (h : model.W₀ ⟶ W) (g : IEnv (model.Dom W) Γ)
    (b : Formula Signature.pure (σ :: Γ)) (Q : RD W (.arr σ .t))
    (he : model.sem h (.lam b) g = model.incl (.arr σ .t) W Q)
    {V : cat.Ob} (k : W ⟶ V) (x : model.Dom V σ) :
    model.Holds (h ≫ k) b (.cons x (model.push k g)) ↔
      prof Q k (x, PUnit.unit) := by
  unfold prof
  rw [← he]
  exact (model.mem_sem_lam h g b x PUnit.unit k).symm

theorem holds_lambda_body_here {Γ : Ctx} {σ : Ty} {W : cat.Ob}
    (h : model.W₀ ⟶ W) (g : IEnv (model.Dom W) Γ)
    (b : Formula Signature.pure (σ :: Γ)) (Q : RD W (.arr σ .t))
    (he : model.sem h (.lam b) g = model.incl (.arr σ .t) W Q)
    (x : model.Dom W σ) :
    model.Holds h b (.cons x g) ↔ prof Q (𝟙 W) (x, PUnit.unit) := by
  simpa only [Category.comp_id, model.push_id] using
    holds_lambda_body_at h g b Q he (𝟙 W) x

theorem holds_formulaUnaryWP {Γ : Ctx} {σ : Ty} {W : cat.Ob}
    (h : model.W₀ ⟶ W) (g : IEnv (model.Dom W) Γ)
    (b : Formula Signature.pure (σ :: Γ)) (Q : RD W (.arr σ .t))
    (he : model.sem h (.lam b) g = model.incl (.arr σ .t) W Q) :
    model.Holds h (formulaUnaryWP b) g ↔ WPData Q := by
  simp only [formulaUnaryWP, model.holds_forall isModel, model.holds_imp isModel,
    model.holds_box isModel, model.push_cons,
    holds_lambda_body_here h g b Q he, holds_lambda_body_at h g b Q he]
  constructor
  · intro hh a ha V k
    obtain ⟨x, u⟩ := a
    cases u
    exact hh x ha k
  · intro hh x hx V k
    exact hh (x, PUnit.unit) hx k

theorem holds_formulaUnaryWI {Γ : Ctx} {σ : Ty} {W : cat.Ob}
    (h : model.W₀ ⟶ W) (g : IEnv (model.Dom W) Γ)
    (b : Formula Signature.pure (σ :: Γ)) (Q : RD W (.arr σ .t))
    (he : model.sem h (.lam b) g = model.incl (.arr σ .t) W Q) :
    model.Holds h (formulaUnaryWI b) g ↔ WIData Q := by
  simp only [formulaUnaryWI, model.holds_forall isModel, model.holds_imp isModel,
    model.holds_box isModel, model.push_cons, holds_formulaSkip, holds_test_app,
    holds_lambda_body_here h g b Q he, holds_lambda_body_at h g b Q he,
    prof_map, Category.comp_id]
  constructor
  · intro hh Z hZ
    rintro ⟨V, ⟨x, u⟩, k⟩ hx
    cases u
    exact hh Z (fun x hx V k => hZ (x, PUnit.unit) hx k) k x hx
  · intro hh Z hZ V k x hx
    apply hh Z _ hx
    intro a ha U j
    obtain ⟨y, u⟩ := a
    cases u
    exact hZ y ha j

theorem holds_formulaUnaryWeak {Γ : Ctx} {σ : Ty} {W : cat.Ob}
    (h : model.W₀ ⟶ W) (g : IEnv (model.Dom W) Γ)
    (b : Formula Signature.pure (σ :: Γ)) (Q : RD W (.arr σ .t))
    (he : model.sem h (.lam b) g = model.incl (.arr σ .t) W Q) :
    model.Holds h (formulaUnaryWeak b) g ↔ WeakData Q := by
  rw [formulaUnaryWeak, model.holds_conj isModel,
    holds_formulaUnaryWP h g b Q he, holds_formulaUnaryWI h g b Q he]
  rfl

theorem holds_formulaUnaryRigid {Γ : Ctx} {σ : Ty} {W : cat.Ob}
    (h : model.W₀ ⟶ W) (g : IEnv (model.Dom W) Γ)
    (b : Formula Signature.pure (σ :: Γ)) (Q : RD W (.arr σ .t))
    (he : model.sem h (.lam b) g = model.incl (.arr σ .t) W Q) :
    model.Holds h (formulaUnaryRigid b) g ↔ RigidData Q := by
  simp only [formulaUnaryRigid, model.holds_conj isModel, model.holds_box isModel]
  constructor
  · rintro ⟨hp, hi⟩ V k
    exact ⟨(holds_formulaUnaryWP (h ≫ k) (model.push k g) b _
      (sem_eq_transport h (.lam b) g Q he k)).1 (hp k),
      (holds_formulaUnaryWI (h ≫ k) (model.push k g) b _
        (sem_eq_transport h (.lam b) g Q he k)).1 (hi k)⟩
  · intro hr
    exact ⟨fun {V} k => (holds_formulaUnaryWP (h ≫ k) (model.push k g) b _
      (sem_eq_transport h (.lam b) g Q he k)).2 (hr k).1,
      fun {V} k => (holds_formulaUnaryWI (h ≫ k) (model.push k g) b _
        (sem_eq_transport h (.lam b) g Q he k)).2 (hr k).2⟩

/-- Exact syntax of the quotation, including its constructor-type expansion. -/
theorem quoted_rigidPower_eq (ρ : RTy) :
    P.RigidPower.quoted ρ =
      Term.forall' (σ := .rel ρ) (Term.imp (formulaRigid (.var .zero))
        (formulaUnaryRigid (rigidPowerBody (.var .zero)))) := by
  rfl

theorem quoted_weaklyRigidPower_eq (ρ : RTy) :
    P.WeaklyRigidPower.quoted ρ =
      Term.forall' (σ := .rel ρ) (Term.imp (formulaWeak (.var .zero))
        (formulaUnaryWeak (weakPowerBody (.var .zero)))) := by
  rfl

theorem holds_rigidPower_iff {W : cat.Ob} (h : model.W₀ ⟶ W) (ρ : RTy) :
    model.Holds h (P.RigidPower.quoted ρ) .nil ↔
      ∀ F : RD W ρ, RigidData F → RigidData (rigidPowerEntity h F) := by
  rw [quoted_rigidPower_eq]
  simp only [model.holds_forall isModel, model.holds_imp isModel]
  apply forall_congr'
  intro F
  rw [holds_formulaRigid h (.cons F .nil) (.var .zero) F rfl]
  rw [holds_formulaUnaryRigid h (.cons F .nil) (rigidPowerBody (.var .zero))
    (rigidPowerEntity h F) (incl_termEntity h _ _).symm]

theorem holds_weaklyRigidPower_iff {W : cat.Ob} (h : model.W₀ ⟶ W) (ρ : RTy) :
    model.Holds h (P.WeaklyRigidPower.quoted ρ) .nil ↔
      ∀ F : RD W ρ, WeakData F → WeakData (weakPowerEntity h F) := by
  rw [quoted_weaklyRigidPower_eq]
  simp only [model.holds_forall isModel, model.holds_imp isModel]
  apply forall_congr'
  intro F
  rw [holds_formulaWeak h (.cons F .nil) (.var .zero) F rfl]
  rw [holds_formulaUnaryWeak h (.cons F .nil) (weakPowerBody (.var .zero))
    (weakPowerEntity h F) (incl_termEntity h _ _).symm]

end
end Classicism.Meta.Intensional.FiniteCompression
