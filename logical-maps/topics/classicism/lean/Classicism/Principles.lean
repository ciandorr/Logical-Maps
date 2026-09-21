import Classicism.Comprehension

/-!
# Principle statements

One Lean `Prop` per principle of the map that this first step covers, named as the
map's `lean_def` convention expects (`Classicism.P.<Name>`). The map's metalinguistic
type quantifier `∀ᵀʸ σ` is `∀ {σ : Type} [Ty σ]`, and `∀ᵀʸ τ` over relational types is
`∀ {τ : Type} [Rel τ]`. A boxed principle (`□φ` for each closed instance `φ`) boxes the
whole object-variable closure, after the type quantifier, as the Background says.
Definitions are from `topics/classicism/background.md`; each statement is the record's
`formal` field transcribed.
-/

namespace Classicism.P

/-- `modal-k`: `∀pq. □(p→q) → (□p → □q)`. -/
def ModalK : Prop := ∀ p q : Prop, □ (p → q) → □ p → □ q
/-- `modal-t`: `∀p. □p → p`. -/
def ModalT : Prop := ∀ p : Prop, □ p → p
/-- `modal-four`: `∀p. □p → □□p`. -/
def ModalFour : Prop := ∀ p : Prop, □ p → □ □ p
/-- `modal-five`: `∀p. ◇p → □◇p`. -/
def ModalFive : Prop := ∀ p : Prop, ◇ p → □ ◇ p
/-- `modal-b`: `∀p. p → □◇p`. -/
def ModalB : Prop := ∀ p : Prop, p → □ ◇ p
/-- `modalized-fregean`: `∀pq. □(p↔q) → p = q`. -/
def ModalizedFregean : Prop := ∀ p q : Prop, □ (p ↔ q) → p = q
/-- `fregean-axiom`: `∀pq. (p↔q) → p = q`. -/
def FregeanAxiom : Prop := ∀ p q : Prop, (p ↔ q) → p = q
/-- `intensionality-r`: at every relational type, `□(∀z̄. X[z̄] ↔ Y[z̄]) → X = Y`. -/
def Intensionality : Prop := ∀ {τ : Type} [Rel τ] (X Y : τ), □ (coext X Y) → X = Y
/-- `extensionality-r`: at every relational type, `(∀z̄. X[z̄] ↔ Y[z̄]) → X = Y`. -/
def Extensionality : Prop := ∀ {τ : Type} [Rel τ] (X Y : τ), coext X Y → X = Y
/-- `functionality-r`: `(∀z. Xz = Yz) → X = Y` for `X Y : σ → τ`, `τ` relational. -/
def Functionality : Prop := ∀ {σ τ : Type} [Ty σ] [Rel τ] (X Y : σ → τ), (∀ z, X z = Y z) → X = Y
/-- `modalized-functionality-r`: `□(∀z. Xz = Yz) → X = Y`, `τ` relational. -/
def ModalizedFunctionality : Prop :=
  ∀ {σ τ : Type} [Ty σ] [Rel τ] (X Y : σ → τ), □ (∀ z, X z = Y z) → X = Y
/-- `identity-necessary-r` (NI): `∀xy. x = y → □(x = y)` at every type. -/
def NecessityOfIdentity : Prop := ∀ {σ : Type} [Ty σ] (x y : σ), x = y → □ (x = y)
/-- `distinctness-necessary-r` (ND): `∀xy. x ≠ y → □(x ≠ y)` at every type. -/
def NecessityOfDistinctness : Prop := ∀ {σ : Type} [Ty σ] (x y : σ), x ≠ y → □ (x ≠ y)
/-- `distinctness-necessary-t` (ND at type t). -/
def NecessityOfDistinctnessT : Prop := ∀ p q : Prop, p ≠ q → □ (p ≠ q)
/-- `necessary-distinctness-necessary-t` (□ND at type t): the closed instance is necessary. -/
def NecNecessityOfDistinctnessT : Prop := □ NecessityOfDistinctnessT
/-- `barcan-r` (BF): `∀X. (∀x. □Xx) → □(∀x. Xx)` at every type. -/
def Barcan : Prop := ∀ {σ : Type} [Ty σ] (X : σ → Prop), (∀ x, □ (X x)) → □ (∀ x, X x)
/-- `barcan-t` (BF at type t). -/
def BarcanT : Prop := ∀ X : Prop → Prop, (∀ p, □ (X p)) → □ (∀ p, X p)
/-- `necessary-barcan-t` (□BF at type t). -/
def NecBarcanT : Prop := □ BarcanT
/-- `converse-barcan-r` (CBF): `∀X. □(∀x. Xx) → ∀x. □Xx` at every type. -/
def ConverseBarcan : Prop := ∀ {σ : Type} [Ty σ] (X : σ → Prop), □ (∀ x, X x) → ∀ x, □ (X x)
/-- `existence-r`: `∃x^σ. x = x` at every type of `R`. The type system has exactly two
shapes, `e` and the relational types, so the schema is the conjunction of those two
cases. Writing it this way, rather than as `∀ {σ} [Ty σ]`, is what makes the proof carry
its real cost: the second conjunct is a theorem of `C⁻` and the first is the axiom. -/
def Existence : Prop := (∃ x : e, x = x) ∧ ∀ {τ : Type} [Rel τ], ∃ x : τ, x = x

