import Classicism.Results.Research.SealedWorldCover
import Classicism.Results.Records.C5

/-!
# Rigidity pullback and modal propagation

Direct research source: `research/2026-10-22/followup/modal-propagation.md`,
§§2–6 (22 October 2026). These are new research proofs.

All propositions below belong to the original finitary language of C. The
haecceity pullback permits σ = e without assuming BF_e. Every optional
principle is a displayed finite instance; no formula quantifies over types.
The final statements are unary. Their tuple/list certificates remain separate
obligations, and none is claimed merely because a shallow file compiles.
-/

namespace Classicism.Research.ModalPropagation
open Classicism.P Classicism.Paper Classicism.Research.SealedWorldCover

section top
variable {σ : Type} [Ty σ]

def Universe : σ → Prop := fun _ => True

theorem universe_weakly_inextensible_of_barcan (bf : Barcan σ) :
    WeaklyInextensible (Universe (σ := σ)) := fun Z hZ =>
  bf (fun x => True → Z x) fun x => box_imp_of_box True (Z x) (hZ x trivial)

theorem barcan_of_universe_weakly_inextensible
    (wi : WeaklyInextensible (Universe (σ := σ))) : Barcan σ := fun X hX =>
  modal_K _ _ (nec% (fun (h : ∀ x : σ, True → X x) (x : σ) => h x trivial))
    (wi X fun x _ => hX x)

theorem universe_weakly_rigid_iff_barcan :
    WeaklyRigid (Universe (σ := σ)) ↔ Barcan σ :=
  ⟨fun h => barcan_of_universe_weakly_inextensible h.2,
    fun bf => ⟨fun _ _ => box_true, universe_weakly_inextensible_of_barcan bf⟩⟩

theorem universe_rigid_iff_necessary_barcan :
    Rigid (Universe (σ := σ)) ↔ NecBarcan σ :=
  ⟨fun h => modal_K _ _ (nec% (barcan_of_universe_weakly_inextensible (σ := σ))) h.2,
    fun h => ⟨nec% (fun (_ : σ) (_ : True) => box_true),
      modal_K _ _ (nec% (universe_weakly_inextensible_of_barcan (σ := σ))) h⟩⟩

theorem universal_rigid_eq_universe_of_barcan (U : σ → Prop) (hU : Rigid U)
    (hall : ∀ x, U x) (bf : Barcan σ) : U = Universe :=
  intensionality _ _ (modal_K _ _
    (nec% (fun (h : ∀ x : σ, U x) (x : σ) =>
      (show U x ↔ True from ⟨fun _ => trivial, fun _ => h x⟩)))
    (bf U fun x => weaklyPersistent_of_persistent hU.1 x (hall x)))

theorem universal_rigid_barcan_iff_identity (U : σ → Prop) (hU : Rigid U)
    (hall : ∀ x, U x) : Barcan σ ↔ U = Universe :=
  ⟨universal_rigid_eq_universe_of_barcan U hU hall,
    fun he => box_elim (universe_rigid_iff_necessary_barcan.1 (he ▸ hU))⟩

end top

section coding
variable {σ : Type} [Ty σ]

def Haecceity (x : σ) : σ → Prop := fun z => z = x
def IsCode (H : σ → Prop) : Prop := ∃ x : σ, H = Haecceity x
def Lift (X : σ → Prop) (H : σ → Prop) : Prop := ∃ x : σ, H = Haecceity x ∧ X x
def Pullback (P : (σ → Prop) → Prop) : σ → Prop := fun x => P (Haecceity x)
def CodeGuard (H : σ → Prop) (Z : σ → Prop) : Prop :=
  ∀ x : σ, H = Haecceity x → Z x

theorem haecceity_injective (x y : σ) (h : Haecceity x = Haecceity y) : x = y :=
  Eq.mp (congrFun h x) rfl

theorem lift_on_code (X : σ → Prop) (x : σ) : Lift X (Haecceity x) ↔ X x :=
  ⟨fun h => h.elim fun y hy => (haecceity_injective x y hy.1).symm ▸ hy.2,
    fun hx => ⟨x, rfl, hx⟩⟩

