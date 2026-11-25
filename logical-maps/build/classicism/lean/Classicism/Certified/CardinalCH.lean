import Classicism.Certified.Signatures
import Classicism.Tools.Check
import Classicism.Tools.TypeSystem
import Classicism.Tools.Translate
import Classicism.Tools.Schema

/-!
# Cardinal CH for the at-least numbers

The statements of the map's three cardinal CH principles, `possible-cardinal-ch`,
`possible-failure-of-cardinal-ch` and `contingency-of-cardinal-ch` (Bacon's formulation, for
the revised Mathematical Possibilism): with `N := LowerNat_e`, the at-least numbers over
individuals, and `S` the rigid subproperties of `N`, cardinal CH `C_N` says that each
subcollection of `S` injects into `N` or is in bijection with `S`, injections and bijections
being relations.

The vocabulary is transcribed from Bacon's Lean package for the three derivations (pull
request #28 of the map's repository, `verification/finite-power-ch/`), where it is
`Classicism/Results/MathematicalContingency/Definitions.lean` (`Maps`, `Injects`, `Surjects`,
`Bijects`, `Embeds`, `Equinumerous`, `RigidPower`) and `CardinalCH.lean` (`CardinalCH`), with
the same names in the same namespace. That package's `LowerNat` is the Background's
(`Background/Arithmetic.lean`), and its three theorems conclude `◇C_N`, `◇¬C_N` and their
conjunction for the `C_N` defined here. Those three derivations are not checked by this
library. The records proved here are the three that say Contingency of
Cardinal CH is the conjunction of the other two principles.

The three principles are closed pure sentences. Their schemas are declared here and not in
`Certified/Schemas.lean`, as Necessity of Arithmetic's is in `Certified/Arithmetic.lean`; the
generated `Statements.lean` imports this module.

The vocabulary is by OpenAI Codex, prompted by Andrew Bacon (25 and 26 October 2026). Its
transcription here, the schemas and the three records are by Claude Fable 5.2 (Anthropic),
prompted by Zachary Goodsell, 25 November 2026.
-/

namespace Classicism.MathematicalContingency

/-- `F` is a function from `A` into `B`: a relation between them, total on `A` and functional. -/
def Maps {σ τ : Type} [Ty σ] [Ty τ] (F : σ → τ → Prop)
    (A : σ → Prop) (B : τ → Prop) : Prop :=
  (∀ x y, F x y → A x ∧ B y) ∧
  (∀ x, A x → ∃ y, B y ∧ F x y) ∧
  (∀ x y z, F x y → F x z → y = z)

/-- `F` injects `A` into `B`. -/
def Injects {σ τ : Type} [Ty σ] [Ty τ] (F : σ → τ → Prop)
    (A : σ → Prop) (B : τ → Prop) : Prop :=
  Maps F A B ∧ ∀ x z y, F x y → F z y → x = z

/-- `F` maps `A` onto `B`. -/
def Surjects {σ τ : Type} [Ty σ] [Ty τ] (F : σ → τ → Prop)
    (A : σ → Prop) (B : τ → Prop) : Prop :=
  Maps F A B ∧ ∀ y, B y → ∃ x, A x ∧ F x y

/-- `F` is a bijection between `A` and `B`. -/
def Bijects {σ τ : Type} [Ty σ] [Ty τ] (F : σ → τ → Prop)
    (A : σ → Prop) (B : τ → Prop) : Prop := Injects F A B ∧ Surjects F A B

/-- `A` injects into `B`, by some relation. -/
def Embeds {σ τ : Type} [Ty σ] [Ty τ] (A : σ → Prop) (B : τ → Prop) : Prop :=
  ∃ F, Injects F A B

/-- `A` and `B` are in bijection, by some relation. -/
def Equinumerous {σ τ : Type} [Ty σ] [Ty τ] (A : σ → Prop) (B : τ → Prop) : Prop :=
  ∃ F, Bijects F A B

/-- `X` is a rigid subproperty of `A`. -/
def RigidPower {σ : Type} [Ty σ] (A X : σ → Prop) : Prop :=
  Rigid X ∧ ∀ x, X x → A x

/-- Cardinal CH for `N` and `S`: each subcollection of `S` injects into `N` or is in bijection
with `S`. -/
def CardinalCH {α β : Type} [Ty α] [Ty β] (N : α → Prop) (S : β → Prop) : Prop :=
  ∀ X : β → Prop, (∀ x, X x → S x) → Embeds X N ∨ Equinumerous X S

end Classicism.MathematicalContingency

namespace Classicism.P

/-- `C_N`: cardinal CH for the at-least numbers over individuals and their rigid subproperties. -/
def CardinalCHLowerNat : Prop :=
  MathematicalContingency.CardinalCH (@LowerNat e _)
    (MathematicalContingency.RigidPower (@LowerNat e _))

