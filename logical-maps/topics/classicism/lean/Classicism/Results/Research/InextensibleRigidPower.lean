import Classicism.Results.Research.InextensiblePower

/-!
# Rigid power from local IC and ND

Direct source: `research/2026-10-22/notes/nd-inextensible-comprehension-implies-weak-power.md`,
§4 (original research, unpaginated, `misc`, 22 October 2026).
All future separation is derived from current ND and the rigid bound.
-/

namespace Classicism.Research.InextensiblePower
open Classicism.Paper Classicism.P

def RigidBelow {σ : Type} [Ty σ] (F : σ → Prop) : (σ → Prop) → Prop :=
  fun X => Rigid X ∧ X ≤ F

theorem different_at {σ : Type} [Ty σ] (X Y : σ → Prop) (a : σ) :
    X a → ¬ Y a → X ≠ Y := fun hx hn he => hn (Eq.mp (congrFun he a) hx)

theorem necessary_different_at {σ : Type} [Ty σ] (X Y : σ → Prop) (a : σ)
    (hx : □ (X a)) (hy : □ (¬ Y a)) : □ (X ≠ Y) :=
  modal_K _ _ (modal_K _ _ (nec% (different_at X Y a)) hx) hy

theorem rigid_subrelations_separated {σ : Type} [Ty σ] (F : σ → Prop)
    (hs : InternallySeparated F) : InternallySeparated (RigidBelow F) := by
  intro X Y hx hy hne
  have hnco : ¬ (∀ a, X a ↔ Y a) := fun hc => hne
    (eq_of_weaklyRigid_coext (weaklyRigid_of_rigid hx.1) (weaklyRigid_of_rigid hy.1) hc)
  obtain ⟨a, ha⟩ := (not_forall_eq (fun a => X a ↔ Y a)).mp hnco
  apply (em (X a)).elim
  · intro hxa
    have hnya : ¬ Y a := fun hya => ha ⟨fun _ => hya, fun _ => hxa⟩
    exact necessary_different_at X Y a
      ((weaklyPersistent_of_persistent hx.1.1) a hxa)
      (missing_point_sealed F Y hs (incl_of_le hy.2)
        (weaklyInextensible_of_inextensible hy.1.2) a (incl_of_le hx.2 a hxa) hnya)
  · intro hnxa
    have hya : Y a := (em (Y a)).elim (fun h => h)
      (fun hn => False.elim (ha ⟨fun h => False.elim (hnxa h), fun h => False.elim (hn h)⟩))
    have hrev : □ (Y ≠ X) := necessary_different_at Y X a
      ((weaklyPersistent_of_persistent hy.1.1) a hya)
      (missing_point_sealed F X hs (incl_of_le hx.2)
        (weaklyInextensible_of_inextensible hx.1.2) a (incl_of_le hy.2 a hya) hnxa)
    exact modal_K _ _ (nec% (fun (h : Y ≠ X) (he : X = Y) => h he.symm)) hrev

theorem rigidBelow_weaklyPersistent {σ : Type} [Ty σ] (F : σ → Prop) :
    WeaklyPersistent (RigidBelow F) := fun X hx =>
  (box_and_eq _ _).mpr
    ⟨(box_and_eq _ _).mpr ⟨modal_four _ hx.1.1, modal_four _ hx.1.2⟩,
      necessity_of_identity _ _ hx.2⟩

theorem nd_ic_rigidPower {σ : Type} [Ty σ] :
    NecessityOfDistinctness Prop → InextensibleComprehension ((σ → Prop) → Prop) →
    RigidPower (σ → Prop) := by
  intro nd ic F hf
  have hs : □ (InternallySeparated (RigidBelow F)) :=
    modal_K _ _ (nec% (rigid_subrelations_separated F))
      (weaklyRigid_separated nd F (weaklyRigid_of_rigid hf))
  obtain ⟨G, hg, hc⟩ := ic (RigidBelow F)
  exact separated_coextension_rigid nd (RigidBelow F) G
    (nec% (rigidBelow_weaklyPersistent F)) hs hg hc

end Classicism.Research.InextensiblePower
