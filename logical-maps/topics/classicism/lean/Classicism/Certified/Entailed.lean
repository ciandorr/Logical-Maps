import Classicism.Certified.Schemas
import Classicism.Certified.Derivations

/-!
# The map's arrows as entailments

Every record theorem of `Classicism/Results/Records.lean` — a shallow proof of `P … → Q …`, derived
in the object language as `foo.derivable` — read as an entailment between schemas,
`foo.entails : P.schema ⟹ Q.schema`. This is the one home of those declarations; the derivations they
cite are in `Derivations.lean`.
-/

#classicism_entails_audit Classicism.Results.Records.Base Classicism.Results.Records.Coarse Classicism.Results.Records.Extensionality Classicism.Results.Records.Comprehension Classicism.Results.Records.Lattice Classicism.Results.Records.Choice Classicism.Results.Records.C5 Classicism.Results.Records.Infinity Classicism.Background.AppendixD Classicism.Results.Records.Necessity
#classicism_entails_audit Classicism.Principles.Base Classicism.Principles.Coarse Classicism.Principles.Extensionality Classicism.Principles.Lattice Classicism.Principles.Instances Classicism.Principles.Comprehension Classicism.Principles.Choice Classicism.Principles.Infinity Classicism.Principles.Schematic
