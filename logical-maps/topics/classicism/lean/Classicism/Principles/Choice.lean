import Classicism.Paper
import Classicism.Background.Rigidity
import Classicism.Background.Lattice
import Classicism.Background.Atoms

/-!
# Principles of the map's category `choice`

Functional and Relational Choice, Plenitude and Modalized Plenitude, Transversal and
Transversal Choice, with their boxed forms. See `Classicism/Principles.lean` for how a
principle is stated and where its forms go.

`Serial` and `Functional` are the Background's, for a curried `U^{στt}`. `Functional`
includes totality. Relational Choice covers relations with individual outputs, since
such a relation still ends in `t`; Functional Choice cannot, because an operation's
output type must differ from `e`.
-/

namespace Classicism.P

/-- `Serial(U) := ∀x. ∃y. (Ux)y`. -/
def Serial {σ τ : Type} [Ty σ] [Ty τ] (U : σ → τ → Prop) : Prop := ∀ x, ∃ y, U x y
/-- `Functional(U) := ∀x. ∃y. (Ux)y ∧ ∀z. (Ux)z → y = z`. -/
def Functional {σ τ : Type} [Ty σ] [Ty τ] (U : σ → τ → Prop) : Prop :=
  ∀ x, ∃ y, U x y ∧ ∀ z, U x z → y = z

/-! ## Functional and Relational Choice -/

/-- `functional-choice-r` at `σ`, `τ`: every serial relation `U : σ → τ → Prop` admits a
selecting operation, whose output type `τ` is relational. -/
def FunctionalChoice (σ τ : Type) [Ty σ] [Rel τ] : Prop :=
  ∀ U : σ → τ → Prop, Serial U → ∃ X : σ → τ, ∀ x, U x (X x)
/-- `necessary-functional-choice-r` at `σ`, `τ`. -/
def NecFunctionalChoice (σ τ : Type) [Ty σ] [Rel τ] : Prop := □ (FunctionalChoice σ τ)

/-- `relational-choice-r` at `σ`, `τ`: every serial relation has a functional
subrelation. The output type is unrestricted. -/
def RelationalChoice (σ τ : Type) [Ty σ] [Ty τ] : Prop :=
  ∀ U : σ → τ → Prop, Serial U → ∃ S : σ → τ → Prop, Functional S ∧ ∀ x y, S x y → U x y
/-- `necessary-relational-choice-r` at `σ`, `τ`. -/
def NecRelationalChoice (σ τ : Type) [Ty σ] [Ty τ] : Prop := □ (RelationalChoice σ τ)

open Classicism.Paper in
/-- `modalized-relational-choice-r` at `σ`, `τ`: every necessarily serial relation is entailed
by a necessarily functional one. -/
def ModalizedRelationalChoice (σ τ : Type) [Ty σ] [Ty τ] : Prop :=
  ∀ R : σ → τ → Prop, □ (Serial R) → ∃ S : σ → τ → Prop, □ (Functional S) ∧ S ≤ R
/-- `necessary-modalized-relational-choice-r` at `σ`, `τ`: the instance boxed. -/
def NecModalizedRelationalChoice (σ τ : Type) [Ty σ] [Ty τ] : Prop :=
  □ (ModalizedRelationalChoice σ τ)

/-! ## Plenitude -/

/-- `plenitude-r` at `σ`, `τ`: every functional relation `U : σ → τ → Prop` is represented
by an operation, whose output type `τ` is relational (Classicism, §2.4). -/
def Plenitude (σ τ : Type) [Ty σ] [Rel τ] : Prop :=
  ∀ U : σ → τ → Prop, Functional U → ∃ X : σ → τ, ∀ y, U y (X y)
/-- `necessary-plenitude-r` at `σ`, `τ`: the instance boxed. -/
def NecPlenitude (σ τ : Type) [Ty σ] [Rel τ] : Prop := □ (Plenitude σ τ)

/-- `modalized-plenitude-r` at `σ`, `τ`: if necessarily each argument has a value that is
necessarily the relation's unique value for it, some operation necessarily represents the
relation; the output type `τ` is relational. -/
def ModalizedPlenitude (σ τ : Type) [Ty σ] [Rel τ] : Prop :=
  ∀ U : σ → τ → Prop, □ (∀ x, ∃ y, □ (U x y ∧ ∀ z, U x z → y = z)) →
    ∃ X : σ → τ, □ (∀ x y, U x y ↔ y = X x)

/-! ## Transversals -/

