import Classicism.Results.Records.Lattice
import Classicism.Tools.Check
import Classicism.Tools.TypeSystem
import Classicism.Background.RigidityClosure

/-!
# Rigid indexed unions, direct images and descent along necessary embeddings

New research continuation, 22 October 2026. Direct proof notes and exact
certification status: research/2026-10-22/lean-formalization/
modal-rigidity-descent.md and modal-descent-status.md.

No BF, choice, ND or comprehension is used in the closure theorems.
The final descent theorem assumes its displayed comprehension instance.
All types and formulas are in the original finitary C.
-/

namespace Classicism.Research.ModalRigidityDescent
open Classicism.P Classicism.Paper Classicism.Rigidity

section maps
variable {σ τ : Type} [Ty σ] [Rel τ]

/-- Comprehension descends along a necessarily injective admitted operation. -/
theorem rigid_comprehension_descent (f : σ → τ) (hi : □ (Injective f))
    (rc : RigidComprehension (τ → Prop)) : RigidComprehension (σ → Prop) := fun X =>
  (rc (DirectImage f X)).elim fun P hP =>
    ⟨InverseImage f P,
      inverse_image_rigid f P hP.1
        (fun y hy => ((hP.2 y).2 hy).elim fun x hx => ⟨x, hx.2⟩) hi,
      fun x => ⟨fun hx => (hP.2 (f x)).1
        ((direct_image_inverse_value f X (box_elim hi) x).2 hx),
        fun hx => (direct_image_inverse_value f X (box_elim hi) x).1
          ((hP.2 (f x)).2 hx)⟩⟩

end maps

end Classicism.Research.ModalRigidityDescent

#classicism_check
  Classicism.rigid_necessary
  Classicism.Rigidity.rigid_family_sealed
  Classicism.Rigidity.indexed_union_weakly_persistent
  Classicism.Rigidity.indexed_union_weakly_inextensible
  Classicism.Rigidity.indexed_union_rigid
  Classicism.Rigidity.singleton_rigid
  Classicism.Rigidity.direct_image_rigid
  Classicism.Rigidity.range_necessary
  Classicism.Rigidity.rigid_range_sealed
  Classicism.Rigidity.inverse_image_persistent
  Classicism.Rigidity.fiber_guard_of_injective
  Classicism.Rigidity.inverse_image_weakly_inextensible
  Classicism.Rigidity.inverse_image_rigid
  Classicism.Rigidity.direct_image_inverse_value
  Classicism.Research.ModalRigidityDescent.rigid_comprehension_descent
#classicism_types
  Classicism.rigid_necessary
  Classicism.Rigidity.rigid_family_sealed
  Classicism.Rigidity.indexed_union_weakly_persistent
  Classicism.Rigidity.indexed_union_weakly_inextensible
  Classicism.Rigidity.indexed_union_rigid
  Classicism.Rigidity.singleton_rigid
  Classicism.Rigidity.direct_image_rigid
  Classicism.Rigidity.range_necessary
  Classicism.Rigidity.rigid_range_sealed
  Classicism.Rigidity.inverse_image_persistent
  Classicism.Rigidity.fiber_guard_of_injective
  Classicism.Rigidity.inverse_image_weakly_inextensible
  Classicism.Rigidity.inverse_image_rigid
  Classicism.Rigidity.direct_image_inverse_value
  Classicism.Research.ModalRigidityDescent.rigid_comprehension_descent
