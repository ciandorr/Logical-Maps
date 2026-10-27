import Classicism.Tools.Quote
import Classicism.Results.Records

/-!
# The record theorems, quoted

Every record theorem of `Classicism/Results/Records.lean`, quoted into the object language and
checked by reflection: for each `foo : p` that the quoter reaches, `foo.quoted` is the
sentence and `foo.reflect` the kernel-checked proof that reading it back gives `p`, by
`rfl` where the reading is definitional and by rewriting where a relational operation
sits at a type parameter or the shallow connectives are read (`Meta/Relational.lean`).
This is the one home of those declarations.
-/

#classicism_quote_audit Classicism.Results.Records.Base Classicism.Results.Records.Coarse Classicism.Results.Records.Extensionality Classicism.Results.Records.Comprehension Classicism.Results.Records.Lattice Classicism.Results.Records.Choice Classicism.Results.Records.C5 Classicism.Results.Records.Infinity Classicism.Background.AppendixD Classicism.Results.Records.Necessity
#classicism_quote_audit Classicism.Principles.Base Classicism.Principles.Coarse Classicism.Principles.Extensionality Classicism.Principles.Lattice Classicism.Principles.Instances Classicism.Principles.Comprehension Classicism.Principles.Choice Classicism.Principles.Infinity Classicism.Principles.Schematic
