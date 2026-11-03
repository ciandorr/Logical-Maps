import Classicism.Results.BourbakiWitt.Derive.ActualityParts
import Classicism.Results.BourbakiWitt.ActualityChain
import Classicism.Tools.Translate
import Classicism.Certified.Schemas

/-! Derivations of the theorems of `Classicism.Results.BourbakiWitt.ActualityChain`, in a module of their own: the translator's memory
grows with the proof it reads, and a citation of an imported `foo.derivable` costs nothing. -/

set_option maxHeartbeats 0 in
#classicism_derive_audit Classicism.Results.BourbakiWitt.ActualityChain
