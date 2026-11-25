import Classicism.MapArguments
import Classicism.MapModels

/-!
# Generated certificates: models' verdicts from the map's arguments

Written by `pmap lean classicism` from the YAML records. **Do not edit.**

Each verdict a general argument gives a model on the map, certified by applying the
argument's certificate (`MapArguments.lean`) to the model: to its proof of being a model,
and its proofs of the conditions the argument requires (its record's `lean.meets`, or its
group's). A group's generated variant with its member's model (differing only in how `Σ`
is interpreted) gets them the same way, and its member's own verdicts on the principles
not relative to `Σ`, by the member's certificates.
-/

namespace Classicism.Map.Models
open Classicism

/-- `coalesced-all-finite-individual-domains`: Relational Choice holds, by `coalesced-sums`'s argument `relational-choice-free-root`. -/
theorem coalesced_all_finite_individual_domains.relational_choice_r : Statements.Models.coalesced_all_finite_individual_domains.relational_choice_r :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel), Classicism.Map.Arguments.coalesced_sums.relational_choice_free_root.relational_choice_r (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel) (Classicism.Meta.Coalesced.SumData.ofAppendixE_free Classicism.Meta.Coalesced.AllFinite.comp_isModel)⟩

/-- `coalesced-all-finite-individual-domains`: Actuality holds, by `coalesced-sums`'s argument `actuality-singleton-root`. -/
theorem coalesced_all_finite_individual_domains.actuality : Statements.Models.coalesced_all_finite_individual_domains.actuality :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel), Classicism.Map.Arguments.coalesced_sums.actuality_singleton_root.actuality (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel) (Classicism.Meta.Coalesced.AllFinite.actualWorldIsolated)⟩

/-- `coalesced-all-finite-individual-domains`: B for pure sentences fails, by the argument `fewer-propositions-after`. -/
theorem coalesced_all_finite_individual_domains.pure_b_r : Statements.Models.coalesced_all_finite_individual_domains.pure_b_r :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel), Classicism.Map.Arguments.fewer_propositions_after.pure_b_r (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)) (Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)) (Classicism.Meta.Coalesced.AllFinite.fewerPropositionsAfter)⟩

/-- `coalesced-all-finite-individual-domains`: □Atomicity holds, by the argument `full-atomicity`. -/
theorem coalesced_all_finite_individual_domains.necessary_atomicity_r : Statements.Models.coalesced_all_finite_individual_domains.necessary_atomicity_r :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel), Classicism.Map.Arguments.full_atomicity.necessary_atomicity_r (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)) (Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)) (Classicism.Meta.Coalesced.AllFinite.full)⟩

/-- `coalesced-all-finite-individual-domains`: □BF holds, by the argument `full-epic-barcan`. -/
theorem coalesced_all_finite_individual_domains.necessary_barcan_r : Statements.Models.coalesced_all_finite_individual_domains.necessary_barcan_r :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel), Classicism.Map.Arguments.full_epic_barcan.necessary_barcan_r (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)) (Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)) (Classicism.Meta.Coalesced.AllFinite.full) (Classicism.Meta.Coalesced.AllFinite.epicArrows)⟩

/-- `coalesced-all-finite-individual-domains`: □Rigid Comprehension holds, by the argument `full-rigid-comprehension`. -/
theorem coalesced_all_finite_individual_domains.necessary_rigid_comprehension_r : Statements.Models.coalesced_all_finite_individual_domains.necessary_rigid_comprehension_r :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel), Classicism.Map.Arguments.full_rigid_comprehension.necessary_rigid_comprehension_r (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)) (Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)) (Classicism.Meta.Coalesced.AllFinite.full)⟩

/-- `coalesced-all-finite-individual-domains`: Axiom of Infinity (type e) holds, by the argument `infinitely-many-individuals`. -/
theorem coalesced_all_finite_individual_domains.axiom_of_infinity_e : Statements.Models.coalesced_all_finite_individual_domains.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel), Classicism.Map.Arguments.infinitely_many_individuals.axiom_of_infinity_e (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)) (Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)) (Classicism.Meta.Intensional.Premodel.Full.extFull _ Classicism.Meta.Coalesced.AllFinite.full) (Classicism.Meta.Coalesced.AllFinite.infinitelyManyIndividuals)⟩

/-- `coalesced-all-finite-individual-domains`: Infinity Schema (type e) holds, by the argument `infinitely-many-individuals`. -/
theorem coalesced_all_finite_individual_domains.infinity_e : Statements.Models.coalesced_all_finite_individual_domains.infinity_e :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel), Classicism.Map.Arguments.infinitely_many_individuals.infinity_e (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)) (Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)) (Classicism.Meta.Intensional.Premodel.Full.extFull _ Classicism.Meta.Coalesced.AllFinite.full) (Classicism.Meta.Coalesced.AllFinite.infinitelyManyIndividuals)⟩

/-- `coalesced-all-finite-individual-domains`: Axiom of Infinity (type t) holds, by the argument `infinitely-many-propositions`. -/
theorem coalesced_all_finite_individual_domains.axiom_of_infinity_t : Statements.Models.coalesced_all_finite_individual_domains.axiom_of_infinity_t :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel), Classicism.Map.Arguments.infinitely_many_propositions.axiom_of_infinity_t (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)) (Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)) (Classicism.Meta.Intensional.Premodel.Full.extFull _ Classicism.Meta.Coalesced.AllFinite.full) (Classicism.Meta.Coalesced.AllFinite.infinitelyManyPropositions)⟩

/-- `coalesced-all-finite-individual-domains`: Infinity Schema (type t) holds, by the argument `infinitely-many-propositions`. -/
theorem coalesced_all_finite_individual_domains.infinity_t : Statements.Models.coalesced_all_finite_individual_domains.infinity_t :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel), Classicism.Map.Arguments.infinitely_many_propositions.infinity_t (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)) (Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)) (Classicism.Meta.Intensional.Premodel.Full.extFull _ Classicism.Meta.Coalesced.AllFinite.full) (Classicism.Meta.Coalesced.AllFinite.infinitelyManyPropositions)⟩

/-- `coalesced-all-finite-individual-domains`: Truths are ND-necessary holds, by the argument `nd-necessity-isolated-actual-world`. -/
theorem coalesced_all_finite_individual_domains.truths_are_nd_necessary : Statements.Models.coalesced_all_finite_individual_domains.truths_are_nd_necessary :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel), Classicism.Map.Arguments.nd_necessity_isolated_actual_world.truths_are_nd_necessary (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)) (Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)) (Classicism.Meta.Coalesced.AllFinite.actualWorldIsolated)⟩

/-- `coalesced-all-finite-individual-domains`: □Relational Choice holds, by the argument `relational-choice-full-boxed`. -/
theorem coalesced_all_finite_individual_domains.necessary_relational_choice_r : Statements.Models.coalesced_all_finite_individual_domains.necessary_relational_choice_r :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel), Classicism.Map.Arguments.relational_choice_full_boxed.necessary_relational_choice_r (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)) (Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)) (Classicism.Meta.Coalesced.AllFinite.full)⟩

/-- `coalesced-all-finite-individual-domains`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem coalesced_all_finite_individual_domains.transversal_choice_r : Statements.Models.coalesced_all_finite_individual_domains.transversal_choice_r :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel), Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)) (Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)) (Classicism.Meta.Intensional.Premodel.Full.extFull _ Classicism.Meta.Coalesced.AllFinite.full)⟩

/-- `coalesced-all-finite-individual-domains`: ND (type t) fails, by the argument `unretracted-arrow`. -/
theorem coalesced_all_finite_individual_domains.distinctness_necessary_t : Statements.Models.coalesced_all_finite_individual_domains.distinctness_necessary_t :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel), Classicism.Map.Arguments.unretracted_arrow.distinctness_necessary_t (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)) (Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)) (Classicism.Meta.Coalesced.AllFinite.full) (Classicism.Meta.Coalesced.AllFinite.unretractedArrow)⟩

/-- `coalesced-all-finite-individual-domains`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem coalesced_all_finite_individual_domains.independence_signature_r : Statements.Models.coalesced_all_finite_individual_domains.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)) (Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.SumData.ofAppendixE Classicism.Meta.Coalesced.AllFinite.comp Classicism.Meta.Coalesced.AllFinite.comp_isModel)))⟩

/-- `coalesced-constant-indexed-root`: Intensional Choice fails, by `coalesced-sums`'s argument `intensional-choice-component`. -/
theorem coalesced_constant_indexed_root.intensional_choice_r : Statements.Models.coalesced_constant_indexed_root.intensional_choice_r :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.constantIndexedData), Classicism.Map.Arguments.coalesced_sums.intensional_choice_component.intensional_choice_r (Classicism.Meta.Coalesced.constantIndexedData) (Classicism.Meta.Coalesced.constantIndexedData_complete) (Classicism.Meta.Coalesced.constantIndexedData_distinguished) (Classicism.Meta.Coalesced.constantIndexedData_fullest)⟩

/-- `coalesced-constant-indexed-root`: Relational Choice holds, by `coalesced-sums`'s argument `relational-choice-free-root`. -/
theorem coalesced_constant_indexed_root.relational_choice_r : Statements.Models.coalesced_constant_indexed_root.relational_choice_r :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.constantIndexedData), Classicism.Map.Arguments.coalesced_sums.relational_choice_free_root.relational_choice_r (Classicism.Meta.Coalesced.constantIndexedData) (Classicism.Meta.Coalesced.constantIndexedData_free)⟩

/-- `coalesced-constant-indexed-root`: Actuality holds, by `coalesced-sums`'s argument `actuality-singleton-root`. -/
theorem coalesced_constant_indexed_root.actuality : Statements.Models.coalesced_constant_indexed_root.actuality :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.constantIndexedData), Classicism.Map.Arguments.coalesced_sums.actuality_singleton_root.actuality (Classicism.Meta.Coalesced.constantIndexedData) (Classicism.Meta.Coalesced.constantIndexedData_isolated)⟩

/-- `coalesced-constant-indexed-root`: BF (type t) fails, by `coalesced-sums`'s argument `barcan-t-component`. -/
theorem coalesced_constant_indexed_root.barcan_t : Statements.Models.coalesced_constant_indexed_root.barcan_t :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.constantIndexedData), Classicism.Map.Arguments.coalesced_sums.barcan_t_component.barcan_t (Classicism.Meta.Coalesced.constantIndexedData) (Classicism.Meta.Coalesced.constantIndexedData_complete) (Classicism.Meta.Coalesced.constantIndexedData_distinguished) (Classicism.Meta.Coalesced.constantIndexedData_fullest)⟩

/-- `coalesced-constant-indexed-root`: Atomicity (type t) fails, by `coalesced-sums`'s argument `atomicity-t-component`. -/
theorem coalesced_constant_indexed_root.atomicity_t : Statements.Models.coalesced_constant_indexed_root.atomicity_t :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.constantIndexedData), Classicism.Map.Arguments.coalesced_sums.atomicity_t_component.atomicity_t (Classicism.Meta.Coalesced.constantIndexedData) (Classicism.Meta.Coalesced.constantIndexedData_complete) (Classicism.Meta.Coalesced.constantIndexedData_distinguished) (Classicism.Meta.Coalesced.constantIndexedData_fullest)⟩

/-- `coalesced-constant-indexed-root`: Boolean Completeness (type t) fails, by `coalesced-sums`'s argument `boolean-completeness-t-component`. -/
theorem coalesced_constant_indexed_root.boolean_completeness_t : Statements.Models.coalesced_constant_indexed_root.boolean_completeness_t :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.constantIndexedData), Classicism.Map.Arguments.coalesced_sums.boolean_completeness_t_component.boolean_completeness_t (Classicism.Meta.Coalesced.constantIndexedData) (Classicism.Meta.Coalesced.constantIndexedData_complete) (Classicism.Meta.Coalesced.constantIndexedData_distinguished) (Classicism.Meta.Coalesced.constantIndexedData_fullest)⟩

/-- `coalesced-constant-indexed-root`: Arithmetic Necessitism holds, by `coalesced-sums`'s argument `arithmetic-necessitism-complete-components`. -/
theorem coalesced_constant_indexed_root.arithmetic_necessitism : Statements.Models.coalesced_constant_indexed_root.arithmetic_necessitism :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.constantIndexedData), Classicism.Map.Arguments.coalesced_sums.arithmetic_necessitism_complete_components.arithmetic_necessitism (Classicism.Meta.Coalesced.constantIndexedData) (Classicism.Meta.Coalesced.constantIndexedData_complete)⟩

/-- `coalesced-constant-indexed-root`: □Axiom of Infinity (type e) fails, by `coalesced-sums`'s argument `necessary-axiom-of-infinity-complete-components`. -/
theorem coalesced_constant_indexed_root.necessary_axiom_of_infinity_e : Statements.Models.coalesced_constant_indexed_root.necessary_axiom_of_infinity_e :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.constantIndexedData), Classicism.Map.Arguments.coalesced_sums.necessary_axiom_of_infinity_complete_components.necessary_axiom_of_infinity_e (Classicism.Meta.Coalesced.constantIndexedData) (Classicism.Meta.Coalesced.constantIndexedData_complete)⟩

/-- `coalesced-constant-indexed-root`: □Axiom of Infinity (type t) fails, by `coalesced-sums`'s argument `necessary-axiom-of-infinity-complete-components`. -/
theorem coalesced_constant_indexed_root.necessary_axiom_of_infinity_t : Statements.Models.coalesced_constant_indexed_root.necessary_axiom_of_infinity_t :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.constantIndexedData), Classicism.Map.Arguments.coalesced_sums.necessary_axiom_of_infinity_complete_components.necessary_axiom_of_infinity_t (Classicism.Meta.Coalesced.constantIndexedData) (Classicism.Meta.Coalesced.constantIndexedData_complete)⟩

/-- `coalesced-constant-indexed-root`: Self-Atomicity (type t) fails, by `coalesced-sums`'s argument `self-atomicity-component`. -/
theorem coalesced_constant_indexed_root.self_atomicity_t : Statements.Models.coalesced_constant_indexed_root.self_atomicity_t :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.constantIndexedData), Classicism.Map.Arguments.coalesced_sums.self_atomicity_component.self_atomicity_t (Classicism.Meta.Coalesced.constantIndexedData) (Classicism.Meta.Coalesced.constantIndexedData_complete) (Classicism.Meta.Coalesced.constantIndexedData_distinguished) (Classicism.Meta.Coalesced.constantIndexedData_fullest)⟩

/-- `coalesced-constant-indexed-root`: Atoms are self-atoms (type t) fails, by `coalesced-sums`'s argument `self-atomicity-component`. -/
theorem coalesced_constant_indexed_root.atoms_are_self_atoms_t : Statements.Models.coalesced_constant_indexed_root.atoms_are_self_atoms_t :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.constantIndexedData), Classicism.Map.Arguments.coalesced_sums.self_atomicity_component.atoms_are_self_atoms_t (Classicism.Meta.Coalesced.constantIndexedData) (Classicism.Meta.Coalesced.constantIndexedData_complete) (Classicism.Meta.Coalesced.constantIndexedData_distinguished) (Classicism.Meta.Coalesced.constantIndexedData_fullest)⟩

/-- `coalesced-constant-indexed-root`: Truths are ND-necessary holds, by the argument `nd-necessity-isolated-actual-world`. -/
theorem coalesced_constant_indexed_root.truths_are_nd_necessary : Statements.Models.coalesced_constant_indexed_root.truths_are_nd_necessary :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.constantIndexedData), Classicism.Map.Arguments.nd_necessity_isolated_actual_world.truths_are_nd_necessary (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.constantIndexedData)) (Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.constantIndexedData)) (Classicism.Meta.Coalesced.constantIndexedData_isolated)⟩

/-- `coalesced-definable-root`: Truths are ND-necessary holds, by the argument `nd-necessity-isolated-actual-world`. -/
theorem coalesced_definable_root.truths_are_nd_necessary : Statements.Models.coalesced_definable_root.truths_are_nd_necessary :=
  ⟨Classicism.Meta.Coalesced.definableRoot_isModel, Classicism.Map.Arguments.nd_necessity_isolated_actual_world.truths_are_nd_necessary (Classicism.Meta.Coalesced.definableRoot) (Classicism.Meta.Coalesced.definableRoot_isModel) (Classicism.Meta.Coalesced.definableRoot_actualWorldIsolated)⟩

/-- `coalesced-definable-root`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem coalesced_definable_root.independence_signature_r : Statements.Models.coalesced_definable_root.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Coalesced.definableRoot_isModel), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Coalesced.definableRoot) (Classicism.Meta.Coalesced.definableRoot_isModel)) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Coalesced.definableRoot_isModel)) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Coalesced.definableRoot_isModel))⟩

/-- `coalesced-maximalist-root`: Intensional Choice fails, by `coalesced-sums`'s argument `intensional-choice-component`. -/
theorem coalesced_maximalist_root.intensional_choice_r : Statements.Models.coalesced_maximalist_root.intensional_choice_r :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.maximalistRoot), Classicism.Map.Arguments.coalesced_sums.intensional_choice_component.intensional_choice_r (Classicism.Meta.Coalesced.maximalistRoot) (Classicism.Meta.Coalesced.maximalistData_complete Classicism.Meta.Coalesced.sigmaTop_closed) (Classicism.Meta.Coalesced.maximalistData_distinguished) (Classicism.Meta.Coalesced.maximalistData_fullest)⟩

/-- `coalesced-maximalist-root`: Relational Choice holds, by `coalesced-sums`'s argument `relational-choice-free-root`. -/
theorem coalesced_maximalist_root.relational_choice_r : Statements.Models.coalesced_maximalist_root.relational_choice_r :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.maximalistRoot), Classicism.Map.Arguments.coalesced_sums.relational_choice_free_root.relational_choice_r (Classicism.Meta.Coalesced.maximalistRoot) (Classicism.Meta.Coalesced.maximalistData_free)⟩

/-- `coalesced-maximalist-root`: Actuality holds, by `coalesced-sums`'s argument `actuality-singleton-root`. -/
theorem coalesced_maximalist_root.actuality : Statements.Models.coalesced_maximalist_root.actuality :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.maximalistRoot), Classicism.Map.Arguments.coalesced_sums.actuality_singleton_root.actuality (Classicism.Meta.Coalesced.maximalistRoot) (Classicism.Meta.Coalesced.maximalistData_isolated)⟩

/-- `coalesced-maximalist-root`: BF (type t) fails, by `coalesced-sums`'s argument `barcan-t-component`. -/
theorem coalesced_maximalist_root.barcan_t : Statements.Models.coalesced_maximalist_root.barcan_t :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.maximalistRoot), Classicism.Map.Arguments.coalesced_sums.barcan_t_component.barcan_t (Classicism.Meta.Coalesced.maximalistRoot) (Classicism.Meta.Coalesced.maximalistData_complete Classicism.Meta.Coalesced.sigmaTop_closed) (Classicism.Meta.Coalesced.maximalistData_distinguished) (Classicism.Meta.Coalesced.maximalistData_fullest)⟩

/-- `coalesced-maximalist-root`: Atomicity (type t) fails, by `coalesced-sums`'s argument `atomicity-t-component`. -/
theorem coalesced_maximalist_root.atomicity_t : Statements.Models.coalesced_maximalist_root.atomicity_t :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.maximalistRoot), Classicism.Map.Arguments.coalesced_sums.atomicity_t_component.atomicity_t (Classicism.Meta.Coalesced.maximalistRoot) (Classicism.Meta.Coalesced.maximalistData_complete Classicism.Meta.Coalesced.sigmaTop_closed) (Classicism.Meta.Coalesced.maximalistData_distinguished) (Classicism.Meta.Coalesced.maximalistData_fullest)⟩

/-- `coalesced-maximalist-root`: Boolean Completeness (type t) fails, by `coalesced-sums`'s argument `boolean-completeness-t-component`. -/
theorem coalesced_maximalist_root.boolean_completeness_t : Statements.Models.coalesced_maximalist_root.boolean_completeness_t :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.maximalistRoot), Classicism.Map.Arguments.coalesced_sums.boolean_completeness_t_component.boolean_completeness_t (Classicism.Meta.Coalesced.maximalistRoot) (Classicism.Meta.Coalesced.maximalistData_complete Classicism.Meta.Coalesced.sigmaTop_closed) (Classicism.Meta.Coalesced.maximalistData_distinguished) (Classicism.Meta.Coalesced.maximalistData_fullest)⟩

/-- `coalesced-maximalist-root`: Arithmetic Necessitism holds, by `coalesced-sums`'s argument `arithmetic-necessitism-complete-components`. -/
theorem coalesced_maximalist_root.arithmetic_necessitism : Statements.Models.coalesced_maximalist_root.arithmetic_necessitism :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.maximalistRoot), Classicism.Map.Arguments.coalesced_sums.arithmetic_necessitism_complete_components.arithmetic_necessitism (Classicism.Meta.Coalesced.maximalistRoot) (Classicism.Meta.Coalesced.maximalistData_complete Classicism.Meta.Coalesced.sigmaTop_closed)⟩

/-- `coalesced-maximalist-root`: □Axiom of Infinity (type e) fails, by `coalesced-sums`'s argument `necessary-axiom-of-infinity-complete-components`. -/
theorem coalesced_maximalist_root.necessary_axiom_of_infinity_e : Statements.Models.coalesced_maximalist_root.necessary_axiom_of_infinity_e :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.maximalistRoot), Classicism.Map.Arguments.coalesced_sums.necessary_axiom_of_infinity_complete_components.necessary_axiom_of_infinity_e (Classicism.Meta.Coalesced.maximalistRoot) (Classicism.Meta.Coalesced.maximalistData_complete Classicism.Meta.Coalesced.sigmaTop_closed)⟩

/-- `coalesced-maximalist-root`: □Axiom of Infinity (type t) fails, by `coalesced-sums`'s argument `necessary-axiom-of-infinity-complete-components`. -/
theorem coalesced_maximalist_root.necessary_axiom_of_infinity_t : Statements.Models.coalesced_maximalist_root.necessary_axiom_of_infinity_t :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.maximalistRoot), Classicism.Map.Arguments.coalesced_sums.necessary_axiom_of_infinity_complete_components.necessary_axiom_of_infinity_t (Classicism.Meta.Coalesced.maximalistRoot) (Classicism.Meta.Coalesced.maximalistData_complete Classicism.Meta.Coalesced.sigmaTop_closed)⟩

/-- `coalesced-maximalist-root`: Self-Atomicity (type t) fails, by `coalesced-sums`'s argument `self-atomicity-component`. -/
theorem coalesced_maximalist_root.self_atomicity_t : Statements.Models.coalesced_maximalist_root.self_atomicity_t :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.maximalistRoot), Classicism.Map.Arguments.coalesced_sums.self_atomicity_component.self_atomicity_t (Classicism.Meta.Coalesced.maximalistRoot) (Classicism.Meta.Coalesced.maximalistData_complete Classicism.Meta.Coalesced.sigmaTop_closed) (Classicism.Meta.Coalesced.maximalistData_distinguished) (Classicism.Meta.Coalesced.maximalistData_fullest)⟩

/-- `coalesced-maximalist-root`: Atoms are self-atoms (type t) fails, by `coalesced-sums`'s argument `self-atomicity-component`. -/
theorem coalesced_maximalist_root.atoms_are_self_atoms_t : Statements.Models.coalesced_maximalist_root.atoms_are_self_atoms_t :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.maximalistRoot), Classicism.Map.Arguments.coalesced_sums.self_atomicity_component.atoms_are_self_atoms_t (Classicism.Meta.Coalesced.maximalistRoot) (Classicism.Meta.Coalesced.maximalistData_complete Classicism.Meta.Coalesced.sigmaTop_closed) (Classicism.Meta.Coalesced.maximalistData_distinguished) (Classicism.Meta.Coalesced.maximalistData_fullest)⟩

/-- `coalesced-maximalist-root`: Truths are ND-necessary holds, by the argument `nd-necessity-isolated-actual-world`. -/
theorem coalesced_maximalist_root.truths_are_nd_necessary : Statements.Models.coalesced_maximalist_root.truths_are_nd_necessary :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.maximalistRoot), Classicism.Map.Arguments.nd_necessity_isolated_actual_world.truths_are_nd_necessary (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.maximalistRoot)) (Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.maximalistRoot)) (Classicism.Meta.Coalesced.maximalistData_isolated)⟩

/-- `coalesced-pinned-interpretations-root`: Relational Choice holds, by `coalesced-sums`'s argument `relational-choice-free-root`. -/
theorem coalesced_pinned_interpretations_root.relational_choice_r : Statements.Models.coalesced_pinned_interpretations_root.relational_choice_r :=
  ⟨Classicism.Meta.Coalesced.pinnedInterpRoot_isModel, Classicism.Map.Arguments.coalesced_sums.relational_choice_free_root.relational_choice_r (Classicism.Meta.Coalesced.pinnedInterpData) (Classicism.Meta.Coalesced.pinnedInterpData_free)⟩

/-- `coalesced-pinned-interpretations-root`: Actuality holds, by `coalesced-sums`'s argument `actuality-singleton-root`. -/
theorem coalesced_pinned_interpretations_root.actuality : Statements.Models.coalesced_pinned_interpretations_root.actuality :=
  ⟨Classicism.Meta.Coalesced.pinnedInterpRoot_isModel, Classicism.Map.Arguments.coalesced_sums.actuality_singleton_root.actuality (Classicism.Meta.Coalesced.pinnedInterpData) (Classicism.Meta.Coalesced.pinnedInterpRoot_actualWorldIsolated)⟩

/-- `coalesced-pinned-interpretations-root`: □Vicinity fails, by `coalesced-sums`'s argument `pure-sentences-possible`. -/
theorem coalesced_pinned_interpretations_root.necessary_vicinity : Statements.Models.coalesced_pinned_interpretations_root.necessary_vicinity :=
  ⟨Classicism.Meta.Coalesced.pinnedInterpRoot_isModel, Classicism.Map.Arguments.coalesced_sums.pure_sentences_possible.necessary_vicinity (Classicism.Meta.Coalesced.pinnedInterpData) (Classicism.Meta.Coalesced.pinnedInterpData_complete)⟩

/-- `coalesced-pinned-interpretations-root`: □Weakly Inextensible Comprehension fails, by `coalesced-sums`'s argument `pure-sentences-possible`. -/
theorem coalesced_pinned_interpretations_root.necessary_weakly_inextensible_comprehension_r : Statements.Models.coalesced_pinned_interpretations_root.necessary_weakly_inextensible_comprehension_r :=
  ⟨Classicism.Meta.Coalesced.pinnedInterpRoot_isModel, Classicism.Map.Arguments.coalesced_sums.pure_sentences_possible.necessary_weakly_inextensible_comprehension_r (Classicism.Meta.Coalesced.pinnedInterpData) (Classicism.Meta.Coalesced.pinnedInterpData_complete)⟩

/-- `coalesced-pinned-interpretations-root`: □Transversal fails, by `coalesced-sums`'s argument `transversal-boxed`. -/
theorem coalesced_pinned_interpretations_root.necessary_transversal_r : Statements.Models.coalesced_pinned_interpretations_root.necessary_transversal_r :=
  ⟨Classicism.Meta.Coalesced.pinnedInterpRoot_isModel, Classicism.Map.Arguments.coalesced_sums.transversal_boxed.necessary_transversal_r (Classicism.Meta.Coalesced.pinnedInterpData) (Classicism.Meta.Coalesced.pinnedInterpData_complete)⟩

/-- `coalesced-pinned-interpretations-root`: Arithmetic Necessitism holds, by `coalesced-sums`'s argument `arithmetic-necessitism-complete-components`. -/
theorem coalesced_pinned_interpretations_root.arithmetic_necessitism : Statements.Models.coalesced_pinned_interpretations_root.arithmetic_necessitism :=
  ⟨Classicism.Meta.Coalesced.pinnedInterpRoot_isModel, Classicism.Map.Arguments.coalesced_sums.arithmetic_necessitism_complete_components.arithmetic_necessitism (Classicism.Meta.Coalesced.pinnedInterpData) (Classicism.Meta.Coalesced.pinnedInterpData_complete)⟩

/-- `coalesced-pinned-interpretations-root`: □Axiom of Infinity (type e) fails, by `coalesced-sums`'s argument `necessary-axiom-of-infinity-complete-components`. -/
theorem coalesced_pinned_interpretations_root.necessary_axiom_of_infinity_e : Statements.Models.coalesced_pinned_interpretations_root.necessary_axiom_of_infinity_e :=
  ⟨Classicism.Meta.Coalesced.pinnedInterpRoot_isModel, Classicism.Map.Arguments.coalesced_sums.necessary_axiom_of_infinity_complete_components.necessary_axiom_of_infinity_e (Classicism.Meta.Coalesced.pinnedInterpData) (Classicism.Meta.Coalesced.pinnedInterpData_complete)⟩

/-- `coalesced-pinned-interpretations-root`: □Axiom of Infinity (type t) fails, by `coalesced-sums`'s argument `necessary-axiom-of-infinity-complete-components`. -/
theorem coalesced_pinned_interpretations_root.necessary_axiom_of_infinity_t : Statements.Models.coalesced_pinned_interpretations_root.necessary_axiom_of_infinity_t :=
  ⟨Classicism.Meta.Coalesced.pinnedInterpRoot_isModel, Classicism.Map.Arguments.coalesced_sums.necessary_axiom_of_infinity_complete_components.necessary_axiom_of_infinity_t (Classicism.Meta.Coalesced.pinnedInterpData) (Classicism.Meta.Coalesced.pinnedInterpData_complete)⟩

/-- `coalesced-pinned-interpretations-root`: Truths are ND-necessary holds, by the argument `nd-necessity-isolated-actual-world`. -/
theorem coalesced_pinned_interpretations_root.truths_are_nd_necessary : Statements.Models.coalesced_pinned_interpretations_root.truths_are_nd_necessary :=
  ⟨Classicism.Meta.Coalesced.pinnedInterpRoot_isModel, Classicism.Map.Arguments.nd_necessity_isolated_actual_world.truths_are_nd_necessary (Classicism.Meta.Coalesced.pinnedInterpRoot) (Classicism.Meta.Coalesced.pinnedInterpRoot_isModel) (Classicism.Meta.Coalesced.pinnedInterpRoot_actualWorldIsolated)⟩

/-- `coalesced-pinned-substitutions-root`: □Vicinity fails, by `coalesced-sums`'s argument `pure-sentences-possible`. -/
theorem coalesced_pinned_substitutions_root.necessary_vicinity : Statements.Models.coalesced_pinned_substitutions_root.necessary_vicinity :=
  ⟨Classicism.Meta.Coalesced.pinnedSubstRoot_isModel, Classicism.Map.Arguments.coalesced_sums.pure_sentences_possible.necessary_vicinity (Classicism.Meta.Coalesced.pinnedSubstData) (Classicism.Meta.Coalesced.pinnedSubstData_complete)⟩

/-- `coalesced-pinned-substitutions-root`: □Weakly Inextensible Comprehension fails, by `coalesced-sums`'s argument `pure-sentences-possible`. -/
theorem coalesced_pinned_substitutions_root.necessary_weakly_inextensible_comprehension_r : Statements.Models.coalesced_pinned_substitutions_root.necessary_weakly_inextensible_comprehension_r :=
  ⟨Classicism.Meta.Coalesced.pinnedSubstRoot_isModel, Classicism.Map.Arguments.coalesced_sums.pure_sentences_possible.necessary_weakly_inextensible_comprehension_r (Classicism.Meta.Coalesced.pinnedSubstData) (Classicism.Meta.Coalesced.pinnedSubstData_complete)⟩

/-- `coalesced-pinned-substitutions-root`: □Transversal fails, by `coalesced-sums`'s argument `transversal-boxed`. -/
theorem coalesced_pinned_substitutions_root.necessary_transversal_r : Statements.Models.coalesced_pinned_substitutions_root.necessary_transversal_r :=
  ⟨Classicism.Meta.Coalesced.pinnedSubstRoot_isModel, Classicism.Map.Arguments.coalesced_sums.transversal_boxed.necessary_transversal_r (Classicism.Meta.Coalesced.pinnedSubstData) (Classicism.Meta.Coalesced.pinnedSubstData_complete)⟩

/-- `coalesced-pinned-substitutions-root`: Arithmetic Necessitism holds, by `coalesced-sums`'s argument `arithmetic-necessitism-complete-components`. -/
theorem coalesced_pinned_substitutions_root.arithmetic_necessitism : Statements.Models.coalesced_pinned_substitutions_root.arithmetic_necessitism :=
  ⟨Classicism.Meta.Coalesced.pinnedSubstRoot_isModel, Classicism.Map.Arguments.coalesced_sums.arithmetic_necessitism_complete_components.arithmetic_necessitism (Classicism.Meta.Coalesced.pinnedSubstData) (Classicism.Meta.Coalesced.pinnedSubstData_complete)⟩

/-- `coalesced-pinned-substitutions-root`: □Axiom of Infinity (type e) fails, by `coalesced-sums`'s argument `necessary-axiom-of-infinity-complete-components`. -/
theorem coalesced_pinned_substitutions_root.necessary_axiom_of_infinity_e : Statements.Models.coalesced_pinned_substitutions_root.necessary_axiom_of_infinity_e :=
  ⟨Classicism.Meta.Coalesced.pinnedSubstRoot_isModel, Classicism.Map.Arguments.coalesced_sums.necessary_axiom_of_infinity_complete_components.necessary_axiom_of_infinity_e (Classicism.Meta.Coalesced.pinnedSubstData) (Classicism.Meta.Coalesced.pinnedSubstData_complete)⟩

/-- `coalesced-pinned-substitutions-root`: □Axiom of Infinity (type t) fails, by `coalesced-sums`'s argument `necessary-axiom-of-infinity-complete-components`. -/
theorem coalesced_pinned_substitutions_root.necessary_axiom_of_infinity_t : Statements.Models.coalesced_pinned_substitutions_root.necessary_axiom_of_infinity_t :=
  ⟨Classicism.Meta.Coalesced.pinnedSubstRoot_isModel, Classicism.Map.Arguments.coalesced_sums.necessary_axiom_of_infinity_complete_components.necessary_axiom_of_infinity_t (Classicism.Meta.Coalesced.pinnedSubstData) (Classicism.Meta.Coalesced.pinnedSubstData_complete)⟩

/-- `coalesced-single-individual-root`: Intensional Choice fails, by `coalesced-sums`'s argument `intensional-choice-component`. -/
theorem coalesced_single_individual_root.intensional_choice_r : Statements.Models.coalesced_single_individual_root.intensional_choice_r :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.singleIndividualData), Classicism.Map.Arguments.coalesced_sums.intensional_choice_component.intensional_choice_r (Classicism.Meta.Coalesced.singleIndividualData) (Classicism.Meta.Coalesced.singleIndividualData_complete) (Classicism.Meta.Coalesced.singleIndividualData_distinguished) (Classicism.Meta.Coalesced.singleIndividualData_fullest)⟩

/-- `coalesced-single-individual-root`: Relational Choice holds, by `coalesced-sums`'s argument `relational-choice-free-root`. -/
theorem coalesced_single_individual_root.relational_choice_r : Statements.Models.coalesced_single_individual_root.relational_choice_r :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.singleIndividualData), Classicism.Map.Arguments.coalesced_sums.relational_choice_free_root.relational_choice_r (Classicism.Meta.Coalesced.singleIndividualData) (Classicism.Meta.Coalesced.singleIndividualData_free)⟩

/-- `coalesced-single-individual-root`: Actuality holds, by `coalesced-sums`'s argument `actuality-singleton-root`. -/
theorem coalesced_single_individual_root.actuality : Statements.Models.coalesced_single_individual_root.actuality :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.singleIndividualData), Classicism.Map.Arguments.coalesced_sums.actuality_singleton_root.actuality (Classicism.Meta.Coalesced.singleIndividualData) (Classicism.Meta.Coalesced.singleIndividualData_isolated)⟩

/-- `coalesced-single-individual-root`: BF (type t) fails, by `coalesced-sums`'s argument `barcan-t-component`. -/
theorem coalesced_single_individual_root.barcan_t : Statements.Models.coalesced_single_individual_root.barcan_t :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.singleIndividualData), Classicism.Map.Arguments.coalesced_sums.barcan_t_component.barcan_t (Classicism.Meta.Coalesced.singleIndividualData) (Classicism.Meta.Coalesced.singleIndividualData_complete) (Classicism.Meta.Coalesced.singleIndividualData_distinguished) (Classicism.Meta.Coalesced.singleIndividualData_fullest)⟩

/-- `coalesced-single-individual-root`: Atomicity (type t) fails, by `coalesced-sums`'s argument `atomicity-t-component`. -/
theorem coalesced_single_individual_root.atomicity_t : Statements.Models.coalesced_single_individual_root.atomicity_t :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.singleIndividualData), Classicism.Map.Arguments.coalesced_sums.atomicity_t_component.atomicity_t (Classicism.Meta.Coalesced.singleIndividualData) (Classicism.Meta.Coalesced.singleIndividualData_complete) (Classicism.Meta.Coalesced.singleIndividualData_distinguished) (Classicism.Meta.Coalesced.singleIndividualData_fullest)⟩

