import Classicism.Paper
import Classicism.Background.Rigidity
import Classicism.Background.Lattice
import Classicism.Background.Atoms
import Classicism.Background.Arithmetic

/-!
# Principles of the map's category `lattice`

Atomicity, Boolean Completeness and Countable Boolean Completeness, Actuality, Actual
Profile, Vicinity, Strong Actuality and Strong Atomicity, with their boxed forms: what the
order `≤_τ` at a relational type is like. See `Classicism/Principles.lean` for how a
principle is stated and where its forms go.

The equivalences between forms are proved at a type parameter `τ`, from the laws of the
order there (`Lattice.lean`): `≤_τ` is a partial order with `⊥_τ` at the bottom, `¬_τ` is
an involution, and an atom lies below `x` or below `¬x`.
-/

namespace Classicism.P
open Classicism.Paper

/-! ## Atomicity -/

/-- `atomicity-r` at `τ`: `∀x. x ≤ ¬x ∨ ∃y. Atom(y) ∧ y ≤ x`, every non-bottom entity has
an atom below it. -/
def Atomicity (τ : Type) [Rel τ] : Prop :=
  ∀ x : τ, x ≤ ¬ x ∨ ∃ y : τ, Atom y ∧ y ≤ x
/-- `atomicity-r`, form `dual`, at `τ`: `∀x. (∀y. Atom(y) → y ≤ x) → ¬x ≤ x`, whatever is
above every atom is top. -/
def AtomicityDual (τ : Type) [Rel τ] : Prop :=
  ∀ x : τ, (∀ y : τ, Atom y → y ≤ x) → (¬ x) ≤ x

section
variable {τ : Type} [Rel τ] [Order τ] [Pointwise τ]

/-- `atomicity-r` to its dual form: Atomicity at `¬x`. If `¬x` is bottom, `x` is top;
otherwise an atom below `¬x` would be below `x` too, hence bottom. -/
theorem Atomicity.to_dual : Atomicity τ → AtomicityDual τ := fun at_ x hx =>
  (at_ (¬ x)).elim
    (fun h => le_trans_rel _ _ _ h (neg_neg_le_rel x))
    (fun h => h.elim fun y hy =>
      absurd (le_neg_of_le_both_rel y x (hx y hy.1) hy.2) (not_le_neg_of_atom hy.1))

/-- `atomicity-r` from its dual form: if `x` is not bottom and no atom is below it, every
atom is below `¬x`, which the dual form makes top, and `x` bottom. -/
theorem Atomicity.of_dual : AtomicityDual τ → Atomicity τ := fun d x =>
  (em (x ≤ ¬ x)).elim (fun h => Or.inl h) fun hx =>
    (em (∃ y : τ, Atom y ∧ y ≤ x)).elim (fun h => Or.inr h) fun hn =>
      absurd (le_trans_rel _ _ _ (le_neg_neg_rel x) (d (¬ x) fun y hy =>
        (atom_le_or_le_neg_rel y x hy).elim (fun h => absurd ⟨y, hy, h⟩ hn) (fun h => h))) hx

end

/-- `necessary-atomicity-r` at `τ`: the instance boxed. -/
def NecAtomicity (τ : Type) [Rel τ] : Prop := □ (Atomicity τ)
/-- `necessary-atomicity-r`, form `dual`, at `τ`: the dual of Atomicity, boxed. -/
def NecAtomicityDual (τ : Type) [Rel τ] : Prop := □ (AtomicityDual τ)

section
variable {τ : Type} [Rel τ] [Order τ] [Pointwise τ]

/-- `necessary-atomicity-r` to its dual form. -/
theorem NecAtomicity.to_dual : NecAtomicity τ → NecAtomicityDual τ :=
  modal_K _ _ (nec% (Atomicity.to_dual (τ := τ)))
/-- `necessary-atomicity-r` from its dual form. -/
theorem NecAtomicity.of_dual : NecAtomicityDual τ → NecAtomicity τ :=
  modal_K _ _ (nec% (Atomicity.of_dual (τ := τ)))

end

/-! ## Boolean Completeness -/

