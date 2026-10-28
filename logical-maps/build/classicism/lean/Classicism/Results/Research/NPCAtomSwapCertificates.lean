import Classicism.Results.Research.NPCAtomSwapConnectives
import Classicism.Results.Research.NPCAtomSwapBaseCertificates

/-! C-gate, admitted-type, and actual object-derivation audits for the concrete swap. -/

#classicism_audit Classicism.Results.Research.NPCAtomSwap Classicism.Results.Research.NPCAtomSwapConnectives
#classicism_types_audit Classicism.Results.Research.NPCAtomSwap Classicism.Results.Research.NPCAtomSwapConnectives

set_option maxHeartbeats 0 in
#classicism_derive_audit Classicism.Results.Research.NPCAtomSwap Classicism.Results.Research.NPCAtomSwapConnectives

#print axioms Classicism.Research.NPCAtomSwap.guard_persistent.derivable
#print axioms Classicism.Research.NPCAtomSwap.lift_swap_eq.derivable
#print axioms Classicism.Research.NPCAtomSwap.lift_swap_funext.derivable
#print axioms Classicism.Research.NPCAtomSwap.swap_involution.derivable
#print axioms Classicism.Research.NPCAtomSwap.swap_neg.derivable
#print axioms Classicism.Research.NPCAtomSwap.swap_and.derivable
#print axioms Classicism.Research.NPCAtomSwap.swap_or.derivable
#print axioms Classicism.Research.NPCAtomSwap.swap_true.derivable
#print axioms Classicism.Research.NPCAtomSwap.swap_false.derivable
#print axioms Classicism.Research.NPCAtomSwap.swap_imp.derivable
#print axioms Classicism.Research.NPCAtomSwap.swap_iff.derivable
#print axioms Classicism.Research.NPCAtomSwap.swap_eq.derivable
#print axioms Classicism.Research.NPCAtomSwap.swap_forall.derivable
#print axioms Classicism.Research.NPCAtomSwap.swap_exists.derivable
#print axioms Classicism.Research.NPCAtomSwap.swap_le_left.derivable
#print axioms Classicism.Research.NPCAtomSwap.swap_le_right.derivable
