import Classicism.Certified.Signatures
import Classicism.Certified.Arithmetic
import Classicism.Semantics.IntensionalTheory
import Classicism.Models.Permutations
import Classicism.Models.Monoids
import Classicism.Models.ContingentBarcan
import Classicism.Semantics.IntensionalExamples
import Classicism.Models.Conditions
import Classicism.Models.FullActionModels
import Classicism.Semantics.Interpretations
import Classicism.Models.SymmetricFull
import Classicism.Models.SymmetricIdeal
import Classicism.Models.SymmetricIdealMeets
import Classicism.Models.QualitativeLinksMeets
import Classicism.Models.SymmetricCollapsePoint
import Classicism.Models.PairInjCollapse
import Classicism.Models.OldNewBase
import Classicism.Models.FiniteCompressionBase
import Classicism.Models.FixedPointEntranceModel
import Classicism.Coalesced.SumData
import Classicism.Models.CoalescedFinite
import Classicism.Models.CoalescedInterpretations
import Classicism.Models.CoalescedInterpretationSums
import Classicism.Models.Henkin
import Classicism.Models.GluedFreeMonoid
import Classicism.Models.GluedFreeProduct

/-!
# Generated statements: models' verdicts

Written by `pmap lean classicism` from the YAML records. **Do not edit.**

One declaration per verdict a model record proves in Lean (its `lean.verdicts`): that
the principle holds, or fails, in the record's Lean model.
-/

namespace Classicism.Statements
open Classicism

/-- `coalesced-all-finite-individual-domains`: □Truths are 5-necessary holds. -/
def Models.coalesced_all_finite_individual_domains.necessary_truth_implies_five_necessity : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)).IsModel ∧ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)).HoldsAx Classicism.P.NecTruthImpliesFiveNecessity.schemaIn

/-- `coalesced-constant-indexed-root`: Axiom of Infinity (type e) holds. -/
def Models.coalesced_constant_indexed_root.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.constantIndexedData)).IsModel ∧ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.constantIndexedData)).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `coalesced-constant-indexed-root`: □Two-hat necessities are ND-necessary fails. -/
def Models.coalesced_constant_indexed_root.necessary_two_hat_implies_nd_necessity : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.constantIndexedData)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.constantIndexedData)).HoldsAx Classicism.P.NecTwoHatImpliesNdNecessity.schemaIn

/-- `coalesced-constant-indexed-root`: □Truths are 5-necessary fails. -/
def Models.coalesced_constant_indexed_root.necessary_truth_implies_five_necessity : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.constantIndexedData)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.constantIndexedData)).HoldsAx Classicism.P.NecTruthImpliesFiveNecessity.schemaIn

/-- `coalesced-constant-indexed-root`: □Vicinity fails. -/
def Models.coalesced_constant_indexed_root.necessary_vicinity : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.constantIndexedData)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.constantIndexedData)).HoldsAx Classicism.P.NecVicinity.schemaIn

/-- `coalesced-constant-indexed-root`: □Weakly Inextensible Comprehension fails. -/
def Models.coalesced_constant_indexed_root.necessary_weakly_inextensible_comprehension_r : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.constantIndexedData)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.constantIndexedData)).HoldsAx Classicism.P.NecWeaklyInextensibleComprehension.schemaIn

/-- `coalesced-constant-indexed-root`: □Transversal fails. -/
def Models.coalesced_constant_indexed_root.necessary_transversal_r : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.constantIndexedData)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.constantIndexedData)).HoldsAx Classicism.P.NecTransversal.schemaIn

/-- `coalesced-definable-root`: Maximalism (pure) holds. -/
def Models.coalesced_definable_root.distinctness_schema_r : Prop :=
  (Classicism.Meta.Coalesced.definableRoot).IsModel ∧ (Classicism.Meta.Coalesced.definableRoot).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.distinctnessC)

/-- `coalesced-definable-root`: Infinity Schema (type e) fails. -/
def Models.coalesced_definable_root.infinity_e : Prop :=
  (Classicism.Meta.Coalesced.definableRoot).IsModel ∧ ¬ (Classicism.Meta.Coalesced.definableRoot).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityE)

/-- `coalesced-definable-root`: Axiom of Infinity (type e) fails. -/
def Models.coalesced_definable_root.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Coalesced.definableRoot).IsModel ∧ ¬ (Classicism.Meta.Coalesced.definableRoot).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `coalesced-definable-root`: □Vicinity fails. -/
def Models.coalesced_definable_root.necessary_vicinity : Prop :=
  (Classicism.Meta.Coalesced.definableRoot).IsModel ∧ ¬ (Classicism.Meta.Coalesced.definableRoot).HoldsAx Classicism.P.NecVicinity.schemaIn

/-- `coalesced-definable-root`: □Weakly Inextensible Comprehension fails. -/
def Models.coalesced_definable_root.necessary_weakly_inextensible_comprehension_r : Prop :=
  (Classicism.Meta.Coalesced.definableRoot).IsModel ∧ ¬ (Classicism.Meta.Coalesced.definableRoot).HoldsAx Classicism.P.NecWeaklyInextensibleComprehension.schemaIn

/-- `coalesced-definable-root`: □Transversal fails. -/
def Models.coalesced_definable_root.necessary_transversal_r : Prop :=
  (Classicism.Meta.Coalesced.definableRoot).IsModel ∧ ¬ (Classicism.Meta.Coalesced.definableRoot).HoldsAx Classicism.P.NecTransversal.schemaIn

/-- `coalesced-definable-root`: Arithmetic Necessitism holds. -/
def Models.coalesced_definable_root.arithmetic_necessitism : Prop :=
  (Classicism.Meta.Coalesced.definableRoot).IsModel ∧ (Classicism.Meta.Coalesced.definableRoot).HoldsAx Classicism.P.ArithmeticNecessitism.schemaIn

/-- `coalesced-definable-root`: □Axiom of Infinity (type e) fails. -/
def Models.coalesced_definable_root.necessary_axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Coalesced.definableRoot).IsModel ∧ ¬ (Classicism.Meta.Coalesced.definableRoot).HoldsAx Classicism.P.NecAxiomOfInfinityE.schemaIn

/-- `coalesced-definable-root`: □Axiom of Infinity (type t) fails. -/
def Models.coalesced_definable_root.necessary_axiom_of_infinity_t : Prop :=
  (Classicism.Meta.Coalesced.definableRoot).IsModel ∧ ¬ (Classicism.Meta.Coalesced.definableRoot).HoldsAx Classicism.P.NecAxiomOfInfinityT.schemaIn

/-- `coalesced-definable-root`: Actuality holds. -/
def Models.coalesced_definable_root.actuality : Prop :=
  (Classicism.Meta.Coalesced.definableRoot).IsModel ∧ (Classicism.Meta.Coalesced.definableRoot).HoldsAx Classicism.P.Actuality.schemaIn

/-- `coalesced-maximalist-root`: Maximalism (signature Σ) holds. -/
def Models.coalesced_maximalist_root.distinctness_signature_r : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.maximalistRoot)).Admitted ∧ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.maximalistRoot)).IsModel ∧ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.maximalistRoot)).HoldsAx (Classicism.Meta.AxiomSet.distinctnessC _)

/-- `coalesced-maximalist-root`: Axiom of Infinity (type e) holds. -/
def Models.coalesced_maximalist_root.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.maximalistRoot)).IsModel ∧ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.maximalistRoot)).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `coalesced-maximalist-root`: □Two-hat necessities are ND-necessary fails. -/
def Models.coalesced_maximalist_root.necessary_two_hat_implies_nd_necessity : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.maximalistRoot)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.maximalistRoot)).HoldsAx Classicism.P.NecTwoHatImpliesNdNecessity.schemaIn

/-- `coalesced-maximalist-root`: □Truths are 5-necessary fails. -/
def Models.coalesced_maximalist_root.necessary_truth_implies_five_necessity : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.maximalistRoot)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.maximalistRoot)).HoldsAx Classicism.P.NecTruthImpliesFiveNecessity.schemaIn

/-- `coalesced-maximalist-root`: □Vicinity fails. -/
def Models.coalesced_maximalist_root.necessary_vicinity : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.maximalistRoot)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.maximalistRoot)).HoldsAx Classicism.P.NecVicinity.schemaIn

/-- `coalesced-maximalist-root`: □Weakly Inextensible Comprehension fails. -/
def Models.coalesced_maximalist_root.necessary_weakly_inextensible_comprehension_r : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.maximalistRoot)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.maximalistRoot)).HoldsAx Classicism.P.NecWeaklyInextensibleComprehension.schemaIn

/-- `coalesced-maximalist-root`: □Transversal fails. -/
def Models.coalesced_maximalist_root.necessary_transversal_r : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.maximalistRoot)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.maximalistRoot)).HoldsAx Classicism.P.NecTransversal.schemaIn

/-- `coalesced-pinned-interpretations-root`: BF holds. -/
def Models.coalesced_pinned_interpretations_root.barcan_r : Prop :=
  (Classicism.Meta.Coalesced.pinnedInterpRoot).IsModel ∧ (Classicism.Meta.Coalesced.pinnedInterpRoot).HoldsAx Classicism.P.Barcan.schemaIn

/-- `coalesced-pinned-interpretations-root`: Maximalism (signature Σ) holds. -/
def Models.coalesced_pinned_interpretations_root.distinctness_signature_r : Prop :=
  (Classicism.Meta.Coalesced.pinnedInterpRoot).Admitted ∧ (Classicism.Meta.Coalesced.pinnedInterpRoot).IsModel ∧ (Classicism.Meta.Coalesced.pinnedInterpRoot).HoldsAx (Classicism.Meta.AxiomSet.distinctnessC _)

/-- `coalesced-pinned-substitutions-root`: BF holds. -/
def Models.coalesced_pinned_substitutions_root.barcan_r : Prop :=
  (Classicism.Meta.Coalesced.pinnedSubstRoot).IsModel ∧ (Classicism.Meta.Coalesced.pinnedSubstRoot).HoldsAx Classicism.P.Barcan.schemaIn

/-- `coalesced-pinned-substitutions-root`: Maximalism (signature Σ) holds. -/
def Models.coalesced_pinned_substitutions_root.distinctness_signature_r : Prop :=
  (Classicism.Meta.Coalesced.pinnedSubstRoot).Admitted ∧ (Classicism.Meta.Coalesced.pinnedSubstRoot).IsModel ∧ (Classicism.Meta.Coalesced.pinnedSubstRoot).HoldsAx (Classicism.Meta.AxiomSet.distinctnessC _)

/-- `coalesced-single-individual-root`: Infinity Schema (type e) fails. -/
def Models.coalesced_single_individual_root.infinity_e : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.singleIndividualData)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.singleIndividualData)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityE)

/-- `coalesced-single-individual-root`: □Two-hat necessities are ND-necessary fails. -/
def Models.coalesced_single_individual_root.necessary_two_hat_implies_nd_necessity : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.singleIndividualData)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.singleIndividualData)).HoldsAx Classicism.P.NecTwoHatImpliesNdNecessity.schemaIn

/-- `coalesced-single-individual-root`: □Truths are 5-necessary fails. -/
def Models.coalesced_single_individual_root.necessary_truth_implies_five_necessity : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.singleIndividualData)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.singleIndividualData)).HoldsAx Classicism.P.NecTruthImpliesFiveNecessity.schemaIn

/-- `coalesced-single-individual-root`: □Vicinity fails. -/
def Models.coalesced_single_individual_root.necessary_vicinity : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.singleIndividualData)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.singleIndividualData)).HoldsAx Classicism.P.NecVicinity.schemaIn

/-- `coalesced-single-individual-root`: □Weakly Inextensible Comprehension fails. -/
def Models.coalesced_single_individual_root.necessary_weakly_inextensible_comprehension_r : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.singleIndividualData)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.singleIndividualData)).HoldsAx Classicism.P.NecWeaklyInextensibleComprehension.schemaIn

/-- `coalesced-single-individual-root`: □Transversal fails. -/
def Models.coalesced_single_individual_root.necessary_transversal_r : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.singleIndividualData)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.singleIndividualData)).HoldsAx Classicism.P.NecTransversal.schemaIn

/-- `coalesced-substitutions-fullest-root`: Actuality holds. -/
def Models.coalesced_substitutions_fullest_root.actuality : Prop :=
  (Classicism.Meta.Coalesced.substitutionsFullestRoot).IsModel ∧ (Classicism.Meta.Coalesced.substitutionsFullestRoot).HoldsAx Classicism.P.Actuality.schemaIn

/-- `finite-support-dyadic-roundings`: BF fails. -/
def Models.finite_support_dyadic_roundings.barcan_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pow2)).IsModel ∧ ¬ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pow2)).HoldsAx Classicism.P.Barcan.schemaIn

/-- `finite-support-dyadic-roundings`: Boolean Completeness fails. -/
def Models.finite_support_dyadic_roundings.boolean_completeness_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pow2)).IsModel ∧ ¬ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pow2)).HoldsAx Classicism.P.BooleanCompleteness.schemaIn

/-- `finite-support-identity-or-collapse-surjections`: Boolean Completeness fails. -/
def Models.finite_support_identity_or_collapse_surjections.boolean_completeness_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)).IsModel ∧ ¬ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)).HoldsAx Classicism.P.BooleanCompleteness.schemaIn

/-- `finite-support-identity-or-collapse`: Boolean Completeness fails. -/
def Models.finite_support_identity_or_collapse.boolean_completeness_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono01)).IsModel ∧ ¬ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono01)).HoldsAx Classicism.P.BooleanCompleteness.schemaIn

/-- `finite-support-monotone-maps`: Atomlessness holds. -/
def Models.finite_support_monotone_maps.atomlessness : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono)).HoldsAx Classicism.P.Atomlessness.schemaIn

/-- `finite-support-monotone-maps`: Boolean Completeness fails. -/
def Models.finite_support_monotone_maps.boolean_completeness_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono)).IsModel ∧ ¬ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono)).HoldsAx Classicism.P.BooleanCompleteness.schemaIn

/-- `finite-support-monotone-surjections`: Atomlessness holds. -/
def Models.finite_support_monotone_surjections.atomlessness : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj)).HoldsAx Classicism.P.Atomlessness.schemaIn

/-- `finite-support-monotone-surjections`: ND fails. -/
def Models.finite_support_monotone_surjections.distinctness_necessary_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj)).IsModel ∧ ¬ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj)).HoldsAx Classicism.P.NecessityOfDistinctness.schemaIn

/-- `finite-support-monotone-surjections`: Boolean Completeness fails. -/
def Models.finite_support_monotone_surjections.boolean_completeness_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj)).IsModel ∧ ¬ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj)).HoldsAx Classicism.P.BooleanCompleteness.schemaIn

/-- `finite-support-pair-injections-or-collapses`: Vicinity holds. -/
def Models.finite_support_pair_injections_or_collapses.vicinity : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pairInjCol)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pairInjCol)).HoldsAx Classicism.P.Vicinity.schemaIn

/-- `finite-support-pair-injections-or-collapses`: BF holds. -/
def Models.finite_support_pair_injections_or_collapses.barcan_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pairInjCol)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pairInjCol)).HoldsAx Classicism.P.Barcan.schemaIn

/-- `finite-support-pair-injections-or-collapses`: Atomlessness holds. -/
def Models.finite_support_pair_injections_or_collapses.atomlessness : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pairInjCol)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pairInjCol)).HoldsAx Classicism.P.Atomlessness.schemaIn

/-- `finite-support-pair-injections-or-collapses`: Rigid Power fails. -/
def Models.finite_support_pair_injections_or_collapses.rigid_power_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pairInjCol)).IsModel ∧ ¬ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pairInjCol)).HoldsAx Classicism.P.RigidPower.schemaIn

/-- `finite-support-permutations`: ND holds. -/
def Models.finite_support_permutations.distinctness_necessary_r : Prop :=
  (Classicism.Meta.Intensional.Perms.model).IsModel ∧ (Classicism.Meta.Intensional.Perms.model).HoldsAx Classicism.P.NecessityOfDistinctness.schemaIn

/-- `finite-support-permutations`: Atomlessness holds. -/
def Models.finite_support_permutations.atomlessness : Prop :=
  (Classicism.Meta.Intensional.Perms.model).IsModel ∧ (Classicism.Meta.Intensional.Perms.model).HoldsAx Classicism.P.Atomlessness.schemaIn

/-- `finite-support-permutations`: Boolean Completeness fails. -/
def Models.finite_support_permutations.boolean_completeness_r : Prop :=
  (Classicism.Meta.Intensional.Perms.model).IsModel ∧ ¬ (Classicism.Meta.Intensional.Perms.model).HoldsAx Classicism.P.BooleanCompleteness.schemaIn

/-- `finite-support-truncated-shifts`: Boolean Completeness fails. -/
def Models.finite_support_truncated_shifts.boolean_completeness_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.shifts)).IsModel ∧ ¬ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.shifts)).HoldsAx Classicism.P.BooleanCompleteness.schemaIn

/-- `finite-support-truncations`: Actuality fails. -/
def Models.finite_support_truncations.actuality : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.truncs)).IsModel ∧ ¬ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.truncs)).HoldsAx Classicism.P.Actuality.schemaIn

/-- `finite-support-truncations`: Boolean Completeness fails. -/
def Models.finite_support_truncations.boolean_completeness_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.truncs)).IsModel ∧ ¬ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.truncs)).HoldsAx Classicism.P.BooleanCompleteness.schemaIn

/-- `finite-support-truncations`: Truths are ND-necessary holds. -/
def Models.finite_support_truncations.truths_are_nd_necessary : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.truncs)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.truncs)).HoldsAx Classicism.P.TruthsAreNDNecessary.schemaIn

/-- `finite-support-truncations`: Boolean Completeness (type t) fails. -/
def Models.finite_support_truncations.boolean_completeness_t : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.truncs)).IsModel ∧ ¬ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.truncs)).HoldsAx Classicism.P.BooleanCompletenessT.schemaIn

/-- `finite-support-two-object-all-maps`: BF holds. -/
def Models.finite_support_two_object_all_maps.barcan_r : Prop :=
  (Classicism.Meta.Intensional.ContingentBarcan.model).IsModel ∧ (Classicism.Meta.Intensional.ContingentBarcan.model).HoldsAx Classicism.P.Barcan.schemaIn

/-- `finite-support-two-object-all-maps`: □BF fails. -/
def Models.finite_support_two_object_all_maps.necessary_barcan_r : Prop :=
  (Classicism.Meta.Intensional.ContingentBarcan.model).IsModel ∧ ¬ (Classicism.Meta.Intensional.ContingentBarcan.model).HoldsAx Classicism.P.NecBarcan.schemaIn

/-- `full-double-retraction-glued-constants`: Witnessed Possibility holds. -/
def Models.full_double_retraction_glued_constants.witnessed_possibility_r : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)).Admitted ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)).IsModel ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)).HoldsAx (Classicism.Meta.AxiomSet.witnessedPossibility _)

/-- `full-double-retraction-glued-constants`: Possibly Witnessed Possibility fails. -/
def Models.full_double_retraction_glued_constants.possibly_witnessed_possibility_r : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)).Admitted ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)).IsModel ∧ ¬ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)).HoldsAx (Classicism.Meta.AxiomSet.possiblyWitnessedPossibility _)

/-- `full-double-retraction-glued-constants`: B for pure sentences holds. -/
def Models.full_double_retraction_glued_constants.pure_b_r : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)).IsModel ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.signatureB)

/-- `full-free-monoid-glued-constants-singleton`: Logical Necessity holds. -/
def Models.full_free_monoid_glued_constants_singleton.logical_necessity_r : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)).Admitted ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)).IsModel ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)).HoldsAx (Classicism.Meta.AxiomSet.logicalNecessity _)

/-- `full-free-monoid-glued-constants-singleton`: BF holds. -/
def Models.full_free_monoid_glued_constants_singleton.barcan_r : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)).IsModel ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)).HoldsAx Classicism.P.Barcan.schemaIn

/-- `full-free-monoid-glued-constants`: Logical Necessity holds. -/
def Models.full_free_monoid_glued_constants.logical_necessity_r : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidThread)).Admitted ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidThread)).IsModel ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidThread)).HoldsAx (Classicism.Meta.AxiomSet.logicalNecessity _)

/-- `full-free-monoid-glued-constants`: Axiom of Infinity (type e) holds. -/
def Models.full_free_monoid_glued_constants.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidThread)).IsModel ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidThread)).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `full-free-monoid-glued-constants`: BF holds. -/
def Models.full_free_monoid_glued_constants.barcan_r : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidThread)).IsModel ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidThread)).HoldsAx Classicism.P.Barcan.schemaIn

/-- `full-free-product-glued-constants`: Logical Necessity holds. -/
def Models.full_free_product_glued_constants.logical_necessity_r : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)).Admitted ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)).IsModel ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)).HoldsAx (Classicism.Meta.AxiomSet.logicalNecessity _)

/-- `full-idempotent-monoid`: Atoms are self-atoms (type t) fails. -/
def Models.full_idempotent_monoid.atoms_are_self_atoms_t : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).HoldsAx Classicism.P.AtomsAreSelfAtomsT.schemaIn

/-- `symmetric-all-surjections`: Intensional Choice fails. -/
def Models.symmetric_all_surjections.intensional_choice_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj)).IsModel ∧ ¬ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj)).HoldsAx Classicism.P.IntensionalChoice.schemaIn

/-- `symmetric-entrance-qualitative-links`: Relational Choice holds. -/
def Models.symmetric_entrance_qualitative_links.relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.FixedPointEntrance.Qualitative.model).IsModel ∧ (Classicism.Meta.Intensional.FixedPointEntrance.Qualitative.model).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `symmetric-entrance-qualitative-links`: BF (type t) fails. -/
def Models.symmetric_entrance_qualitative_links.barcan_t : Prop :=
  (Classicism.Meta.Intensional.FixedPointEntrance.Qualitative.model).IsModel ∧ ¬ (Classicism.Meta.Intensional.FixedPointEntrance.Qualitative.model).HoldsAx Classicism.P.BarcanT.schemaIn

/-- `symmetric-entrance-qualitative-links`: BF (relational types) fails. -/
def Models.symmetric_entrance_qualitative_links.barcan_relational : Prop :=
  (Classicism.Meta.Intensional.FixedPointEntrance.Qualitative.model).IsModel ∧ ¬ (Classicism.Meta.Intensional.FixedPointEntrance.Qualitative.model).HoldsAx Classicism.P.BarcanRelational.schemaIn

/-- `symmetric-finite-compression-entrance`: Tame Rigidity holds. -/
def Models.symmetric_finite_compression_entrance.tame_rigidity_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.FiniteCompression.base Classicism.Meta.Intensional.FiniteCompression.A)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.FiniteCompression.base Classicism.Meta.Intensional.FiniteCompression.A)).HoldsAx Classicism.P.TameRigidity.schemaIn

/-- `symmetric-finite-compression-entrance`: Rigid Power holds. -/
def Models.symmetric_finite_compression_entrance.rigid_power_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.FiniteCompression.base Classicism.Meta.Intensional.FiniteCompression.A)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.FiniteCompression.base Classicism.Meta.Intensional.FiniteCompression.A)).HoldsAx Classicism.P.RigidPower.schemaIn

/-- `symmetric-finite-compression-entrance`: Weakly Rigid Power fails. -/
def Models.symmetric_finite_compression_entrance.weakly_rigid_power_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.FiniteCompression.base Classicism.Meta.Intensional.FiniteCompression.A)).IsModel ∧ ¬ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.FiniteCompression.base Classicism.Meta.Intensional.FiniteCompression.A)).HoldsAx Classicism.P.WeaklyRigidPower.schemaIn

/-- `symmetric-infinite-classes`: Transversal fails. -/
def Models.symmetric_infinite_classes.transversal_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses)).IsModel ∧ ¬ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses)).HoldsAx Classicism.P.Transversal.schemaIn

/-- `symmetric-old-new-individuals`: ND holds. -/
def Models.symmetric_old_new_individuals.distinctness_necessary_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.OldNew.base)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.OldNew.base)).HoldsAx Classicism.P.NecessityOfDistinctness.schemaIn

/-- `symmetric-old-new-individuals`: Boolean Completeness holds. -/
def Models.symmetric_old_new_individuals.boolean_completeness_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.OldNew.base)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.OldNew.base)).HoldsAx Classicism.P.BooleanCompleteness.schemaIn

/-- `symmetric-old-new-individuals`: □Boolean Completeness fails. -/
def Models.symmetric_old_new_individuals.necessary_boolean_completeness_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.OldNew.base)).IsModel ∧ ¬ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.OldNew.base)).HoldsAx Classicism.P.NecBooleanCompleteness.schemaIn

/-- `symmetric-two-object-unpinned`: □Boolean Completeness holds. -/
def Models.symmetric_two_object_unpinned.necessary_boolean_completeness_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.twoBase)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.twoBase)).HoldsAx Classicism.P.NecBooleanCompleteness.schemaIn

/-- `coalesced-all-finite-individual-domains`: Relational Choice holds. -/
def Models.coalesced_all_finite_individual_domains.relational_choice_r : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)).IsModel ∧ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `coalesced-all-finite-individual-domains`: Actuality holds. -/
def Models.coalesced_all_finite_individual_domains.actuality : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)).IsModel ∧ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)).HoldsAx Classicism.P.Actuality.schemaIn

/-- `coalesced-all-finite-individual-domains`: B for pure sentences fails. -/
def Models.coalesced_all_finite_individual_domains.pure_b_r : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.signatureB)

/-- `coalesced-all-finite-individual-domains`: □Atomicity holds. -/
def Models.coalesced_all_finite_individual_domains.necessary_atomicity_r : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)).IsModel ∧ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)).HoldsAx Classicism.P.NecAtomicity.schemaIn

/-- `coalesced-all-finite-individual-domains`: □BF holds. -/
def Models.coalesced_all_finite_individual_domains.necessary_barcan_r : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)).IsModel ∧ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)).HoldsAx Classicism.P.NecBarcan.schemaIn

/-- `coalesced-all-finite-individual-domains`: □Rigid Comprehension holds. -/
def Models.coalesced_all_finite_individual_domains.necessary_rigid_comprehension_r : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)).IsModel ∧ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)).HoldsAx Classicism.P.NecRigidComprehension.schemaIn

