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

Potential Infinity at `e` and `t`, and its necessitation (24 November 2026): `PotInf_σ`, every
number counted at `σ` possibly holds of some property (`Background/Arithmetic.lean`). Its forms
are the Peano conditions `I*_σ` on the numbers (Goodsell's), their possibility `◇I*_σ` (his
`I_σ`), and the Peano conditions on the at-least numbers (Bacon's lower-Peano conditions); the
equivalences are the Background's lemmas `potential-infinity-forms` and `at-least-numbers`.
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
/-- `necessary-axiom-of-infinity-e`: the Axiom of Infinity at `e`, boxed. -/
def NecAxiomOfInfinityE : Prop := □ AxiomOfInfinityE
/-- `necessary-axiom-of-infinity-t`: the Axiom of Infinity at `t`, boxed. -/
def NecAxiomOfInfinityT : Prop := □ AxiomOfInfinityT

/-! ## Potential Infinity -/

/-- `potential-infinity-e`: `∀n ∈ ℕ_e. ◇∃X. nX`, for every number there could be at least that
many individuals. -/
def PotentialInfinityE : Prop := PotInf e
/-- `potential-infinity-t`: `∀n ∈ ℕ_t. ◇∃X. nX`, for every number there could be at least that
many propositions. -/
def PotentialInfinityT : Prop := PotInf Prop
/-- `necessary-potential-infinity-e`: Potential Infinity at `e`, boxed. -/
def NecPotentialInfinityE : Prop := □ PotentialInfinityE
/-- `necessary-potential-infinity-t`: Potential Infinity at `t`, boxed. -/
def NecPotentialInfinityT : Prop := □ PotentialInfinityT

/-- `potential-infinity-e`, form `peano`: `I*_e`, zero is not a successor and successor is
injective on the numbers counted at `e`. -/
def PotentialInfinityEPeano : Prop := IStar e
/-- `potential-infinity-e`, form `possible-peano`: `◇I*_e`, Goodsell's `I_e`. -/
def PotentialInfinityEPossiblePeano : Prop := ◇ (IStar e)
/-- `potential-infinity-e`, form `at-least`: the Peano conditions on the at-least numbers over
individuals. -/
def PotentialInfinityEAtLeast : Prop := LowerPeano e
/-- `potential-infinity-t`, form `peano`: `I*_t`. -/
def PotentialInfinityTPeano : Prop := IStar Prop
/-- `potential-infinity-t`, form `possible-peano`: `◇I*_t`, Goodsell's `I_t`. -/
def PotentialInfinityTPossiblePeano : Prop := ◇ (IStar Prop)
/-- `potential-infinity-t`, form `at-least`: the Peano conditions on the at-least numbers over
propositions. -/
def PotentialInfinityTAtLeast : Prop := LowerPeano Prop
/-- `necessary-potential-infinity-e`, form `peano`: `□I*_e`, Barton and Goodsell's Infinity. -/
def NecPotentialInfinityEPeano : Prop := □ (IStar e)
/-- `necessary-potential-infinity-e`, form `at-least`: Bacon's necessary lower-Peano. -/
def NecPotentialInfinityEAtLeast : Prop := □ (LowerPeano e)
/-- `necessary-potential-infinity-t`, form `peano`: `□I*_t`. -/
def NecPotentialInfinityTPeano : Prop := □ (IStar Prop)
/-- `necessary-potential-infinity-t`, form `at-least`. -/
def NecPotentialInfinityTAtLeast : Prop := □ (LowerPeano Prop)

/-- `potential-infinity-e` to its Peano form (`iStar_of_potentialInfinity`). -/
theorem PotentialInfinityE.to_peano : PotentialInfinityE → PotentialInfinityEPeano :=
  iStar_of_potentialInfinity
/-- `potential-infinity-e` from its Peano form (`potentialInfinity_of_iStar`). -/
theorem PotentialInfinityE.of_peano : PotentialInfinityEPeano → PotentialInfinityE :=
  potentialInfinity_of_iStar
/-- `potential-infinity-e` to its possible Peano form, by `T`. -/
theorem PotentialInfinityE.to_possible_peano :
    PotentialInfinityE → PotentialInfinityEPossiblePeano :=
  fun h => dia_intro _ (iStar_of_potentialInfinity h)
/-- `potential-infinity-e` from its possible Peano form: Potential Infinity is true if
possible. -/
theorem PotentialInfinityE.of_possible_peano :
    PotentialInfinityEPossiblePeano → PotentialInfinityE :=
  fun h => potentialInfinity_of_dia (dia_mono _ _ (nec% (potentialInfinity_of_iStar (σ := e))) h)
/-- `potential-infinity-e` to its at-least form. -/
theorem PotentialInfinityE.to_at_least : PotentialInfinityE → PotentialInfinityEAtLeast :=
  fun h => lowerPeano_of_iStar (iStar_of_potentialInfinity h)
/-- `potential-infinity-e` from its at-least form. -/
theorem PotentialInfinityE.of_at_least : PotentialInfinityEAtLeast → PotentialInfinityE :=
  fun h => potentialInfinity_of_iStar (iStar_of_lowerPeano h)

/-- `potential-infinity-t` to its Peano form. -/
theorem PotentialInfinityT.to_peano : PotentialInfinityT → PotentialInfinityTPeano :=
  iStar_of_potentialInfinity
/-- `potential-infinity-t` from its Peano form. -/
theorem PotentialInfinityT.of_peano : PotentialInfinityTPeano → PotentialInfinityT :=
  potentialInfinity_of_iStar
/-- `potential-infinity-t` to its possible Peano form. -/
theorem PotentialInfinityT.to_possible_peano :
    PotentialInfinityT → PotentialInfinityTPossiblePeano :=
  fun h => dia_intro _ (iStar_of_potentialInfinity h)
/-- `potential-infinity-t` from its possible Peano form. -/
theorem PotentialInfinityT.of_possible_peano :
    PotentialInfinityTPossiblePeano → PotentialInfinityT :=
  fun h => potentialInfinity_of_dia
    (dia_mono _ _ (nec% (potentialInfinity_of_iStar (σ := Prop))) h)
/-- `potential-infinity-t` to its at-least form. -/
theorem PotentialInfinityT.to_at_least : PotentialInfinityT → PotentialInfinityTAtLeast :=
  fun h => lowerPeano_of_iStar (iStar_of_potentialInfinity h)
/-- `potential-infinity-t` from its at-least form. -/
theorem PotentialInfinityT.of_at_least : PotentialInfinityTAtLeast → PotentialInfinityT :=
  fun h => potentialInfinity_of_iStar (iStar_of_lowerPeano h)

/-- `necessary-potential-infinity-e` to its Peano form: the unboxed derivation, necessitated. -/
theorem NecPotentialInfinityE.to_peano : NecPotentialInfinityE → NecPotentialInfinityEPeano :=
  modal_K _ _ (nec% PotentialInfinityE.to_peano)
/-- `necessary-potential-infinity-e` from its Peano form. -/
theorem NecPotentialInfinityE.of_peano : NecPotentialInfinityEPeano → NecPotentialInfinityE :=
  modal_K _ _ (nec% PotentialInfinityE.of_peano)
/-- `necessary-potential-infinity-e` to its at-least form. -/
theorem NecPotentialInfinityE.to_at_least :
    NecPotentialInfinityE → NecPotentialInfinityEAtLeast :=
  modal_K _ _ (nec% PotentialInfinityE.to_at_least)
/-- `necessary-potential-infinity-e` from its at-least form. -/
theorem NecPotentialInfinityE.of_at_least :
    NecPotentialInfinityEAtLeast → NecPotentialInfinityE :=
  modal_K _ _ (nec% PotentialInfinityE.of_at_least)
/-- `necessary-potential-infinity-t` to its Peano form. -/
theorem NecPotentialInfinityT.to_peano : NecPotentialInfinityT → NecPotentialInfinityTPeano :=
  modal_K _ _ (nec% PotentialInfinityT.to_peano)
/-- `necessary-potential-infinity-t` from its Peano form. -/
theorem NecPotentialInfinityT.of_peano : NecPotentialInfinityTPeano → NecPotentialInfinityT :=
  modal_K _ _ (nec% PotentialInfinityT.of_peano)
/-- `necessary-potential-infinity-t` to its at-least form. -/
theorem NecPotentialInfinityT.to_at_least :
    NecPotentialInfinityT → NecPotentialInfinityTAtLeast :=
  modal_K _ _ (nec% PotentialInfinityT.to_at_least)
/-- `necessary-potential-infinity-t` from its at-least form. -/
theorem NecPotentialInfinityT.of_at_least :
    NecPotentialInfinityTAtLeast → NecPotentialInfinityT :=
  modal_K _ _ (nec% PotentialInfinityT.of_at_least)

end Classicism.P
