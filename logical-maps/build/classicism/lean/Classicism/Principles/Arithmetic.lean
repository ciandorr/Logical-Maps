import Classicism.Paper
import Classicism.Background.Rigidity
import Classicism.Background.Arithmetic

/-!
# Principles of the map's category `mathematical-contingency`

Arithmetic Necessitism, at a type `σ`, with the finite cardinalities of the Background
(`Background/Arithmetic.lean`) as the numbers `ℕ_σ`; its antecedent's `I*_σ` is `Classicism.IStar`,
defined there since 24 November 2026, with Potential Infinity, of which it is a form. The Necessity of Arithmetic is a schema
over arithmetical sentences, in `Certified/Arithmetic.lean`. See `Classicism/Principles.lean`
for how a principle is stated and where its forms go.
-/

namespace Classicism.P
open Classicism.Paper

/-- `arithmetic-necessitism` at `σ`: `□I*_σ → Rigid(ℕ_σ) ∧ ∀m n ∈ ℕ_σ. m ≠ n → □ m ≠ n`,
given that necessarily zero is not a successor and successor is injective on numbers, the
numbers at `σ` form a rigid property with necessarily distinct instances. -/
def ArithmeticNecessitism (σ : Type) [Ty σ] : Prop :=
  □ (IStar σ) →
    Rigid (FiniteCardinality (σ := σ)) ∧
      ∀ m n : (σ → Prop) → Prop, FiniteCardinality m → FiniteCardinality n → m ≠ n → □ (m ≠ n)

end Classicism.P