theorem code_necessary (H : σ → Prop) (h : IsCode H) : □ (IsCode H) :=
  h.elim fun x hx => modal_K _ _
    (nec% (fun (he : H = Haecceity x) => (show IsCode H from ⟨x, he⟩)))
    (necessity_of_identity H (Haecceity x) hx)

theorem rigid_code_image_sealed (P : (σ → Prop) → Prop) (hP : Rigid P)
    (hcode : ∀ H, P H → IsCode H) : □ (∀ H, P H → IsCode H) :=
  weaklyInextensible_of_inextensible hP.2 IsCode fun H hH => code_necessary H (hcode H hH)

theorem code_guard_from_equality (H : σ → Prop) (a : σ) (Z : σ → Prop)
    (ha : H = Haecceity a) (hz : Z a) : CodeGuard H Z := fun x hx =>
  (haecceity_injective x a (hx.symm.trans ha)).symm ▸ hz

theorem pullback_persistent (P : (σ → Prop) → Prop) (hp : Persistent P) :
    Persistent (Pullback P) :=
  modal_K _ _ (nec% (fun (h : WeaklyPersistent P) (x : σ) (hx : Pullback P x) =>
    h (Haecceity x) hx)) hp

theorem pullback_weakly_inextensible (P : (σ → Prop) → Prop)
    (wi : WeaklyInextensible P) (hcode : ∀ H, P H → IsCode H) :
    WeaklyInextensible (Pullback P) := fun Z hZ =>
  have hguards : □ (∀ H, P H → CodeGuard H Z) :=
    wi (fun H => CodeGuard H Z) fun H hH =>
      (hcode H hH).elim fun a ha =>
        modal_K _ _ (modal_K _ _ (nec% (code_guard_from_equality H a Z))
          (necessity_of_identity H (Haecceity a) ha)) (hZ a (Eq.mp (congrArg P ha) hH))
  modal_K _ _
    (nec% (fun (h : ∀ H, P H → CodeGuard H Z) (x : σ) (hx : Pullback P x) =>
      h (Haecceity x) hx x rfl)) hguards

/-- The full pullback theorem. The sealed image condition prevents new uncoded members. -/
theorem rigid_pullback_of_sealed_image (P : (σ → Prop) → Prop) (hP : Rigid P)
    (hcode : □ (∀ H, P H → IsCode H)) : Rigid (Pullback P) :=
  ⟨pullback_persistent P hP.1,
    modal_K _ _ (modal_K _ _ (nec% (pullback_weakly_inextensible P)) hP.2) hcode⟩

theorem rigid_pullback_of_code_image (P : (σ → Prop) → Prop) (hP : Rigid P)
    (hcode : ∀ H, P H → IsCode H) : Rigid (Pullback P) :=
  rigid_pullback_of_sealed_image P hP (rigid_code_image_sealed P hP hcode)

/-- Higher relational coding supplies the unary instance, including σ = e; no BF. -/
theorem rigid_comprehension_pullback : RigidComprehension ((σ → Prop) → Prop) →
    RigidComprehension (σ → Prop) := fun rc X =>
  (rc (Lift X)).elim fun P hP =>
    ⟨Pullback P,
      rigid_pullback_of_code_image P hP.1 fun H hH =>
        ((hP.2 H).2 hH).elim fun x hx => ⟨x, hx.1⟩,
      fun x => ⟨fun hx => (hP.2 (Haecceity x)).1 ((lift_on_code X x).2 hx),
        fun hx => (lift_on_code X x).1 ((hP.2 (Haecceity x)).2 hx)⟩⟩

theorem necessary_rigid_comprehension_pullback :
    NecRigidComprehension ((σ → Prop) → Prop) → NecRigidComprehension (σ → Prop) :=
  modal_K _ _ (nec% (rigid_comprehension_pullback (σ := σ)))

end coding

/-! Empty-tuple coding has the single code ⊤. It must not be inferred from
unary BF over an invented unit type. -/

theorem singleton_value_weakly_inextensible (P : Prop → Prop) (a : Prop)
    (wi : WeaklyInextensible P) (hc : ∀ q, P q → q = a) :
    WeaklyInextensible (P a) := fun z hz =>
  converse_barcan _ (wi (fun _ => z) fun q hq => hz ((hc q hq) ▸ hq)) a