/-- `coalesced-all-finite-individual-domains`: Axiom of Infinity (type e) holds. -/
def Models.coalesced_all_finite_individual_domains.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)).IsModel ∧ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `coalesced-all-finite-individual-domains`: Infinity Schema (type e) holds. -/
def Models.coalesced_all_finite_individual_domains.infinity_e : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)).IsModel ∧ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityE)

/-- `coalesced-all-finite-individual-domains`: Axiom of Infinity (type t) holds. -/
def Models.coalesced_all_finite_individual_domains.axiom_of_infinity_t : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)).IsModel ∧ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)).HoldsAx Classicism.P.AxiomOfInfinityT.schemaIn

/-- `coalesced-all-finite-individual-domains`: Infinity Schema (type t) holds. -/
def Models.coalesced_all_finite_individual_domains.infinity_t : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)).IsModel ∧ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityT)

/-- `coalesced-all-finite-individual-domains`: Truths are ND-necessary holds. -/
def Models.coalesced_all_finite_individual_domains.truths_are_nd_necessary : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)).IsModel ∧ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)).HoldsAx Classicism.P.TruthsAreNDNecessary.schemaIn

/-- `coalesced-all-finite-individual-domains`: □Relational Choice holds. -/
def Models.coalesced_all_finite_individual_domains.necessary_relational_choice_r : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)).IsModel ∧ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)).HoldsAx Classicism.P.NecRelationalChoice.schemaIn

/-- `coalesced-all-finite-individual-domains`: Transversal Choice holds. -/
def Models.coalesced_all_finite_individual_domains.transversal_choice_r : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)).IsModel ∧ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- `coalesced-all-finite-individual-domains`: ND (type t) fails. -/
def Models.coalesced_all_finite_individual_domains.distinctness_necessary_t : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)).HoldsAx Classicism.P.NecessityOfDistinctnessT.schemaIn

/-- `coalesced-all-finite-individual-domains`: Independence (signature Σ) fails. -/
def Models.coalesced_all_finite_individual_domains.independence_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)) (Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)) (Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel))).IsModel ∧ ¬ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)) (Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel))).HoldsAx (Classicism.Meta.AxiomSet.independence _)

/-- `coalesced-constant-indexed-root`: Intensional Choice fails. -/
def Models.coalesced_constant_indexed_root.intensional_choice_r : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.constantIndexedData)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.constantIndexedData)).HoldsAx Classicism.P.IntensionalChoice.schemaIn

/-- `coalesced-constant-indexed-root`: Relational Choice holds. -/
def Models.coalesced_constant_indexed_root.relational_choice_r : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.constantIndexedData)).IsModel ∧ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.constantIndexedData)).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `coalesced-constant-indexed-root`: Actuality holds. -/
def Models.coalesced_constant_indexed_root.actuality : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.constantIndexedData)).IsModel ∧ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.constantIndexedData)).HoldsAx Classicism.P.Actuality.schemaIn

/-- `coalesced-constant-indexed-root`: BF (type t) fails. -/
def Models.coalesced_constant_indexed_root.barcan_t : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.constantIndexedData)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.constantIndexedData)).HoldsAx Classicism.P.BarcanT.schemaIn

/-- `coalesced-constant-indexed-root`: Atomicity (type t) fails. -/
def Models.coalesced_constant_indexed_root.atomicity_t : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.constantIndexedData)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.constantIndexedData)).HoldsAx Classicism.P.AtomicityT.schemaIn

/-- `coalesced-constant-indexed-root`: Boolean Completeness (type t) fails. -/
def Models.coalesced_constant_indexed_root.boolean_completeness_t : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.constantIndexedData)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.constantIndexedData)).HoldsAx Classicism.P.BooleanCompletenessT.schemaIn

/-- `coalesced-constant-indexed-root`: Arithmetic Necessitism holds. -/
def Models.coalesced_constant_indexed_root.arithmetic_necessitism : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.constantIndexedData)).IsModel ∧ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.constantIndexedData)).HoldsAx Classicism.P.ArithmeticNecessitism.schemaIn

/-- `coalesced-constant-indexed-root`: □Axiom of Infinity (type e) fails. -/
def Models.coalesced_constant_indexed_root.necessary_axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.constantIndexedData)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.constantIndexedData)).HoldsAx Classicism.P.NecAxiomOfInfinityE.schemaIn

/-- `coalesced-constant-indexed-root`: □Axiom of Infinity (type t) fails. -/
def Models.coalesced_constant_indexed_root.necessary_axiom_of_infinity_t : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.constantIndexedData)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.constantIndexedData)).HoldsAx Classicism.P.NecAxiomOfInfinityT.schemaIn

/-- `coalesced-constant-indexed-root`: Self-Atomicity (type t) fails. -/
def Models.coalesced_constant_indexed_root.self_atomicity_t : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.constantIndexedData)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.constantIndexedData)).HoldsAx Classicism.P.SelfAtomicityT.schemaIn

/-- `coalesced-constant-indexed-root`: Atoms are self-atoms (type t) fails. -/
def Models.coalesced_constant_indexed_root.atoms_are_self_atoms_t : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.constantIndexedData)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.constantIndexedData)).HoldsAx Classicism.P.AtomsAreSelfAtomsT.schemaIn

/-- `coalesced-constant-indexed-root`: Truths are ND-necessary holds. -/
def Models.coalesced_constant_indexed_root.truths_are_nd_necessary : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.constantIndexedData)).IsModel ∧ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.constantIndexedData)).HoldsAx Classicism.P.TruthsAreNDNecessary.schemaIn

/-- `coalesced-definable-root`: Truths are ND-necessary holds. -/
def Models.coalesced_definable_root.truths_are_nd_necessary : Prop :=
  (Classicism.Meta.Coalesced.definableRoot).IsModel ∧ (Classicism.Meta.Coalesced.definableRoot).HoldsAx Classicism.P.TruthsAreNDNecessary.schemaIn

/-- `coalesced-definable-root`: Independence (signature Σ) fails. -/
def Models.coalesced_definable_root.independence_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Coalesced.definableRoot) (Classicism.Meta.Coalesced.definableRoot_isModel)).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Coalesced.definableRoot) (Classicism.Meta.Coalesced.definableRoot_isModel)).IsModel ∧ ¬ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Coalesced.definableRoot) (Classicism.Meta.Coalesced.definableRoot_isModel)).HoldsAx (Classicism.Meta.AxiomSet.independence _)

/-- `coalesced-maximalist-root`: Intensional Choice fails. -/
def Models.coalesced_maximalist_root.intensional_choice_r : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.maximalistRoot)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.maximalistRoot)).HoldsAx Classicism.P.IntensionalChoice.schemaIn

/-- `coalesced-maximalist-root`: Relational Choice holds. -/
def Models.coalesced_maximalist_root.relational_choice_r : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.maximalistRoot)).IsModel ∧ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.maximalistRoot)).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `coalesced-maximalist-root`: Actuality holds. -/
def Models.coalesced_maximalist_root.actuality : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.maximalistRoot)).IsModel ∧ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.maximalistRoot)).HoldsAx Classicism.P.Actuality.schemaIn

/-- `coalesced-maximalist-root`: BF (type t) fails. -/
def Models.coalesced_maximalist_root.barcan_t : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.maximalistRoot)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.maximalistRoot)).HoldsAx Classicism.P.BarcanT.schemaIn

/-- `coalesced-maximalist-root`: Atomicity (type t) fails. -/
def Models.coalesced_maximalist_root.atomicity_t : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.maximalistRoot)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.maximalistRoot)).HoldsAx Classicism.P.AtomicityT.schemaIn

/-- `coalesced-maximalist-root`: Boolean Completeness (type t) fails. -/
def Models.coalesced_maximalist_root.boolean_completeness_t : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.maximalistRoot)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.maximalistRoot)).HoldsAx Classicism.P.BooleanCompletenessT.schemaIn

/-- `coalesced-maximalist-root`: Arithmetic Necessitism holds. -/
def Models.coalesced_maximalist_root.arithmetic_necessitism : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.maximalistRoot)).IsModel ∧ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.maximalistRoot)).HoldsAx Classicism.P.ArithmeticNecessitism.schemaIn

/-- `coalesced-maximalist-root`: □Axiom of Infinity (type e) fails. -/
def Models.coalesced_maximalist_root.necessary_axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.maximalistRoot)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.maximalistRoot)).HoldsAx Classicism.P.NecAxiomOfInfinityE.schemaIn

/-- `coalesced-maximalist-root`: □Axiom of Infinity (type t) fails. -/
def Models.coalesced_maximalist_root.necessary_axiom_of_infinity_t : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.maximalistRoot)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.maximalistRoot)).HoldsAx Classicism.P.NecAxiomOfInfinityT.schemaIn

/-- `coalesced-maximalist-root`: Self-Atomicity (type t) fails. -/
def Models.coalesced_maximalist_root.self_atomicity_t : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.maximalistRoot)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.maximalistRoot)).HoldsAx Classicism.P.SelfAtomicityT.schemaIn

/-- `coalesced-maximalist-root`: Atoms are self-atoms (type t) fails. -/
def Models.coalesced_maximalist_root.atoms_are_self_atoms_t : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.maximalistRoot)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.maximalistRoot)).HoldsAx Classicism.P.AtomsAreSelfAtomsT.schemaIn

/-- `coalesced-maximalist-root`: Truths are ND-necessary holds. -/
def Models.coalesced_maximalist_root.truths_are_nd_necessary : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.maximalistRoot)).IsModel ∧ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.maximalistRoot)).HoldsAx Classicism.P.TruthsAreNDNecessary.schemaIn

/-- `coalesced-pinned-interpretations-root`: Relational Choice holds. -/
def Models.coalesced_pinned_interpretations_root.relational_choice_r : Prop :=
  (Classicism.Meta.Coalesced.pinnedInterpRoot).IsModel ∧ (Classicism.Meta.Coalesced.pinnedInterpRoot).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `coalesced-pinned-interpretations-root`: Actuality holds. -/
def Models.coalesced_pinned_interpretations_root.actuality : Prop :=
  (Classicism.Meta.Coalesced.pinnedInterpRoot).IsModel ∧ (Classicism.Meta.Coalesced.pinnedInterpRoot).HoldsAx Classicism.P.Actuality.schemaIn

/-- `coalesced-pinned-interpretations-root`: □Vicinity fails. -/
def Models.coalesced_pinned_interpretations_root.necessary_vicinity : Prop :=
  (Classicism.Meta.Coalesced.pinnedInterpRoot).IsModel ∧ ¬ (Classicism.Meta.Coalesced.pinnedInterpRoot).HoldsAx Classicism.P.NecVicinity.schemaIn

/-- `coalesced-pinned-interpretations-root`: □Weakly Inextensible Comprehension fails. -/
def Models.coalesced_pinned_interpretations_root.necessary_weakly_inextensible_comprehension_r : Prop :=
  (Classicism.Meta.Coalesced.pinnedInterpRoot).IsModel ∧ ¬ (Classicism.Meta.Coalesced.pinnedInterpRoot).HoldsAx Classicism.P.NecWeaklyInextensibleComprehension.schemaIn

/-- `coalesced-pinned-interpretations-root`: □Transversal fails. -/
def Models.coalesced_pinned_interpretations_root.necessary_transversal_r : Prop :=
  (Classicism.Meta.Coalesced.pinnedInterpRoot).IsModel ∧ ¬ (Classicism.Meta.Coalesced.pinnedInterpRoot).HoldsAx Classicism.P.NecTransversal.schemaIn

/-- `coalesced-pinned-interpretations-root`: Arithmetic Necessitism holds. -/
def Models.coalesced_pinned_interpretations_root.arithmetic_necessitism : Prop :=
  (Classicism.Meta.Coalesced.pinnedInterpRoot).IsModel ∧ (Classicism.Meta.Coalesced.pinnedInterpRoot).HoldsAx Classicism.P.ArithmeticNecessitism.schemaIn

/-- `coalesced-pinned-interpretations-root`: □Axiom of Infinity (type e) fails. -/
def Models.coalesced_pinned_interpretations_root.necessary_axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Coalesced.pinnedInterpRoot).IsModel ∧ ¬ (Classicism.Meta.Coalesced.pinnedInterpRoot).HoldsAx Classicism.P.NecAxiomOfInfinityE.schemaIn

/-- `coalesced-pinned-interpretations-root`: □Axiom of Infinity (type t) fails. -/
def Models.coalesced_pinned_interpretations_root.necessary_axiom_of_infinity_t : Prop :=
  (Classicism.Meta.Coalesced.pinnedInterpRoot).IsModel ∧ ¬ (Classicism.Meta.Coalesced.pinnedInterpRoot).HoldsAx Classicism.P.NecAxiomOfInfinityT.schemaIn

/-- `coalesced-pinned-interpretations-root`: Truths are ND-necessary holds. -/
def Models.coalesced_pinned_interpretations_root.truths_are_nd_necessary : Prop :=
  (Classicism.Meta.Coalesced.pinnedInterpRoot).IsModel ∧ (Classicism.Meta.Coalesced.pinnedInterpRoot).HoldsAx Classicism.P.TruthsAreNDNecessary.schemaIn

/-- `coalesced-pinned-substitutions-root`: □Vicinity fails. -/
def Models.coalesced_pinned_substitutions_root.necessary_vicinity : Prop :=
  (Classicism.Meta.Coalesced.pinnedSubstRoot).IsModel ∧ ¬ (Classicism.Meta.Coalesced.pinnedSubstRoot).HoldsAx Classicism.P.NecVicinity.schemaIn

/-- `coalesced-pinned-substitutions-root`: □Weakly Inextensible Comprehension fails. -/
def Models.coalesced_pinned_substitutions_root.necessary_weakly_inextensible_comprehension_r : Prop :=
  (Classicism.Meta.Coalesced.pinnedSubstRoot).IsModel ∧ ¬ (Classicism.Meta.Coalesced.pinnedSubstRoot).HoldsAx Classicism.P.NecWeaklyInextensibleComprehension.schemaIn

/-- `coalesced-pinned-substitutions-root`: □Transversal fails. -/
def Models.coalesced_pinned_substitutions_root.necessary_transversal_r : Prop :=
  (Classicism.Meta.Coalesced.pinnedSubstRoot).IsModel ∧ ¬ (Classicism.Meta.Coalesced.pinnedSubstRoot).HoldsAx Classicism.P.NecTransversal.schemaIn

/-- `coalesced-pinned-substitutions-root`: Arithmetic Necessitism holds. -/
def Models.coalesced_pinned_substitutions_root.arithmetic_necessitism : Prop :=
  (Classicism.Meta.Coalesced.pinnedSubstRoot).IsModel ∧ (Classicism.Meta.Coalesced.pinnedSubstRoot).HoldsAx Classicism.P.ArithmeticNecessitism.schemaIn

/-- `coalesced-pinned-substitutions-root`: □Axiom of Infinity (type e) fails. -/
def Models.coalesced_pinned_substitutions_root.necessary_axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Coalesced.pinnedSubstRoot).IsModel ∧ ¬ (Classicism.Meta.Coalesced.pinnedSubstRoot).HoldsAx Classicism.P.NecAxiomOfInfinityE.schemaIn

/-- `coalesced-pinned-substitutions-root`: □Axiom of Infinity (type t) fails. -/
def Models.coalesced_pinned_substitutions_root.necessary_axiom_of_infinity_t : Prop :=
  (Classicism.Meta.Coalesced.pinnedSubstRoot).IsModel ∧ ¬ (Classicism.Meta.Coalesced.pinnedSubstRoot).HoldsAx Classicism.P.NecAxiomOfInfinityT.schemaIn

/-- `coalesced-single-individual-root`: Intensional Choice fails. -/
def Models.coalesced_single_individual_root.intensional_choice_r : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.singleIndividualData)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.singleIndividualData)).HoldsAx Classicism.P.IntensionalChoice.schemaIn

/-- `coalesced-single-individual-root`: Relational Choice holds. -/
def Models.coalesced_single_individual_root.relational_choice_r : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.singleIndividualData)).IsModel ∧ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.singleIndividualData)).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `coalesced-single-individual-root`: Actuality holds. -/
def Models.coalesced_single_individual_root.actuality : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.singleIndividualData)).IsModel ∧ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.singleIndividualData)).HoldsAx Classicism.P.Actuality.schemaIn

/-- `coalesced-single-individual-root`: BF (type t) fails. -/
def Models.coalesced_single_individual_root.barcan_t : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.singleIndividualData)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.singleIndividualData)).HoldsAx Classicism.P.BarcanT.schemaIn

/-- `coalesced-single-individual-root`: Atomicity (type t) fails. -/
def Models.coalesced_single_individual_root.atomicity_t : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.singleIndividualData)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.singleIndividualData)).HoldsAx Classicism.P.AtomicityT.schemaIn

/-- `coalesced-single-individual-root`: Boolean Completeness (type t) fails. -/
def Models.coalesced_single_individual_root.boolean_completeness_t : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.singleIndividualData)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.singleIndividualData)).HoldsAx Classicism.P.BooleanCompletenessT.schemaIn

/-- `coalesced-single-individual-root`: Arithmetic Necessitism holds. -/
def Models.coalesced_single_individual_root.arithmetic_necessitism : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.singleIndividualData)).IsModel ∧ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.singleIndividualData)).HoldsAx Classicism.P.ArithmeticNecessitism.schemaIn

/-- `coalesced-single-individual-root`: □Axiom of Infinity (type e) fails. -/
def Models.coalesced_single_individual_root.necessary_axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.singleIndividualData)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.singleIndividualData)).HoldsAx Classicism.P.NecAxiomOfInfinityE.schemaIn

/-- `coalesced-single-individual-root`: □Axiom of Infinity (type t) fails. -/
def Models.coalesced_single_individual_root.necessary_axiom_of_infinity_t : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.singleIndividualData)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.singleIndividualData)).HoldsAx Classicism.P.NecAxiomOfInfinityT.schemaIn

/-- `coalesced-single-individual-root`: Self-Atomicity (type t) fails. -/
def Models.coalesced_single_individual_root.self_atomicity_t : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.singleIndividualData)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.singleIndividualData)).HoldsAx Classicism.P.SelfAtomicityT.schemaIn

/-- `coalesced-single-individual-root`: Atoms are self-atoms (type t) fails. -/
def Models.coalesced_single_individual_root.atoms_are_self_atoms_t : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.singleIndividualData)).IsModel ∧ ¬ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.singleIndividualData)).HoldsAx Classicism.P.AtomsAreSelfAtomsT.schemaIn

/-- `coalesced-single-individual-root`: Truths are ND-necessary holds. -/
def Models.coalesced_single_individual_root.truths_are_nd_necessary : Prop :=
  (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.singleIndividualData)).IsModel ∧ (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.singleIndividualData)).HoldsAx Classicism.P.TruthsAreNDNecessary.schemaIn

/-- `coalesced-substitutions-fullest-root`: Relational Choice holds. -/
def Models.coalesced_substitutions_fullest_root.relational_choice_r : Prop :=
  (Classicism.Meta.Coalesced.substitutionsFullestRoot).IsModel ∧ (Classicism.Meta.Coalesced.substitutionsFullestRoot).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `coalesced-substitutions-fullest-root`: □Vicinity fails. -/
def Models.coalesced_substitutions_fullest_root.necessary_vicinity : Prop :=
  (Classicism.Meta.Coalesced.substitutionsFullestRoot).IsModel ∧ ¬ (Classicism.Meta.Coalesced.substitutionsFullestRoot).HoldsAx Classicism.P.NecVicinity.schemaIn

/-- `coalesced-substitutions-fullest-root`: □Weakly Inextensible Comprehension fails. -/
def Models.coalesced_substitutions_fullest_root.necessary_weakly_inextensible_comprehension_r : Prop :=
  (Classicism.Meta.Coalesced.substitutionsFullestRoot).IsModel ∧ ¬ (Classicism.Meta.Coalesced.substitutionsFullestRoot).HoldsAx Classicism.P.NecWeaklyInextensibleComprehension.schemaIn

/-- `coalesced-substitutions-fullest-root`: □Transversal fails. -/
def Models.coalesced_substitutions_fullest_root.necessary_transversal_r : Prop :=
  (Classicism.Meta.Coalesced.substitutionsFullestRoot).IsModel ∧ ¬ (Classicism.Meta.Coalesced.substitutionsFullestRoot).HoldsAx Classicism.P.NecTransversal.schemaIn

/-- `coalesced-substitutions-fullest-root`: Arithmetic Necessitism holds. -/
def Models.coalesced_substitutions_fullest_root.arithmetic_necessitism : Prop :=
  (Classicism.Meta.Coalesced.substitutionsFullestRoot).IsModel ∧ (Classicism.Meta.Coalesced.substitutionsFullestRoot).HoldsAx Classicism.P.ArithmeticNecessitism.schemaIn

/-- `coalesced-substitutions-fullest-root`: □Axiom of Infinity (type e) fails. -/
def Models.coalesced_substitutions_fullest_root.necessary_axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Coalesced.substitutionsFullestRoot).IsModel ∧ ¬ (Classicism.Meta.Coalesced.substitutionsFullestRoot).HoldsAx Classicism.P.NecAxiomOfInfinityE.schemaIn

/-- `coalesced-substitutions-fullest-root`: □Axiom of Infinity (type t) fails. -/
def Models.coalesced_substitutions_fullest_root.necessary_axiom_of_infinity_t : Prop :=
  (Classicism.Meta.Coalesced.substitutionsFullestRoot).IsModel ∧ ¬ (Classicism.Meta.Coalesced.substitutionsFullestRoot).HoldsAx Classicism.P.NecAxiomOfInfinityT.schemaIn

/-- `finite-support-dyadic-roundings`: Actuality holds. -/
def Models.finite_support_dyadic_roundings.actuality : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pow2)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pow2)).HoldsAx Classicism.P.Actuality.schemaIn

/-- `finite-support-dyadic-roundings`: No Pure Contingency holds. -/
def Models.finite_support_dyadic_roundings.no_pure_contingency_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pow2)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pow2)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `finite-support-dyadic-roundings`: Transversal Choice holds. -/
def Models.finite_support_dyadic_roundings.transversal_choice_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pow2)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pow2)).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- `finite-support-dyadic-roundings`: Independence (signature Σ) fails. -/
def Models.finite_support_dyadic_roundings.independence_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pow2)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pow2))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pow2)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pow2))).IsModel ∧ ¬ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pow2)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pow2))).HoldsAx (Classicism.Meta.AxiomSet.independence _)

/-- `finite-support-dyadic-roundings`: No Contingency (signature Σ) holds. -/
def Models.finite_support_dyadic_roundings.no_contingency_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pow2)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pow2))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pow2)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pow2))).IsModel ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pow2)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pow2))).HoldsAx (Classicism.Meta.AxiomSet.noContingency _)

/-- `finite-support-dyadic-roundings-sigma-true-atom`: BF fails. -/
def Models.finite_support_dyadic_roundings_sigma_true_atom.barcan_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pow2)).IsModel ∧ ¬ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pow2)).HoldsAx Classicism.P.Barcan.schemaIn

/-- `finite-support-dyadic-roundings-sigma-true-atom`: Boolean Completeness fails. -/
def Models.finite_support_dyadic_roundings_sigma_true_atom.boolean_completeness_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pow2)).IsModel ∧ ¬ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pow2)).HoldsAx Classicism.P.BooleanCompleteness.schemaIn

/-- `finite-support-dyadic-roundings-sigma-true-atom`: Actuality holds. -/
def Models.finite_support_dyadic_roundings_sigma_true_atom.actuality : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pow2)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pow2)).HoldsAx Classicism.P.Actuality.schemaIn

/-- `finite-support-dyadic-roundings-sigma-true-atom`: No Pure Contingency holds. -/
def Models.finite_support_dyadic_roundings_sigma_true_atom.no_pure_contingency_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pow2)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pow2)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `finite-support-dyadic-roundings-sigma-true-atom`: Transversal Choice holds. -/
def Models.finite_support_dyadic_roundings_sigma_true_atom.transversal_choice_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pow2)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pow2)).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- `finite-support-identity-or-collapse-surjections`: Actuality holds. -/
def Models.finite_support_identity_or_collapse_surjections.actuality : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)).HoldsAx Classicism.P.Actuality.schemaIn

/-- `finite-support-identity-or-collapse-surjections`: Atomicity fails. -/
def Models.finite_support_identity_or_collapse_surjections.atomicity_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)).IsModel ∧ ¬ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)).HoldsAx Classicism.P.Atomicity.schemaIn

/-- `finite-support-identity-or-collapse-surjections`: Atomicity (type t) fails. -/
def Models.finite_support_identity_or_collapse_surjections.atomicity_t : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)).IsModel ∧ ¬ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)).HoldsAx Classicism.P.AtomicityT.schemaIn

/-- `finite-support-identity-or-collapse-surjections`: BF holds. -/
def Models.finite_support_identity_or_collapse_surjections.barcan_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)).HoldsAx Classicism.P.Barcan.schemaIn

/-- `finite-support-identity-or-collapse-surjections`: No Pure Contingency holds. -/
def Models.finite_support_identity_or_collapse_surjections.no_pure_contingency_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `finite-support-identity-or-collapse-surjections`: Transversal Choice holds. -/
def Models.finite_support_identity_or_collapse_surjections.transversal_choice_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- `finite-support-identity-or-collapse-surjections`: Independence (signature Σ) fails. -/
def Models.finite_support_identity_or_collapse_surjections.independence_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj01))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj01))).IsModel ∧ ¬ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj01))).HoldsAx (Classicism.Meta.AxiomSet.independence _)

/-- `finite-support-identity-or-collapse-surjections`: No Contingency (signature Σ) holds. -/
def Models.finite_support_identity_or_collapse_surjections.no_contingency_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj01))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj01))).IsModel ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj01))).HoldsAx (Classicism.Meta.AxiomSet.noContingency _)

/-- `finite-support-identity-or-collapse-surjections-sigma-true-atom`: Boolean Completeness fails. -/
def Models.finite_support_identity_or_collapse_surjections_sigma_true_atom.boolean_completeness_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)).IsModel ∧ ¬ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)).HoldsAx Classicism.P.BooleanCompleteness.schemaIn

