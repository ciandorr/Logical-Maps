import Classicism.Tools.Check
import Classicism.Tools.TypeSystem
import Classicism.Background.Necessity
import Classicism.Identities
import Classicism.Results.Records
import Classicism.Strict.Vocabulary
import Classicism.Strict.Tautology
import Classicism.Strict.Quantifier
import Classicism.Strict.Transformed

/-!
# Controls for the strict layer

Negative and positive controls for the strict policy, the tautology tactic, the quantifier
cases of Appendix A and the transformer. The controls for the gate and the type-system
check are in `Classicism/Tools/Tests.lean`.
-/

namespace Classicism.Tests

/-! ### Controls for the strict policy

`Classicism/Strict.lean` uses no Logical Equivalence at all. Its theorems therefore pass
`#classicism_strict`, while the gate-policy library does not: every `_eq` lemma in
`Classicism/Booleanism.lean` proves the same thing by one `propext`, which the strict
policy bans. The two below are the same proposition proved under the two policies. -/

#classicism_strict Classicism.Strict.meet_assoc Classicism.Strict.compl_join
#classicism_strict Classicism.Strict.compl_compl Classicism.Strict.join_assoc

/-- Commutativity of `∧` under the gate, via `propext`: banned by the strict policy. -/
theorem gatedCommutativity (p q : Prop) : (p ∧ q) = (q ∧ p) := and_comm_eq p q

/-- The same proposition under the strict policy, via Commutativity-∧ and `congrFun`. -/
theorem strictCommutativity (p q : Prop) : (p ∧ q) = (q ∧ p) := Strict.meet_comm p q

#classicism_strict_expect_rejection gatedCommutativity
#classicism_strict strictCommutativity

/-! ### The tautology tactic

`boolean_eq` decides identities between `∧`/`∨`/`¬` formulas from the six Boolean
Identities. These are all checked strictly, so each reports only Boolean axioms. -/

namespace Taut
open Classicism.Strict

/-- A law proved by hand in `Strict.lean`, now by tactic. -/
theorem byTactic_comm (p q : Prop) : (p ∧ q) = (q ∧ p) := by boolean_eq
/-- Associativity, which by hand needed the dual cancellation lemma. -/
theorem byTactic_assoc (p q r : Prop) : (p ∨ (q ∨ r)) = ((p ∨ q) ∨ r) := by boolean_eq
/-- De Morgan. -/
theorem byTactic_deMorgan (p q : Prop) : (¬ (p ∧ q)) = ((¬ p) ∨ (¬ q)) := by boolean_eq
/-- A tautology is identical to `⊤`. -/
theorem byTactic_taut (p q : Prop) : ((p ∧ q) ∨ ((¬ p) ∨ (¬ q))) = Top := by boolean_eq
/-- Four atoms, beyond anything proved by hand. -/
theorem byTactic_four (p q r s : Prop) :
    ((p ∨ q) ∧ ((¬ p) ∨ r) ∧ (q ∨ r ∨ s)) = ((p ∨ q) ∧ ((¬ p) ∨ r)) := by boolean_eq
/-- Peirce's law, through the paper's defined implication. -/
theorem byTactic_peirce (p q : Prop) : imp (imp (imp p q) p) p = Top := by boolean_eq
/-- The self-distribution axiom of `PC`. -/
theorem byTactic_selfDistrib (p q r : Prop) :
    imp (imp p (imp q r)) (imp (imp p q) (imp p r)) = Top := by boolean_eq

#classicism_strict byTactic_comm byTactic_assoc byTactic_deMorgan byTactic_taut
#classicism_strict byTactic_four byTactic_peirce byTactic_selfDistrib
#classicism_strict Classicism.Strict.eq_of_iff_eq_top Classicism.Strict.iff_eq_top_of_eq

end Taut

/-! ### The quantifier cases of Appendix A

Every axiom of `H` that governs a quantifier or identity, shown identical to `⊤` from the
Classicist Identities, plus the two identities behind `Gen` and `Inst`. All strict. -/

