import Classicism.Certified.Schemas
import Classicism.Results.Records.Atoms

/-!
# The records about self-atoms and strong atoms, as entailments

Every record theorem of `Results/Records/Atoms.lean`, derived in the object language by the
translator and read as an entailment between schemas, `foo.entails`, as `Entailed.lean` does
for the other record files (kept apart so that those audits need not rerun).
-/

set_option maxHeartbeats 0 in
#classicism_entails_audit Classicism.Results.Records.Atoms
