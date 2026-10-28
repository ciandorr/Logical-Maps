import Classicism.Results.Research.ModalPropagationConsequences
import Classicism.Certified.Schemas

/-! One new certificate per compilation process. The generated schemas
have one shared home. Subsequent modal certificates import this module
instead of regenerating them independently. -/

#classicism_certify Classicism.Research.SealedWorldCover.strong_atomicity_rc_implies_necessary_strong_atomicity
#classicism_entails Classicism.Research.SealedWorldCover.strong_atomicity_rc_implies_necessary_strong_atomicity
