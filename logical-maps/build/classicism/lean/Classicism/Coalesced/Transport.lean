import Classicism.Coalesced.Premodel

/-!
# Transport: the coalesced sum seen along a root arrow

The first induction of the proof in Classicism, Appendix E, in general form. Along a root
arrow `r : W₀ → V` into a component, the value in the coalesced sum of every term, relative
to `r` followed by a component arrow `j : V → U`, is its value in `V`'s component re-based
at `V` with the constants transported along `r` (`RootAction.component`), relative to `j`:
`⟦A⟧^g_{j ∘ r} = ⟦A⟧^g_{(A_k)_r, j}` (`sem_transport`). The values are compared through
`compO`, which reads an outer element of the sum at a component object as one of the
component (the identity at `e` and at type variables, `compI` at a relational type).

The interesting case is the constants', where the transport of the root value along `r`
is the value in the re-based component, by definition; the readings of the logical
constants agree because they are defined from the actions and the inclusions alone, and
these are the component's at a component object.
-/

namespace Classicism.Meta.Coalesced

open CategoryTheory CategoryTheory.Sigma Classicism.Meta.Intensional

variable {Sig : Signature} {ι : Type} {C : ι → Type} [∀ k, SmallCategory (C k)]
  {S : RootArrows C} {A : ∀ k, Premodel Sig (C k)}

namespace RootAction

variable (RA : RootAction S A) {k : ι}

/-- An outer element of the sum at a component object, as an outer element of the
component. -/
def compO : ∀ (σ : Ty) {V : C k}, Outer RA.inner σ (.of ⟨k, V⟩) → Outer (A k).inner σ V
  | .e, _, x => x
  | .rel _, _, X => RA.compI X
  | .var _, _, x => x

theorem compO_rel {ρ : RTy} {V : C k} (X : Intension RA.inner ρ (.of ⟨k, V⟩)) :
    RA.compO (.rel ρ) X = RA.compI X := rfl

theorem compO_injective : ∀ (σ : Ty) {V : C k},
    Function.Injective (RA.compO σ : Outer RA.inner σ (.of ⟨k, V⟩) → _)
  | .e, _ => fun _ _ h => h
  | .rel _, _ => RA.compI_injective
  | .var _, _ => fun _ _ h => h

theorem compO_map : ∀ (σ : Ty) {V U : C k} (j : V ⟶ U) (x : Outer RA.inner σ (.of ⟨k, V⟩)),
    RA.compO σ (Outer.map RA.inner σ (CoalescedSum.inc S j) x) = Outer.map (A k).inner σ j (RA.compO σ x)
  | .e, _, _, _, _ => rfl
  | .rel _, _, _, j, X => RA.compI_map j X
  | .var _, _, _, _, _ => rfl

theorem argsOut_mk {ρ : RTy} {V U : C k} (a : Args RA.inner ρ (.of ⟨k, U⟩)) (j : V ⟶ U) :
    RA.tupleOut (⟨.of ⟨k, U⟩, a, CoalescedSum.inc S j⟩ : Tuple RA.inner ρ (.of ⟨k, V⟩)) =
      ⟨U, RA.argsOut ρ a, j⟩ := rfl

variable (RI : RootIncl RA)

theorem mem_incl_of {ρ : RTy} {V : C k} (y : ((A k).inner (.rel ρ)).obj V)
    (p : Tuple RA.inner ρ (.of ⟨k, V⟩)) :
    p ∈ RA.incl RI ρ (.of ⟨k, V⟩) y ↔ RA.tupleOut p ∈ (A k).incl ρ V y := Iff.rfl

theorem mem_incl_diag {ρ : RTy} {U : C k} (y : ((A k).inner (.rel ρ)).obj U) (ys : Args (A k).inner ρ U) :
    (⟨.of ⟨k, U⟩, RA.argsIn ρ ys, 𝟙 (CoalescedSum.of ⟨k, U⟩)⟩ : Tuple RA.inner ρ (.of ⟨k, U⟩)) ∈
        RA.incl RI ρ (.of ⟨k, U⟩) y ↔
      (⟨U, ys, 𝟙 U⟩ : Tuple (A k).inner ρ U) ∈ (A k).incl ρ U y := by
  show (⟨U, RA.argsOut ρ (RA.argsIn ρ ys), 𝟙 U⟩ : Tuple (A k).inner ρ U) ∈ (A k).incl ρ U y ↔ _
  rw [RA.argsOut_argsIn]

variable (ne : Nonempty (RA.D .e)) (I : ∀ c : Sig.Const, RA.D (Sig.typeOf c))

