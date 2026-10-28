import Classicism.Paper
import Classicism.Background.Rigidity
import Classicism.Background.Lattice
import Classicism.Background.Atoms

/-!
# Principles of the map's category `schematic`

The one principle of this category with a shallow statement, the Distinctness-Preserving
Collapse of §2.6. The others are sentence schemas, defined in the object language
(`Syntax/SentenceSchemas.lean` and its neighbours). See `Classicism/Principles.lean` for
how a principle is stated and where its forms go.
-/

namespace Classicism.P

/-- `□_≠p := ∃q. q ∧ □(◇q → p)`, the distinctness-preserving necessity (Classicism, §2.6). -/
def BoxNe (p : Prop) : Prop := ∃ q : Prop, q ∧ □ (◇ q → p)
/-- `◇_≠p := ¬□_≠¬p`, its dual possibility. -/
def DiaNe (p : Prop) : Prop := ¬ BoxNe (¬ p)

/-- `distinctness-preserving-collapse`: `∀p. p → □_≠p`. -/
def DistinctnessPreservingCollapse : Prop := ∀ p : Prop, p → BoxNe p
/-- `distinctness-preserving-collapse`, form `dual`: `∀p. ◇_≠p → p`. -/
def DistinctnessPreservingCollapseDual : Prop := ∀ p : Prop, DiaNe p → p

/-- `distinctness-preserving-collapse` to its dual form: the collapse at `¬p`, contraposed. -/
theorem DistinctnessPreservingCollapse.to_dual :
    DistinctnessPreservingCollapse → DistinctnessPreservingCollapseDual := fun c p h =>
  (em p).elim (fun hp => hp) fun hn => absurd (c (¬ p) hn) h

/-- `distinctness-preserving-collapse` from its dual form: the dual at `¬p`, contraposed,
with `¬¬p = p`. -/
theorem DistinctnessPreservingCollapse.of_dual :
    DistinctnessPreservingCollapseDual → DistinctnessPreservingCollapse := fun d p hp =>
  (em (BoxNe p)).elim (fun h => h) fun hn =>
    absurd hp (d (¬ p) (by show ¬ BoxNe (¬ ¬ p); rw [not_not_eq]; exact hn))

/-! ## Varieties of necessity

The Background's *Hats, two-hat necessity and 5-necessity*: the hat of an operator, two-hat
necessity (the hat of `□_≠`), S5 operators and 5-necessity, and the principles comparing
them with truth and with `□_≠`. -/

/-- The hat of an operator: `X̂ := λp. ∃q. q ∧ □(¬X¬q → p)`. -/
def Hat (X : Prop → Prop) (p : Prop) : Prop := ∃ q : Prop, q ∧ □ (¬ X (¬ q) → p)
/-- Two-hat necessity `□̂̂`, the hat of `□_≠`. -/
def BoxHH (p : Prop) : Prop := Hat BoxNe p
/-- `S5(X)`: necessarily, `X` is N, K and B. -/
def S5Op (X : Prop → Prop) : Prop :=
  □ (∀ p : Prop, □ p → X p) ∧ □ (∀ p q : Prop, X (p → q) → X p → X q) ∧
    □ (∀ p : Prop, p → X (¬ X (¬ p)))
/-- 5-necessity, `□₅p := ∀X. S5(X) → Xp`: necessity under every S5 operator. -/
def Box5 (p : Prop) : Prop := ∀ X : Prop → Prop, S5Op X → X p

/-- `truth-implies-five-necessity`: `∀p. p → □₅p`. -/
def TruthImpliesFiveNecessity : Prop := ∀ p : Prop, p → Box5 p
/-- `truth-implies-two-hat-necessity`: `∀p. p → □̂̂p`. -/
def TruthImpliesTwoHatNecessity : Prop := ∀ p : Prop, p → BoxHH p
/-- `five-implies-two-hat-necessity`: `∀p. □₅p → □̂̂p`. -/
def FiveImpliesTwoHatNecessity : Prop := ∀ p : Prop, Box5 p → BoxHH p
/-- `five-implies-nd-necessity`: `∀p. □₅p → □_≠p`. -/
def FiveImpliesNdNecessity : Prop := ∀ p : Prop, Box5 p → BoxNe p
/-- `two-hat-implies-nd-necessity`: `∀p. □̂̂p → □_≠p`. -/
def TwoHatImpliesNdNecessity : Prop := ∀ p : Prop, BoxHH p → BoxNe p

/-- `necessary-distinctness-preserving-collapse`: the principle boxed. -/
def NecDistinctnessPreservingCollapse : Prop := □ DistinctnessPreservingCollapse
/-- `necessary-truth-implies-five-necessity`: the principle boxed. -/
def NecTruthImpliesFiveNecessity : Prop := □ TruthImpliesFiveNecessity
/-- `necessary-truth-implies-two-hat-necessity`: the principle boxed. -/
def NecTruthImpliesTwoHatNecessity : Prop := □ TruthImpliesTwoHatNecessity
/-- `necessary-five-implies-two-hat-necessity`: the principle boxed. -/
def NecFiveImpliesTwoHatNecessity : Prop := □ FiveImpliesTwoHatNecessity
/-- `necessary-five-implies-nd-necessity`: the principle boxed. -/
def NecFiveImpliesNdNecessity : Prop := □ FiveImpliesNdNecessity
/-- `necessary-two-hat-implies-nd-necessity`: the principle boxed. -/
def NecTwoHatImpliesNdNecessity : Prop := □ TwoHatImpliesNdNecessity

end Classicism.P
