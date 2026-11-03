import Classicism.Coalesced.Interpretations
import Classicism.Semantics.IntensionalSoundness

/-!
# The definable root

The map's `coalesced-definable-root`: interpretation arrows into every component object, and
root domains cut down to the **definable** intensions. A root entity of a relational type
`ρ` is a landing set of root tuples `X` for which some closed term `t` of the signature has,
for every interpretation arrow `⟨V, J⟩`, the transport of `X` along it as its value at `V`
under `J` (`definableSel`); its value at the root's identity is unconstrained. The
selector cannot be defined by recursion on the type through the root domains, and needs
not be: the condition is on the transports alone.

Root closure (`isModel_definableSum`): the value at the root of a term `t` under an
assignment `g` of root entities is transported along `⟨V, J⟩` to the value of `t` at `V`
under `J` and the transported assignment (the transport theorem); each value of `g` is
there the value of a closed term (`defTerm`: the constant itself for an individual, the
chosen definition for a relational entity), so this is the value of the closed term
`t[s̄/x̄]` (`sem_subst`), uniformly in `⟨V, J⟩`. So the root value is definable.
-/

namespace Classicism.Meta.Coalesced

open CategoryTheory CategoryTheory.Sigma Classicism.Meta.Intensional

variable {Sig : Signature} {ι : Type} {C : ι → Type} [∀ k, SmallCategory (C k)]

/-- A constant read at a type equal to its own, as a term. -/
def constAt {Γ : Ctx} {σ : Ty} (c : Sig.Const) (h : Sig.typeOf c = σ) : Term Sig Γ σ :=
  h ▸ Term.const c