/-- `coalesced-single-individual-root`: Boolean Completeness (type t) fails, by `coalesced-sums`'s argument `boolean-completeness-t-component`. -/
theorem coalesced_single_individual_root.boolean_completeness_t : Statements.Models.coalesced_single_individual_root.boolean_completeness_t :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.singleIndividualData), Classicism.Map.Arguments.coalesced_sums.boolean_completeness_t_component.boolean_completeness_t (Classicism.Meta.Coalesced.singleIndividualData) (Classicism.Meta.Coalesced.singleIndividualData_complete) (Classicism.Meta.Coalesced.singleIndividualData_distinguished) (Classicism.Meta.Coalesced.singleIndividualData_fullest)⟩

/-- `coalesced-single-individual-root`: Arithmetic Necessitism holds, by `coalesced-sums`'s argument `arithmetic-necessitism-complete-components`. -/
theorem coalesced_single_individual_root.arithmetic_necessitism : Statements.Models.coalesced_single_individual_root.arithmetic_necessitism :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.singleIndividualData), Classicism.Map.Arguments.coalesced_sums.arithmetic_necessitism_complete_components.arithmetic_necessitism (Classicism.Meta.Coalesced.singleIndividualData) (Classicism.Meta.Coalesced.singleIndividualData_complete)⟩

/-- `coalesced-single-individual-root`: □Axiom of Infinity (type e) fails, by `coalesced-sums`'s argument `necessary-axiom-of-infinity-complete-components`. -/
theorem coalesced_single_individual_root.necessary_axiom_of_infinity_e : Statements.Models.coalesced_single_individual_root.necessary_axiom_of_infinity_e :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.singleIndividualData), Classicism.Map.Arguments.coalesced_sums.necessary_axiom_of_infinity_complete_components.necessary_axiom_of_infinity_e (Classicism.Meta.Coalesced.singleIndividualData) (Classicism.Meta.Coalesced.singleIndividualData_complete)⟩

/-- `coalesced-single-individual-root`: □Axiom of Infinity (type t) fails, by `coalesced-sums`'s argument `necessary-axiom-of-infinity-complete-components`. -/
theorem coalesced_single_individual_root.necessary_axiom_of_infinity_t : Statements.Models.coalesced_single_individual_root.necessary_axiom_of_infinity_t :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.singleIndividualData), Classicism.Map.Arguments.coalesced_sums.necessary_axiom_of_infinity_complete_components.necessary_axiom_of_infinity_t (Classicism.Meta.Coalesced.singleIndividualData) (Classicism.Meta.Coalesced.singleIndividualData_complete)⟩

/-- `coalesced-single-individual-root`: Self-Atomicity (type t) fails, by `coalesced-sums`'s argument `self-atomicity-component`. -/
theorem coalesced_single_individual_root.self_atomicity_t : Statements.Models.coalesced_single_individual_root.self_atomicity_t :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.singleIndividualData), Classicism.Map.Arguments.coalesced_sums.self_atomicity_component.self_atomicity_t (Classicism.Meta.Coalesced.singleIndividualData) (Classicism.Meta.Coalesced.singleIndividualData_complete) (Classicism.Meta.Coalesced.singleIndividualData_distinguished) (Classicism.Meta.Coalesced.singleIndividualData_fullest)⟩

/-- `coalesced-single-individual-root`: Atoms are self-atoms (type t) fails, by `coalesced-sums`'s argument `self-atomicity-component`. -/
theorem coalesced_single_individual_root.atoms_are_self_atoms_t : Statements.Models.coalesced_single_individual_root.atoms_are_self_atoms_t :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.singleIndividualData), Classicism.Map.Arguments.coalesced_sums.self_atomicity_component.atoms_are_self_atoms_t (Classicism.Meta.Coalesced.singleIndividualData) (Classicism.Meta.Coalesced.singleIndividualData_complete) (Classicism.Meta.Coalesced.singleIndividualData_distinguished) (Classicism.Meta.Coalesced.singleIndividualData_fullest)⟩

/-- `coalesced-single-individual-root`: Truths are ND-necessary holds, by the argument `nd-necessity-isolated-actual-world`. -/
theorem coalesced_single_individual_root.truths_are_nd_necessary : Statements.Models.coalesced_single_individual_root.truths_are_nd_necessary :=
  ⟨Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.singleIndividualData), Classicism.Map.Arguments.nd_necessity_isolated_actual_world.truths_are_nd_necessary (Classicism.Meta.Coalesced.SumData.model (Classicism.Meta.Coalesced.singleIndividualData)) (Classicism.Meta.Coalesced.SumData.isModel (Classicism.Meta.Coalesced.singleIndividualData)) (Classicism.Meta.Coalesced.singleIndividualData_isolated)⟩

/-- `coalesced-substitutions-fullest-root`: Relational Choice holds, by `coalesced-sums`'s argument `relational-choice-free-root`. -/
theorem coalesced_substitutions_fullest_root.relational_choice_r : Statements.Models.coalesced_substitutions_fullest_root.relational_choice_r :=
  ⟨Classicism.Meta.Coalesced.substitutionsFullestRoot_isModel, Classicism.Map.Arguments.coalesced_sums.relational_choice_free_root.relational_choice_r (Classicism.Meta.Coalesced.substitutionsFullestData) (Classicism.Meta.Coalesced.substitutionsFullestData_free)⟩

/-- `coalesced-substitutions-fullest-root`: □Vicinity fails, by `coalesced-sums`'s argument `pure-sentences-possible`. -/
theorem coalesced_substitutions_fullest_root.necessary_vicinity : Statements.Models.coalesced_substitutions_fullest_root.necessary_vicinity :=
  ⟨Classicism.Meta.Coalesced.substitutionsFullestRoot_isModel, Classicism.Map.Arguments.coalesced_sums.pure_sentences_possible.necessary_vicinity (Classicism.Meta.Coalesced.substitutionsFullestData) (Classicism.Meta.Coalesced.substitutionsFullestData_complete)⟩

/-- `coalesced-substitutions-fullest-root`: □Weakly Inextensible Comprehension fails, by `coalesced-sums`'s argument `pure-sentences-possible`. -/
theorem coalesced_substitutions_fullest_root.necessary_weakly_inextensible_comprehension_r : Statements.Models.coalesced_substitutions_fullest_root.necessary_weakly_inextensible_comprehension_r :=
  ⟨Classicism.Meta.Coalesced.substitutionsFullestRoot_isModel, Classicism.Map.Arguments.coalesced_sums.pure_sentences_possible.necessary_weakly_inextensible_comprehension_r (Classicism.Meta.Coalesced.substitutionsFullestData) (Classicism.Meta.Coalesced.substitutionsFullestData_complete)⟩

/-- `coalesced-substitutions-fullest-root`: □Transversal fails, by `coalesced-sums`'s argument `transversal-boxed`. -/
theorem coalesced_substitutions_fullest_root.necessary_transversal_r : Statements.Models.coalesced_substitutions_fullest_root.necessary_transversal_r :=
  ⟨Classicism.Meta.Coalesced.substitutionsFullestRoot_isModel, Classicism.Map.Arguments.coalesced_sums.transversal_boxed.necessary_transversal_r (Classicism.Meta.Coalesced.substitutionsFullestData) (Classicism.Meta.Coalesced.substitutionsFullestData_complete)⟩

/-- `coalesced-substitutions-fullest-root`: Arithmetic Necessitism holds, by `coalesced-sums`'s argument `arithmetic-necessitism-complete-components`. -/
theorem coalesced_substitutions_fullest_root.arithmetic_necessitism : Statements.Models.coalesced_substitutions_fullest_root.arithmetic_necessitism :=
  ⟨Classicism.Meta.Coalesced.substitutionsFullestRoot_isModel, Classicism.Map.Arguments.coalesced_sums.arithmetic_necessitism_complete_components.arithmetic_necessitism (Classicism.Meta.Coalesced.substitutionsFullestData) (Classicism.Meta.Coalesced.substitutionsFullestData_complete)⟩

/-- `coalesced-substitutions-fullest-root`: □Axiom of Infinity (type e) fails, by `coalesced-sums`'s argument `necessary-axiom-of-infinity-complete-components`. -/
theorem coalesced_substitutions_fullest_root.necessary_axiom_of_infinity_e : Statements.Models.coalesced_substitutions_fullest_root.necessary_axiom_of_infinity_e :=
  ⟨Classicism.Meta.Coalesced.substitutionsFullestRoot_isModel, Classicism.Map.Arguments.coalesced_sums.necessary_axiom_of_infinity_complete_components.necessary_axiom_of_infinity_e (Classicism.Meta.Coalesced.substitutionsFullestData) (Classicism.Meta.Coalesced.substitutionsFullestData_complete)⟩

/-- `coalesced-substitutions-fullest-root`: □Axiom of Infinity (type t) fails, by `coalesced-sums`'s argument `necessary-axiom-of-infinity-complete-components`. -/
theorem coalesced_substitutions_fullest_root.necessary_axiom_of_infinity_t : Statements.Models.coalesced_substitutions_fullest_root.necessary_axiom_of_infinity_t :=
  ⟨Classicism.Meta.Coalesced.substitutionsFullestRoot_isModel, Classicism.Map.Arguments.coalesced_sums.necessary_axiom_of_infinity_complete_components.necessary_axiom_of_infinity_t (Classicism.Meta.Coalesced.substitutionsFullestData) (Classicism.Meta.Coalesced.substitutionsFullestData_complete)⟩

/-- `finite-support-dyadic-roundings`: Actuality holds, by `finite-support-one-object`'s argument `actual-world`. -/
theorem finite_support_dyadic_roundings.actuality : Statements.Models.finite_support_dyadic_roundings.actuality :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pow2), Classicism.Map.Arguments.finite_support_one_object.actual_world.actuality (Classicism.Meta.Intensional.Monoids.pow2) (Classicism.Meta.Intensional.MonoidModel.actualWorldPinned_of_onePinned _ Classicism.Meta.Intensional.Monoids.Pow2.onePinned)⟩

/-- `finite-support-dyadic-roundings`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem finite_support_dyadic_roundings.no_pure_contingency_r : Statements.Models.finite_support_dyadic_roundings.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pow2), Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pow2)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pow2)) (Classicism.Meta.Intensional.MonoidModel.oneObject (Classicism.Meta.Intensional.Monoids.pow2))⟩

/-- `finite-support-dyadic-roundings`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem finite_support_dyadic_roundings.transversal_choice_r : Statements.Models.finite_support_dyadic_roundings.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pow2), Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pow2)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pow2)) (Classicism.Meta.Intensional.Premodel.ideal_extFull _ _ _ _)⟩

/-- `finite-support-dyadic-roundings`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem finite_support_dyadic_roundings.independence_signature_r : Statements.Models.finite_support_dyadic_roundings.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pow2)), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pow2)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pow2))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pow2))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pow2)))⟩

/-- `finite-support-dyadic-roundings`: No Contingency (signature Σ) holds, by the argument `sigma-top-npc`. -/
theorem finite_support_dyadic_roundings.no_contingency_signature_r : Statements.Models.finite_support_dyadic_roundings.no_contingency_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pow2)), Classicism.Map.Arguments.sigma_top_npc.no_contingency_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pow2)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pow2))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pow2))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pow2))) (Classicism.Meta.Intensional.Premodel.holdsAx_interp_ofPure.2 ((Classicism.Map.Models.finite_support_dyadic_roundings.no_pure_contingency_r).2))⟩

/-- `finite-support-dyadic-roundings-sigma-true-atom`: BF fails, by its member's certificate, on the same model (`Classicism.Map.Models.finite_support_dyadic_roundings.barcan_r`). -/
theorem finite_support_dyadic_roundings_sigma_true_atom.barcan_r : Statements.Models.finite_support_dyadic_roundings_sigma_true_atom.barcan_r :=
  Classicism.Map.Models.finite_support_dyadic_roundings.barcan_r

/-- `finite-support-dyadic-roundings-sigma-true-atom`: Boolean Completeness fails, by its member's certificate, on the same model (`Classicism.Map.Models.finite_support_dyadic_roundings.boolean_completeness_r`). -/
theorem finite_support_dyadic_roundings_sigma_true_atom.boolean_completeness_r : Statements.Models.finite_support_dyadic_roundings_sigma_true_atom.boolean_completeness_r :=
  Classicism.Map.Models.finite_support_dyadic_roundings.boolean_completeness_r

/-- `finite-support-dyadic-roundings-sigma-true-atom`: Actuality holds, by `finite-support-one-object`'s argument `actual-world`. -/
theorem finite_support_dyadic_roundings_sigma_true_atom.actuality : Statements.Models.finite_support_dyadic_roundings_sigma_true_atom.actuality :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pow2), Classicism.Map.Arguments.finite_support_one_object.actual_world.actuality (Classicism.Meta.Intensional.Monoids.pow2) (Classicism.Meta.Intensional.MonoidModel.actualWorldPinned_of_onePinned _ Classicism.Meta.Intensional.Monoids.Pow2.onePinned)⟩

/-- `finite-support-dyadic-roundings-sigma-true-atom`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem finite_support_dyadic_roundings_sigma_true_atom.no_pure_contingency_r : Statements.Models.finite_support_dyadic_roundings_sigma_true_atom.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pow2), Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pow2)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pow2)) (Classicism.Meta.Intensional.MonoidModel.oneObject (Classicism.Meta.Intensional.Monoids.pow2))⟩

/-- `finite-support-dyadic-roundings-sigma-true-atom`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem finite_support_dyadic_roundings_sigma_true_atom.transversal_choice_r : Statements.Models.finite_support_dyadic_roundings_sigma_true_atom.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pow2), Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pow2)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pow2)) (Classicism.Meta.Intensional.Premodel.ideal_extFull _ _ _ _)⟩

/-- `finite-support-identity-or-collapse-surjections`: Actuality holds, by `finite-support-one-object`'s argument `actual-world`. -/
theorem finite_support_identity_or_collapse_surjections.actuality : Statements.Models.finite_support_identity_or_collapse_surjections.actuality :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj01), Classicism.Map.Arguments.finite_support_one_object.actual_world.actuality (Classicism.Meta.Intensional.Monoids.monoSurj01) (Classicism.Meta.Intensional.MonoidModel.actualWorldPinned_of_onePinned _ Classicism.Meta.Intensional.Monoids.MonoSurj01.onePinned)⟩

/-- `finite-support-identity-or-collapse-surjections`: Atomicity fails, by `finite-support-one-object`'s argument `collapsing-atomless`. -/
theorem finite_support_identity_or_collapse_surjections.atomicity_r : Statements.Models.finite_support_identity_or_collapse_surjections.atomicity_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj01), Classicism.Map.Arguments.finite_support_one_object.collapsing_atomless.atomicity_r (Classicism.Meta.Intensional.Monoids.monoSurj01) (Classicism.Map.Meets.finite_support_identity_or_collapse_surjections.collapse_unpinned)⟩

/-- `finite-support-identity-or-collapse-surjections`: Atomicity (type t) fails, by `finite-support-one-object`'s argument `collapsing-atomless`. -/
theorem finite_support_identity_or_collapse_surjections.atomicity_t : Statements.Models.finite_support_identity_or_collapse_surjections.atomicity_t :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj01), Classicism.Map.Arguments.finite_support_one_object.collapsing_atomless.atomicity_t (Classicism.Meta.Intensional.Monoids.monoSurj01) (Classicism.Map.Meets.finite_support_identity_or_collapse_surjections.collapse_unpinned)⟩

/-- `finite-support-identity-or-collapse-surjections`: BF holds, by the argument `barcan-d6`. -/
theorem finite_support_identity_or_collapse_surjections.barcan_r : Statements.Models.finite_support_identity_or_collapse_surjections.barcan_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj01), Classicism.Map.Arguments.barcan_d6.barcan_r (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj01)) (Classicism.Meta.Intensional.MonoidModel.d6Surjective_of_surjective _ fun k => k.2.2.1)⟩

/-- `finite-support-identity-or-collapse-surjections`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem finite_support_identity_or_collapse_surjections.no_pure_contingency_r : Statements.Models.finite_support_identity_or_collapse_surjections.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj01), Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj01)) (Classicism.Meta.Intensional.MonoidModel.oneObject (Classicism.Meta.Intensional.Monoids.monoSurj01))⟩

/-- `finite-support-identity-or-collapse-surjections`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem finite_support_identity_or_collapse_surjections.transversal_choice_r : Statements.Models.finite_support_identity_or_collapse_surjections.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj01), Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj01)) (Classicism.Meta.Intensional.Premodel.ideal_extFull _ _ _ _)⟩

/-- `finite-support-identity-or-collapse-surjections`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem finite_support_identity_or_collapse_surjections.independence_signature_r : Statements.Models.finite_support_identity_or_collapse_surjections.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj01)), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj01))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj01))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj01)))⟩

/-- `finite-support-identity-or-collapse-surjections`: No Contingency (signature Σ) holds, by the argument `sigma-top-npc`. -/
theorem finite_support_identity_or_collapse_surjections.no_contingency_signature_r : Statements.Models.finite_support_identity_or_collapse_surjections.no_contingency_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj01)), Classicism.Map.Arguments.sigma_top_npc.no_contingency_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj01))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj01))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj01))) (Classicism.Meta.Intensional.Premodel.holdsAx_interp_ofPure.2 ((Classicism.Map.Models.finite_support_identity_or_collapse_surjections.no_pure_contingency_r).2))⟩

/-- `finite-support-identity-or-collapse-surjections-sigma-true-atom`: Boolean Completeness fails, by its member's certificate, on the same model (`Classicism.Map.Models.finite_support_identity_or_collapse_surjections.boolean_completeness_r`). -/
theorem finite_support_identity_or_collapse_surjections_sigma_true_atom.boolean_completeness_r : Statements.Models.finite_support_identity_or_collapse_surjections_sigma_true_atom.boolean_completeness_r :=
  Classicism.Map.Models.finite_support_identity_or_collapse_surjections.boolean_completeness_r

/-- `finite-support-identity-or-collapse-surjections-sigma-true-atom`: Actuality holds, by `finite-support-one-object`'s argument `actual-world`. -/
theorem finite_support_identity_or_collapse_surjections_sigma_true_atom.actuality : Statements.Models.finite_support_identity_or_collapse_surjections_sigma_true_atom.actuality :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj01), Classicism.Map.Arguments.finite_support_one_object.actual_world.actuality (Classicism.Meta.Intensional.Monoids.monoSurj01) (Classicism.Meta.Intensional.MonoidModel.actualWorldPinned_of_onePinned _ Classicism.Meta.Intensional.Monoids.MonoSurj01.onePinned)⟩

/-- `finite-support-identity-or-collapse-surjections-sigma-true-atom`: Atomicity fails, by `finite-support-one-object`'s argument `collapsing-atomless`. -/
theorem finite_support_identity_or_collapse_surjections_sigma_true_atom.atomicity_r : Statements.Models.finite_support_identity_or_collapse_surjections_sigma_true_atom.atomicity_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj01), Classicism.Map.Arguments.finite_support_one_object.collapsing_atomless.atomicity_r (Classicism.Meta.Intensional.Monoids.monoSurj01) (Classicism.Map.Meets.finite_support_identity_or_collapse_surjections.collapse_unpinned)⟩

/-- `finite-support-identity-or-collapse-surjections-sigma-true-atom`: Atomicity (type t) fails, by `finite-support-one-object`'s argument `collapsing-atomless`. -/
theorem finite_support_identity_or_collapse_surjections_sigma_true_atom.atomicity_t : Statements.Models.finite_support_identity_or_collapse_surjections_sigma_true_atom.atomicity_t :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj01), Classicism.Map.Arguments.finite_support_one_object.collapsing_atomless.atomicity_t (Classicism.Meta.Intensional.Monoids.monoSurj01) (Classicism.Map.Meets.finite_support_identity_or_collapse_surjections.collapse_unpinned)⟩

/-- `finite-support-identity-or-collapse-surjections-sigma-true-atom`: BF holds, by the argument `barcan-d6`. -/
theorem finite_support_identity_or_collapse_surjections_sigma_true_atom.barcan_r : Statements.Models.finite_support_identity_or_collapse_surjections_sigma_true_atom.barcan_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj01), Classicism.Map.Arguments.barcan_d6.barcan_r (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj01)) (Classicism.Meta.Intensional.MonoidModel.d6Surjective_of_surjective _ fun k => k.2.2.1)⟩

/-- `finite-support-identity-or-collapse-surjections-sigma-true-atom`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem finite_support_identity_or_collapse_surjections_sigma_true_atom.no_pure_contingency_r : Statements.Models.finite_support_identity_or_collapse_surjections_sigma_true_atom.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj01), Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj01)) (Classicism.Meta.Intensional.MonoidModel.oneObject (Classicism.Meta.Intensional.Monoids.monoSurj01))⟩

/-- `finite-support-identity-or-collapse-surjections-sigma-true-atom`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem finite_support_identity_or_collapse_surjections_sigma_true_atom.transversal_choice_r : Statements.Models.finite_support_identity_or_collapse_surjections_sigma_true_atom.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj01), Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj01)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj01)) (Classicism.Meta.Intensional.Premodel.ideal_extFull _ _ _ _)⟩

/-- `finite-support-identity-or-collapse`: Actuality holds, by `finite-support-one-object`'s argument `actual-world`. -/
theorem finite_support_identity_or_collapse.actuality : Statements.Models.finite_support_identity_or_collapse.actuality :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono01), Classicism.Map.Arguments.finite_support_one_object.actual_world.actuality (Classicism.Meta.Intensional.Monoids.mono01) (Classicism.Meta.Intensional.MonoidModel.actualWorldPinned_of_onePinned _ Classicism.Meta.Intensional.Monoids.Mono01.onePinned)⟩

/-- `finite-support-identity-or-collapse`: Atomicity fails, by `finite-support-one-object`'s argument `collapsing-atomless`. -/
theorem finite_support_identity_or_collapse.atomicity_r : Statements.Models.finite_support_identity_or_collapse.atomicity_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono01), Classicism.Map.Arguments.finite_support_one_object.collapsing_atomless.atomicity_r (Classicism.Meta.Intensional.Monoids.mono01) (Classicism.Map.Meets.finite_support_identity_or_collapse.collapse_unpinned)⟩

/-- `finite-support-identity-or-collapse`: Atomicity (type t) fails, by `finite-support-one-object`'s argument `collapsing-atomless`. -/
theorem finite_support_identity_or_collapse.atomicity_t : Statements.Models.finite_support_identity_or_collapse.atomicity_t :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono01), Classicism.Map.Arguments.finite_support_one_object.collapsing_atomless.atomicity_t (Classicism.Meta.Intensional.Monoids.mono01) (Classicism.Map.Meets.finite_support_identity_or_collapse.collapse_unpinned)⟩

/-- `finite-support-identity-or-collapse`: BF fails, by `finite-support-one-object`'s argument `barcan-positive`. -/
theorem finite_support_identity_or_collapse.barcan_r : Statements.Models.finite_support_identity_or_collapse.barcan_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono01), Classicism.Map.Arguments.finite_support_one_object.barcan_positive.barcan_r (Classicism.Meta.Intensional.Monoids.mono01) (Classicism.Map.Meets.finite_support_identity_or_collapse.positive_preserving)⟩

/-- `finite-support-identity-or-collapse`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem finite_support_identity_or_collapse.no_pure_contingency_r : Statements.Models.finite_support_identity_or_collapse.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono01), Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono01)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono01)) (Classicism.Meta.Intensional.MonoidModel.oneObject (Classicism.Meta.Intensional.Monoids.mono01))⟩

/-- `finite-support-identity-or-collapse`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem finite_support_identity_or_collapse.transversal_choice_r : Statements.Models.finite_support_identity_or_collapse.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono01), Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono01)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono01)) (Classicism.Meta.Intensional.Premodel.ideal_extFull _ _ _ _)⟩

/-- `finite-support-identity-or-collapse`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem finite_support_identity_or_collapse.independence_signature_r : Statements.Models.finite_support_identity_or_collapse.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono01)), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono01)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono01))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono01))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono01)))⟩

/-- `finite-support-identity-or-collapse`: No Contingency (signature Σ) holds, by the argument `sigma-top-npc`. -/
theorem finite_support_identity_or_collapse.no_contingency_signature_r : Statements.Models.finite_support_identity_or_collapse.no_contingency_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono01)), Classicism.Map.Arguments.sigma_top_npc.no_contingency_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono01)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono01))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono01))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono01))) (Classicism.Meta.Intensional.Premodel.holdsAx_interp_ofPure.2 ((Classicism.Map.Models.finite_support_identity_or_collapse.no_pure_contingency_r).2))⟩

/-- `finite-support-identity-or-collapse-sigma-true-atom`: Boolean Completeness fails, by its member's certificate, on the same model (`Classicism.Map.Models.finite_support_identity_or_collapse.boolean_completeness_r`). -/
theorem finite_support_identity_or_collapse_sigma_true_atom.boolean_completeness_r : Statements.Models.finite_support_identity_or_collapse_sigma_true_atom.boolean_completeness_r :=
  Classicism.Map.Models.finite_support_identity_or_collapse.boolean_completeness_r

/-- `finite-support-identity-or-collapse-sigma-true-atom`: Actuality holds, by `finite-support-one-object`'s argument `actual-world`. -/
theorem finite_support_identity_or_collapse_sigma_true_atom.actuality : Statements.Models.finite_support_identity_or_collapse_sigma_true_atom.actuality :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono01), Classicism.Map.Arguments.finite_support_one_object.actual_world.actuality (Classicism.Meta.Intensional.Monoids.mono01) (Classicism.Meta.Intensional.MonoidModel.actualWorldPinned_of_onePinned _ Classicism.Meta.Intensional.Monoids.Mono01.onePinned)⟩

/-- `finite-support-identity-or-collapse-sigma-true-atom`: Atomicity fails, by `finite-support-one-object`'s argument `collapsing-atomless`. -/
theorem finite_support_identity_or_collapse_sigma_true_atom.atomicity_r : Statements.Models.finite_support_identity_or_collapse_sigma_true_atom.atomicity_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono01), Classicism.Map.Arguments.finite_support_one_object.collapsing_atomless.atomicity_r (Classicism.Meta.Intensional.Monoids.mono01) (Classicism.Map.Meets.finite_support_identity_or_collapse.collapse_unpinned)⟩

/-- `finite-support-identity-or-collapse-sigma-true-atom`: Atomicity (type t) fails, by `finite-support-one-object`'s argument `collapsing-atomless`. -/
theorem finite_support_identity_or_collapse_sigma_true_atom.atomicity_t : Statements.Models.finite_support_identity_or_collapse_sigma_true_atom.atomicity_t :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono01), Classicism.Map.Arguments.finite_support_one_object.collapsing_atomless.atomicity_t (Classicism.Meta.Intensional.Monoids.mono01) (Classicism.Map.Meets.finite_support_identity_or_collapse.collapse_unpinned)⟩

/-- `finite-support-identity-or-collapse-sigma-true-atom`: BF fails, by `finite-support-one-object`'s argument `barcan-positive`. -/
theorem finite_support_identity_or_collapse_sigma_true_atom.barcan_r : Statements.Models.finite_support_identity_or_collapse_sigma_true_atom.barcan_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono01), Classicism.Map.Arguments.finite_support_one_object.barcan_positive.barcan_r (Classicism.Meta.Intensional.Monoids.mono01) (Classicism.Map.Meets.finite_support_identity_or_collapse.positive_preserving)⟩

/-- `finite-support-identity-or-collapse-sigma-true-atom`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem finite_support_identity_or_collapse_sigma_true_atom.no_pure_contingency_r : Statements.Models.finite_support_identity_or_collapse_sigma_true_atom.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono01), Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono01)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono01)) (Classicism.Meta.Intensional.MonoidModel.oneObject (Classicism.Meta.Intensional.Monoids.mono01))⟩

/-- `finite-support-identity-or-collapse-sigma-true-atom`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem finite_support_identity_or_collapse_sigma_true_atom.transversal_choice_r : Statements.Models.finite_support_identity_or_collapse_sigma_true_atom.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono01), Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono01)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono01)) (Classicism.Meta.Intensional.Premodel.ideal_extFull _ _ _ _)⟩

/-- `finite-support-monotone-maps`: BF fails, by `finite-support-one-object`'s argument `barcan-positive`. -/
theorem finite_support_monotone_maps.barcan_r : Statements.Models.finite_support_monotone_maps.barcan_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono), Classicism.Map.Arguments.finite_support_one_object.barcan_positive.barcan_r (Classicism.Meta.Intensional.Monoids.mono) (Classicism.Map.Meets.finite_support_monotone_maps.positive_preserving)⟩

/-- `finite-support-monotone-maps`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem finite_support_monotone_maps.no_pure_contingency_r : Statements.Models.finite_support_monotone_maps.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono), Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono)) (Classicism.Meta.Intensional.MonoidModel.oneObject (Classicism.Meta.Intensional.Monoids.mono))⟩

/-- `finite-support-monotone-maps`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem finite_support_monotone_maps.transversal_choice_r : Statements.Models.finite_support_monotone_maps.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono), Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono)) (Classicism.Meta.Intensional.Premodel.ideal_extFull _ _ _ _)⟩

/-- `finite-support-monotone-maps-sigma-top`: Atomlessness holds, by its member's certificate, on the same model (`Classicism.Map.Models.finite_support_monotone_maps.atomlessness`). -/
theorem finite_support_monotone_maps_sigma_top.atomlessness : Statements.Models.finite_support_monotone_maps_sigma_top.atomlessness :=
  Classicism.Map.Models.finite_support_monotone_maps.atomlessness

/-- `finite-support-monotone-maps-sigma-top`: Boolean Completeness fails, by its member's certificate, on the same model (`Classicism.Map.Models.finite_support_monotone_maps.boolean_completeness_r`). -/
theorem finite_support_monotone_maps_sigma_top.boolean_completeness_r : Statements.Models.finite_support_monotone_maps_sigma_top.boolean_completeness_r :=
  Classicism.Map.Models.finite_support_monotone_maps.boolean_completeness_r

/-- `finite-support-monotone-maps-sigma-top`: BF fails, by `finite-support-one-object`'s argument `barcan-positive`. -/
theorem finite_support_monotone_maps_sigma_top.barcan_r : Statements.Models.finite_support_monotone_maps_sigma_top.barcan_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono), Classicism.Map.Arguments.finite_support_one_object.barcan_positive.barcan_r (Classicism.Meta.Intensional.Monoids.mono) (Classicism.Map.Meets.finite_support_monotone_maps.positive_preserving)⟩

/-- `finite-support-monotone-maps-sigma-top`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem finite_support_monotone_maps_sigma_top.no_pure_contingency_r : Statements.Models.finite_support_monotone_maps_sigma_top.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono), Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono)) (Classicism.Meta.Intensional.MonoidModel.oneObject (Classicism.Meta.Intensional.Monoids.mono))⟩

/-- `finite-support-monotone-maps-sigma-top`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem finite_support_monotone_maps_sigma_top.transversal_choice_r : Statements.Models.finite_support_monotone_maps_sigma_top.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono), Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono)) (Classicism.Meta.Intensional.Premodel.ideal_extFull _ _ _ _)⟩

/-- `finite-support-monotone-maps-sigma-top`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem finite_support_monotone_maps_sigma_top.independence_signature_r : Statements.Models.finite_support_monotone_maps_sigma_top.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono)), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono)))⟩

/-- `finite-support-monotone-maps-sigma-top`: No Contingency (signature Σ) holds, by the argument `sigma-top-npc`. -/
theorem finite_support_monotone_maps_sigma_top.no_contingency_signature_r : Statements.Models.finite_support_monotone_maps_sigma_top.no_contingency_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono)), Classicism.Map.Arguments.sigma_top_npc.no_contingency_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono))) (Classicism.Meta.Intensional.Premodel.holdsAx_interp_ofPure.2 ((Classicism.Map.Models.finite_support_monotone_maps_sigma_top.no_pure_contingency_r).2))⟩

/-- `finite-support-monotone-surjections`: BF holds, by the argument `barcan-d6`. -/
theorem finite_support_monotone_surjections.barcan_r : Statements.Models.finite_support_monotone_surjections.barcan_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj), Classicism.Map.Arguments.barcan_d6.barcan_r (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj)) (Classicism.Meta.Intensional.MonoidModel.d6Surjective_of_surjective _ fun k => k.2.2)⟩

/-- `finite-support-monotone-surjections`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem finite_support_monotone_surjections.no_pure_contingency_r : Statements.Models.finite_support_monotone_surjections.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj), Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj)) (Classicism.Meta.Intensional.MonoidModel.oneObject (Classicism.Meta.Intensional.Monoids.monoSurj))⟩

/-- `finite-support-monotone-surjections`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem finite_support_monotone_surjections.transversal_choice_r : Statements.Models.finite_support_monotone_surjections.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj), Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj)) (Classicism.Meta.Intensional.Premodel.ideal_extFull _ _ _ _)⟩

/-- `finite-support-monotone-surjections`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem finite_support_monotone_surjections.independence_signature_r : Statements.Models.finite_support_monotone_surjections.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj)), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj)))⟩

/-- `finite-support-monotone-surjections`: No Contingency (signature Σ) holds, by the argument `sigma-top-npc`. -/
theorem finite_support_monotone_surjections.no_contingency_signature_r : Statements.Models.finite_support_monotone_surjections.no_contingency_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj)), Classicism.Map.Arguments.sigma_top_npc.no_contingency_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.monoSurj)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.monoSurj))) (Classicism.Meta.Intensional.Premodel.holdsAx_interp_ofPure.2 ((Classicism.Map.Models.finite_support_monotone_surjections.no_pure_contingency_r).2))⟩

/-- `finite-support-pair-injections-or-collapses`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem finite_support_pair_injections_or_collapses.no_pure_contingency_r : Statements.Models.finite_support_pair_injections_or_collapses.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pairInjCol), Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pairInjCol)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pairInjCol)) (Classicism.Meta.Intensional.MonoidModel.oneObject (Classicism.Meta.Intensional.Monoids.pairInjCol))⟩

/-- `finite-support-pair-injections-or-collapses`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem finite_support_pair_injections_or_collapses.transversal_choice_r : Statements.Models.finite_support_pair_injections_or_collapses.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pairInjCol), Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pairInjCol)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pairInjCol)) (Classicism.Meta.Intensional.Premodel.ideal_extFull _ _ _ _)⟩

/-- `finite-support-pair-injections-or-collapses`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem finite_support_pair_injections_or_collapses.independence_signature_r : Statements.Models.finite_support_pair_injections_or_collapses.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pairInjCol)), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pairInjCol)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pairInjCol))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pairInjCol))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pairInjCol)))⟩

/-- `finite-support-pair-injections-or-collapses`: No Contingency (signature Σ) holds, by the argument `sigma-top-npc`. -/
theorem finite_support_pair_injections_or_collapses.no_contingency_signature_r : Statements.Models.finite_support_pair_injections_or_collapses.no_contingency_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pairInjCol)), Classicism.Map.Arguments.sigma_top_npc.no_contingency_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.pairInjCol)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pairInjCol))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pairInjCol))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.pairInjCol))) (Classicism.Meta.Intensional.Premodel.holdsAx_interp_ofPure.2 ((Classicism.Map.Models.finite_support_pair_injections_or_collapses.no_pure_contingency_r).2))⟩

/-- `finite-support-permutations`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem finite_support_permutations.no_pure_contingency_r : Statements.Models.finite_support_permutations.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.Perms.model_isModel, Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.Perms.model) (Classicism.Meta.Intensional.Perms.model_isModel) (Classicism.Meta.Intensional.MonoidModel.oneObject (Equiv.Perm ℕ))⟩

/-- `finite-support-permutations`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem finite_support_permutations.transversal_choice_r : Statements.Models.finite_support_permutations.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.Perms.model_isModel, Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.Perms.model) (Classicism.Meta.Intensional.Perms.model_isModel) (Classicism.Meta.Intensional.Premodel.ideal_extFull _ _ _ _)⟩

/-- `finite-support-permutations`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem finite_support_permutations.independence_signature_r : Statements.Models.finite_support_permutations.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.Perms.model_isModel), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.Perms.model) (Classicism.Meta.Intensional.Perms.model_isModel)) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.Perms.model_isModel)) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.Perms.model_isModel))⟩