theorem singleton_value_rigid (P : Prop → Prop) (a : Prop) (hP : Rigid P)
    (hc : ∀ q, P q → q = a) : Rigid (P a) :=
  have hsealed : □ (∀ q, P q → q = a) :=
    weaklyInextensible_of_inextensible hP.2 (fun q => q = a)
      fun q hq => necessity_of_identity q a (hc q hq)
  ⟨modal_K _ _ (nec% (fun (h : WeaklyPersistent P) => h a)) hP.1,
    modal_K _ _ (modal_K _ _ (nec% (singleton_value_weakly_inextensible P a))
      hP.2) hsealed⟩

theorem rigid_comprehension_pullback_t : RigidComprehension (Prop → Prop) →
    RigidComprehension Prop := fun rc p =>
  (rc (fun q : Prop => q = True ∧ p)).elim fun P hP =>
    ⟨P True, singleton_value_rigid P True hP.1
      (fun q hq => ((hP.2 q).2 hq).1),
      ⟨fun hp => (hP.2 True).1 ⟨rfl, hp⟩,
        fun hp => ((hP.2 True).2 hp).2⟩⟩

theorem necessary_rigid_comprehension_pullback_t :
    NecRigidComprehension (Prop → Prop) → NecRigidComprehension Prop :=
  modal_K _ _ (nec% rigid_comprehension_pullback_t)

section propagation
variable {σ : Type} [Ty σ]

def HasRigidCoextension (X : σ → Prop) : Prop :=
  ∃ P : σ → Prop, Rigid P ∧ coext X P

theorem conditional_witness (w : Prop) (X P Q : σ → Prop) (hP : Rigid P)
    (hp : ∀ x, P x → w → X x) (hq : ∀ x, Q x → w → ¬ X x)
    (hc : ∀ x, P x ∨ Q x) : w → HasRigidCoextension X := fun hw =>
  ⟨P, hP, fun x => ⟨fun hx => (hc x).elim (fun h => h)
    (fun h => (hq x h hw hx).elim), fun hx => hp x hx hw⟩⟩

/-- Construct a witness separately for each deciding world; no choice function over worlds. -/
theorem deciding_world_gives_necessary_witness (w : Prop) (X : σ → Prop)
    (hd : Decides w) (rc : RigidComprehension (σ → Prop)) (bf : Barcan σ) :
    □ (w → HasRigidCoextension X) :=
  (rc (fun x => w ≤ X x)).elim fun P hP =>
  (rc (fun x => w ≤ ¬ X x)).elim fun Q hQ =>
  have hp : □ (∀ x, P x → w → X x) :=
    weaklyInextensible_of_inextensible hP.1.2 (fun x => w → X x)
      fun x hx => (le_iff_prop _ _).1 ((hP.2 x).2 hx)
  have hq : □ (∀ x, Q x → w → ¬ X x) :=
    weaklyInextensible_of_inextensible hQ.1.2 (fun x => w → ¬ X x)
      fun x hx => (le_iff_prop _ _).1 ((hQ.2 x).2 hx)
  have hc : □ (∀ x, P x ∨ Q x) :=
    bf (fun x => P x ∨ Q x) fun x =>
      (hd (X x)).elim
        (fun hx => modal_K _ _ (nec% (fun (hp : P x) => (show P x ∨ Q x from Or.inl hp)))
          (weaklyPersistent_of_persistent hP.1.1 x ((hP.2 x).1 hx)))
        (fun hx => modal_K _ _ (nec% (fun (hq : Q x) => (show P x ∨ Q x from Or.inr hq)))
          (weaklyPersistent_of_persistent hQ.1.1 x ((hQ.2 x).1 hx)))
  modal_K _ _ (modal_K _ _ (modal_K _ _ (modal_K _ _
    (nec% (conditional_witness w X P Q)) (rigid_necessary P hP.1)) hp) hq) hc

theorem sealed_cover_propagates_witness (A : Prop → Prop) (hA : Sealed A)
    (hc : □ (JoinT A)) (rc : RigidComprehension (σ → Prop)) (bf : Barcan σ)
    (X : σ → Prop) : □ (HasRigidCoextension X) :=
  have hall : □ (∀ w, A w → w → HasRigidCoextension X) :=
    weaklyInextensible_of_inextensible hA.1.2 (fun w => w → HasRigidCoextension X)
      fun w hw => deciding_world_gives_necessary_witness w X (box_elim hA.2.2 w hw) rc bf
  modal_K _ _ (modal_K _ _
    (nec% (fun (hall : ∀ w, A w → w → HasRigidCoextension X) (hc : JoinT A) =>
      hc.elim fun w hw => hall w hw.1 hw.2)) hall) hc

