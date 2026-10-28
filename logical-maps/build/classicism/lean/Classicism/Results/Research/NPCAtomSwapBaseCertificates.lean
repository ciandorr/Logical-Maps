import Classicism.Results.Research.NPCAtomSwapBase
import Classicism.Tools.Check
import Classicism.Tools.TypeSystem
import Classicism.Tools.Translate

/-! Narrow gate/type/derivation audit of the atom-swap rigidity foundation. -/
#classicism_audit Classicism.Results.Research.NPCAtomSwapBase
#classicism_types_audit Classicism.Results.Research.NPCAtomSwapBase
set_option maxHeartbeats 0 in
#classicism_derive_audit Classicism.Results.Research.NPCAtomSwapBase

#print axioms Classicism.Research.NPCAtomSwap.guard_persistent.derivable
#print axioms Classicism.Research.NPCAtomSwap.lift_swap_eq.derivable
#print axioms Classicism.Research.NPCAtomSwap.lift_swap_funext.derivable
