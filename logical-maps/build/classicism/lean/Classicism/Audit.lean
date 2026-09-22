import Classicism.Check
import Classicism.TypeSystem
import Classicism.Proofs
import Classicism.Identities
import Classicism.Strict
import Classicism.Quantifier

/-!
# Audit

Runs the checker over every record proof and every prelude theorem at build time, so
that `lake build` fails if a proof strays outside Classicism. The `Axiomatic`
namespace is not audited: it holds the alternative axioms and nothing proves from them.
-/

-- Every theorem of the library: the prelude, the eleven identities, the record proofs.
#classicism_audit Classicism.Booleanism Classicism.Identities Classicism.Modal
#classicism_audit Classicism.Order Classicism.Comprehension Classicism.Proofs

-- The type-class instances carry the Logical-Equivalence instances that Intensionality
-- uses. They are definitions, not theorems, so the audit names them.
#classicism_check Classicism.instTyE Classicism.instRelProp Classicism.instRelArrow
#classicism_check Classicism.instOrderProp Classicism.instOrderArrow

-- The negative and positive controls for the checker are in `Classicism/Tests.lean`.

/-! ### The term-level type-system check

Every theorem of the library must also stay inside the relational type system: no
quantification over Lean types that a `Ty`, `Rel` or `Order` instance does not guard, no
type outside `R`, and no constant beyond the logical inductives, the `Eq` plumbing and
the formalisation's own metalanguage. -/

#classicism_types_audit Classicism.Booleanism Classicism.Identities Classicism.Modal
#classicism_types_audit Classicism.Order Classicism.Comprehension Classicism.Proofs
#classicism_types_audit Classicism.Strict Classicism.Tautology Classicism.Quantifier

/-! ### The strict layer

`Classicism/Strict.lean` uses no Logical Equivalence at all: `propext` and `funext` are
banned there, and the eleven closed identities stand in their place. -/

#classicism_strict_audit Classicism.Strict Classicism.Tautology Classicism.Quantifier
