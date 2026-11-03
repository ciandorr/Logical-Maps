import Classicism.Results.BourbakiWitt.Derive.Settled
import Classicism.Results.BourbakiWitt.TransversalChoice
import Classicism.Tools.Translate
import Classicism.Certified.Schemas

/-! Derivations of the theorems of `Classicism.Results.BourbakiWitt.TransversalChoice`, in a module of their own: the translator's memory
grows with the proof it reads, and a citation of an imported `foo.derivable` costs nothing. -/

set_option maxHeartbeats 0 in
#classicism_derive_audit Classicism.Results.BourbakiWitt.TransversalChoice