local notation "P" => RA.coalescedSum RI ne I

theorem compO_Incl : ∀ (σ : Ty) {V : C k} (y : (A k).Dom V σ),
    RA.compO σ ((P).Incl σ (.of ⟨k, V⟩) y) = (A k).Incl σ V y
  | .e, _, _ => rfl
  | .rel ρ, V, y => RA.compI_incl RI ρ V y
  | .var _, _, _ => rfl

theorem compO_apply {σ : Ty} {ρ : RTy} {V : C k} (F : Intension RA.inner (.arr σ ρ) (.of ⟨k, V⟩))
    (x : Outer RA.inner σ (.of ⟨k, V⟩)) :
    RA.compO (.rel ρ) ((P).apply F x) = (A k).apply (RA.compO (.rel (.arr σ ρ)) F) (RA.compO σ x) := by
  ext ⟨U, a, j⟩
  show (∃ x' : (A k).Dom U σ, (P).Incl σ (.of ⟨k, U⟩) x' = Outer.map RA.inner σ (CoalescedSum.inc S j) x ∧ _) ↔
    (∃ x' : (A k).Dom U σ, (A k).Incl σ U x' = Outer.map (A k).inner σ j (RA.compO σ x) ∧ _)
  refine exists_congr fun x' => and_congr ?_ Iff.rfl
  rw [← RA.compO_Incl RI ne I σ x', ← RA.compO_map]
  exact (RA.compO_injective σ).eq_iff.symm

/-! ### The readings of the logical constants -/

theorem compI_negRead (ρ : RTy) (V : C k) : RA.compI ((P).negRead ρ (.of ⟨k, V⟩)) = (A k).negRead ρ V := by
  ext ⟨U, ⟨X, ys⟩, j⟩
  exact not_congr (RA.mem_incl_diag RI X ys)

theorem compI_andRead (ρ : RTy) (V : C k) : RA.compI ((P).andRead ρ (.of ⟨k, V⟩)) = (A k).andRead ρ V := by
  ext ⟨U, ⟨X, Y, ys⟩, j⟩
  exact and_congr (RA.mem_incl_diag RI X ys) (RA.mem_incl_diag RI Y ys)

theorem compI_orRead (ρ : RTy) (V : C k) : RA.compI ((P).orRead ρ (.of ⟨k, V⟩)) = (A k).orRead ρ V := by
  ext ⟨U, ⟨X, Y, ys⟩, j⟩
  exact or_congr (RA.mem_incl_diag RI X ys) (RA.mem_incl_diag RI Y ys)

theorem compI_constRead (ρ : RTy) (V : C k) : RA.compI ((P).constRead ρ (.of ⟨k, V⟩)) = (A k).constRead ρ V :=
  rfl

theorem compI_allRead (σ : Ty) (V : C k) : RA.compI ((P).allRead σ (.of ⟨k, V⟩)) = (A k).allRead σ V :=
  rfl

theorem compI_exRead (σ : Ty) (V : C k) : RA.compI ((P).exRead σ (.of ⟨k, V⟩)) = (A k).exRead σ V :=
  rfl

theorem compI_eqRead (σ : Ty) (V : C k) : RA.compI ((P).eqRead σ (.of ⟨k, V⟩)) = (A k).eqRead σ V :=
  rfl

/-- A statement about all the arguments of the sum at a component object is one about all
the arguments of the component. -/
theorem forall_args {ρ : RTy} {U : C k} (q : Args (A k).inner ρ U → Prop) :
    (∀ a : Args RA.inner ρ (.of ⟨k, U⟩), q (RA.argsOut ρ a)) ↔ ∀ a, q a :=
  ⟨fun H a => RA.argsOut_argsIn ρ a ▸ H (RA.argsIn ρ a), fun H _ => H _⟩

theorem compI_coextRead (ρ : RTy) (V : C k) : RA.compI ((P).coextRead ρ (.of ⟨k, V⟩)) = (A k).coextRead ρ V := by
  ext ⟨U, ⟨X, Y, ⟨⟩⟩, j⟩
  exact RA.forall_args (fun a => (⟨U, a, 𝟙 U⟩ : Tuple (A k).inner ρ U) ∈ (A k).incl ρ U X ↔
    (⟨U, a, 𝟙 U⟩ : Tuple (A k).inner ρ U) ∈ (A k).incl ρ U Y)

theorem compI_inclRead (ρ : RTy) (V : C k) : RA.compI ((P).inclRead ρ (.of ⟨k, V⟩)) = (A k).inclRead ρ V := by
  ext ⟨U, ⟨X, Y, ⟨⟩⟩, j⟩
  exact RA.forall_args (fun a => (⟨U, a, 𝟙 U⟩ : Tuple (A k).inner ρ U) ∈ (A k).incl ρ U X →
    (⟨U, a, 𝟙 U⟩ : Tuple (A k).inner ρ U) ∈ (A k).incl ρ U Y)

theorem compI_boxRead (ρ : RTy) (V : C k) : RA.compI ((P).boxRead ρ (.of ⟨k, V⟩)) = (A k).boxRead ρ V := by
  ext ⟨U, ⟨X, ys⟩, j⟩
  show (∀ (W : CoalescedSum S) (j' : CoalescedSum.of ⟨k, U⟩ ⟶ W),
      (⟨W, Args.map RA.inner ρ j' (RA.argsIn ρ ys), j'⟩ : Tuple RA.inner ρ (.of ⟨k, U⟩)) ∈
        RA.incl RI ρ (.of ⟨k, U⟩) X) ↔
    ∀ (U' : C k) (j' : U ⟶ U'), (⟨U', Args.map (A k).inner ρ j' ys, j'⟩ : Tuple (A k).inner ρ U) ∈ (A k).incl ρ U X
  have key : ∀ (U' : C k) (j' : U ⟶ U'),
      (⟨.of ⟨k, U'⟩, Args.map RA.inner ρ (CoalescedSum.inc S j') (RA.argsIn ρ ys), CoalescedSum.inc S j'⟩ :
        Tuple RA.inner ρ (.of ⟨k, U⟩)) ∈ RA.incl RI ρ (.of ⟨k, U⟩) X ↔
      (⟨U', Args.map (A k).inner ρ j' ys, j'⟩ : Tuple (A k).inner ρ U) ∈ (A k).incl ρ U X := by
    intro U' j'
    rw [RA.mem_incl_of, RA.argsOut_mk, RA.argsOut_map, RA.argsOut_argsIn]
  constructor
  · intro H U' j'
    exact (key U' j').1 (H _ (CoalescedSum.inc S j'))
  · rintro H (_ | ⟨_, U'⟩) j'
    · exact nomatch j'
    · rcases j' with ⟨j'⟩
      exact (key _ j').2 (H _ j')

/-! ### The transport theorem -/

omit RI ne in
theorem component_Incl {V : C k} (r : S.R.obj ⟨k, V⟩) (σ : Ty) (W : C k) :
    (RA.component I r).Incl σ W = (A k).Incl σ W := by
  cases σ <;> rfl

omit RI ne in
theorem component_apply {V : C k} (r : S.R.obj ⟨k, V⟩) {σ : Ty} {ρ : RTy} {W : C k}
    (F : Intension (A k).inner (.arr σ ρ) W) (x : Outer (A k).inner σ W) :
    (RA.component I r).apply F x = (A k).apply F x := by
  ext ⟨U, a, j⟩
  simp only [Premodel.apply, Set.mem_ofPred_eq, component_Incl]

/-- **Transport** (Classicism, Appendix E, the case of a non-identity arrow): along a root
arrow `r : W₀ → V` followed by a component arrow `j : V → U`, the value of a term in the
coalesced sum is its value in the component seen from `r`, relative to `j`. -/
theorem sem_transport {V : C k} (r : S.R.obj ⟨k, V⟩) :
    ∀ {Γ : Ctx} {σ : Ty} {U : C k} (j : V ⟶ U) (t : Term Sig Γ σ) (g : IEnv ((A k).Dom U) Γ),
      RA.compO σ ((P).sem (CoalescedSum.arr S (S.R.map (SigmaHom.mk j) r)) t g)
        = (RA.component I r).sem j t g
  | _, _, U, _, .var v, g => by
    show RA.compO _ ((P).Incl _ (.of ⟨k, U⟩) (g.get v)) = (RA.component I r).Incl _ U (g.get v)
    rw [component_Incl]
    exact RA.compO_Incl RI ne I _ (g.get v)
  | _, _, U, j, .const c, _ => by
    show RA.compO _ ((P).Incl _ (.of ⟨k, U⟩) (RA.tr _ (S.R.map (SigmaHom.mk j) r) (I c))) =
      (RA.component I r).Incl _ U (((A k).inner _).map j (RA.tr _ r (I c)))
    rw [component_Incl, RA.compO_Incl RI ne I, RA.tr_map]
  | _, _, U, j, .app f a, g => by
    show RA.compO (.rel _) ((P).apply ((P).sem (CoalescedSum.arr S (S.R.map (SigmaHom.mk j) r)) f g)
        ((P).sem (CoalescedSum.arr S (S.R.map (SigmaHom.mk j) r)) a g)) =
      (RA.component I r).apply ((RA.component I r).sem j f g) ((RA.component I r).sem j a g)
    rw [component_apply]
    exact (RA.compO_apply RI ne I _ _).trans
      (congrArg₂ (A k).apply (sem_transport r j f g) (sem_transport r j a g))
  | _, _, U, j, .lam (σ := σ) (ρ := ρ) b, g => by
    ext ⟨U', ⟨x, a⟩, j'⟩
    have IH := sem_transport r (j ≫ j') b (.cons x ((RA.component I r).push j' g))
    have e : S.R.map (SigmaHom.mk j') (S.R.map (SigmaHom.mk j) r) = S.R.map (SigmaHom.mk (j ≫ j')) r :=
      (S.map_comp_apply _ _ _).symm
    show (⟨.of ⟨k, U'⟩, RA.argsIn ρ a, CoalescedSum.inc S (𝟙 U')⟩ : Tuple RA.inner ρ (.of ⟨k, U'⟩)) ∈
        (P).sem (CoalescedSum.arr S (S.R.map (SigmaHom.mk j') (S.R.map (SigmaHom.mk j) r))) b
          (.cons x ((RA.component I r).push j' g)) ↔
      (⟨U', a, 𝟙 U'⟩ : Tuple (A k).inner ρ U') ∈ (RA.component I r).sem (j ≫ j') b
          (.cons x ((RA.component I r).push j' g))
    rw [e]
    exact Set.ext_iff.mp IH ⟨U', a, 𝟙 U'⟩
  | _, _, U, _, .and, _ => RA.compI_andRead RI ne I .t U
  | _, _, U, _, .or, _ => RA.compI_orRead RI ne I .t U
  | _, _, U, _, .not, _ => RA.compI_negRead RI ne I .t U
  | _, _, U, _, .all σ, _ => RA.compI_allRead RI ne I σ U
  | _, _, U, _, .ex σ, _ => RA.compI_exRead RI ne I σ U
  | _, _, U, _, .eq σ, _ => RA.compI_eqRead RI ne I σ U
  | _, _, U, _, .constR ρ, _ => RA.compI_constRead RI ne I ρ U
  | _, _, U, _, .negR ρ, _ => RA.compI_negRead RI ne I ρ U
  | _, _, U, _, .andR ρ, _ => RA.compI_andRead RI ne I ρ U
  | _, _, U, _, .orR ρ, _ => RA.compI_orRead RI ne I ρ U
  | _, _, U, _, .coextR ρ, _ => RA.compI_coextRead RI ne I ρ U
  | _, _, U, _, .boxR ρ, _ => RA.compI_boxRead RI ne I ρ U
  | _, _, U, _, .inclR ρ, _ => RA.compI_inclRead RI ne I ρ U

/-- Transport along a root arrow itself: the value relative to `r` is the value in the
component seen from `r`, at its base. -/
theorem sem_arr {V : C k} (r : S.R.obj ⟨k, V⟩) {Γ : Ctx} {σ : Ty} (t : Term Sig Γ σ)
    (g : IEnv ((A k).Dom V) Γ) :
    RA.compO σ ((P).sem (CoalescedSum.arr S r) t g) = (RA.component I r).sem (𝟙 V) t g := by
  have := RA.sem_transport RI ne I r (𝟙 V) t g
  rw [show S.R.map (SigmaHom.mk (𝟙 V)) r = r from S.map_id_apply r] at this
  exact this

/-- Holding relative to a root arrow `r` is holding in the component seen from `r`. -/
theorem holds_arr {V : C k} (r : S.R.obj ⟨k, V⟩) {Γ : Ctx} (p : Formula Sig Γ)
    (g : IEnv ((A k).Dom V) Γ) :
    (P).Holds (CoalescedSum.arr S r) p g ↔ (RA.component I r).Holds (𝟙 V) p g :=
  Set.ext_iff.mp (RA.sem_arr RI ne I r p g) ⟨V, PUnit.unit, 𝟙 V⟩

theorem holds_arr_sentence {V : C k} (r : S.R.obj ⟨k, V⟩) (p : Sentence Sig) :
    (P).Holds (CoalescedSum.arr S r) p .nil ↔ (RA.component I r).HoldsSentence p :=
  RA.holds_arr RI ne I r p .nil

end RootAction

end Classicism.Meta.Coalesced