/-- `finite-support-permutations`: No Contingency (signature Σ) holds, by the argument `sigma-top-npc`. -/
theorem finite_support_permutations.no_contingency_signature_r : Statements.Models.finite_support_permutations.no_contingency_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.Perms.model_isModel), Classicism.Map.Arguments.sigma_top_npc.no_contingency_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.Perms.model) (Classicism.Meta.Intensional.Perms.model_isModel)) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.Perms.model_isModel)) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.Perms.model_isModel)) (Classicism.Meta.Intensional.Premodel.holdsAx_interp_ofPure.2 ((Classicism.Map.Models.finite_support_permutations.no_pure_contingency_r).2))⟩

/-- `finite-support-truncated-shifts`: Actuality holds, by `finite-support-one-object`'s argument `actual-world`. -/
theorem finite_support_truncated_shifts.actuality : Statements.Models.finite_support_truncated_shifts.actuality :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.shifts), Classicism.Map.Arguments.finite_support_one_object.actual_world.actuality (Classicism.Meta.Intensional.Monoids.shifts) (Classicism.Meta.Intensional.MonoidModel.actualWorldPinned_of_onePinned _ Classicism.Meta.Intensional.Monoids.Shifts.onePinned)⟩

/-- `finite-support-truncated-shifts`: BF holds, by the argument `barcan-d6`. -/
theorem finite_support_truncated_shifts.barcan_r : Statements.Models.finite_support_truncated_shifts.barcan_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.shifts), Classicism.Map.Arguments.barcan_d6.barcan_r (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.shifts)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.shifts)) (Classicism.Meta.Intensional.MonoidModel.d6Surjective_of_surjective _ Classicism.Meta.Intensional.Monoids.Shifts.surj)⟩

/-- `finite-support-truncated-shifts`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem finite_support_truncated_shifts.no_pure_contingency_r : Statements.Models.finite_support_truncated_shifts.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.shifts), Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.shifts)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.shifts)) (Classicism.Meta.Intensional.MonoidModel.oneObject (Classicism.Meta.Intensional.Monoids.shifts))⟩

/-- `finite-support-truncated-shifts`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem finite_support_truncated_shifts.transversal_choice_r : Statements.Models.finite_support_truncated_shifts.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.shifts), Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.shifts)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.shifts)) (Classicism.Meta.Intensional.Premodel.ideal_extFull _ _ _ _)⟩

/-- `finite-support-truncated-shifts`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem finite_support_truncated_shifts.independence_signature_r : Statements.Models.finite_support_truncated_shifts.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.shifts)), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.shifts)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.shifts))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.shifts))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.shifts)))⟩

/-- `finite-support-truncated-shifts`: No Contingency (signature Σ) holds, by the argument `sigma-top-npc`. -/
theorem finite_support_truncated_shifts.no_contingency_signature_r : Statements.Models.finite_support_truncated_shifts.no_contingency_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.shifts)), Classicism.Map.Arguments.sigma_top_npc.no_contingency_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.shifts)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.shifts))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.shifts))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.shifts))) (Classicism.Meta.Intensional.Premodel.holdsAx_interp_ofPure.2 ((Classicism.Map.Models.finite_support_truncated_shifts.no_pure_contingency_r).2))⟩

/-- `finite-support-truncated-shifts-sigma-true-atom`: Boolean Completeness fails, by its member's certificate, on the same model (`Classicism.Map.Models.finite_support_truncated_shifts.boolean_completeness_r`). -/
theorem finite_support_truncated_shifts_sigma_true_atom.boolean_completeness_r : Statements.Models.finite_support_truncated_shifts_sigma_true_atom.boolean_completeness_r :=
  Classicism.Map.Models.finite_support_truncated_shifts.boolean_completeness_r

/-- `finite-support-truncated-shifts-sigma-true-atom`: Actuality holds, by `finite-support-one-object`'s argument `actual-world`. -/
theorem finite_support_truncated_shifts_sigma_true_atom.actuality : Statements.Models.finite_support_truncated_shifts_sigma_true_atom.actuality :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.shifts), Classicism.Map.Arguments.finite_support_one_object.actual_world.actuality (Classicism.Meta.Intensional.Monoids.shifts) (Classicism.Meta.Intensional.MonoidModel.actualWorldPinned_of_onePinned _ Classicism.Meta.Intensional.Monoids.Shifts.onePinned)⟩

/-- `finite-support-truncated-shifts-sigma-true-atom`: BF holds, by the argument `barcan-d6`. -/
theorem finite_support_truncated_shifts_sigma_true_atom.barcan_r : Statements.Models.finite_support_truncated_shifts_sigma_true_atom.barcan_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.shifts), Classicism.Map.Arguments.barcan_d6.barcan_r (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.shifts)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.shifts)) (Classicism.Meta.Intensional.MonoidModel.d6Surjective_of_surjective _ Classicism.Meta.Intensional.Monoids.Shifts.surj)⟩

/-- `finite-support-truncated-shifts-sigma-true-atom`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem finite_support_truncated_shifts_sigma_true_atom.no_pure_contingency_r : Statements.Models.finite_support_truncated_shifts_sigma_true_atom.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.shifts), Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.shifts)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.shifts)) (Classicism.Meta.Intensional.MonoidModel.oneObject (Classicism.Meta.Intensional.Monoids.shifts))⟩

/-- `finite-support-truncated-shifts-sigma-true-atom`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem finite_support_truncated_shifts_sigma_true_atom.transversal_choice_r : Statements.Models.finite_support_truncated_shifts_sigma_true_atom.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.shifts), Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.shifts)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.shifts)) (Classicism.Meta.Intensional.Premodel.ideal_extFull _ _ _ _)⟩

/-- `finite-support-truncations`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem finite_support_truncations.no_pure_contingency_r : Statements.Models.finite_support_truncations.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.truncs), Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.truncs)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.truncs)) (Classicism.Meta.Intensional.MonoidModel.oneObject (Classicism.Meta.Intensional.Monoids.truncs))⟩

/-- `finite-support-truncations`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem finite_support_truncations.transversal_choice_r : Statements.Models.finite_support_truncations.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.truncs), Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.truncs)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.truncs)) (Classicism.Meta.Intensional.Premodel.ideal_extFull _ _ _ _)⟩

/-- `finite-support-truncations`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem finite_support_truncations.independence_signature_r : Statements.Models.finite_support_truncations.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.truncs)), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.truncs)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.truncs))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.truncs))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.truncs)))⟩

/-- `finite-support-truncations`: No Contingency (signature Σ) holds, by the argument `sigma-top-npc`. -/
theorem finite_support_truncations.no_contingency_signature_r : Statements.Models.finite_support_truncations.no_contingency_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.truncs)), Classicism.Map.Arguments.sigma_top_npc.no_contingency_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.truncs)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.truncs))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.truncs))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.truncs))) (Classicism.Meta.Intensional.Premodel.holdsAx_interp_ofPure.2 ((Classicism.Map.Models.finite_support_truncations.no_pure_contingency_r).2))⟩

/-- `full-double-retraction-glued-constants`: □Atomicity holds, by the argument `full-atomicity`. -/
theorem full_double_retraction_glued_constants.necessary_atomicity_r : Statements.Models.full_double_retraction_glued_constants.necessary_atomicity_r :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.doubleRetractionSites), Classicism.Map.Arguments.full_atomicity.necessary_atomicity_r (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.doubleRetractionSites)) (Classicism.Meta.Intensional.GluedData.full (Classicism.Meta.Intensional.doubleRetractionSites))⟩

/-- `full-double-retraction-glued-constants`: □Rigid Comprehension holds, by the argument `full-rigid-comprehension`. -/
theorem full_double_retraction_glued_constants.necessary_rigid_comprehension_r : Statements.Models.full_double_retraction_glued_constants.necessary_rigid_comprehension_r :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.doubleRetractionSites), Classicism.Map.Arguments.full_rigid_comprehension.necessary_rigid_comprehension_r (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.doubleRetractionSites)) (Classicism.Meta.Intensional.GluedData.full (Classicism.Meta.Intensional.doubleRetractionSites))⟩

/-- `full-double-retraction-glued-constants`: Axiom of Infinity (type t) holds, by the argument `infinitely-many-propositions`. -/
theorem full_double_retraction_glued_constants.axiom_of_infinity_t : Statements.Models.full_double_retraction_glued_constants.axiom_of_infinity_t :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.doubleRetractionSites), Classicism.Map.Arguments.infinitely_many_propositions.axiom_of_infinity_t (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.doubleRetractionSites)) (Classicism.Meta.Intensional.Premodel.Full.extFull _ (Classicism.Meta.Intensional.GluedData.full (Classicism.Meta.Intensional.doubleRetractionSites))) (Classicism.Meta.Intensional.DoubleRetractionSites.infinitely_many_propositions)⟩

/-- `full-double-retraction-glued-constants`: Infinity Schema (type t) holds, by the argument `infinitely-many-propositions`. -/
theorem full_double_retraction_glued_constants.infinity_t : Statements.Models.full_double_retraction_glued_constants.infinity_t :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.doubleRetractionSites), Classicism.Map.Arguments.infinitely_many_propositions.infinity_t (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.doubleRetractionSites)) (Classicism.Meta.Intensional.Premodel.Full.extFull _ (Classicism.Meta.Intensional.GluedData.full (Classicism.Meta.Intensional.doubleRetractionSites))) (Classicism.Meta.Intensional.DoubleRetractionSites.infinitely_many_propositions)⟩

/-- `full-double-retraction-glued-constants`: Truths are ND-necessary fails, by the argument `nd-necessity-returning-arrow`. -/
theorem full_double_retraction_glued_constants.truths_are_nd_necessary : Statements.Models.full_double_retraction_glued_constants.truths_are_nd_necessary :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.doubleRetractionSites), Classicism.Map.Arguments.nd_necessity_returning_arrow.truths_are_nd_necessary (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.doubleRetractionSites)) (Classicism.Meta.Intensional.GluedData.full (Classicism.Meta.Intensional.doubleRetractionSites)) (Classicism.Meta.Intensional.DoubleRetractionSites.returning)⟩

/-- `full-double-retraction-glued-constants`: Strong Atomicity (type t) fails, by the argument `nonepic-strong-atomicity`. -/
theorem full_double_retraction_glued_constants.strong_atomicity_t : Statements.Models.full_double_retraction_glued_constants.strong_atomicity_t :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.doubleRetractionSites), Classicism.Map.Arguments.nonepic_strong_atomicity.strong_atomicity_t (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.doubleRetractionSites)) (Classicism.Meta.Intensional.GluedData.full (Classicism.Meta.Intensional.doubleRetractionSites)) (Classicism.Meta.Intensional.DoubleRetractionSites.nonepic)⟩

/-- `full-double-retraction-glued-constants`: Fregean Axiom fails, by the argument `nonidentity-arrow`. -/
theorem full_double_retraction_glued_constants.fregean_axiom : Statements.Models.full_double_retraction_glued_constants.fregean_axiom :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.doubleRetractionSites), Classicism.Map.Arguments.nonidentity_arrow.fregean_axiom (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.doubleRetractionSites)) (Classicism.Meta.Intensional.GluedData.full (Classicism.Meta.Intensional.doubleRetractionSites)) (Classicism.Meta.Intensional.DoubleRetractionSites.nonidentity)⟩

/-- `full-double-retraction-glued-constants`: Infinity Schema (type e) fails, by the argument `one-individual`. -/
theorem full_double_retraction_glued_constants.infinity_e : Statements.Models.full_double_retraction_glued_constants.infinity_e :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.doubleRetractionSites), Classicism.Map.Arguments.one_individual.infinity_e (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.doubleRetractionSites)) (Classicism.Meta.Intensional.DoubleRetractionSites.one_individual)⟩

/-- `full-double-retraction-glued-constants`: Axiom of Infinity (type e) fails, by the argument `one-individual`. -/
theorem full_double_retraction_glued_constants.axiom_of_infinity_e : Statements.Models.full_double_retraction_glued_constants.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.doubleRetractionSites), Classicism.Map.Arguments.one_individual.axiom_of_infinity_e (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.doubleRetractionSites)) (Classicism.Meta.Intensional.DoubleRetractionSites.one_individual)⟩

/-- `full-double-retraction-glued-constants`: Possible Infinity (type e) fails, by the argument `one-individual`. -/
theorem full_double_retraction_glued_constants.possible_infinity_e : Statements.Models.full_double_retraction_glued_constants.possible_infinity_e :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.doubleRetractionSites), Classicism.Map.Arguments.one_individual.possible_infinity_e (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.doubleRetractionSites)) (Classicism.Meta.Intensional.DoubleRetractionSites.one_individual)⟩

/-- `full-double-retraction-glued-constants`: □Relational Choice holds, by the argument `relational-choice-full-boxed`. -/
theorem full_double_retraction_glued_constants.necessary_relational_choice_r : Statements.Models.full_double_retraction_glued_constants.necessary_relational_choice_r :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.doubleRetractionSites), Classicism.Map.Arguments.relational_choice_full_boxed.necessary_relational_choice_r (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.doubleRetractionSites)) (Classicism.Meta.Intensional.GluedData.full (Classicism.Meta.Intensional.doubleRetractionSites))⟩

/-- `full-double-retraction-glued-constants`: Relational Choice holds, by the argument `relational-choice-full`. -/
theorem full_double_retraction_glued_constants.relational_choice_r : Statements.Models.full_double_retraction_glued_constants.relational_choice_r :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.doubleRetractionSites), Classicism.Map.Arguments.relational_choice_full.relational_choice_r (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.doubleRetractionSites)) (Classicism.Meta.Intensional.GluedData.full (Classicism.Meta.Intensional.doubleRetractionSites))⟩

/-- `full-double-retraction-glued-constants`: Strong Actuality fails, by the argument `separated-retractions-strong-actuality`. -/
theorem full_double_retraction_glued_constants.strong_actuality : Statements.Models.full_double_retraction_glued_constants.strong_actuality :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.doubleRetractionSites), Classicism.Map.Arguments.separated_retractions_strong_actuality.strong_actuality (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.doubleRetractionSites)) (Classicism.Meta.Intensional.DoubleRetractionSites.separated)⟩

/-- `full-double-retraction-glued-constants`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem full_double_retraction_glued_constants.transversal_choice_r : Statements.Models.full_double_retraction_glued_constants.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.doubleRetractionSites), Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.doubleRetractionSites)) (Classicism.Meta.Intensional.Premodel.Full.extFull _ (Classicism.Meta.Intensional.GluedData.full (Classicism.Meta.Intensional.doubleRetractionSites)))⟩

/-- `full-double-retraction-glued-constants`: ND (type t) fails, by the argument `unretracted-arrow`. -/
theorem full_double_retraction_glued_constants.distinctness_necessary_t : Statements.Models.full_double_retraction_glued_constants.distinctness_necessary_t :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.doubleRetractionSites), Classicism.Map.Arguments.unretracted_arrow.distinctness_necessary_t (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.doubleRetractionSites)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.doubleRetractionSites)) (Classicism.Meta.Intensional.GluedData.full (Classicism.Meta.Intensional.doubleRetractionSites)) (Classicism.Meta.Intensional.DoubleRetractionSites.unretracted)⟩

/-- `full-free-monoid-glued-constants-singleton`: □Atomicity holds, by the argument `full-atomicity`. -/
theorem full_free_monoid_glued_constants_singleton.necessary_atomicity_r : Statements.Models.full_free_monoid_glued_constants_singleton.necessary_atomicity_r :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidSingleton), Classicism.Map.Arguments.full_atomicity.necessary_atomicity_r (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidSingleton)) (Classicism.Meta.Intensional.GluedData.full (Classicism.Meta.Intensional.freeMonoidSingleton))⟩

/-- `full-free-monoid-glued-constants-singleton`: □Rigid Comprehension holds, by the argument `full-rigid-comprehension`. -/
theorem full_free_monoid_glued_constants_singleton.necessary_rigid_comprehension_r : Statements.Models.full_free_monoid_glued_constants_singleton.necessary_rigid_comprehension_r :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidSingleton), Classicism.Map.Arguments.full_rigid_comprehension.necessary_rigid_comprehension_r (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidSingleton)) (Classicism.Meta.Intensional.GluedData.full (Classicism.Meta.Intensional.freeMonoidSingleton))⟩

/-- `full-free-monoid-glued-constants-singleton`: Axiom of Infinity (type t) holds, by the argument `infinitely-many-propositions`. -/
theorem full_free_monoid_glued_constants_singleton.axiom_of_infinity_t : Statements.Models.full_free_monoid_glued_constants_singleton.axiom_of_infinity_t :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidSingleton), Classicism.Map.Arguments.infinitely_many_propositions.axiom_of_infinity_t (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidSingleton)) (Classicism.Meta.Intensional.Premodel.Full.extFull _ (Classicism.Meta.Intensional.GluedData.full (Classicism.Meta.Intensional.freeMonoidSingleton))) (Classicism.Meta.Intensional.FreeMonoidMembers.singleton_infinitely_many_propositions)⟩

/-- `full-free-monoid-glued-constants-singleton`: Infinity Schema (type t) holds, by the argument `infinitely-many-propositions`. -/
theorem full_free_monoid_glued_constants_singleton.infinity_t : Statements.Models.full_free_monoid_glued_constants_singleton.infinity_t :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidSingleton), Classicism.Map.Arguments.infinitely_many_propositions.infinity_t (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidSingleton)) (Classicism.Meta.Intensional.Premodel.Full.extFull _ (Classicism.Meta.Intensional.GluedData.full (Classicism.Meta.Intensional.freeMonoidSingleton))) (Classicism.Meta.Intensional.FreeMonoidMembers.singleton_infinitely_many_propositions)⟩

/-- `full-free-monoid-glued-constants-singleton`: Truths are ND-necessary holds, by the argument `nd-necessity-isolated-actual-world`. -/
theorem full_free_monoid_glued_constants_singleton.truths_are_nd_necessary : Statements.Models.full_free_monoid_glued_constants_singleton.truths_are_nd_necessary :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidSingleton), Classicism.Map.Arguments.nd_necessity_isolated_actual_world.truths_are_nd_necessary (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidSingleton)) (Classicism.Meta.Intensional.FreeMonoidMembers.singleton_actual_world_isolated)⟩

/-- `full-free-monoid-glued-constants-singleton`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem full_free_monoid_glued_constants_singleton.no_pure_contingency_r : Statements.Models.full_free_monoid_glued_constants_singleton.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidSingleton), Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidSingleton)) (Classicism.Meta.Intensional.FreeMonoidMembers.singleton_oneObject)⟩

/-- `full-free-monoid-glued-constants-singleton`: Infinity Schema (type e) fails, by the argument `one-individual`. -/
theorem full_free_monoid_glued_constants_singleton.infinity_e : Statements.Models.full_free_monoid_glued_constants_singleton.infinity_e :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidSingleton), Classicism.Map.Arguments.one_individual.infinity_e (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidSingleton)) (Classicism.Meta.Intensional.FreeMonoidMembers.singleton_one_individual)⟩

/-- `full-free-monoid-glued-constants-singleton`: Axiom of Infinity (type e) fails, by the argument `one-individual`. -/
theorem full_free_monoid_glued_constants_singleton.axiom_of_infinity_e : Statements.Models.full_free_monoid_glued_constants_singleton.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidSingleton), Classicism.Map.Arguments.one_individual.axiom_of_infinity_e (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidSingleton)) (Classicism.Meta.Intensional.FreeMonoidMembers.singleton_one_individual)⟩

/-- `full-free-monoid-glued-constants-singleton`: Possible Infinity (type e) fails, by the argument `one-individual`. -/
theorem full_free_monoid_glued_constants_singleton.possible_infinity_e : Statements.Models.full_free_monoid_glued_constants_singleton.possible_infinity_e :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidSingleton), Classicism.Map.Arguments.one_individual.possible_infinity_e (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidSingleton)) (Classicism.Meta.Intensional.FreeMonoidMembers.singleton_one_individual)⟩

/-- `full-free-monoid-glued-constants-singleton`: □Relational Choice holds, by the argument `relational-choice-full-boxed`. -/
theorem full_free_monoid_glued_constants_singleton.necessary_relational_choice_r : Statements.Models.full_free_monoid_glued_constants_singleton.necessary_relational_choice_r :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidSingleton), Classicism.Map.Arguments.relational_choice_full_boxed.necessary_relational_choice_r (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidSingleton)) (Classicism.Meta.Intensional.GluedData.full (Classicism.Meta.Intensional.freeMonoidSingleton))⟩

/-- `full-free-monoid-glued-constants-singleton`: Relational Choice holds, by the argument `relational-choice-full`. -/
theorem full_free_monoid_glued_constants_singleton.relational_choice_r : Statements.Models.full_free_monoid_glued_constants_singleton.relational_choice_r :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidSingleton), Classicism.Map.Arguments.relational_choice_full.relational_choice_r (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidSingleton)) (Classicism.Meta.Intensional.GluedData.full (Classicism.Meta.Intensional.freeMonoidSingleton))⟩

/-- `full-free-monoid-glued-constants-singleton`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem full_free_monoid_glued_constants_singleton.transversal_choice_r : Statements.Models.full_free_monoid_glued_constants_singleton.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidSingleton), Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidSingleton)) (Classicism.Meta.Intensional.Premodel.Full.extFull _ (Classicism.Meta.Intensional.GluedData.full (Classicism.Meta.Intensional.freeMonoidSingleton)))⟩

/-- `full-free-monoid-glued-constants-singleton`: ND (type t) fails, by the argument `unretracted-arrow`. -/
theorem full_free_monoid_glued_constants_singleton.distinctness_necessary_t : Statements.Models.full_free_monoid_glued_constants_singleton.distinctness_necessary_t :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidSingleton), Classicism.Map.Arguments.unretracted_arrow.distinctness_necessary_t (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidSingleton)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidSingleton)) (Classicism.Meta.Intensional.GluedData.full (Classicism.Meta.Intensional.freeMonoidSingleton)) (Classicism.Meta.Intensional.FreeMonoidMembers.singleton_unretracted)⟩

/-- `full-free-monoid-glued-constants`: □Atomicity holds, by the argument `full-atomicity`. -/
theorem full_free_monoid_glued_constants.necessary_atomicity_r : Statements.Models.full_free_monoid_glued_constants.necessary_atomicity_r :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidThread), Classicism.Map.Arguments.full_atomicity.necessary_atomicity_r (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidThread)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidThread)) (Classicism.Meta.Intensional.GluedData.full (Classicism.Meta.Intensional.freeMonoidThread))⟩

/-- `full-free-monoid-glued-constants`: □Rigid Comprehension holds, by the argument `full-rigid-comprehension`. -/
theorem full_free_monoid_glued_constants.necessary_rigid_comprehension_r : Statements.Models.full_free_monoid_glued_constants.necessary_rigid_comprehension_r :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidThread), Classicism.Map.Arguments.full_rigid_comprehension.necessary_rigid_comprehension_r (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidThread)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidThread)) (Classicism.Meta.Intensional.GluedData.full (Classicism.Meta.Intensional.freeMonoidThread))⟩

/-- `full-free-monoid-glued-constants`: Axiom of Infinity (type t) holds, by the argument `infinitely-many-propositions`. -/
theorem full_free_monoid_glued_constants.axiom_of_infinity_t : Statements.Models.full_free_monoid_glued_constants.axiom_of_infinity_t :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidThread), Classicism.Map.Arguments.infinitely_many_propositions.axiom_of_infinity_t (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidThread)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidThread)) (Classicism.Meta.Intensional.Premodel.Full.extFull _ (Classicism.Meta.Intensional.GluedData.full (Classicism.Meta.Intensional.freeMonoidThread))) (Classicism.Meta.Intensional.FreeMonoidMembers.thread_infinitely_many_propositions)⟩

/-- `full-free-monoid-glued-constants`: Infinity Schema (type t) holds, by the argument `infinitely-many-propositions`. -/
theorem full_free_monoid_glued_constants.infinity_t : Statements.Models.full_free_monoid_glued_constants.infinity_t :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidThread), Classicism.Map.Arguments.infinitely_many_propositions.infinity_t (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidThread)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidThread)) (Classicism.Meta.Intensional.Premodel.Full.extFull _ (Classicism.Meta.Intensional.GluedData.full (Classicism.Meta.Intensional.freeMonoidThread))) (Classicism.Meta.Intensional.FreeMonoidMembers.thread_infinitely_many_propositions)⟩

/-- `full-free-monoid-glued-constants`: Truths are ND-necessary holds, by the argument `nd-necessity-isolated-actual-world`. -/
theorem full_free_monoid_glued_constants.truths_are_nd_necessary : Statements.Models.full_free_monoid_glued_constants.truths_are_nd_necessary :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidThread), Classicism.Map.Arguments.nd_necessity_isolated_actual_world.truths_are_nd_necessary (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidThread)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidThread)) (Classicism.Meta.Intensional.FreeMonoidMembers.thread_actual_world_isolated)⟩

/-- `full-free-monoid-glued-constants`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem full_free_monoid_glued_constants.no_pure_contingency_r : Statements.Models.full_free_monoid_glued_constants.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidThread), Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidThread)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidThread)) (Classicism.Meta.Intensional.FreeMonoidMembers.thread_oneObject)⟩

/-- `full-free-monoid-glued-constants`: □Relational Choice holds, by the argument `relational-choice-full-boxed`. -/
theorem full_free_monoid_glued_constants.necessary_relational_choice_r : Statements.Models.full_free_monoid_glued_constants.necessary_relational_choice_r :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidThread), Classicism.Map.Arguments.relational_choice_full_boxed.necessary_relational_choice_r (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidThread)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidThread)) (Classicism.Meta.Intensional.GluedData.full (Classicism.Meta.Intensional.freeMonoidThread))⟩

/-- `full-free-monoid-glued-constants`: Relational Choice holds, by the argument `relational-choice-full`. -/
theorem full_free_monoid_glued_constants.relational_choice_r : Statements.Models.full_free_monoid_glued_constants.relational_choice_r :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidThread), Classicism.Map.Arguments.relational_choice_full.relational_choice_r (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidThread)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidThread)) (Classicism.Meta.Intensional.GluedData.full (Classicism.Meta.Intensional.freeMonoidThread))⟩

/-- `full-free-monoid-glued-constants`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem full_free_monoid_glued_constants.transversal_choice_r : Statements.Models.full_free_monoid_glued_constants.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidThread), Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidThread)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidThread)) (Classicism.Meta.Intensional.Premodel.Full.extFull _ (Classicism.Meta.Intensional.GluedData.full (Classicism.Meta.Intensional.freeMonoidThread)))⟩

/-- `full-free-monoid-glued-constants`: ND (type t) fails, by the argument `unretracted-arrow`. -/
theorem full_free_monoid_glued_constants.distinctness_necessary_t : Statements.Models.full_free_monoid_glued_constants.distinctness_necessary_t :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidThread), Classicism.Map.Arguments.unretracted_arrow.distinctness_necessary_t (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeMonoidThread)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeMonoidThread)) (Classicism.Meta.Intensional.GluedData.full (Classicism.Meta.Intensional.freeMonoidThread)) (Classicism.Meta.Intensional.FreeMonoidMembers.thread_unretracted)⟩

/-- `full-free-product-glued-constants`: □Atomicity holds, by the argument `full-atomicity`. -/
theorem full_free_product_glued_constants.necessary_atomicity_r : Statements.Models.full_free_product_glued_constants.necessary_atomicity_r :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeProductSites), Classicism.Map.Arguments.full_atomicity.necessary_atomicity_r (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeProductSites)) (Classicism.Meta.Intensional.GluedData.full (Classicism.Meta.Intensional.freeProductSites))⟩

/-- `full-free-product-glued-constants`: □Rigid Comprehension holds, by the argument `full-rigid-comprehension`. -/
theorem full_free_product_glued_constants.necessary_rigid_comprehension_r : Statements.Models.full_free_product_glued_constants.necessary_rigid_comprehension_r :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeProductSites), Classicism.Map.Arguments.full_rigid_comprehension.necessary_rigid_comprehension_r (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeProductSites)) (Classicism.Meta.Intensional.GluedData.full (Classicism.Meta.Intensional.freeProductSites))⟩

/-- `full-free-product-glued-constants`: Axiom of Infinity (type t) holds, by the argument `infinitely-many-propositions`. -/
theorem full_free_product_glued_constants.axiom_of_infinity_t : Statements.Models.full_free_product_glued_constants.axiom_of_infinity_t :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeProductSites), Classicism.Map.Arguments.infinitely_many_propositions.axiom_of_infinity_t (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeProductSites)) (Classicism.Meta.Intensional.Premodel.Full.extFull _ (Classicism.Meta.Intensional.GluedData.full (Classicism.Meta.Intensional.freeProductSites))) (Classicism.Meta.Intensional.FreeProductSites.infinitely_many_propositions)⟩

/-- `full-free-product-glued-constants`: Infinity Schema (type t) holds, by the argument `infinitely-many-propositions`. -/
theorem full_free_product_glued_constants.infinity_t : Statements.Models.full_free_product_glued_constants.infinity_t :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeProductSites), Classicism.Map.Arguments.infinitely_many_propositions.infinity_t (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeProductSites)) (Classicism.Meta.Intensional.Premodel.Full.extFull _ (Classicism.Meta.Intensional.GluedData.full (Classicism.Meta.Intensional.freeProductSites))) (Classicism.Meta.Intensional.FreeProductSites.infinitely_many_propositions)⟩

/-- `full-free-product-glued-constants`: Truths are ND-necessary fails, by the argument `nd-necessity-returning-arrow`. -/
theorem full_free_product_glued_constants.truths_are_nd_necessary : Statements.Models.full_free_product_glued_constants.truths_are_nd_necessary :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeProductSites), Classicism.Map.Arguments.nd_necessity_returning_arrow.truths_are_nd_necessary (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeProductSites)) (Classicism.Meta.Intensional.GluedData.full (Classicism.Meta.Intensional.freeProductSites)) (Classicism.Meta.Intensional.FreeProductSites.returning)⟩

/-- `full-free-product-glued-constants`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem full_free_product_glued_constants.no_pure_contingency_r : Statements.Models.full_free_product_glued_constants.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeProductSites), Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeProductSites)) (Classicism.Meta.Intensional.FreeProductSites.oneObject)⟩

/-- `full-free-product-glued-constants`: Strong Atomicity (type t) fails, by the argument `nonepic-strong-atomicity`. -/
theorem full_free_product_glued_constants.strong_atomicity_t : Statements.Models.full_free_product_glued_constants.strong_atomicity_t :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeProductSites), Classicism.Map.Arguments.nonepic_strong_atomicity.strong_atomicity_t (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeProductSites)) (Classicism.Meta.Intensional.GluedData.full (Classicism.Meta.Intensional.freeProductSites)) (Classicism.Meta.Intensional.FreeProductSites.nonepic)⟩

/-- `full-free-product-glued-constants`: Fregean Axiom fails, by the argument `nonidentity-arrow`. -/
theorem full_free_product_glued_constants.fregean_axiom : Statements.Models.full_free_product_glued_constants.fregean_axiom :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeProductSites), Classicism.Map.Arguments.nonidentity_arrow.fregean_axiom (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeProductSites)) (Classicism.Meta.Intensional.GluedData.full (Classicism.Meta.Intensional.freeProductSites)) (Classicism.Meta.Intensional.FreeProductSites.nonidentity)⟩

/-- `full-free-product-glued-constants`: Infinity Schema (type e) fails, by the argument `one-individual`. -/
theorem full_free_product_glued_constants.infinity_e : Statements.Models.full_free_product_glued_constants.infinity_e :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeProductSites), Classicism.Map.Arguments.one_individual.infinity_e (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeProductSites)) (Classicism.Meta.Intensional.FreeProductSites.one_individual)⟩

/-- `full-free-product-glued-constants`: Axiom of Infinity (type e) fails, by the argument `one-individual`. -/
theorem full_free_product_glued_constants.axiom_of_infinity_e : Statements.Models.full_free_product_glued_constants.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeProductSites), Classicism.Map.Arguments.one_individual.axiom_of_infinity_e (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeProductSites)) (Classicism.Meta.Intensional.FreeProductSites.one_individual)⟩

/-- `full-free-product-glued-constants`: Possible Infinity (type e) fails, by the argument `one-individual`. -/
theorem full_free_product_glued_constants.possible_infinity_e : Statements.Models.full_free_product_glued_constants.possible_infinity_e :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeProductSites), Classicism.Map.Arguments.one_individual.possible_infinity_e (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeProductSites)) (Classicism.Meta.Intensional.FreeProductSites.one_individual)⟩

/-- `full-free-product-glued-constants`: □Relational Choice holds, by the argument `relational-choice-full-boxed`. -/
theorem full_free_product_glued_constants.necessary_relational_choice_r : Statements.Models.full_free_product_glued_constants.necessary_relational_choice_r :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeProductSites), Classicism.Map.Arguments.relational_choice_full_boxed.necessary_relational_choice_r (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeProductSites)) (Classicism.Meta.Intensional.GluedData.full (Classicism.Meta.Intensional.freeProductSites))⟩

/-- `full-free-product-glued-constants`: Relational Choice holds, by the argument `relational-choice-full`. -/
theorem full_free_product_glued_constants.relational_choice_r : Statements.Models.full_free_product_glued_constants.relational_choice_r :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeProductSites), Classicism.Map.Arguments.relational_choice_full.relational_choice_r (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeProductSites)) (Classicism.Meta.Intensional.GluedData.full (Classicism.Meta.Intensional.freeProductSites))⟩

/-- `full-free-product-glued-constants`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem full_free_product_glued_constants.transversal_choice_r : Statements.Models.full_free_product_glued_constants.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeProductSites), Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeProductSites)) (Classicism.Meta.Intensional.Premodel.Full.extFull _ (Classicism.Meta.Intensional.GluedData.full (Classicism.Meta.Intensional.freeProductSites)))⟩

/-- `full-free-product-glued-constants`: ND (type t) fails, by the argument `unretracted-arrow`. -/
theorem full_free_product_glued_constants.distinctness_necessary_t : Statements.Models.full_free_product_glued_constants.distinctness_necessary_t :=
  ⟨Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeProductSites), Classicism.Map.Arguments.unretracted_arrow.distinctness_necessary_t (Classicism.Meta.Intensional.GluedData.model (Classicism.Meta.Intensional.freeProductSites)) (Classicism.Meta.Intensional.GluedData.isModel (Classicism.Meta.Intensional.freeProductSites)) (Classicism.Meta.Intensional.GluedData.full (Classicism.Meta.Intensional.freeProductSites)) (Classicism.Meta.Intensional.FreeProductSites.unretracted)⟩

/-- `full-henkin-finite-base`: Extensionality holds, by `henkin`'s argument `extensionality`. -/
theorem full_henkin_finite_base.extensionality_r : Statements.Models.full_henkin_finite_base.extensionality_r :=
  ⟨Classicism.Meta.Intensional.Henkin.isModel (Fin 2), Classicism.Map.Arguments.henkin.extensionality.extensionality_r (Fin 2) ⟩

/-- `full-henkin-finite-base`: Functional Choice holds, by `henkin`'s argument `functional-choice`. -/
theorem full_henkin_finite_base.functional_choice_r : Statements.Models.full_henkin_finite_base.functional_choice_r :=
  ⟨Classicism.Meta.Intensional.Henkin.isModel (Fin 2), Classicism.Map.Arguments.henkin.functional_choice.functional_choice_r (Fin 2) ⟩

/-- `full-henkin-finite-base`: Infinity Schema (type e) fails, by `henkin`'s argument `finitely-many-individuals`. -/
theorem full_henkin_finite_base.infinity_e : Statements.Models.full_henkin_finite_base.infinity_e :=
  ⟨Classicism.Meta.Intensional.Henkin.isModel (Fin 2), Classicism.Map.Arguments.henkin.finitely_many_individuals.infinity_e (Fin 2) (Classicism.Meta.Intensional.Henkin.fin_two_finitelyMany)⟩

/-- `full-henkin-finite-base`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem full_henkin_finite_base.transversal_choice_r : Statements.Models.full_henkin_finite_base.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.Henkin.isModel (Fin 2), Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.Henkin.model (Fin 2)) (Classicism.Meta.Intensional.Henkin.isModel (Fin 2)) (Classicism.Meta.Intensional.Henkin.extFull (Fin 2))⟩

/-- `full-henkin-finite-base`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem full_henkin_finite_base.independence_signature_r : Statements.Models.full_henkin_finite_base.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.Henkin.isModel (Fin 2)), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.Henkin.model (Fin 2)) (Classicism.Meta.Intensional.Henkin.isModel (Fin 2))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.Henkin.isModel (Fin 2))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.Henkin.isModel (Fin 2)))⟩

/-- `full-henkin-finite-base-sigma-independent`: Extensionality holds, by `henkin`'s argument `extensionality`. -/
theorem full_henkin_finite_base_sigma_independent.extensionality_r : Statements.Models.full_henkin_finite_base_sigma_independent.extensionality_r :=
  ⟨Classicism.Meta.Intensional.Henkin.isModel (Fin 2), Classicism.Map.Arguments.henkin.extensionality.extensionality_r (Fin 2) ⟩