namespace Quant
open Classicism.Strict

#classicism_strict Classicism.Strict.forall_const_top Classicism.Strict.exists_const_bot
#classicism_strict Classicism.Strict.ui_top Classicism.Strict.eg_top
#classicism_strict Classicism.Strict.imp_forall Classicism.Strict.meet_exists
#classicism_strict Classicism.Strict.lam_iff_self_top Classicism.Strict.ref_top
#classicism_strict Classicism.Strict.gen_top

end Quant

/-! ### The transformer

`#classicism_transform foo` runs Appendix A's induction over the proof term of `foo` and
declares `foo.nec : S' = ⊤` and `foo.strict : S'`, where `S'` is the statement read in the
paper's vocabulary. Each line below exercises it and, by the reported axioms, demonstrates
that the shallow theory is Classicism. The whole library is run in `Classicism/Audit.lean`;
these are the cases worth naming.

Boolean lemmas, and the eleven identities themselves. -/

#classicism_transform Classicism.and_comm_eq Classicism.and_assoc_eq Classicism.not_and_eq
#classicism_transform Classicism.Identities.commutativity_and
#classicism_transform Classicism.Identities.absorption_or_forall
#classicism_transform Classicism.Identities.identity_identity

/-! Statements mentioning `True`, `False`, `→` and `↔`, which no axiom mentions. -/

#classicism_transform Classicism.and_true_eq Classicism.not_true_eq Classicism.true_imp_eq
#classicism_transform Classicism.imp_eq_not_or Classicism.contrapos_eq Classicism.iff_eq_and_imp

/-! Quantifiers: proofs that pass under a binder, and `∃`-elimination. An earlier design,
which re-proved each identity instead of transforming its proof, could do none of these. -/

#classicism_transform Classicism.and_forall_absorb_eq Classicism.forall_and_distrib_eq
#classicism_transform Classicism.not_forall_eq Classicism.not_exists_eq
#classicism_transform Classicism.Identities.forall_duality

/-! Implications, with hypotheses in scope and Leibniz's Law on them: the modal logic. -/

#classicism_transform Classicism.modal_T Classicism.modal_K Classicism.modal_four
#classicism_transform Classicism.necessity_of_identity Classicism.converse_barcan
#classicism_transform Classicism.box_and_eq Classicism.dia_intro Classicism.existence_e

/-! `simp`: its proof terms cite `eq_self`, `of_eq_true`, `congr` and `forall_congr`, which
the transformer unfolds at their use (`Transform.coreUnfolded`); after unfolding, the gated
sites are `propext` and `funext` at closed arguments, as everywhere else. -/

theorem simpTransformCloses (p : Prop) : ((p ∧ True) ∨ False) = p := by
  simp only [and_true_eq, or_false_eq]
theorem simpTransformForall {σ : Type} [Ty σ] (X : σ → Prop) :
    (∀ z, X z ∧ True) = (∀ z, X z) := by
  simp only [and_true_eq]
theorem simpTransformExists {σ : Type} [Ty σ] (X : σ → Prop) :
    (∃ z, X z ∧ True) = (∃ z, X z) := by
  simp only [and_true_eq]

#classicism_transform Classicism.Tests.simpTransformCloses Classicism.Tests.simpTransformForall
#classicism_transform Classicism.Tests.simpTransformExists

/-! The outputs are ordinary theorems. They pass the strict check and the type check like
anything written by hand. -/

#classicism_strict Classicism.modal_K.nec Classicism.modal_K.strict
#classicism_strict Classicism.converse_barcan.nec Classicism.forall_and_distrib_eq.strict
#classicism_types Classicism.modal_K.nec Classicism.converse_barcan.nec

/-! ### Through the class mirrors

Proofs that cite the laws of `Rel` and `Order` transform once those classes have strict
mirrors (`Classicism/Mirror.lean`). Intensionality and Modalized Functionality are the
paper's §1.5; the last line is the order law at function types, whose transform *is* the
law of the mirror instance. -/

