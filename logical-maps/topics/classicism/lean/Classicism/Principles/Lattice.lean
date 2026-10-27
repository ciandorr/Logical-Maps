import Classicism.Paper
import Classicism.Background.Rigidity
import Classicism.Background.Lattice
import Classicism.Background.Worlds
import Classicism.Background.Arithmetic

/-!
# Principles of the map's category `lattice`

Atomicity, Boolean Completeness and Countable Boolean Completeness, Actuality, Actual
Profile, Vicinity, Strong Actuality and the Strong Leibniz Biconditionals, with their boxed forms: what the
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

/-- `actual-profile-r` at `σ`, for one argument: `∀x. ∃Y. Yx ∧ ∀Z. Zx → Y ≤ Z`, every
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

/-- `strong-actuality`: `∃p. p ∧ □∀q. p ≤ q ∨ p ≤ ¬q`, there is a true strong world at
type `t`: a truth that necessarily decides every proposition. -/
def StrongActuality : Prop := ∃ p : Prop, p ∧ □ (∀ q : Prop, p ≤ q ∨ p ≤ ¬ q)
/-- `necessary-strong-actuality`: Strong Actuality boxed. -/
def NecStrongActuality : Prop := □ StrongActuality

/-! ## The Strong Leibniz Biconditionals -/

/-- `SWorld_τ(W) := ◇_τ W ∧ □∀Y. W ≤ Y ∨ W ≤ ¬Y`, with `◇_τ W := W ≠ ⊥_τ` (Bacon §8.2). -/
def SWorld {τ : Type} [Rel τ] (W : τ) : Prop :=
  W ≠ ⊥ ∧ □ (∀ Y : τ, W ≤ Y ∨ W ≤ ¬ Y)
/-- `strong-leibniz-r` at `τ`: every possible entity is entailed by a strong world. -/
def StrongLeibniz (τ : Type) [Rel τ] : Prop :=
  ∀ X : τ, X ≠ ⊥ → ∃ W : τ, SWorld W ∧ W ≤ X
/-- `strong-leibniz-r`, form `dual`, at `τ`: `∀X. (∀W. SWorld(W) → W ≤ X) → ¬X ≤ X`,
whatever is above every strong world is top. -/
def StrongLeibnizDual (τ : Type) [Rel τ] : Prop :=
  ∀ X : τ, (∀ W : τ, SWorld W → W ≤ X) → (¬ X) ≤ X

section
variable {τ : Type} [Rel τ] [Order τ] [Pointwise τ]

/-- `strong-leibniz-r` to its dual form: if every strong world is below `X` but `¬X` is
not bottom, a strong world is below `¬X` and `X`, hence bottom, which it is not. -/
theorem StrongLeibniz.to_dual : StrongLeibniz τ → StrongLeibnizDual τ := fun sl X hX =>
  (em ((¬ X) = ⊥)).elim
    (fun e => by rw [e]; exact bot_le_rel X)
    (fun hne => (sl (¬ X) hne).elim fun W hW =>
      absurd (eq_bot_of_le_neg_rel W (le_neg_of_le_both_rel W X (hX W hW.1) hW.2)) hW.1.1)

/-- `strong-leibniz-r` from its dual form: a strong world lies below `X` or below `¬X`
(`T` on its boxed clause), so if none lies below `X`, every one lies below `¬X`, which the
dual form makes top, and `X` bottom. -/
theorem StrongLeibniz.of_dual : StrongLeibnizDual τ → StrongLeibniz τ := fun d X hX =>
  (em (∃ W : τ, SWorld W ∧ W ≤ X)).elim (fun h => h) fun hn =>
    absurd (eq_bot_of_le_neg_rel X (le_trans_rel _ _ _ (le_neg_neg_rel X) (d (¬ X) fun W hW =>
      (box_elim hW.2 X).elim (fun h => absurd ⟨W, hW, h⟩ hn) (fun h => h)))) hX

end

/-- `necessary-strong-leibniz-r` at `τ`. -/
def NecStrongLeibniz (τ : Type) [Rel τ] : Prop := □ (StrongLeibniz τ)
/-- `necessary-strong-leibniz-r`, form `dual`, at `τ`: the dual, boxed. -/
def NecStrongLeibnizDual (τ : Type) [Rel τ] : Prop := □ (StrongLeibnizDual τ)

section
variable {τ : Type} [Rel τ] [Order τ] [Pointwise τ]

/-- `necessary-strong-leibniz-r` to its dual form. -/
theorem NecStrongLeibniz.to_dual : NecStrongLeibniz τ → NecStrongLeibnizDual τ :=
  modal_K _ _ (nec% (StrongLeibniz.to_dual (τ := τ)))
/-- `necessary-strong-leibniz-r` from its dual form. -/
theorem NecStrongLeibniz.of_dual : NecStrongLeibnizDual τ → NecStrongLeibniz τ :=
  modal_K _ _ (nec% (StrongLeibniz.of_dual (τ := τ)))

end

end Classicism.P
