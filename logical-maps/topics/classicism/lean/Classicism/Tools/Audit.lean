import Classicism.Tools.Check
import Classicism.Tools.TypeSystem
import Classicism.Booleanism
import Classicism.Identities
import Classicism.Pointwise
import Classicism.Background.Lattice
import Classicism.Background.Atoms
import Classicism.Background.Arithmetic
import Classicism.Results.Records

/-!
# Audit

Runs the checker over every theorem of the shallow formalization at build time, so that
`lake build` fails if a proof strays outside Classicism. The strict layer has its own
audit, `Classicism/Strict/Audit.lean`.
-/

-- Every theorem of the shallow layer: the prelude, the identities, the classes, the records.
#classicism_audit Classicism.Booleanism Classicism.Identities Classicism.Background.Framework Classicism.Background.Necessity
#classicism_audit Classicism.Background.Order Classicism.Background.Rigidity Classicism.Results.Records.Base Classicism.Results.Records.Coarse Classicism.Results.Records.Extensionality Classicism.Results.Records.Comprehension Classicism.Results.Records.Lattice Classicism.Background.Relations Classicism.Results.Records.Choice Classicism.Results.Records.C5 Classicism.Results.Records.Infinity Classicism.Background.AppendixD Classicism.Background.Varieties Classicism.Results.Records.Necessity
#classicism_audit Classicism.Pointwise Classicism.Background.Atoms Classicism.Background.Lattice
#classicism_audit Classicism.Principles.Base Classicism.Principles.Coarse Classicism.Principles.Extensionality Classicism.Principles.Lattice Classicism.Principles.Instances Classicism.Principles.Comprehension Classicism.Principles.Choice Classicism.Principles.Infinity Classicism.Principles.Schematic
#classicism_audit Classicism.Background.Arithmetic

-- The type-class instances carry the Logical-Equivalence instances that Intensionality
-- uses. They are definitions, not theorems, so the audit names them.
#classicism_check Classicism.instTyE Classicism.instRelProp Classicism.instRelArrow
#classicism_check Classicism.instOrderProp Classicism.instOrderArrow
#classicism_check Classicism.instPointwiseProp Classicism.instPointwiseArrow

-- The negative and positive controls for the checker are in `Classicism/Tools/Tests.lean`.

/-! ### The term-level type-system check

Every theorem of the library must also stay inside the relational type system: no
quantification over Lean types that a `Ty`, `Rel`, `Order` or `Pointwise` instance does
not guard, no type outside `R`, and no constant beyond the logical inductives, the `Eq`
plumbing and the formalisation's own metalanguage. -/

#classicism_types_audit Classicism.Booleanism Classicism.Identities Classicism.Background.Framework Classicism.Background.Necessity
#classicism_types_audit Classicism.Background.Order Classicism.Background.Rigidity Classicism.Results.Records.Base Classicism.Results.Records.Coarse Classicism.Results.Records.Extensionality Classicism.Results.Records.Comprehension Classicism.Results.Records.Lattice Classicism.Background.Relations Classicism.Results.Records.Choice Classicism.Results.Records.C5 Classicism.Results.Records.Infinity Classicism.Background.AppendixD Classicism.Background.Varieties Classicism.Results.Records.Necessity
#classicism_types_audit Classicism.Pointwise Classicism.Background.Atoms Classicism.Background.Lattice
#classicism_types_audit Classicism.Principles.Base Classicism.Principles.Coarse Classicism.Principles.Extensionality Classicism.Principles.Lattice Classicism.Principles.Instances Classicism.Principles.Comprehension Classicism.Principles.Choice Classicism.Principles.Infinity Classicism.Principles.Schematic
#classicism_types_audit Classicism.Background.Arithmetic
