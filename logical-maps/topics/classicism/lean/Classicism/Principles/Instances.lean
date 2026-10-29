import Classicism.Principles.Coarse
import Classicism.Principles.Lattice

/-!
# Principles of the map's category `instances`

Principles stated at type `t` that the map keeps beside their versions at every type: each
is the instance at `Prop` of a principle of another category, and Atomlessness. See
`Classicism/Principles.lean` for how a principle is stated and where its forms go.

A form of an instance is the instance of the general principle's form, and the equivalence
is the general one at `Prop`; where the map writes the form at `t` in its own words (`□p`
for `¬p ≤ p`), the two are linked by `neg_le_iff_box`.
-/

namespace Classicism.P
open Classicism.Paper

/-! ## The Necessity of Distinctness at `t` -/

/-- `distinctness-necessary-t`: ND at type `t`. -/
def NecessityOfDistinctnessT : Prop := NecessityOfDistinctness Prop
/-- `distinctness-necessary-t`, form `dual`: `∀pq. ◇(p = q) → p = q`. -/
def NecessityOfDistinctnessTDual : Prop := NecessityOfDistinctnessDual Prop

/-- `distinctness-necessary-t` to its dual form. -/
theorem NecessityOfDistinctnessT.to_dual :
    NecessityOfDistinctnessT → NecessityOfDistinctnessTDual := fun h =>
  NecessityOfDistinctness.to_dual h
/-- `distinctness-necessary-t` from its dual form. -/
theorem NecessityOfDistinctnessT.of_dual :
    NecessityOfDistinctnessTDual → NecessityOfDistinctnessT := fun h =>
  NecessityOfDistinctness.of_dual h

/-- `necessary-distinctness-necessary-t`: □ND at type `t`. -/
def NecNecessityOfDistinctnessT : Prop := □ NecessityOfDistinctnessT
/-- `necessary-distinctness-necessary-t`, form `dual`: the dual of ND at `t`, boxed. -/
def NecNecessityOfDistinctnessTDual : Prop := □ NecessityOfDistinctnessTDual

/-- `necessary-distinctness-necessary-t` to its dual form. -/
theorem NecNecessityOfDistinctnessT.to_dual :
    NecNecessityOfDistinctnessT → NecNecessityOfDistinctnessTDual :=
  modal_K _ _ (nec% NecessityOfDistinctnessT.to_dual)
/-- `necessary-distinctness-necessary-t` from its dual form. -/
theorem NecNecessityOfDistinctnessT.of_dual :
    NecNecessityOfDistinctnessTDual → NecNecessityOfDistinctnessT :=
  modal_K _ _ (nec% NecessityOfDistinctnessT.of_dual)

/-! ## BF at `t` -/

/-- `barcan-t`: BF at type `t`. -/
def BarcanT : Prop := Barcan Prop
/-- `barcan-t`, form `dual`: `∀X^{tt}. ◇(∃p. Xp) → ∃p. ◇Xp`. -/
def BarcanTDual : Prop := BarcanDual Prop

/-- `barcan-t` to its dual form. -/
theorem BarcanT.to_dual : BarcanT → BarcanTDual := fun h => Barcan.to_dual h
/-- `barcan-t` from its dual form. -/
theorem BarcanT.of_dual : BarcanTDual → BarcanT := fun h => Barcan.of_dual h

/-- `necessary-barcan-t`: □BF at type `t`. -/
def NecBarcanT : Prop := □ BarcanT
/-- `necessary-barcan-t`, form `dual`: the dual of BF at `t`, boxed. -/
def NecBarcanTDual : Prop := □ BarcanTDual

/-- `necessary-barcan-t` to its dual form. -/
theorem NecBarcanT.to_dual : NecBarcanT → NecBarcanTDual := modal_K _ _ (nec% BarcanT.to_dual)
/-- `necessary-barcan-t` from its dual form. -/
theorem NecBarcanT.of_dual : NecBarcanTDual → NecBarcanT := modal_K _ _ (nec% BarcanT.of_dual)

/-! ## Atomicity at `t`, and Atomlessness -/

/-- `atomicity-t`: Atomicity at type `t`. -/
def AtomicityT : Prop := Atomicity Prop
/-- `atomicity-t`, form `dual`: `∀p. (∀q. Atom(q) → q ≤ p) → □p`, a proposition entailed
by every atom is necessary. -/
def AtomicityTDual : Prop := ∀ p : Prop, (∀ q : Prop, Atom q → q ≤ p) → □ p

/-- `atomicity-t` to its dual form: the dual of Atomicity at `t`, where `¬p ≤ p` is `□p`. -/
theorem AtomicityT.to_dual : AtomicityT → AtomicityTDual := fun h p hp =>
  (neg_le_iff_box p).1 (Atomicity.to_dual h p hp)
/-- `atomicity-t` from its dual form. -/
theorem AtomicityT.of_dual : AtomicityTDual → AtomicityT := fun d =>
  Atomicity.of_dual fun p hp => (neg_le_iff_box p).2 (d p hp)