/-- `Equiv(R)`: `R` is reflexive, symmetric and transitive, at the evaluation point. -/
def EquivRel {σ : Type} [Ty σ] (R : σ → σ → Prop) : Prop :=
  (∀ x, R x x) ∧ (∀ x y, R x y → R y x) ∧ (∀ x y z, R x y → R y z → R x z)

/-- `transversal-r` at `σ`: a property of properties picks out exactly one property from
each coextension class. -/
def Transversal (σ : Type) [Ty σ] : Prop :=
  ∃ F : (σ → Prop) → Prop, ∀ X : σ → Prop, ∃ Y : σ → Prop,
    F Y ∧ (∀ z, X z ↔ Y z) ∧ ∀ Y' : σ → Prop, (F Y' ∧ ∀ z, X z ↔ Y' z) → Y' = Y
/-- `necessary-transversal-r` at `σ`: the instance boxed. -/
def NecTransversal (σ : Type) [Ty σ] : Prop := □ (Transversal σ)

/-- `transversal-choice-r` at `σ`: every equivalence relation has a transversal, a
property with exactly one instance in each cell. -/
def TransversalChoice (σ : Type) [Ty σ] : Prop :=
  ∀ R : σ → σ → Prop, EquivRel R →
    ∃ F : σ → Prop, ∀ x, ∃ y, R x y ∧ F y ∧ ∀ z, (R x z ∧ F z) → y = z
/-- `necessary-transversal-choice-r` at `σ`: the instance boxed. -/
def NecTransversalChoice (σ : Type) [Ty σ] : Prop := □ (TransversalChoice σ)

open Classicism.Paper in
/-- `intensional-choice-r` at `σ`: if a property is necessarily instantiated, some property
entailing it is necessarily uniquely instantiated. -/
def IntensionalChoice (σ : Type) [Ty σ] : Prop :=
  ∀ F : σ → Prop, □ (∃ x, F x) → ∃ G : σ → Prop, G ≤ F ∧ □ (∃ x, G x ∧ ∀ y, G y → y = x)
/-- `necessary-intensional-choice-r` at `σ`: the instance boxed. -/
def NecIntensionalChoice (σ : Type) [Ty σ] : Prop := □ (IntensionalChoice σ)

/-! ## Well-orders and Zorn's Lemma -/

/-- `WO(R)`: `R` totally orders the whole type (transitive, antisymmetric, total) and every
instantiated property has an `R`-minimal instance (Background, with `X := λx. ⊤`). -/
def WellOrders {σ : Type} [Ty σ] (R : σ → σ → Prop) : Prop :=
  (∀ x y z, R x y → R y z → R x z) ∧ (∀ x y, R x y → R y x → x = y) ∧ (∀ x y, R x y ∨ R y x) ∧
    ∀ Y : σ → Prop, (∃ y, Y y) → ∃ x, Y x ∧ ∀ y, Y y → R y x → y = x

/-- `TotalOrder(R,X)`: `R` totally orders `X`. -/
def TotalOrderOn {σ : Type} [Ty σ] (R : σ → σ → Prop) (X : σ → Prop) : Prop :=
  (∀ x y z, X x → X y → X z → R x y → R y z → R x z) ∧
    (∀ x y, X x → X y → R x y → R y x → x = y) ∧ (∀ x y, X x → X y → R x y ∨ R y x)

/-- `well-ordering-r` at `σ`: some relation well-orders the type. -/
def WellOrdering (σ : Type) [Ty σ] : Prop := ∃ R : σ → σ → Prop, WellOrders R
/-- `necessary-well-ordering-r` at `σ`: the instance boxed. -/
def NecWellOrdering (σ : Type) [Ty σ] : Prop := □ (WellOrdering σ)
/-- `modal-well-ordering-r` at `σ`: some relation is necessarily a well-order. -/
def ModalWellOrdering (σ : Type) [Ty σ] : Prop := ∃ R : σ → σ → Prop, □ (WellOrders R)

/-- `zorn-r` at `σ`, in its preorder form: a preorder in which every chain has an upper bound
has a maximal element. -/
def Zorn (σ : Type) [Ty σ] : Prop :=
  ∀ R : σ → σ → Prop, ((∀ x, R x x) ∧ (∀ x y z, R x y → R y z → R x z)) ∧
      (∀ X : σ → Prop, TotalOrderOn R X → ∃ u, ∀ x, X x → R x u) →
    ∃ m, ∀ y, R m y → R y m

end Classicism.P