/-- The half of `existence-r` that `C⁻` proves: Existence at every relational type. Not
a separate record on the map; it is here to mark where the axiom is and is not needed. -/
def ExistenceRel : Prop := ∀ {τ : Type} [Rel τ], ∃ x : τ, x = x
/-- `tractarianism-r`: `∀pX. (∀x. p ≤ Xx) → p ≤ ∀x. Xx` at every type. -/
def Tractarianism : Prop :=
  ∀ {σ : Type} [Ty σ] (p : Prop) (X : σ → Prop), (∀ x, p ≤ X x) → p ≤ (∀ x, X x)


/-! ### Comprehension

Each says that every relation, including a proposition, is coextensive with one of the
stated kind. The map's `∀ᵀʸ σ̄` over argument tuples is the quantifier over relational
types, since a relational type *is* a tuple type ending in `t`. -/

/-- `rigid-comprehension-r`. -/
def RigidComprehension : Prop :=
  ∀ {τ : Type} [Rel τ] (X : τ), ∃ Y : τ, Rigid Y ∧ coext X Y
/-- `weak-rigid-comprehension-r`. -/
def WeakRigidComprehension : Prop :=
  ∀ {τ : Type} [Rel τ] (X : τ), ∃ Y : τ, WeaklyRigid Y ∧ coext X Y
/-- `very-weak-rigid-comprehension-r`. -/
def VeryWeakRigidComprehension : Prop :=
  ∀ {τ : Type} [Rel τ] (X : τ), ∃ Y : τ, VeryWeaklyRigid Y ∧ coext X Y
/-- `persistent-comprehension-r`. -/
def PersistentComprehension : Prop :=
  ∀ {τ : Type} [Rel τ] (X : τ), ∃ Y : τ, Persistent Y ∧ coext X Y
/-- `inextensible-comprehension-r`. -/
def InextensibleComprehension : Prop :=
  ∀ {τ : Type} [Rel τ] (X : τ), ∃ Y : τ, Inextensible Y ∧ coext X Y
/-- `gallin-extensional-comprehension-r`: every relation is coextensive with one that is
persistent and has a persistent pointwise negation. Gallin's rigidity convention. -/
def GallinExtensionalComprehension : Prop :=
  ∀ {τ : Type} [Rel τ] (X : τ),
    ∃ Y : τ, Persistent Y ∧ Persistent (Rel.neg Y) ∧ coext X Y

/-! ### Choice

`Serial` and `Functional` are the Background's, for a curried `U^{στt}`. `Functional`
includes totality. Relational Choice covers relations with individual outputs, since
such a relation still ends in `t`; Functional Choice cannot, because an operation's
output type must differ from `e`. -/

/-- `Serial(U) := ∀x. ∃y. (Ux)y`. -/
def Serial {σ τ : Type} [Ty σ] [Ty τ] (U : σ → τ → Prop) : Prop := ∀ x, ∃ y, U x y
/-- `Functional(U) := ∀x. ∃y. (Ux)y ∧ ∀z. (Ux)z → y = z`. -/
def Functional {σ τ : Type} [Ty σ] [Ty τ] (U : σ → τ → Prop) : Prop :=
  ∀ x, ∃ y, U x y ∧ ∀ z, U x z → y = z

/-- `functional-choice-r`: every serial relation admits a selecting operation, whose
output type is relational. -/
def FunctionalChoice : Prop :=
  ∀ {σ τ : Type} [Ty σ] [Rel τ] (U : σ → τ → Prop), Serial U → ∃ X : σ → τ, ∀ x, U x (X x)

/-- `relational-choice-r`: every serial relation has a functional subrelation. The output
type is unrestricted. -/
def RelationalChoice : Prop :=
  ∀ {σ τ : Type} [Ty σ] [Ty τ] (U : σ → τ → Prop),
    Serial U → ∃ S : σ → τ → Prop, Functional S ∧ ∀ x y, S x y → U x y

end Classicism.P