/-- `finite-support-identity-or-collapse-surjections-sigma-true-atom`: Actuality holds. -/
def Models.finite_support_identity_or_collapse_surjections_sigma_true_atom.actuality : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)).HoldsAx Classicism.P.Actuality.schemaIn

/-- `finite-support-identity-or-collapse-surjections-sigma-true-atom`: Atomicity fails. -/
def Models.finite_support_identity_or_collapse_surjections_sigma_true_atom.atomicity_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)).IsModel ∧ ¬ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)).HoldsAx Classicism.P.Atomicity.schemaIn

/-- `finite-support-identity-or-collapse-surjections-sigma-true-atom`: Atomicity (type t) fails. -/
def Models.finite_support_identity_or_collapse_surjections_sigma_true_atom.atomicity_t : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)).IsModel ∧ ¬ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)).HoldsAx Classicism.P.AtomicityT.schemaIn

/-- `finite-support-identity-or-collapse-surjections-sigma-true-atom`: BF holds. -/
def Models.finite_support_identity_or_collapse_surjections_sigma_true_atom.barcan_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)).HoldsAx Classicism.P.Barcan.schemaIn

/-- `finite-support-identity-or-collapse-surjections-sigma-true-atom`: No Pure Contingency holds. -/
def Models.finite_support_identity_or_collapse_surjections_sigma_true_atom.no_pure_contingency_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `finite-support-identity-or-collapse-surjections-sigma-true-atom`: Transversal Choice holds. -/
def Models.finite_support_identity_or_collapse_surjections_sigma_true_atom.transversal_choice_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- `finite-support-identity-or-collapse`: Actuality holds. -/
def Models.finite_support_identity_or_collapse.actuality : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono01)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono01)).HoldsAx Classicism.P.Actuality.schemaIn

/-- `finite-support-identity-or-collapse`: Atomicity fails. -/
def Models.finite_support_identity_or_collapse.atomicity_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono01)).IsModel ∧ ¬ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono01)).HoldsAx Classicism.P.Atomicity.schemaIn

/-- `finite-support-identity-or-collapse`: Atomicity (type t) fails. -/
def Models.finite_support_identity_or_collapse.atomicity_t : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono01)).IsModel ∧ ¬ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono01)).HoldsAx Classicism.P.AtomicityT.schemaIn

/-- `finite-support-identity-or-collapse`: BF fails. -/
def Models.finite_support_identity_or_collapse.barcan_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono01)).IsModel ∧ ¬ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono01)).HoldsAx Classicism.P.Barcan.schemaIn

/-- `finite-support-identity-or-collapse`: No Pure Contingency holds. -/
def Models.finite_support_identity_or_collapse.no_pure_contingency_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono01)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono01)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `finite-support-identity-or-collapse`: Transversal Choice holds. -/
def Models.finite_support_identity_or_collapse.transversal_choice_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono01)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono01)).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- `finite-support-identity-or-collapse`: Independence (signature Σ) fails. -/
def Models.finite_support_identity_or_collapse.independence_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono01)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono01))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono01)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono01))).IsModel ∧ ¬ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono01)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono01))).HoldsAx (Classicism.Meta.AxiomSet.independence _)

/-- `finite-support-identity-or-collapse`: No Contingency (signature Σ) holds. -/
def Models.finite_support_identity_or_collapse.no_contingency_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono01)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono01))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono01)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono01))).IsModel ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono01)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono01))).HoldsAx (Classicism.Meta.AxiomSet.noContingency _)

/-- `finite-support-identity-or-collapse-sigma-true-atom`: Boolean Completeness fails. -/
def Models.finite_support_identity_or_collapse_sigma_true_atom.boolean_completeness_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono01)).IsModel ∧ ¬ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono01)).HoldsAx Classicism.P.BooleanCompleteness.schemaIn

/-- `finite-support-identity-or-collapse-sigma-true-atom`: Actuality holds. -/
def Models.finite_support_identity_or_collapse_sigma_true_atom.actuality : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono01)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono01)).HoldsAx Classicism.P.Actuality.schemaIn

/-- `finite-support-identity-or-collapse-sigma-true-atom`: Atomicity fails. -/
def Models.finite_support_identity_or_collapse_sigma_true_atom.atomicity_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono01)).IsModel ∧ ¬ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono01)).HoldsAx Classicism.P.Atomicity.schemaIn

/-- `finite-support-identity-or-collapse-sigma-true-atom`: Atomicity (type t) fails. -/
def Models.finite_support_identity_or_collapse_sigma_true_atom.atomicity_t : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono01)).IsModel ∧ ¬ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono01)).HoldsAx Classicism.P.AtomicityT.schemaIn

/-- `finite-support-identity-or-collapse-sigma-true-atom`: BF fails. -/
def Models.finite_support_identity_or_collapse_sigma_true_atom.barcan_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono01)).IsModel ∧ ¬ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono01)).HoldsAx Classicism.P.Barcan.schemaIn

/-- `finite-support-identity-or-collapse-sigma-true-atom`: No Pure Contingency holds. -/
def Models.finite_support_identity_or_collapse_sigma_true_atom.no_pure_contingency_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono01)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono01)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `finite-support-identity-or-collapse-sigma-true-atom`: Transversal Choice holds. -/
def Models.finite_support_identity_or_collapse_sigma_true_atom.transversal_choice_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono01)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono01)).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- `finite-support-monotone-maps`: BF fails. -/
def Models.finite_support_monotone_maps.barcan_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono)).IsModel ∧ ¬ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono)).HoldsAx Classicism.P.Barcan.schemaIn

/-- `finite-support-monotone-maps`: No Pure Contingency holds. -/
def Models.finite_support_monotone_maps.no_pure_contingency_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `finite-support-monotone-maps`: Transversal Choice holds. -/
def Models.finite_support_monotone_maps.transversal_choice_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono)).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- `finite-support-monotone-maps-sigma-top`: Atomlessness holds. -/
def Models.finite_support_monotone_maps_sigma_top.atomlessness : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono)).HoldsAx Classicism.P.Atomlessness.schemaIn

/-- `finite-support-monotone-maps-sigma-top`: Boolean Completeness fails. -/
def Models.finite_support_monotone_maps_sigma_top.boolean_completeness_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono)).IsModel ∧ ¬ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono)).HoldsAx Classicism.P.BooleanCompleteness.schemaIn

/-- `finite-support-monotone-maps-sigma-top`: BF fails. -/
def Models.finite_support_monotone_maps_sigma_top.barcan_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono)).IsModel ∧ ¬ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono)).HoldsAx Classicism.P.Barcan.schemaIn

/-- `finite-support-monotone-maps-sigma-top`: No Pure Contingency holds. -/
def Models.finite_support_monotone_maps_sigma_top.no_pure_contingency_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `finite-support-monotone-maps-sigma-top`: Transversal Choice holds. -/
def Models.finite_support_monotone_maps_sigma_top.transversal_choice_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono)).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- `finite-support-monotone-maps-sigma-top`: Independence (signature Σ) fails. -/
def Models.finite_support_monotone_maps_sigma_top.independence_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono))).IsModel ∧ ¬ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono))).HoldsAx (Classicism.Meta.AxiomSet.independence _)

/-- `finite-support-monotone-maps-sigma-top`: No Contingency (signature Σ) holds. -/
def Models.finite_support_monotone_maps_sigma_top.no_contingency_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono))).IsModel ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono))).HoldsAx (Classicism.Meta.AxiomSet.noContingency _)

/-- `finite-support-monotone-surjections`: BF holds. -/
def Models.finite_support_monotone_surjections.barcan_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj)).HoldsAx Classicism.P.Barcan.schemaIn

/-- `finite-support-monotone-surjections`: No Pure Contingency holds. -/
def Models.finite_support_monotone_surjections.no_pure_contingency_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `finite-support-monotone-surjections`: Transversal Choice holds. -/
def Models.finite_support_monotone_surjections.transversal_choice_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj)).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- `finite-support-monotone-surjections`: Independence (signature Σ) fails. -/
def Models.finite_support_monotone_surjections.independence_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj))).IsModel ∧ ¬ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj))).HoldsAx (Classicism.Meta.AxiomSet.independence _)

/-- `finite-support-monotone-surjections`: No Contingency (signature Σ) holds. -/
def Models.finite_support_monotone_surjections.no_contingency_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj))).IsModel ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj))).HoldsAx (Classicism.Meta.AxiomSet.noContingency _)

/-- `finite-support-pair-injections-or-collapses`: No Pure Contingency holds. -/
def Models.finite_support_pair_injections_or_collapses.no_pure_contingency_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pairInjCol)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pairInjCol)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `finite-support-pair-injections-or-collapses`: Transversal Choice holds. -/
def Models.finite_support_pair_injections_or_collapses.transversal_choice_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pairInjCol)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pairInjCol)).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- `finite-support-pair-injections-or-collapses`: Independence (signature Σ) fails. -/
def Models.finite_support_pair_injections_or_collapses.independence_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pairInjCol)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pairInjCol))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pairInjCol)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pairInjCol))).IsModel ∧ ¬ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pairInjCol)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pairInjCol))).HoldsAx (Classicism.Meta.AxiomSet.independence _)

/-- `finite-support-pair-injections-or-collapses`: No Contingency (signature Σ) holds. -/
def Models.finite_support_pair_injections_or_collapses.no_contingency_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pairInjCol)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pairInjCol))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pairInjCol)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pairInjCol))).IsModel ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pairInjCol)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pairInjCol))).HoldsAx (Classicism.Meta.AxiomSet.noContingency _)

/-- `finite-support-permutations`: No Pure Contingency holds. -/
def Models.finite_support_permutations.no_pure_contingency_r : Prop :=
  (Classicism.Meta.Intensional.Perms.model).IsModel ∧ (Classicism.Meta.Intensional.Perms.model).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `finite-support-permutations`: Transversal Choice holds. -/
def Models.finite_support_permutations.transversal_choice_r : Prop :=
  (Classicism.Meta.Intensional.Perms.model).IsModel ∧ (Classicism.Meta.Intensional.Perms.model).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- `finite-support-permutations`: Independence (signature Σ) fails. -/
def Models.finite_support_permutations.independence_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.Perms.model) (Classicism.Meta.Intensional.Perms.model_isModel)).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.Perms.model) (Classicism.Meta.Intensional.Perms.model_isModel)).IsModel ∧ ¬ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.Perms.model) (Classicism.Meta.Intensional.Perms.model_isModel)).HoldsAx (Classicism.Meta.AxiomSet.independence _)

/-- `finite-support-permutations`: No Contingency (signature Σ) holds. -/
def Models.finite_support_permutations.no_contingency_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.Perms.model) (Classicism.Meta.Intensional.Perms.model_isModel)).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.Perms.model) (Classicism.Meta.Intensional.Perms.model_isModel)).IsModel ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.Perms.model) (Classicism.Meta.Intensional.Perms.model_isModel)).HoldsAx (Classicism.Meta.AxiomSet.noContingency _)

/-- `finite-support-truncated-shifts`: Actuality holds. -/
def Models.finite_support_truncated_shifts.actuality : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.shifts)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.shifts)).HoldsAx Classicism.P.Actuality.schemaIn

/-- `finite-support-truncated-shifts`: BF holds. -/
def Models.finite_support_truncated_shifts.barcan_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.shifts)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.shifts)).HoldsAx Classicism.P.Barcan.schemaIn

/-- `finite-support-truncated-shifts`: No Pure Contingency holds. -/
def Models.finite_support_truncated_shifts.no_pure_contingency_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.shifts)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.shifts)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `finite-support-truncated-shifts`: Transversal Choice holds. -/
def Models.finite_support_truncated_shifts.transversal_choice_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.shifts)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.shifts)).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- `finite-support-truncated-shifts`: Independence (signature Σ) fails. -/
def Models.finite_support_truncated_shifts.independence_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.shifts)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.shifts))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.shifts)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.shifts))).IsModel ∧ ¬ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.shifts)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.shifts))).HoldsAx (Classicism.Meta.AxiomSet.independence _)

/-- `finite-support-truncated-shifts`: No Contingency (signature Σ) holds. -/
def Models.finite_support_truncated_shifts.no_contingency_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.shifts)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.shifts))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.shifts)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.shifts))).IsModel ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.shifts)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.shifts))).HoldsAx (Classicism.Meta.AxiomSet.noContingency _)

/-- `finite-support-truncated-shifts-sigma-true-atom`: Boolean Completeness fails. -/
def Models.finite_support_truncated_shifts_sigma_true_atom.boolean_completeness_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.shifts)).IsModel ∧ ¬ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.shifts)).HoldsAx Classicism.P.BooleanCompleteness.schemaIn

/-- `finite-support-truncated-shifts-sigma-true-atom`: Actuality holds. -/
def Models.finite_support_truncated_shifts_sigma_true_atom.actuality : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.shifts)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.shifts)).HoldsAx Classicism.P.Actuality.schemaIn

/-- `finite-support-truncated-shifts-sigma-true-atom`: BF holds. -/
def Models.finite_support_truncated_shifts_sigma_true_atom.barcan_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.shifts)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.shifts)).HoldsAx Classicism.P.Barcan.schemaIn

/-- `finite-support-truncated-shifts-sigma-true-atom`: No Pure Contingency holds. -/
def Models.finite_support_truncated_shifts_sigma_true_atom.no_pure_contingency_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.shifts)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.shifts)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `finite-support-truncated-shifts-sigma-true-atom`: Transversal Choice holds. -/
def Models.finite_support_truncated_shifts_sigma_true_atom.transversal_choice_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.shifts)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.shifts)).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- `finite-support-truncations`: No Pure Contingency holds. -/
def Models.finite_support_truncations.no_pure_contingency_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.truncs)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.truncs)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `finite-support-truncations`: Transversal Choice holds. -/
def Models.finite_support_truncations.transversal_choice_r : Prop :=
  (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.truncs)).IsModel ∧ (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.truncs)).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- `finite-support-truncations`: Independence (signature Σ) fails. -/
def Models.finite_support_truncations.independence_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.truncs)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.truncs))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.truncs)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.truncs))).IsModel ∧ ¬ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.truncs)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.truncs))).HoldsAx (Classicism.Meta.AxiomSet.independence _)

/-- `finite-support-truncations`: No Contingency (signature Σ) holds. -/
def Models.finite_support_truncations.no_contingency_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.truncs)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.truncs))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.truncs)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.truncs))).IsModel ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.truncs)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.truncs))).HoldsAx (Classicism.Meta.AxiomSet.noContingency _)

/-- `full-double-retraction-glued-constants`: □Atomicity holds. -/
def Models.full_double_retraction_glued_constants.necessary_atomicity_r : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)).IsModel ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)).HoldsAx Classicism.P.NecAtomicity.schemaIn

/-- `full-double-retraction-glued-constants`: □Rigid Comprehension holds. -/
def Models.full_double_retraction_glued_constants.necessary_rigid_comprehension_r : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)).IsModel ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)).HoldsAx Classicism.P.NecRigidComprehension.schemaIn

/-- `full-double-retraction-glued-constants`: Axiom of Infinity (type t) holds. -/
def Models.full_double_retraction_glued_constants.axiom_of_infinity_t : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)).IsModel ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)).HoldsAx Classicism.P.AxiomOfInfinityT.schemaIn

/-- `full-double-retraction-glued-constants`: Infinity Schema (type t) holds. -/
def Models.full_double_retraction_glued_constants.infinity_t : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)).IsModel ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityT)

/-- `full-double-retraction-glued-constants`: Truths are ND-necessary fails. -/
def Models.full_double_retraction_glued_constants.truths_are_nd_necessary : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)).IsModel ∧ ¬ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)).HoldsAx Classicism.P.TruthsAreNDNecessary.schemaIn

/-- `full-double-retraction-glued-constants`: Strong Atomicity (type t) fails. -/
def Models.full_double_retraction_glued_constants.strong_atomicity_t : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)).IsModel ∧ ¬ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)).HoldsAx Classicism.P.StrongAtomicityT.schemaIn

/-- `full-double-retraction-glued-constants`: Fregean Axiom fails. -/
def Models.full_double_retraction_glued_constants.fregean_axiom : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)).IsModel ∧ ¬ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)).HoldsAx Classicism.P.FregeanAxiom.schemaIn

/-- `full-double-retraction-glued-constants`: Infinity Schema (type e) fails. -/
def Models.full_double_retraction_glued_constants.infinity_e : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)).IsModel ∧ ¬ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityE)

/-- `full-double-retraction-glued-constants`: Axiom of Infinity (type e) fails. -/
def Models.full_double_retraction_glued_constants.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)).IsModel ∧ ¬ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `full-double-retraction-glued-constants`: Possible Infinity (type e) fails. -/
def Models.full_double_retraction_glued_constants.possible_infinity_e : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)).IsModel ∧ ¬ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)).HoldsAx Classicism.P.PossibleInfinityE.schemaIn

/-- `full-double-retraction-glued-constants`: □Relational Choice holds. -/
def Models.full_double_retraction_glued_constants.necessary_relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)).IsModel ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)).HoldsAx Classicism.P.NecRelationalChoice.schemaIn

/-- `full-double-retraction-glued-constants`: Relational Choice holds. -/
def Models.full_double_retraction_glued_constants.relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)).IsModel ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `full-double-retraction-glued-constants`: Strong Actuality fails. -/
def Models.full_double_retraction_glued_constants.strong_actuality : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)).IsModel ∧ ¬ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)).HoldsAx Classicism.P.StrongActuality.schemaIn

/-- `full-double-retraction-glued-constants`: Transversal Choice holds. -/
def Models.full_double_retraction_glued_constants.transversal_choice_r : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)).IsModel ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- `full-double-retraction-glued-constants`: ND (type t) fails. -/
def Models.full_double_retraction_glued_constants.distinctness_necessary_t : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)).IsModel ∧ ¬ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)).HoldsAx Classicism.P.NecessityOfDistinctnessT.schemaIn

/-- `full-free-monoid-glued-constants-singleton`: □Atomicity holds. -/
def Models.full_free_monoid_glued_constants_singleton.necessary_atomicity_r : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)).IsModel ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)).HoldsAx Classicism.P.NecAtomicity.schemaIn

/-- `full-free-monoid-glued-constants-singleton`: □Rigid Comprehension holds. -/
def Models.full_free_monoid_glued_constants_singleton.necessary_rigid_comprehension_r : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)).IsModel ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)).HoldsAx Classicism.P.NecRigidComprehension.schemaIn

/-- `full-free-monoid-glued-constants-singleton`: Axiom of Infinity (type t) holds. -/
def Models.full_free_monoid_glued_constants_singleton.axiom_of_infinity_t : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)).IsModel ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)).HoldsAx Classicism.P.AxiomOfInfinityT.schemaIn

/-- `full-free-monoid-glued-constants-singleton`: Infinity Schema (type t) holds. -/
def Models.full_free_monoid_glued_constants_singleton.infinity_t : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)).IsModel ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityT)

/-- `full-free-monoid-glued-constants-singleton`: Truths are ND-necessary holds. -/
def Models.full_free_monoid_glued_constants_singleton.truths_are_nd_necessary : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)).IsModel ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)).HoldsAx Classicism.P.TruthsAreNDNecessary.schemaIn

/-- `full-free-monoid-glued-constants-singleton`: No Pure Contingency holds. -/
def Models.full_free_monoid_glued_constants_singleton.no_pure_contingency_r : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)).IsModel ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `full-free-monoid-glued-constants-singleton`: Infinity Schema (type e) fails. -/
def Models.full_free_monoid_glued_constants_singleton.infinity_e : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)).IsModel ∧ ¬ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityE)

/-- `full-free-monoid-glued-constants-singleton`: Axiom of Infinity (type e) fails. -/
def Models.full_free_monoid_glued_constants_singleton.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)).IsModel ∧ ¬ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `full-free-monoid-glued-constants-singleton`: Possible Infinity (type e) fails. -/
def Models.full_free_monoid_glued_constants_singleton.possible_infinity_e : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)).IsModel ∧ ¬ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)).HoldsAx Classicism.P.PossibleInfinityE.schemaIn

/-- `full-free-monoid-glued-constants-singleton`: □Relational Choice holds. -/
def Models.full_free_monoid_glued_constants_singleton.necessary_relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)).IsModel ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)).HoldsAx Classicism.P.NecRelationalChoice.schemaIn

/-- `full-free-monoid-glued-constants-singleton`: Relational Choice holds. -/
def Models.full_free_monoid_glued_constants_singleton.relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)).IsModel ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `full-free-monoid-glued-constants-singleton`: Transversal Choice holds. -/
def Models.full_free_monoid_glued_constants_singleton.transversal_choice_r : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)).IsModel ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- `full-free-monoid-glued-constants-singleton`: ND (type t) fails. -/
def Models.full_free_monoid_glued_constants_singleton.distinctness_necessary_t : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)).IsModel ∧ ¬ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)).HoldsAx Classicism.P.NecessityOfDistinctnessT.schemaIn

/-- `full-free-monoid-glued-constants`: □Atomicity holds. -/
def Models.full_free_monoid_glued_constants.necessary_atomicity_r : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidThread)).IsModel ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidThread)).HoldsAx Classicism.P.NecAtomicity.schemaIn

/-- `full-free-monoid-glued-constants`: □Rigid Comprehension holds. -/
def Models.full_free_monoid_glued_constants.necessary_rigid_comprehension_r : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidThread)).IsModel ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidThread)).HoldsAx Classicism.P.NecRigidComprehension.schemaIn

/-- `full-free-monoid-glued-constants`: Axiom of Infinity (type t) holds. -/
def Models.full_free_monoid_glued_constants.axiom_of_infinity_t : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidThread)).IsModel ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidThread)).HoldsAx Classicism.P.AxiomOfInfinityT.schemaIn

/-- `full-free-monoid-glued-constants`: Infinity Schema (type t) holds. -/
def Models.full_free_monoid_glued_constants.infinity_t : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidThread)).IsModel ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidThread)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityT)

/-- `full-free-monoid-glued-constants`: Truths are ND-necessary holds. -/
def Models.full_free_monoid_glued_constants.truths_are_nd_necessary : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidThread)).IsModel ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidThread)).HoldsAx Classicism.P.TruthsAreNDNecessary.schemaIn

/-- `full-free-monoid-glued-constants`: No Pure Contingency holds. -/
def Models.full_free_monoid_glued_constants.no_pure_contingency_r : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidThread)).IsModel ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidThread)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `full-free-monoid-glued-constants`: □Relational Choice holds. -/
def Models.full_free_monoid_glued_constants.necessary_relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidThread)).IsModel ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidThread)).HoldsAx Classicism.P.NecRelationalChoice.schemaIn

/-- `full-free-monoid-glued-constants`: Relational Choice holds. -/
def Models.full_free_monoid_glued_constants.relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidThread)).IsModel ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidThread)).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `full-free-monoid-glued-constants`: Transversal Choice holds. -/
def Models.full_free_monoid_glued_constants.transversal_choice_r : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidThread)).IsModel ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidThread)).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- `full-free-monoid-glued-constants`: ND (type t) fails. -/
def Models.full_free_monoid_glued_constants.distinctness_necessary_t : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidThread)).IsModel ∧ ¬ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidThread)).HoldsAx Classicism.P.NecessityOfDistinctnessT.schemaIn

/-- `full-free-product-glued-constants`: □Atomicity holds. -/
def Models.full_free_product_glued_constants.necessary_atomicity_r : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)).IsModel ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)).HoldsAx Classicism.P.NecAtomicity.schemaIn

/-- `full-free-product-glued-constants`: □Rigid Comprehension holds. -/
def Models.full_free_product_glued_constants.necessary_rigid_comprehension_r : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)).IsModel ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)).HoldsAx Classicism.P.NecRigidComprehension.schemaIn

/-- `full-free-product-glued-constants`: Axiom of Infinity (type t) holds. -/
def Models.full_free_product_glued_constants.axiom_of_infinity_t : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)).IsModel ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)).HoldsAx Classicism.P.AxiomOfInfinityT.schemaIn

/-- `full-free-product-glued-constants`: Infinity Schema (type t) holds. -/
def Models.full_free_product_glued_constants.infinity_t : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)).IsModel ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityT)

/-- `full-free-product-glued-constants`: Truths are ND-necessary fails. -/
def Models.full_free_product_glued_constants.truths_are_nd_necessary : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)).IsModel ∧ ¬ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)).HoldsAx Classicism.P.TruthsAreNDNecessary.schemaIn

/-- `full-free-product-glued-constants`: No Pure Contingency holds. -/
def Models.full_free_product_glued_constants.no_pure_contingency_r : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)).IsModel ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `full-free-product-glued-constants`: Strong Atomicity (type t) fails. -/
def Models.full_free_product_glued_constants.strong_atomicity_t : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)).IsModel ∧ ¬ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)).HoldsAx Classicism.P.StrongAtomicityT.schemaIn

/-- `full-free-product-glued-constants`: Fregean Axiom fails. -/
def Models.full_free_product_glued_constants.fregean_axiom : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)).IsModel ∧ ¬ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)).HoldsAx Classicism.P.FregeanAxiom.schemaIn

/-- `full-free-product-glued-constants`: Infinity Schema (type e) fails. -/
def Models.full_free_product_glued_constants.infinity_e : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)).IsModel ∧ ¬ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityE)

/-- `full-free-product-glued-constants`: Axiom of Infinity (type e) fails. -/
def Models.full_free_product_glued_constants.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)).IsModel ∧ ¬ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `full-free-product-glued-constants`: Possible Infinity (type e) fails. -/
def Models.full_free_product_glued_constants.possible_infinity_e : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)).IsModel ∧ ¬ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)).HoldsAx Classicism.P.PossibleInfinityE.schemaIn

/-- `full-free-product-glued-constants`: □Relational Choice holds. -/
def Models.full_free_product_glued_constants.necessary_relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)).IsModel ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)).HoldsAx Classicism.P.NecRelationalChoice.schemaIn

/-- `full-free-product-glued-constants`: Relational Choice holds. -/
def Models.full_free_product_glued_constants.relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)).IsModel ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `full-free-product-glued-constants`: Transversal Choice holds. -/
def Models.full_free_product_glued_constants.transversal_choice_r : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)).IsModel ∧ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- `full-free-product-glued-constants`: ND (type t) fails. -/
def Models.full_free_product_glued_constants.distinctness_necessary_t : Prop :=
  (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)).IsModel ∧ ¬ (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)).HoldsAx Classicism.P.NecessityOfDistinctnessT.schemaIn

