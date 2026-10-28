import Classicism.Paper
import Classicism.Background.Rigidity
import Classicism.Background.Lattice
import Classicism.Background.Atoms

/-!
# Principles of the map's category `extensionality`

The Fregean Axiom, Extensionality and Functionality, with their boxed forms. See
`Classicism/Principles.lean` for how a principle is stated and where its forms go.
-/

namespace Classicism.P

/-- `fregean-axiom`: `∀pq. (p↔q) → p = q`. -/
def FregeanAxiom : Prop := ∀ p q : Prop, (p ↔ q) → p = q
/-- `necessary-fregean-axiom`. -/
def NecFregeanAxiom : Prop := □ FregeanAxiom

/-- `extensionality-r` at `τ`: `(∀z̄. X[z̄] ↔ Y[z̄]) → X = Y`. -/
def Extensionality (τ : Type) [Rel τ] : Prop := ∀ X Y : τ, coext X Y → X = Y
/-- `necessary-extensionality-r` at `τ`. -/
def NecExtensionality (τ : Type) [Rel τ] : Prop := □ (Extensionality τ)

/-- `functionality-r` at `σ → τ`: `(∀z. Xz = Yz) → X = Y`, `τ` relational. -/
def Functionality (σ τ : Type) [Ty σ] [Rel τ] : Prop :=
  ∀ X Y : σ → τ, (∀ z, X z = Y z) → X = Y
/-- `necessary-functionality-r` at `σ`, `τ`. -/
def NecFunctionality (σ τ : Type) [Ty σ] [Rel τ] : Prop := □ (Functionality σ τ)

end Classicism.P
