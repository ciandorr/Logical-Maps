import Classicism.Results.Research.RigidityClosureResearchFinite

/-! Direct source: notes/maximalism-modal.md §15, original research, misc,
unpaginated, 22 October 2026. Nullary means relation type t; no unit sort is used. -/
namespace Classicism.Research.RigidityClosure
open Classicism.P Classicism.Paper

theorem weaklyRigid_false : WeaklyRigid False :=
  ⟨fun h => False.elim h, fun Z _ => nec% (fun h : False => (False.elim h : Z))⟩
theorem weaklyRigid_true : WeaklyRigid True :=
  ⟨fun _ => box_true, fun Z hz => box_imp_of_box True Z (hz trivial)⟩
theorem rigid_false : Rigid False :=
  (rigid_iff_box_weaklyRigid False).2 (nec% weaklyRigid_false)
theorem rigid_true : Rigid True :=
  (rigid_iff_box_weaklyRigid True).2 (nec% weaklyRigid_true)

theorem weaklyRigid_prop_iff (p : Prop) : WeaklyRigid p ↔ (p = True ∨ p = False) :=
  ⟨fun hp => (em p).elim (fun h => Or.inl (hp.1 h))
    (fun hn => Or.inr (le_antisymm_prop p False
      ((le_iff_prop p False).2 (hp.2 False (fun h => False.elim (hn h))))
      (bot_le_prop p))),
   fun h => h.elim (fun he => he.symm ▸ weaklyRigid_true)
      (fun he => he.symm ▸ weaklyRigid_false)⟩

theorem rigid_prop_iff (p : Prop) : Rigid p ↔ (p = True ∨ p = False) :=
  ⟨fun hp => (weaklyRigid_prop_iff p).1 (weaklyRigid_of_rigid hp),
   fun h => h.elim (fun he => he.symm ▸ rigid_true) (fun he => he.symm ▸ rigid_false)⟩

theorem nullary_tame : TameRigidity Prop :=
  fun p hp => (rigid_prop_iff p).2 ((weaklyRigid_prop_iff p).1 hp)

theorem nullary_necessary_tame : NecTameRigidity Prop := nec% nullary_tame

theorem weak_power_bottom_eq :
    (fun q : Prop => WeaklyRigid q ∧ q ≤ False) = (fun q => q = False) :=
  funext fun q => propext
    ⟨fun h => le_antisymm_prop q False h.2 (bot_le_prop q),
     fun he => he.symm ▸ (show WeaklyRigid False ∧ False ≤ False from
       ⟨weaklyRigid_false, le_refl_prop False⟩)⟩

theorem weak_power_top_eq :
    (fun q : Prop => WeaklyRigid q ∧ q ≤ True) = (fun q => q = False ∨ q = True) :=
  funext fun q => propext
    ⟨fun h => ((weaklyRigid_prop_iff q).1 h.1).elim Or.inr Or.inl,
     fun h => ⟨(weaklyRigid_prop_iff q).2 (h.elim Or.inr Or.inl), le_top_prop q⟩⟩

theorem rigid_power_bottom_eq :
    (fun q : Prop => Rigid q ∧ q ≤ False) = (fun q => q = False) :=
  funext fun q => propext
    ⟨fun h => le_antisymm_prop q False h.2 (bot_le_prop q),
     fun he => he.symm ▸ (show Rigid False ∧ False ≤ False from
       ⟨rigid_false, le_refl_prop False⟩)⟩

theorem rigid_power_top_eq :
    (fun q : Prop => Rigid q ∧ q ≤ True) = (fun q => q = False ∨ q = True) :=
  funext fun q => propext
    ⟨fun h => ((rigid_prop_iff q).1 h.1).elim Or.inr Or.inl,
     fun h => ⟨(rigid_prop_iff q).2 (h.elim Or.inr Or.inl), le_top_prop q⟩⟩

theorem bivalent_propositions_rigid : Rigid (fun q : Prop => q = False ∨ q = True) :=
  rigid_union (fun q : Prop => q = False) (fun q : Prop => q = True)
    (Classicism.Rigidity.singleton_rigid False)
    (Classicism.Rigidity.singleton_rigid True)

theorem nullary_weak_power : WeaklyRigidPower Prop := by
  intro F hF
  apply ((weaklyRigid_prop_iff F).1 hF).elim
  · intro he
    rw [he, weak_power_top_eq]
    exact weaklyRigid_of_rigid bivalent_propositions_rigid
  · intro he
    rw [he, weak_power_bottom_eq]
    exact weaklyRigid_of_rigid (Classicism.Rigidity.singleton_rigid False)

theorem nullary_rigid_power : RigidPower Prop := by
  intro F hF
  apply ((rigid_prop_iff F).1 hF).elim
  · intro he
    rw [he, rigid_power_top_eq]
    exact bivalent_propositions_rigid
  · intro he
    rw [he, rigid_power_bottom_eq]
    exact Classicism.Rigidity.singleton_rigid False

theorem nullary_necessary_weak_power : NecWeaklyRigidPower Prop := nec% nullary_weak_power
theorem nullary_necessary_rigid_power : NecRigidPower Prop := nec% nullary_rigid_power

theorem weaklyRigid_predicate_eq_bivalence :
    (fun p : Prop => WeaklyRigid p) = (fun p => p = False ∨ p = True) :=
  funext fun p => propext ⟨fun hp => ((weaklyRigid_prop_iff p).1 hp).elim Or.inr Or.inl,
    fun hp => (weaklyRigid_prop_iff p).2 (hp.elim Or.inr Or.inl)⟩
theorem rigid_predicate_eq_bivalence :
    (fun p : Prop => Rigid p) = (fun p => p = False ∨ p = True) :=
  funext fun p => propext ⟨fun hp => ((rigid_prop_iff p).1 hp).elim Or.inr Or.inl,
    fun hp => (rigid_prop_iff p).2 (hp.elim Or.inr Or.inl)⟩

theorem nullary_rigid_rigidity : RigidRigidity Prop := by
  change Rigid (fun p : Prop => Rigid p)
  exact Eq.mp (congrArg Rigid rigid_predicate_eq_bivalence.symm)
    bivalent_propositions_rigid

theorem nullary_weak_rigid_weak_rigidity : WeaklyRigidWeakRigidity Prop := by
  change WeaklyRigid (fun p : Prop => WeaklyRigid p)
  exact Eq.mp (congrArg WeaklyRigid weaklyRigid_predicate_eq_bivalence.symm)
    (weaklyRigid_of_rigid bivalent_propositions_rigid)

/-- Every proposition has a rigid coextension, without a uniform selecting operation. -/
theorem nullary_rigid_comprehension : RigidComprehension Prop := fun p =>
  (em p).elim (fun hp => ⟨True, rigid_true, ⟨fun _ => trivial, fun _ => hp⟩⟩)
    (fun hn => ⟨False, rigid_false, ⟨hn, False.elim⟩⟩)

theorem nullary_weak_rigid_comprehension : WeakRigidComprehension Prop :=
  Proofs.rigid_comprehension_r_implies_weak_rigid_comprehension_r nullary_rigid_comprehension

theorem nullary_necessary_rigid_comprehension : NecRigidComprehension Prop :=
  nec% nullary_rigid_comprehension

end Classicism.Research.RigidityClosure