/-- `boolean-completeness-r` at `τ`: `∀X. ∃y. GLB_τ(y, X)`, every property of entities
of the type has a greatest lower bound. -/
def BooleanCompleteness (τ : Type) [Rel τ] : Prop := ∀ X : τ → Prop, ∃ y : τ, GLB y X
/-- `boolean-completeness-r`, form `lub`, at `τ`: `∀X. ∃y. LUB_τ(y, X)`, every property of
entities of the type has a least upper bound. -/
def BooleanCompletenessLUB (τ : Type) [Rel τ] : Prop := ∀ X : τ → Prop, ∃ y : τ, LUB y X

section
variable {τ : Type} [Rel τ] [Order τ] [Pointwise τ]

/-- `boolean-completeness-r` to its LUB form: the least upper bound of `X` is the greatest
lower bound of its upper bounds (`lub_of_glb_ubs`). -/
theorem BooleanCompleteness.to_lub : BooleanCompleteness τ → BooleanCompletenessLUB τ :=
  fun bc X => (bc (λ z ↦ UB z X)).elim fun y hy => ⟨y, lub_of_glb_ubs X y hy⟩

/-- `boolean-completeness-r` from its LUB form: the greatest lower bound of `X` is the
least upper bound of its lower bounds (`glb_of_lub_lbs`). -/
theorem BooleanCompleteness.of_lub : BooleanCompletenessLUB τ → BooleanCompleteness τ :=
  fun bc X => (bc (λ z ↦ LB z X)).elim fun y hy => ⟨y, glb_of_lub_lbs X y hy⟩

end

/-- `necessary-boolean-completeness-r` at `τ`: the instance boxed. -/
def NecBooleanCompleteness (τ : Type) [Rel τ] : Prop := □ (BooleanCompleteness τ)
/-- `necessary-boolean-completeness-r`, form `lub`, at `τ`: the LUB form, boxed. -/
def NecBooleanCompletenessLUB (τ : Type) [Rel τ] : Prop := □ (BooleanCompletenessLUB τ)

section
variable {τ : Type} [Rel τ] [Order τ] [Pointwise τ]

/-- `necessary-boolean-completeness-r` to its LUB form. -/
theorem NecBooleanCompleteness.to_lub : NecBooleanCompleteness τ → NecBooleanCompletenessLUB τ :=
  modal_K _ _ (nec% (BooleanCompleteness.to_lub (τ := τ)))
/-- `necessary-boolean-completeness-r` from its LUB form. -/
theorem NecBooleanCompleteness.of_lub : NecBooleanCompletenessLUB τ → NecBooleanCompleteness τ :=
  modal_K _ _ (nec% (BooleanCompleteness.of_lub (τ := τ)))

end

/-- `countable-boolean-completeness-r` at `σ`, `τ`: every property of entities of `τ` that is
countable relative to `σ` has a least upper bound. -/
def CountableBooleanCompleteness (σ τ : Type) [Ty σ] [Rel τ] : Prop :=
  ∀ X : τ → Prop, Ctbl σ X → ∃ y : τ, LUB y X

/-- `necessary-countable-boolean-completeness-r` at `σ`, `τ`: the instance boxed. -/
def NecCountableBooleanCompleteness (σ τ : Type) [Ty σ] [Rel τ] : Prop :=
  □ (CountableBooleanCompleteness σ τ)

/-! ## Actuality, Actual Profile, Vicinity and Strong Actuality -/

/-- `actuality`: `∃p. p ∧ ∀q. q → p ≤ q`, there is a true proposition that entails every
truth — a true atom, an actual world. -/
def Actuality : Prop := ∃ p : Prop, p ∧ ∀ q : Prop, q → p ≤ q
/-- `necessary-actuality`: Actuality boxed. -/
def NecActuality : Prop := □ Actuality

/-- `actuality`, form `actual-profile`, at `σ`, for one argument: `∀x. ∃Y. Yx ∧ ∀Z. Zx → Y ≤ Z`, every
individual of the type has a true property entailing every property it has. The map's
principle is over finite argument tuples; this is the unary instance, and its nullary
instance is Actuality itself. -/
def ActualProfile (σ : Type) [Ty σ] : Prop :=
  ∀ x : σ, ∃ Y : σ → Prop, Y x ∧ ∀ Z : σ → Prop, Z x → Y ≤ Z