/-- `full-henkin-finite-base-sigma-independent`: Functional Choice holds, by `henkin`'s argument `functional-choice`. -/
theorem full_henkin_finite_base_sigma_independent.functional_choice_r : Statements.Models.full_henkin_finite_base_sigma_independent.functional_choice_r :=
  ⟨Classicism.Meta.Intensional.Henkin.isModel (Fin 2), Classicism.Map.Arguments.henkin.functional_choice.functional_choice_r (Fin 2) ⟩

/-- `full-henkin-finite-base-sigma-independent`: Infinity Schema (type e) fails, by `henkin`'s argument `finitely-many-individuals`. -/
theorem full_henkin_finite_base_sigma_independent.infinity_e : Statements.Models.full_henkin_finite_base_sigma_independent.infinity_e :=
  ⟨Classicism.Meta.Intensional.Henkin.isModel (Fin 2), Classicism.Map.Arguments.henkin.finitely_many_individuals.infinity_e (Fin 2) (Classicism.Meta.Intensional.Henkin.fin_two_finitelyMany)⟩

/-- `full-henkin-finite-base-sigma-independent`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem full_henkin_finite_base_sigma_independent.transversal_choice_r : Statements.Models.full_henkin_finite_base_sigma_independent.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.Henkin.isModel (Fin 2), Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.Henkin.model (Fin 2)) (Classicism.Meta.Intensional.Henkin.isModel (Fin 2)) (Classicism.Meta.Intensional.Henkin.extFull (Fin 2))⟩

/-- `full-henkin-infinite-base`: Extensionality holds, by `henkin`'s argument `extensionality`. -/
theorem full_henkin_infinite_base.extensionality_r : Statements.Models.full_henkin_infinite_base.extensionality_r :=
  ⟨Classicism.Meta.Intensional.Henkin.isModel (ℕ), Classicism.Map.Arguments.henkin.extensionality.extensionality_r (ℕ) ⟩

/-- `full-henkin-infinite-base`: Functional Choice holds, by `henkin`'s argument `functional-choice`. -/
theorem full_henkin_infinite_base.functional_choice_r : Statements.Models.full_henkin_infinite_base.functional_choice_r :=
  ⟨Classicism.Meta.Intensional.Henkin.isModel (ℕ), Classicism.Map.Arguments.henkin.functional_choice.functional_choice_r (ℕ) ⟩

/-- `full-henkin-infinite-base`: Axiom of Infinity (type e) holds, by the argument `infinitely-many-individuals`. -/
theorem full_henkin_infinite_base.axiom_of_infinity_e : Statements.Models.full_henkin_infinite_base.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.Henkin.isModel (ℕ), Classicism.Map.Arguments.infinitely_many_individuals.axiom_of_infinity_e (Classicism.Meta.Intensional.Henkin.model (ℕ)) (Classicism.Meta.Intensional.Henkin.isModel (ℕ)) (Classicism.Meta.Intensional.Henkin.extFull (ℕ)) (Classicism.Meta.Intensional.Henkin.infinitelyManyIndividuals ℕ)⟩

/-- `full-henkin-infinite-base`: Infinity Schema (type e) holds, by the argument `infinitely-many-individuals`. -/
theorem full_henkin_infinite_base.infinity_e : Statements.Models.full_henkin_infinite_base.infinity_e :=
  ⟨Classicism.Meta.Intensional.Henkin.isModel (ℕ), Classicism.Map.Arguments.infinitely_many_individuals.infinity_e (Classicism.Meta.Intensional.Henkin.model (ℕ)) (Classicism.Meta.Intensional.Henkin.isModel (ℕ)) (Classicism.Meta.Intensional.Henkin.extFull (ℕ)) (Classicism.Meta.Intensional.Henkin.infinitelyManyIndividuals ℕ)⟩

/-- `full-henkin-infinite-base`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem full_henkin_infinite_base.transversal_choice_r : Statements.Models.full_henkin_infinite_base.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.Henkin.isModel (ℕ), Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.Henkin.model (ℕ)) (Classicism.Meta.Intensional.Henkin.isModel (ℕ)) (Classicism.Meta.Intensional.Henkin.extFull (ℕ))⟩

/-- `full-henkin-infinite-base`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem full_henkin_infinite_base.independence_signature_r : Statements.Models.full_henkin_infinite_base.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.Henkin.isModel (ℕ)), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.Henkin.model (ℕ)) (Classicism.Meta.Intensional.Henkin.isModel (ℕ))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.Henkin.isModel (ℕ))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.Henkin.isModel (ℕ)))⟩

/-- `full-henkin-infinite-base-sigma-independent`: Extensionality holds, by `henkin`'s argument `extensionality`. -/
theorem full_henkin_infinite_base_sigma_independent.extensionality_r : Statements.Models.full_henkin_infinite_base_sigma_independent.extensionality_r :=
  ⟨Classicism.Meta.Intensional.Henkin.isModel (ℕ), Classicism.Map.Arguments.henkin.extensionality.extensionality_r (ℕ) ⟩

/-- `full-henkin-infinite-base-sigma-independent`: Functional Choice holds, by `henkin`'s argument `functional-choice`. -/
theorem full_henkin_infinite_base_sigma_independent.functional_choice_r : Statements.Models.full_henkin_infinite_base_sigma_independent.functional_choice_r :=
  ⟨Classicism.Meta.Intensional.Henkin.isModel (ℕ), Classicism.Map.Arguments.henkin.functional_choice.functional_choice_r (ℕ) ⟩

/-- `full-henkin-infinite-base-sigma-independent`: Axiom of Infinity (type e) holds, by the argument `infinitely-many-individuals`. -/
theorem full_henkin_infinite_base_sigma_independent.axiom_of_infinity_e : Statements.Models.full_henkin_infinite_base_sigma_independent.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.Henkin.isModel (ℕ), Classicism.Map.Arguments.infinitely_many_individuals.axiom_of_infinity_e (Classicism.Meta.Intensional.Henkin.model (ℕ)) (Classicism.Meta.Intensional.Henkin.isModel (ℕ)) (Classicism.Meta.Intensional.Henkin.extFull (ℕ)) (Classicism.Meta.Intensional.Henkin.infinitelyManyIndividuals ℕ)⟩

/-- `full-henkin-infinite-base-sigma-independent`: Infinity Schema (type e) holds, by the argument `infinitely-many-individuals`. -/
theorem full_henkin_infinite_base_sigma_independent.infinity_e : Statements.Models.full_henkin_infinite_base_sigma_independent.infinity_e :=
  ⟨Classicism.Meta.Intensional.Henkin.isModel (ℕ), Classicism.Map.Arguments.infinitely_many_individuals.infinity_e (Classicism.Meta.Intensional.Henkin.model (ℕ)) (Classicism.Meta.Intensional.Henkin.isModel (ℕ)) (Classicism.Meta.Intensional.Henkin.extFull (ℕ)) (Classicism.Meta.Intensional.Henkin.infinitelyManyIndividuals ℕ)⟩

/-- `full-henkin-infinite-base-sigma-independent`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem full_henkin_infinite_base_sigma_independent.transversal_choice_r : Statements.Models.full_henkin_infinite_base_sigma_independent.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.Henkin.isModel (ℕ), Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.Henkin.model (ℕ)) (Classicism.Meta.Intensional.Henkin.isModel (ℕ)) (Classicism.Meta.Intensional.Henkin.extFull (ℕ))⟩

/-- `full-henkin-singleton-base`: Extensionality holds, by `henkin`'s argument `extensionality`. -/
theorem full_henkin_singleton_base.extensionality_r : Statements.Models.full_henkin_singleton_base.extensionality_r :=
  ⟨Classicism.Meta.Intensional.Henkin.isModel (Unit), Classicism.Map.Arguments.henkin.extensionality.extensionality_r (Unit) ⟩

/-- `full-henkin-singleton-base`: Functional Choice holds, by `henkin`'s argument `functional-choice`. -/
theorem full_henkin_singleton_base.functional_choice_r : Statements.Models.full_henkin_singleton_base.functional_choice_r :=
  ⟨Classicism.Meta.Intensional.Henkin.isModel (Unit), Classicism.Map.Arguments.henkin.functional_choice.functional_choice_r (Unit) ⟩

/-- `full-henkin-singleton-base`: Infinity Schema (type e) fails, by `henkin`'s argument `finitely-many-individuals`. -/
theorem full_henkin_singleton_base.infinity_e : Statements.Models.full_henkin_singleton_base.infinity_e :=
  ⟨Classicism.Meta.Intensional.Henkin.isModel (Unit), Classicism.Map.Arguments.henkin.finitely_many_individuals.infinity_e (Unit) (Classicism.Meta.Intensional.Henkin.unit_finitelyMany)⟩

/-- `full-henkin-singleton-base`: Axiom of Infinity (type e) fails, by the argument `one-individual`. -/
theorem full_henkin_singleton_base.axiom_of_infinity_e : Statements.Models.full_henkin_singleton_base.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.Henkin.isModel (Unit), Classicism.Map.Arguments.one_individual.axiom_of_infinity_e (Classicism.Meta.Intensional.Henkin.model (Unit)) (Classicism.Meta.Intensional.Henkin.isModel (Unit)) (Classicism.Meta.Intensional.Henkin.oneIndividual Unit)⟩

/-- `full-henkin-singleton-base`: Possible Infinity (type e) fails, by the argument `one-individual`. -/
theorem full_henkin_singleton_base.possible_infinity_e : Statements.Models.full_henkin_singleton_base.possible_infinity_e :=
  ⟨Classicism.Meta.Intensional.Henkin.isModel (Unit), Classicism.Map.Arguments.one_individual.possible_infinity_e (Classicism.Meta.Intensional.Henkin.model (Unit)) (Classicism.Meta.Intensional.Henkin.isModel (Unit)) (Classicism.Meta.Intensional.Henkin.oneIndividual Unit)⟩

/-- `full-henkin-singleton-base`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem full_henkin_singleton_base.transversal_choice_r : Statements.Models.full_henkin_singleton_base.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.Henkin.isModel (Unit), Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.Henkin.model (Unit)) (Classicism.Meta.Intensional.Henkin.isModel (Unit)) (Classicism.Meta.Intensional.Henkin.extFull (Unit))⟩

/-- `full-henkin-singleton-base`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem full_henkin_singleton_base.independence_signature_r : Statements.Models.full_henkin_singleton_base.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.Henkin.isModel (Unit)), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.Henkin.model (Unit)) (Classicism.Meta.Intensional.Henkin.isModel (Unit))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.Henkin.isModel (Unit))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.Henkin.isModel (Unit)))⟩

/-- `full-idempotent-monoid`: Possible Infinity (type t) fails, by the argument `finitely-many-propositions-everywhere`. -/
theorem full_idempotent_monoid.possible_infinity_t : Statements.Models.full_idempotent_monoid.possible_infinity_t :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem, Classicism.Map.Arguments.finitely_many_propositions_everywhere.possible_infinity_t (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.FullActionModels.mset_finitely_many_everywhere Classicism.Meta.Intensional.Idem)⟩

/-- `full-idempotent-monoid`: Infinity Schema (type t) fails, by the argument `finitely-many-propositions`. -/
theorem full_idempotent_monoid.infinity_t : Statements.Models.full_idempotent_monoid.infinity_t :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem, Classicism.Map.Arguments.finitely_many_propositions.infinity_t (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Idem) (Classicism.Map.Meets.mset_finitely_many_propositions Classicism.Meta.Intensional.Idem)⟩

/-- `full-idempotent-monoid`: Axiom of Infinity (type t) fails, by the argument `finitely-many-propositions`. -/
theorem full_idempotent_monoid.axiom_of_infinity_t : Statements.Models.full_idempotent_monoid.axiom_of_infinity_t :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem, Classicism.Map.Arguments.finitely_many_propositions.axiom_of_infinity_t (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Idem) (Classicism.Map.Meets.mset_finitely_many_propositions Classicism.Meta.Intensional.Idem)⟩

/-- `full-idempotent-monoid`: □Atomicity holds, by the argument `full-atomicity`. -/
theorem full_idempotent_monoid.necessary_atomicity_r : Statements.Models.full_idempotent_monoid.necessary_atomicity_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem, Classicism.Map.Arguments.full_atomicity.necessary_atomicity_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Idem)⟩

/-- `full-idempotent-monoid`: □Rigid Comprehension holds, by the argument `full-rigid-comprehension`. -/
theorem full_idempotent_monoid.necessary_rigid_comprehension_r : Statements.Models.full_idempotent_monoid.necessary_rigid_comprehension_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem, Classicism.Map.Arguments.full_rigid_comprehension.necessary_rigid_comprehension_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Idem)⟩

/-- `full-idempotent-monoid`: Truths are ND-necessary holds, by the argument `nd-necessity-isolated-actual-world`. -/
theorem full_idempotent_monoid.truths_are_nd_necessary : Statements.Models.full_idempotent_monoid.truths_are_nd_necessary :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem, Classicism.Map.Arguments.nd_necessity_isolated_actual_world.truths_are_nd_necessary (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem) (Classicism.Map.Meets.full_idempotent_monoid.actual_world_isolated)⟩

/-- `full-idempotent-monoid`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem full_idempotent_monoid.no_pure_contingency_r : Statements.Models.full_idempotent_monoid.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem, Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.Premodel.oneObject_of_subsingleton _)⟩

/-- `full-idempotent-monoid`: Strong Atomicity (type t) fails, by the argument `nonepic-strong-atomicity`. -/
theorem full_idempotent_monoid.strong_atomicity_t : Statements.Models.full_idempotent_monoid.strong_atomicity_t :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem, Classicism.Map.Arguments.nonepic_strong_atomicity.strong_atomicity_t (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.FullActionModels.idem_nonepic)⟩

/-- `full-idempotent-monoid`: Fregean Axiom fails, by the argument `nonidentity-arrow`. -/
theorem full_idempotent_monoid.fregean_axiom : Statements.Models.full_idempotent_monoid.fregean_axiom :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem, Classicism.Map.Arguments.nonidentity_arrow.fregean_axiom (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.FullActionModels.mset_nonidentity Classicism.Meta.Intensional.Idem.k Classicism.Meta.Intensional.Idem.k_ne_one)⟩

/-- `full-idempotent-monoid`: Infinity Schema (type e) fails, by the argument `one-individual`. -/
theorem full_idempotent_monoid.infinity_e : Statements.Models.full_idempotent_monoid.infinity_e :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem, Classicism.Map.Arguments.one_individual.infinity_e (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem) (Classicism.Map.Meets.mset_one_individual Classicism.Meta.Intensional.Idem)⟩

/-- `full-idempotent-monoid`: Axiom of Infinity (type e) fails, by the argument `one-individual`. -/
theorem full_idempotent_monoid.axiom_of_infinity_e : Statements.Models.full_idempotent_monoid.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem, Classicism.Map.Arguments.one_individual.axiom_of_infinity_e (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem) (Classicism.Map.Meets.mset_one_individual Classicism.Meta.Intensional.Idem)⟩

/-- `full-idempotent-monoid`: Possible Infinity (type e) fails, by the argument `one-individual`. -/
theorem full_idempotent_monoid.possible_infinity_e : Statements.Models.full_idempotent_monoid.possible_infinity_e :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem, Classicism.Map.Arguments.one_individual.possible_infinity_e (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem) (Classicism.Map.Meets.mset_one_individual Classicism.Meta.Intensional.Idem)⟩

/-- `full-idempotent-monoid`: □Relational Choice holds, by the argument `relational-choice-full-boxed`. -/
theorem full_idempotent_monoid.necessary_relational_choice_r : Statements.Models.full_idempotent_monoid.necessary_relational_choice_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem, Classicism.Map.Arguments.relational_choice_full_boxed.necessary_relational_choice_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Idem)⟩

/-- `full-idempotent-monoid`: Relational Choice holds, by the argument `relational-choice-full`. -/
theorem full_idempotent_monoid.relational_choice_r : Statements.Models.full_idempotent_monoid.relational_choice_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem, Classicism.Map.Arguments.relational_choice_full.relational_choice_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Idem)⟩

/-- `full-idempotent-monoid`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem full_idempotent_monoid.transversal_choice_r : Statements.Models.full_idempotent_monoid.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem, Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.Premodel.Full.extFull _ (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Idem))⟩

/-- `full-idempotent-monoid`: ND (type t) fails, by the argument `unretracted-arrow`. -/
theorem full_idempotent_monoid.distinctness_necessary_t : Statements.Models.full_idempotent_monoid.distinctness_necessary_t :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem, Classicism.Map.Arguments.unretracted_arrow.distinctness_necessary_t (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Idem) (Classicism.Map.Meets.full_idempotent_monoid.unretracted)⟩

/-- `full-idempotent-monoid`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem full_idempotent_monoid.independence_signature_r : Statements.Models.full_idempotent_monoid.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem)) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem)) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem))⟩

/-- `full-idempotent-monoid`: No Contingency (signature Σ) holds, by the argument `sigma-top-npc`. -/
theorem full_idempotent_monoid.no_contingency_signature_r : Statements.Models.full_idempotent_monoid.no_contingency_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem), Classicism.Map.Arguments.sigma_top_npc.no_contingency_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem)) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem)) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem)) (Classicism.Meta.Intensional.Premodel.holdsAx_interp_ofPure.2 ((Classicism.Map.Models.full_idempotent_monoid.no_pure_contingency_r).2))⟩

/-- `full-idempotent-monoid-sigma-true-atom`: Possible Infinity (type t) fails, by the argument `finitely-many-propositions-everywhere`. -/
theorem full_idempotent_monoid_sigma_true_atom.possible_infinity_t : Statements.Models.full_idempotent_monoid_sigma_true_atom.possible_infinity_t :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem, Classicism.Map.Arguments.finitely_many_propositions_everywhere.possible_infinity_t (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.FullActionModels.mset_finitely_many_everywhere Classicism.Meta.Intensional.Idem)⟩

/-- `full-idempotent-monoid-sigma-true-atom`: Infinity Schema (type t) fails, by the argument `finitely-many-propositions`. -/
theorem full_idempotent_monoid_sigma_true_atom.infinity_t : Statements.Models.full_idempotent_monoid_sigma_true_atom.infinity_t :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem, Classicism.Map.Arguments.finitely_many_propositions.infinity_t (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Idem) (Classicism.Map.Meets.mset_finitely_many_propositions Classicism.Meta.Intensional.Idem)⟩

/-- `full-idempotent-monoid-sigma-true-atom`: Axiom of Infinity (type t) fails, by the argument `finitely-many-propositions`. -/
theorem full_idempotent_monoid_sigma_true_atom.axiom_of_infinity_t : Statements.Models.full_idempotent_monoid_sigma_true_atom.axiom_of_infinity_t :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem, Classicism.Map.Arguments.finitely_many_propositions.axiom_of_infinity_t (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Idem) (Classicism.Map.Meets.mset_finitely_many_propositions Classicism.Meta.Intensional.Idem)⟩

/-- `full-idempotent-monoid-sigma-true-atom`: □Atomicity holds, by the argument `full-atomicity`. -/
theorem full_idempotent_monoid_sigma_true_atom.necessary_atomicity_r : Statements.Models.full_idempotent_monoid_sigma_true_atom.necessary_atomicity_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem, Classicism.Map.Arguments.full_atomicity.necessary_atomicity_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Idem)⟩

/-- `full-idempotent-monoid-sigma-true-atom`: □Rigid Comprehension holds, by the argument `full-rigid-comprehension`. -/
theorem full_idempotent_monoid_sigma_true_atom.necessary_rigid_comprehension_r : Statements.Models.full_idempotent_monoid_sigma_true_atom.necessary_rigid_comprehension_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem, Classicism.Map.Arguments.full_rigid_comprehension.necessary_rigid_comprehension_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Idem)⟩

/-- `full-idempotent-monoid-sigma-true-atom`: Truths are ND-necessary holds, by the argument `nd-necessity-isolated-actual-world`. -/
theorem full_idempotent_monoid_sigma_true_atom.truths_are_nd_necessary : Statements.Models.full_idempotent_monoid_sigma_true_atom.truths_are_nd_necessary :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem, Classicism.Map.Arguments.nd_necessity_isolated_actual_world.truths_are_nd_necessary (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem) (Classicism.Map.Meets.full_idempotent_monoid.actual_world_isolated)⟩

/-- `full-idempotent-monoid-sigma-true-atom`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem full_idempotent_monoid_sigma_true_atom.no_pure_contingency_r : Statements.Models.full_idempotent_monoid_sigma_true_atom.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem, Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.Premodel.oneObject_of_subsingleton _)⟩

/-- `full-idempotent-monoid-sigma-true-atom`: Strong Atomicity (type t) fails, by the argument `nonepic-strong-atomicity`. -/
theorem full_idempotent_monoid_sigma_true_atom.strong_atomicity_t : Statements.Models.full_idempotent_monoid_sigma_true_atom.strong_atomicity_t :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem, Classicism.Map.Arguments.nonepic_strong_atomicity.strong_atomicity_t (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.FullActionModels.idem_nonepic)⟩

/-- `full-idempotent-monoid-sigma-true-atom`: Fregean Axiom fails, by the argument `nonidentity-arrow`. -/
theorem full_idempotent_monoid_sigma_true_atom.fregean_axiom : Statements.Models.full_idempotent_monoid_sigma_true_atom.fregean_axiom :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem, Classicism.Map.Arguments.nonidentity_arrow.fregean_axiom (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.FullActionModels.mset_nonidentity Classicism.Meta.Intensional.Idem.k Classicism.Meta.Intensional.Idem.k_ne_one)⟩

/-- `full-idempotent-monoid-sigma-true-atom`: Infinity Schema (type e) fails, by the argument `one-individual`. -/
theorem full_idempotent_monoid_sigma_true_atom.infinity_e : Statements.Models.full_idempotent_monoid_sigma_true_atom.infinity_e :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem, Classicism.Map.Arguments.one_individual.infinity_e (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem) (Classicism.Map.Meets.mset_one_individual Classicism.Meta.Intensional.Idem)⟩

/-- `full-idempotent-monoid-sigma-true-atom`: Axiom of Infinity (type e) fails, by the argument `one-individual`. -/
theorem full_idempotent_monoid_sigma_true_atom.axiom_of_infinity_e : Statements.Models.full_idempotent_monoid_sigma_true_atom.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem, Classicism.Map.Arguments.one_individual.axiom_of_infinity_e (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem) (Classicism.Map.Meets.mset_one_individual Classicism.Meta.Intensional.Idem)⟩

/-- `full-idempotent-monoid-sigma-true-atom`: Possible Infinity (type e) fails, by the argument `one-individual`. -/
theorem full_idempotent_monoid_sigma_true_atom.possible_infinity_e : Statements.Models.full_idempotent_monoid_sigma_true_atom.possible_infinity_e :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem, Classicism.Map.Arguments.one_individual.possible_infinity_e (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem) (Classicism.Map.Meets.mset_one_individual Classicism.Meta.Intensional.Idem)⟩

/-- `full-idempotent-monoid-sigma-true-atom`: □Relational Choice holds, by the argument `relational-choice-full-boxed`. -/
theorem full_idempotent_monoid_sigma_true_atom.necessary_relational_choice_r : Statements.Models.full_idempotent_monoid_sigma_true_atom.necessary_relational_choice_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem, Classicism.Map.Arguments.relational_choice_full_boxed.necessary_relational_choice_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Idem)⟩

/-- `full-idempotent-monoid-sigma-true-atom`: Relational Choice holds, by the argument `relational-choice-full`. -/
theorem full_idempotent_monoid_sigma_true_atom.relational_choice_r : Statements.Models.full_idempotent_monoid_sigma_true_atom.relational_choice_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem, Classicism.Map.Arguments.relational_choice_full.relational_choice_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Idem)⟩

/-- `full-idempotent-monoid-sigma-true-atom`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem full_idempotent_monoid_sigma_true_atom.transversal_choice_r : Statements.Models.full_idempotent_monoid_sigma_true_atom.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem, Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.Premodel.Full.extFull _ (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Idem))⟩

/-- `full-idempotent-monoid-sigma-true-atom`: ND (type t) fails, by the argument `unretracted-arrow`. -/
theorem full_idempotent_monoid_sigma_true_atom.distinctness_necessary_t : Statements.Models.full_idempotent_monoid_sigma_true_atom.distinctness_necessary_t :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem, Classicism.Map.Arguments.unretracted_arrow.distinctness_necessary_t (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Idem) (Classicism.Map.Meets.full_idempotent_monoid.unretracted)⟩

/-- `full-involution-group`: Gallin Extensional Comprehension holds, by the argument `coherent-retractions`. -/
theorem full_involution_group.gallin_extensional_comprehension_r : Statements.Models.full_involution_group.gallin_extensional_comprehension_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol, Classicism.Map.Arguments.coherent_retractions.gallin_extensional_comprehension_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.FullActionModels.group_coherent Classicism.Meta.Intensional.Invol)⟩

/-- `full-involution-group`: Possible Infinity (type t) fails, by the argument `finitely-many-propositions-everywhere`. -/
theorem full_involution_group.possible_infinity_t : Statements.Models.full_involution_group.possible_infinity_t :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol, Classicism.Map.Arguments.finitely_many_propositions_everywhere.possible_infinity_t (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.FullActionModels.mset_finitely_many_everywhere Classicism.Meta.Intensional.Invol)⟩

/-- `full-involution-group`: Infinity Schema (type t) fails, by the argument `finitely-many-propositions`. -/
theorem full_involution_group.infinity_t : Statements.Models.full_involution_group.infinity_t :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol, Classicism.Map.Arguments.finitely_many_propositions.infinity_t (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Invol) (Classicism.Map.Meets.mset_finitely_many_propositions Classicism.Meta.Intensional.Invol)⟩

/-- `full-involution-group`: Axiom of Infinity (type t) fails, by the argument `finitely-many-propositions`. -/
theorem full_involution_group.axiom_of_infinity_t : Statements.Models.full_involution_group.axiom_of_infinity_t :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol, Classicism.Map.Arguments.finitely_many_propositions.axiom_of_infinity_t (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Invol) (Classicism.Map.Meets.mset_finitely_many_propositions Classicism.Meta.Intensional.Invol)⟩

/-- `full-involution-group`: □Atomicity holds, by the argument `full-atomicity`. -/
theorem full_involution_group.necessary_atomicity_r : Statements.Models.full_involution_group.necessary_atomicity_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol, Classicism.Map.Arguments.full_atomicity.necessary_atomicity_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Invol)⟩

/-- `full-involution-group`: □BF holds, by the argument `full-epic-barcan`. -/
theorem full_involution_group.necessary_barcan_r : Statements.Models.full_involution_group.necessary_barcan_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol, Classicism.Map.Arguments.full_epic_barcan.necessary_barcan_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.FullActionModels.group_epic Classicism.Meta.Intensional.Invol)⟩

/-- `full-involution-group`: □Rigid Comprehension holds, by the argument `full-rigid-comprehension`. -/
theorem full_involution_group.necessary_rigid_comprehension_r : Statements.Models.full_involution_group.necessary_rigid_comprehension_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol, Classicism.Map.Arguments.full_rigid_comprehension.necessary_rigid_comprehension_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Invol)⟩

/-- `full-involution-group`: □ND holds, by the argument `invertible-arrows`. -/
theorem full_involution_group.necessary_distinctness_necessary_r : Statements.Models.full_involution_group.necessary_distinctness_necessary_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol, Classicism.Map.Arguments.invertible_arrows.necessary_distinctness_necessary_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.FullActionModels.group_invertible Classicism.Meta.Intensional.Invol)⟩

/-- `full-involution-group`: Truths are ND-necessary fails, by the argument `nd-necessity-returning-arrow`. -/
theorem full_involution_group.truths_are_nd_necessary : Statements.Models.full_involution_group.truths_are_nd_necessary :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol, Classicism.Map.Arguments.nd_necessity_returning_arrow.truths_are_nd_necessary (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.FullActionModels.group_returning Classicism.Meta.Intensional.Invol.k Classicism.Meta.Intensional.Invol.k_ne_one)⟩

/-- `full-involution-group`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem full_involution_group.no_pure_contingency_r : Statements.Models.full_involution_group.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol, Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.Premodel.oneObject_of_subsingleton _)⟩

/-- `full-involution-group`: Fregean Axiom fails, by the argument `nonidentity-arrow`. -/
theorem full_involution_group.fregean_axiom : Statements.Models.full_involution_group.fregean_axiom :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol, Classicism.Map.Arguments.nonidentity_arrow.fregean_axiom (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.FullActionModels.mset_nonidentity Classicism.Meta.Intensional.Invol.k Classicism.Meta.Intensional.Invol.k_ne_one)⟩

/-- `full-involution-group`: Infinity Schema (type e) fails, by the argument `one-individual`. -/
theorem full_involution_group.infinity_e : Statements.Models.full_involution_group.infinity_e :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol, Classicism.Map.Arguments.one_individual.infinity_e (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol) (Classicism.Map.Meets.mset_one_individual Classicism.Meta.Intensional.Invol)⟩

/-- `full-involution-group`: Axiom of Infinity (type e) fails, by the argument `one-individual`. -/
theorem full_involution_group.axiom_of_infinity_e : Statements.Models.full_involution_group.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol, Classicism.Map.Arguments.one_individual.axiom_of_infinity_e (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol) (Classicism.Map.Meets.mset_one_individual Classicism.Meta.Intensional.Invol)⟩

/-- `full-involution-group`: Possible Infinity (type e) fails, by the argument `one-individual`. -/
theorem full_involution_group.possible_infinity_e : Statements.Models.full_involution_group.possible_infinity_e :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol, Classicism.Map.Arguments.one_individual.possible_infinity_e (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol) (Classicism.Map.Meets.mset_one_individual Classicism.Meta.Intensional.Invol)⟩

/-- `full-involution-group`: □Relational Choice holds, by the argument `relational-choice-full-boxed`. -/
theorem full_involution_group.necessary_relational_choice_r : Statements.Models.full_involution_group.necessary_relational_choice_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol, Classicism.Map.Arguments.relational_choice_full_boxed.necessary_relational_choice_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Invol)⟩

/-- `full-involution-group`: Relational Choice holds, by the argument `relational-choice-full`. -/
theorem full_involution_group.relational_choice_r : Statements.Models.full_involution_group.relational_choice_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol, Classicism.Map.Arguments.relational_choice_full.relational_choice_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Invol)⟩

/-- `full-involution-group`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem full_involution_group.transversal_choice_r : Statements.Models.full_involution_group.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol, Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.Premodel.Full.extFull _ (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Invol))⟩

/-- `full-involution-group`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem full_involution_group.independence_signature_r : Statements.Models.full_involution_group.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol)) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol)) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol))⟩

/-- `full-involution-group`: No Contingency (signature Σ) holds, by the argument `sigma-top-npc`. -/
theorem full_involution_group.no_contingency_signature_r : Statements.Models.full_involution_group.no_contingency_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol), Classicism.Map.Arguments.sigma_top_npc.no_contingency_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol)) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol)) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol)) (Classicism.Meta.Intensional.Premodel.holdsAx_interp_ofPure.2 ((Classicism.Map.Models.full_involution_group.no_pure_contingency_r).2))⟩

/-- `full-involution-group-sigma-true-atom`: Gallin Extensional Comprehension holds, by the argument `coherent-retractions`. -/
theorem full_involution_group_sigma_true_atom.gallin_extensional_comprehension_r : Statements.Models.full_involution_group_sigma_true_atom.gallin_extensional_comprehension_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol, Classicism.Map.Arguments.coherent_retractions.gallin_extensional_comprehension_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.FullActionModels.group_coherent Classicism.Meta.Intensional.Invol)⟩

/-- `full-involution-group-sigma-true-atom`: Possible Infinity (type t) fails, by the argument `finitely-many-propositions-everywhere`. -/
theorem full_involution_group_sigma_true_atom.possible_infinity_t : Statements.Models.full_involution_group_sigma_true_atom.possible_infinity_t :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol, Classicism.Map.Arguments.finitely_many_propositions_everywhere.possible_infinity_t (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.FullActionModels.mset_finitely_many_everywhere Classicism.Meta.Intensional.Invol)⟩

/-- `full-involution-group-sigma-true-atom`: Infinity Schema (type t) fails, by the argument `finitely-many-propositions`. -/
theorem full_involution_group_sigma_true_atom.infinity_t : Statements.Models.full_involution_group_sigma_true_atom.infinity_t :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol, Classicism.Map.Arguments.finitely_many_propositions.infinity_t (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Invol) (Classicism.Map.Meets.mset_finitely_many_propositions Classicism.Meta.Intensional.Invol)⟩

/-- `full-involution-group-sigma-true-atom`: Axiom of Infinity (type t) fails, by the argument `finitely-many-propositions`. -/
theorem full_involution_group_sigma_true_atom.axiom_of_infinity_t : Statements.Models.full_involution_group_sigma_true_atom.axiom_of_infinity_t :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol, Classicism.Map.Arguments.finitely_many_propositions.axiom_of_infinity_t (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Invol) (Classicism.Map.Meets.mset_finitely_many_propositions Classicism.Meta.Intensional.Invol)⟩

/-- `full-involution-group-sigma-true-atom`: □Atomicity holds, by the argument `full-atomicity`. -/
theorem full_involution_group_sigma_true_atom.necessary_atomicity_r : Statements.Models.full_involution_group_sigma_true_atom.necessary_atomicity_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol, Classicism.Map.Arguments.full_atomicity.necessary_atomicity_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Invol)⟩

/-- `full-involution-group-sigma-true-atom`: □BF holds, by the argument `full-epic-barcan`. -/
theorem full_involution_group_sigma_true_atom.necessary_barcan_r : Statements.Models.full_involution_group_sigma_true_atom.necessary_barcan_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol, Classicism.Map.Arguments.full_epic_barcan.necessary_barcan_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.FullActionModels.group_epic Classicism.Meta.Intensional.Invol)⟩

/-- `full-involution-group-sigma-true-atom`: □Rigid Comprehension holds, by the argument `full-rigid-comprehension`. -/
theorem full_involution_group_sigma_true_atom.necessary_rigid_comprehension_r : Statements.Models.full_involution_group_sigma_true_atom.necessary_rigid_comprehension_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol, Classicism.Map.Arguments.full_rigid_comprehension.necessary_rigid_comprehension_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Invol)⟩

/-- `full-involution-group-sigma-true-atom`: □ND holds, by the argument `invertible-arrows`. -/
theorem full_involution_group_sigma_true_atom.necessary_distinctness_necessary_r : Statements.Models.full_involution_group_sigma_true_atom.necessary_distinctness_necessary_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol, Classicism.Map.Arguments.invertible_arrows.necessary_distinctness_necessary_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.FullActionModels.group_invertible Classicism.Meta.Intensional.Invol)⟩

/-- `full-involution-group-sigma-true-atom`: Truths are ND-necessary fails, by the argument `nd-necessity-returning-arrow`. -/
theorem full_involution_group_sigma_true_atom.truths_are_nd_necessary : Statements.Models.full_involution_group_sigma_true_atom.truths_are_nd_necessary :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol, Classicism.Map.Arguments.nd_necessity_returning_arrow.truths_are_nd_necessary (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.FullActionModels.group_returning Classicism.Meta.Intensional.Invol.k Classicism.Meta.Intensional.Invol.k_ne_one)⟩

/-- `full-involution-group-sigma-true-atom`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem full_involution_group_sigma_true_atom.no_pure_contingency_r : Statements.Models.full_involution_group_sigma_true_atom.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol, Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.Premodel.oneObject_of_subsingleton _)⟩

/-- `full-involution-group-sigma-true-atom`: Fregean Axiom fails, by the argument `nonidentity-arrow`. -/
theorem full_involution_group_sigma_true_atom.fregean_axiom : Statements.Models.full_involution_group_sigma_true_atom.fregean_axiom :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol, Classicism.Map.Arguments.nonidentity_arrow.fregean_axiom (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.FullActionModels.mset_nonidentity Classicism.Meta.Intensional.Invol.k Classicism.Meta.Intensional.Invol.k_ne_one)⟩

/-- `full-involution-group-sigma-true-atom`: Infinity Schema (type e) fails, by the argument `one-individual`. -/
theorem full_involution_group_sigma_true_atom.infinity_e : Statements.Models.full_involution_group_sigma_true_atom.infinity_e :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol, Classicism.Map.Arguments.one_individual.infinity_e (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol) (Classicism.Map.Meets.mset_one_individual Classicism.Meta.Intensional.Invol)⟩

/-- `full-involution-group-sigma-true-atom`: Axiom of Infinity (type e) fails, by the argument `one-individual`. -/
theorem full_involution_group_sigma_true_atom.axiom_of_infinity_e : Statements.Models.full_involution_group_sigma_true_atom.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol, Classicism.Map.Arguments.one_individual.axiom_of_infinity_e (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol) (Classicism.Map.Meets.mset_one_individual Classicism.Meta.Intensional.Invol)⟩

