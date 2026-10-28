import Classicism.Strict.Mirror
import Classicism.Results.Records
import Classicism.Identities

/-!
# The library, transformed

This module runs the Appendix A transformer over every theorem of the shallow layer, once.
For each theorem `foo : S` that it reaches it declares `foo.nec : S' = ⊤` and
`foo.strict : S'`, from the eleven identities and no `propext` or `funext`; for each
definition whose reading changes, such as `Persistent`, it declares the strict twin. The
kernel checks every one, and `Classicism/Audit.lean` then holds them to the strict check and
the type check.

This is the one home of those declarations. Anything that wants `modal_K.strict` imports
this module; running `#classicism_transform` elsewhere only reports, since the transformer
does not redeclare what exists.

The report lists any theorem not reached, with the reason. Today every theorem is reached
except ten of the equivalences between forms in `Principles/Lattice.lean` and
`Principles/Instances.lean` (Atomicity and Strong Atomicity and their duals), which use the
classical laws of `Pointwise` (`incl_neg_intro`, `incl_neg_neg`): `SPointwise` mirrors
only the class's first eleven laws.
-/

#classicism_transform_audit Classicism.Booleanism Classicism.Identities Classicism.Background.Framework Classicism.Background.Necessity
#classicism_transform_audit Classicism.Background.Order Classicism.Background.Rigidity Classicism.Results.Records.Base Classicism.Results.Records.Coarse Classicism.Results.Records.Extensionality Classicism.Results.Records.Comprehension Classicism.Results.Records.Lattice Classicism.Background.Relations Classicism.Results.Records.Choice Classicism.Results.Records.C5 Classicism.Results.Records.Infinity Classicism.Background.AppendixD Classicism.Background.Varieties Classicism.Results.Records.Necessity
#classicism_transform_audit Classicism.Principles.Base Classicism.Principles.Coarse Classicism.Principles.Extensionality Classicism.Principles.Lattice Classicism.Principles.Instances Classicism.Principles.Comprehension Classicism.Principles.Choice Classicism.Principles.Infinity Classicism.Principles.Schematic