/-- `vicinity`: `∃p. p ∧ ∀q. q → p ≤ ◇q`, a true proposition entails the possibility of
each truth. -/
def Vicinity : Prop := ∃ p : Prop, p ∧ ∀ q : Prop, q → p ≤ ◇ q
/-- `necessary-vicinity`: Vicinity boxed. -/
def NecVicinity : Prop := □ Vicinity

/-- `strong-actuality`: `∃p. p ∧ □∀q. p ≤ q ∨ p ≤ ¬q`, there is a true strong atom at
type `t`: a truth that necessarily decides every proposition. -/
def StrongActuality : Prop := ∃ p : Prop, p ∧ □ (∀ q : Prop, p ≤ q ∨ p ≤ ¬ q)
/-- `necessary-strong-actuality`: Strong Actuality boxed. -/
def NecStrongActuality : Prop := □ StrongActuality

/-! ## Strong Atomicity -/

/-- `SAtom_τ(W) := ◇_τ W ∧ □∀Y. W ≤ Y ∨ W ≤ ¬Y`, with `◇_τ W := W ≠ ⊥_τ` (Bacon §8.2). -/
def SAtom {τ : Type} [Rel τ] (W : τ) : Prop :=
  W ≠ ⊥ ∧ □ (∀ Y : τ, W ≤ Y ∨ W ≤ ¬ Y)
/-- `strong-atomicity-r` at `τ`: every possible entity is entailed by a strong atom. -/
def StrongAtomicity (τ : Type) [Rel τ] : Prop :=
  ∀ X : τ, X ≠ ⊥ → ∃ W : τ, SAtom W ∧ W ≤ X
/-- `strong-atomicity-r`, form `dual`, at `τ`: `∀X. (∀W. SAtom(W) → W ≤ X) → ¬X ≤ X`,
whatever is above every strong atom is top. -/
def StrongAtomicityDual (τ : Type) [Rel τ] : Prop :=
  ∀ X : τ, (∀ W : τ, SAtom W → W ≤ X) → (¬ X) ≤ X

section
variable {τ : Type} [Rel τ] [Order τ] [Pointwise τ]

/-- `strong-atomicity-r` to its dual form: if every strong atom is below `X` but `¬X` is
not bottom, a strong atom is below `¬X` and `X`, hence bottom, which it is not. -/
theorem StrongAtomicity.to_dual : StrongAtomicity τ → StrongAtomicityDual τ := fun sl X hX =>
  (em ((¬ X) = ⊥)).elim
    (fun e => by rw [e]; exact bot_le_rel X)
    (fun hne => (sl (¬ X) hne).elim fun W hW =>
      absurd (eq_bot_of_le_neg_rel W (le_neg_of_le_both_rel W X (hX W hW.1) hW.2)) hW.1.1)

/-- `strong-atomicity-r` from its dual form: a strong atom lies below `X` or below `¬X`
(`T` on its boxed clause), so if none lies below `X`, every one lies below `¬X`, which the
dual form makes top, and `X` bottom. -/
theorem StrongAtomicity.of_dual : StrongAtomicityDual τ → StrongAtomicity τ := fun d X hX =>
  (em (∃ W : τ, SAtom W ∧ W ≤ X)).elim (fun h => h) fun hn =>
    absurd (eq_bot_of_le_neg_rel X (le_trans_rel _ _ _ (le_neg_neg_rel X) (d (¬ X) fun W hW =>
      (box_elim hW.2 X).elim (fun h => absurd ⟨W, hW, h⟩ hn) (fun h => h)))) hX

end

/-- `necessary-strong-atomicity-r` at `τ`. -/
def NecStrongAtomicity (τ : Type) [Rel τ] : Prop := □ (StrongAtomicity τ)
/-- `necessary-strong-atomicity-r`, form `dual`, at `τ`: the dual, boxed. -/
def NecStrongAtomicityDual (τ : Type) [Rel τ] : Prop := □ (StrongAtomicityDual τ)

section
variable {τ : Type} [Rel τ] [Order τ] [Pointwise τ]