/-- `full-involution-group-sigma-true-atom`: Possible Infinity (type e) fails, by the argument `one-individual`. -/
theorem full_involution_group_sigma_true_atom.possible_infinity_e : Statements.Models.full_involution_group_sigma_true_atom.possible_infinity_e :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol, Classicism.Map.Arguments.one_individual.possible_infinity_e (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol) (Classicism.Map.Meets.mset_one_individual Classicism.Meta.Intensional.Invol)⟩

/-- `full-involution-group-sigma-true-atom`: □Relational Choice holds, by the argument `relational-choice-full-boxed`. -/
theorem full_involution_group_sigma_true_atom.necessary_relational_choice_r : Statements.Models.full_involution_group_sigma_true_atom.necessary_relational_choice_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol, Classicism.Map.Arguments.relational_choice_full_boxed.necessary_relational_choice_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Invol)⟩

/-- `full-involution-group-sigma-true-atom`: Relational Choice holds, by the argument `relational-choice-full`. -/
theorem full_involution_group_sigma_true_atom.relational_choice_r : Statements.Models.full_involution_group_sigma_true_atom.relational_choice_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol, Classicism.Map.Arguments.relational_choice_full.relational_choice_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Invol)⟩

/-- `full-involution-group-sigma-true-atom`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem full_involution_group_sigma_true_atom.transversal_choice_r : Statements.Models.full_involution_group_sigma_true_atom.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol, Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.Premodel.Full.extFull _ (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Invol))⟩

/-- `full-permutation-group-infinite-set`: Gallin Extensional Comprehension holds, by the argument `coherent-retractions`. -/
theorem full_permutation_group_infinite_set.gallin_extensional_comprehension_r : Statements.Models.full_permutation_group_infinite_set.gallin_extensional_comprehension_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ), Classicism.Map.Arguments.coherent_retractions.gallin_extensional_comprehension_r (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_full (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.FullActionModels.group_coherent (Equiv.Perm ℕ))⟩

/-- `full-permutation-group-infinite-set`: □Atomicity holds, by the argument `full-atomicity`. -/
theorem full_permutation_group_infinite_set.necessary_atomicity_r : Statements.Models.full_permutation_group_infinite_set.necessary_atomicity_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ), Classicism.Map.Arguments.full_atomicity.necessary_atomicity_r (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_full (Equiv.Perm ℕ))⟩

/-- `full-permutation-group-infinite-set`: □BF holds, by the argument `full-epic-barcan`. -/
theorem full_permutation_group_infinite_set.necessary_barcan_r : Statements.Models.full_permutation_group_infinite_set.necessary_barcan_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ), Classicism.Map.Arguments.full_epic_barcan.necessary_barcan_r (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_full (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.FullActionModels.group_epic (Equiv.Perm ℕ))⟩

/-- `full-permutation-group-infinite-set`: □Rigid Comprehension holds, by the argument `full-rigid-comprehension`. -/
theorem full_permutation_group_infinite_set.necessary_rigid_comprehension_r : Statements.Models.full_permutation_group_infinite_set.necessary_rigid_comprehension_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ), Classicism.Map.Arguments.full_rigid_comprehension.necessary_rigid_comprehension_r (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_full (Equiv.Perm ℕ))⟩

/-- `full-permutation-group-infinite-set`: Axiom of Infinity (type t) holds, by the argument `infinitely-many-propositions`. -/
theorem full_permutation_group_infinite_set.axiom_of_infinity_t : Statements.Models.full_permutation_group_infinite_set.axiom_of_infinity_t :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ), Classicism.Map.Arguments.infinitely_many_propositions.axiom_of_infinity_t (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.Premodel.Full.extFull _ (Classicism.Meta.Intensional.MSet.model_full (Equiv.Perm ℕ))) (Classicism.Meta.Intensional.FullActionModels.mset_infinitely_many_propositions (Equiv.Perm ℕ))⟩

/-- `full-permutation-group-infinite-set`: Infinity Schema (type t) holds, by the argument `infinitely-many-propositions`. -/
theorem full_permutation_group_infinite_set.infinity_t : Statements.Models.full_permutation_group_infinite_set.infinity_t :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ), Classicism.Map.Arguments.infinitely_many_propositions.infinity_t (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.Premodel.Full.extFull _ (Classicism.Meta.Intensional.MSet.model_full (Equiv.Perm ℕ))) (Classicism.Meta.Intensional.FullActionModels.mset_infinitely_many_propositions (Equiv.Perm ℕ))⟩

/-- `full-permutation-group-infinite-set`: □ND holds, by the argument `invertible-arrows`. -/
theorem full_permutation_group_infinite_set.necessary_distinctness_necessary_r : Statements.Models.full_permutation_group_infinite_set.necessary_distinctness_necessary_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ), Classicism.Map.Arguments.invertible_arrows.necessary_distinctness_necessary_r (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.FullActionModels.group_invertible (Equiv.Perm ℕ))⟩

/-- `full-permutation-group-infinite-set`: Truths are ND-necessary fails, by the argument `nd-necessity-returning-arrow`. -/
theorem full_permutation_group_infinite_set.truths_are_nd_necessary : Statements.Models.full_permutation_group_infinite_set.truths_are_nd_necessary :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ), Classicism.Map.Arguments.nd_necessity_returning_arrow.truths_are_nd_necessary (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_full (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.FullActionModels.perm_returning)⟩

/-- `full-permutation-group-infinite-set`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem full_permutation_group_infinite_set.no_pure_contingency_r : Statements.Models.full_permutation_group_infinite_set.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ), Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.Premodel.oneObject_of_subsingleton _)⟩

/-- `full-permutation-group-infinite-set`: Fregean Axiom fails, by the argument `nonidentity-arrow`. -/
theorem full_permutation_group_infinite_set.fregean_axiom : Statements.Models.full_permutation_group_infinite_set.fregean_axiom :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ), Classicism.Map.Arguments.nonidentity_arrow.fregean_axiom (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_full (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.FullActionModels.perm_nonidentity)⟩

/-- `full-permutation-group-infinite-set`: Infinity Schema (type e) fails, by the argument `one-individual`. -/
theorem full_permutation_group_infinite_set.infinity_e : Statements.Models.full_permutation_group_infinite_set.infinity_e :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ), Classicism.Map.Arguments.one_individual.infinity_e (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ)) (Classicism.Map.Meets.mset_one_individual (Equiv.Perm ℕ))⟩

/-- `full-permutation-group-infinite-set`: Axiom of Infinity (type e) fails, by the argument `one-individual`. -/
theorem full_permutation_group_infinite_set.axiom_of_infinity_e : Statements.Models.full_permutation_group_infinite_set.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ), Classicism.Map.Arguments.one_individual.axiom_of_infinity_e (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ)) (Classicism.Map.Meets.mset_one_individual (Equiv.Perm ℕ))⟩

/-- `full-permutation-group-infinite-set`: Possible Infinity (type e) fails, by the argument `one-individual`. -/
theorem full_permutation_group_infinite_set.possible_infinity_e : Statements.Models.full_permutation_group_infinite_set.possible_infinity_e :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ), Classicism.Map.Arguments.one_individual.possible_infinity_e (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ)) (Classicism.Map.Meets.mset_one_individual (Equiv.Perm ℕ))⟩

/-- `full-permutation-group-infinite-set`: □Relational Choice holds, by the argument `relational-choice-full-boxed`. -/
theorem full_permutation_group_infinite_set.necessary_relational_choice_r : Statements.Models.full_permutation_group_infinite_set.necessary_relational_choice_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ), Classicism.Map.Arguments.relational_choice_full_boxed.necessary_relational_choice_r (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_full (Equiv.Perm ℕ))⟩

/-- `full-permutation-group-infinite-set`: Relational Choice holds, by the argument `relational-choice-full`. -/
theorem full_permutation_group_infinite_set.relational_choice_r : Statements.Models.full_permutation_group_infinite_set.relational_choice_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ), Classicism.Map.Arguments.relational_choice_full.relational_choice_r (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_full (Equiv.Perm ℕ))⟩

/-- `full-permutation-group-infinite-set`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem full_permutation_group_infinite_set.transversal_choice_r : Statements.Models.full_permutation_group_infinite_set.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ), Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.Premodel.Full.extFull _ (Classicism.Meta.Intensional.MSet.model_full (Equiv.Perm ℕ)))⟩

/-- `full-permutation-group-infinite-set`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem full_permutation_group_infinite_set.independence_signature_r : Statements.Models.full_permutation_group_infinite_set.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ)), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ)))⟩

/-- `full-permutation-group-infinite-set`: No Contingency (signature Σ) holds, by the argument `sigma-top-npc`. -/
theorem full_permutation_group_infinite_set.no_contingency_signature_r : Statements.Models.full_permutation_group_infinite_set.no_contingency_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ)), Classicism.Map.Arguments.sigma_top_npc.no_contingency_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ))) (Classicism.Meta.Intensional.Premodel.holdsAx_interp_ofPure.2 ((Classicism.Map.Models.full_permutation_group_infinite_set.no_pure_contingency_r).2))⟩

/-- `full-permutation-group-infinite-set-sigma-true-atom`: Gallin Extensional Comprehension holds, by the argument `coherent-retractions`. -/
theorem full_permutation_group_infinite_set_sigma_true_atom.gallin_extensional_comprehension_r : Statements.Models.full_permutation_group_infinite_set_sigma_true_atom.gallin_extensional_comprehension_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ), Classicism.Map.Arguments.coherent_retractions.gallin_extensional_comprehension_r (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_full (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.FullActionModels.group_coherent (Equiv.Perm ℕ))⟩

/-- `full-permutation-group-infinite-set-sigma-true-atom`: □Atomicity holds, by the argument `full-atomicity`. -/
theorem full_permutation_group_infinite_set_sigma_true_atom.necessary_atomicity_r : Statements.Models.full_permutation_group_infinite_set_sigma_true_atom.necessary_atomicity_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ), Classicism.Map.Arguments.full_atomicity.necessary_atomicity_r (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_full (Equiv.Perm ℕ))⟩

/-- `full-permutation-group-infinite-set-sigma-true-atom`: □BF holds, by the argument `full-epic-barcan`. -/
theorem full_permutation_group_infinite_set_sigma_true_atom.necessary_barcan_r : Statements.Models.full_permutation_group_infinite_set_sigma_true_atom.necessary_barcan_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ), Classicism.Map.Arguments.full_epic_barcan.necessary_barcan_r (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_full (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.FullActionModels.group_epic (Equiv.Perm ℕ))⟩

/-- `full-permutation-group-infinite-set-sigma-true-atom`: □Rigid Comprehension holds, by the argument `full-rigid-comprehension`. -/
theorem full_permutation_group_infinite_set_sigma_true_atom.necessary_rigid_comprehension_r : Statements.Models.full_permutation_group_infinite_set_sigma_true_atom.necessary_rigid_comprehension_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ), Classicism.Map.Arguments.full_rigid_comprehension.necessary_rigid_comprehension_r (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_full (Equiv.Perm ℕ))⟩

/-- `full-permutation-group-infinite-set-sigma-true-atom`: Axiom of Infinity (type t) holds, by the argument `infinitely-many-propositions`. -/
theorem full_permutation_group_infinite_set_sigma_true_atom.axiom_of_infinity_t : Statements.Models.full_permutation_group_infinite_set_sigma_true_atom.axiom_of_infinity_t :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ), Classicism.Map.Arguments.infinitely_many_propositions.axiom_of_infinity_t (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.Premodel.Full.extFull _ (Classicism.Meta.Intensional.MSet.model_full (Equiv.Perm ℕ))) (Classicism.Meta.Intensional.FullActionModels.mset_infinitely_many_propositions (Equiv.Perm ℕ))⟩

/-- `full-permutation-group-infinite-set-sigma-true-atom`: Infinity Schema (type t) holds, by the argument `infinitely-many-propositions`. -/
theorem full_permutation_group_infinite_set_sigma_true_atom.infinity_t : Statements.Models.full_permutation_group_infinite_set_sigma_true_atom.infinity_t :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ), Classicism.Map.Arguments.infinitely_many_propositions.infinity_t (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.Premodel.Full.extFull _ (Classicism.Meta.Intensional.MSet.model_full (Equiv.Perm ℕ))) (Classicism.Meta.Intensional.FullActionModels.mset_infinitely_many_propositions (Equiv.Perm ℕ))⟩

/-- `full-permutation-group-infinite-set-sigma-true-atom`: □ND holds, by the argument `invertible-arrows`. -/
theorem full_permutation_group_infinite_set_sigma_true_atom.necessary_distinctness_necessary_r : Statements.Models.full_permutation_group_infinite_set_sigma_true_atom.necessary_distinctness_necessary_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ), Classicism.Map.Arguments.invertible_arrows.necessary_distinctness_necessary_r (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.FullActionModels.group_invertible (Equiv.Perm ℕ))⟩

/-- `full-permutation-group-infinite-set-sigma-true-atom`: Truths are ND-necessary fails, by the argument `nd-necessity-returning-arrow`. -/
theorem full_permutation_group_infinite_set_sigma_true_atom.truths_are_nd_necessary : Statements.Models.full_permutation_group_infinite_set_sigma_true_atom.truths_are_nd_necessary :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ), Classicism.Map.Arguments.nd_necessity_returning_arrow.truths_are_nd_necessary (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_full (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.FullActionModels.perm_returning)⟩

/-- `full-permutation-group-infinite-set-sigma-true-atom`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem full_permutation_group_infinite_set_sigma_true_atom.no_pure_contingency_r : Statements.Models.full_permutation_group_infinite_set_sigma_true_atom.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ), Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.Premodel.oneObject_of_subsingleton _)⟩

/-- `full-permutation-group-infinite-set-sigma-true-atom`: Fregean Axiom fails, by the argument `nonidentity-arrow`. -/
theorem full_permutation_group_infinite_set_sigma_true_atom.fregean_axiom : Statements.Models.full_permutation_group_infinite_set_sigma_true_atom.fregean_axiom :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ), Classicism.Map.Arguments.nonidentity_arrow.fregean_axiom (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_full (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.FullActionModels.perm_nonidentity)⟩

/-- `full-permutation-group-infinite-set-sigma-true-atom`: Infinity Schema (type e) fails, by the argument `one-individual`. -/
theorem full_permutation_group_infinite_set_sigma_true_atom.infinity_e : Statements.Models.full_permutation_group_infinite_set_sigma_true_atom.infinity_e :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ), Classicism.Map.Arguments.one_individual.infinity_e (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ)) (Classicism.Map.Meets.mset_one_individual (Equiv.Perm ℕ))⟩

/-- `full-permutation-group-infinite-set-sigma-true-atom`: Axiom of Infinity (type e) fails, by the argument `one-individual`. -/
theorem full_permutation_group_infinite_set_sigma_true_atom.axiom_of_infinity_e : Statements.Models.full_permutation_group_infinite_set_sigma_true_atom.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ), Classicism.Map.Arguments.one_individual.axiom_of_infinity_e (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ)) (Classicism.Map.Meets.mset_one_individual (Equiv.Perm ℕ))⟩

/-- `full-permutation-group-infinite-set-sigma-true-atom`: Possible Infinity (type e) fails, by the argument `one-individual`. -/
theorem full_permutation_group_infinite_set_sigma_true_atom.possible_infinity_e : Statements.Models.full_permutation_group_infinite_set_sigma_true_atom.possible_infinity_e :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ), Classicism.Map.Arguments.one_individual.possible_infinity_e (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ)) (Classicism.Map.Meets.mset_one_individual (Equiv.Perm ℕ))⟩

/-- `full-permutation-group-infinite-set-sigma-true-atom`: □Relational Choice holds, by the argument `relational-choice-full-boxed`. -/
theorem full_permutation_group_infinite_set_sigma_true_atom.necessary_relational_choice_r : Statements.Models.full_permutation_group_infinite_set_sigma_true_atom.necessary_relational_choice_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ), Classicism.Map.Arguments.relational_choice_full_boxed.necessary_relational_choice_r (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_full (Equiv.Perm ℕ))⟩

/-- `full-permutation-group-infinite-set-sigma-true-atom`: Relational Choice holds, by the argument `relational-choice-full`. -/
theorem full_permutation_group_infinite_set_sigma_true_atom.relational_choice_r : Statements.Models.full_permutation_group_infinite_set_sigma_true_atom.relational_choice_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ), Classicism.Map.Arguments.relational_choice_full.relational_choice_r (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_full (Equiv.Perm ℕ))⟩

/-- `full-permutation-group-infinite-set-sigma-true-atom`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem full_permutation_group_infinite_set_sigma_true_atom.transversal_choice_r : Statements.Models.full_permutation_group_infinite_set_sigma_true_atom.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ), Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.Premodel.Full.extFull _ (Classicism.Meta.Intensional.MSet.model_full (Equiv.Perm ℕ)))⟩

/-- `full-surjection-monoid`: □Atomicity holds, by the argument `full-atomicity`. -/
theorem full_surjection_monoid.necessary_atomicity_r : Statements.Models.full_surjection_monoid.necessary_atomicity_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj, Classicism.Map.Arguments.full_atomicity.necessary_atomicity_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.FullActionModels.surj)⟩

/-- `full-surjection-monoid`: □BF holds, by the argument `full-epic-barcan`. -/
theorem full_surjection_monoid.necessary_barcan_r : Statements.Models.full_surjection_monoid.necessary_barcan_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj, Classicism.Map.Arguments.full_epic_barcan.necessary_barcan_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.FullActionModels.surj_epic)⟩

/-- `full-surjection-monoid`: □Rigid Comprehension holds, by the argument `full-rigid-comprehension`. -/
theorem full_surjection_monoid.necessary_rigid_comprehension_r : Statements.Models.full_surjection_monoid.necessary_rigid_comprehension_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj, Classicism.Map.Arguments.full_rigid_comprehension.necessary_rigid_comprehension_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.FullActionModels.surj)⟩

/-- `full-surjection-monoid`: Axiom of Infinity (type t) holds, by the argument `infinitely-many-propositions`. -/
theorem full_surjection_monoid.axiom_of_infinity_t : Statements.Models.full_surjection_monoid.axiom_of_infinity_t :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj, Classicism.Map.Arguments.infinitely_many_propositions.axiom_of_infinity_t (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.Premodel.Full.extFull _ (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.FullActionModels.surj)) (Classicism.Meta.Intensional.FullActionModels.mset_infinitely_many_propositions Classicism.Meta.Intensional.FullActionModels.surj)⟩

/-- `full-surjection-monoid`: Infinity Schema (type t) holds, by the argument `infinitely-many-propositions`. -/
theorem full_surjection_monoid.infinity_t : Statements.Models.full_surjection_monoid.infinity_t :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj, Classicism.Map.Arguments.infinitely_many_propositions.infinity_t (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.Premodel.Full.extFull _ (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.FullActionModels.surj)) (Classicism.Meta.Intensional.FullActionModels.mset_infinitely_many_propositions Classicism.Meta.Intensional.FullActionModels.surj)⟩

/-- `full-surjection-monoid`: Truths are ND-necessary fails, by the argument `nd-necessity-returning-arrow`. -/
theorem full_surjection_monoid.truths_are_nd_necessary : Statements.Models.full_surjection_monoid.truths_are_nd_necessary :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj, Classicism.Map.Arguments.nd_necessity_returning_arrow.truths_are_nd_necessary (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.FullActionModels.surj_returning)⟩

/-- `full-surjection-monoid`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem full_surjection_monoid.no_pure_contingency_r : Statements.Models.full_surjection_monoid.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj, Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.Premodel.oneObject_of_subsingleton _)⟩

/-- `full-surjection-monoid`: Fregean Axiom fails, by the argument `nonidentity-arrow`. -/
theorem full_surjection_monoid.fregean_axiom : Statements.Models.full_surjection_monoid.fregean_axiom :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj, Classicism.Map.Arguments.nonidentity_arrow.fregean_axiom (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.FullActionModels.surj_nonidentity)⟩

/-- `full-surjection-monoid`: Infinity Schema (type e) fails, by the argument `one-individual`. -/
theorem full_surjection_monoid.infinity_e : Statements.Models.full_surjection_monoid.infinity_e :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj, Classicism.Map.Arguments.one_individual.infinity_e (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Map.Meets.mset_one_individual Classicism.Meta.Intensional.FullActionModels.surj)⟩

/-- `full-surjection-monoid`: Axiom of Infinity (type e) fails, by the argument `one-individual`. -/
theorem full_surjection_monoid.axiom_of_infinity_e : Statements.Models.full_surjection_monoid.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj, Classicism.Map.Arguments.one_individual.axiom_of_infinity_e (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Map.Meets.mset_one_individual Classicism.Meta.Intensional.FullActionModels.surj)⟩

/-- `full-surjection-monoid`: Possible Infinity (type e) fails, by the argument `one-individual`. -/
theorem full_surjection_monoid.possible_infinity_e : Statements.Models.full_surjection_monoid.possible_infinity_e :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj, Classicism.Map.Arguments.one_individual.possible_infinity_e (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Map.Meets.mset_one_individual Classicism.Meta.Intensional.FullActionModels.surj)⟩

/-- `full-surjection-monoid`: □Relational Choice holds, by the argument `relational-choice-full-boxed`. -/
theorem full_surjection_monoid.necessary_relational_choice_r : Statements.Models.full_surjection_monoid.necessary_relational_choice_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj, Classicism.Map.Arguments.relational_choice_full_boxed.necessary_relational_choice_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.FullActionModels.surj)⟩

/-- `full-surjection-monoid`: Relational Choice holds, by the argument `relational-choice-full`. -/
theorem full_surjection_monoid.relational_choice_r : Statements.Models.full_surjection_monoid.relational_choice_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj, Classicism.Map.Arguments.relational_choice_full.relational_choice_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.FullActionModels.surj)⟩

/-- `full-surjection-monoid`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem full_surjection_monoid.transversal_choice_r : Statements.Models.full_surjection_monoid.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj, Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.Premodel.Full.extFull _ (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.FullActionModels.surj))⟩

/-- `full-surjection-monoid`: ND (type t) fails, by the argument `unretracted-arrow`. -/
theorem full_surjection_monoid.distinctness_necessary_t : Statements.Models.full_surjection_monoid.distinctness_necessary_t :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj, Classicism.Map.Arguments.unretracted_arrow.distinctness_necessary_t (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.FullActionModels.surj_unretracted)⟩

/-- `full-surjection-monoid`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem full_surjection_monoid.independence_signature_r : Statements.Models.full_surjection_monoid.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj)) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj)) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj))⟩

/-- `full-surjection-monoid`: No Contingency (signature Σ) holds, by the argument `sigma-top-npc`. -/
theorem full_surjection_monoid.no_contingency_signature_r : Statements.Models.full_surjection_monoid.no_contingency_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj), Classicism.Map.Arguments.sigma_top_npc.no_contingency_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj)) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj)) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj)) (Classicism.Meta.Intensional.Premodel.holdsAx_interp_ofPure.2 ((Classicism.Map.Models.full_surjection_monoid.no_pure_contingency_r).2))⟩

/-- `full-surjection-monoid-sigma-true-atom`: □Atomicity holds, by the argument `full-atomicity`. -/
theorem full_surjection_monoid_sigma_true_atom.necessary_atomicity_r : Statements.Models.full_surjection_monoid_sigma_true_atom.necessary_atomicity_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj, Classicism.Map.Arguments.full_atomicity.necessary_atomicity_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.FullActionModels.surj)⟩

/-- `full-surjection-monoid-sigma-true-atom`: □BF holds, by the argument `full-epic-barcan`. -/
theorem full_surjection_monoid_sigma_true_atom.necessary_barcan_r : Statements.Models.full_surjection_monoid_sigma_true_atom.necessary_barcan_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj, Classicism.Map.Arguments.full_epic_barcan.necessary_barcan_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.FullActionModels.surj_epic)⟩

/-- `full-surjection-monoid-sigma-true-atom`: □Rigid Comprehension holds, by the argument `full-rigid-comprehension`. -/
theorem full_surjection_monoid_sigma_true_atom.necessary_rigid_comprehension_r : Statements.Models.full_surjection_monoid_sigma_true_atom.necessary_rigid_comprehension_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj, Classicism.Map.Arguments.full_rigid_comprehension.necessary_rigid_comprehension_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.FullActionModels.surj)⟩

/-- `full-surjection-monoid-sigma-true-atom`: Axiom of Infinity (type t) holds, by the argument `infinitely-many-propositions`. -/
theorem full_surjection_monoid_sigma_true_atom.axiom_of_infinity_t : Statements.Models.full_surjection_monoid_sigma_true_atom.axiom_of_infinity_t :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj, Classicism.Map.Arguments.infinitely_many_propositions.axiom_of_infinity_t (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.Premodel.Full.extFull _ (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.FullActionModels.surj)) (Classicism.Meta.Intensional.FullActionModels.mset_infinitely_many_propositions Classicism.Meta.Intensional.FullActionModels.surj)⟩

/-- `full-surjection-monoid-sigma-true-atom`: Infinity Schema (type t) holds, by the argument `infinitely-many-propositions`. -/
theorem full_surjection_monoid_sigma_true_atom.infinity_t : Statements.Models.full_surjection_monoid_sigma_true_atom.infinity_t :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj, Classicism.Map.Arguments.infinitely_many_propositions.infinity_t (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.Premodel.Full.extFull _ (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.FullActionModels.surj)) (Classicism.Meta.Intensional.FullActionModels.mset_infinitely_many_propositions Classicism.Meta.Intensional.FullActionModels.surj)⟩

/-- `full-surjection-monoid-sigma-true-atom`: Truths are ND-necessary fails, by the argument `nd-necessity-returning-arrow`. -/
theorem full_surjection_monoid_sigma_true_atom.truths_are_nd_necessary : Statements.Models.full_surjection_monoid_sigma_true_atom.truths_are_nd_necessary :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj, Classicism.Map.Arguments.nd_necessity_returning_arrow.truths_are_nd_necessary (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.FullActionModels.surj_returning)⟩

/-- `full-surjection-monoid-sigma-true-atom`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem full_surjection_monoid_sigma_true_atom.no_pure_contingency_r : Statements.Models.full_surjection_monoid_sigma_true_atom.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj, Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.Premodel.oneObject_of_subsingleton _)⟩

/-- `full-surjection-monoid-sigma-true-atom`: Fregean Axiom fails, by the argument `nonidentity-arrow`. -/
theorem full_surjection_monoid_sigma_true_atom.fregean_axiom : Statements.Models.full_surjection_monoid_sigma_true_atom.fregean_axiom :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj, Classicism.Map.Arguments.nonidentity_arrow.fregean_axiom (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.FullActionModels.surj_nonidentity)⟩

/-- `full-surjection-monoid-sigma-true-atom`: Infinity Schema (type e) fails, by the argument `one-individual`. -/
theorem full_surjection_monoid_sigma_true_atom.infinity_e : Statements.Models.full_surjection_monoid_sigma_true_atom.infinity_e :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj, Classicism.Map.Arguments.one_individual.infinity_e (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Map.Meets.mset_one_individual Classicism.Meta.Intensional.FullActionModels.surj)⟩

/-- `full-surjection-monoid-sigma-true-atom`: Axiom of Infinity (type e) fails, by the argument `one-individual`. -/
theorem full_surjection_monoid_sigma_true_atom.axiom_of_infinity_e : Statements.Models.full_surjection_monoid_sigma_true_atom.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj, Classicism.Map.Arguments.one_individual.axiom_of_infinity_e (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Map.Meets.mset_one_individual Classicism.Meta.Intensional.FullActionModels.surj)⟩

/-- `full-surjection-monoid-sigma-true-atom`: Possible Infinity (type e) fails, by the argument `one-individual`. -/
theorem full_surjection_monoid_sigma_true_atom.possible_infinity_e : Statements.Models.full_surjection_monoid_sigma_true_atom.possible_infinity_e :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj, Classicism.Map.Arguments.one_individual.possible_infinity_e (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Map.Meets.mset_one_individual Classicism.Meta.Intensional.FullActionModels.surj)⟩

/-- `full-surjection-monoid-sigma-true-atom`: □Relational Choice holds, by the argument `relational-choice-full-boxed`. -/
theorem full_surjection_monoid_sigma_true_atom.necessary_relational_choice_r : Statements.Models.full_surjection_monoid_sigma_true_atom.necessary_relational_choice_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj, Classicism.Map.Arguments.relational_choice_full_boxed.necessary_relational_choice_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.FullActionModels.surj)⟩

/-- `full-surjection-monoid-sigma-true-atom`: Relational Choice holds, by the argument `relational-choice-full`. -/
theorem full_surjection_monoid_sigma_true_atom.relational_choice_r : Statements.Models.full_surjection_monoid_sigma_true_atom.relational_choice_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj, Classicism.Map.Arguments.relational_choice_full.relational_choice_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.FullActionModels.surj)⟩

/-- `full-surjection-monoid-sigma-true-atom`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem full_surjection_monoid_sigma_true_atom.transversal_choice_r : Statements.Models.full_surjection_monoid_sigma_true_atom.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj, Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.Premodel.Full.extFull _ (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.FullActionModels.surj))⟩

/-- `full-surjection-monoid-sigma-true-atom`: ND (type t) fails, by the argument `unretracted-arrow`. -/
theorem full_surjection_monoid_sigma_true_atom.distinctness_necessary_t : Statements.Models.full_surjection_monoid_sigma_true_atom.distinctness_necessary_t :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj, Classicism.Map.Arguments.unretracted_arrow.distinctness_necessary_t (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.FullActionModels.surj_unretracted)⟩

/-- `full-two-object-chain`: B for pure sentences fails, by the argument `fewer-propositions-after`. -/
theorem full_two_object_chain.pure_b_r : Statements.Models.full_two_object_chain.pure_b_r :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.fewer_propositions_after.pure_b_r (Classicism.Meta.Intensional.FullActionModels.chain) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.chain_fewer_propositions_after)⟩

/-- `full-two-object-chain`: Possible Infinity (type t) fails, by the argument `finitely-many-propositions-everywhere`. -/
theorem full_two_object_chain.possible_infinity_t : Statements.Models.full_two_object_chain.possible_infinity_t :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.finitely_many_propositions_everywhere.possible_infinity_t (Classicism.Meta.Intensional.FullActionModels.chain) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.chain_finitely_many_everywhere)⟩

/-- `full-two-object-chain`: Infinity Schema (type t) fails, by the argument `finitely-many-propositions`. -/
theorem full_two_object_chain.infinity_t : Statements.Models.full_two_object_chain.infinity_t :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.finitely_many_propositions.infinity_t (Classicism.Meta.Intensional.FullActionModels.chain) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _) (Classicism.Meta.Intensional.FullActionModels.chain_finitely_many_propositions)⟩

/-- `full-two-object-chain`: Axiom of Infinity (type t) fails, by the argument `finitely-many-propositions`. -/
theorem full_two_object_chain.axiom_of_infinity_t : Statements.Models.full_two_object_chain.axiom_of_infinity_t :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.finitely_many_propositions.axiom_of_infinity_t (Classicism.Meta.Intensional.FullActionModels.chain) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _) (Classicism.Meta.Intensional.FullActionModels.chain_finitely_many_propositions)⟩

/-- `full-two-object-chain`: □Atomicity holds, by the argument `full-atomicity`. -/
theorem full_two_object_chain.necessary_atomicity_r : Statements.Models.full_two_object_chain.necessary_atomicity_r :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.full_atomicity.necessary_atomicity_r (Classicism.Meta.Intensional.FullActionModels.chain) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _)⟩

/-- `full-two-object-chain`: □BF holds, by the argument `full-epic-barcan`. -/
theorem full_two_object_chain.necessary_barcan_r : Statements.Models.full_two_object_chain.necessary_barcan_r :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.full_epic_barcan.necessary_barcan_r (Classicism.Meta.Intensional.FullActionModels.chain) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _) (Classicism.Meta.Intensional.FullActionModels.chain_epic)⟩

/-- `full-two-object-chain`: □Rigid Comprehension holds, by the argument `full-rigid-comprehension`. -/
theorem full_two_object_chain.necessary_rigid_comprehension_r : Statements.Models.full_two_object_chain.necessary_rigid_comprehension_r :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.full_rigid_comprehension.necessary_rigid_comprehension_r (Classicism.Meta.Intensional.FullActionModels.chain) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _)⟩

/-- `full-two-object-chain`: Truths are ND-necessary holds, by the argument `nd-necessity-isolated-actual-world`. -/
theorem full_two_object_chain.truths_are_nd_necessary : Statements.Models.full_two_object_chain.truths_are_nd_necessary :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.nd_necessity_isolated_actual_world.truths_are_nd_necessary (Classicism.Meta.Intensional.FullActionModels.chain) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.chain_actual_world_isolated)⟩

/-- `full-two-object-chain`: Fregean Axiom fails, by the argument `nonidentity-arrow`. -/
theorem full_two_object_chain.fregean_axiom : Statements.Models.full_two_object_chain.fregean_axiom :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.nonidentity_arrow.fregean_axiom (Classicism.Meta.Intensional.FullActionModels.chain) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _) (Classicism.Meta.Intensional.FullActionModels.chain_nonidentity)⟩

/-- `full-two-object-chain`: Infinity Schema (type e) fails, by the argument `one-individual`. -/
theorem full_two_object_chain.infinity_e : Statements.Models.full_two_object_chain.infinity_e :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.one_individual.infinity_e (Classicism.Meta.Intensional.FullActionModels.chain) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_one_individual _)⟩

/-- `full-two-object-chain`: Axiom of Infinity (type e) fails, by the argument `one-individual`. -/
theorem full_two_object_chain.axiom_of_infinity_e : Statements.Models.full_two_object_chain.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.one_individual.axiom_of_infinity_e (Classicism.Meta.Intensional.FullActionModels.chain) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_one_individual _)⟩

/-- `full-two-object-chain`: Possible Infinity (type e) fails, by the argument `one-individual`. -/
theorem full_two_object_chain.possible_infinity_e : Statements.Models.full_two_object_chain.possible_infinity_e :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.one_individual.possible_infinity_e (Classicism.Meta.Intensional.FullActionModels.chain) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_one_individual _)⟩

/-- `full-two-object-chain`: □Relational Choice holds, by the argument `relational-choice-full-boxed`. -/
theorem full_two_object_chain.necessary_relational_choice_r : Statements.Models.full_two_object_chain.necessary_relational_choice_r :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.relational_choice_full_boxed.necessary_relational_choice_r (Classicism.Meta.Intensional.FullActionModels.chain) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _)⟩

/-- `full-two-object-chain`: Relational Choice holds, by the argument `relational-choice-full`. -/
theorem full_two_object_chain.relational_choice_r : Statements.Models.full_two_object_chain.relational_choice_r :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.relational_choice_full.relational_choice_r (Classicism.Meta.Intensional.FullActionModels.chain) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _)⟩

/-- `full-two-object-chain`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem full_two_object_chain.transversal_choice_r : Statements.Models.full_two_object_chain.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.FullActionModels.chain) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.Premodel.Full.extFull _ (Classicism.Meta.Intensional.FullActionModels.unitModel_full _))⟩

/-- `full-two-object-chain`: ND (type t) fails, by the argument `unretracted-arrow`. -/
theorem full_two_object_chain.distinctness_necessary_t : Statements.Models.full_two_object_chain.distinctness_necessary_t :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.unretracted_arrow.distinctness_necessary_t (Classicism.Meta.Intensional.FullActionModels.chain) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _) (Classicism.Meta.Intensional.FullActionModels.chain_unretracted)⟩

/-- `full-two-object-chain`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem full_two_object_chain.independence_signature_r : Statements.Models.full_two_object_chain.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.FullActionModels.chain) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _)) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _)) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _))⟩

/-- `full-two-object-chain-sigma-true-atom`: B for pure sentences fails, by the argument `fewer-propositions-after`. -/
theorem full_two_object_chain_sigma_true_atom.pure_b_r : Statements.Models.full_two_object_chain_sigma_true_atom.pure_b_r :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.fewer_propositions_after.pure_b_r (Classicism.Meta.Intensional.FullActionModels.chain) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.chain_fewer_propositions_after)⟩

/-- `full-two-object-chain-sigma-true-atom`: Possible Infinity (type t) fails, by the argument `finitely-many-propositions-everywhere`. -/
theorem full_two_object_chain_sigma_true_atom.possible_infinity_t : Statements.Models.full_two_object_chain_sigma_true_atom.possible_infinity_t :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.finitely_many_propositions_everywhere.possible_infinity_t (Classicism.Meta.Intensional.FullActionModels.chain) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.chain_finitely_many_everywhere)⟩

/-- `full-two-object-chain-sigma-true-atom`: Infinity Schema (type t) fails, by the argument `finitely-many-propositions`. -/
theorem full_two_object_chain_sigma_true_atom.infinity_t : Statements.Models.full_two_object_chain_sigma_true_atom.infinity_t :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.finitely_many_propositions.infinity_t (Classicism.Meta.Intensional.FullActionModels.chain) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _) (Classicism.Meta.Intensional.FullActionModels.chain_finitely_many_propositions)⟩

