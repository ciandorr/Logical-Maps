import Classicism.Results.Research.ModalPropagationRigidPower
import Classicism.Results.Research.ModalPropagation

/-!
# Modal propagation from finitely many Strong Atomicity and comprehension instances

Continuation of `modal-status.md`. The source modules handed off there remain
frozen. This module removes their explicit Rigid Power/Barcan premises using
the existing recorded Atomicity + Rigid Comprehension theorem. It uses the narrow, attributed rigid-power dependency to avoid rebuilding
unrelated record derivations.

Every premise below is one original-language instance. Subsequent separately
compiled certificates and list entailments assemble the all-schema result.
No theorem here asserts a type quantifier inside C or derives BF_e.
-/

namespace Classicism.Research.ModalPropagationConsequences
open Classicism.P Classicism.Paper
open Classicism.Research.SealedWorldCover Classicism.Research.ModalPropagation

variable {σ : Type} [Ty σ]

/-- Four local instances suffice; no boxed comprehension or separate RP premise. -/
theorem strong_atomicity_rc_necessary_barcan_relational :
    StrongAtomicity (σ → Prop) →
    StrongAtomicity (((σ → Prop) → Prop) → Prop) →
    RigidComprehension ((σ → Prop) → Prop) →
    RigidComprehension (((σ → Prop) → Prop) → Prop) →
    NecBarcanRelational (σ → Prop) := fun sl slHigh rc rcHigh =>
  strong_atomicity_rc_power_implies_necessary_barcan sl rc
    (atom_rc_rigid_power
      (Proofs.strong_atomicity_r_implies_atomicity_r slHigh) rc rcHigh)

/-- The explicit finite dependency set behind full-schema comprehension propagation. -/
theorem strong_atomicity_rc_necessary_comprehension :
    StrongAtomicity Prop →
    StrongAtomicity (σ → Prop) →
    StrongAtomicity ((σ → Prop) → Prop) →
    StrongAtomicity (((σ → Prop) → Prop) → Prop) →
    StrongAtomicity ((((σ → Prop) → Prop) → Prop) → Prop) →
    RigidComprehension (Prop → Prop) →
    RigidComprehension ((σ → Prop) → Prop) →
    RigidComprehension (((σ → Prop) → Prop) → Prop) →
    RigidComprehension ((((σ → Prop) → Prop) → Prop) → Prop) →
    NecRigidComprehension (σ → Prop) :=
  fun slT sl1 sl2 sl3 sl4 rcT rc2 rc3 rc4 =>
    strong_atomicity_rc_relational_barcan_propagates_comprehension slT rcT rc2
      (box_elim (strong_atomicity_rc_necessary_barcan_relational sl1 sl3 rc2 rc3))
      (box_elim (strong_atomicity_rc_necessary_barcan_relational sl2 sl4 rc3 rc4))

/-- The same finite instances give boxed Boolean Completeness directly. -/
theorem strong_atomicity_rc_necessary_completeness :
    StrongAtomicity Prop →
    StrongAtomicity (σ → Prop) →
    StrongAtomicity ((σ → Prop) → Prop) →
    StrongAtomicity (((σ → Prop) → Prop) → Prop) →
    StrongAtomicity ((((σ → Prop) → Prop) → Prop) → Prop) →
    RigidComprehension (Prop → Prop) →
    RigidComprehension ((σ → Prop) → Prop) →
    RigidComprehension (((σ → Prop) → Prop) → Prop) →
    RigidComprehension ((((σ → Prop) → Prop) → Prop) → Prop) →
    NecBooleanCompleteness (σ → Prop) :=
  fun slT sl1 sl2 sl3 sl4 rcT rc2 rc3 rc4 =>
    strong_atomicity_rc_relational_barcan_propagates_completeness slT rcT rc2
      (box_elim (strong_atomicity_rc_necessary_barcan_relational sl1 sl3 rc2 rc3))
      (box_elim (strong_atomicity_rc_necessary_barcan_relational sl2 sl4 rc3 rc4))

end Classicism.Research.ModalPropagationConsequences

#classicism_check
  Classicism.Research.ModalPropagationConsequences.strong_atomicity_rc_necessary_barcan_relational
  Classicism.Research.ModalPropagationConsequences.strong_atomicity_rc_necessary_comprehension
  Classicism.Research.ModalPropagationConsequences.strong_atomicity_rc_necessary_completeness
#classicism_types
  Classicism.Research.ModalPropagationConsequences.strong_atomicity_rc_necessary_barcan_relational
  Classicism.Research.ModalPropagationConsequences.strong_atomicity_rc_necessary_comprehension
  Classicism.Research.ModalPropagationConsequences.strong_atomicity_rc_necessary_completeness
