import Classicism.Results.Records.Box5
import Classicism.Tools.Check
import Classicism.Tools.TypeSystem
import Classicism.Tools.Schema
import Classicism.Certified.Schemas
import Classicism.Results.Lists

/-!
# The theory of 5-necessity, certified

The gate and the type-system check over `Background/Box5.lean` and `Results/Records/Box5.lean`;
each record of the latter derived in the object language and read as an entailment between
schemas (`foo.entails`, and for the record at `σ → t` its list form `foo.listEntails`), and
that one read at every arity.
-/

#classicism_audit Classicism.Background.Box5 Classicism.Results.Records.Box5
#classicism_types_audit Classicism.Background.Box5 Classicism.Results.Records.Box5

#classicism_derive Classicism.Proofs.vicinity_implies_five_implies_two_hat
  Classicism.Proofs.vicinity_and_barcan_t_imply_five_implies_two_hat
  Classicism.Proofs.vicinity_and_atomicity_t_imply_actuality
  Classicism.Proofs.actuality_and_five_implies_nd_necessity_imply_inextensible_comprehension

#classicism_entails Classicism.Proofs.vicinity_implies_five_implies_two_hat
#classicism_entails Classicism.Proofs.vicinity_and_barcan_t_imply_five_implies_two_hat
#classicism_entails Classicism.Proofs.vicinity_and_atomicity_t_imply_actuality
#classicism_entails Classicism.Proofs.actuality_and_five_implies_nd_necessity_imply_inextensible_comprehension

namespace Classicism.Meta
open AxiomSet

/-- `actuality-and-five-implies-nd-necessity-imply-inextensible-comprehension`, at every
arity. -/
theorem actuality_and_five_implies_nd_necessity_imply_inextensible_comprehension :
    P.Actuality.schema ∪ P.FiveImpliesNdNecessity.schema ⟹
      P.InextensibleComprehension.schema :=
  Entails.mono_right (schema_subset_args _)
    Proofs.actuality_and_five_implies_nd_necessity_imply_inextensible_comprehension.listEntails

end Classicism.Meta