/-- `full-two-object-chain-sigma-true-atom`: Axiom of Infinity (type t) fails, by the argument `finitely-many-propositions`. -/
theorem full_two_object_chain_sigma_true_atom.axiom_of_infinity_t : Statements.Models.full_two_object_chain_sigma_true_atom.axiom_of_infinity_t :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.finitely_many_propositions.axiom_of_infinity_t (Classicism.Meta.Intensional.FullActionModels.chain) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _) (Classicism.Meta.Intensional.FullActionModels.chain_finitely_many_propositions)⟩

/-- `full-two-object-chain-sigma-true-atom`: □Atomicity holds, by the argument `full-atomicity`. -/
theorem full_two_object_chain_sigma_true_atom.necessary_atomicity_r : Statements.Models.full_two_object_chain_sigma_true_atom.necessary_atomicity_r :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.full_atomicity.necessary_atomicity_r (Classicism.Meta.Intensional.FullActionModels.chain) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _)⟩

/-- `full-two-object-chain-sigma-true-atom`: □BF holds, by the argument `full-epic-barcan`. -/
theorem full_two_object_chain_sigma_true_atom.necessary_barcan_r : Statements.Models.full_two_object_chain_sigma_true_atom.necessary_barcan_r :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.full_epic_barcan.necessary_barcan_r (Classicism.Meta.Intensional.FullActionModels.chain) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _) (Classicism.Meta.Intensional.FullActionModels.chain_epic)⟩

/-- `full-two-object-chain-sigma-true-atom`: □Rigid Comprehension holds, by the argument `full-rigid-comprehension`. -/
theorem full_two_object_chain_sigma_true_atom.necessary_rigid_comprehension_r : Statements.Models.full_two_object_chain_sigma_true_atom.necessary_rigid_comprehension_r :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.full_rigid_comprehension.necessary_rigid_comprehension_r (Classicism.Meta.Intensional.FullActionModels.chain) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _)⟩

/-- `full-two-object-chain-sigma-true-atom`: Truths are ND-necessary holds, by the argument `nd-necessity-isolated-actual-world`. -/
theorem full_two_object_chain_sigma_true_atom.truths_are_nd_necessary : Statements.Models.full_two_object_chain_sigma_true_atom.truths_are_nd_necessary :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.nd_necessity_isolated_actual_world.truths_are_nd_necessary (Classicism.Meta.Intensional.FullActionModels.chain) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.chain_actual_world_isolated)⟩

/-- `full-two-object-chain-sigma-true-atom`: Fregean Axiom fails, by the argument `nonidentity-arrow`. -/
theorem full_two_object_chain_sigma_true_atom.fregean_axiom : Statements.Models.full_two_object_chain_sigma_true_atom.fregean_axiom :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.nonidentity_arrow.fregean_axiom (Classicism.Meta.Intensional.FullActionModels.chain) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _) (Classicism.Meta.Intensional.FullActionModels.chain_nonidentity)⟩

/-- `full-two-object-chain-sigma-true-atom`: Infinity Schema (type e) fails, by the argument `one-individual`. -/
theorem full_two_object_chain_sigma_true_atom.infinity_e : Statements.Models.full_two_object_chain_sigma_true_atom.infinity_e :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.one_individual.infinity_e (Classicism.Meta.Intensional.FullActionModels.chain) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_one_individual _)⟩

/-- `full-two-object-chain-sigma-true-atom`: Axiom of Infinity (type e) fails, by the argument `one-individual`. -/
theorem full_two_object_chain_sigma_true_atom.axiom_of_infinity_e : Statements.Models.full_two_object_chain_sigma_true_atom.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.one_individual.axiom_of_infinity_e (Classicism.Meta.Intensional.FullActionModels.chain) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_one_individual _)⟩

/-- `full-two-object-chain-sigma-true-atom`: Possible Infinity (type e) fails, by the argument `one-individual`. -/
theorem full_two_object_chain_sigma_true_atom.possible_infinity_e : Statements.Models.full_two_object_chain_sigma_true_atom.possible_infinity_e :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.one_individual.possible_infinity_e (Classicism.Meta.Intensional.FullActionModels.chain) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_one_individual _)⟩

/-- `full-two-object-chain-sigma-true-atom`: □Relational Choice holds, by the argument `relational-choice-full-boxed`. -/
theorem full_two_object_chain_sigma_true_atom.necessary_relational_choice_r : Statements.Models.full_two_object_chain_sigma_true_atom.necessary_relational_choice_r :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.relational_choice_full_boxed.necessary_relational_choice_r (Classicism.Meta.Intensional.FullActionModels.chain) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _)⟩

/-- `full-two-object-chain-sigma-true-atom`: Relational Choice holds, by the argument `relational-choice-full`. -/
theorem full_two_object_chain_sigma_true_atom.relational_choice_r : Statements.Models.full_two_object_chain_sigma_true_atom.relational_choice_r :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.relational_choice_full.relational_choice_r (Classicism.Meta.Intensional.FullActionModels.chain) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _)⟩

/-- `full-two-object-chain-sigma-true-atom`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem full_two_object_chain_sigma_true_atom.transversal_choice_r : Statements.Models.full_two_object_chain_sigma_true_atom.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.FullActionModels.chain) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.Premodel.Full.extFull _ (Classicism.Meta.Intensional.FullActionModels.unitModel_full _))⟩

/-- `full-two-object-chain-sigma-true-atom`: ND (type t) fails, by the argument `unretracted-arrow`. -/
theorem full_two_object_chain_sigma_true_atom.distinctness_necessary_t : Statements.Models.full_two_object_chain_sigma_true_atom.distinctness_necessary_t :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.unretracted_arrow.distinctness_necessary_t (Classicism.Meta.Intensional.FullActionModels.chain) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _) (Classicism.Meta.Intensional.FullActionModels.chain_unretracted)⟩

/-- `full-two-object-double-retraction`: Possible Infinity (type t) fails, by the argument `finitely-many-propositions-everywhere`. -/
theorem full_two_object_double_retraction.possible_infinity_t : Statements.Models.full_two_object_double_retraction.possible_infinity_t :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.finitely_many_propositions_everywhere.possible_infinity_t (Classicism.Meta.Intensional.FullActionModels.doubleRetraction) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.doubleRetraction_finitely_many_everywhere)⟩

/-- `full-two-object-double-retraction`: Infinity Schema (type t) fails, by the argument `finitely-many-propositions`. -/
theorem full_two_object_double_retraction.infinity_t : Statements.Models.full_two_object_double_retraction.infinity_t :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.finitely_many_propositions.infinity_t (Classicism.Meta.Intensional.FullActionModels.doubleRetraction) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _) (Classicism.Meta.Intensional.FullActionModels.doubleRetraction_finitely_many_propositions)⟩

/-- `full-two-object-double-retraction`: Axiom of Infinity (type t) fails, by the argument `finitely-many-propositions`. -/
theorem full_two_object_double_retraction.axiom_of_infinity_t : Statements.Models.full_two_object_double_retraction.axiom_of_infinity_t :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.finitely_many_propositions.axiom_of_infinity_t (Classicism.Meta.Intensional.FullActionModels.doubleRetraction) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _) (Classicism.Meta.Intensional.FullActionModels.doubleRetraction_finitely_many_propositions)⟩

/-- `full-two-object-double-retraction`: □Atomicity holds, by the argument `full-atomicity`. -/
theorem full_two_object_double_retraction.necessary_atomicity_r : Statements.Models.full_two_object_double_retraction.necessary_atomicity_r :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.full_atomicity.necessary_atomicity_r (Classicism.Meta.Intensional.FullActionModels.doubleRetraction) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _)⟩

/-- `full-two-object-double-retraction`: □Rigid Comprehension holds, by the argument `full-rigid-comprehension`. -/
theorem full_two_object_double_retraction.necessary_rigid_comprehension_r : Statements.Models.full_two_object_double_retraction.necessary_rigid_comprehension_r :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.full_rigid_comprehension.necessary_rigid_comprehension_r (Classicism.Meta.Intensional.FullActionModels.doubleRetraction) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _)⟩

/-- `full-two-object-double-retraction`: Truths are ND-necessary fails, by the argument `nd-necessity-returning-arrow`. -/
theorem full_two_object_double_retraction.truths_are_nd_necessary : Statements.Models.full_two_object_double_retraction.truths_are_nd_necessary :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.nd_necessity_returning_arrow.truths_are_nd_necessary (Classicism.Meta.Intensional.FullActionModels.doubleRetraction) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _) (Classicism.Meta.Intensional.FullActionModels.doubleRetraction_returning)⟩

/-- `full-two-object-double-retraction`: Strong Atomicity (type t) fails, by the argument `nonepic-strong-atomicity`. -/
theorem full_two_object_double_retraction.strong_atomicity_t : Statements.Models.full_two_object_double_retraction.strong_atomicity_t :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.nonepic_strong_atomicity.strong_atomicity_t (Classicism.Meta.Intensional.FullActionModels.doubleRetraction) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _) (Classicism.Meta.Intensional.FullActionModels.doubleRetraction_nonepic)⟩

/-- `full-two-object-double-retraction`: Fregean Axiom fails, by the argument `nonidentity-arrow`. -/
theorem full_two_object_double_retraction.fregean_axiom : Statements.Models.full_two_object_double_retraction.fregean_axiom :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.nonidentity_arrow.fregean_axiom (Classicism.Meta.Intensional.FullActionModels.doubleRetraction) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _) (Classicism.Meta.Intensional.FullActionModels.doubleRetraction_nonidentity)⟩

/-- `full-two-object-double-retraction`: Infinity Schema (type e) fails, by the argument `one-individual`. -/
theorem full_two_object_double_retraction.infinity_e : Statements.Models.full_two_object_double_retraction.infinity_e :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.one_individual.infinity_e (Classicism.Meta.Intensional.FullActionModels.doubleRetraction) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_one_individual _)⟩

/-- `full-two-object-double-retraction`: Axiom of Infinity (type e) fails, by the argument `one-individual`. -/
theorem full_two_object_double_retraction.axiom_of_infinity_e : Statements.Models.full_two_object_double_retraction.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.one_individual.axiom_of_infinity_e (Classicism.Meta.Intensional.FullActionModels.doubleRetraction) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_one_individual _)⟩

/-- `full-two-object-double-retraction`: Possible Infinity (type e) fails, by the argument `one-individual`. -/
theorem full_two_object_double_retraction.possible_infinity_e : Statements.Models.full_two_object_double_retraction.possible_infinity_e :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.one_individual.possible_infinity_e (Classicism.Meta.Intensional.FullActionModels.doubleRetraction) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_one_individual _)⟩

/-- `full-two-object-double-retraction`: □Relational Choice holds, by the argument `relational-choice-full-boxed`. -/
theorem full_two_object_double_retraction.necessary_relational_choice_r : Statements.Models.full_two_object_double_retraction.necessary_relational_choice_r :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.relational_choice_full_boxed.necessary_relational_choice_r (Classicism.Meta.Intensional.FullActionModels.doubleRetraction) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _)⟩

/-- `full-two-object-double-retraction`: Relational Choice holds, by the argument `relational-choice-full`. -/
theorem full_two_object_double_retraction.relational_choice_r : Statements.Models.full_two_object_double_retraction.relational_choice_r :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.relational_choice_full.relational_choice_r (Classicism.Meta.Intensional.FullActionModels.doubleRetraction) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _)⟩

/-- `full-two-object-double-retraction`: ND holds, by the argument `retractions`. -/
theorem full_two_object_double_retraction.distinctness_necessary_r : Statements.Models.full_two_object_double_retraction.distinctness_necessary_r :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.retractions.distinctness_necessary_r (Classicism.Meta.Intensional.FullActionModels.doubleRetraction) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.doubleRetraction_retractions)⟩

/-- `full-two-object-double-retraction`: Strong Actuality fails, by the argument `separated-retractions-strong-actuality`. -/
theorem full_two_object_double_retraction.strong_actuality : Statements.Models.full_two_object_double_retraction.strong_actuality :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.separated_retractions_strong_actuality.strong_actuality (Classicism.Meta.Intensional.FullActionModels.doubleRetraction) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.doubleRetraction_separated)⟩

/-- `full-two-object-double-retraction`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem full_two_object_double_retraction.transversal_choice_r : Statements.Models.full_two_object_double_retraction.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.FullActionModels.doubleRetraction) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.Premodel.Full.extFull _ (Classicism.Meta.Intensional.FullActionModels.unitModel_full _))⟩

/-- `full-two-object-double-retraction`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem full_two_object_double_retraction.independence_signature_r : Statements.Models.full_two_object_double_retraction.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.FullActionModels.doubleRetraction) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _)) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _)) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _))⟩

/-- `full-two-object-double-retraction-sigma-true-atom`: Possible Infinity (type t) fails, by the argument `finitely-many-propositions-everywhere`. -/
theorem full_two_object_double_retraction_sigma_true_atom.possible_infinity_t : Statements.Models.full_two_object_double_retraction_sigma_true_atom.possible_infinity_t :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.finitely_many_propositions_everywhere.possible_infinity_t (Classicism.Meta.Intensional.FullActionModels.doubleRetraction) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.doubleRetraction_finitely_many_everywhere)⟩

/-- `full-two-object-double-retraction-sigma-true-atom`: Infinity Schema (type t) fails, by the argument `finitely-many-propositions`. -/
theorem full_two_object_double_retraction_sigma_true_atom.infinity_t : Statements.Models.full_two_object_double_retraction_sigma_true_atom.infinity_t :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.finitely_many_propositions.infinity_t (Classicism.Meta.Intensional.FullActionModels.doubleRetraction) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _) (Classicism.Meta.Intensional.FullActionModels.doubleRetraction_finitely_many_propositions)⟩

/-- `full-two-object-double-retraction-sigma-true-atom`: Axiom of Infinity (type t) fails, by the argument `finitely-many-propositions`. -/
theorem full_two_object_double_retraction_sigma_true_atom.axiom_of_infinity_t : Statements.Models.full_two_object_double_retraction_sigma_true_atom.axiom_of_infinity_t :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.finitely_many_propositions.axiom_of_infinity_t (Classicism.Meta.Intensional.FullActionModels.doubleRetraction) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _) (Classicism.Meta.Intensional.FullActionModels.doubleRetraction_finitely_many_propositions)⟩

/-- `full-two-object-double-retraction-sigma-true-atom`: □Atomicity holds, by the argument `full-atomicity`. -/
theorem full_two_object_double_retraction_sigma_true_atom.necessary_atomicity_r : Statements.Models.full_two_object_double_retraction_sigma_true_atom.necessary_atomicity_r :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.full_atomicity.necessary_atomicity_r (Classicism.Meta.Intensional.FullActionModels.doubleRetraction) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _)⟩

/-- `full-two-object-double-retraction-sigma-true-atom`: □Rigid Comprehension holds, by the argument `full-rigid-comprehension`. -/
theorem full_two_object_double_retraction_sigma_true_atom.necessary_rigid_comprehension_r : Statements.Models.full_two_object_double_retraction_sigma_true_atom.necessary_rigid_comprehension_r :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.full_rigid_comprehension.necessary_rigid_comprehension_r (Classicism.Meta.Intensional.FullActionModels.doubleRetraction) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _)⟩

/-- `full-two-object-double-retraction-sigma-true-atom`: Truths are ND-necessary fails, by the argument `nd-necessity-returning-arrow`. -/
theorem full_two_object_double_retraction_sigma_true_atom.truths_are_nd_necessary : Statements.Models.full_two_object_double_retraction_sigma_true_atom.truths_are_nd_necessary :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.nd_necessity_returning_arrow.truths_are_nd_necessary (Classicism.Meta.Intensional.FullActionModels.doubleRetraction) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _) (Classicism.Meta.Intensional.FullActionModels.doubleRetraction_returning)⟩

/-- `full-two-object-double-retraction-sigma-true-atom`: Strong Atomicity (type t) fails, by the argument `nonepic-strong-atomicity`. -/
theorem full_two_object_double_retraction_sigma_true_atom.strong_atomicity_t : Statements.Models.full_two_object_double_retraction_sigma_true_atom.strong_atomicity_t :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.nonepic_strong_atomicity.strong_atomicity_t (Classicism.Meta.Intensional.FullActionModels.doubleRetraction) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _) (Classicism.Meta.Intensional.FullActionModels.doubleRetraction_nonepic)⟩

/-- `full-two-object-double-retraction-sigma-true-atom`: Fregean Axiom fails, by the argument `nonidentity-arrow`. -/
theorem full_two_object_double_retraction_sigma_true_atom.fregean_axiom : Statements.Models.full_two_object_double_retraction_sigma_true_atom.fregean_axiom :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.nonidentity_arrow.fregean_axiom (Classicism.Meta.Intensional.FullActionModels.doubleRetraction) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _) (Classicism.Meta.Intensional.FullActionModels.doubleRetraction_nonidentity)⟩

/-- `full-two-object-double-retraction-sigma-true-atom`: Infinity Schema (type e) fails, by the argument `one-individual`. -/
theorem full_two_object_double_retraction_sigma_true_atom.infinity_e : Statements.Models.full_two_object_double_retraction_sigma_true_atom.infinity_e :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.one_individual.infinity_e (Classicism.Meta.Intensional.FullActionModels.doubleRetraction) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_one_individual _)⟩

/-- `full-two-object-double-retraction-sigma-true-atom`: Axiom of Infinity (type e) fails, by the argument `one-individual`. -/
theorem full_two_object_double_retraction_sigma_true_atom.axiom_of_infinity_e : Statements.Models.full_two_object_double_retraction_sigma_true_atom.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.one_individual.axiom_of_infinity_e (Classicism.Meta.Intensional.FullActionModels.doubleRetraction) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_one_individual _)⟩

/-- `full-two-object-double-retraction-sigma-true-atom`: Possible Infinity (type e) fails, by the argument `one-individual`. -/
theorem full_two_object_double_retraction_sigma_true_atom.possible_infinity_e : Statements.Models.full_two_object_double_retraction_sigma_true_atom.possible_infinity_e :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.one_individual.possible_infinity_e (Classicism.Meta.Intensional.FullActionModels.doubleRetraction) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_one_individual _)⟩

/-- `full-two-object-double-retraction-sigma-true-atom`: □Relational Choice holds, by the argument `relational-choice-full-boxed`. -/
theorem full_two_object_double_retraction_sigma_true_atom.necessary_relational_choice_r : Statements.Models.full_two_object_double_retraction_sigma_true_atom.necessary_relational_choice_r :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.relational_choice_full_boxed.necessary_relational_choice_r (Classicism.Meta.Intensional.FullActionModels.doubleRetraction) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _)⟩

/-- `full-two-object-double-retraction-sigma-true-atom`: Relational Choice holds, by the argument `relational-choice-full`. -/
theorem full_two_object_double_retraction_sigma_true_atom.relational_choice_r : Statements.Models.full_two_object_double_retraction_sigma_true_atom.relational_choice_r :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.relational_choice_full.relational_choice_r (Classicism.Meta.Intensional.FullActionModels.doubleRetraction) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _)⟩

/-- `full-two-object-double-retraction-sigma-true-atom`: ND holds, by the argument `retractions`. -/
theorem full_two_object_double_retraction_sigma_true_atom.distinctness_necessary_r : Statements.Models.full_two_object_double_retraction_sigma_true_atom.distinctness_necessary_r :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.retractions.distinctness_necessary_r (Classicism.Meta.Intensional.FullActionModels.doubleRetraction) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.doubleRetraction_retractions)⟩

/-- `full-two-object-double-retraction-sigma-true-atom`: Strong Actuality fails, by the argument `separated-retractions-strong-actuality`. -/
theorem full_two_object_double_retraction_sigma_true_atom.strong_actuality : Statements.Models.full_two_object_double_retraction_sigma_true_atom.strong_actuality :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.separated_retractions_strong_actuality.strong_actuality (Classicism.Meta.Intensional.FullActionModels.doubleRetraction) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.doubleRetraction_separated)⟩

/-- `full-two-object-double-retraction-sigma-true-atom`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem full_two_object_double_retraction_sigma_true_atom.transversal_choice_r : Statements.Models.full_two_object_double_retraction_sigma_true_atom.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.FullActionModels.doubleRetraction) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.Premodel.Full.extFull _ (Classicism.Meta.Intensional.FullActionModels.unitModel_full _))⟩

/-- `full-two-object-retract`: Gallin Extensional Comprehension holds, by the argument `coherent-retractions`. -/
theorem full_two_object_retract.gallin_extensional_comprehension_r : Statements.Models.full_two_object_retract.gallin_extensional_comprehension_r :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.coherent_retractions.gallin_extensional_comprehension_r (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _) (Classicism.Meta.Intensional.FullActionModels.retract_coherent)⟩

/-- `full-two-object-retract`: Possible Infinity (type t) fails, by the argument `finitely-many-propositions-everywhere`. -/
theorem full_two_object_retract.possible_infinity_t : Statements.Models.full_two_object_retract.possible_infinity_t :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.finitely_many_propositions_everywhere.possible_infinity_t (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.retract_finitely_many_everywhere)⟩

/-- `full-two-object-retract`: Infinity Schema (type t) fails, by the argument `finitely-many-propositions`. -/
theorem full_two_object_retract.infinity_t : Statements.Models.full_two_object_retract.infinity_t :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.finitely_many_propositions.infinity_t (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _) (Classicism.Meta.Intensional.FullActionModels.retract_finitely_many_propositions)⟩

/-- `full-two-object-retract`: Axiom of Infinity (type t) fails, by the argument `finitely-many-propositions`. -/
theorem full_two_object_retract.axiom_of_infinity_t : Statements.Models.full_two_object_retract.axiom_of_infinity_t :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.finitely_many_propositions.axiom_of_infinity_t (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _) (Classicism.Meta.Intensional.FullActionModels.retract_finitely_many_propositions)⟩

/-- `full-two-object-retract`: □Atomicity holds, by the argument `full-atomicity`. -/
theorem full_two_object_retract.necessary_atomicity_r : Statements.Models.full_two_object_retract.necessary_atomicity_r :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.full_atomicity.necessary_atomicity_r (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _)⟩

/-- `full-two-object-retract`: □Rigid Comprehension holds, by the argument `full-rigid-comprehension`. -/
theorem full_two_object_retract.necessary_rigid_comprehension_r : Statements.Models.full_two_object_retract.necessary_rigid_comprehension_r :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.full_rigid_comprehension.necessary_rigid_comprehension_r (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _)⟩

/-- `full-two-object-retract`: Truths are ND-necessary fails, by the argument `nd-necessity-returning-arrow`. -/
theorem full_two_object_retract.truths_are_nd_necessary : Statements.Models.full_two_object_retract.truths_are_nd_necessary :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.nd_necessity_returning_arrow.truths_are_nd_necessary (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _) (Classicism.Meta.Intensional.FullActionModels.retract_returning)⟩

/-- `full-two-object-retract`: Strong Atomicity (type t) fails, by the argument `nonepic-strong-atomicity`. -/
theorem full_two_object_retract.strong_atomicity_t : Statements.Models.full_two_object_retract.strong_atomicity_t :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.nonepic_strong_atomicity.strong_atomicity_t (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _) (Classicism.Meta.Intensional.FullActionModels.retract_nonepic)⟩

/-- `full-two-object-retract`: Fregean Axiom fails, by the argument `nonidentity-arrow`. -/
theorem full_two_object_retract.fregean_axiom : Statements.Models.full_two_object_retract.fregean_axiom :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.nonidentity_arrow.fregean_axiom (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _) (Classicism.Meta.Intensional.FullActionModels.retract_nonidentity)⟩

/-- `full-two-object-retract`: Infinity Schema (type e) fails, by the argument `one-individual`. -/
theorem full_two_object_retract.infinity_e : Statements.Models.full_two_object_retract.infinity_e :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.one_individual.infinity_e (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_one_individual _)⟩

/-- `full-two-object-retract`: Axiom of Infinity (type e) fails, by the argument `one-individual`. -/
theorem full_two_object_retract.axiom_of_infinity_e : Statements.Models.full_two_object_retract.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.one_individual.axiom_of_infinity_e (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_one_individual _)⟩

/-- `full-two-object-retract`: Possible Infinity (type e) fails, by the argument `one-individual`. -/
theorem full_two_object_retract.possible_infinity_e : Statements.Models.full_two_object_retract.possible_infinity_e :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.one_individual.possible_infinity_e (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_one_individual _)⟩

/-- `full-two-object-retract`: □Relational Choice holds, by the argument `relational-choice-full-boxed`. -/
theorem full_two_object_retract.necessary_relational_choice_r : Statements.Models.full_two_object_retract.necessary_relational_choice_r :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.relational_choice_full_boxed.necessary_relational_choice_r (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _)⟩

/-- `full-two-object-retract`: Relational Choice holds, by the argument `relational-choice-full`. -/
theorem full_two_object_retract.relational_choice_r : Statements.Models.full_two_object_retract.relational_choice_r :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.relational_choice_full.relational_choice_r (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _)⟩

/-- `full-two-object-retract`: ND holds, by the argument `retractions`. -/
theorem full_two_object_retract.distinctness_necessary_r : Statements.Models.full_two_object_retract.distinctness_necessary_r :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.retractions.distinctness_necessary_r (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.retract_retractions)⟩

/-- `full-two-object-retract`: Strong Actuality holds, by the argument `strong-actuality-unique-retractions`. -/
theorem full_two_object_retract.strong_actuality : Statements.Models.full_two_object_retract.strong_actuality :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.strong_actuality_unique_retractions.strong_actuality (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.Premodel.Full.identitySingletons _ (Classicism.Meta.Intensional.FullActionModels.unitModel_full _)) (Classicism.Meta.Intensional.FullActionModels.retract_unique_retractions)⟩

/-- `full-two-object-retract`: □Strong Actuality holds, by the argument `strong-actuality-unique-retractions`. -/
theorem full_two_object_retract.necessary_strong_actuality : Statements.Models.full_two_object_retract.necessary_strong_actuality :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.strong_actuality_unique_retractions.necessary_strong_actuality (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.Premodel.Full.identitySingletons _ (Classicism.Meta.Intensional.FullActionModels.unitModel_full _)) (Classicism.Meta.Intensional.FullActionModels.retract_unique_retractions)⟩

/-- `full-two-object-retract`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem full_two_object_retract.transversal_choice_r : Statements.Models.full_two_object_retract.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.Premodel.Full.extFull _ (Classicism.Meta.Intensional.FullActionModels.unitModel_full _))⟩

/-- `full-two-object-retract`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem full_two_object_retract.independence_signature_r : Statements.Models.full_two_object_retract.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _)) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _)) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _))⟩

/-- `full-two-object-retract-sigma-true-atom`: Gallin Extensional Comprehension holds, by the argument `coherent-retractions`. -/
theorem full_two_object_retract_sigma_true_atom.gallin_extensional_comprehension_r : Statements.Models.full_two_object_retract_sigma_true_atom.gallin_extensional_comprehension_r :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.coherent_retractions.gallin_extensional_comprehension_r (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _) (Classicism.Meta.Intensional.FullActionModels.retract_coherent)⟩

/-- `full-two-object-retract-sigma-true-atom`: Possible Infinity (type t) fails, by the argument `finitely-many-propositions-everywhere`. -/
theorem full_two_object_retract_sigma_true_atom.possible_infinity_t : Statements.Models.full_two_object_retract_sigma_true_atom.possible_infinity_t :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.finitely_many_propositions_everywhere.possible_infinity_t (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.retract_finitely_many_everywhere)⟩

/-- `full-two-object-retract-sigma-true-atom`: Infinity Schema (type t) fails, by the argument `finitely-many-propositions`. -/
theorem full_two_object_retract_sigma_true_atom.infinity_t : Statements.Models.full_two_object_retract_sigma_true_atom.infinity_t :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.finitely_many_propositions.infinity_t (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _) (Classicism.Meta.Intensional.FullActionModels.retract_finitely_many_propositions)⟩

/-- `full-two-object-retract-sigma-true-atom`: Axiom of Infinity (type t) fails, by the argument `finitely-many-propositions`. -/
theorem full_two_object_retract_sigma_true_atom.axiom_of_infinity_t : Statements.Models.full_two_object_retract_sigma_true_atom.axiom_of_infinity_t :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.finitely_many_propositions.axiom_of_infinity_t (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _) (Classicism.Meta.Intensional.FullActionModels.retract_finitely_many_propositions)⟩

/-- `full-two-object-retract-sigma-true-atom`: □Atomicity holds, by the argument `full-atomicity`. -/
theorem full_two_object_retract_sigma_true_atom.necessary_atomicity_r : Statements.Models.full_two_object_retract_sigma_true_atom.necessary_atomicity_r :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.full_atomicity.necessary_atomicity_r (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _)⟩

/-- `full-two-object-retract-sigma-true-atom`: □Rigid Comprehension holds, by the argument `full-rigid-comprehension`. -/
theorem full_two_object_retract_sigma_true_atom.necessary_rigid_comprehension_r : Statements.Models.full_two_object_retract_sigma_true_atom.necessary_rigid_comprehension_r :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.full_rigid_comprehension.necessary_rigid_comprehension_r (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _)⟩

/-- `full-two-object-retract-sigma-true-atom`: Truths are ND-necessary fails, by the argument `nd-necessity-returning-arrow`. -/
theorem full_two_object_retract_sigma_true_atom.truths_are_nd_necessary : Statements.Models.full_two_object_retract_sigma_true_atom.truths_are_nd_necessary :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.nd_necessity_returning_arrow.truths_are_nd_necessary (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _) (Classicism.Meta.Intensional.FullActionModels.retract_returning)⟩

/-- `full-two-object-retract-sigma-true-atom`: Strong Atomicity (type t) fails, by the argument `nonepic-strong-atomicity`. -/
theorem full_two_object_retract_sigma_true_atom.strong_atomicity_t : Statements.Models.full_two_object_retract_sigma_true_atom.strong_atomicity_t :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.nonepic_strong_atomicity.strong_atomicity_t (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _) (Classicism.Meta.Intensional.FullActionModels.retract_nonepic)⟩

/-- `full-two-object-retract-sigma-true-atom`: Fregean Axiom fails, by the argument `nonidentity-arrow`. -/
theorem full_two_object_retract_sigma_true_atom.fregean_axiom : Statements.Models.full_two_object_retract_sigma_true_atom.fregean_axiom :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.nonidentity_arrow.fregean_axiom (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _) (Classicism.Meta.Intensional.FullActionModels.retract_nonidentity)⟩

/-- `full-two-object-retract-sigma-true-atom`: Infinity Schema (type e) fails, by the argument `one-individual`. -/
theorem full_two_object_retract_sigma_true_atom.infinity_e : Statements.Models.full_two_object_retract_sigma_true_atom.infinity_e :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.one_individual.infinity_e (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_one_individual _)⟩

/-- `full-two-object-retract-sigma-true-atom`: Axiom of Infinity (type e) fails, by the argument `one-individual`. -/
theorem full_two_object_retract_sigma_true_atom.axiom_of_infinity_e : Statements.Models.full_two_object_retract_sigma_true_atom.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.one_individual.axiom_of_infinity_e (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_one_individual _)⟩

/-- `full-two-object-retract-sigma-true-atom`: Possible Infinity (type e) fails, by the argument `one-individual`. -/
theorem full_two_object_retract_sigma_true_atom.possible_infinity_e : Statements.Models.full_two_object_retract_sigma_true_atom.possible_infinity_e :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.one_individual.possible_infinity_e (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_one_individual _)⟩

/-- `full-two-object-retract-sigma-true-atom`: □Relational Choice holds, by the argument `relational-choice-full-boxed`. -/
theorem full_two_object_retract_sigma_true_atom.necessary_relational_choice_r : Statements.Models.full_two_object_retract_sigma_true_atom.necessary_relational_choice_r :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.relational_choice_full_boxed.necessary_relational_choice_r (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _)⟩

/-- `full-two-object-retract-sigma-true-atom`: Relational Choice holds, by the argument `relational-choice-full`. -/
theorem full_two_object_retract_sigma_true_atom.relational_choice_r : Statements.Models.full_two_object_retract_sigma_true_atom.relational_choice_r :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.relational_choice_full.relational_choice_r (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _)⟩

/-- `full-two-object-retract-sigma-true-atom`: ND holds, by the argument `retractions`. -/
theorem full_two_object_retract_sigma_true_atom.distinctness_necessary_r : Statements.Models.full_two_object_retract_sigma_true_atom.distinctness_necessary_r :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.retractions.distinctness_necessary_r (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.retract_retractions)⟩

/-- `full-two-object-retract-sigma-true-atom`: Strong Actuality holds, by the argument `strong-actuality-unique-retractions`. -/
theorem full_two_object_retract_sigma_true_atom.strong_actuality : Statements.Models.full_two_object_retract_sigma_true_atom.strong_actuality :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.strong_actuality_unique_retractions.strong_actuality (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.Premodel.Full.identitySingletons _ (Classicism.Meta.Intensional.FullActionModels.unitModel_full _)) (Classicism.Meta.Intensional.FullActionModels.retract_unique_retractions)⟩

/-- `full-two-object-retract-sigma-true-atom`: □Strong Actuality holds, by the argument `strong-actuality-unique-retractions`. -/
theorem full_two_object_retract_sigma_true_atom.necessary_strong_actuality : Statements.Models.full_two_object_retract_sigma_true_atom.necessary_strong_actuality :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.strong_actuality_unique_retractions.necessary_strong_actuality (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.Premodel.Full.identitySingletons _ (Classicism.Meta.Intensional.FullActionModels.unitModel_full _)) (Classicism.Meta.Intensional.FullActionModels.retract_unique_retractions)⟩

/-- `full-two-object-retract-sigma-true-atom`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem full_two_object_retract_sigma_true_atom.transversal_choice_r : Statements.Models.full_two_object_retract_sigma_true_atom.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.Premodel.Full.extFull _ (Classicism.Meta.Intensional.FullActionModels.unitModel_full _))⟩

/-- `symmetric-all-surjections`: Relational Choice fails, by `symmetric-ideally-full`'s argument `relational-choice`. -/
theorem symmetric_all_surjections.relational_choice_r : Statements.Models.symmetric_all_surjections.relational_choice_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj), Classicism.Map.Arguments.symmetric_ideally_full.relational_choice.relational_choice_r (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj) (Classicism.Meta.Intensional.SymIdeal.allSurj_transposable)⟩

/-- `symmetric-all-surjections`: Axiom of Infinity (type e) holds, by `symmetric-ideally-full`'s argument `axiom-of-infinity-e`. -/
theorem symmetric_all_surjections.axiom_of_infinity_e : Statements.Models.symmetric_all_surjections.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj), Classicism.Map.Arguments.symmetric_ideally_full.axiom_of_infinity_e.axiom_of_infinity_e (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj) (Classicism.Meta.Intensional.SymIdeal.infinitelyManyIndividuals Classicism.Meta.Intensional.SymIdeal.allSurj)⟩

/-- `symmetric-all-surjections`: BF holds, by `symmetric-ideally-full`'s argument `barcan-surjective`. -/
theorem symmetric_all_surjections.barcan_r : Statements.Models.symmetric_all_surjections.barcan_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj), Classicism.Map.Arguments.symmetric_ideally_full.barcan_surjective.barcan_r (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj) (Classicism.Meta.Intensional.SymIdeal.allSurj_surjectiveArrows) (fun _ _ h => h)⟩

/-- `symmetric-all-surjections`: Boolean Completeness holds, by `symmetric-ideally-full`'s argument `boolean-completeness`. -/
theorem symmetric_all_surjections.boolean_completeness_r : Statements.Models.symmetric_all_surjections.boolean_completeness_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj), Classicism.Map.Arguments.symmetric_ideally_full.boolean_completeness.boolean_completeness_r (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj) (Classicism.Meta.Intensional.SymIdeal.allSurj_hullConditions)⟩

/-- `symmetric-all-surjections`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem symmetric_all_surjections.no_pure_contingency_r : Statements.Models.symmetric_all_surjections.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj), Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj)) (Classicism.Meta.Intensional.Premodel.oneObject_of_subsingleton _)⟩

/-- `symmetric-all-surjections`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem symmetric_all_surjections.independence_signature_r : Statements.Models.symmetric_all_surjections.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj)), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj)))⟩

/-- `symmetric-all-surjections`: No Contingency (signature Σ) holds, by the argument `sigma-top-npc`. -/
theorem symmetric_all_surjections.no_contingency_signature_r : Statements.Models.symmetric_all_surjections.no_contingency_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj)), Classicism.Map.Arguments.sigma_top_npc.no_contingency_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.allSurj))) (Classicism.Meta.Intensional.Premodel.holdsAx_interp_ofPure.2 ((Classicism.Map.Models.symmetric_all_surjections.no_pure_contingency_r).2))⟩