/-- `full-henkin-finite-base`: Extensionality holds. -/
def Models.full_henkin_finite_base.extensionality_r : Prop :=
  (Classicism.Meta.Intensional.Henkin.model (Fin 2)).IsModel ∧ (Classicism.Meta.Intensional.Henkin.model (Fin 2)).HoldsAx Classicism.P.Extensionality.schemaIn

/-- `full-henkin-finite-base`: Functional Choice holds. -/
def Models.full_henkin_finite_base.functional_choice_r : Prop :=
  (Classicism.Meta.Intensional.Henkin.model (Fin 2)).IsModel ∧ (Classicism.Meta.Intensional.Henkin.model (Fin 2)).HoldsAx Classicism.P.FunctionalChoice.schemaIn

/-- `full-henkin-finite-base`: Infinity Schema (type e) fails. -/
def Models.full_henkin_finite_base.infinity_e : Prop :=
  (Classicism.Meta.Intensional.Henkin.model (Fin 2)).IsModel ∧ ¬ (Classicism.Meta.Intensional.Henkin.model (Fin 2)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityE)

/-- `full-henkin-finite-base`: Transversal Choice holds. -/
def Models.full_henkin_finite_base.transversal_choice_r : Prop :=
  (Classicism.Meta.Intensional.Henkin.model (Fin 2)).IsModel ∧ (Classicism.Meta.Intensional.Henkin.model (Fin 2)).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- `full-henkin-finite-base`: Independence (signature Σ) fails. -/
def Models.full_henkin_finite_base.independence_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.Henkin.model (Fin 2)) (Classicism.Meta.Intensional.Henkin.isModel (Fin 2))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.Henkin.model (Fin 2)) (Classicism.Meta.Intensional.Henkin.isModel (Fin 2))).IsModel ∧ ¬ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.Henkin.model (Fin 2)) (Classicism.Meta.Intensional.Henkin.isModel (Fin 2))).HoldsAx (Classicism.Meta.AxiomSet.independence _)

/-- `full-henkin-finite-base-sigma-independent`: Extensionality holds. -/
def Models.full_henkin_finite_base_sigma_independent.extensionality_r : Prop :=
  (Classicism.Meta.Intensional.Henkin.model (Fin 2)).IsModel ∧ (Classicism.Meta.Intensional.Henkin.model (Fin 2)).HoldsAx Classicism.P.Extensionality.schemaIn

/-- `full-henkin-finite-base-sigma-independent`: Functional Choice holds. -/
def Models.full_henkin_finite_base_sigma_independent.functional_choice_r : Prop :=
  (Classicism.Meta.Intensional.Henkin.model (Fin 2)).IsModel ∧ (Classicism.Meta.Intensional.Henkin.model (Fin 2)).HoldsAx Classicism.P.FunctionalChoice.schemaIn

/-- `full-henkin-finite-base-sigma-independent`: Infinity Schema (type e) fails. -/
def Models.full_henkin_finite_base_sigma_independent.infinity_e : Prop :=
  (Classicism.Meta.Intensional.Henkin.model (Fin 2)).IsModel ∧ ¬ (Classicism.Meta.Intensional.Henkin.model (Fin 2)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityE)

/-- `full-henkin-finite-base-sigma-independent`: Transversal Choice holds. -/
def Models.full_henkin_finite_base_sigma_independent.transversal_choice_r : Prop :=
  (Classicism.Meta.Intensional.Henkin.model (Fin 2)).IsModel ∧ (Classicism.Meta.Intensional.Henkin.model (Fin 2)).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- `full-henkin-infinite-base`: Extensionality holds. -/
def Models.full_henkin_infinite_base.extensionality_r : Prop :=
  (Classicism.Meta.Intensional.Henkin.model (ℕ)).IsModel ∧ (Classicism.Meta.Intensional.Henkin.model (ℕ)).HoldsAx Classicism.P.Extensionality.schemaIn

/-- `full-henkin-infinite-base`: Functional Choice holds. -/
def Models.full_henkin_infinite_base.functional_choice_r : Prop :=
  (Classicism.Meta.Intensional.Henkin.model (ℕ)).IsModel ∧ (Classicism.Meta.Intensional.Henkin.model (ℕ)).HoldsAx Classicism.P.FunctionalChoice.schemaIn

/-- `full-henkin-infinite-base`: Axiom of Infinity (type e) holds. -/
def Models.full_henkin_infinite_base.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.Henkin.model (ℕ)).IsModel ∧ (Classicism.Meta.Intensional.Henkin.model (ℕ)).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `full-henkin-infinite-base`: Infinity Schema (type e) holds. -/
def Models.full_henkin_infinite_base.infinity_e : Prop :=
  (Classicism.Meta.Intensional.Henkin.model (ℕ)).IsModel ∧ (Classicism.Meta.Intensional.Henkin.model (ℕ)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityE)

/-- `full-henkin-infinite-base`: Transversal Choice holds. -/
def Models.full_henkin_infinite_base.transversal_choice_r : Prop :=
  (Classicism.Meta.Intensional.Henkin.model (ℕ)).IsModel ∧ (Classicism.Meta.Intensional.Henkin.model (ℕ)).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- `full-henkin-infinite-base`: Independence (signature Σ) fails. -/
def Models.full_henkin_infinite_base.independence_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.Henkin.model (ℕ)) (Classicism.Meta.Intensional.Henkin.isModel (ℕ))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.Henkin.model (ℕ)) (Classicism.Meta.Intensional.Henkin.isModel (ℕ))).IsModel ∧ ¬ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.Henkin.model (ℕ)) (Classicism.Meta.Intensional.Henkin.isModel (ℕ))).HoldsAx (Classicism.Meta.AxiomSet.independence _)

/-- `full-henkin-infinite-base-sigma-independent`: Extensionality holds. -/
def Models.full_henkin_infinite_base_sigma_independent.extensionality_r : Prop :=
  (Classicism.Meta.Intensional.Henkin.model (ℕ)).IsModel ∧ (Classicism.Meta.Intensional.Henkin.model (ℕ)).HoldsAx Classicism.P.Extensionality.schemaIn

/-- `full-henkin-infinite-base-sigma-independent`: Functional Choice holds. -/
def Models.full_henkin_infinite_base_sigma_independent.functional_choice_r : Prop :=
  (Classicism.Meta.Intensional.Henkin.model (ℕ)).IsModel ∧ (Classicism.Meta.Intensional.Henkin.model (ℕ)).HoldsAx Classicism.P.FunctionalChoice.schemaIn

/-- `full-henkin-infinite-base-sigma-independent`: Axiom of Infinity (type e) holds. -/
def Models.full_henkin_infinite_base_sigma_independent.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.Henkin.model (ℕ)).IsModel ∧ (Classicism.Meta.Intensional.Henkin.model (ℕ)).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `full-henkin-infinite-base-sigma-independent`: Infinity Schema (type e) holds. -/
def Models.full_henkin_infinite_base_sigma_independent.infinity_e : Prop :=
  (Classicism.Meta.Intensional.Henkin.model (ℕ)).IsModel ∧ (Classicism.Meta.Intensional.Henkin.model (ℕ)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityE)

/-- `full-henkin-infinite-base-sigma-independent`: Transversal Choice holds. -/
def Models.full_henkin_infinite_base_sigma_independent.transversal_choice_r : Prop :=
  (Classicism.Meta.Intensional.Henkin.model (ℕ)).IsModel ∧ (Classicism.Meta.Intensional.Henkin.model (ℕ)).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- `full-henkin-singleton-base`: Extensionality holds. -/
def Models.full_henkin_singleton_base.extensionality_r : Prop :=
  (Classicism.Meta.Intensional.Henkin.model (Unit)).IsModel ∧ (Classicism.Meta.Intensional.Henkin.model (Unit)).HoldsAx Classicism.P.Extensionality.schemaIn

/-- `full-henkin-singleton-base`: Functional Choice holds. -/
def Models.full_henkin_singleton_base.functional_choice_r : Prop :=
  (Classicism.Meta.Intensional.Henkin.model (Unit)).IsModel ∧ (Classicism.Meta.Intensional.Henkin.model (Unit)).HoldsAx Classicism.P.FunctionalChoice.schemaIn

/-- `full-henkin-singleton-base`: Infinity Schema (type e) fails. -/
def Models.full_henkin_singleton_base.infinity_e : Prop :=
  (Classicism.Meta.Intensional.Henkin.model (Unit)).IsModel ∧ ¬ (Classicism.Meta.Intensional.Henkin.model (Unit)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityE)

/-- `full-henkin-singleton-base`: Axiom of Infinity (type e) fails. -/
def Models.full_henkin_singleton_base.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.Henkin.model (Unit)).IsModel ∧ ¬ (Classicism.Meta.Intensional.Henkin.model (Unit)).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `full-henkin-singleton-base`: Possible Infinity (type e) fails. -/
def Models.full_henkin_singleton_base.possible_infinity_e : Prop :=
  (Classicism.Meta.Intensional.Henkin.model (Unit)).IsModel ∧ ¬ (Classicism.Meta.Intensional.Henkin.model (Unit)).HoldsAx Classicism.P.PossibleInfinityE.schemaIn

/-- `full-henkin-singleton-base`: Transversal Choice holds. -/
def Models.full_henkin_singleton_base.transversal_choice_r : Prop :=
  (Classicism.Meta.Intensional.Henkin.model (Unit)).IsModel ∧ (Classicism.Meta.Intensional.Henkin.model (Unit)).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- `full-henkin-singleton-base`: Independence (signature Σ) fails. -/
def Models.full_henkin_singleton_base.independence_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.Henkin.model (Unit)) (Classicism.Meta.Intensional.Henkin.isModel (Unit))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.Henkin.model (Unit)) (Classicism.Meta.Intensional.Henkin.isModel (Unit))).IsModel ∧ ¬ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.Henkin.model (Unit)) (Classicism.Meta.Intensional.Henkin.isModel (Unit))).HoldsAx (Classicism.Meta.AxiomSet.independence _)

/-- `full-idempotent-monoid`: Possible Infinity (type t) fails. -/
def Models.full_idempotent_monoid.possible_infinity_t : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).HoldsAx Classicism.P.PossibleInfinityT.schemaIn

/-- `full-idempotent-monoid`: Infinity Schema (type t) fails. -/
def Models.full_idempotent_monoid.infinity_t : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityT)

/-- `full-idempotent-monoid`: Axiom of Infinity (type t) fails. -/
def Models.full_idempotent_monoid.axiom_of_infinity_t : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).HoldsAx Classicism.P.AxiomOfInfinityT.schemaIn

/-- `full-idempotent-monoid`: □Atomicity holds. -/
def Models.full_idempotent_monoid.necessary_atomicity_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).HoldsAx Classicism.P.NecAtomicity.schemaIn

/-- `full-idempotent-monoid`: □Rigid Comprehension holds. -/
def Models.full_idempotent_monoid.necessary_rigid_comprehension_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).HoldsAx Classicism.P.NecRigidComprehension.schemaIn

/-- `full-idempotent-monoid`: Truths are ND-necessary holds. -/
def Models.full_idempotent_monoid.truths_are_nd_necessary : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).HoldsAx Classicism.P.TruthsAreNDNecessary.schemaIn

/-- `full-idempotent-monoid`: No Pure Contingency holds. -/
def Models.full_idempotent_monoid.no_pure_contingency_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `full-idempotent-monoid`: Strong Atomicity (type t) fails. -/
def Models.full_idempotent_monoid.strong_atomicity_t : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).HoldsAx Classicism.P.StrongAtomicityT.schemaIn

/-- `full-idempotent-monoid`: Fregean Axiom fails. -/
def Models.full_idempotent_monoid.fregean_axiom : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).HoldsAx Classicism.P.FregeanAxiom.schemaIn

/-- `full-idempotent-monoid`: Infinity Schema (type e) fails. -/
def Models.full_idempotent_monoid.infinity_e : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityE)

/-- `full-idempotent-monoid`: Axiom of Infinity (type e) fails. -/
def Models.full_idempotent_monoid.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `full-idempotent-monoid`: Possible Infinity (type e) fails. -/
def Models.full_idempotent_monoid.possible_infinity_e : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).HoldsAx Classicism.P.PossibleInfinityE.schemaIn

/-- `full-idempotent-monoid`: □Relational Choice holds. -/
def Models.full_idempotent_monoid.necessary_relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).HoldsAx Classicism.P.NecRelationalChoice.schemaIn

/-- `full-idempotent-monoid`: Relational Choice holds. -/
def Models.full_idempotent_monoid.relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `full-idempotent-monoid`: Transversal Choice holds. -/
def Models.full_idempotent_monoid.transversal_choice_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- `full-idempotent-monoid`: ND (type t) fails. -/
def Models.full_idempotent_monoid.distinctness_necessary_t : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).HoldsAx Classicism.P.NecessityOfDistinctnessT.schemaIn

/-- `full-idempotent-monoid`: Independence (signature Σ) fails. -/
def Models.full_idempotent_monoid.independence_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem)).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem)).IsModel ∧ ¬ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem)).HoldsAx (Classicism.Meta.AxiomSet.independence _)

/-- `full-idempotent-monoid`: No Contingency (signature Σ) holds. -/
def Models.full_idempotent_monoid.no_contingency_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem)).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem)).IsModel ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem)).HoldsAx (Classicism.Meta.AxiomSet.noContingency _)

/-- `full-idempotent-monoid-sigma-true-atom`: Possible Infinity (type t) fails. -/
def Models.full_idempotent_monoid_sigma_true_atom.possible_infinity_t : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).HoldsAx Classicism.P.PossibleInfinityT.schemaIn

/-- `full-idempotent-monoid-sigma-true-atom`: Infinity Schema (type t) fails. -/
def Models.full_idempotent_monoid_sigma_true_atom.infinity_t : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityT)

/-- `full-idempotent-monoid-sigma-true-atom`: Axiom of Infinity (type t) fails. -/
def Models.full_idempotent_monoid_sigma_true_atom.axiom_of_infinity_t : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).HoldsAx Classicism.P.AxiomOfInfinityT.schemaIn

/-- `full-idempotent-monoid-sigma-true-atom`: □Atomicity holds. -/
def Models.full_idempotent_monoid_sigma_true_atom.necessary_atomicity_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).HoldsAx Classicism.P.NecAtomicity.schemaIn

/-- `full-idempotent-monoid-sigma-true-atom`: □Rigid Comprehension holds. -/
def Models.full_idempotent_monoid_sigma_true_atom.necessary_rigid_comprehension_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).HoldsAx Classicism.P.NecRigidComprehension.schemaIn

/-- `full-idempotent-monoid-sigma-true-atom`: Truths are ND-necessary holds. -/
def Models.full_idempotent_monoid_sigma_true_atom.truths_are_nd_necessary : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).HoldsAx Classicism.P.TruthsAreNDNecessary.schemaIn

/-- `full-idempotent-monoid-sigma-true-atom`: No Pure Contingency holds. -/
def Models.full_idempotent_monoid_sigma_true_atom.no_pure_contingency_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `full-idempotent-monoid-sigma-true-atom`: Strong Atomicity (type t) fails. -/
def Models.full_idempotent_monoid_sigma_true_atom.strong_atomicity_t : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).HoldsAx Classicism.P.StrongAtomicityT.schemaIn

/-- `full-idempotent-monoid-sigma-true-atom`: Fregean Axiom fails. -/
def Models.full_idempotent_monoid_sigma_true_atom.fregean_axiom : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).HoldsAx Classicism.P.FregeanAxiom.schemaIn

/-- `full-idempotent-monoid-sigma-true-atom`: Infinity Schema (type e) fails. -/
def Models.full_idempotent_monoid_sigma_true_atom.infinity_e : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityE)

/-- `full-idempotent-monoid-sigma-true-atom`: Axiom of Infinity (type e) fails. -/
def Models.full_idempotent_monoid_sigma_true_atom.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `full-idempotent-monoid-sigma-true-atom`: Possible Infinity (type e) fails. -/
def Models.full_idempotent_monoid_sigma_true_atom.possible_infinity_e : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).HoldsAx Classicism.P.PossibleInfinityE.schemaIn

/-- `full-idempotent-monoid-sigma-true-atom`: □Relational Choice holds. -/
def Models.full_idempotent_monoid_sigma_true_atom.necessary_relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).HoldsAx Classicism.P.NecRelationalChoice.schemaIn

/-- `full-idempotent-monoid-sigma-true-atom`: Relational Choice holds. -/
def Models.full_idempotent_monoid_sigma_true_atom.relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `full-idempotent-monoid-sigma-true-atom`: Transversal Choice holds. -/
def Models.full_idempotent_monoid_sigma_true_atom.transversal_choice_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- `full-idempotent-monoid-sigma-true-atom`: ND (type t) fails. -/
def Models.full_idempotent_monoid_sigma_true_atom.distinctness_necessary_t : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem).HoldsAx Classicism.P.NecessityOfDistinctnessT.schemaIn

/-- `full-involution-group`: Gallin Extensional Comprehension holds. -/
def Models.full_involution_group.gallin_extensional_comprehension_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).HoldsAx Classicism.P.GallinExtensionalComprehension.schemaIn

/-- `full-involution-group`: Possible Infinity (type t) fails. -/
def Models.full_involution_group.possible_infinity_t : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).HoldsAx Classicism.P.PossibleInfinityT.schemaIn

/-- `full-involution-group`: Infinity Schema (type t) fails. -/
def Models.full_involution_group.infinity_t : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityT)

/-- `full-involution-group`: Axiom of Infinity (type t) fails. -/
def Models.full_involution_group.axiom_of_infinity_t : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).HoldsAx Classicism.P.AxiomOfInfinityT.schemaIn

/-- `full-involution-group`: □Atomicity holds. -/
def Models.full_involution_group.necessary_atomicity_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).HoldsAx Classicism.P.NecAtomicity.schemaIn

/-- `full-involution-group`: □BF holds. -/
def Models.full_involution_group.necessary_barcan_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).HoldsAx Classicism.P.NecBarcan.schemaIn

/-- `full-involution-group`: □Rigid Comprehension holds. -/
def Models.full_involution_group.necessary_rigid_comprehension_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).HoldsAx Classicism.P.NecRigidComprehension.schemaIn

/-- `full-involution-group`: □ND holds. -/
def Models.full_involution_group.necessary_distinctness_necessary_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).HoldsAx Classicism.P.NecNecessityOfDistinctness.schemaIn

/-- `full-involution-group`: Truths are ND-necessary fails. -/
def Models.full_involution_group.truths_are_nd_necessary : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).HoldsAx Classicism.P.TruthsAreNDNecessary.schemaIn

/-- `full-involution-group`: No Pure Contingency holds. -/
def Models.full_involution_group.no_pure_contingency_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `full-involution-group`: Fregean Axiom fails. -/
def Models.full_involution_group.fregean_axiom : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).HoldsAx Classicism.P.FregeanAxiom.schemaIn

/-- `full-involution-group`: Infinity Schema (type e) fails. -/
def Models.full_involution_group.infinity_e : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityE)

/-- `full-involution-group`: Axiom of Infinity (type e) fails. -/
def Models.full_involution_group.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `full-involution-group`: Possible Infinity (type e) fails. -/
def Models.full_involution_group.possible_infinity_e : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).HoldsAx Classicism.P.PossibleInfinityE.schemaIn

/-- `full-involution-group`: □Relational Choice holds. -/
def Models.full_involution_group.necessary_relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).HoldsAx Classicism.P.NecRelationalChoice.schemaIn

/-- `full-involution-group`: Relational Choice holds. -/
def Models.full_involution_group.relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `full-involution-group`: Transversal Choice holds. -/
def Models.full_involution_group.transversal_choice_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- `full-involution-group`: Independence (signature Σ) fails. -/
def Models.full_involution_group.independence_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol)).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol)).IsModel ∧ ¬ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol)).HoldsAx (Classicism.Meta.AxiomSet.independence _)

/-- `full-involution-group`: No Contingency (signature Σ) holds. -/
def Models.full_involution_group.no_contingency_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol)).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol)).IsModel ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol)).HoldsAx (Classicism.Meta.AxiomSet.noContingency _)

/-- `full-involution-group-sigma-true-atom`: Gallin Extensional Comprehension holds. -/
def Models.full_involution_group_sigma_true_atom.gallin_extensional_comprehension_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).HoldsAx Classicism.P.GallinExtensionalComprehension.schemaIn

/-- `full-involution-group-sigma-true-atom`: Possible Infinity (type t) fails. -/
def Models.full_involution_group_sigma_true_atom.possible_infinity_t : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).HoldsAx Classicism.P.PossibleInfinityT.schemaIn

/-- `full-involution-group-sigma-true-atom`: Infinity Schema (type t) fails. -/
def Models.full_involution_group_sigma_true_atom.infinity_t : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityT)

/-- `full-involution-group-sigma-true-atom`: Axiom of Infinity (type t) fails. -/
def Models.full_involution_group_sigma_true_atom.axiom_of_infinity_t : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).HoldsAx Classicism.P.AxiomOfInfinityT.schemaIn

/-- `full-involution-group-sigma-true-atom`: □Atomicity holds. -/
def Models.full_involution_group_sigma_true_atom.necessary_atomicity_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).HoldsAx Classicism.P.NecAtomicity.schemaIn

/-- `full-involution-group-sigma-true-atom`: □BF holds. -/
def Models.full_involution_group_sigma_true_atom.necessary_barcan_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).HoldsAx Classicism.P.NecBarcan.schemaIn

/-- `full-involution-group-sigma-true-atom`: □Rigid Comprehension holds. -/
def Models.full_involution_group_sigma_true_atom.necessary_rigid_comprehension_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).HoldsAx Classicism.P.NecRigidComprehension.schemaIn

/-- `full-involution-group-sigma-true-atom`: □ND holds. -/
def Models.full_involution_group_sigma_true_atom.necessary_distinctness_necessary_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).HoldsAx Classicism.P.NecNecessityOfDistinctness.schemaIn

/-- `full-involution-group-sigma-true-atom`: Truths are ND-necessary fails. -/
def Models.full_involution_group_sigma_true_atom.truths_are_nd_necessary : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).HoldsAx Classicism.P.TruthsAreNDNecessary.schemaIn

/-- `full-involution-group-sigma-true-atom`: No Pure Contingency holds. -/
def Models.full_involution_group_sigma_true_atom.no_pure_contingency_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `full-involution-group-sigma-true-atom`: Fregean Axiom fails. -/
def Models.full_involution_group_sigma_true_atom.fregean_axiom : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).HoldsAx Classicism.P.FregeanAxiom.schemaIn

/-- `full-involution-group-sigma-true-atom`: Infinity Schema (type e) fails. -/
def Models.full_involution_group_sigma_true_atom.infinity_e : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityE)

/-- `full-involution-group-sigma-true-atom`: Axiom of Infinity (type e) fails. -/
def Models.full_involution_group_sigma_true_atom.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `full-involution-group-sigma-true-atom`: Possible Infinity (type e) fails. -/
def Models.full_involution_group_sigma_true_atom.possible_infinity_e : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).HoldsAx Classicism.P.PossibleInfinityE.schemaIn

/-- `full-involution-group-sigma-true-atom`: □Relational Choice holds. -/
def Models.full_involution_group_sigma_true_atom.necessary_relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).HoldsAx Classicism.P.NecRelationalChoice.schemaIn

/-- `full-involution-group-sigma-true-atom`: Relational Choice holds. -/
def Models.full_involution_group_sigma_true_atom.relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `full-involution-group-sigma-true-atom`: Transversal Choice holds. -/
def Models.full_involution_group_sigma_true_atom.transversal_choice_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- `full-permutation-group-infinite-set`: Gallin Extensional Comprehension holds. -/
def Models.full_permutation_group_infinite_set.gallin_extensional_comprehension_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).IsModel ∧ (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).HoldsAx Classicism.P.GallinExtensionalComprehension.schemaIn

/-- `full-permutation-group-infinite-set`: □Atomicity holds. -/
def Models.full_permutation_group_infinite_set.necessary_atomicity_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).IsModel ∧ (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).HoldsAx Classicism.P.NecAtomicity.schemaIn

/-- `full-permutation-group-infinite-set`: □BF holds. -/
def Models.full_permutation_group_infinite_set.necessary_barcan_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).IsModel ∧ (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).HoldsAx Classicism.P.NecBarcan.schemaIn

/-- `full-permutation-group-infinite-set`: □Rigid Comprehension holds. -/
def Models.full_permutation_group_infinite_set.necessary_rigid_comprehension_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).IsModel ∧ (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).HoldsAx Classicism.P.NecRigidComprehension.schemaIn

/-- `full-permutation-group-infinite-set`: Axiom of Infinity (type t) holds. -/
def Models.full_permutation_group_infinite_set.axiom_of_infinity_t : Prop :=
  (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).IsModel ∧ (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).HoldsAx Classicism.P.AxiomOfInfinityT.schemaIn

/-- `full-permutation-group-infinite-set`: Infinity Schema (type t) holds. -/
def Models.full_permutation_group_infinite_set.infinity_t : Prop :=
  (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).IsModel ∧ (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityT)

/-- `full-permutation-group-infinite-set`: □ND holds. -/
def Models.full_permutation_group_infinite_set.necessary_distinctness_necessary_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).IsModel ∧ (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).HoldsAx Classicism.P.NecNecessityOfDistinctness.schemaIn

/-- `full-permutation-group-infinite-set`: Truths are ND-necessary fails. -/
def Models.full_permutation_group_infinite_set.truths_are_nd_necessary : Prop :=
  (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).HoldsAx Classicism.P.TruthsAreNDNecessary.schemaIn