theorem sem_constAt {C : Type} [SmallCategory C] (B : Premodel Sig C) {Γ : Ctx} {σ : Ty} (c : Sig.Const)
    (h : Sig.typeOf c = σ) {W : C} (h' : B.W₀ ⟶ W) (g : IEnv (B.Dom W) Γ) :
    B.sem h' (constAt c h) g =
      B.Incl σ W (castD (D := fun σ => B.Dom W σ) h ((B.inner _).map h' (B.I c))) := by
  subst h; rfl

theorem constAt_consts {Γ : Ctx} {σ : Ty} (c : Sig.Const) (h : Sig.typeOf c = σ) :
    (constAt (Γ := Γ) c h).consts = {c} := by
  subst h; rfl

variable {A : ∀ k, Premodel Sig (C k)}

local notation "S" => interpArrows A (ConstMaps.trivial Sig)

/-! ### The definable selector -/

variable (A) in
/-- **The definable root domains**: the landing sets of root tuples whose transport along
every interpretation arrow `⟨V, J⟩` is the value at `V` under `J` of one closed term. -/
def definableSel : Selector S A where
  sel ρ _ := {X | ∃ t : Term Sig [] (.rel ρ), ∀ (k : ι) (V : C k) (J : Interp A k V),
    rootTransport X J = ((A k).rebase V J).sem (𝟙 V) t .nil}
  shift_mem ρ _ m X := by
    rintro ⟨t, ht⟩
    refine ⟨t, fun k V J => ?_⟩
    exact (rootTransport_shift m X (k := k) (V := V) J).trans (ht k V J)

theorem definableSel_admitsConsts : (definableSel A).AdmitsConsts := by
  intro ρ RA c h
  refine ⟨constAt c h, fun k V J => ?_⟩
  rw [rootTransport_hatTuples, sem_constAt]
  simp only [Functor.map_id_apply]
  rfl

variable (A) in
/-- The root action of the definable root. -/
noncomputable abbrev defAction : RootAction S A := interpAction (definableSel A)

/-- The closed term of a root entity: the constant itself for an individual, or an entity at
a type variable, and the chosen definition for a relational entity. -/
noncomputable def defTerm : ∀ σ : Ty, (defAction A).D σ → Term Sig [] σ
  | .e, x => constAt x.1 x.2
  | .var _, x => constAt x.1 x.2
  | .rel _, X => Classical.choose X.2.2

/-- Along `⟨V, J⟩` a root entity is transported to the value of its closed term at `V`
under `J`. -/
theorem sem_defTerm : ∀ (σ : Ty) (x : (defAction A).D σ) {k : ι} {V : C k} (J : Interp A k V),
    ((A k).rebase V J).sem (𝟙 V) (defTerm σ x) .nil = ((A k).rebase V J).Incl σ V ((defAction A).tr σ J x)
  | .e, x, k, V, J => by
    rw [defTerm, sem_constAt]
    simp only [Functor.map_id_apply]
    rfl
  | .var _, x, k, V, J => by
    rw [defTerm, sem_constAt]
    simp only [Functor.map_id_apply]
    rfl
  | .rel ρ, X, k, V, J =>
    (Classical.choose_spec X.2.2 k V J).symm.trans
      (incl_relLevel_tr (definableSel A) ρ _ (iarr _ J) X).symm

/-- The substitution of the closed terms of an assignment's values. -/
noncomputable def defSub {Γ : Ctx} (g : IEnv (defAction A).D Γ) : Sub Sig Γ [] := fun σ v => defTerm σ (g.get v)

variable (ne : Nonempty {c : Sig.Const // Sig.typeOf c = .e})

local notation "P" => interpSum (definableSel A) definableSel_admitsConsts ne

/-- The value at the root of a term, transported along `⟨V, J⟩`, is the value of the closed
term `t[s̄/x̄]` at `V` under `J`. -/
theorem transport_sem_root (hA : ModelsEverywhere A) {Γ : Ctx} {ρ : RTy} (t : Term Sig Γ (.rel ρ))
    (g : IEnv (defAction A).D Γ) (m : PUnit) {k : ι} {V : C k} (J : Interp A k V) :
    (defAction A).transport (iarr _ J) ((P).sem (CoalescedSum.endo S m) t g) =
      ((A k).rebase V J).sem (𝟙 V) (t.subst (defSub g)) .nil := by
  have hM : ((A k).rebase V J).IsModel := (A k).isModel_rebase V J (hA k V)
  have e1 := (P).sem_push (CoalescedSum.endo S m) t g (CoalescedSum.arr S (iarr _ J))
  have e2 : (defAction A).transport (iarr _ J) ((P).sem (CoalescedSum.endo S m) t g) =
      (defAction A).compO (.rel ρ) ((P).sem (CoalescedSum.arr S (iarr _ J)) t
        ((P).push (CoalescedSum.arr S (iarr _ J)) g)) :=
    congrArg (defAction A).compI e1.symm
  refine e2.trans (((defAction A).sem_arr (interpIncl _) ne (hatI _) (iarr _ J) t _).trans ?_)
  refine ((A k).rebase_sem_congr (funext fun c => tr_hatI _ c J) (𝟙 V) t _).trans ?_
  rw [((A k).rebase V J).sem_subst hM]
  congr 1
  apply IEnv.ext
  intro σ v
  apply ((A k).rebase V J).Incl_injective
  refine Eq.trans ?_ ((((A k).rebase V J).Incl_subEnv_get hM _ _ _ v).trans (sem_defTerm σ (g.get v) J)).symm
  exact congrArg (((A k).rebase V J).Incl σ V) (IEnv.get_map _ v g)

/-- **Root closure at the definable root**: the value at the root of every term of
relational type is definable, by `t[s̄/x̄]`. -/
theorem definable_selected (hA : ModelsEverywhere A) (m : PUnit) {Γ : Ctx} {ρ : RTy}
    (t : Term Sig Γ (.rel ρ)) (g : IEnv (defAction A).D Γ) :
    {q | ofRT (constAtom A _ .e) (fun i => constAtom A _ (.var i)) (definableSel A) q ∈
      (P).sem (CoalescedSum.endo S m) t g} ∈ (definableSel A).sel ρ _ :=
  ⟨t.subst (defSub g), fun _ _ J =>
    (rootTransport_ofRT _ J).trans (transport_sem_root ne hA t g m J)⟩

/-- **The coalesced sum with interpretation arrows and the definable root is a model**,
whenever its components are models everywhere. -/
theorem isModel_definableSum (hA : ModelsEverywhere A) : (P).IsModel :=
  (isModel_interpSum_iff _ ne hA).2 fun m _ _ t g => definable_selected ne hA m t g

end Classicism.Meta.Coalesced