theorem sealed_cover_propagates_comprehension (A : Prop → Prop) (hA : Sealed A)
    (hc : □ (JoinT A)) (rc : RigidComprehension (σ → Prop))
    (bf : Barcan σ) (bfP : Barcan (σ → Prop)) : NecRigidComprehension (σ → Prop) :=
  bfP HasRigidCoextension fun X => sealed_cover_propagates_witness A hA hc rc bf X

theorem strong_atomicity_rc_barcan_propagates_comprehension : StrongAtomicityT →
    RigidComprehension (Prop → Prop) → RigidComprehension (σ → Prop) →
    Barcan σ → Barcan (σ → Prop) → NecRigidComprehension (σ → Prop) :=
  fun sl rcT rc bf bfP => (exists_sealed_cover_t sl rcT).elim fun A hA =>
    sealed_cover_propagates_comprehension A hA.1 hA.2 rc bf bfP

/-- Both BF instances are relational even when σ = e. -/
theorem strong_atomicity_rc_relational_barcan_propagates_comprehension : StrongAtomicityT →
    RigidComprehension (Prop → Prop) → RigidComprehension ((σ → Prop) → Prop) →
    Barcan (σ → Prop) → Barcan ((σ → Prop) → Prop) →
    NecRigidComprehension (σ → Prop) := fun sl rcT rc bf bfP =>
  necessary_rigid_comprehension_pullback
    (strong_atomicity_rc_barcan_propagates_comprehension sl rcT rc bf bfP)

/-- The same finite premises give boxed Boolean Completeness at σ → t. -/
theorem strong_atomicity_rc_relational_barcan_propagates_completeness : StrongAtomicityT →
    RigidComprehension (Prop → Prop) → RigidComprehension ((σ → Prop) → Prop) →
    Barcan (σ → Prop) → Barcan ((σ → Prop) → Prop) →
    NecBooleanCompleteness (σ → Prop) := fun sl rcT rc bf bfP =>
  Proofs.necessary_rigid_comprehension_r_implies_necessary_boolean_completeness_r
    (strong_atomicity_rc_barcan_propagates_comprehension sl rcT rc bf bfP)

end propagation

theorem strong_atomicity_rc_barcan_propagates_comprehension_t : StrongAtomicityT →
    RigidComprehension (Prop → Prop) → Barcan Prop → Barcan (Prop → Prop) →
    NecRigidComprehension Prop := fun sl rc bf bfP =>
  necessary_rigid_comprehension_pullback_t
    (strong_atomicity_rc_barcan_propagates_comprehension sl rc rc bf bfP)

theorem strong_atomicity_rc_barcan_propagates_completeness_t : StrongAtomicityT →
    RigidComprehension (Prop → Prop) → Barcan Prop → Barcan (Prop → Prop) →
    NecBooleanCompleteness Prop := fun sl rc bf bfP =>
  modal_K _ _ (nec% Proofs.rigid_comprehension_r_implies_boolean_completeness_r_at_t)
    (strong_atomicity_rc_barcan_propagates_comprehension sl rc rc bf bfP)

end Classicism.Research.ModalPropagation