#classicism_transform Classicism.intensionality Classicism.modalized_fregean
#classicism_transform Classicism.modalized_functionality Classicism.le_iff_arrow
#classicism_transform Classicism.persistent_iff_le Classicism.rigid_iff_box_weaklyRigid

#classicism_strict Classicism.intensionality.nec Classicism.modalized_functionality.nec
#classicism_strict Classicism.le_iff_arrow.nec Classicism.persistent_iff_le.nec
#classicism_types Classicism.intensionality.nec Classicism.le_iff_arrow.nec

/-- The mirror instances themselves rest on the eleven identities alone. -/
theorem mirrorArrowLaw {σ τ : Type} [Ty σ] [Strict.SRel τ] :
    (∀ (X Y : σ → τ) (p : Prop),
      Strict.SRel.and X (Strict.SRel.constP (p ∧ Strict.SRel.coext X Y))
        = Strict.SRel.and Y (Strict.SRel.constP (p ∧ Strict.SRel.coext X Y))) = Strict.Top :=
  Strict.SRel.and_constP_coext_nec (σ → τ)

#classicism_strict mirrorArrowLaw

/-! ### Records, between instances

A record is an implication between instances of principles, with the types as parameters,
so it is a formula and the induction reaches it: each gets a necessitation, from which the
boxed record follows by `K`. -/

#classicism_transform Classicism.Proofs.functionality_r_implies_tractarianism_r
#classicism_transform Classicism.Proofs.barcan_r_implies_functionality_r
#classicism_transform Classicism.Proofs.gallin_comprehension_implies_nd
#classicism_transform Classicism.Proofs.functional_choice_r_implies_relational_choice_r
#classicism_transform Classicism.Proofs.classicism_implies_existence_r_at_e

#classicism_strict Classicism.Proofs.functionality_r_implies_tractarianism_r.nec
#classicism_strict Classicism.Proofs.functional_choice_r_implies_relational_choice_r.nec
#classicism_types Classicism.Proofs.functionality_r_implies_tractarianism_r.nec
#classicism_types Classicism.Proofs.gallin_comprehension_implies_nd.nec

/-- The strict statement of a record is the paper's, between instances read in the
paper's vocabulary: Functionality at `σ → t` with `imp` and `SRel`. -/
example {σ : Type} [Ty σ] :
    type_of% (Classicism.Proofs.functionality_r_implies_tractarianism_r.strict (σ := σ))
    = Classicism.imp (P.Functionality.strict σ Prop) (P.Tractarianism.strict σ) := rfl

/-- The boxed record, `□Functionality at σ → t` implies `□Tractarianism at σ`, from the
necessitation and `K`; this is how the map's necessitated records are read. -/
example {σ : Type} [Ty σ] :
    □ (P.Functionality σ Prop) → □ (P.Tractarianism σ) :=
  modal_K _ _ (nec% (Classicism.Proofs.functionality_r_implies_tractarianism_r (σ := σ)))

/-! ### No quantifier over types inside a formula

A principle is a family of formulas indexed by types, and the type-system check rejects a
proposition that quantifies over types, guarded or not, anywhere but in the leading
telescope of a declaration. These would otherwise pass every other check. -/

/-- A family of formulas indexed by types, written as one proposition. -/
def familyAsProposition : Prop := ∀ {σ : Type} [Ty σ] (x : σ), x = x
#classicism_types_expect_rejection familyAsProposition

/-- A hypothesis that is such a family. -/
theorem familyAsHypothesis (h : ∀ {σ : Type} [Ty σ] (x : σ), x = x) : ∀ p : Prop, p = p :=
  fun p => h p
#classicism_types_expect_rejection familyAsHypothesis

/-- Even such a family as the conclusion, with parameters in front. -/
theorem familyAsConclusion (p : Prop) : p → ∀ {σ : Type} [Ty σ] (x : σ), x = x :=
  fun _ {_} [Ty _] x => rfl
#classicism_types_expect_rejection familyAsConclusion

end Classicism.Tests