/-- `symmetric-class-reflecting-surjections`: Relational Choice fails, by `symmetric-ideally-full`'s argument `relational-choice`. -/
theorem symmetric_class_reflecting_surjections.relational_choice_r : Statements.Models.symmetric_class_reflecting_surjections.relational_choice_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.classReflect), Classicism.Map.Arguments.symmetric_ideally_full.relational_choice.relational_choice_r (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.classReflect) (Classicism.Meta.Intensional.SymIdeal.classReflect_transposable)⟩

/-- `symmetric-class-reflecting-surjections`: Axiom of Infinity (type e) holds, by `symmetric-ideally-full`'s argument `axiom-of-infinity-e`. -/
theorem symmetric_class_reflecting_surjections.axiom_of_infinity_e : Statements.Models.symmetric_class_reflecting_surjections.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.classReflect), Classicism.Map.Arguments.symmetric_ideally_full.axiom_of_infinity_e.axiom_of_infinity_e (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.classReflect) (Classicism.Meta.Intensional.SymIdeal.infinitelyManyIndividuals Classicism.Meta.Intensional.SymIdeal.classReflect)⟩

/-- `symmetric-class-reflecting-surjections`: BF holds, by `symmetric-ideally-full`'s argument `barcan-surjective`. -/
theorem symmetric_class_reflecting_surjections.barcan_r : Statements.Models.symmetric_class_reflecting_surjections.barcan_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.classReflect), Classicism.Map.Arguments.symmetric_ideally_full.barcan_surjective.barcan_r (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.classReflect) (Classicism.Meta.Intensional.SymIdeal.classReflect_surjectiveArrows) (fun _ _ h => h)⟩

/-- `symmetric-class-reflecting-surjections`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem symmetric_class_reflecting_surjections.no_pure_contingency_r : Statements.Models.symmetric_class_reflecting_surjections.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.classReflect), Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.classReflect)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.classReflect)) (Classicism.Meta.Intensional.Premodel.oneObject_of_subsingleton _)⟩

/-- `symmetric-class-reflecting-surjections`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem symmetric_class_reflecting_surjections.independence_signature_r : Statements.Models.symmetric_class_reflecting_surjections.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.classReflect)), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.classReflect)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.classReflect))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.classReflect))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.classReflect)))⟩

/-- `symmetric-class-reflecting-surjections`: No Contingency (signature Σ) holds, by the argument `sigma-top-npc`. -/
theorem symmetric_class_reflecting_surjections.no_contingency_signature_r : Statements.Models.symmetric_class_reflecting_surjections.no_contingency_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.classReflect)), Classicism.Map.Arguments.sigma_top_npc.no_contingency_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.classReflect)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.classReflect))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.classReflect))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.classReflect))) (Classicism.Meta.Intensional.Premodel.holdsAx_interp_ofPure.2 ((Classicism.Map.Models.symmetric_class_reflecting_surjections.no_pure_contingency_r).2))⟩

/-- `symmetric-collapse-pair-and-point`: Relational Choice fails, by `symmetric-ideally-full`'s argument `relational-choice`. -/
theorem symmetric_collapse_pair_and_point.relational_choice_r : Statements.Models.symmetric_collapse_pair_and_point.relational_choice_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.ptBase), Classicism.Map.Arguments.symmetric_ideally_full.relational_choice.relational_choice_r (Classicism.Meta.Intensional.SymIdeal.ptBase) (Classicism.Meta.Intensional.SymIdeal.pt_transposable)⟩

/-- `symmetric-collapse-pair-and-point`: Axiom of Infinity (type e) holds, by `symmetric-ideally-full`'s argument `axiom-of-infinity-e`. -/
theorem symmetric_collapse_pair_and_point.axiom_of_infinity_e : Statements.Models.symmetric_collapse_pair_and_point.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.ptBase), Classicism.Map.Arguments.symmetric_ideally_full.axiom_of_infinity_e.axiom_of_infinity_e (Classicism.Meta.Intensional.SymIdeal.ptBase) (Classicism.Meta.Intensional.SymIdeal.pt_infinitelyManyIndividuals)⟩

/-- `symmetric-collapse-pair-and-point`: Axiom of Infinity (type t) holds, by `symmetric-ideally-full`'s argument `axiom-of-infinity-t`. -/
theorem symmetric_collapse_pair_and_point.axiom_of_infinity_t : Statements.Models.symmetric_collapse_pair_and_point.axiom_of_infinity_t :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.ptBase), Classicism.Map.Arguments.symmetric_ideally_full.axiom_of_infinity_t.axiom_of_infinity_t (Classicism.Meta.Intensional.SymIdeal.ptBase) (Classicism.Meta.Intensional.SymIdeal.pt_separable)⟩

/-- `symmetric-collapse-pair-and-point`: Actuality holds, by `symmetric-ideally-full`'s argument `actuality`. -/
theorem symmetric_collapse_pair_and_point.actuality : Statements.Models.symmetric_collapse_pair_and_point.actuality :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.ptBase), Classicism.Map.Arguments.symmetric_ideally_full.actuality.actuality (Classicism.Meta.Intensional.SymIdeal.ptBase) (Classicism.Meta.Intensional.SymIdeal.pt_symmetryGroupPinned)⟩

/-- `symmetric-collapse-pair-and-point`: Boolean Completeness holds, by `symmetric-ideally-full`'s argument `boolean-completeness`. -/
theorem symmetric_collapse_pair_and_point.boolean_completeness_r : Statements.Models.symmetric_collapse_pair_and_point.boolean_completeness_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.ptBase), Classicism.Map.Arguments.symmetric_ideally_full.boolean_completeness.boolean_completeness_r (Classicism.Meta.Intensional.SymIdeal.ptBase) (Classicism.Meta.Intensional.SymIdeal.pt_hullConditions)⟩

/-- `symmetric-collapse-pair-and-point`: Truths are ND-necessary holds, by the argument `nd-necessity-isolated-actual-world`. -/
theorem symmetric_collapse_pair_and_point.truths_are_nd_necessary : Statements.Models.symmetric_collapse_pair_and_point.truths_are_nd_necessary :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.ptBase), Classicism.Map.Arguments.nd_necessity_isolated_actual_world.truths_are_nd_necessary (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.ptBase)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.ptBase)) (Classicism.Meta.Intensional.SymIdeal.pt_actualWorldIsolated)⟩

/-- `symmetric-collapse-pair-and-point`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem symmetric_collapse_pair_and_point.independence_signature_r : Statements.Models.symmetric_collapse_pair_and_point.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.ptBase)), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.ptBase)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.ptBase))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.ptBase))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.ptBase)))⟩

/-- `symmetric-collapse-pair-and-point-sigma-true-atom`: Relational Choice fails, by `symmetric-ideally-full`'s argument `relational-choice`. -/
theorem symmetric_collapse_pair_and_point_sigma_true_atom.relational_choice_r : Statements.Models.symmetric_collapse_pair_and_point_sigma_true_atom.relational_choice_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.ptBase), Classicism.Map.Arguments.symmetric_ideally_full.relational_choice.relational_choice_r (Classicism.Meta.Intensional.SymIdeal.ptBase) (Classicism.Meta.Intensional.SymIdeal.pt_transposable)⟩

/-- `symmetric-collapse-pair-and-point-sigma-true-atom`: Axiom of Infinity (type e) holds, by `symmetric-ideally-full`'s argument `axiom-of-infinity-e`. -/
theorem symmetric_collapse_pair_and_point_sigma_true_atom.axiom_of_infinity_e : Statements.Models.symmetric_collapse_pair_and_point_sigma_true_atom.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.ptBase), Classicism.Map.Arguments.symmetric_ideally_full.axiom_of_infinity_e.axiom_of_infinity_e (Classicism.Meta.Intensional.SymIdeal.ptBase) (Classicism.Meta.Intensional.SymIdeal.pt_infinitelyManyIndividuals)⟩

/-- `symmetric-collapse-pair-and-point-sigma-true-atom`: Axiom of Infinity (type t) holds, by `symmetric-ideally-full`'s argument `axiom-of-infinity-t`. -/
theorem symmetric_collapse_pair_and_point_sigma_true_atom.axiom_of_infinity_t : Statements.Models.symmetric_collapse_pair_and_point_sigma_true_atom.axiom_of_infinity_t :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.ptBase), Classicism.Map.Arguments.symmetric_ideally_full.axiom_of_infinity_t.axiom_of_infinity_t (Classicism.Meta.Intensional.SymIdeal.ptBase) (Classicism.Meta.Intensional.SymIdeal.pt_separable)⟩

/-- `symmetric-collapse-pair-and-point-sigma-true-atom`: Actuality holds, by `symmetric-ideally-full`'s argument `actuality`. -/
theorem symmetric_collapse_pair_and_point_sigma_true_atom.actuality : Statements.Models.symmetric_collapse_pair_and_point_sigma_true_atom.actuality :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.ptBase), Classicism.Map.Arguments.symmetric_ideally_full.actuality.actuality (Classicism.Meta.Intensional.SymIdeal.ptBase) (Classicism.Meta.Intensional.SymIdeal.pt_symmetryGroupPinned)⟩

/-- `symmetric-collapse-pair-and-point-sigma-true-atom`: Boolean Completeness holds, by `symmetric-ideally-full`'s argument `boolean-completeness`. -/
theorem symmetric_collapse_pair_and_point_sigma_true_atom.boolean_completeness_r : Statements.Models.symmetric_collapse_pair_and_point_sigma_true_atom.boolean_completeness_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.ptBase), Classicism.Map.Arguments.symmetric_ideally_full.boolean_completeness.boolean_completeness_r (Classicism.Meta.Intensional.SymIdeal.ptBase) (Classicism.Meta.Intensional.SymIdeal.pt_hullConditions)⟩

/-- `symmetric-collapse-pair-and-point-sigma-true-atom`: Truths are ND-necessary holds, by the argument `nd-necessity-isolated-actual-world`. -/
theorem symmetric_collapse_pair_and_point_sigma_true_atom.truths_are_nd_necessary : Statements.Models.symmetric_collapse_pair_and_point_sigma_true_atom.truths_are_nd_necessary :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.ptBase), Classicism.Map.Arguments.nd_necessity_isolated_actual_world.truths_are_nd_necessary (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.ptBase)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.ptBase)) (Classicism.Meta.Intensional.SymIdeal.pt_actualWorldIsolated)⟩

/-- `symmetric-collapse-pair`: Relational Choice fails, by `symmetric-ideally-full`'s argument `relational-choice`. -/
theorem symmetric_collapse_pair.relational_choice_r : Statements.Models.symmetric_collapse_pair.relational_choice_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair), Classicism.Map.Arguments.symmetric_ideally_full.relational_choice.relational_choice_r (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair) (Classicism.Meta.Intensional.SymIdeal.collapsePair_transposable)⟩

/-- `symmetric-collapse-pair`: Axiom of Infinity (type e) holds, by `symmetric-ideally-full`'s argument `axiom-of-infinity-e`. -/
theorem symmetric_collapse_pair.axiom_of_infinity_e : Statements.Models.symmetric_collapse_pair.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair), Classicism.Map.Arguments.symmetric_ideally_full.axiom_of_infinity_e.axiom_of_infinity_e (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair) (Classicism.Meta.Intensional.SymIdeal.infinitelyManyIndividuals Classicism.Meta.Intensional.SymIdeal.collapsePair)⟩

/-- `symmetric-collapse-pair`: Axiom of Infinity (type t) holds, by `symmetric-ideally-full`'s argument `axiom-of-infinity-t`. -/
theorem symmetric_collapse_pair.axiom_of_infinity_t : Statements.Models.symmetric_collapse_pair.axiom_of_infinity_t :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair), Classicism.Map.Arguments.symmetric_ideally_full.axiom_of_infinity_t.axiom_of_infinity_t (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair) (Classicism.Meta.Intensional.SymIdeal.collapsePair_separable)⟩

/-- `symmetric-collapse-pair`: BF holds, by `symmetric-ideally-full`'s argument `barcan-surjective`. -/
theorem symmetric_collapse_pair.barcan_r : Statements.Models.symmetric_collapse_pair.barcan_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair), Classicism.Map.Arguments.symmetric_ideally_full.barcan_surjective.barcan_r (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair) (Classicism.Meta.Intensional.SymIdeal.collapsePair_surjectiveArrows) (fun _ _ h => h)⟩

/-- `symmetric-collapse-pair`: Actuality holds, by `symmetric-ideally-full`'s argument `actuality`. -/
theorem symmetric_collapse_pair.actuality : Statements.Models.symmetric_collapse_pair.actuality :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair), Classicism.Map.Arguments.symmetric_ideally_full.actuality.actuality (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair) (Classicism.Meta.Intensional.SymIdeal.collapsePair_symmetryGroupPinned)⟩

/-- `symmetric-collapse-pair`: Boolean Completeness holds, by `symmetric-ideally-full`'s argument `boolean-completeness`. -/
theorem symmetric_collapse_pair.boolean_completeness_r : Statements.Models.symmetric_collapse_pair.boolean_completeness_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair), Classicism.Map.Arguments.symmetric_ideally_full.boolean_completeness.boolean_completeness_r (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair) (Classicism.Meta.Intensional.SymIdeal.collapsePair_hullConditions)⟩

/-- `symmetric-collapse-pair`: Truths are ND-necessary holds, by the argument `nd-necessity-isolated-actual-world`. -/
theorem symmetric_collapse_pair.truths_are_nd_necessary : Statements.Models.symmetric_collapse_pair.truths_are_nd_necessary :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair), Classicism.Map.Arguments.nd_necessity_isolated_actual_world.truths_are_nd_necessary (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)) (Classicism.Meta.Intensional.SymIdeal.collapsePair_actualWorldIsolated)⟩

/-- `symmetric-collapse-pair`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem symmetric_collapse_pair.no_pure_contingency_r : Statements.Models.symmetric_collapse_pair.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair), Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)) (Classicism.Meta.Intensional.Premodel.oneObject_of_subsingleton _)⟩

/-- `symmetric-collapse-pair`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem symmetric_collapse_pair.independence_signature_r : Statements.Models.symmetric_collapse_pair.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)))⟩

/-- `symmetric-collapse-pair`: No Contingency (signature Σ) holds, by the argument `sigma-top-npc`. -/
theorem symmetric_collapse_pair.no_contingency_signature_r : Statements.Models.symmetric_collapse_pair.no_contingency_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)), Classicism.Map.Arguments.sigma_top_npc.no_contingency_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair))) (Classicism.Meta.Intensional.Premodel.holdsAx_interp_ofPure.2 ((Classicism.Map.Models.symmetric_collapse_pair.no_pure_contingency_r).2))⟩

/-- `symmetric-collapse-pair-sigma-true-atom`: Relational Choice fails, by `symmetric-ideally-full`'s argument `relational-choice`. -/
theorem symmetric_collapse_pair_sigma_true_atom.relational_choice_r : Statements.Models.symmetric_collapse_pair_sigma_true_atom.relational_choice_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair), Classicism.Map.Arguments.symmetric_ideally_full.relational_choice.relational_choice_r (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair) (Classicism.Meta.Intensional.SymIdeal.collapsePair_transposable)⟩

/-- `symmetric-collapse-pair-sigma-true-atom`: Axiom of Infinity (type e) holds, by `symmetric-ideally-full`'s argument `axiom-of-infinity-e`. -/
theorem symmetric_collapse_pair_sigma_true_atom.axiom_of_infinity_e : Statements.Models.symmetric_collapse_pair_sigma_true_atom.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair), Classicism.Map.Arguments.symmetric_ideally_full.axiom_of_infinity_e.axiom_of_infinity_e (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair) (Classicism.Meta.Intensional.SymIdeal.infinitelyManyIndividuals Classicism.Meta.Intensional.SymIdeal.collapsePair)⟩

/-- `symmetric-collapse-pair-sigma-true-atom`: Axiom of Infinity (type t) holds, by `symmetric-ideally-full`'s argument `axiom-of-infinity-t`. -/
theorem symmetric_collapse_pair_sigma_true_atom.axiom_of_infinity_t : Statements.Models.symmetric_collapse_pair_sigma_true_atom.axiom_of_infinity_t :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair), Classicism.Map.Arguments.symmetric_ideally_full.axiom_of_infinity_t.axiom_of_infinity_t (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair) (Classicism.Meta.Intensional.SymIdeal.collapsePair_separable)⟩

/-- `symmetric-collapse-pair-sigma-true-atom`: BF holds, by `symmetric-ideally-full`'s argument `barcan-surjective`. -/
theorem symmetric_collapse_pair_sigma_true_atom.barcan_r : Statements.Models.symmetric_collapse_pair_sigma_true_atom.barcan_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair), Classicism.Map.Arguments.symmetric_ideally_full.barcan_surjective.barcan_r (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair) (Classicism.Meta.Intensional.SymIdeal.collapsePair_surjectiveArrows) (fun _ _ h => h)⟩

/-- `symmetric-collapse-pair-sigma-true-atom`: Actuality holds, by `symmetric-ideally-full`'s argument `actuality`. -/
theorem symmetric_collapse_pair_sigma_true_atom.actuality : Statements.Models.symmetric_collapse_pair_sigma_true_atom.actuality :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair), Classicism.Map.Arguments.symmetric_ideally_full.actuality.actuality (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair) (Classicism.Meta.Intensional.SymIdeal.collapsePair_symmetryGroupPinned)⟩

/-- `symmetric-collapse-pair-sigma-true-atom`: Boolean Completeness holds, by `symmetric-ideally-full`'s argument `boolean-completeness`. -/
theorem symmetric_collapse_pair_sigma_true_atom.boolean_completeness_r : Statements.Models.symmetric_collapse_pair_sigma_true_atom.boolean_completeness_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair), Classicism.Map.Arguments.symmetric_ideally_full.boolean_completeness.boolean_completeness_r (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair) (Classicism.Meta.Intensional.SymIdeal.collapsePair_hullConditions)⟩

/-- `symmetric-collapse-pair-sigma-true-atom`: Truths are ND-necessary holds, by the argument `nd-necessity-isolated-actual-world`. -/
theorem symmetric_collapse_pair_sigma_true_atom.truths_are_nd_necessary : Statements.Models.symmetric_collapse_pair_sigma_true_atom.truths_are_nd_necessary :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair), Classicism.Map.Arguments.nd_necessity_isolated_actual_world.truths_are_nd_necessary (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)) (Classicism.Meta.Intensional.SymIdeal.collapsePair_actualWorldIsolated)⟩

/-- `symmetric-collapse-pair-sigma-true-atom`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem symmetric_collapse_pair_sigma_true_atom.no_pure_contingency_r : Statements.Models.symmetric_collapse_pair_sigma_true_atom.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair), Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)) (Classicism.Meta.Intensional.Premodel.oneObject_of_subsingleton _)⟩

/-- `symmetric-entrance-qualitative-links`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem symmetric_entrance_qualitative_links.independence_signature_r : Statements.Models.symmetric_entrance_qualitative_links.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.FixedPointEntrance.Qualitative.isModel), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.FixedPointEntrance.Qualitative.model) (Classicism.Meta.Intensional.FixedPointEntrance.Qualitative.isModel)) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.FixedPointEntrance.Qualitative.isModel)) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.FixedPointEntrance.Qualitative.isModel))⟩

/-- `symmetric-entrance-qualitative-links-sigma-true-atom`: Relational Choice holds, by its member's certificate, on the same model (`Classicism.Map.Models.symmetric_entrance_qualitative_links.relational_choice_r`). -/
theorem symmetric_entrance_qualitative_links_sigma_true_atom.relational_choice_r : Statements.Models.symmetric_entrance_qualitative_links_sigma_true_atom.relational_choice_r :=
  Classicism.Map.Models.symmetric_entrance_qualitative_links.relational_choice_r

/-- `symmetric-entrance-qualitative-links-sigma-true-atom`: BF (type t) fails, by its member's certificate, on the same model (`Classicism.Map.Models.symmetric_entrance_qualitative_links.barcan_t`). -/
theorem symmetric_entrance_qualitative_links_sigma_true_atom.barcan_t : Statements.Models.symmetric_entrance_qualitative_links_sigma_true_atom.barcan_t :=
  Classicism.Map.Models.symmetric_entrance_qualitative_links.barcan_t

/-- `symmetric-finite-compression-entrance`: Relational Choice fails, by `symmetric-ideally-full`'s argument `relational-choice`. -/
theorem symmetric_finite_compression_entrance.relational_choice_r : Statements.Models.symmetric_finite_compression_entrance.relational_choice_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.FiniteCompression.base Classicism.Meta.Intensional.FiniteCompression.A), Classicism.Map.Arguments.symmetric_ideally_full.relational_choice.relational_choice_r (Classicism.Meta.Intensional.FiniteCompression.base Classicism.Meta.Intensional.FiniteCompression.A) (Classicism.Meta.Intensional.FiniteCompression.transposable)⟩

/-- `symmetric-finite-compression-entrance`: Axiom of Infinity (type e) holds, by `symmetric-ideally-full`'s argument `axiom-of-infinity-e`. -/
theorem symmetric_finite_compression_entrance.axiom_of_infinity_e : Statements.Models.symmetric_finite_compression_entrance.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.FiniteCompression.base Classicism.Meta.Intensional.FiniteCompression.A), Classicism.Map.Arguments.symmetric_ideally_full.axiom_of_infinity_e.axiom_of_infinity_e (Classicism.Meta.Intensional.FiniteCompression.base Classicism.Meta.Intensional.FiniteCompression.A) (Classicism.Meta.Intensional.FiniteCompression.infinitelyManyIndividuals)⟩

/-- `symmetric-finite-compression-entrance`: Axiom of Infinity (type t) holds, by `symmetric-ideally-full`'s argument `axiom-of-infinity-t`. -/
theorem symmetric_finite_compression_entrance.axiom_of_infinity_t : Statements.Models.symmetric_finite_compression_entrance.axiom_of_infinity_t :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.FiniteCompression.base Classicism.Meta.Intensional.FiniteCompression.A), Classicism.Map.Arguments.symmetric_ideally_full.axiom_of_infinity_t.axiom_of_infinity_t (Classicism.Meta.Intensional.FiniteCompression.base Classicism.Meta.Intensional.FiniteCompression.A) (Classicism.Meta.Intensional.FiniteCompression.separable)⟩

/-- `symmetric-finite-compression-entrance`: Boolean Completeness holds, by `symmetric-ideally-full`'s argument `boolean-completeness`. -/
theorem symmetric_finite_compression_entrance.boolean_completeness_r : Statements.Models.symmetric_finite_compression_entrance.boolean_completeness_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.FiniteCompression.base Classicism.Meta.Intensional.FiniteCompression.A), Classicism.Map.Arguments.symmetric_ideally_full.boolean_completeness.boolean_completeness_r (Classicism.Meta.Intensional.FiniteCompression.base Classicism.Meta.Intensional.FiniteCompression.A) (Classicism.Meta.Intensional.FiniteCompression.hullConditions)⟩

/-- `symmetric-finite-compression-entrance`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem symmetric_finite_compression_entrance.independence_signature_r : Statements.Models.symmetric_finite_compression_entrance.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.FiniteCompression.base Classicism.Meta.Intensional.FiniteCompression.A)), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.FiniteCompression.base Classicism.Meta.Intensional.FiniteCompression.A)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.FiniteCompression.base Classicism.Meta.Intensional.FiniteCompression.A))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.FiniteCompression.base Classicism.Meta.Intensional.FiniteCompression.A))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.FiniteCompression.base Classicism.Meta.Intensional.FiniteCompression.A)))⟩

/-- `symmetric-infinite-classes`: Relational Choice fails, by `symmetric-ideally-full`'s argument `relational-choice`. -/
theorem symmetric_infinite_classes.relational_choice_r : Statements.Models.symmetric_infinite_classes.relational_choice_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses), Classicism.Map.Arguments.symmetric_ideally_full.relational_choice.relational_choice_r (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses) (Classicism.Meta.Intensional.SymIdeal.infClasses_transposable)⟩

/-- `symmetric-infinite-classes`: Axiom of Infinity (type e) holds, by `symmetric-ideally-full`'s argument `axiom-of-infinity-e`. -/
theorem symmetric_infinite_classes.axiom_of_infinity_e : Statements.Models.symmetric_infinite_classes.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses), Classicism.Map.Arguments.symmetric_ideally_full.axiom_of_infinity_e.axiom_of_infinity_e (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses) (Classicism.Meta.Intensional.SymIdeal.infinitelyManyIndividuals Classicism.Meta.Intensional.SymIdeal.infClasses)⟩

/-- `symmetric-infinite-classes`: BF holds, by `symmetric-ideally-full`'s argument `barcan-surjective`. -/
theorem symmetric_infinite_classes.barcan_r : Statements.Models.symmetric_infinite_classes.barcan_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses), Classicism.Map.Arguments.symmetric_ideally_full.barcan_surjective.barcan_r (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses) (Classicism.Meta.Intensional.SymIdeal.infClasses_surjectiveArrows) (fun _ _ h => h)⟩

/-- `symmetric-infinite-classes`: Boolean Completeness holds, by `symmetric-ideally-full`'s argument `boolean-completeness`. -/
theorem symmetric_infinite_classes.boolean_completeness_r : Statements.Models.symmetric_infinite_classes.boolean_completeness_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses), Classicism.Map.Arguments.symmetric_ideally_full.boolean_completeness.boolean_completeness_r (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses) (Classicism.Meta.Intensional.SymIdeal.infClasses_hullConditions)⟩

/-- `symmetric-infinite-classes`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem symmetric_infinite_classes.no_pure_contingency_r : Statements.Models.symmetric_infinite_classes.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses), Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses)) (Classicism.Meta.Intensional.Premodel.oneObject_of_subsingleton _)⟩

/-- `symmetric-infinite-classes`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem symmetric_infinite_classes.independence_signature_r : Statements.Models.symmetric_infinite_classes.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses)), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses)))⟩

/-- `symmetric-infinite-classes`: No Contingency (signature Σ) holds, by the argument `sigma-top-npc`. -/
theorem symmetric_infinite_classes.no_contingency_signature_r : Statements.Models.symmetric_infinite_classes.no_contingency_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses)), Classicism.Map.Arguments.sigma_top_npc.no_contingency_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.infClasses))) (Classicism.Meta.Intensional.Premodel.holdsAx_interp_ofPure.2 ((Classicism.Map.Models.symmetric_infinite_classes.no_pure_contingency_r).2))⟩

/-- `symmetric-old-new-individuals`: Relational Choice fails, by `symmetric-ideally-full`'s argument `relational-choice`. -/
theorem symmetric_old_new_individuals.relational_choice_r : Statements.Models.symmetric_old_new_individuals.relational_choice_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.OldNew.base), Classicism.Map.Arguments.symmetric_ideally_full.relational_choice.relational_choice_r (Classicism.Meta.Intensional.OldNew.base) (Classicism.Meta.Intensional.OldNew.transposable)⟩

/-- `symmetric-old-new-individuals`: Axiom of Infinity (type e) holds, by `symmetric-ideally-full`'s argument `axiom-of-infinity-e`. -/
theorem symmetric_old_new_individuals.axiom_of_infinity_e : Statements.Models.symmetric_old_new_individuals.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.OldNew.base), Classicism.Map.Arguments.symmetric_ideally_full.axiom_of_infinity_e.axiom_of_infinity_e (Classicism.Meta.Intensional.OldNew.base) (Classicism.Meta.Intensional.OldNew.infinitelyManyIndividuals)⟩

/-- `symmetric-old-new-individuals`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem symmetric_old_new_individuals.independence_signature_r : Statements.Models.symmetric_old_new_individuals.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.OldNew.base)), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.OldNew.base)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.OldNew.base))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.OldNew.base))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.OldNew.base)))⟩

/-- `symmetric-permutations-infinite-classes`: Relational Choice fails, by `symmetric-ideally-full`'s argument `relational-choice`. -/
theorem symmetric_permutations_infinite_classes.relational_choice_r : Statements.Models.symmetric_permutations_infinite_classes.relational_choice_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.permInfClasses), Classicism.Map.Arguments.symmetric_ideally_full.relational_choice.relational_choice_r (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.permInfClasses) (Classicism.Meta.Intensional.SymIdeal.permInfClasses_transposable)⟩

/-- `symmetric-permutations-infinite-classes`: Axiom of Infinity (type e) holds, by `symmetric-ideally-full`'s argument `axiom-of-infinity-e`. -/
theorem symmetric_permutations_infinite_classes.axiom_of_infinity_e : Statements.Models.symmetric_permutations_infinite_classes.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.permInfClasses), Classicism.Map.Arguments.symmetric_ideally_full.axiom_of_infinity_e.axiom_of_infinity_e (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.permInfClasses) (Classicism.Meta.Intensional.SymIdeal.infinitelyManyIndividuals Classicism.Meta.Intensional.SymIdeal.permInfClasses)⟩

/-- `symmetric-permutations-infinite-classes`: BF holds, by `symmetric-ideally-full`'s argument `barcan-surjective`. -/
theorem symmetric_permutations_infinite_classes.barcan_r : Statements.Models.symmetric_permutations_infinite_classes.barcan_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.permInfClasses), Classicism.Map.Arguments.symmetric_ideally_full.barcan_surjective.barcan_r (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.permInfClasses) (Classicism.Meta.Intensional.SymIdeal.permInfClasses_surjectiveArrows) (fun _ _ h => h)⟩

/-- `symmetric-permutations-infinite-classes`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem symmetric_permutations_infinite_classes.no_pure_contingency_r : Statements.Models.symmetric_permutations_infinite_classes.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.permInfClasses), Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.permInfClasses)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.permInfClasses)) (Classicism.Meta.Intensional.Premodel.oneObject_of_subsingleton _)⟩

/-- `symmetric-permutations-infinite-classes`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem symmetric_permutations_infinite_classes.independence_signature_r : Statements.Models.symmetric_permutations_infinite_classes.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.permInfClasses)), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.permInfClasses)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.permInfClasses))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.permInfClasses))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.permInfClasses)))⟩

/-- `symmetric-permutations-infinite-classes`: No Contingency (signature Σ) holds, by the argument `sigma-top-npc`. -/
theorem symmetric_permutations_infinite_classes.no_contingency_signature_r : Statements.Models.symmetric_permutations_infinite_classes.no_contingency_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.permInfClasses)), Classicism.Map.Arguments.sigma_top_npc.no_contingency_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.permInfClasses)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.permInfClasses))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.permInfClasses))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.permInfClasses))) (Classicism.Meta.Intensional.Premodel.holdsAx_interp_ofPure.2 ((Classicism.Map.Models.symmetric_permutations_infinite_classes.no_pure_contingency_r).2))⟩

/-- `symmetric-qualitative-contrast-at-w1`: Axiom of Infinity (type e) holds, by `symmetric-ideally-full`'s argument `axiom-of-infinity-e`. -/
theorem symmetric_qualitative_contrast_at_w1.axiom_of_infinity_e : Statements.Models.symmetric_qualitative_contrast_at_w1.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.contrastBaseW₁), Classicism.Map.Arguments.symmetric_ideally_full.axiom_of_infinity_e.axiom_of_infinity_e (Classicism.Meta.Intensional.SymIdeal.contrastBaseW₁) (Classicism.Meta.Intensional.SymIdeal.contrastW₁_infinitelyManyIndividuals)⟩

/-- `symmetric-qualitative-contrast-at-w1`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem symmetric_qualitative_contrast_at_w1.independence_signature_r : Statements.Models.symmetric_qualitative_contrast_at_w1.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.contrastBaseW₁)), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.contrastBaseW₁)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.contrastBaseW₁))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.contrastBaseW₁))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.contrastBaseW₁)))⟩

/-- `symmetric-qualitative-contrast`: Relational Choice fails, by `symmetric-ideally-full`'s argument `relational-choice`. -/
theorem symmetric_qualitative_contrast.relational_choice_r : Statements.Models.symmetric_qualitative_contrast.relational_choice_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.contrastBase), Classicism.Map.Arguments.symmetric_ideally_full.relational_choice.relational_choice_r (Classicism.Meta.Intensional.SymIdeal.contrastBase) (Classicism.Meta.Intensional.SymIdeal.contrast_transposable)⟩

/-- `symmetric-qualitative-contrast`: Axiom of Infinity (type e) holds, by `symmetric-ideally-full`'s argument `axiom-of-infinity-e`. -/
theorem symmetric_qualitative_contrast.axiom_of_infinity_e : Statements.Models.symmetric_qualitative_contrast.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.contrastBase), Classicism.Map.Arguments.symmetric_ideally_full.axiom_of_infinity_e.axiom_of_infinity_e (Classicism.Meta.Intensional.SymIdeal.contrastBase) (Classicism.Meta.Intensional.SymIdeal.contrast_infinitelyManyIndividuals)⟩

/-- `symmetric-qualitative-contrast`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem symmetric_qualitative_contrast.independence_signature_r : Statements.Models.symmetric_qualitative_contrast.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.contrastBase)), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.contrastBase)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.contrastBase))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.contrastBase))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.contrastBase)))⟩

/-- `symmetric-qualitative-contrast-sigma-true-atom`: Relational Choice fails, by `symmetric-ideally-full`'s argument `relational-choice`. -/
theorem symmetric_qualitative_contrast_sigma_true_atom.relational_choice_r : Statements.Models.symmetric_qualitative_contrast_sigma_true_atom.relational_choice_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.contrastBase), Classicism.Map.Arguments.symmetric_ideally_full.relational_choice.relational_choice_r (Classicism.Meta.Intensional.SymIdeal.contrastBase) (Classicism.Meta.Intensional.SymIdeal.contrast_transposable)⟩

/-- `symmetric-qualitative-contrast-sigma-true-atom`: Axiom of Infinity (type e) holds, by `symmetric-ideally-full`'s argument `axiom-of-infinity-e`. -/
theorem symmetric_qualitative_contrast_sigma_true_atom.axiom_of_infinity_e : Statements.Models.symmetric_qualitative_contrast_sigma_true_atom.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.contrastBase), Classicism.Map.Arguments.symmetric_ideally_full.axiom_of_infinity_e.axiom_of_infinity_e (Classicism.Meta.Intensional.SymIdeal.contrastBase) (Classicism.Meta.Intensional.SymIdeal.contrast_infinitelyManyIndividuals)⟩

/-- `symmetric-qualitative-links`: Relational Choice fails, by `symmetric-ideally-full`'s argument `relational-choice`. -/
theorem symmetric_qualitative_links.relational_choice_r : Statements.Models.symmetric_qualitative_links.relational_choice_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.QualitativeLinks.base), Classicism.Map.Arguments.symmetric_ideally_full.relational_choice.relational_choice_r (Classicism.Meta.Intensional.QualitativeLinks.base) (Classicism.Meta.Intensional.QualitativeLinks.transposable)⟩

/-- `symmetric-qualitative-links`: Axiom of Infinity (type e) holds, by `symmetric-ideally-full`'s argument `axiom-of-infinity-e`. -/
theorem symmetric_qualitative_links.axiom_of_infinity_e : Statements.Models.symmetric_qualitative_links.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.QualitativeLinks.base), Classicism.Map.Arguments.symmetric_ideally_full.axiom_of_infinity_e.axiom_of_infinity_e (Classicism.Meta.Intensional.QualitativeLinks.base) (Classicism.Meta.Intensional.QualitativeLinks.infinitelyManyIndividuals)⟩

/-- `symmetric-qualitative-links`: Axiom of Infinity (type t) holds, by `symmetric-ideally-full`'s argument `axiom-of-infinity-t`. -/
theorem symmetric_qualitative_links.axiom_of_infinity_t : Statements.Models.symmetric_qualitative_links.axiom_of_infinity_t :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.QualitativeLinks.base), Classicism.Map.Arguments.symmetric_ideally_full.axiom_of_infinity_t.axiom_of_infinity_t (Classicism.Meta.Intensional.QualitativeLinks.base) (Classicism.Meta.Intensional.QualitativeLinks.separable)⟩

/-- `symmetric-qualitative-links`: BF holds, by `symmetric-ideally-full`'s argument `barcan-surjective`. -/
theorem symmetric_qualitative_links.barcan_r : Statements.Models.symmetric_qualitative_links.barcan_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.QualitativeLinks.base), Classicism.Map.Arguments.symmetric_ideally_full.barcan_surjective.barcan_r (Classicism.Meta.Intensional.QualitativeLinks.base) (Classicism.Meta.Intensional.QualitativeLinks.surjectiveArrows) (fun _ _ h => h)⟩

/-- `symmetric-qualitative-links`: Actuality holds, by `symmetric-ideally-full`'s argument `actuality`. -/
theorem symmetric_qualitative_links.actuality : Statements.Models.symmetric_qualitative_links.actuality :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.QualitativeLinks.base), Classicism.Map.Arguments.symmetric_ideally_full.actuality.actuality (Classicism.Meta.Intensional.QualitativeLinks.base) (Classicism.Meta.Intensional.QualitativeLinks.symmetryGroupPinned)⟩