/-- `necessary-strong-atomicity-r` to its dual form. -/
theorem NecStrongAtomicity.to_dual : NecStrongAtomicity τ → NecStrongAtomicityDual τ :=
  modal_K _ _ (nec% (StrongAtomicity.to_dual (τ := τ)))
/-- `necessary-strong-atomicity-r` from its dual form. -/
theorem NecStrongAtomicity.of_dual : NecStrongAtomicityDual τ → NecStrongAtomicity τ :=
  modal_K _ _ (nec% (StrongAtomicity.of_dual (τ := τ)))

end

/-! ## Self-atoms, Self-Atomicity and the bridge principles

Cian Dorr's self-atoms (25 October 2026): `SelfAtom_τ(X) := ◇_τ X ∧ □(∃x̄. X[x̄] → Atom_τ(X))`,
a possible entity that is necessarily an atom wherever it is instantiated. That `X` is
instantiated, `∃x̄. X[x̄]`, is stated at a type parameter as `¬(X ⊆ ⊥_τ)`, classically the
same; at `t` it is `¬¬p`, so `SelfAtom_t(p)` is `◇p ∧ □(p → Atom_t(p))`. -/

/-- `X` is instantiated: `¬(X ⊆ ⊥_τ)`, that is `∃x̄. X[x̄]`. -/
def Instantiated {τ : Type} [Rel τ] (X : τ) : Prop := ¬ Rel.incl X (Rel.bot τ)
/-- `SelfAtom_τ(X) := ◇_τ X ∧ □(∃x̄. X[x̄] → Atom_τ(X))`. -/
def SelfAtom {τ : Type} [Rel τ] (X : τ) : Prop :=
  X ≠ ⊥ ∧ □ (Instantiated X → Atom X)

/-- `self-atomicity-r` at `τ`: every possible entity is entailed by a self-atom. -/
def SelfAtomicity (τ : Type) [Rel τ] : Prop :=
  ∀ X : τ, X ≠ ⊥ → ∃ Q : τ, SelfAtom Q ∧ Q ≤ X
/-- `necessary-self-atomicity-r` at `τ`: Self-Atomicity, boxed. -/
def NecSelfAtomicity (τ : Type) [Rel τ] : Prop := □ (SelfAtomicity τ)

/-- `atoms-are-self-atoms-r` at `τ`: every atom is a self-atom. -/
def AtomsAreSelfAtoms (τ : Type) [Rel τ] : Prop := ∀ X : τ, Atom X → SelfAtom X
/-- `necessary-atoms-are-self-atoms-r` at `τ`. -/
def NecAtomsAreSelfAtoms (τ : Type) [Rel τ] : Prop := □ (AtomsAreSelfAtoms τ)

/-- `self-atoms-are-atoms-r` at `τ`: every self-atom is an atom. -/
def SelfAtomsAreAtoms (τ : Type) [Rel τ] : Prop := ∀ X : τ, SelfAtom X → Atom X
/-- `necessary-self-atoms-are-atoms-r` at `τ`. -/
def NecSelfAtomsAreAtoms (τ : Type) [Rel τ] : Prop := □ (SelfAtomsAreAtoms τ)

/-- `self-atoms-are-strong-atoms-r` at `τ`: every self-atom is a strong atom. -/
def SelfAtomsAreStrongAtoms (τ : Type) [Rel τ] : Prop := ∀ X : τ, SelfAtom X → SAtom X
/-- `necessary-self-atoms-are-strong-atoms-r` at `τ`. -/
def NecSelfAtomsAreStrongAtoms (τ : Type) [Rel τ] : Prop := □ (SelfAtomsAreStrongAtoms τ)

/-- `atoms-are-strong-atoms-r` at `τ`: every atom is a strong atom. -/
def AtomsAreStrongAtoms (τ : Type) [Rel τ] : Prop := ∀ X : τ, Atom X → SAtom X
/-- `necessary-atoms-are-strong-atoms-r` at `τ`. -/
def NecAtomsAreStrongAtoms (τ : Type) [Rel τ] : Prop := □ (AtomsAreStrongAtoms τ)

end Classicism.P