/-- `full-permutation-group-infinite-set`: No Pure Contingency holds. -/
def Models.full_permutation_group_infinite_set.no_pure_contingency_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).IsModel ∧ (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `full-permutation-group-infinite-set`: Fregean Axiom fails. -/
def Models.full_permutation_group_infinite_set.fregean_axiom : Prop :=
  (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).HoldsAx Classicism.P.FregeanAxiom.schemaIn

/-- `full-permutation-group-infinite-set`: Infinity Schema (type e) fails. -/
def Models.full_permutation_group_infinite_set.infinity_e : Prop :=
  (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityE)

/-- `full-permutation-group-infinite-set`: Axiom of Infinity (type e) fails. -/
def Models.full_permutation_group_infinite_set.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `full-permutation-group-infinite-set`: Possible Infinity (type e) fails. -/
def Models.full_permutation_group_infinite_set.possible_infinity_e : Prop :=
  (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).HoldsAx Classicism.P.PossibleInfinityE.schemaIn

/-- `full-permutation-group-infinite-set`: □Relational Choice holds. -/
def Models.full_permutation_group_infinite_set.necessary_relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).IsModel ∧ (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).HoldsAx Classicism.P.NecRelationalChoice.schemaIn

/-- `full-permutation-group-infinite-set`: Relational Choice holds. -/
def Models.full_permutation_group_infinite_set.relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).IsModel ∧ (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `full-permutation-group-infinite-set`: Transversal Choice holds. -/
def Models.full_permutation_group_infinite_set.transversal_choice_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).IsModel ∧ (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- `full-permutation-group-infinite-set`: Independence (signature Σ) fails. -/
def Models.full_permutation_group_infinite_set.independence_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ))).IsModel ∧ ¬ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ))).HoldsAx (Classicism.Meta.AxiomSet.independence _)

/-- `full-permutation-group-infinite-set`: No Contingency (signature Σ) holds. -/
def Models.full_permutation_group_infinite_set.no_contingency_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ))).IsModel ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ))).HoldsAx (Classicism.Meta.AxiomSet.noContingency _)

/-- `full-permutation-group-infinite-set-sigma-true-atom`: Gallin Extensional Comprehension holds. -/
def Models.full_permutation_group_infinite_set_sigma_true_atom.gallin_extensional_comprehension_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).IsModel ∧ (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).HoldsAx Classicism.P.GallinExtensionalComprehension.schemaIn

/-- `full-permutation-group-infinite-set-sigma-true-atom`: □Atomicity holds. -/
def Models.full_permutation_group_infinite_set_sigma_true_atom.necessary_atomicity_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).IsModel ∧ (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).HoldsAx Classicism.P.NecAtomicity.schemaIn

/-- `full-permutation-group-infinite-set-sigma-true-atom`: □BF holds. -/
def Models.full_permutation_group_infinite_set_sigma_true_atom.necessary_barcan_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).IsModel ∧ (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).HoldsAx Classicism.P.NecBarcan.schemaIn

/-- `full-permutation-group-infinite-set-sigma-true-atom`: □Rigid Comprehension holds. -/
def Models.full_permutation_group_infinite_set_sigma_true_atom.necessary_rigid_comprehension_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).IsModel ∧ (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).HoldsAx Classicism.P.NecRigidComprehension.schemaIn

/-- `full-permutation-group-infinite-set-sigma-true-atom`: Axiom of Infinity (type t) holds. -/
def Models.full_permutation_group_infinite_set_sigma_true_atom.axiom_of_infinity_t : Prop :=
  (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).IsModel ∧ (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).HoldsAx Classicism.P.AxiomOfInfinityT.schemaIn

/-- `full-permutation-group-infinite-set-sigma-true-atom`: Infinity Schema (type t) holds. -/
def Models.full_permutation_group_infinite_set_sigma_true_atom.infinity_t : Prop :=
  (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).IsModel ∧ (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityT)

/-- `full-permutation-group-infinite-set-sigma-true-atom`: □ND holds. -/
def Models.full_permutation_group_infinite_set_sigma_true_atom.necessary_distinctness_necessary_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).IsModel ∧ (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).HoldsAx Classicism.P.NecNecessityOfDistinctness.schemaIn

/-- `full-permutation-group-infinite-set-sigma-true-atom`: Truths are ND-necessary fails. -/
def Models.full_permutation_group_infinite_set_sigma_true_atom.truths_are_nd_necessary : Prop :=
  (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).HoldsAx Classicism.P.TruthsAreNDNecessary.schemaIn

/-- `full-permutation-group-infinite-set-sigma-true-atom`: No Pure Contingency holds. -/
def Models.full_permutation_group_infinite_set_sigma_true_atom.no_pure_contingency_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).IsModel ∧ (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `full-permutation-group-infinite-set-sigma-true-atom`: Fregean Axiom fails. -/
def Models.full_permutation_group_infinite_set_sigma_true_atom.fregean_axiom : Prop :=
  (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).HoldsAx Classicism.P.FregeanAxiom.schemaIn

/-- `full-permutation-group-infinite-set-sigma-true-atom`: Infinity Schema (type e) fails. -/
def Models.full_permutation_group_infinite_set_sigma_true_atom.infinity_e : Prop :=
  (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityE)

/-- `full-permutation-group-infinite-set-sigma-true-atom`: Axiom of Infinity (type e) fails. -/
def Models.full_permutation_group_infinite_set_sigma_true_atom.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `full-permutation-group-infinite-set-sigma-true-atom`: Possible Infinity (type e) fails. -/
def Models.full_permutation_group_infinite_set_sigma_true_atom.possible_infinity_e : Prop :=
  (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).HoldsAx Classicism.P.PossibleInfinityE.schemaIn

/-- `full-permutation-group-infinite-set-sigma-true-atom`: □Relational Choice holds. -/
def Models.full_permutation_group_infinite_set_sigma_true_atom.necessary_relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).IsModel ∧ (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).HoldsAx Classicism.P.NecRelationalChoice.schemaIn

/-- `full-permutation-group-infinite-set-sigma-true-atom`: Relational Choice holds. -/
def Models.full_permutation_group_infinite_set_sigma_true_atom.relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).IsModel ∧ (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `full-permutation-group-infinite-set-sigma-true-atom`: Transversal Choice holds. -/
def Models.full_permutation_group_infinite_set_sigma_true_atom.transversal_choice_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).IsModel ∧ (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- `full-surjection-monoid`: □Atomicity holds. -/
def Models.full_surjection_monoid.necessary_atomicity_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).HoldsAx Classicism.P.NecAtomicity.schemaIn

/-- `full-surjection-monoid`: □BF holds. -/
def Models.full_surjection_monoid.necessary_barcan_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).HoldsAx Classicism.P.NecBarcan.schemaIn

/-- `full-surjection-monoid`: □Rigid Comprehension holds. -/
def Models.full_surjection_monoid.necessary_rigid_comprehension_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).HoldsAx Classicism.P.NecRigidComprehension.schemaIn

/-- `full-surjection-monoid`: Axiom of Infinity (type t) holds. -/
def Models.full_surjection_monoid.axiom_of_infinity_t : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).HoldsAx Classicism.P.AxiomOfInfinityT.schemaIn

/-- `full-surjection-monoid`: Infinity Schema (type t) holds. -/
def Models.full_surjection_monoid.infinity_t : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityT)

/-- `full-surjection-monoid`: Truths are ND-necessary fails. -/
def Models.full_surjection_monoid.truths_are_nd_necessary : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).HoldsAx Classicism.P.TruthsAreNDNecessary.schemaIn

/-- `full-surjection-monoid`: No Pure Contingency holds. -/
def Models.full_surjection_monoid.no_pure_contingency_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `full-surjection-monoid`: Fregean Axiom fails. -/
def Models.full_surjection_monoid.fregean_axiom : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).HoldsAx Classicism.P.FregeanAxiom.schemaIn

/-- `full-surjection-monoid`: Infinity Schema (type e) fails. -/
def Models.full_surjection_monoid.infinity_e : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityE)

/-- `full-surjection-monoid`: Axiom of Infinity (type e) fails. -/
def Models.full_surjection_monoid.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `full-surjection-monoid`: Possible Infinity (type e) fails. -/
def Models.full_surjection_monoid.possible_infinity_e : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).HoldsAx Classicism.P.PossibleInfinityE.schemaIn

/-- `full-surjection-monoid`: □Relational Choice holds. -/
def Models.full_surjection_monoid.necessary_relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).HoldsAx Classicism.P.NecRelationalChoice.schemaIn

/-- `full-surjection-monoid`: Relational Choice holds. -/
def Models.full_surjection_monoid.relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `full-surjection-monoid`: Transversal Choice holds. -/
def Models.full_surjection_monoid.transversal_choice_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- `full-surjection-monoid`: ND (type t) fails. -/
def Models.full_surjection_monoid.distinctness_necessary_t : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).HoldsAx Classicism.P.NecessityOfDistinctnessT.schemaIn

/-- `full-surjection-monoid`: Independence (signature Σ) fails. -/
def Models.full_surjection_monoid.independence_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj)).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj)).IsModel ∧ ¬ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj)).HoldsAx (Classicism.Meta.AxiomSet.independence _)

/-- `full-surjection-monoid`: No Contingency (signature Σ) holds. -/
def Models.full_surjection_monoid.no_contingency_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj)).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj)).IsModel ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj)).HoldsAx (Classicism.Meta.AxiomSet.noContingency _)

/-- `full-surjection-monoid-sigma-true-atom`: □Atomicity holds. -/
def Models.full_surjection_monoid_sigma_true_atom.necessary_atomicity_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).HoldsAx Classicism.P.NecAtomicity.schemaIn

/-- `full-surjection-monoid-sigma-true-atom`: □BF holds. -/
def Models.full_surjection_monoid_sigma_true_atom.necessary_barcan_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).HoldsAx Classicism.P.NecBarcan.schemaIn

/-- `full-surjection-monoid-sigma-true-atom`: □Rigid Comprehension holds. -/
def Models.full_surjection_monoid_sigma_true_atom.necessary_rigid_comprehension_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).HoldsAx Classicism.P.NecRigidComprehension.schemaIn

/-- `full-surjection-monoid-sigma-true-atom`: Axiom of Infinity (type t) holds. -/
def Models.full_surjection_monoid_sigma_true_atom.axiom_of_infinity_t : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).HoldsAx Classicism.P.AxiomOfInfinityT.schemaIn

/-- `full-surjection-monoid-sigma-true-atom`: Infinity Schema (type t) holds. -/
def Models.full_surjection_monoid_sigma_true_atom.infinity_t : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityT)

/-- `full-surjection-monoid-sigma-true-atom`: Truths are ND-necessary fails. -/
def Models.full_surjection_monoid_sigma_true_atom.truths_are_nd_necessary : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).HoldsAx Classicism.P.TruthsAreNDNecessary.schemaIn

/-- `full-surjection-monoid-sigma-true-atom`: No Pure Contingency holds. -/
def Models.full_surjection_monoid_sigma_true_atom.no_pure_contingency_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `full-surjection-monoid-sigma-true-atom`: Fregean Axiom fails. -/
def Models.full_surjection_monoid_sigma_true_atom.fregean_axiom : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).HoldsAx Classicism.P.FregeanAxiom.schemaIn

/-- `full-surjection-monoid-sigma-true-atom`: Infinity Schema (type e) fails. -/
def Models.full_surjection_monoid_sigma_true_atom.infinity_e : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityE)

/-- `full-surjection-monoid-sigma-true-atom`: Axiom of Infinity (type e) fails. -/
def Models.full_surjection_monoid_sigma_true_atom.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `full-surjection-monoid-sigma-true-atom`: Possible Infinity (type e) fails. -/
def Models.full_surjection_monoid_sigma_true_atom.possible_infinity_e : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).HoldsAx Classicism.P.PossibleInfinityE.schemaIn

/-- `full-surjection-monoid-sigma-true-atom`: □Relational Choice holds. -/
def Models.full_surjection_monoid_sigma_true_atom.necessary_relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).HoldsAx Classicism.P.NecRelationalChoice.schemaIn

/-- `full-surjection-monoid-sigma-true-atom`: Relational Choice holds. -/
def Models.full_surjection_monoid_sigma_true_atom.relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `full-surjection-monoid-sigma-true-atom`: Transversal Choice holds. -/
def Models.full_surjection_monoid_sigma_true_atom.transversal_choice_r : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).IsModel ∧ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- `full-surjection-monoid-sigma-true-atom`: ND (type t) fails. -/
def Models.full_surjection_monoid_sigma_true_atom.distinctness_necessary_t : Prop :=
  (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).IsModel ∧ ¬ (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj).HoldsAx Classicism.P.NecessityOfDistinctnessT.schemaIn

/-- `full-two-object-chain`: B for pure sentences fails. -/
def Models.full_two_object_chain.pure_b_r : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.chain).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.chain).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.signatureB)

/-- `full-two-object-chain`: Possible Infinity (type t) fails. -/
def Models.full_two_object_chain.possible_infinity_t : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.chain).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.chain).HoldsAx Classicism.P.PossibleInfinityT.schemaIn

/-- `full-two-object-chain`: Infinity Schema (type t) fails. -/
def Models.full_two_object_chain.infinity_t : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.chain).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.chain).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityT)

/-- `full-two-object-chain`: Axiom of Infinity (type t) fails. -/
def Models.full_two_object_chain.axiom_of_infinity_t : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.chain).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.chain).HoldsAx Classicism.P.AxiomOfInfinityT.schemaIn

/-- `full-two-object-chain`: □Atomicity holds. -/
def Models.full_two_object_chain.necessary_atomicity_r : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.chain).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.chain).HoldsAx Classicism.P.NecAtomicity.schemaIn

/-- `full-two-object-chain`: □BF holds. -/
def Models.full_two_object_chain.necessary_barcan_r : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.chain).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.chain).HoldsAx Classicism.P.NecBarcan.schemaIn

/-- `full-two-object-chain`: □Rigid Comprehension holds. -/
def Models.full_two_object_chain.necessary_rigid_comprehension_r : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.chain).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.chain).HoldsAx Classicism.P.NecRigidComprehension.schemaIn

/-- `full-two-object-chain`: Truths are ND-necessary holds. -/
def Models.full_two_object_chain.truths_are_nd_necessary : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.chain).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.chain).HoldsAx Classicism.P.TruthsAreNDNecessary.schemaIn

/-- `full-two-object-chain`: Fregean Axiom fails. -/
def Models.full_two_object_chain.fregean_axiom : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.chain).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.chain).HoldsAx Classicism.P.FregeanAxiom.schemaIn

/-- `full-two-object-chain`: Infinity Schema (type e) fails. -/
def Models.full_two_object_chain.infinity_e : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.chain).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.chain).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityE)

/-- `full-two-object-chain`: Axiom of Infinity (type e) fails. -/
def Models.full_two_object_chain.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.chain).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.chain).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `full-two-object-chain`: Possible Infinity (type e) fails. -/
def Models.full_two_object_chain.possible_infinity_e : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.chain).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.chain).HoldsAx Classicism.P.PossibleInfinityE.schemaIn

/-- `full-two-object-chain`: □Relational Choice holds. -/
def Models.full_two_object_chain.necessary_relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.chain).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.chain).HoldsAx Classicism.P.NecRelationalChoice.schemaIn

/-- `full-two-object-chain`: Relational Choice holds. -/
def Models.full_two_object_chain.relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.chain).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.chain).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `full-two-object-chain`: Transversal Choice holds. -/
def Models.full_two_object_chain.transversal_choice_r : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.chain).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.chain).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- `full-two-object-chain`: ND (type t) fails. -/
def Models.full_two_object_chain.distinctness_necessary_t : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.chain).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.chain).HoldsAx Classicism.P.NecessityOfDistinctnessT.schemaIn

/-- `full-two-object-chain`: Independence (signature Σ) fails. -/
def Models.full_two_object_chain.independence_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.FullActionModels.chain) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _)).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.FullActionModels.chain) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _)).IsModel ∧ ¬ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.FullActionModels.chain) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _)).HoldsAx (Classicism.Meta.AxiomSet.independence _)

/-- `full-two-object-chain-sigma-true-atom`: B for pure sentences fails. -/
def Models.full_two_object_chain_sigma_true_atom.pure_b_r : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.chain).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.chain).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.signatureB)

/-- `full-two-object-chain-sigma-true-atom`: Possible Infinity (type t) fails. -/
def Models.full_two_object_chain_sigma_true_atom.possible_infinity_t : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.chain).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.chain).HoldsAx Classicism.P.PossibleInfinityT.schemaIn

/-- `full-two-object-chain-sigma-true-atom`: Infinity Schema (type t) fails. -/
def Models.full_two_object_chain_sigma_true_atom.infinity_t : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.chain).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.chain).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityT)

/-- `full-two-object-chain-sigma-true-atom`: Axiom of Infinity (type t) fails. -/
def Models.full_two_object_chain_sigma_true_atom.axiom_of_infinity_t : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.chain).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.chain).HoldsAx Classicism.P.AxiomOfInfinityT.schemaIn

/-- `full-two-object-chain-sigma-true-atom`: □Atomicity holds. -/
def Models.full_two_object_chain_sigma_true_atom.necessary_atomicity_r : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.chain).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.chain).HoldsAx Classicism.P.NecAtomicity.schemaIn

/-- `full-two-object-chain-sigma-true-atom`: □BF holds. -/
def Models.full_two_object_chain_sigma_true_atom.necessary_barcan_r : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.chain).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.chain).HoldsAx Classicism.P.NecBarcan.schemaIn

/-- `full-two-object-chain-sigma-true-atom`: □Rigid Comprehension holds. -/
def Models.full_two_object_chain_sigma_true_atom.necessary_rigid_comprehension_r : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.chain).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.chain).HoldsAx Classicism.P.NecRigidComprehension.schemaIn

/-- `full-two-object-chain-sigma-true-atom`: Truths are ND-necessary holds. -/
def Models.full_two_object_chain_sigma_true_atom.truths_are_nd_necessary : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.chain).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.chain).HoldsAx Classicism.P.TruthsAreNDNecessary.schemaIn

/-- `full-two-object-chain-sigma-true-atom`: Fregean Axiom fails. -/
def Models.full_two_object_chain_sigma_true_atom.fregean_axiom : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.chain).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.chain).HoldsAx Classicism.P.FregeanAxiom.schemaIn

/-- `full-two-object-chain-sigma-true-atom`: Infinity Schema (type e) fails. -/
def Models.full_two_object_chain_sigma_true_atom.infinity_e : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.chain).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.chain).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityE)

/-- `full-two-object-chain-sigma-true-atom`: Axiom of Infinity (type e) fails. -/
def Models.full_two_object_chain_sigma_true_atom.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.chain).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.chain).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `full-two-object-chain-sigma-true-atom`: Possible Infinity (type e) fails. -/
def Models.full_two_object_chain_sigma_true_atom.possible_infinity_e : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.chain).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.chain).HoldsAx Classicism.P.PossibleInfinityE.schemaIn

/-- `full-two-object-chain-sigma-true-atom`: □Relational Choice holds. -/
def Models.full_two_object_chain_sigma_true_atom.necessary_relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.chain).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.chain).HoldsAx Classicism.P.NecRelationalChoice.schemaIn

/-- `full-two-object-chain-sigma-true-atom`: Relational Choice holds. -/
def Models.full_two_object_chain_sigma_true_atom.relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.chain).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.chain).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `full-two-object-chain-sigma-true-atom`: Transversal Choice holds. -/
def Models.full_two_object_chain_sigma_true_atom.transversal_choice_r : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.chain).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.chain).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- `full-two-object-chain-sigma-true-atom`: ND (type t) fails. -/
def Models.full_two_object_chain_sigma_true_atom.distinctness_necessary_t : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.chain).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.chain).HoldsAx Classicism.P.NecessityOfDistinctnessT.schemaIn

/-- `full-two-object-double-retraction`: Possible Infinity (type t) fails. -/
def Models.full_two_object_double_retraction.possible_infinity_t : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).HoldsAx Classicism.P.PossibleInfinityT.schemaIn

/-- `full-two-object-double-retraction`: Infinity Schema (type t) fails. -/
def Models.full_two_object_double_retraction.infinity_t : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityT)

/-- `full-two-object-double-retraction`: Axiom of Infinity (type t) fails. -/
def Models.full_two_object_double_retraction.axiom_of_infinity_t : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).HoldsAx Classicism.P.AxiomOfInfinityT.schemaIn

/-- `full-two-object-double-retraction`: □Atomicity holds. -/
def Models.full_two_object_double_retraction.necessary_atomicity_r : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).HoldsAx Classicism.P.NecAtomicity.schemaIn

/-- `full-two-object-double-retraction`: □Rigid Comprehension holds. -/
def Models.full_two_object_double_retraction.necessary_rigid_comprehension_r : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).HoldsAx Classicism.P.NecRigidComprehension.schemaIn

/-- `full-two-object-double-retraction`: Truths are ND-necessary fails. -/
def Models.full_two_object_double_retraction.truths_are_nd_necessary : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).HoldsAx Classicism.P.TruthsAreNDNecessary.schemaIn

/-- `full-two-object-double-retraction`: Strong Atomicity (type t) fails. -/
def Models.full_two_object_double_retraction.strong_atomicity_t : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).HoldsAx Classicism.P.StrongAtomicityT.schemaIn

/-- `full-two-object-double-retraction`: Fregean Axiom fails. -/
def Models.full_two_object_double_retraction.fregean_axiom : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).HoldsAx Classicism.P.FregeanAxiom.schemaIn

/-- `full-two-object-double-retraction`: Infinity Schema (type e) fails. -/
def Models.full_two_object_double_retraction.infinity_e : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityE)

/-- `full-two-object-double-retraction`: Axiom of Infinity (type e) fails. -/
def Models.full_two_object_double_retraction.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `full-two-object-double-retraction`: Possible Infinity (type e) fails. -/
def Models.full_two_object_double_retraction.possible_infinity_e : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).HoldsAx Classicism.P.PossibleInfinityE.schemaIn

/-- `full-two-object-double-retraction`: □Relational Choice holds. -/
def Models.full_two_object_double_retraction.necessary_relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).HoldsAx Classicism.P.NecRelationalChoice.schemaIn

/-- `full-two-object-double-retraction`: Relational Choice holds. -/
def Models.full_two_object_double_retraction.relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `full-two-object-double-retraction`: ND holds. -/
def Models.full_two_object_double_retraction.distinctness_necessary_r : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).HoldsAx Classicism.P.NecessityOfDistinctness.schemaIn

/-- `full-two-object-double-retraction`: Strong Actuality fails. -/
def Models.full_two_object_double_retraction.strong_actuality : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).HoldsAx Classicism.P.StrongActuality.schemaIn

/-- `full-two-object-double-retraction`: Transversal Choice holds. -/
def Models.full_two_object_double_retraction.transversal_choice_r : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- `full-two-object-double-retraction`: Independence (signature Σ) fails. -/
def Models.full_two_object_double_retraction.independence_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.FullActionModels.doubleRetraction) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _)).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.FullActionModels.doubleRetraction) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _)).IsModel ∧ ¬ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.FullActionModels.doubleRetraction) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _)).HoldsAx (Classicism.Meta.AxiomSet.independence _)

/-- `full-two-object-double-retraction-sigma-true-atom`: Possible Infinity (type t) fails. -/
def Models.full_two_object_double_retraction_sigma_true_atom.possible_infinity_t : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).HoldsAx Classicism.P.PossibleInfinityT.schemaIn

/-- `full-two-object-double-retraction-sigma-true-atom`: Infinity Schema (type t) fails. -/
def Models.full_two_object_double_retraction_sigma_true_atom.infinity_t : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityT)

/-- `full-two-object-double-retraction-sigma-true-atom`: Axiom of Infinity (type t) fails. -/
def Models.full_two_object_double_retraction_sigma_true_atom.axiom_of_infinity_t : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).HoldsAx Classicism.P.AxiomOfInfinityT.schemaIn

/-- `full-two-object-double-retraction-sigma-true-atom`: □Atomicity holds. -/
def Models.full_two_object_double_retraction_sigma_true_atom.necessary_atomicity_r : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).HoldsAx Classicism.P.NecAtomicity.schemaIn

/-- `full-two-object-double-retraction-sigma-true-atom`: □Rigid Comprehension holds. -/
def Models.full_two_object_double_retraction_sigma_true_atom.necessary_rigid_comprehension_r : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).HoldsAx Classicism.P.NecRigidComprehension.schemaIn

/-- `full-two-object-double-retraction-sigma-true-atom`: Truths are ND-necessary fails. -/
def Models.full_two_object_double_retraction_sigma_true_atom.truths_are_nd_necessary : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).HoldsAx Classicism.P.TruthsAreNDNecessary.schemaIn

/-- `full-two-object-double-retraction-sigma-true-atom`: Strong Atomicity (type t) fails. -/
def Models.full_two_object_double_retraction_sigma_true_atom.strong_atomicity_t : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).HoldsAx Classicism.P.StrongAtomicityT.schemaIn

/-- `full-two-object-double-retraction-sigma-true-atom`: Fregean Axiom fails. -/
def Models.full_two_object_double_retraction_sigma_true_atom.fregean_axiom : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).HoldsAx Classicism.P.FregeanAxiom.schemaIn

/-- `full-two-object-double-retraction-sigma-true-atom`: Infinity Schema (type e) fails. -/
def Models.full_two_object_double_retraction_sigma_true_atom.infinity_e : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityE)

/-- `full-two-object-double-retraction-sigma-true-atom`: Axiom of Infinity (type e) fails. -/
def Models.full_two_object_double_retraction_sigma_true_atom.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `full-two-object-double-retraction-sigma-true-atom`: Possible Infinity (type e) fails. -/
def Models.full_two_object_double_retraction_sigma_true_atom.possible_infinity_e : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).HoldsAx Classicism.P.PossibleInfinityE.schemaIn

/-- `full-two-object-double-retraction-sigma-true-atom`: □Relational Choice holds. -/
def Models.full_two_object_double_retraction_sigma_true_atom.necessary_relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).HoldsAx Classicism.P.NecRelationalChoice.schemaIn

/-- `full-two-object-double-retraction-sigma-true-atom`: Relational Choice holds. -/
def Models.full_two_object_double_retraction_sigma_true_atom.relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `full-two-object-double-retraction-sigma-true-atom`: ND holds. -/
def Models.full_two_object_double_retraction_sigma_true_atom.distinctness_necessary_r : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).HoldsAx Classicism.P.NecessityOfDistinctness.schemaIn

