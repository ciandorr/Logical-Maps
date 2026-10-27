import Classicism.Results.Research.RigidityClosureResearchFinite

/-! Direct source: notes/maximalism-modal.md §§18–19, original research, misc,
unpaginated, 22 October 2026. WRP→RP uses the next property-type instance,
exactly as the established theorem does. The decomposition is an all-schema
claim; a single-type WRP→RP implication is not asserted. -/
namespace Classicism.Research.RigidityClosure
open Classicism.P Classicism.Paper
open Classicism.Research.InextensiblePower (InternallySeparated)
variable {σ : Type} [Ty σ]

def BoundedTamePropagation (σ : Type) [Ty σ] : Prop :=
  ∀ F : σ → Prop, Rigid F → □ (∀ X : σ → Prop, WeaklyRigid X ∧ X ≤ F → Rigid X)

theorem weak_power_bounded_propagation : WeaklyRigidPower (σ → Prop) →
    BoundedTamePropagation σ := fun wrp F hf =>
  modal_K _ _
    (nec% (fun (h : WeaklyPersistent (fun X : σ → Prop => WeaklyRigid X ∧ X ≤ F))
      (X : σ → Prop) (hx : WeaklyRigid X ∧ X ≤ F) =>
      (rigid_iff_box_weaklyRigid X).2
        (modal_K _ _ (nec% (fun h : WeaklyRigid X ∧ X ≤ F => h.1)) (h X hx))))
    (persistent_of_weaklyRigid (wrp F (weaklyRigid_of_rigid hf)))

theorem bounded_power_families_equal (F : σ → Prop)
    (hh : □ (∀ X : σ → Prop, WeaklyRigid X ∧ X ≤ F → Rigid X)) :
    (fun X : σ → Prop => WeaklyRigid X ∧ X ≤ F) =
      (fun X : σ → Prop => Rigid X ∧ X ≤ F) :=
  intensionality _ _ (modal_K _ _
    (nec% (fun (h : ∀ X : σ → Prop, WeaklyRigid X ∧ X ≤ F → Rigid X)
      (X : σ → Prop) => (show (WeaklyRigid X ∧ X ≤ F) ↔ (Rigid X ∧ X ≤ F) from
        ⟨fun hx => ⟨h X hx, hx.2⟩, fun hx => ⟨weaklyRigid_of_rigid hx.1, hx.2⟩⟩))) hh)

theorem tame_power_bounded_implies_weak_power : TameRigidity (σ → Prop) →
    RigidPower (σ → Prop) → BoundedTamePropagation σ → WeaklyRigidPower (σ → Prop) :=
  fun tr rp hh F hf =>
    (bounded_power_families_equal F (hh F (tr F hf))).symm ▸
      weaklyRigid_of_rigid (rp F (tr F hf))

/-- Exact argument-type ND, weaker than assuming ND_t. -/
theorem argument_nd_seals_separation (nd : NecessityOfDistinctness σ)
    (F : σ → Prop) (hf : WeaklyRigid F) : □ (InternallySeparated F) :=
  modal_K _ _ (nec% (Classicism.Research.InextensiblePower.separated_of_decisions F))
    ((Classicism.Research.InextensiblePower.weaklyRigid_square F hf).2
      (fun a b => Classicism.Research.InextensiblePower.DecidedIdentity a b)
      (fun a b _ => Classicism.Research.InextensiblePower.decidedIdentity_persistent a b
        ((em (a = b)).elim (fun he => Or.inl (necessity_of_identity a b he))
          (fun hn => Or.inr (nd a b hn)))))

theorem bounded_tame_universal (F : σ → Prop) : Rigid F → InternallySeparated F →
    ∀ X : σ → Prop, WeaklyRigid X ∧ X ≤ F → Rigid X :=
  fun hf hs X hx => Classicism.Research.InextensiblePower.bounded_tame F X hf hs hx.1 hx.2

theorem nd_bounded_propagation : NecessityOfDistinctness σ → BoundedTamePropagation σ :=
  fun nd F hf => modal_K _ _ (modal_K _ _ (nec% (bounded_tame_universal F))
    (Classicism.rigid_necessary F hf))
    (argument_nd_seals_separation nd F (weaklyRigid_of_rigid hf))

theorem nd_tame_power_implies_weak_power : NecessityOfDistinctness σ →
    TameRigidity (σ → Prop) → RigidPower (σ → Prop) → WeaklyRigidPower (σ → Prop) :=
  fun nd tr rp => tame_power_bounded_implies_weak_power tr rp (nd_bounded_propagation nd)

end Classicism.Research.RigidityClosure