#classicism_check Classicism.Research.ModalPropagation.universe_weakly_inextensible_of_barcan
  Classicism.Research.ModalPropagation.barcan_of_universe_weakly_inextensible
  Classicism.Research.ModalPropagation.universe_weakly_rigid_iff_barcan
  Classicism.Research.ModalPropagation.universe_rigid_iff_necessary_barcan
  Classicism.Research.ModalPropagation.universal_rigid_eq_universe_of_barcan
  Classicism.Research.ModalPropagation.universal_rigid_barcan_iff_identity
  Classicism.Proofs.rigid_comprehension_and_bf_imply_necessary_bf
  Classicism.Research.ModalPropagation.haecceity_injective
  Classicism.Research.ModalPropagation.lift_on_code
  Classicism.Research.ModalPropagation.code_necessary
  Classicism.Research.ModalPropagation.rigid_code_image_sealed
  Classicism.Research.ModalPropagation.code_guard_from_equality
  Classicism.Research.ModalPropagation.pullback_persistent
  Classicism.Research.ModalPropagation.pullback_weakly_inextensible
  Classicism.Research.ModalPropagation.rigid_pullback_of_sealed_image
  Classicism.Research.ModalPropagation.rigid_pullback_of_code_image
  Classicism.Research.ModalPropagation.rigid_comprehension_pullback
  Classicism.Research.ModalPropagation.necessary_rigid_comprehension_pullback
  Classicism.Research.ModalPropagation.singleton_value_weakly_inextensible
  Classicism.Research.ModalPropagation.singleton_value_rigid
  Classicism.Research.ModalPropagation.rigid_comprehension_pullback_t
  Classicism.Research.ModalPropagation.necessary_rigid_comprehension_pullback_t
  Classicism.Research.ModalPropagation.conditional_witness
  Classicism.Research.ModalPropagation.deciding_world_gives_necessary_witness
  Classicism.Research.ModalPropagation.sealed_cover_propagates_witness
  Classicism.Research.ModalPropagation.sealed_cover_propagates_comprehension
  Classicism.Research.ModalPropagation.strong_atomicity_rc_barcan_propagates_comprehension
  Classicism.Research.ModalPropagation.strong_atomicity_rc_relational_barcan_propagates_comprehension
  Classicism.Research.ModalPropagation.strong_atomicity_rc_relational_barcan_propagates_completeness
  Classicism.Research.ModalPropagation.strong_atomicity_rc_barcan_propagates_comprehension_t
  Classicism.Research.ModalPropagation.strong_atomicity_rc_barcan_propagates_completeness_t
#classicism_types Classicism.Research.ModalPropagation.universe_weakly_inextensible_of_barcan
  Classicism.Research.ModalPropagation.barcan_of_universe_weakly_inextensible
  Classicism.Research.ModalPropagation.universe_weakly_rigid_iff_barcan
  Classicism.Research.ModalPropagation.universe_rigid_iff_necessary_barcan
  Classicism.Research.ModalPropagation.universal_rigid_eq_universe_of_barcan
  Classicism.Research.ModalPropagation.universal_rigid_barcan_iff_identity
  Classicism.Proofs.rigid_comprehension_and_bf_imply_necessary_bf
  Classicism.Research.ModalPropagation.haecceity_injective
  Classicism.Research.ModalPropagation.lift_on_code
  Classicism.Research.ModalPropagation.code_necessary
  Classicism.Research.ModalPropagation.rigid_code_image_sealed
  Classicism.Research.ModalPropagation.code_guard_from_equality
  Classicism.Research.ModalPropagation.pullback_persistent
  Classicism.Research.ModalPropagation.pullback_weakly_inextensible
  Classicism.Research.ModalPropagation.rigid_pullback_of_sealed_image
  Classicism.Research.ModalPropagation.rigid_pullback_of_code_image
  Classicism.Research.ModalPropagation.rigid_comprehension_pullback
  Classicism.Research.ModalPropagation.necessary_rigid_comprehension_pullback
  Classicism.Research.ModalPropagation.singleton_value_weakly_inextensible
  Classicism.Research.ModalPropagation.singleton_value_rigid
  Classicism.Research.ModalPropagation.rigid_comprehension_pullback_t
  Classicism.Research.ModalPropagation.necessary_rigid_comprehension_pullback_t
  Classicism.Research.ModalPropagation.conditional_witness
  Classicism.Research.ModalPropagation.deciding_world_gives_necessary_witness
  Classicism.Research.ModalPropagation.sealed_cover_propagates_witness
  Classicism.Research.ModalPropagation.sealed_cover_propagates_comprehension
  Classicism.Research.ModalPropagation.strong_atomicity_rc_barcan_propagates_comprehension
  Classicism.Research.ModalPropagation.strong_atomicity_rc_relational_barcan_propagates_comprehension
  Classicism.Research.ModalPropagation.strong_atomicity_rc_relational_barcan_propagates_completeness
  Classicism.Research.ModalPropagation.strong_atomicity_rc_barcan_propagates_comprehension_t
  Classicism.Research.ModalPropagation.strong_atomicity_rc_barcan_propagates_completeness_t