/-- `full-two-object-double-retraction-sigma-true-atom`: Strong Actuality fails. -/
def Models.full_two_object_double_retraction_sigma_true_atom.strong_actuality : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).HoldsAx Classicism.P.StrongActuality.schemaIn

/-- `full-two-object-double-retraction-sigma-true-atom`: Transversal Choice holds. -/
def Models.full_two_object_double_retraction_sigma_true_atom.transversal_choice_r : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.doubleRetraction).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- `full-two-object-retract`: Gallin Extensional Comprehension holds. -/
def Models.full_two_object_retract.gallin_extensional_comprehension_r : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.retract).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.retract).HoldsAx Classicism.P.GallinExtensionalComprehension.schemaIn

/-- `full-two-object-retract`: Possible Infinity (type t) fails. -/
def Models.full_two_object_retract.possible_infinity_t : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.retract).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.retract).HoldsAx Classicism.P.PossibleInfinityT.schemaIn

/-- `full-two-object-retract`: Infinity Schema (type t) fails. -/
def Models.full_two_object_retract.infinity_t : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.retract).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.retract).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityT)

/-- `full-two-object-retract`: Axiom of Infinity (type t) fails. -/
def Models.full_two_object_retract.axiom_of_infinity_t : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.retract).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.retract).HoldsAx Classicism.P.AxiomOfInfinityT.schemaIn

/-- `full-two-object-retract`: □Atomicity holds. -/
def Models.full_two_object_retract.necessary_atomicity_r : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.retract).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.retract).HoldsAx Classicism.P.NecAtomicity.schemaIn

/-- `full-two-object-retract`: □Rigid Comprehension holds. -/
def Models.full_two_object_retract.necessary_rigid_comprehension_r : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.retract).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.retract).HoldsAx Classicism.P.NecRigidComprehension.schemaIn

/-- `full-two-object-retract`: Truths are ND-necessary fails. -/
def Models.full_two_object_retract.truths_are_nd_necessary : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.retract).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.retract).HoldsAx Classicism.P.TruthsAreNDNecessary.schemaIn

/-- `full-two-object-retract`: Strong Atomicity (type t) fails. -/
def Models.full_two_object_retract.strong_atomicity_t : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.retract).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.retract).HoldsAx Classicism.P.StrongAtomicityT.schemaIn

/-- `full-two-object-retract`: Fregean Axiom fails. -/
def Models.full_two_object_retract.fregean_axiom : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.retract).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.retract).HoldsAx Classicism.P.FregeanAxiom.schemaIn

/-- `full-two-object-retract`: Infinity Schema (type e) fails. -/
def Models.full_two_object_retract.infinity_e : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.retract).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.retract).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityE)

/-- `full-two-object-retract`: Axiom of Infinity (type e) fails. -/
def Models.full_two_object_retract.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.retract).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.retract).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `full-two-object-retract`: Possible Infinity (type e) fails. -/
def Models.full_two_object_retract.possible_infinity_e : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.retract).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.retract).HoldsAx Classicism.P.PossibleInfinityE.schemaIn

/-- `full-two-object-retract`: □Relational Choice holds. -/
def Models.full_two_object_retract.necessary_relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.retract).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.retract).HoldsAx Classicism.P.NecRelationalChoice.schemaIn

/-- `full-two-object-retract`: Relational Choice holds. -/
def Models.full_two_object_retract.relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.retract).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.retract).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `full-two-object-retract`: ND holds. -/
def Models.full_two_object_retract.distinctness_necessary_r : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.retract).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.retract).HoldsAx Classicism.P.NecessityOfDistinctness.schemaIn

/-- `full-two-object-retract`: Strong Actuality holds. -/
def Models.full_two_object_retract.strong_actuality : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.retract).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.retract).HoldsAx Classicism.P.StrongActuality.schemaIn

/-- `full-two-object-retract`: □Strong Actuality holds. -/
def Models.full_two_object_retract.necessary_strong_actuality : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.retract).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.retract).HoldsAx Classicism.P.NecStrongActuality.schemaIn

/-- `full-two-object-retract`: Transversal Choice holds. -/
def Models.full_two_object_retract.transversal_choice_r : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.retract).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.retract).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- `full-two-object-retract`: Independence (signature Σ) fails. -/
def Models.full_two_object_retract.independence_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _)).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _)).IsModel ∧ ¬ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _)).HoldsAx (Classicism.Meta.AxiomSet.independence _)

/-- `full-two-object-retract-sigma-true-atom`: Gallin Extensional Comprehension holds. -/
def Models.full_two_object_retract_sigma_true_atom.gallin_extensional_comprehension_r : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.retract).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.retract).HoldsAx Classicism.P.GallinExtensionalComprehension.schemaIn

/-- `full-two-object-retract-sigma-true-atom`: Possible Infinity (type t) fails. -/
def Models.full_two_object_retract_sigma_true_atom.possible_infinity_t : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.retract).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.retract).HoldsAx Classicism.P.PossibleInfinityT.schemaIn

/-- `full-two-object-retract-sigma-true-atom`: Infinity Schema (type t) fails. -/
def Models.full_two_object_retract_sigma_true_atom.infinity_t : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.retract).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.retract).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityT)

/-- `full-two-object-retract-sigma-true-atom`: Axiom of Infinity (type t) fails. -/
def Models.full_two_object_retract_sigma_true_atom.axiom_of_infinity_t : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.retract).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.retract).HoldsAx Classicism.P.AxiomOfInfinityT.schemaIn

/-- `full-two-object-retract-sigma-true-atom`: □Atomicity holds. -/
def Models.full_two_object_retract_sigma_true_atom.necessary_atomicity_r : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.retract).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.retract).HoldsAx Classicism.P.NecAtomicity.schemaIn

/-- `full-two-object-retract-sigma-true-atom`: □Rigid Comprehension holds. -/
def Models.full_two_object_retract_sigma_true_atom.necessary_rigid_comprehension_r : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.retract).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.retract).HoldsAx Classicism.P.NecRigidComprehension.schemaIn

/-- `full-two-object-retract-sigma-true-atom`: Truths are ND-necessary fails. -/
def Models.full_two_object_retract_sigma_true_atom.truths_are_nd_necessary : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.retract).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.retract).HoldsAx Classicism.P.TruthsAreNDNecessary.schemaIn

/-- `full-two-object-retract-sigma-true-atom`: Strong Atomicity (type t) fails. -/
def Models.full_two_object_retract_sigma_true_atom.strong_atomicity_t : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.retract).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.retract).HoldsAx Classicism.P.StrongAtomicityT.schemaIn

/-- `full-two-object-retract-sigma-true-atom`: Fregean Axiom fails. -/
def Models.full_two_object_retract_sigma_true_atom.fregean_axiom : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.retract).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.retract).HoldsAx Classicism.P.FregeanAxiom.schemaIn

/-- `full-two-object-retract-sigma-true-atom`: Infinity Schema (type e) fails. -/
def Models.full_two_object_retract_sigma_true_atom.infinity_e : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.retract).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.retract).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityE)

/-- `full-two-object-retract-sigma-true-atom`: Axiom of Infinity (type e) fails. -/
def Models.full_two_object_retract_sigma_true_atom.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.retract).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.retract).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `full-two-object-retract-sigma-true-atom`: Possible Infinity (type e) fails. -/
def Models.full_two_object_retract_sigma_true_atom.possible_infinity_e : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.retract).IsModel ∧ ¬ (Classicism.Meta.Intensional.FullActionModels.retract).HoldsAx Classicism.P.PossibleInfinityE.schemaIn

/-- `full-two-object-retract-sigma-true-atom`: □Relational Choice holds. -/
def Models.full_two_object_retract_sigma_true_atom.necessary_relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.retract).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.retract).HoldsAx Classicism.P.NecRelationalChoice.schemaIn

/-- `full-two-object-retract-sigma-true-atom`: Relational Choice holds. -/
def Models.full_two_object_retract_sigma_true_atom.relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.retract).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.retract).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `full-two-object-retract-sigma-true-atom`: ND holds. -/
def Models.full_two_object_retract_sigma_true_atom.distinctness_necessary_r : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.retract).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.retract).HoldsAx Classicism.P.NecessityOfDistinctness.schemaIn

/-- `full-two-object-retract-sigma-true-atom`: Strong Actuality holds. -/
def Models.full_two_object_retract_sigma_true_atom.strong_actuality : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.retract).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.retract).HoldsAx Classicism.P.StrongActuality.schemaIn

/-- `full-two-object-retract-sigma-true-atom`: □Strong Actuality holds. -/
def Models.full_two_object_retract_sigma_true_atom.necessary_strong_actuality : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.retract).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.retract).HoldsAx Classicism.P.NecStrongActuality.schemaIn

/-- `full-two-object-retract-sigma-true-atom`: Transversal Choice holds. -/
def Models.full_two_object_retract_sigma_true_atom.transversal_choice_r : Prop :=
  (Classicism.Meta.Intensional.FullActionModels.retract).IsModel ∧ (Classicism.Meta.Intensional.FullActionModels.retract).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- `symmetric-all-surjections`: Relational Choice fails. -/
def Models.symmetric_all_surjections.relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj)).IsModel ∧ ¬ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj)).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `symmetric-all-surjections`: Axiom of Infinity (type e) holds. -/
def Models.symmetric_all_surjections.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj)).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `symmetric-all-surjections`: BF holds. -/
def Models.symmetric_all_surjections.barcan_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj)).HoldsAx Classicism.P.Barcan.schemaIn

/-- `symmetric-all-surjections`: Boolean Completeness holds. -/
def Models.symmetric_all_surjections.boolean_completeness_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj)).HoldsAx Classicism.P.BooleanCompleteness.schemaIn

/-- `symmetric-all-surjections`: No Pure Contingency holds. -/
def Models.symmetric_all_surjections.no_pure_contingency_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `symmetric-all-surjections`: Independence (signature Σ) fails. -/
def Models.symmetric_all_surjections.independence_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj))).IsModel ∧ ¬ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj))).HoldsAx (Classicism.Meta.AxiomSet.independence _)

/-- `symmetric-all-surjections`: No Contingency (signature Σ) holds. -/
def Models.symmetric_all_surjections.no_contingency_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj))).IsModel ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj))).HoldsAx (Classicism.Meta.AxiomSet.noContingency _)

/-- `symmetric-class-reflecting-surjections`: Relational Choice fails. -/
def Models.symmetric_class_reflecting_surjections.relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.classReflect)).IsModel ∧ ¬ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.classReflect)).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `symmetric-class-reflecting-surjections`: Axiom of Infinity (type e) holds. -/
def Models.symmetric_class_reflecting_surjections.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.classReflect)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.classReflect)).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `symmetric-class-reflecting-surjections`: BF holds. -/
def Models.symmetric_class_reflecting_surjections.barcan_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.classReflect)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.classReflect)).HoldsAx Classicism.P.Barcan.schemaIn

/-- `symmetric-class-reflecting-surjections`: No Pure Contingency holds. -/
def Models.symmetric_class_reflecting_surjections.no_pure_contingency_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.classReflect)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.classReflect)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `symmetric-class-reflecting-surjections`: Independence (signature Σ) fails. -/
def Models.symmetric_class_reflecting_surjections.independence_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.classReflect)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.classReflect))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.classReflect)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.classReflect))).IsModel ∧ ¬ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.classReflect)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.classReflect))).HoldsAx (Classicism.Meta.AxiomSet.independence _)

/-- `symmetric-class-reflecting-surjections`: No Contingency (signature Σ) holds. -/
def Models.symmetric_class_reflecting_surjections.no_contingency_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.classReflect)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.classReflect))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.classReflect)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.classReflect))).IsModel ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.classReflect)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.classReflect))).HoldsAx (Classicism.Meta.AxiomSet.noContingency _)

/-- `symmetric-collapse-pair-and-point`: Relational Choice fails. -/
def Models.symmetric_collapse_pair_and_point.relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.ptBase)).IsModel ∧ ¬ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.ptBase)).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `symmetric-collapse-pair-and-point`: Axiom of Infinity (type e) holds. -/
def Models.symmetric_collapse_pair_and_point.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.ptBase)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.ptBase)).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `symmetric-collapse-pair-and-point`: Axiom of Infinity (type t) holds. -/
def Models.symmetric_collapse_pair_and_point.axiom_of_infinity_t : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.ptBase)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.ptBase)).HoldsAx Classicism.P.AxiomOfInfinityT.schemaIn

/-- `symmetric-collapse-pair-and-point`: Actuality holds. -/
def Models.symmetric_collapse_pair_and_point.actuality : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.ptBase)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.ptBase)).HoldsAx Classicism.P.Actuality.schemaIn

/-- `symmetric-collapse-pair-and-point`: Boolean Completeness holds. -/
def Models.symmetric_collapse_pair_and_point.boolean_completeness_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.ptBase)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.ptBase)).HoldsAx Classicism.P.BooleanCompleteness.schemaIn

/-- `symmetric-collapse-pair-and-point`: Truths are ND-necessary holds. -/
def Models.symmetric_collapse_pair_and_point.truths_are_nd_necessary : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.ptBase)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.ptBase)).HoldsAx Classicism.P.TruthsAreNDNecessary.schemaIn

/-- `symmetric-collapse-pair-and-point`: Independence (signature Σ) fails. -/
def Models.symmetric_collapse_pair_and_point.independence_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.ptBase)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.ptBase))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.ptBase)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.ptBase))).IsModel ∧ ¬ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.ptBase)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.ptBase))).HoldsAx (Classicism.Meta.AxiomSet.independence _)

/-- `symmetric-collapse-pair-and-point-sigma-true-atom`: Relational Choice fails. -/
def Models.symmetric_collapse_pair_and_point_sigma_true_atom.relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.ptBase)).IsModel ∧ ¬ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.ptBase)).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `symmetric-collapse-pair-and-point-sigma-true-atom`: Axiom of Infinity (type e) holds. -/
def Models.symmetric_collapse_pair_and_point_sigma_true_atom.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.ptBase)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.ptBase)).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `symmetric-collapse-pair-and-point-sigma-true-atom`: Axiom of Infinity (type t) holds. -/
def Models.symmetric_collapse_pair_and_point_sigma_true_atom.axiom_of_infinity_t : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.ptBase)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.ptBase)).HoldsAx Classicism.P.AxiomOfInfinityT.schemaIn

/-- `symmetric-collapse-pair-and-point-sigma-true-atom`: Actuality holds. -/
def Models.symmetric_collapse_pair_and_point_sigma_true_atom.actuality : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.ptBase)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.ptBase)).HoldsAx Classicism.P.Actuality.schemaIn

/-- `symmetric-collapse-pair-and-point-sigma-true-atom`: Boolean Completeness holds. -/
def Models.symmetric_collapse_pair_and_point_sigma_true_atom.boolean_completeness_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.ptBase)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.ptBase)).HoldsAx Classicism.P.BooleanCompleteness.schemaIn

/-- `symmetric-collapse-pair-and-point-sigma-true-atom`: Truths are ND-necessary holds. -/
def Models.symmetric_collapse_pair_and_point_sigma_true_atom.truths_are_nd_necessary : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.ptBase)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.ptBase)).HoldsAx Classicism.P.TruthsAreNDNecessary.schemaIn

/-- `symmetric-collapse-pair`: Relational Choice fails. -/
def Models.symmetric_collapse_pair.relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)).IsModel ∧ ¬ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `symmetric-collapse-pair`: Axiom of Infinity (type e) holds. -/
def Models.symmetric_collapse_pair.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `symmetric-collapse-pair`: Axiom of Infinity (type t) holds. -/
def Models.symmetric_collapse_pair.axiom_of_infinity_t : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)).HoldsAx Classicism.P.AxiomOfInfinityT.schemaIn

/-- `symmetric-collapse-pair`: BF holds. -/
def Models.symmetric_collapse_pair.barcan_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)).HoldsAx Classicism.P.Barcan.schemaIn

/-- `symmetric-collapse-pair`: Actuality holds. -/
def Models.symmetric_collapse_pair.actuality : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)).HoldsAx Classicism.P.Actuality.schemaIn

/-- `symmetric-collapse-pair`: Boolean Completeness holds. -/
def Models.symmetric_collapse_pair.boolean_completeness_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)).HoldsAx Classicism.P.BooleanCompleteness.schemaIn

/-- `symmetric-collapse-pair`: Truths are ND-necessary holds. -/
def Models.symmetric_collapse_pair.truths_are_nd_necessary : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)).HoldsAx Classicism.P.TruthsAreNDNecessary.schemaIn

/-- `symmetric-collapse-pair`: No Pure Contingency holds. -/
def Models.symmetric_collapse_pair.no_pure_contingency_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `symmetric-collapse-pair`: Independence (signature Σ) fails. -/
def Models.symmetric_collapse_pair.independence_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair))).IsModel ∧ ¬ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair))).HoldsAx (Classicism.Meta.AxiomSet.independence _)

/-- `symmetric-collapse-pair`: No Contingency (signature Σ) holds. -/
def Models.symmetric_collapse_pair.no_contingency_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair))).IsModel ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair))).HoldsAx (Classicism.Meta.AxiomSet.noContingency _)

/-- `symmetric-collapse-pair-sigma-true-atom`: Relational Choice fails. -/
def Models.symmetric_collapse_pair_sigma_true_atom.relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)).IsModel ∧ ¬ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `symmetric-collapse-pair-sigma-true-atom`: Axiom of Infinity (type e) holds. -/
def Models.symmetric_collapse_pair_sigma_true_atom.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `symmetric-collapse-pair-sigma-true-atom`: Axiom of Infinity (type t) holds. -/
def Models.symmetric_collapse_pair_sigma_true_atom.axiom_of_infinity_t : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)).HoldsAx Classicism.P.AxiomOfInfinityT.schemaIn

/-- `symmetric-collapse-pair-sigma-true-atom`: BF holds. -/
def Models.symmetric_collapse_pair_sigma_true_atom.barcan_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)).HoldsAx Classicism.P.Barcan.schemaIn

/-- `symmetric-collapse-pair-sigma-true-atom`: Actuality holds. -/
def Models.symmetric_collapse_pair_sigma_true_atom.actuality : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)).HoldsAx Classicism.P.Actuality.schemaIn

/-- `symmetric-collapse-pair-sigma-true-atom`: Boolean Completeness holds. -/
def Models.symmetric_collapse_pair_sigma_true_atom.boolean_completeness_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)).HoldsAx Classicism.P.BooleanCompleteness.schemaIn

/-- `symmetric-collapse-pair-sigma-true-atom`: Truths are ND-necessary holds. -/
def Models.symmetric_collapse_pair_sigma_true_atom.truths_are_nd_necessary : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)).HoldsAx Classicism.P.TruthsAreNDNecessary.schemaIn

/-- `symmetric-collapse-pair-sigma-true-atom`: No Pure Contingency holds. -/
def Models.symmetric_collapse_pair_sigma_true_atom.no_pure_contingency_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `symmetric-entrance-qualitative-links`: Independence (signature Σ) fails. -/
def Models.symmetric_entrance_qualitative_links.independence_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.FixedPointEntrance.Qualitative.model) (Classicism.Meta.Intensional.FixedPointEntrance.Qualitative.isModel)).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.FixedPointEntrance.Qualitative.model) (Classicism.Meta.Intensional.FixedPointEntrance.Qualitative.isModel)).IsModel ∧ ¬ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.FixedPointEntrance.Qualitative.model) (Classicism.Meta.Intensional.FixedPointEntrance.Qualitative.isModel)).HoldsAx (Classicism.Meta.AxiomSet.independence _)

/-- `symmetric-entrance-qualitative-links-sigma-true-atom`: Relational Choice holds. -/
def Models.symmetric_entrance_qualitative_links_sigma_true_atom.relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.FixedPointEntrance.Qualitative.model).IsModel ∧ (Classicism.Meta.Intensional.FixedPointEntrance.Qualitative.model).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `symmetric-entrance-qualitative-links-sigma-true-atom`: BF (type t) fails. -/
def Models.symmetric_entrance_qualitative_links_sigma_true_atom.barcan_t : Prop :=
  (Classicism.Meta.Intensional.FixedPointEntrance.Qualitative.model).IsModel ∧ ¬ (Classicism.Meta.Intensional.FixedPointEntrance.Qualitative.model).HoldsAx Classicism.P.BarcanT.schemaIn

/-- `symmetric-finite-compression-entrance`: Relational Choice fails. -/
def Models.symmetric_finite_compression_entrance.relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.FiniteCompression.base Classicism.Meta.Intensional.FiniteCompression.A)).IsModel ∧ ¬ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.FiniteCompression.base Classicism.Meta.Intensional.FiniteCompression.A)).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `symmetric-finite-compression-entrance`: Axiom of Infinity (type e) holds. -/
def Models.symmetric_finite_compression_entrance.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.FiniteCompression.base Classicism.Meta.Intensional.FiniteCompression.A)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.FiniteCompression.base Classicism.Meta.Intensional.FiniteCompression.A)).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `symmetric-finite-compression-entrance`: Axiom of Infinity (type t) holds. -/
def Models.symmetric_finite_compression_entrance.axiom_of_infinity_t : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.FiniteCompression.base Classicism.Meta.Intensional.FiniteCompression.A)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.FiniteCompression.base Classicism.Meta.Intensional.FiniteCompression.A)).HoldsAx Classicism.P.AxiomOfInfinityT.schemaIn

/-- `symmetric-finite-compression-entrance`: Boolean Completeness holds. -/
def Models.symmetric_finite_compression_entrance.boolean_completeness_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.FiniteCompression.base Classicism.Meta.Intensional.FiniteCompression.A)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.FiniteCompression.base Classicism.Meta.Intensional.FiniteCompression.A)).HoldsAx Classicism.P.BooleanCompleteness.schemaIn

/-- `symmetric-finite-compression-entrance`: Independence (signature Σ) fails. -/
def Models.symmetric_finite_compression_entrance.independence_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.FiniteCompression.base Classicism.Meta.Intensional.FiniteCompression.A)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.FiniteCompression.base Classicism.Meta.Intensional.FiniteCompression.A))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.FiniteCompression.base Classicism.Meta.Intensional.FiniteCompression.A)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.FiniteCompression.base Classicism.Meta.Intensional.FiniteCompression.A))).IsModel ∧ ¬ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.FiniteCompression.base Classicism.Meta.Intensional.FiniteCompression.A)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.FiniteCompression.base Classicism.Meta.Intensional.FiniteCompression.A))).HoldsAx (Classicism.Meta.AxiomSet.independence _)

/-- `symmetric-infinite-classes`: Relational Choice fails. -/
def Models.symmetric_infinite_classes.relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses)).IsModel ∧ ¬ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses)).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `symmetric-infinite-classes`: Axiom of Infinity (type e) holds. -/
def Models.symmetric_infinite_classes.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses)).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `symmetric-infinite-classes`: BF holds. -/
def Models.symmetric_infinite_classes.barcan_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses)).HoldsAx Classicism.P.Barcan.schemaIn

/-- `symmetric-infinite-classes`: Boolean Completeness holds. -/
def Models.symmetric_infinite_classes.boolean_completeness_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses)).HoldsAx Classicism.P.BooleanCompleteness.schemaIn

/-- `symmetric-infinite-classes`: No Pure Contingency holds. -/
def Models.symmetric_infinite_classes.no_pure_contingency_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `symmetric-infinite-classes`: Independence (signature Σ) fails. -/
def Models.symmetric_infinite_classes.independence_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses))).IsModel ∧ ¬ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses))).HoldsAx (Classicism.Meta.AxiomSet.independence _)

/-- `symmetric-infinite-classes`: No Contingency (signature Σ) holds. -/
def Models.symmetric_infinite_classes.no_contingency_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses))).IsModel ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses))).HoldsAx (Classicism.Meta.AxiomSet.noContingency _)

/-- `symmetric-old-new-individuals`: Relational Choice fails. -/
def Models.symmetric_old_new_individuals.relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.OldNew.base)).IsModel ∧ ¬ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.OldNew.base)).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `symmetric-old-new-individuals`: Axiom of Infinity (type e) holds. -/
def Models.symmetric_old_new_individuals.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.OldNew.base)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.OldNew.base)).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `symmetric-old-new-individuals`: Independence (signature Σ) fails. -/
def Models.symmetric_old_new_individuals.independence_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.OldNew.base)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.OldNew.base))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.OldNew.base)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.OldNew.base))).IsModel ∧ ¬ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.OldNew.base)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.OldNew.base))).HoldsAx (Classicism.Meta.AxiomSet.independence _)

/-- `symmetric-permutations-infinite-classes`: Relational Choice fails. -/
def Models.symmetric_permutations_infinite_classes.relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.permInfClasses)).IsModel ∧ ¬ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.permInfClasses)).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `symmetric-permutations-infinite-classes`: Axiom of Infinity (type e) holds. -/
def Models.symmetric_permutations_infinite_classes.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.permInfClasses)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.permInfClasses)).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `symmetric-permutations-infinite-classes`: BF holds. -/
def Models.symmetric_permutations_infinite_classes.barcan_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.permInfClasses)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.permInfClasses)).HoldsAx Classicism.P.Barcan.schemaIn

/-- `symmetric-permutations-infinite-classes`: No Pure Contingency holds. -/
def Models.symmetric_permutations_infinite_classes.no_pure_contingency_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.permInfClasses)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.permInfClasses)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `symmetric-permutations-infinite-classes`: Independence (signature Σ) fails. -/
def Models.symmetric_permutations_infinite_classes.independence_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.permInfClasses)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.permInfClasses))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.permInfClasses)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.permInfClasses))).IsModel ∧ ¬ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.permInfClasses)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.permInfClasses))).HoldsAx (Classicism.Meta.AxiomSet.independence _)

/-- `symmetric-permutations-infinite-classes`: No Contingency (signature Σ) holds. -/
def Models.symmetric_permutations_infinite_classes.no_contingency_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.permInfClasses)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.permInfClasses))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.permInfClasses)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.permInfClasses))).IsModel ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.permInfClasses)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.permInfClasses))).HoldsAx (Classicism.Meta.AxiomSet.noContingency _)

