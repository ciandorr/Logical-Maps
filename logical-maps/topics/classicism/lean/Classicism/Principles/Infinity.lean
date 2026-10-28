import Classicism.Paper
import Classicism.Background.Rigidity
import Classicism.Background.Lattice
import Classicism.Background.Atoms
import Classicism.Background.Arithmetic

/-!
# Principles of the map's category `infinity`

The Axioms of Infinity and Possible Infinity at `e` and `t`, with the finite cardinalities
of the Background (`Cardinality.lean`). The Infinity schemas are sentence schemas, in
`Syntax/Infinity.lean`. See `Classicism/Principles.lean` for how a principle is stated and
where its forms go.
-/

namespace Classicism.P

/-- The Axiom of Infinity at `σ`: `¬∃Z. FiniteCardinality_σ(Z) ∧ Z(λu. ⊤)`, no finite
cardinality holds of the universal property. -/
def AxiomOfInfinity (σ : Type) [Ty σ] : Prop :=
  ¬ ∃ Z : (σ → Prop) → Prop, FiniteCardinality Z ∧ Z (λ _ ↦ True)
/-- `axiom-of-infinity-e`: there are not finitely many individuals. -/
def AxiomOfInfinityE : Prop := AxiomOfInfinity e
/-- `axiom-of-infinity-t`: there are not finitely many propositions. -/
def AxiomOfInfinityT : Prop := AxiomOfInfinity Prop
/-- `possible-infinity-e`: the Axiom of Infinity at `e`, under a diamond. -/
def PossibleInfinityE : Prop := ◇ AxiomOfInfinityE
/-- `possible-infinity-t`: the Axiom of Infinity at `t`, under a diamond. -/
def PossibleInfinityT : Prop := ◇ AxiomOfInfinityT

end Classicism.P
