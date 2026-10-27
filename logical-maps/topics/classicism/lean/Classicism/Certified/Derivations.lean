import Classicism.Tools.Translate
import Classicism.Results.Records

/-!
# The record theorems, derived

Every theorem of `Classicism/Results/Records.lean`, derived in the object language by the
translator from its shallow proof: the home of every `foo.derivable` that the entailments
of `Entailed.lean` cite. Kept apart from them because the derivations are the expensive
part of the build and change only when the proofs do.
-/

set_option maxHeartbeats 0 in
#classicism_derive_audit Classicism.Results.Records.Base Classicism.Results.Records.Coarse Classicism.Results.Records.Extensionality Classicism.Results.Records.Comprehension Classicism.Results.Records.Lattice Classicism.Results.Records.Choice Classicism.Results.Records.C5 Classicism.Results.Records.Infinity Classicism.Background.AppendixD Classicism.Results.Records.Necessity
#classicism_derive_audit Classicism.Principles.Base Classicism.Principles.Coarse Classicism.Principles.Extensionality Classicism.Principles.Lattice Classicism.Principles.Instances Classicism.Principles.Comprehension Classicism.Principles.Choice Classicism.Principles.Infinity Classicism.Principles.Schematic