/-- `symmetric-qualitative-contrast-at-w1`: Axiom of Infinity (type e) holds. -/
def Models.symmetric_qualitative_contrast_at_w1.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.contrastBaseW₁)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.contrastBaseW₁)).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `symmetric-qualitative-contrast-at-w1`: Independence (signature Σ) fails. -/
def Models.symmetric_qualitative_contrast_at_w1.independence_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.contrastBaseW₁)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.contrastBaseW₁))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.contrastBaseW₁)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.contrastBaseW₁))).IsModel ∧ ¬ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.contrastBaseW₁)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.contrastBaseW₁))).HoldsAx (Classicism.Meta.AxiomSet.independence _)

/-- `symmetric-qualitative-contrast`: Relational Choice fails. -/
def Models.symmetric_qualitative_contrast.relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.contrastBase)).IsModel ∧ ¬ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.contrastBase)).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `symmetric-qualitative-contrast`: Axiom of Infinity (type e) holds. -/
def Models.symmetric_qualitative_contrast.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.contrastBase)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.contrastBase)).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `symmetric-qualitative-contrast`: Independence (signature Σ) fails. -/
def Models.symmetric_qualitative_contrast.independence_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.contrastBase)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.contrastBase))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.contrastBase)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.contrastBase))).IsModel ∧ ¬ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.contrastBase)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.contrastBase))).HoldsAx (Classicism.Meta.AxiomSet.independence _)

/-- `symmetric-qualitative-contrast-sigma-true-atom`: Relational Choice fails. -/
def Models.symmetric_qualitative_contrast_sigma_true_atom.relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.contrastBase)).IsModel ∧ ¬ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.contrastBase)).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `symmetric-qualitative-contrast-sigma-true-atom`: Axiom of Infinity (type e) holds. -/
def Models.symmetric_qualitative_contrast_sigma_true_atom.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.contrastBase)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.contrastBase)).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `symmetric-qualitative-links`: Relational Choice fails. -/
def Models.symmetric_qualitative_links.relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.QualitativeLinks.base)).IsModel ∧ ¬ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.QualitativeLinks.base)).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `symmetric-qualitative-links`: Axiom of Infinity (type e) holds. -/
def Models.symmetric_qualitative_links.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.QualitativeLinks.base)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.QualitativeLinks.base)).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `symmetric-qualitative-links`: Axiom of Infinity (type t) holds. -/
def Models.symmetric_qualitative_links.axiom_of_infinity_t : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.QualitativeLinks.base)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.QualitativeLinks.base)).HoldsAx Classicism.P.AxiomOfInfinityT.schemaIn

/-- `symmetric-qualitative-links`: BF holds. -/
def Models.symmetric_qualitative_links.barcan_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.QualitativeLinks.base)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.QualitativeLinks.base)).HoldsAx Classicism.P.Barcan.schemaIn

/-- `symmetric-qualitative-links`: Actuality holds. -/
def Models.symmetric_qualitative_links.actuality : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.QualitativeLinks.base)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.QualitativeLinks.base)).HoldsAx Classicism.P.Actuality.schemaIn

/-- `symmetric-qualitative-links`: Truths are ND-necessary holds. -/
def Models.symmetric_qualitative_links.truths_are_nd_necessary : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.QualitativeLinks.base)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.QualitativeLinks.base)).HoldsAx Classicism.P.TruthsAreNDNecessary.schemaIn

/-- `symmetric-qualitative-links`: No Pure Contingency holds. -/
def Models.symmetric_qualitative_links.no_pure_contingency_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.QualitativeLinks.base)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.QualitativeLinks.base)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `symmetric-qualitative-links`: Independence (signature Σ) fails. -/
def Models.symmetric_qualitative_links.independence_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.QualitativeLinks.base)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.QualitativeLinks.base))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.QualitativeLinks.base)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.QualitativeLinks.base))).IsModel ∧ ¬ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.QualitativeLinks.base)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.QualitativeLinks.base))).HoldsAx (Classicism.Meta.AxiomSet.independence _)

/-- `symmetric-qualitative-links`: No Contingency (signature Σ) holds. -/
def Models.symmetric_qualitative_links.no_contingency_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.QualitativeLinks.base)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.QualitativeLinks.base))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.QualitativeLinks.base)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.QualitativeLinks.base))).IsModel ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.QualitativeLinks.base)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.QualitativeLinks.base))).HoldsAx (Classicism.Meta.AxiomSet.noContingency _)

/-- `symmetric-qualitative-links-sigma-true-atom`: Relational Choice fails. -/
def Models.symmetric_qualitative_links_sigma_true_atom.relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.QualitativeLinks.base)).IsModel ∧ ¬ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.QualitativeLinks.base)).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `symmetric-qualitative-links-sigma-true-atom`: Axiom of Infinity (type e) holds. -/
def Models.symmetric_qualitative_links_sigma_true_atom.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.QualitativeLinks.base)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.QualitativeLinks.base)).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `symmetric-qualitative-links-sigma-true-atom`: Axiom of Infinity (type t) holds. -/
def Models.symmetric_qualitative_links_sigma_true_atom.axiom_of_infinity_t : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.QualitativeLinks.base)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.QualitativeLinks.base)).HoldsAx Classicism.P.AxiomOfInfinityT.schemaIn

/-- `symmetric-qualitative-links-sigma-true-atom`: BF holds. -/
def Models.symmetric_qualitative_links_sigma_true_atom.barcan_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.QualitativeLinks.base)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.QualitativeLinks.base)).HoldsAx Classicism.P.Barcan.schemaIn

/-- `symmetric-qualitative-links-sigma-true-atom`: Actuality holds. -/
def Models.symmetric_qualitative_links_sigma_true_atom.actuality : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.QualitativeLinks.base)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.QualitativeLinks.base)).HoldsAx Classicism.P.Actuality.schemaIn

/-- `symmetric-qualitative-links-sigma-true-atom`: Truths are ND-necessary holds. -/
def Models.symmetric_qualitative_links_sigma_true_atom.truths_are_nd_necessary : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.QualitativeLinks.base)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.QualitativeLinks.base)).HoldsAx Classicism.P.TruthsAreNDNecessary.schemaIn

/-- `symmetric-qualitative-links-sigma-true-atom`: No Pure Contingency holds. -/
def Models.symmetric_qualitative_links_sigma_true_atom.no_pure_contingency_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.QualitativeLinks.base)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.QualitativeLinks.base)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `symmetric-range-gap-without-actuality`: Relational Choice fails. -/
def Models.symmetric_range_gap_without_actuality.relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct)).IsModel ∧ ¬ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct)).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `symmetric-range-gap-without-actuality`: Axiom of Infinity (type e) holds. -/
def Models.symmetric_range_gap_without_actuality.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct)).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `symmetric-range-gap-without-actuality`: BF fails. -/
def Models.symmetric_range_gap_without_actuality.barcan_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct)).IsModel ∧ ¬ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct)).HoldsAx Classicism.P.Barcan.schemaIn

/-- `symmetric-range-gap-without-actuality`: Boolean Completeness holds. -/
def Models.symmetric_range_gap_without_actuality.boolean_completeness_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct)).HoldsAx Classicism.P.BooleanCompleteness.schemaIn

/-- `symmetric-range-gap-without-actuality`: No Pure Contingency holds. -/
def Models.symmetric_range_gap_without_actuality.no_pure_contingency_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `symmetric-range-gap-without-actuality`: Independence (signature Σ) fails. -/
def Models.symmetric_range_gap_without_actuality.independence_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct))).IsModel ∧ ¬ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct))).HoldsAx (Classicism.Meta.AxiomSet.independence _)

/-- `symmetric-range-gap-without-actuality`: No Contingency (signature Σ) holds. -/
def Models.symmetric_range_gap_without_actuality.no_contingency_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct))).IsModel ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct))).HoldsAx (Classicism.Meta.AxiomSet.noContingency _)

/-- `symmetric-range-gap`: Relational Choice fails. -/
def Models.symmetric_range_gap.relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)).IsModel ∧ ¬ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `symmetric-range-gap`: Axiom of Infinity (type e) holds. -/
def Models.symmetric_range_gap.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `symmetric-range-gap`: Axiom of Infinity (type t) holds. -/
def Models.symmetric_range_gap.axiom_of_infinity_t : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)).HoldsAx Classicism.P.AxiomOfInfinityT.schemaIn

/-- `symmetric-range-gap`: Actuality holds. -/
def Models.symmetric_range_gap.actuality : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)).HoldsAx Classicism.P.Actuality.schemaIn

/-- `symmetric-range-gap`: BF fails. -/
def Models.symmetric_range_gap.barcan_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)).IsModel ∧ ¬ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)).HoldsAx Classicism.P.Barcan.schemaIn

/-- `symmetric-range-gap`: Boolean Completeness holds. -/
def Models.symmetric_range_gap.boolean_completeness_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)).HoldsAx Classicism.P.BooleanCompleteness.schemaIn

/-- `symmetric-range-gap`: Truths are ND-necessary holds. -/
def Models.symmetric_range_gap.truths_are_nd_necessary : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)).HoldsAx Classicism.P.TruthsAreNDNecessary.schemaIn

/-- `symmetric-range-gap`: No Pure Contingency holds. -/
def Models.symmetric_range_gap.no_pure_contingency_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `symmetric-range-gap`: Independence (signature Σ) fails. -/
def Models.symmetric_range_gap.independence_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap))).IsModel ∧ ¬ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap))).HoldsAx (Classicism.Meta.AxiomSet.independence _)

/-- `symmetric-range-gap`: No Contingency (signature Σ) holds. -/
def Models.symmetric_range_gap.no_contingency_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap))).IsModel ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap))).HoldsAx (Classicism.Meta.AxiomSet.noContingency _)

/-- `symmetric-range-gap-sigma-true-atom`: Relational Choice fails. -/
def Models.symmetric_range_gap_sigma_true_atom.relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)).IsModel ∧ ¬ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `symmetric-range-gap-sigma-true-atom`: Axiom of Infinity (type e) holds. -/
def Models.symmetric_range_gap_sigma_true_atom.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `symmetric-range-gap-sigma-true-atom`: Axiom of Infinity (type t) holds. -/
def Models.symmetric_range_gap_sigma_true_atom.axiom_of_infinity_t : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)).HoldsAx Classicism.P.AxiomOfInfinityT.schemaIn

/-- `symmetric-range-gap-sigma-true-atom`: Actuality holds. -/
def Models.symmetric_range_gap_sigma_true_atom.actuality : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)).HoldsAx Classicism.P.Actuality.schemaIn

/-- `symmetric-range-gap-sigma-true-atom`: BF fails. -/
def Models.symmetric_range_gap_sigma_true_atom.barcan_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)).IsModel ∧ ¬ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)).HoldsAx Classicism.P.Barcan.schemaIn

/-- `symmetric-range-gap-sigma-true-atom`: Boolean Completeness holds. -/
def Models.symmetric_range_gap_sigma_true_atom.boolean_completeness_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)).HoldsAx Classicism.P.BooleanCompleteness.schemaIn

/-- `symmetric-range-gap-sigma-true-atom`: Truths are ND-necessary holds. -/
def Models.symmetric_range_gap_sigma_true_atom.truths_are_nd_necessary : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)).HoldsAx Classicism.P.TruthsAreNDNecessary.schemaIn

/-- `symmetric-range-gap-sigma-true-atom`: No Pure Contingency holds. -/
def Models.symmetric_range_gap_sigma_true_atom.no_pure_contingency_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `symmetric-recurrent-colours`: Relational Choice fails. -/
def Models.symmetric_recurrent_colours.relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.colourBase)).IsModel ∧ ¬ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.colourBase)).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `symmetric-recurrent-colours`: Axiom of Infinity (type e) holds. -/
def Models.symmetric_recurrent_colours.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.colourBase)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.colourBase)).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `symmetric-recurrent-colours`: Axiom of Infinity (type t) holds. -/
def Models.symmetric_recurrent_colours.axiom_of_infinity_t : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.colourBase)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.colourBase)).HoldsAx Classicism.P.AxiomOfInfinityT.schemaIn

/-- `symmetric-recurrent-colours`: BF holds. -/
def Models.symmetric_recurrent_colours.barcan_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.colourBase)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.colourBase)).HoldsAx Classicism.P.Barcan.schemaIn

/-- `symmetric-recurrent-colours`: Boolean Completeness holds. -/
def Models.symmetric_recurrent_colours.boolean_completeness_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.colourBase)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.colourBase)).HoldsAx Classicism.P.BooleanCompleteness.schemaIn

/-- `symmetric-recurrent-colours`: Independence (signature Σ) fails. -/
def Models.symmetric_recurrent_colours.independence_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.colourBase)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.colourBase))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.colourBase)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.colourBase))).IsModel ∧ ¬ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.colourBase)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.colourBase))).HoldsAx (Classicism.Meta.AxiomSet.independence _)

/-- `symmetric-two-object-all-maps`: Relational Choice fails. -/
def Models.symmetric_two_object_all_maps.relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.allMapsBase)).IsModel ∧ ¬ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.allMapsBase)).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `symmetric-two-object-all-maps`: Axiom of Infinity (type e) holds. -/
def Models.symmetric_two_object_all_maps.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.allMapsBase)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.allMapsBase)).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `symmetric-two-object-all-maps`: Axiom of Infinity (type t) holds. -/
def Models.symmetric_two_object_all_maps.axiom_of_infinity_t : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.allMapsBase)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.allMapsBase)).HoldsAx Classicism.P.AxiomOfInfinityT.schemaIn

/-- `symmetric-two-object-all-maps`: Boolean Completeness holds. -/
def Models.symmetric_two_object_all_maps.boolean_completeness_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.allMapsBase)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.allMapsBase)).HoldsAx Classicism.P.BooleanCompleteness.schemaIn

/-- `symmetric-two-object-all-maps`: Independence (signature Σ) fails. -/
def Models.symmetric_two_object_all_maps.independence_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.allMapsBase)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.allMapsBase))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.allMapsBase)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.allMapsBase))).IsModel ∧ ¬ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.allMapsBase)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.allMapsBase))).HoldsAx (Classicism.Meta.AxiomSet.independence _)

/-- `symmetric-two-object-unpinned`: Relational Choice fails. -/
def Models.symmetric_two_object_unpinned.relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.twoBase)).IsModel ∧ ¬ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.twoBase)).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `symmetric-two-object-unpinned`: Axiom of Infinity (type e) holds. -/
def Models.symmetric_two_object_unpinned.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.twoBase)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.twoBase)).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `symmetric-two-object-unpinned`: Axiom of Infinity (type t) holds. -/
def Models.symmetric_two_object_unpinned.axiom_of_infinity_t : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.twoBase)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.twoBase)).HoldsAx Classicism.P.AxiomOfInfinityT.schemaIn

/-- `symmetric-two-object-unpinned`: Boolean Completeness holds. -/
def Models.symmetric_two_object_unpinned.boolean_completeness_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.twoBase)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.twoBase)).HoldsAx Classicism.P.BooleanCompleteness.schemaIn

/-- `symmetric-two-object-unpinned`: Truths are ND-necessary holds. -/
def Models.symmetric_two_object_unpinned.truths_are_nd_necessary : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.twoBase)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.twoBase)).HoldsAx Classicism.P.TruthsAreNDNecessary.schemaIn

/-- `symmetric-two-object-unpinned`: Independence (signature Σ) fails. -/
def Models.symmetric_two_object_unpinned.independence_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.twoBase)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.twoBase))).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.twoBase)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.twoBase))).IsModel ∧ ¬ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.twoBase)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.twoBase))).HoldsAx (Classicism.Meta.AxiomSet.independence _)

/-- `symmetric-two-object-unpinned-sigma-true-atom`: □Boolean Completeness holds. -/
def Models.symmetric_two_object_unpinned_sigma_true_atom.necessary_boolean_completeness_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.twoBase)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.twoBase)).HoldsAx Classicism.P.NecBooleanCompleteness.schemaIn

/-- `symmetric-two-object-unpinned-sigma-true-atom`: Relational Choice fails. -/
def Models.symmetric_two_object_unpinned_sigma_true_atom.relational_choice_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.twoBase)).IsModel ∧ ¬ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.twoBase)).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `symmetric-two-object-unpinned-sigma-true-atom`: Axiom of Infinity (type e) holds. -/
def Models.symmetric_two_object_unpinned_sigma_true_atom.axiom_of_infinity_e : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.twoBase)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.twoBase)).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `symmetric-two-object-unpinned-sigma-true-atom`: Axiom of Infinity (type t) holds. -/
def Models.symmetric_two_object_unpinned_sigma_true_atom.axiom_of_infinity_t : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.twoBase)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.twoBase)).HoldsAx Classicism.P.AxiomOfInfinityT.schemaIn

/-- `symmetric-two-object-unpinned-sigma-true-atom`: Boolean Completeness holds. -/
def Models.symmetric_two_object_unpinned_sigma_true_atom.boolean_completeness_r : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.twoBase)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.twoBase)).HoldsAx Classicism.P.BooleanCompleteness.schemaIn

/-- `symmetric-two-object-unpinned-sigma-true-atom`: Truths are ND-necessary holds. -/
def Models.symmetric_two_object_unpinned_sigma_true_atom.truths_are_nd_necessary : Prop :=
  (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.twoBase)).IsModel ∧ (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.twoBase)).HoldsAx Classicism.P.TruthsAreNDNecessary.schemaIn

/-- `symmetry-constrained-full-all-maps`: Truths are ND-necessary holds. -/
def Models.symmetry_constrained_full_all_maps.truths_are_nd_necessary : Prop :=
  (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.allMaps).IsModel ∧ (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.allMaps).HoldsAx Classicism.P.TruthsAreNDNecessary.schemaIn

/-- `symmetry-constrained-full-all-maps`: No Pure Contingency holds. -/
def Models.symmetry_constrained_full_all_maps.no_pure_contingency_r : Prop :=
  (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.allMaps).IsModel ∧ (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.allMaps).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `symmetry-constrained-full-all-maps`: Transversal Choice holds. -/
def Models.symmetry_constrained_full_all_maps.transversal_choice_r : Prop :=
  (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.allMaps).IsModel ∧ (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.allMaps).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- `symmetry-constrained-full-all-maps`: Independence (signature Σ) fails. -/
def Models.symmetry_constrained_full_all_maps.independence_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.allMaps) (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.allMaps)).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.allMaps) (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.allMaps)).IsModel ∧ ¬ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.allMaps) (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.allMaps)).HoldsAx (Classicism.Meta.AxiomSet.independence _)

/-- `symmetry-constrained-full-all-maps`: No Contingency (signature Σ) holds. -/
def Models.symmetry_constrained_full_all_maps.no_contingency_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.allMaps) (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.allMaps)).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.allMaps) (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.allMaps)).IsModel ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.allMaps) (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.allMaps)).HoldsAx (Classicism.Meta.AxiomSet.noContingency _)

/-- `symmetry-constrained-full-all-maps-sigma-true-atom`: Truths are ND-necessary holds. -/
def Models.symmetry_constrained_full_all_maps_sigma_true_atom.truths_are_nd_necessary : Prop :=
  (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.allMaps).IsModel ∧ (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.allMaps).HoldsAx Classicism.P.TruthsAreNDNecessary.schemaIn

/-- `symmetry-constrained-full-all-maps-sigma-true-atom`: No Pure Contingency holds. -/
def Models.symmetry_constrained_full_all_maps_sigma_true_atom.no_pure_contingency_r : Prop :=
  (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.allMaps).IsModel ∧ (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.allMaps).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `symmetry-constrained-full-all-maps-sigma-true-atom`: Transversal Choice holds. -/
def Models.symmetry_constrained_full_all_maps_sigma_true_atom.transversal_choice_r : Prop :=
  (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.allMaps).IsModel ∧ (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.allMaps).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- `symmetry-constrained-full-collapse`: Truths are ND-necessary holds. -/
def Models.symmetry_constrained_full_collapse.truths_are_nd_necessary : Prop :=
  (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.permsCollapses).IsModel ∧ (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.permsCollapses).HoldsAx Classicism.P.TruthsAreNDNecessary.schemaIn

/-- `symmetry-constrained-full-collapse`: No Pure Contingency holds. -/
def Models.symmetry_constrained_full_collapse.no_pure_contingency_r : Prop :=
  (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.permsCollapses).IsModel ∧ (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.permsCollapses).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `symmetry-constrained-full-collapse`: Transversal Choice holds. -/
def Models.symmetry_constrained_full_collapse.transversal_choice_r : Prop :=
  (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.permsCollapses).IsModel ∧ (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.permsCollapses).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- `symmetry-constrained-full-collapse`: Independence (signature Σ) fails. -/
def Models.symmetry_constrained_full_collapse.independence_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.permsCollapses) (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.permsCollapses)).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.permsCollapses) (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.permsCollapses)).IsModel ∧ ¬ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.permsCollapses) (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.permsCollapses)).HoldsAx (Classicism.Meta.AxiomSet.independence _)

/-- `symmetry-constrained-full-collapse`: No Contingency (signature Σ) holds. -/
def Models.symmetry_constrained_full_collapse.no_contingency_signature_r : Prop :=
  (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.permsCollapses) (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.permsCollapses)).Admitted ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.permsCollapses) (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.permsCollapses)).IsModel ∧ (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.permsCollapses) (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.permsCollapses)).HoldsAx (Classicism.Meta.AxiomSet.noContingency _)

/-- `symmetry-constrained-full-collapse-sigma-true-atom`: Truths are ND-necessary holds. -/
def Models.symmetry_constrained_full_collapse_sigma_true_atom.truths_are_nd_necessary : Prop :=
  (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.permsCollapses).IsModel ∧ (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.permsCollapses).HoldsAx Classicism.P.TruthsAreNDNecessary.schemaIn

/-- `symmetry-constrained-full-collapse-sigma-true-atom`: No Pure Contingency holds. -/
def Models.symmetry_constrained_full_collapse_sigma_true_atom.no_pure_contingency_r : Prop :=
  (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.permsCollapses).IsModel ∧ (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.permsCollapses).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- `symmetry-constrained-full-collapse-sigma-true-atom`: Transversal Choice holds. -/
def Models.symmetry_constrained_full_collapse_sigma_true_atom.transversal_choice_r : Prop :=
  (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.permsCollapses).IsModel ∧ (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.permsCollapses).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- argument `barcan-d6`: BF holds in every model meeting its conditions. -/
def Arguments.barcan_d6.barcan_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} {C : Type} [CategoryTheory.SmallCategory C] (A : Classicism.Meta.Intensional.Premodel Sig C), A.IsModel → Classicism.Meta.Intensional.Premodel.D6Surjective A → (A).HoldsAx Classicism.P.Barcan.schemaIn

/-- argument `coherent-retractions`: Gallin Extensional Comprehension holds in every model meeting its conditions. -/
def Arguments.coherent_retractions.gallin_extensional_comprehension_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} {C : Type} [CategoryTheory.SmallCategory C] (A : Classicism.Meta.Intensional.Premodel Sig C), A.IsModel → Classicism.Meta.Intensional.Premodel.Full A → Classicism.Meta.Intensional.Premodel.CoherentRetractions A → (A).HoldsAx Classicism.P.GallinExtensionalComprehension.schemaIn

/-- argument `fewer-propositions-after`: B for pure sentences fails in every model meeting its conditions. -/
def Arguments.fewer_propositions_after.pure_b_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} {C : Type} [CategoryTheory.SmallCategory C] (A : Classicism.Meta.Intensional.Premodel Sig C), A.IsModel → Classicism.Meta.Intensional.Premodel.FewerPropositionsAfter A → ¬ (A).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.signatureB)

/-- argument `finitely-many-propositions-everywhere`: Possible Infinity (type t) fails in every model meeting its conditions. -/
def Arguments.finitely_many_propositions_everywhere.possible_infinity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} {C : Type} [CategoryTheory.SmallCategory C] (A : Classicism.Meta.Intensional.Premodel Sig C), A.IsModel → Classicism.Meta.Intensional.Premodel.FinitelyManyPropositionsEverywhere A → ¬ (A).HoldsAx Classicism.P.PossibleInfinityT.schemaIn

/-- argument `finitely-many-propositions`: Infinity Schema (type t) fails in every model meeting its conditions. -/
def Arguments.finitely_many_propositions.infinity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} {C : Type} [CategoryTheory.SmallCategory C] (A : Classicism.Meta.Intensional.Premodel Sig C), A.IsModel → Classicism.Meta.Intensional.Premodel.Full A → Classicism.Meta.Intensional.Premodel.FinitelyManyPropositions A → ¬ (A).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityT)

/-- argument `finitely-many-propositions`: Axiom of Infinity (type t) fails in every model meeting its conditions. -/
def Arguments.finitely_many_propositions.axiom_of_infinity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} {C : Type} [CategoryTheory.SmallCategory C] (A : Classicism.Meta.Intensional.Premodel Sig C), A.IsModel → Classicism.Meta.Intensional.Premodel.Full A → Classicism.Meta.Intensional.Premodel.FinitelyManyPropositions A → ¬ (A).HoldsAx Classicism.P.AxiomOfInfinityT.schemaIn

/-- argument `full-atomicity`: □Atomicity holds in every model meeting its conditions. -/
def Arguments.full_atomicity.necessary_atomicity_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} {C : Type} [CategoryTheory.SmallCategory C] (A : Classicism.Meta.Intensional.Premodel Sig C), A.IsModel → Classicism.Meta.Intensional.Premodel.Full A → (A).HoldsAx Classicism.P.NecAtomicity.schemaIn

/-- argument `full-epic-barcan`: □BF holds in every model meeting its conditions. -/
def Arguments.full_epic_barcan.necessary_barcan_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} {C : Type} [CategoryTheory.SmallCategory C] (A : Classicism.Meta.Intensional.Premodel Sig C), A.IsModel → Classicism.Meta.Intensional.Premodel.Full A → Classicism.Meta.Intensional.Premodel.EpicArrows A → (A).HoldsAx Classicism.P.NecBarcan.schemaIn

/-- argument `full-rigid-comprehension`: □Rigid Comprehension holds in every model meeting its conditions. -/
def Arguments.full_rigid_comprehension.necessary_rigid_comprehension_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} {C : Type} [CategoryTheory.SmallCategory C] (A : Classicism.Meta.Intensional.Premodel Sig C), A.IsModel → Classicism.Meta.Intensional.Premodel.Full A → (A).HoldsAx Classicism.P.NecRigidComprehension.schemaIn