/-- `atomlessness`: `∀p. ◇p → ∃q. ◇q ∧ q ≤ p ∧ q ≠ p`, every possible proposition has a
possible proposition strictly below it. -/
def Atomlessness : Prop := ∀ p : Prop, ◇ p → ∃ q : Prop, ◇ q ∧ q ≤ p ∧ q ≠ p
/-- `necessary-atomlessness`: Atomlessness, boxed. -/
def NecAtomlessness : Prop := □ Atomlessness

/-! ## Boolean Completeness at `t` -/

/-- `boolean-completeness-t`: Boolean Completeness at type `t`. -/
def BooleanCompletenessT : Prop := BooleanCompleteness Prop
/-- `boolean-completeness-t`, form `lub`: `∀X^{tt}. ∃p. LUB_t(p, X)`. -/
def BooleanCompletenessTLUB : Prop := BooleanCompletenessLUB Prop

/-- `boolean-completeness-t` to its LUB form. -/
theorem BooleanCompletenessT.to_lub : BooleanCompletenessT → BooleanCompletenessTLUB :=
  fun h => BooleanCompleteness.to_lub h
/-- `boolean-completeness-t` from its LUB form. -/
theorem BooleanCompletenessT.of_lub : BooleanCompletenessTLUB → BooleanCompletenessT :=
  fun h => BooleanCompleteness.of_lub h

/-! ## Strong Atomicity at `t` -/

/-- `strong-atomicity-t`. -/
def StrongAtomicityT : Prop := StrongAtomicity Prop
/-- `strong-atomicity-t`, form `dual`: `∀p. (∀w. SAtom_t(w) → w ≤ p) → □p`, a proposition
entailed by every strong atom is necessary. -/
def StrongAtomicityTDual : Prop := ∀ p : Prop, (∀ w : Prop, SAtom w → w ≤ p) → □ p

/-- `strong-atomicity-t` to its dual form: the dual at `t`, where `¬p ≤ p` is `□p`. -/
theorem StrongAtomicityT.to_dual : StrongAtomicityT → StrongAtomicityTDual := fun h p hp =>
  (neg_le_iff_box p).1 (StrongAtomicity.to_dual h p hp)
/-- `strong-atomicity-t` from its dual form. -/
theorem StrongAtomicityT.of_dual : StrongAtomicityTDual → StrongAtomicityT := fun d =>
  StrongAtomicity.of_dual fun p hp => (neg_le_iff_box p).2 (d p hp)

/-- `necessary-strong-atomicity-t`. -/
def NecStrongAtomicityT : Prop := □ StrongAtomicityT
/-- `necessary-strong-atomicity-t`, form `dual`: the dual at `t`, boxed. -/
def NecStrongAtomicityTDual : Prop := □ StrongAtomicityTDual

/-- `necessary-strong-atomicity-t` to its dual form. -/
theorem NecStrongAtomicityT.to_dual : NecStrongAtomicityT → NecStrongAtomicityTDual :=
  modal_K _ _ (nec% StrongAtomicityT.to_dual)
/-- `necessary-strong-atomicity-t` from its dual form. -/
theorem NecStrongAtomicityT.of_dual : NecStrongAtomicityTDual → NecStrongAtomicityT :=
  modal_K _ _ (nec% StrongAtomicityT.of_dual)

/-- `necessary-atomicity-t`: Atomicity at `t`, boxed. -/
def NecAtomicityT : Prop := □ AtomicityT
/-- `necessary-boolean-completeness-t`: Boolean Completeness at `t`, boxed. -/
def NecBooleanCompletenessT : Prop := □ BooleanCompletenessT

/-! ## Self-Atomicity and the bridge principles at `t` -/

/-- `self-atomicity-t`. -/
def SelfAtomicityT : Prop := SelfAtomicity Prop
/-- `necessary-self-atomicity-t`. -/
def NecSelfAtomicityT : Prop := □ SelfAtomicityT
/-- `atoms-are-self-atoms-t`. -/
def AtomsAreSelfAtomsT : Prop := AtomsAreSelfAtoms Prop
/-- `necessary-atoms-are-self-atoms-t`. -/
def NecAtomsAreSelfAtomsT : Prop := □ AtomsAreSelfAtomsT
/-- `self-atoms-are-atoms-t`. -/
def SelfAtomsAreAtomsT : Prop := SelfAtomsAreAtoms Prop
/-- `necessary-self-atoms-are-atoms-t`. -/
def NecSelfAtomsAreAtomsT : Prop := □ SelfAtomsAreAtomsT
/-- `self-atoms-are-strong-atoms-t`. -/
def SelfAtomsAreStrongAtomsT : Prop := SelfAtomsAreStrongAtoms Prop
/-- `necessary-self-atoms-are-strong-atoms-t`. -/
def NecSelfAtomsAreStrongAtomsT : Prop := □ SelfAtomsAreStrongAtomsT
/-- `atoms-are-strong-atoms-t`. -/
def AtomsAreStrongAtomsT : Prop := AtomsAreStrongAtoms Prop
/-- `necessary-atoms-are-strong-atoms-t`. -/
def NecAtomsAreStrongAtomsT : Prop := □ AtomsAreStrongAtomsT

end Classicism.P