/-- `symmetric-qualitative-links`: Truths are ND-necessary holds, by the argument `nd-necessity-isolated-actual-world`. -/
theorem symmetric_qualitative_links.truths_are_nd_necessary : Statements.Models.symmetric_qualitative_links.truths_are_nd_necessary :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.QualitativeLinks.base), Classicism.Map.Arguments.nd_necessity_isolated_actual_world.truths_are_nd_necessary (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.QualitativeLinks.base)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.QualitativeLinks.base)) (Classicism.Meta.Intensional.QualitativeLinks.actualWorldIsolated)⟩

/-- `symmetric-qualitative-links`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem symmetric_qualitative_links.no_pure_contingency_r : Statements.Models.symmetric_qualitative_links.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.QualitativeLinks.base), Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.QualitativeLinks.base)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.QualitativeLinks.base)) (Classicism.Meta.Intensional.QualitativeLinks.oneObject)⟩

/-- `symmetric-qualitative-links`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem symmetric_qualitative_links.independence_signature_r : Statements.Models.symmetric_qualitative_links.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.QualitativeLinks.base)), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.QualitativeLinks.base)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.QualitativeLinks.base))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.QualitativeLinks.base))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.QualitativeLinks.base)))⟩

/-- `symmetric-qualitative-links`: No Contingency (signature Σ) holds, by the argument `sigma-top-npc`. -/
theorem symmetric_qualitative_links.no_contingency_signature_r : Statements.Models.symmetric_qualitative_links.no_contingency_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.QualitativeLinks.base)), Classicism.Map.Arguments.sigma_top_npc.no_contingency_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.QualitativeLinks.base)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.QualitativeLinks.base))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.QualitativeLinks.base))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.QualitativeLinks.base))) (Classicism.Meta.Intensional.Premodel.holdsAx_interp_ofPure.2 ((Classicism.Map.Models.symmetric_qualitative_links.no_pure_contingency_r).2))⟩

/-- `symmetric-qualitative-links-sigma-true-atom`: Relational Choice fails, by `symmetric-ideally-full`'s argument `relational-choice`. -/
theorem symmetric_qualitative_links_sigma_true_atom.relational_choice_r : Statements.Models.symmetric_qualitative_links_sigma_true_atom.relational_choice_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.QualitativeLinks.base), Classicism.Map.Arguments.symmetric_ideally_full.relational_choice.relational_choice_r (Classicism.Meta.Intensional.QualitativeLinks.base) (Classicism.Meta.Intensional.QualitativeLinks.transposable)⟩

/-- `symmetric-qualitative-links-sigma-true-atom`: Axiom of Infinity (type e) holds, by `symmetric-ideally-full`'s argument `axiom-of-infinity-e`. -/
theorem symmetric_qualitative_links_sigma_true_atom.axiom_of_infinity_e : Statements.Models.symmetric_qualitative_links_sigma_true_atom.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.QualitativeLinks.base), Classicism.Map.Arguments.symmetric_ideally_full.axiom_of_infinity_e.axiom_of_infinity_e (Classicism.Meta.Intensional.QualitativeLinks.base) (Classicism.Meta.Intensional.QualitativeLinks.infinitelyManyIndividuals)⟩

/-- `symmetric-qualitative-links-sigma-true-atom`: Axiom of Infinity (type t) holds, by `symmetric-ideally-full`'s argument `axiom-of-infinity-t`. -/
theorem symmetric_qualitative_links_sigma_true_atom.axiom_of_infinity_t : Statements.Models.symmetric_qualitative_links_sigma_true_atom.axiom_of_infinity_t :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.QualitativeLinks.base), Classicism.Map.Arguments.symmetric_ideally_full.axiom_of_infinity_t.axiom_of_infinity_t (Classicism.Meta.Intensional.QualitativeLinks.base) (Classicism.Meta.Intensional.QualitativeLinks.separable)⟩

/-- `symmetric-qualitative-links-sigma-true-atom`: BF holds, by `symmetric-ideally-full`'s argument `barcan-surjective`. -/
theorem symmetric_qualitative_links_sigma_true_atom.barcan_r : Statements.Models.symmetric_qualitative_links_sigma_true_atom.barcan_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.QualitativeLinks.base), Classicism.Map.Arguments.symmetric_ideally_full.barcan_surjective.barcan_r (Classicism.Meta.Intensional.QualitativeLinks.base) (Classicism.Meta.Intensional.QualitativeLinks.surjectiveArrows) (fun _ _ h => h)⟩

/-- `symmetric-qualitative-links-sigma-true-atom`: Actuality holds, by `symmetric-ideally-full`'s argument `actuality`. -/
theorem symmetric_qualitative_links_sigma_true_atom.actuality : Statements.Models.symmetric_qualitative_links_sigma_true_atom.actuality :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.QualitativeLinks.base), Classicism.Map.Arguments.symmetric_ideally_full.actuality.actuality (Classicism.Meta.Intensional.QualitativeLinks.base) (Classicism.Meta.Intensional.QualitativeLinks.symmetryGroupPinned)⟩

/-- `symmetric-qualitative-links-sigma-true-atom`: Truths are ND-necessary holds, by the argument `nd-necessity-isolated-actual-world`. -/
theorem symmetric_qualitative_links_sigma_true_atom.truths_are_nd_necessary : Statements.Models.symmetric_qualitative_links_sigma_true_atom.truths_are_nd_necessary :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.QualitativeLinks.base), Classicism.Map.Arguments.nd_necessity_isolated_actual_world.truths_are_nd_necessary (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.QualitativeLinks.base)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.QualitativeLinks.base)) (Classicism.Meta.Intensional.QualitativeLinks.actualWorldIsolated)⟩

/-- `symmetric-qualitative-links-sigma-true-atom`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem symmetric_qualitative_links_sigma_true_atom.no_pure_contingency_r : Statements.Models.symmetric_qualitative_links_sigma_true_atom.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.QualitativeLinks.base), Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.QualitativeLinks.base)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.QualitativeLinks.base)) (Classicism.Meta.Intensional.QualitativeLinks.oneObject)⟩

/-- `symmetric-range-gap-without-actuality`: Relational Choice fails, by `symmetric-ideally-full`'s argument `relational-choice`. -/
theorem symmetric_range_gap_without_actuality.relational_choice_r : Statements.Models.symmetric_range_gap_without_actuality.relational_choice_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct), Classicism.Map.Arguments.symmetric_ideally_full.relational_choice.relational_choice_r (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct) (Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct_transposable)⟩

/-- `symmetric-range-gap-without-actuality`: Axiom of Infinity (type e) holds, by `symmetric-ideally-full`'s argument `axiom-of-infinity-e`. -/
theorem symmetric_range_gap_without_actuality.axiom_of_infinity_e : Statements.Models.symmetric_range_gap_without_actuality.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct), Classicism.Map.Arguments.symmetric_ideally_full.axiom_of_infinity_e.axiom_of_infinity_e (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct) (Classicism.Meta.Intensional.SymIdeal.infinitelyManyIndividuals Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct)⟩

/-- `symmetric-range-gap-without-actuality`: BF fails, by `symmetric-ideally-full`'s argument `barcan-fixes-or-omits`. -/
theorem symmetric_range_gap_without_actuality.barcan_r : Statements.Models.symmetric_range_gap_without_actuality.barcan_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct), Classicism.Map.Arguments.symmetric_ideally_full.barcan_fixes_or_omits.barcan_r (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct) (Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct_fixesOrOmits)⟩

/-- `symmetric-range-gap-without-actuality`: Boolean Completeness holds, by `symmetric-ideally-full`'s argument `boolean-completeness`. -/
theorem symmetric_range_gap_without_actuality.boolean_completeness_r : Statements.Models.symmetric_range_gap_without_actuality.boolean_completeness_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct), Classicism.Map.Arguments.symmetric_ideally_full.boolean_completeness.boolean_completeness_r (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct) (Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct_hullConditions)⟩

/-- `symmetric-range-gap-without-actuality`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem symmetric_range_gap_without_actuality.no_pure_contingency_r : Statements.Models.symmetric_range_gap_without_actuality.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct), Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct)) (Classicism.Meta.Intensional.Premodel.oneObject_of_subsingleton _)⟩

/-- `symmetric-range-gap-without-actuality`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem symmetric_range_gap_without_actuality.independence_signature_r : Statements.Models.symmetric_range_gap_without_actuality.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct)), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct)))⟩

/-- `symmetric-range-gap-without-actuality`: No Contingency (signature Σ) holds, by the argument `sigma-top-npc`. -/
theorem symmetric_range_gap_without_actuality.no_contingency_signature_r : Statements.Models.symmetric_range_gap_without_actuality.no_contingency_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct)), Classicism.Map.Arguments.sigma_top_npc.no_contingency_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGapNoAct))) (Classicism.Meta.Intensional.Premodel.holdsAx_interp_ofPure.2 ((Classicism.Map.Models.symmetric_range_gap_without_actuality.no_pure_contingency_r).2))⟩

/-- `symmetric-range-gap`: Relational Choice fails, by `symmetric-ideally-full`'s argument `relational-choice`. -/
theorem symmetric_range_gap.relational_choice_r : Statements.Models.symmetric_range_gap.relational_choice_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap), Classicism.Map.Arguments.symmetric_ideally_full.relational_choice.relational_choice_r (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap) (Classicism.Meta.Intensional.SymIdeal.rangeGap_transposable)⟩

/-- `symmetric-range-gap`: Axiom of Infinity (type e) holds, by `symmetric-ideally-full`'s argument `axiom-of-infinity-e`. -/
theorem symmetric_range_gap.axiom_of_infinity_e : Statements.Models.symmetric_range_gap.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap), Classicism.Map.Arguments.symmetric_ideally_full.axiom_of_infinity_e.axiom_of_infinity_e (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap) (Classicism.Meta.Intensional.SymIdeal.infinitelyManyIndividuals Classicism.Meta.Intensional.SymIdeal.rangeGap)⟩

/-- `symmetric-range-gap`: Axiom of Infinity (type t) holds, by `symmetric-ideally-full`'s argument `axiom-of-infinity-t`. -/
theorem symmetric_range_gap.axiom_of_infinity_t : Statements.Models.symmetric_range_gap.axiom_of_infinity_t :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap), Classicism.Map.Arguments.symmetric_ideally_full.axiom_of_infinity_t.axiom_of_infinity_t (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap) (Classicism.Meta.Intensional.SymIdeal.rangeGap_separable)⟩

/-- `symmetric-range-gap`: Actuality holds, by `symmetric-ideally-full`'s argument `actuality`. -/
theorem symmetric_range_gap.actuality : Statements.Models.symmetric_range_gap.actuality :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap), Classicism.Map.Arguments.symmetric_ideally_full.actuality.actuality (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap) (Classicism.Meta.Intensional.SymIdeal.rangeGap_symmetryGroupPinned)⟩

/-- `symmetric-range-gap`: BF fails, by `symmetric-ideally-full`'s argument `barcan-fixes-or-omits`. -/
theorem symmetric_range_gap.barcan_r : Statements.Models.symmetric_range_gap.barcan_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap), Classicism.Map.Arguments.symmetric_ideally_full.barcan_fixes_or_omits.barcan_r (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap) (Classicism.Meta.Intensional.SymIdeal.rangeGap_fixesOrOmits)⟩

/-- `symmetric-range-gap`: Boolean Completeness holds, by `symmetric-ideally-full`'s argument `boolean-completeness`. -/
theorem symmetric_range_gap.boolean_completeness_r : Statements.Models.symmetric_range_gap.boolean_completeness_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap), Classicism.Map.Arguments.symmetric_ideally_full.boolean_completeness.boolean_completeness_r (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap) (Classicism.Meta.Intensional.SymIdeal.rangeGap_hullConditions)⟩

/-- `symmetric-range-gap`: Truths are ND-necessary holds, by the argument `nd-necessity-isolated-actual-world`. -/
theorem symmetric_range_gap.truths_are_nd_necessary : Statements.Models.symmetric_range_gap.truths_are_nd_necessary :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap), Classicism.Map.Arguments.nd_necessity_isolated_actual_world.truths_are_nd_necessary (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)) (Classicism.Meta.Intensional.SymIdeal.rangeGap_actualWorldIsolated)⟩

/-- `symmetric-range-gap`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem symmetric_range_gap.no_pure_contingency_r : Statements.Models.symmetric_range_gap.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap), Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)) (Classicism.Meta.Intensional.Premodel.oneObject_of_subsingleton _)⟩

/-- `symmetric-range-gap`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem symmetric_range_gap.independence_signature_r : Statements.Models.symmetric_range_gap.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)))⟩

/-- `symmetric-range-gap`: No Contingency (signature Σ) holds, by the argument `sigma-top-npc`. -/
theorem symmetric_range_gap.no_contingency_signature_r : Statements.Models.symmetric_range_gap.no_contingency_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)), Classicism.Map.Arguments.sigma_top_npc.no_contingency_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap))) (Classicism.Meta.Intensional.Premodel.holdsAx_interp_ofPure.2 ((Classicism.Map.Models.symmetric_range_gap.no_pure_contingency_r).2))⟩

/-- `symmetric-range-gap-sigma-true-atom`: Relational Choice fails, by `symmetric-ideally-full`'s argument `relational-choice`. -/
theorem symmetric_range_gap_sigma_true_atom.relational_choice_r : Statements.Models.symmetric_range_gap_sigma_true_atom.relational_choice_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap), Classicism.Map.Arguments.symmetric_ideally_full.relational_choice.relational_choice_r (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap) (Classicism.Meta.Intensional.SymIdeal.rangeGap_transposable)⟩

/-- `symmetric-range-gap-sigma-true-atom`: Axiom of Infinity (type e) holds, by `symmetric-ideally-full`'s argument `axiom-of-infinity-e`. -/
theorem symmetric_range_gap_sigma_true_atom.axiom_of_infinity_e : Statements.Models.symmetric_range_gap_sigma_true_atom.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap), Classicism.Map.Arguments.symmetric_ideally_full.axiom_of_infinity_e.axiom_of_infinity_e (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap) (Classicism.Meta.Intensional.SymIdeal.infinitelyManyIndividuals Classicism.Meta.Intensional.SymIdeal.rangeGap)⟩

/-- `symmetric-range-gap-sigma-true-atom`: Axiom of Infinity (type t) holds, by `symmetric-ideally-full`'s argument `axiom-of-infinity-t`. -/
theorem symmetric_range_gap_sigma_true_atom.axiom_of_infinity_t : Statements.Models.symmetric_range_gap_sigma_true_atom.axiom_of_infinity_t :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap), Classicism.Map.Arguments.symmetric_ideally_full.axiom_of_infinity_t.axiom_of_infinity_t (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap) (Classicism.Meta.Intensional.SymIdeal.rangeGap_separable)⟩

/-- `symmetric-range-gap-sigma-true-atom`: Actuality holds, by `symmetric-ideally-full`'s argument `actuality`. -/
theorem symmetric_range_gap_sigma_true_atom.actuality : Statements.Models.symmetric_range_gap_sigma_true_atom.actuality :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap), Classicism.Map.Arguments.symmetric_ideally_full.actuality.actuality (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap) (Classicism.Meta.Intensional.SymIdeal.rangeGap_symmetryGroupPinned)⟩

/-- `symmetric-range-gap-sigma-true-atom`: BF fails, by `symmetric-ideally-full`'s argument `barcan-fixes-or-omits`. -/
theorem symmetric_range_gap_sigma_true_atom.barcan_r : Statements.Models.symmetric_range_gap_sigma_true_atom.barcan_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap), Classicism.Map.Arguments.symmetric_ideally_full.barcan_fixes_or_omits.barcan_r (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap) (Classicism.Meta.Intensional.SymIdeal.rangeGap_fixesOrOmits)⟩

/-- `symmetric-range-gap-sigma-true-atom`: Boolean Completeness holds, by `symmetric-ideally-full`'s argument `boolean-completeness`. -/
theorem symmetric_range_gap_sigma_true_atom.boolean_completeness_r : Statements.Models.symmetric_range_gap_sigma_true_atom.boolean_completeness_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap), Classicism.Map.Arguments.symmetric_ideally_full.boolean_completeness.boolean_completeness_r (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap) (Classicism.Meta.Intensional.SymIdeal.rangeGap_hullConditions)⟩

/-- `symmetric-range-gap-sigma-true-atom`: Truths are ND-necessary holds, by the argument `nd-necessity-isolated-actual-world`. -/
theorem symmetric_range_gap_sigma_true_atom.truths_are_nd_necessary : Statements.Models.symmetric_range_gap_sigma_true_atom.truths_are_nd_necessary :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap), Classicism.Map.Arguments.nd_necessity_isolated_actual_world.truths_are_nd_necessary (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)) (Classicism.Meta.Intensional.SymIdeal.rangeGap_actualWorldIsolated)⟩

/-- `symmetric-range-gap-sigma-true-atom`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem symmetric_range_gap_sigma_true_atom.no_pure_contingency_r : Statements.Models.symmetric_range_gap_sigma_true_atom.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap), Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)) (Classicism.Meta.Intensional.Premodel.oneObject_of_subsingleton _)⟩

/-- `symmetric-recurrent-colours`: Relational Choice fails, by `symmetric-ideally-full`'s argument `relational-choice`. -/
theorem symmetric_recurrent_colours.relational_choice_r : Statements.Models.symmetric_recurrent_colours.relational_choice_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.colourBase), Classicism.Map.Arguments.symmetric_ideally_full.relational_choice.relational_choice_r (Classicism.Meta.Intensional.SymIdeal.colourBase) (Classicism.Meta.Intensional.SymIdeal.colour_transposable)⟩

/-- `symmetric-recurrent-colours`: Axiom of Infinity (type e) holds, by `symmetric-ideally-full`'s argument `axiom-of-infinity-e`. -/
theorem symmetric_recurrent_colours.axiom_of_infinity_e : Statements.Models.symmetric_recurrent_colours.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.colourBase), Classicism.Map.Arguments.symmetric_ideally_full.axiom_of_infinity_e.axiom_of_infinity_e (Classicism.Meta.Intensional.SymIdeal.colourBase) (Classicism.Meta.Intensional.SymIdeal.colour_infinitelyManyIndividuals)⟩

/-- `symmetric-recurrent-colours`: Axiom of Infinity (type t) holds, by `symmetric-ideally-full`'s argument `axiom-of-infinity-t`. -/
theorem symmetric_recurrent_colours.axiom_of_infinity_t : Statements.Models.symmetric_recurrent_colours.axiom_of_infinity_t :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.colourBase), Classicism.Map.Arguments.symmetric_ideally_full.axiom_of_infinity_t.axiom_of_infinity_t (Classicism.Meta.Intensional.SymIdeal.colourBase) (Classicism.Meta.Intensional.SymIdeal.colour_separable)⟩

/-- `symmetric-recurrent-colours`: BF holds, by `symmetric-ideally-full`'s argument `barcan-surjective`. -/
theorem symmetric_recurrent_colours.barcan_r : Statements.Models.symmetric_recurrent_colours.barcan_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.colourBase), Classicism.Map.Arguments.symmetric_ideally_full.barcan_surjective.barcan_r (Classicism.Meta.Intensional.SymIdeal.colourBase) (Classicism.Meta.Intensional.SymIdeal.colour_surjectiveArrows) (fun _ _ h => h)⟩

/-- `symmetric-recurrent-colours`: Boolean Completeness holds, by `symmetric-ideally-full`'s argument `boolean-completeness`. -/
theorem symmetric_recurrent_colours.boolean_completeness_r : Statements.Models.symmetric_recurrent_colours.boolean_completeness_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.colourBase), Classicism.Map.Arguments.symmetric_ideally_full.boolean_completeness.boolean_completeness_r (Classicism.Meta.Intensional.SymIdeal.colourBase) (Classicism.Meta.Intensional.SymIdeal.colour_hullConditions)⟩

/-- `symmetric-recurrent-colours`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem symmetric_recurrent_colours.independence_signature_r : Statements.Models.symmetric_recurrent_colours.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.colourBase)), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.colourBase)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.colourBase))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.colourBase))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.colourBase)))⟩

/-- `symmetric-two-object-all-maps`: Relational Choice fails, by `symmetric-ideally-full`'s argument `relational-choice`. -/
theorem symmetric_two_object_all_maps.relational_choice_r : Statements.Models.symmetric_two_object_all_maps.relational_choice_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.allMapsBase), Classicism.Map.Arguments.symmetric_ideally_full.relational_choice.relational_choice_r (Classicism.Meta.Intensional.SymIdeal.allMapsBase) (Classicism.Meta.Intensional.SymIdeal.allMaps_transposable)⟩

/-- `symmetric-two-object-all-maps`: Axiom of Infinity (type e) holds, by `symmetric-ideally-full`'s argument `axiom-of-infinity-e`. -/
theorem symmetric_two_object_all_maps.axiom_of_infinity_e : Statements.Models.symmetric_two_object_all_maps.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.allMapsBase), Classicism.Map.Arguments.symmetric_ideally_full.axiom_of_infinity_e.axiom_of_infinity_e (Classicism.Meta.Intensional.SymIdeal.allMapsBase) (Classicism.Meta.Intensional.SymIdeal.allMaps_infinitelyManyIndividuals)⟩

/-- `symmetric-two-object-all-maps`: Axiom of Infinity (type t) holds, by `symmetric-ideally-full`'s argument `axiom-of-infinity-t`. -/
theorem symmetric_two_object_all_maps.axiom_of_infinity_t : Statements.Models.symmetric_two_object_all_maps.axiom_of_infinity_t :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.allMapsBase), Classicism.Map.Arguments.symmetric_ideally_full.axiom_of_infinity_t.axiom_of_infinity_t (Classicism.Meta.Intensional.SymIdeal.allMapsBase) (Classicism.Meta.Intensional.SymIdeal.allMaps_separable)⟩

/-- `symmetric-two-object-all-maps`: Boolean Completeness holds, by `symmetric-ideally-full`'s argument `boolean-completeness`. -/
theorem symmetric_two_object_all_maps.boolean_completeness_r : Statements.Models.symmetric_two_object_all_maps.boolean_completeness_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.allMapsBase), Classicism.Map.Arguments.symmetric_ideally_full.boolean_completeness.boolean_completeness_r (Classicism.Meta.Intensional.SymIdeal.allMapsBase) (Classicism.Meta.Intensional.SymIdeal.allMaps_hullConditions)⟩

/-- `symmetric-two-object-all-maps`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem symmetric_two_object_all_maps.independence_signature_r : Statements.Models.symmetric_two_object_all_maps.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.allMapsBase)), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.allMapsBase)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.allMapsBase))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.allMapsBase))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.allMapsBase)))⟩

/-- `symmetric-two-object-unpinned`: Relational Choice fails, by `symmetric-ideally-full`'s argument `relational-choice`. -/
theorem symmetric_two_object_unpinned.relational_choice_r : Statements.Models.symmetric_two_object_unpinned.relational_choice_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.twoBase), Classicism.Map.Arguments.symmetric_ideally_full.relational_choice.relational_choice_r (Classicism.Meta.Intensional.SymIdeal.twoBase) (Classicism.Meta.Intensional.SymIdeal.two_transposable)⟩

/-- `symmetric-two-object-unpinned`: Axiom of Infinity (type e) holds, by `symmetric-ideally-full`'s argument `axiom-of-infinity-e`. -/
theorem symmetric_two_object_unpinned.axiom_of_infinity_e : Statements.Models.symmetric_two_object_unpinned.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.twoBase), Classicism.Map.Arguments.symmetric_ideally_full.axiom_of_infinity_e.axiom_of_infinity_e (Classicism.Meta.Intensional.SymIdeal.twoBase) (Classicism.Meta.Intensional.SymIdeal.two_infinitelyManyIndividuals)⟩

/-- `symmetric-two-object-unpinned`: Axiom of Infinity (type t) holds, by `symmetric-ideally-full`'s argument `axiom-of-infinity-t`. -/
theorem symmetric_two_object_unpinned.axiom_of_infinity_t : Statements.Models.symmetric_two_object_unpinned.axiom_of_infinity_t :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.twoBase), Classicism.Map.Arguments.symmetric_ideally_full.axiom_of_infinity_t.axiom_of_infinity_t (Classicism.Meta.Intensional.SymIdeal.twoBase) (Classicism.Meta.Intensional.SymIdeal.two_separable)⟩

/-- `symmetric-two-object-unpinned`: Boolean Completeness holds, by `symmetric-ideally-full`'s argument `boolean-completeness`. -/
theorem symmetric_two_object_unpinned.boolean_completeness_r : Statements.Models.symmetric_two_object_unpinned.boolean_completeness_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.twoBase), Classicism.Map.Arguments.symmetric_ideally_full.boolean_completeness.boolean_completeness_r (Classicism.Meta.Intensional.SymIdeal.twoBase) (Classicism.Meta.Intensional.SymIdeal.two_hullConditions)⟩

/-- `symmetric-two-object-unpinned`: Truths are ND-necessary holds, by the argument `nd-necessity-isolated-actual-world`. -/
theorem symmetric_two_object_unpinned.truths_are_nd_necessary : Statements.Models.symmetric_two_object_unpinned.truths_are_nd_necessary :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.twoBase), Classicism.Map.Arguments.nd_necessity_isolated_actual_world.truths_are_nd_necessary (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.twoBase)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.twoBase)) (Classicism.Meta.Intensional.SymIdeal.two_actualWorldIsolated)⟩

/-- `symmetric-two-object-unpinned`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem symmetric_two_object_unpinned.independence_signature_r : Statements.Models.symmetric_two_object_unpinned.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.twoBase)), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.twoBase)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.twoBase))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.twoBase))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.twoBase)))⟩

/-- `symmetric-two-object-unpinned-sigma-true-atom`: □Boolean Completeness holds, by its member's certificate, on the same model (`Classicism.Map.Models.symmetric_two_object_unpinned.necessary_boolean_completeness_r`). -/
theorem symmetric_two_object_unpinned_sigma_true_atom.necessary_boolean_completeness_r : Statements.Models.symmetric_two_object_unpinned_sigma_true_atom.necessary_boolean_completeness_r :=
  Classicism.Map.Models.symmetric_two_object_unpinned.necessary_boolean_completeness_r

/-- `symmetric-two-object-unpinned-sigma-true-atom`: Relational Choice fails, by `symmetric-ideally-full`'s argument `relational-choice`. -/
theorem symmetric_two_object_unpinned_sigma_true_atom.relational_choice_r : Statements.Models.symmetric_two_object_unpinned_sigma_true_atom.relational_choice_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.twoBase), Classicism.Map.Arguments.symmetric_ideally_full.relational_choice.relational_choice_r (Classicism.Meta.Intensional.SymIdeal.twoBase) (Classicism.Meta.Intensional.SymIdeal.two_transposable)⟩

/-- `symmetric-two-object-unpinned-sigma-true-atom`: Axiom of Infinity (type e) holds, by `symmetric-ideally-full`'s argument `axiom-of-infinity-e`. -/
theorem symmetric_two_object_unpinned_sigma_true_atom.axiom_of_infinity_e : Statements.Models.symmetric_two_object_unpinned_sigma_true_atom.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.twoBase), Classicism.Map.Arguments.symmetric_ideally_full.axiom_of_infinity_e.axiom_of_infinity_e (Classicism.Meta.Intensional.SymIdeal.twoBase) (Classicism.Meta.Intensional.SymIdeal.two_infinitelyManyIndividuals)⟩

/-- `symmetric-two-object-unpinned-sigma-true-atom`: Axiom of Infinity (type t) holds, by `symmetric-ideally-full`'s argument `axiom-of-infinity-t`. -/
theorem symmetric_two_object_unpinned_sigma_true_atom.axiom_of_infinity_t : Statements.Models.symmetric_two_object_unpinned_sigma_true_atom.axiom_of_infinity_t :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.twoBase), Classicism.Map.Arguments.symmetric_ideally_full.axiom_of_infinity_t.axiom_of_infinity_t (Classicism.Meta.Intensional.SymIdeal.twoBase) (Classicism.Meta.Intensional.SymIdeal.two_separable)⟩

/-- `symmetric-two-object-unpinned-sigma-true-atom`: Boolean Completeness holds, by `symmetric-ideally-full`'s argument `boolean-completeness`. -/
theorem symmetric_two_object_unpinned_sigma_true_atom.boolean_completeness_r : Statements.Models.symmetric_two_object_unpinned_sigma_true_atom.boolean_completeness_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.twoBase), Classicism.Map.Arguments.symmetric_ideally_full.boolean_completeness.boolean_completeness_r (Classicism.Meta.Intensional.SymIdeal.twoBase) (Classicism.Meta.Intensional.SymIdeal.two_hullConditions)⟩

/-- `symmetric-two-object-unpinned-sigma-true-atom`: Truths are ND-necessary holds, by the argument `nd-necessity-isolated-actual-world`. -/
theorem symmetric_two_object_unpinned_sigma_true_atom.truths_are_nd_necessary : Statements.Models.symmetric_two_object_unpinned_sigma_true_atom.truths_are_nd_necessary :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.twoBase), Classicism.Map.Arguments.nd_necessity_isolated_actual_world.truths_are_nd_necessary (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.twoBase)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.twoBase)) (Classicism.Meta.Intensional.SymIdeal.two_actualWorldIsolated)⟩

/-- `symmetry-constrained-full-all-maps`: Truths are ND-necessary holds, by the argument `nd-necessity-isolated-actual-world`. -/
theorem symmetry_constrained_full_all_maps.truths_are_nd_necessary : Statements.Models.symmetry_constrained_full_all_maps.truths_are_nd_necessary :=
  ⟨Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.allMaps, Classicism.Map.Arguments.nd_necessity_isolated_actual_world.truths_are_nd_necessary (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.allMaps) (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.allMaps) (Classicism.Meta.Intensional.SymFull.actualWorldIsolated (M := Classicism.Meta.Intensional.SymFull.allMaps))⟩

/-- `symmetry-constrained-full-all-maps`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem symmetry_constrained_full_all_maps.no_pure_contingency_r : Statements.Models.symmetry_constrained_full_all_maps.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.allMaps, Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.allMaps) (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.allMaps) (Classicism.Meta.Intensional.Premodel.oneObject_of_subsingleton _)⟩

/-- `symmetry-constrained-full-all-maps`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem symmetry_constrained_full_all_maps.transversal_choice_r : Statements.Models.symmetry_constrained_full_all_maps.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.allMaps, Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.allMaps) (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.allMaps) (Classicism.Meta.Intensional.SymFull.extFull (M := Classicism.Meta.Intensional.SymFull.allMaps))⟩

/-- `symmetry-constrained-full-all-maps`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem symmetry_constrained_full_all_maps.independence_signature_r : Statements.Models.symmetry_constrained_full_all_maps.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.allMaps), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.allMaps) (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.allMaps)) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.allMaps)) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.allMaps))⟩

/-- `symmetry-constrained-full-all-maps`: No Contingency (signature Σ) holds, by the argument `sigma-top-npc`. -/
theorem symmetry_constrained_full_all_maps.no_contingency_signature_r : Statements.Models.symmetry_constrained_full_all_maps.no_contingency_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.allMaps), Classicism.Map.Arguments.sigma_top_npc.no_contingency_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.allMaps) (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.allMaps)) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.allMaps)) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.allMaps)) (Classicism.Meta.Intensional.Premodel.holdsAx_interp_ofPure.2 ((Classicism.Map.Models.symmetry_constrained_full_all_maps.no_pure_contingency_r).2))⟩

/-- `symmetry-constrained-full-all-maps-sigma-true-atom`: Truths are ND-necessary holds, by the argument `nd-necessity-isolated-actual-world`. -/
theorem symmetry_constrained_full_all_maps_sigma_true_atom.truths_are_nd_necessary : Statements.Models.symmetry_constrained_full_all_maps_sigma_true_atom.truths_are_nd_necessary :=
  ⟨Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.allMaps, Classicism.Map.Arguments.nd_necessity_isolated_actual_world.truths_are_nd_necessary (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.allMaps) (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.allMaps) (Classicism.Meta.Intensional.SymFull.actualWorldIsolated (M := Classicism.Meta.Intensional.SymFull.allMaps))⟩

/-- `symmetry-constrained-full-all-maps-sigma-true-atom`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem symmetry_constrained_full_all_maps_sigma_true_atom.no_pure_contingency_r : Statements.Models.symmetry_constrained_full_all_maps_sigma_true_atom.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.allMaps, Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.allMaps) (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.allMaps) (Classicism.Meta.Intensional.Premodel.oneObject_of_subsingleton _)⟩

/-- `symmetry-constrained-full-all-maps-sigma-true-atom`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem symmetry_constrained_full_all_maps_sigma_true_atom.transversal_choice_r : Statements.Models.symmetry_constrained_full_all_maps_sigma_true_atom.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.allMaps, Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.allMaps) (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.allMaps) (Classicism.Meta.Intensional.SymFull.extFull (M := Classicism.Meta.Intensional.SymFull.allMaps))⟩

/-- `symmetry-constrained-full-collapse`: Truths are ND-necessary holds, by the argument `nd-necessity-isolated-actual-world`. -/
theorem symmetry_constrained_full_collapse.truths_are_nd_necessary : Statements.Models.symmetry_constrained_full_collapse.truths_are_nd_necessary :=
  ⟨Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.permsCollapses, Classicism.Map.Arguments.nd_necessity_isolated_actual_world.truths_are_nd_necessary (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.permsCollapses) (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.permsCollapses) (Classicism.Meta.Intensional.SymFull.actualWorldIsolated (M := Classicism.Meta.Intensional.SymFull.permsCollapses))⟩

/-- `symmetry-constrained-full-collapse`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem symmetry_constrained_full_collapse.no_pure_contingency_r : Statements.Models.symmetry_constrained_full_collapse.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.permsCollapses, Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.permsCollapses) (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.permsCollapses) (Classicism.Meta.Intensional.Premodel.oneObject_of_subsingleton _)⟩

/-- `symmetry-constrained-full-collapse`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem symmetry_constrained_full_collapse.transversal_choice_r : Statements.Models.symmetry_constrained_full_collapse.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.permsCollapses, Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.permsCollapses) (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.permsCollapses) (Classicism.Meta.Intensional.SymFull.extFull (M := Classicism.Meta.Intensional.SymFull.permsCollapses))⟩

/-- `symmetry-constrained-full-collapse`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem symmetry_constrained_full_collapse.independence_signature_r : Statements.Models.symmetry_constrained_full_collapse.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.permsCollapses), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.permsCollapses) (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.permsCollapses)) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.permsCollapses)) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.permsCollapses))⟩

/-- `symmetry-constrained-full-collapse`: No Contingency (signature Σ) holds, by the argument `sigma-top-npc`. -/
theorem symmetry_constrained_full_collapse.no_contingency_signature_r : Statements.Models.symmetry_constrained_full_collapse.no_contingency_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.permsCollapses), Classicism.Map.Arguments.sigma_top_npc.no_contingency_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.permsCollapses) (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.permsCollapses)) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.permsCollapses)) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.permsCollapses)) (Classicism.Meta.Intensional.Premodel.holdsAx_interp_ofPure.2 ((Classicism.Map.Models.symmetry_constrained_full_collapse.no_pure_contingency_r).2))⟩

/-- `symmetry-constrained-full-collapse-sigma-true-atom`: Truths are ND-necessary holds, by the argument `nd-necessity-isolated-actual-world`. -/
theorem symmetry_constrained_full_collapse_sigma_true_atom.truths_are_nd_necessary : Statements.Models.symmetry_constrained_full_collapse_sigma_true_atom.truths_are_nd_necessary :=
  ⟨Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.permsCollapses, Classicism.Map.Arguments.nd_necessity_isolated_actual_world.truths_are_nd_necessary (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.permsCollapses) (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.permsCollapses) (Classicism.Meta.Intensional.SymFull.actualWorldIsolated (M := Classicism.Meta.Intensional.SymFull.permsCollapses))⟩

/-- `symmetry-constrained-full-collapse-sigma-true-atom`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem symmetry_constrained_full_collapse_sigma_true_atom.no_pure_contingency_r : Statements.Models.symmetry_constrained_full_collapse_sigma_true_atom.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.permsCollapses, Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.permsCollapses) (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.permsCollapses) (Classicism.Meta.Intensional.Premodel.oneObject_of_subsingleton _)⟩

/-- `symmetry-constrained-full-collapse-sigma-true-atom`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem symmetry_constrained_full_collapse_sigma_true_atom.transversal_choice_r : Statements.Models.symmetry_constrained_full_collapse_sigma_true_atom.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.permsCollapses, Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.permsCollapses) (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.permsCollapses) (Classicism.Meta.Intensional.SymFull.extFull (M := Classicism.Meta.Intensional.SymFull.permsCollapses))⟩

end Classicism.Map.Models