/-- argument `infinitely-many-individuals`: Axiom of Infinity (type e) holds in every model meeting its conditions. -/
def Arguments.infinitely_many_individuals.axiom_of_infinity_e : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} {C : Type} [CategoryTheory.SmallCategory C] (A : Classicism.Meta.Intensional.Premodel Sig C), A.IsModel → Classicism.Meta.Intensional.Premodel.ExtFull A → Classicism.Meta.Intensional.Premodel.InfinitelyManyIndividuals A → (A).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- argument `infinitely-many-individuals`: Infinity Schema (type e) holds in every model meeting its conditions. -/
def Arguments.infinitely_many_individuals.infinity_e : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} {C : Type} [CategoryTheory.SmallCategory C] (A : Classicism.Meta.Intensional.Premodel Sig C), A.IsModel → Classicism.Meta.Intensional.Premodel.ExtFull A → Classicism.Meta.Intensional.Premodel.InfinitelyManyIndividuals A → (A).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityE)

/-- argument `infinitely-many-propositions`: Axiom of Infinity (type t) holds in every model meeting its conditions. -/
def Arguments.infinitely_many_propositions.axiom_of_infinity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} {C : Type} [CategoryTheory.SmallCategory C] (A : Classicism.Meta.Intensional.Premodel Sig C), A.IsModel → Classicism.Meta.Intensional.Premodel.ExtFull A → Classicism.Meta.Intensional.Premodel.InfinitelyManyPropositions A → (A).HoldsAx Classicism.P.AxiomOfInfinityT.schemaIn

/-- argument `infinitely-many-propositions`: Infinity Schema (type t) holds in every model meeting its conditions. -/
def Arguments.infinitely_many_propositions.infinity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} {C : Type} [CategoryTheory.SmallCategory C] (A : Classicism.Meta.Intensional.Premodel Sig C), A.IsModel → Classicism.Meta.Intensional.Premodel.ExtFull A → Classicism.Meta.Intensional.Premodel.InfinitelyManyPropositions A → (A).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityT)

/-- argument `invertible-arrows`: □ND holds in every model meeting its conditions. -/
def Arguments.invertible_arrows.necessary_distinctness_necessary_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} {C : Type} [CategoryTheory.SmallCategory C] (A : Classicism.Meta.Intensional.Premodel Sig C), A.IsModel → Classicism.Meta.Intensional.Premodel.InvertibleArrows A → (A).HoldsAx Classicism.P.NecNecessityOfDistinctness.schemaIn

/-- argument `invertible-arrows`: □BF holds in every model meeting its conditions. -/
def Arguments.invertible_arrows.necessary_barcan_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} {C : Type} [CategoryTheory.SmallCategory C] (A : Classicism.Meta.Intensional.Premodel Sig C), A.IsModel → Classicism.Meta.Intensional.Premodel.InvertibleArrows A → (A).HoldsAx Classicism.P.NecBarcan.schemaIn

/-- argument `nd-necessity-isolated-actual-world`: Truths are ND-necessary holds in every model meeting its conditions. -/
def Arguments.nd_necessity_isolated_actual_world.truths_are_nd_necessary : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} {C : Type} [CategoryTheory.SmallCategory C] (A : Classicism.Meta.Intensional.Premodel Sig C), A.IsModel → Classicism.Meta.Intensional.Premodel.ActualWorldIsolated A → (A).HoldsAx Classicism.P.TruthsAreNDNecessary.schemaIn

/-- argument `nd-necessity-returning-arrow`: Truths are ND-necessary fails in every model meeting its conditions. -/
def Arguments.nd_necessity_returning_arrow.truths_are_nd_necessary : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} {C : Type} [CategoryTheory.SmallCategory C] (A : Classicism.Meta.Intensional.Premodel Sig C), A.IsModel → Classicism.Meta.Intensional.Premodel.Full A → Classicism.Meta.Intensional.Premodel.ReturningArrow A → ¬ (A).HoldsAx Classicism.P.TruthsAreNDNecessary.schemaIn

/-- argument `no-pure-contingency-one-object`: No Pure Contingency holds in every model meeting its conditions. -/
def Arguments.no_pure_contingency_one_object.no_pure_contingency_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} {C : Type} [CategoryTheory.SmallCategory C] (A : Classicism.Meta.Intensional.Premodel Sig C), A.IsModel → Classicism.Meta.Intensional.Premodel.OneObject A → (A).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency)

/-- argument `nonepic-strong-atomicity`: Strong Atomicity (type t) fails in every model meeting its conditions. -/
def Arguments.nonepic_strong_atomicity.strong_atomicity_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} {C : Type} [CategoryTheory.SmallCategory C] (A : Classicism.Meta.Intensional.Premodel Sig C), A.IsModel → Classicism.Meta.Intensional.Premodel.Full A → Classicism.Meta.Intensional.Premodel.NonepicArrow A → ¬ (A).HoldsAx Classicism.P.StrongAtomicityT.schemaIn

/-- argument `nonidentity-arrow`: Fregean Axiom fails in every model meeting its conditions. -/
def Arguments.nonidentity_arrow.fregean_axiom : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} {C : Type} [CategoryTheory.SmallCategory C] (A : Classicism.Meta.Intensional.Premodel Sig C), A.IsModel → Classicism.Meta.Intensional.Premodel.Full A → Classicism.Meta.Intensional.Premodel.NonidentityArrow A → ¬ (A).HoldsAx Classicism.P.FregeanAxiom.schemaIn

/-- argument `one-individual`: Infinity Schema (type e) fails in every model meeting its conditions. -/
def Arguments.one_individual.infinity_e : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} {C : Type} [CategoryTheory.SmallCategory C] (A : Classicism.Meta.Intensional.Premodel Sig C), A.IsModel → Classicism.Meta.Intensional.Premodel.OneIndividual A → ¬ (A).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityE)

/-- argument `one-individual`: Axiom of Infinity (type e) fails in every model meeting its conditions. -/
def Arguments.one_individual.axiom_of_infinity_e : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} {C : Type} [CategoryTheory.SmallCategory C] (A : Classicism.Meta.Intensional.Premodel Sig C), A.IsModel → Classicism.Meta.Intensional.Premodel.OneIndividual A → ¬ (A).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- argument `one-individual`: Possible Infinity (type e) fails in every model meeting its conditions. -/
def Arguments.one_individual.possible_infinity_e : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} {C : Type} [CategoryTheory.SmallCategory C] (A : Classicism.Meta.Intensional.Premodel Sig C), A.IsModel → Classicism.Meta.Intensional.Premodel.OneIndividual A → ¬ (A).HoldsAx Classicism.P.PossibleInfinityE.schemaIn

/-- argument `relational-choice-full-boxed`: □Relational Choice holds in every model meeting its conditions. -/
def Arguments.relational_choice_full_boxed.necessary_relational_choice_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} {C : Type} [CategoryTheory.SmallCategory C] (A : Classicism.Meta.Intensional.Premodel Sig C), A.IsModel → Classicism.Meta.Intensional.Premodel.Full A → (A).HoldsAx Classicism.P.NecRelationalChoice.schemaIn

/-- argument `relational-choice-full`: Relational Choice holds in every model meeting its conditions. -/
def Arguments.relational_choice_full.relational_choice_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} {C : Type} [CategoryTheory.SmallCategory C] (A : Classicism.Meta.Intensional.Premodel Sig C), A.IsModel → Classicism.Meta.Intensional.Premodel.Full A → (A).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- argument `retractions`: ND holds in every model meeting its conditions. -/
def Arguments.retractions.distinctness_necessary_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} {C : Type} [CategoryTheory.SmallCategory C] (A : Classicism.Meta.Intensional.Premodel Sig C), A.IsModel → Classicism.Meta.Intensional.Premodel.Retractions A → (A).HoldsAx Classicism.P.NecessityOfDistinctness.schemaIn

/-- argument `separated-retractions-strong-actuality`: Strong Actuality fails in every model meeting its conditions. -/
def Arguments.separated_retractions_strong_actuality.strong_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} {C : Type} [CategoryTheory.SmallCategory C] (A : Classicism.Meta.Intensional.Premodel Sig C), A.IsModel → Classicism.Meta.Intensional.Premodel.SeparatedRetractions A → ¬ (A).HoldsAx Classicism.P.StrongActuality.schemaIn

/-- argument `sigma-top-npc`: No Contingency (signature Σ) holds in every model meeting its conditions. -/
def Arguments.sigma_top_npc.no_contingency_signature_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} {C : Type} [CategoryTheory.SmallCategory C] (A : Classicism.Meta.Intensional.Premodel Sig C), A.IsModel → (A).Admitted → Classicism.Meta.Intensional.Premodel.SigmaTop A → (A).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.noContingency) → (A).HoldsAx (Classicism.Meta.AxiomSet.noContingency _)

/-- argument `sigma-top`: Independence (signature Σ) fails in every model meeting its conditions. -/
def Arguments.sigma_top.independence_signature_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} {C : Type} [CategoryTheory.SmallCategory C] (A : Classicism.Meta.Intensional.Premodel Sig C), A.IsModel → (A).Admitted → Classicism.Meta.Intensional.Premodel.SigmaTop A → ¬ (A).HoldsAx (Classicism.Meta.AxiomSet.independence _)

/-- argument `strong-actuality-unique-retractions`: Strong Actuality holds in every model meeting its conditions. -/
def Arguments.strong_actuality_unique_retractions.strong_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} {C : Type} [CategoryTheory.SmallCategory C] (A : Classicism.Meta.Intensional.Premodel Sig C), A.IsModel → Classicism.Meta.Intensional.Premodel.IdentitySingletons A → Classicism.Meta.Intensional.Premodel.UniqueRetractionsEverywhere A → (A).HoldsAx Classicism.P.StrongActuality.schemaIn

/-- argument `strong-actuality-unique-retractions`: □Strong Actuality holds in every model meeting its conditions. -/
def Arguments.strong_actuality_unique_retractions.necessary_strong_actuality : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} {C : Type} [CategoryTheory.SmallCategory C] (A : Classicism.Meta.Intensional.Premodel Sig C), A.IsModel → Classicism.Meta.Intensional.Premodel.IdentitySingletons A → Classicism.Meta.Intensional.Premodel.UniqueRetractionsEverywhere A → (A).HoldsAx Classicism.P.NecStrongActuality.schemaIn

/-- argument `transversal-choice-extensionally-full`: Transversal Choice holds in every model meeting its conditions. -/
def Arguments.transversal_choice_extensionally_full.transversal_choice_r : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} {C : Type} [CategoryTheory.SmallCategory C] (A : Classicism.Meta.Intensional.Premodel Sig C), A.IsModel → Classicism.Meta.Intensional.Premodel.ExtFull A → (A).HoldsAx Classicism.P.TransversalChoice.schemaIn

/-- argument `unretracted-arrow`: ND (type t) fails in every model meeting its conditions. -/
def Arguments.unretracted_arrow.distinctness_necessary_t : Prop :=
  ∀ {Sig : Classicism.Meta.Signature} {C : Type} [CategoryTheory.SmallCategory C] (A : Classicism.Meta.Intensional.Premodel Sig C), A.IsModel → Classicism.Meta.Intensional.Premodel.Full A → Classicism.Meta.Intensional.Premodel.UnretractedArrow A → ¬ (A).HoldsAx Classicism.P.NecessityOfDistinctnessT.schemaIn

/-- `coalesced-sums`, argument `intensional-choice-component`: Intensional Choice fails in every model meeting its conditions. -/
def Arguments.coalesced_sums.intensional_choice_component.intensional_choice_r : Prop :=
  ∀ (D : Classicism.Meta.Coalesced.SumData), Classicism.Meta.Coalesced.SumData.CompleteComponents D → Classicism.Meta.Coalesced.SumData.DistinguishedArrows D → Classicism.Meta.Coalesced.SumData.FullestDomains D → ¬ ((Classicism.Meta.Coalesced.SumData.model D)).HoldsAx Classicism.P.IntensionalChoice.schemaIn

/-- `coalesced-sums`, argument `relational-choice-free-root`: Relational Choice holds in every model meeting its conditions. -/
def Arguments.coalesced_sums.relational_choice_free_root.relational_choice_r : Prop :=
  ∀ (D : Classicism.Meta.Coalesced.SumData), Classicism.Meta.Coalesced.SumData.FreeRootComponent D → ((Classicism.Meta.Coalesced.SumData.model D)).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `coalesced-sums`, argument `actuality-singleton-root`: Actuality holds in every model meeting its conditions. -/
def Arguments.coalesced_sums.actuality_singleton_root.actuality : Prop :=
  ∀ (D : Classicism.Meta.Coalesced.SumData), Classicism.Meta.Intensional.Premodel.ActualWorldIsolated (Classicism.Meta.Coalesced.SumData.model D) → ((Classicism.Meta.Coalesced.SumData.model D)).HoldsAx Classicism.P.Actuality.schemaIn

/-- `coalesced-sums`, argument `barcan-t-component`: BF (type t) fails in every model meeting its conditions. -/
def Arguments.coalesced_sums.barcan_t_component.barcan_t : Prop :=
  ∀ (D : Classicism.Meta.Coalesced.SumData), Classicism.Meta.Coalesced.SumData.CompleteComponents D → Classicism.Meta.Coalesced.SumData.DistinguishedArrows D → Classicism.Meta.Coalesced.SumData.FullestDomains D → ¬ ((Classicism.Meta.Coalesced.SumData.model D)).HoldsAx Classicism.P.BarcanT.schemaIn

/-- `coalesced-sums`, argument `atomicity-t-component`: Atomicity (type t) fails in every model meeting its conditions. -/
def Arguments.coalesced_sums.atomicity_t_component.atomicity_t : Prop :=
  ∀ (D : Classicism.Meta.Coalesced.SumData), Classicism.Meta.Coalesced.SumData.CompleteComponents D → Classicism.Meta.Coalesced.SumData.DistinguishedArrows D → Classicism.Meta.Coalesced.SumData.FullestDomains D → ¬ ((Classicism.Meta.Coalesced.SumData.model D)).HoldsAx Classicism.P.AtomicityT.schemaIn

/-- `coalesced-sums`, argument `boolean-completeness-t-component`: Boolean Completeness (type t) fails in every model meeting its conditions. -/
def Arguments.coalesced_sums.boolean_completeness_t_component.boolean_completeness_t : Prop :=
  ∀ (D : Classicism.Meta.Coalesced.SumData), Classicism.Meta.Coalesced.SumData.CompleteComponents D → Classicism.Meta.Coalesced.SumData.DistinguishedArrows D → Classicism.Meta.Coalesced.SumData.FullestDomains D → ¬ ((Classicism.Meta.Coalesced.SumData.model D)).HoldsAx Classicism.P.BooleanCompletenessT.schemaIn

/-- `coalesced-sums`, argument `pure-sentences-possible`: □Vicinity fails in every model meeting its conditions. -/
def Arguments.coalesced_sums.pure_sentences_possible.necessary_vicinity : Prop :=
  ∀ (D : Classicism.Meta.Coalesced.SumData), Classicism.Meta.Coalesced.SumData.CompleteComponents D → ¬ ((Classicism.Meta.Coalesced.SumData.model D)).HoldsAx Classicism.P.NecVicinity.schemaIn

/-- `coalesced-sums`, argument `pure-sentences-possible`: □Weakly Inextensible Comprehension fails in every model meeting its conditions. -/
def Arguments.coalesced_sums.pure_sentences_possible.necessary_weakly_inextensible_comprehension_r : Prop :=
  ∀ (D : Classicism.Meta.Coalesced.SumData), Classicism.Meta.Coalesced.SumData.CompleteComponents D → ¬ ((Classicism.Meta.Coalesced.SumData.model D)).HoldsAx Classicism.P.NecWeaklyInextensibleComprehension.schemaIn

/-- `coalesced-sums`, argument `transversal-boxed`: □Transversal fails in every model meeting its conditions. -/
def Arguments.coalesced_sums.transversal_boxed.necessary_transversal_r : Prop :=
  ∀ (D : Classicism.Meta.Coalesced.SumData), Classicism.Meta.Coalesced.SumData.CompleteComponents D → ¬ ((Classicism.Meta.Coalesced.SumData.model D)).HoldsAx Classicism.P.NecTransversal.schemaIn

/-- `coalesced-sums`, argument `arithmetic-necessitism-complete-components`: Arithmetic Necessitism holds in every model meeting its conditions. -/
def Arguments.coalesced_sums.arithmetic_necessitism_complete_components.arithmetic_necessitism : Prop :=
  ∀ (D : Classicism.Meta.Coalesced.SumData), Classicism.Meta.Coalesced.SumData.CompleteComponents D → ((Classicism.Meta.Coalesced.SumData.model D)).HoldsAx Classicism.P.ArithmeticNecessitism.schemaIn

/-- `coalesced-sums`, argument `necessary-axiom-of-infinity-complete-components`: □Axiom of Infinity (type e) fails in every model meeting its conditions. -/
def Arguments.coalesced_sums.necessary_axiom_of_infinity_complete_components.necessary_axiom_of_infinity_e : Prop :=
  ∀ (D : Classicism.Meta.Coalesced.SumData), Classicism.Meta.Coalesced.SumData.CompleteComponents D → ¬ ((Classicism.Meta.Coalesced.SumData.model D)).HoldsAx Classicism.P.NecAxiomOfInfinityE.schemaIn

/-- `coalesced-sums`, argument `necessary-axiom-of-infinity-complete-components`: □Axiom of Infinity (type t) fails in every model meeting its conditions. -/
def Arguments.coalesced_sums.necessary_axiom_of_infinity_complete_components.necessary_axiom_of_infinity_t : Prop :=
  ∀ (D : Classicism.Meta.Coalesced.SumData), Classicism.Meta.Coalesced.SumData.CompleteComponents D → ¬ ((Classicism.Meta.Coalesced.SumData.model D)).HoldsAx Classicism.P.NecAxiomOfInfinityT.schemaIn

/-- `coalesced-sums`, argument `self-atomicity-component`: Self-Atomicity (type t) fails in every model meeting its conditions. -/
def Arguments.coalesced_sums.self_atomicity_component.self_atomicity_t : Prop :=
  ∀ (D : Classicism.Meta.Coalesced.SumData), Classicism.Meta.Coalesced.SumData.CompleteComponents D → Classicism.Meta.Coalesced.SumData.DistinguishedArrows D → Classicism.Meta.Coalesced.SumData.FullestDomains D → ¬ ((Classicism.Meta.Coalesced.SumData.model D)).HoldsAx Classicism.P.SelfAtomicityT.schemaIn

/-- `coalesced-sums`, argument `self-atomicity-component`: Atoms are self-atoms (type t) fails in every model meeting its conditions. -/
def Arguments.coalesced_sums.self_atomicity_component.atoms_are_self_atoms_t : Prop :=
  ∀ (D : Classicism.Meta.Coalesced.SumData), Classicism.Meta.Coalesced.SumData.CompleteComponents D → Classicism.Meta.Coalesced.SumData.DistinguishedArrows D → Classicism.Meta.Coalesced.SumData.FullestDomains D → ¬ ((Classicism.Meta.Coalesced.SumData.model D)).HoldsAx Classicism.P.AtomsAreSelfAtomsT.schemaIn

/-- `finite-support-one-object`, argument `actual-world`: Actuality holds in every model meeting its conditions. -/
def Arguments.finite_support_one_object.actual_world.actuality : Prop :=
  ∀ (M : Type) [Monoid M] [MulAction M ℕ] [FaithfulSMul M ℕ], Classicism.Meta.Intensional.MonoidModel.ActualWorldPinned M → ((Classicism.Meta.Intensional.MonoidModel.model M)).HoldsAx Classicism.P.Actuality.schemaIn

/-- `finite-support-one-object`, argument `collapsing-atomless`: Atomicity fails in every model meeting its conditions. -/
def Arguments.finite_support_one_object.collapsing_atomless.atomicity_r : Prop :=
  ∀ (M : Type) [Monoid M] [MulAction M ℕ] [FaithfulSMul M ℕ], Classicism.Meta.Intensional.MonoidModel.CollapseUnpinned M → ¬ ((Classicism.Meta.Intensional.MonoidModel.model M)).HoldsAx Classicism.P.Atomicity.schemaIn

/-- `finite-support-one-object`, argument `collapsing-atomless`: Atomicity (type t) fails in every model meeting its conditions. -/
def Arguments.finite_support_one_object.collapsing_atomless.atomicity_t : Prop :=
  ∀ (M : Type) [Monoid M] [MulAction M ℕ] [FaithfulSMul M ℕ], Classicism.Meta.Intensional.MonoidModel.CollapseUnpinned M → ¬ ((Classicism.Meta.Intensional.MonoidModel.model M)).HoldsAx Classicism.P.AtomicityT.schemaIn

/-- `finite-support-one-object`, argument `barcan-positive`: BF fails in every model meeting its conditions. -/
def Arguments.finite_support_one_object.barcan_positive.barcan_r : Prop :=
  ∀ (M : Type) [Monoid M] [MulAction M ℕ] [FaithfulSMul M ℕ], Classicism.Meta.Intensional.MonoidModel.PositivePreserving M → ¬ ((Classicism.Meta.Intensional.MonoidModel.model M)).HoldsAx Classicism.P.Barcan.schemaIn

/-- `henkin`, argument `extensionality`: Extensionality holds in every model meeting its conditions. -/
def Arguments.henkin.extensionality.extensionality_r : Prop :=
  ∀ (D : Type) [Nonempty D], ((Classicism.Meta.Intensional.Henkin.model D)).HoldsAx Classicism.P.Extensionality.schemaIn

/-- `henkin`, argument `functional-choice`: Functional Choice holds in every model meeting its conditions. -/
def Arguments.henkin.functional_choice.functional_choice_r : Prop :=
  ∀ (D : Type) [Nonempty D], ((Classicism.Meta.Intensional.Henkin.model D)).HoldsAx Classicism.P.FunctionalChoice.schemaIn

/-- `henkin`, argument `finitely-many-individuals`: Infinity Schema (type e) fails in every model meeting its conditions. -/
def Arguments.henkin.finitely_many_individuals.infinity_e : Prop :=
  ∀ (D : Type) [Nonempty D], Classicism.Meta.Intensional.Henkin.FinitelyManyIndividuals D → ¬ ((Classicism.Meta.Intensional.Henkin.model D)).HoldsAx (Classicism.Meta.AxiomSet.pureVersion Classicism.Meta.AxiomSet.infinityE)

/-- `symmetric-ideally-full`, argument `relational-choice`: Relational Choice fails in every model meeting its conditions. -/
def Arguments.symmetric_ideally_full.relational_choice.relational_choice_r : Prop :=
  ∀ (S : Classicism.Meta.Intensional.SymBase), Classicism.Meta.Intensional.SymBase.Transposable S → ¬ ((Classicism.Meta.Intensional.SymBase.model S)).HoldsAx Classicism.P.RelationalChoice.schemaIn

/-- `symmetric-ideally-full`, argument `axiom-of-infinity-e`: Axiom of Infinity (type e) holds in every model meeting its conditions. -/
def Arguments.symmetric_ideally_full.axiom_of_infinity_e.axiom_of_infinity_e : Prop :=
  ∀ (S : Classicism.Meta.Intensional.SymBase), Classicism.Meta.Intensional.Premodel.InfinitelyManyIndividuals (Classicism.Meta.Intensional.SymBase.model S) → ((Classicism.Meta.Intensional.SymBase.model S)).HoldsAx Classicism.P.AxiomOfInfinityE.schemaIn

/-- `symmetric-ideally-full`, argument `axiom-of-infinity-t`: Axiom of Infinity (type t) holds in every model meeting its conditions. -/
def Arguments.symmetric_ideally_full.axiom_of_infinity_t.axiom_of_infinity_t : Prop :=
  ∀ (S : Classicism.Meta.Intensional.SymBase), Classicism.Meta.Intensional.SymBase.SeparableCollapses S → ((Classicism.Meta.Intensional.SymBase.model S)).HoldsAx Classicism.P.AxiomOfInfinityT.schemaIn

/-- `symmetric-ideally-full`, argument `barcan-surjective`: BF holds in every model meeting its conditions. -/
def Arguments.symmetric_ideally_full.barcan_surjective.barcan_r : Prop :=
  ∀ (S : Classicism.Meta.Intensional.SymBase), Classicism.Meta.Intensional.SymBase.SurjectiveArrows S → Classicism.Meta.Intensional.SymBase.FinitePinning S → ((Classicism.Meta.Intensional.SymBase.model S)).HoldsAx Classicism.P.Barcan.schemaIn

/-- `symmetric-ideally-full`, argument `actuality`: Actuality holds in every model meeting its conditions. -/
def Arguments.symmetric_ideally_full.actuality.actuality : Prop :=
  ∀ (S : Classicism.Meta.Intensional.SymBase), Classicism.Meta.Intensional.SymBase.SymmetryGroupPinned S → ((Classicism.Meta.Intensional.SymBase.model S)).HoldsAx Classicism.P.Actuality.schemaIn

/-- `symmetric-ideally-full`, argument `barcan-fixes-or-omits`: BF fails in every model meeting its conditions. -/
def Arguments.symmetric_ideally_full.barcan_fixes_or_omits.barcan_r : Prop :=
  ∀ (S : Classicism.Meta.Intensional.SymBase), Classicism.Meta.Intensional.SymBase.FixesOrOmits S → ¬ ((Classicism.Meta.Intensional.SymBase.model S)).HoldsAx Classicism.P.Barcan.schemaIn

/-- `symmetric-ideally-full`, argument `boolean-completeness`: Boolean Completeness holds in every model meeting its conditions. -/
def Arguments.symmetric_ideally_full.boolean_completeness.boolean_completeness_r : Prop :=
  ∀ (S : Classicism.Meta.Intensional.SymBase), Classicism.Meta.Intensional.SymBase.HullConditions S → ((Classicism.Meta.Intensional.SymBase.model S)).HoldsAx Classicism.P.BooleanCompleteness.schemaIn

end Classicism.Statements