/-- `possible-cardinal-ch`: `◇C_N`. -/
def PossibleCardinalCH : Prop := ◇ CardinalCHLowerNat

/-- `possible-failure-of-cardinal-ch`: `◇¬C_N`. -/
def PossibleFailureOfCardinalCH : Prop := ◇ (¬ CardinalCHLowerNat)

/-- `contingency-of-cardinal-ch`: `◇C_N ∧ ◇¬C_N`. -/
def ContingencyOfCardinalCH : Prop := ◇ CardinalCHLowerNat ∧ ◇ (¬ CardinalCHLowerNat)

end Classicism.P

-- The four closed statements stay within the relational type system; the vocabulary above
-- enters them only at the types fixed here.
#classicism_types Classicism.P.CardinalCHLowerNat Classicism.P.PossibleCardinalCH
  Classicism.P.PossibleFailureOfCardinalCH Classicism.P.ContingencyOfCardinalCH

#classicism_schema Classicism.P.PossibleCardinalCH Classicism.P.PossibleFailureOfCardinalCH
  Classicism.P.ContingencyOfCardinalCH

namespace Classicism.P

/-- The schema at every signature: its sentences, read in the signature's language. -/
@[reducible] def PossibleCardinalCH.schemaIn {Sig : Classicism.Meta.Signature} :
    Classicism.Meta.AxiomSet Sig := Classicism.Meta.AxiomSet.ofPure PossibleCardinalCH.schema

/-- The schema at every signature: its sentences, read in the signature's language. -/
@[reducible] def PossibleFailureOfCardinalCH.schemaIn {Sig : Classicism.Meta.Signature} :
    Classicism.Meta.AxiomSet Sig := Classicism.Meta.AxiomSet.ofPure PossibleFailureOfCardinalCH.schema

/-- The schema at every signature: its sentences, read in the signature's language. -/
@[reducible] def ContingencyOfCardinalCH.schemaIn {Sig : Classicism.Meta.Signature} :
    Classicism.Meta.AxiomSet Sig := Classicism.Meta.AxiomSet.ofPure ContingencyOfCardinalCH.schema

end Classicism.P

/-! ## Contingency is the conjunction -/

namespace Classicism.Proofs

/-- `contingency-of-cardinal-ch-implies-possible-cardinal-ch` -/
theorem contingency_of_cardinal_ch_implies_possible_cardinal_ch :
    P.ContingencyOfCardinalCH → P.PossibleCardinalCH := fun h => h.1

/-- `contingency-of-cardinal-ch-implies-possible-failure-of-cardinal-ch` -/
theorem contingency_of_cardinal_ch_implies_possible_failure_of_cardinal_ch :
    P.ContingencyOfCardinalCH → P.PossibleFailureOfCardinalCH := fun h => h.2

/-- `possible-cardinal-ch-and-possible-failure-of-cardinal-ch-imply-contingency-of-cardinal-ch` -/
theorem possible_cardinal_ch_and_possible_failure_of_cardinal_ch_imply_contingency_of_cardinal_ch :
    P.PossibleCardinalCH → P.PossibleFailureOfCardinalCH → P.ContingencyOfCardinalCH :=
  fun h k => ⟨h, k⟩

end Classicism.Proofs

#classicism_check Classicism.Proofs.contingency_of_cardinal_ch_implies_possible_cardinal_ch
  Classicism.Proofs.contingency_of_cardinal_ch_implies_possible_failure_of_cardinal_ch
  Classicism.Proofs.possible_cardinal_ch_and_possible_failure_of_cardinal_ch_imply_contingency_of_cardinal_ch
#classicism_types Classicism.Proofs.contingency_of_cardinal_ch_implies_possible_cardinal_ch
  Classicism.Proofs.contingency_of_cardinal_ch_implies_possible_failure_of_cardinal_ch
  Classicism.Proofs.possible_cardinal_ch_and_possible_failure_of_cardinal_ch_imply_contingency_of_cardinal_ch

#classicism_derive Classicism.Proofs.contingency_of_cardinal_ch_implies_possible_cardinal_ch
  Classicism.Proofs.contingency_of_cardinal_ch_implies_possible_failure_of_cardinal_ch
  Classicism.Proofs.possible_cardinal_ch_and_possible_failure_of_cardinal_ch_imply_contingency_of_cardinal_ch

#classicism_entails Classicism.Proofs.contingency_of_cardinal_ch_implies_possible_cardinal_ch
#classicism_entails Classicism.Proofs.contingency_of_cardinal_ch_implies_possible_failure_of_cardinal_ch
#classicism_entails Classicism.Proofs.possible_cardinal_ch_and_possible_failure_of_cardinal_ch_imply_contingency_of_cardinal_ch
