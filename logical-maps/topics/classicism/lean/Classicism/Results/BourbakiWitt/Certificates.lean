import Classicism.Results.BourbakiWitt.Derive.NecessaryTransversal
import Classicism.Results.BourbakiWitt.Derive.TransversalChoice
import Classicism.Results.BourbakiWitt.Derive.Actuality
import Classicism.Tools.Check
import Classicism.Tools.TypeSystem
import Classicism.Tools.Schema
import Classicism.Certified.Schemas

/-!
# The results resting on the Bourbaki–Witt lemma, certified

The gate and the type-system check over the lemma's module and the results' modules; each
result derived in the object language and read as an entailment between schemas
(`foo.entails`).
-/

#classicism_audit Classicism.Background.BourbakiWitt Classicism.Results.BourbakiWitt.NecessaryTransversal
  Classicism.Results.BourbakiWitt.Settled Classicism.Results.BourbakiWitt.TransversalChoice
  Classicism.Results.BourbakiWitt.ActualityParts Classicism.Results.BourbakiWitt.ActualityChain
  Classicism.Results.BourbakiWitt.ActualityCode Classicism.Results.BourbakiWitt.Actuality
#classicism_types_audit Classicism.Background.BourbakiWitt Classicism.Results.BourbakiWitt.NecessaryTransversal
  Classicism.Results.BourbakiWitt.Settled Classicism.Results.BourbakiWitt.TransversalChoice
  Classicism.Results.BourbakiWitt.ActualityParts Classicism.Results.BourbakiWitt.ActualityChain
  Classicism.Results.BourbakiWitt.ActualityCode Classicism.Results.BourbakiWitt.Actuality

#classicism_entails Classicism.Proofs.BWTransversal.boolean_completeness_and_modalized_relational_choice_imply_necessary_transversal
#classicism_entails Classicism.Proofs.BWChoice.vicinity_and_relational_choice_imply_transversal_choice
#classicism_entails Classicism.Proofs.BWActuality.vicinity_boolean_completeness_t_and_relational_choice_imply_actuality

#check @Classicism.Proofs.BWTransversal.boolean_completeness_and_modalized_relational_choice_imply_necessary_transversal.entails
#check @Classicism.Proofs.BWChoice.vicinity_and_relational_choice_imply_transversal_choice.entails
#check @Classicism.Proofs.BWActuality.vicinity_boolean_completeness_t_and_relational_choice_imply_actuality.entails
