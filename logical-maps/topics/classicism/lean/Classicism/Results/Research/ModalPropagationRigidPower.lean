import Classicism.Results.Research.ModalPropagation
import Classicism.Results.Arity

/-!
Narrow dependency for the modal-propagation certificates. The six proofs below
are copied without mathematical changes from `Classicism/Results/Arity.lean`
(the box/persistence lemmas and Atomicity + Rigid Comprehension section).
That source identifies Bacon, *Could the truths of mathematics have been
 different?*, Lemma C.6; its local citation has no page locator. This file
makes no new authorship claim and does not modify the original proof.
The separate namespace avoids importing the all-record certification batch.
-/
namespace Classicism.Research.ModalPropagationRigidPower
open Classicism.Paper
variable {σ : Type} [Ty σ]

/-! ### Atomicity and Rigid Comprehension give Rigid Power (19 October 2026)

Lemma C.6 of Bacon, *Could the truths of mathematics have been different?*, with `□` for his
`□_N`: an atom `W` of the power type below the power property of a rigid `F` singles out an
actual rigid `X ≤ F` that is, wherever `W` is instantiated, its only instance. With Atomicity at
the power type that makes the power property weakly inextensible, and Rigid Comprehension at the
power type, as Tame Rigidity there, makes it rigid. No BF is used. -/

end Classicism.Research.ModalPropagationRigidPower

#classicism_check
  Classicism.rigid_necessary
  Classicism.box_le_rel
  Classicism.rigid_power_property_persistent
  Classicism.atom_power_pullback
  Classicism.atom_rc_rigid_power_core
  Classicism.atom_rc_rigid_power
#classicism_types
  Classicism.rigid_necessary
  Classicism.box_le_rel
  Classicism.rigid_power_property_persistent
  Classicism.atom_power_pullback
  Classicism.atom_rc_rigid_power_core
  Classicism.atom_rc_rigid_power
