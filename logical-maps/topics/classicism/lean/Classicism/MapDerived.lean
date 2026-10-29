import Classicism.MapArguments
import Classicism.MapModels

/-!
# Generated certificates: models' verdicts from the map's arguments

Written by `pmap lean classicism` from the YAML records. **Do not edit.**

Each verdict a general argument gives a model on the map, certified by applying the
argument's certificate (`MapArguments.lean`) to the model: to its proof of being a model,
and its proofs of the conditions the argument requires (its record's `lean.meets`, or its
group's).
-/

namespace Classicism.Map.Models
open Classicism

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

/-- `finite-support-monotone-maps`: BF fails, by `finite-support-one-object`'s argument `barcan-positive`. -/
theorem finite_support_monotone_maps.barcan_r : Statements.Models.finite_support_monotone_maps.barcan_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono), Classicism.Map.Arguments.finite_support_one_object.barcan_positive.barcan_r (Classicism.Meta.Intensional.Monoids.mono) (Classicism.Map.Meets.finite_support_monotone_maps.positive_preserving)⟩

/-- `finite-support-monotone-maps`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem finite_support_monotone_maps.no_pure_contingency_r : Statements.Models.finite_support_monotone_maps.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono), Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono)) (Classicism.Meta.Intensional.MonoidModel.oneObject (Classicism.Meta.Intensional.Monoids.mono))⟩

/-- `finite-support-monotone-maps`: Transversal Choice holds, by the argument `transversal-choice-extensionally-full`. -/
theorem finite_support_monotone_maps.transversal_choice_r : Statements.Models.finite_support_monotone_maps.transversal_choice_r :=
  ⟨Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono), Classicism.Map.Arguments.transversal_choice_extensionally_full.transversal_choice_r (Classicism.Meta.Intensional.MonoidModel.model (Classicism.Meta.Intensional.Monoids.mono)) (Classicism.Meta.Intensional.MonoidModel.model_isModel (Classicism.Meta.Intensional.Monoids.mono)) (Classicism.Meta.Intensional.Premodel.ideal_extFull _ _ _ _)⟩

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

/-- `full-idempotent-monoid`: Truths are ND-necessary holds, by the argument `dpc-isolated-actual-world`. -/
theorem full_idempotent_monoid.distinctness_preserving_collapse : Statements.Models.full_idempotent_monoid.distinctness_preserving_collapse :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem, Classicism.Map.Arguments.dpc_isolated_actual_world.distinctness_preserving_collapse (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Idem) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Idem) (Classicism.Map.Meets.full_idempotent_monoid.actual_world_isolated)⟩

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

/-- `full-involution-group`: Gallin Extensional Comprehension holds, by the argument `coherent-retractions`. -/
theorem full_involution_group.gallin_extensional_comprehension_r : Statements.Models.full_involution_group.gallin_extensional_comprehension_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol, Classicism.Map.Arguments.coherent_retractions.gallin_extensional_comprehension_r (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.FullActionModels.group_coherent Classicism.Meta.Intensional.Invol)⟩

/-- `full-involution-group`: Truths are ND-necessary fails, by the argument `dpc-returning-arrow`. -/
theorem full_involution_group.distinctness_preserving_collapse : Statements.Models.full_involution_group.distinctness_preserving_collapse :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol, Classicism.Map.Arguments.dpc_returning_arrow.distinctness_preserving_collapse (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.Invol) (Classicism.Meta.Intensional.FullActionModels.group_returning Classicism.Meta.Intensional.Invol.k Classicism.Meta.Intensional.Invol.k_ne_one)⟩

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

/-- `full-permutation-group-infinite-set`: Gallin Extensional Comprehension holds, by the argument `coherent-retractions`. -/
theorem full_permutation_group_infinite_set.gallin_extensional_comprehension_r : Statements.Models.full_permutation_group_infinite_set.gallin_extensional_comprehension_r :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ), Classicism.Map.Arguments.coherent_retractions.gallin_extensional_comprehension_r (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_full (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.FullActionModels.group_coherent (Equiv.Perm ℕ))⟩

/-- `full-permutation-group-infinite-set`: Truths are ND-necessary fails, by the argument `dpc-returning-arrow`. -/
theorem full_permutation_group_infinite_set.distinctness_preserving_collapse : Statements.Models.full_permutation_group_infinite_set.distinctness_preserving_collapse :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ), Classicism.Map.Arguments.dpc_returning_arrow.distinctness_preserving_collapse (Classicism.Meta.Intensional.MSet.model (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_isModel (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.MSet.model_full (Equiv.Perm ℕ)) (Classicism.Meta.Intensional.FullActionModels.perm_returning)⟩

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

/-- `full-surjection-monoid`: Truths are ND-necessary fails, by the argument `dpc-returning-arrow`. -/
theorem full_surjection_monoid.distinctness_preserving_collapse : Statements.Models.full_surjection_monoid.distinctness_preserving_collapse :=
  ⟨Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj, Classicism.Map.Arguments.dpc_returning_arrow.distinctness_preserving_collapse (Classicism.Meta.Intensional.MSet.model Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_isModel Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.MSet.model_full Classicism.Meta.Intensional.FullActionModels.surj) (Classicism.Meta.Intensional.FullActionModels.surj_returning)⟩

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

/-- `full-two-object-chain`: Truths are ND-necessary holds, by the argument `dpc-isolated-actual-world`. -/
theorem full_two_object_chain.distinctness_preserving_collapse : Statements.Models.full_two_object_chain.distinctness_preserving_collapse :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.dpc_isolated_actual_world.distinctness_preserving_collapse (Classicism.Meta.Intensional.FullActionModels.chain) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.chain_actual_world_isolated)⟩

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

/-- `full-two-object-double-retraction`: Truths are ND-necessary fails, by the argument `dpc-returning-arrow`. -/
theorem full_two_object_double_retraction.distinctness_preserving_collapse : Statements.Models.full_two_object_double_retraction.distinctness_preserving_collapse :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.dpc_returning_arrow.distinctness_preserving_collapse (Classicism.Meta.Intensional.FullActionModels.doubleRetraction) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _) (Classicism.Meta.Intensional.FullActionModels.doubleRetraction_returning)⟩

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

/-- `full-two-object-retract`: Gallin Extensional Comprehension holds, by the argument `coherent-retractions`. -/
theorem full_two_object_retract.gallin_extensional_comprehension_r : Statements.Models.full_two_object_retract.gallin_extensional_comprehension_r :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.coherent_retractions.gallin_extensional_comprehension_r (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _) (Classicism.Meta.Intensional.FullActionModels.retract_coherent)⟩

/-- `full-two-object-retract`: Truths are ND-necessary fails, by the argument `dpc-returning-arrow`. -/
theorem full_two_object_retract.distinctness_preserving_collapse : Statements.Models.full_two_object_retract.distinctness_preserving_collapse :=
  ⟨Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _, Classicism.Map.Arguments.dpc_returning_arrow.distinctness_preserving_collapse (Classicism.Meta.Intensional.FullActionModels.retract) (Classicism.Meta.Intensional.FullActionModels.unitModel_isModel _) (Classicism.Meta.Intensional.FullActionModels.unitModel_full _) (Classicism.Meta.Intensional.FullActionModels.retract_returning)⟩

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

/-- `symmetric-collapse-pair`: Truths are ND-necessary holds, by the argument `dpc-isolated-actual-world`. -/
theorem symmetric_collapse_pair.distinctness_preserving_collapse : Statements.Models.symmetric_collapse_pair.distinctness_preserving_collapse :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair), Classicism.Map.Arguments.dpc_isolated_actual_world.distinctness_preserving_collapse (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)) (Classicism.Meta.Intensional.SymIdeal.collapsePair_actualWorldIsolated)⟩

/-- `symmetric-collapse-pair`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem symmetric_collapse_pair.no_pure_contingency_r : Statements.Models.symmetric_collapse_pair.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair), Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)) (Classicism.Meta.Intensional.Premodel.oneObject_of_subsingleton _)⟩

/-- `symmetric-collapse-pair`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem symmetric_collapse_pair.independence_signature_r : Statements.Models.symmetric_collapse_pair.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)))⟩

/-- `symmetric-collapse-pair`: No Contingency (signature Σ) holds, by the argument `sigma-top-npc`. -/
theorem symmetric_collapse_pair.no_contingency_signature_r : Statements.Models.symmetric_collapse_pair.no_contingency_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)), Classicism.Map.Arguments.sigma_top_npc.no_contingency_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.collapsePair))) (Classicism.Meta.Intensional.Premodel.holdsAx_interp_ofPure.2 ((Classicism.Map.Models.symmetric_collapse_pair.no_pure_contingency_r).2))⟩

/-- `symmetric-entrance-qualitative-links`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem symmetric_entrance_qualitative_links.independence_signature_r : Statements.Models.symmetric_entrance_qualitative_links.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.FixedPointEntrance.Qualitative.isModel), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.FixedPointEntrance.Qualitative.model) (Classicism.Meta.Intensional.FixedPointEntrance.Qualitative.isModel)) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.FixedPointEntrance.Qualitative.isModel)) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.FixedPointEntrance.Qualitative.isModel))⟩

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

/-- `symmetric-old-new-individuals`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem symmetric_old_new_individuals.independence_signature_r : Statements.Models.symmetric_old_new_individuals.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.OldNew.base)), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.OldNew.base)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.OldNew.base))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.OldNew.base))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.OldNew.base)))⟩

/-- `symmetric-qualitative-contrast`: Axiom of Infinity (type e) holds, by `symmetric-ideally-full`'s argument `axiom-of-infinity-e`. -/
theorem symmetric_qualitative_contrast.axiom_of_infinity_e : Statements.Models.symmetric_qualitative_contrast.axiom_of_infinity_e :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.contrastBase), Classicism.Map.Arguments.symmetric_ideally_full.axiom_of_infinity_e.axiom_of_infinity_e (Classicism.Meta.Intensional.SymIdeal.contrastBase) (Classicism.Meta.Intensional.SymIdeal.contrast_infinitelyManyIndividuals)⟩

/-- `symmetric-qualitative-contrast`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem symmetric_qualitative_contrast.independence_signature_r : Statements.Models.symmetric_qualitative_contrast.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.contrastBase)), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.contrastBase)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.contrastBase))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.contrastBase))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.contrastBase)))⟩

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

/-- `symmetric-range-gap`: Truths are ND-necessary holds, by the argument `dpc-isolated-actual-world`. -/
theorem symmetric_range_gap.distinctness_preserving_collapse : Statements.Models.symmetric_range_gap.distinctness_preserving_collapse :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap), Classicism.Map.Arguments.dpc_isolated_actual_world.distinctness_preserving_collapse (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)) (Classicism.Meta.Intensional.SymIdeal.rangeGap_actualWorldIsolated)⟩

/-- `symmetric-range-gap`: No Pure Contingency holds, by the argument `no-pure-contingency-one-object`. -/
theorem symmetric_range_gap.no_pure_contingency_r : Statements.Models.symmetric_range_gap.no_pure_contingency_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap), Classicism.Map.Arguments.no_pure_contingency_one_object.no_pure_contingency_r (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)) (Classicism.Meta.Intensional.Premodel.oneObject_of_subsingleton _)⟩

/-- `symmetric-range-gap`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem symmetric_range_gap.independence_signature_r : Statements.Models.symmetric_range_gap.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)))⟩

/-- `symmetric-range-gap`: No Contingency (signature Σ) holds, by the argument `sigma-top-npc`. -/
theorem symmetric_range_gap.no_contingency_signature_r : Statements.Models.symmetric_range_gap.no_contingency_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)), Classicism.Map.Arguments.sigma_top_npc.no_contingency_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.Base.toSym Classicism.Meta.Intensional.SymIdeal.rangeGap))) (Classicism.Meta.Intensional.Premodel.holdsAx_interp_ofPure.2 ((Classicism.Map.Models.symmetric_range_gap.no_pure_contingency_r).2))⟩

/-- `symmetric-two-object-unpinned`: Boolean Completeness holds, by `symmetric-ideally-full`'s argument `boolean-completeness`. -/
theorem symmetric_two_object_unpinned.boolean_completeness_r : Statements.Models.symmetric_two_object_unpinned.boolean_completeness_r :=
  ⟨Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.twoBase), Classicism.Map.Arguments.symmetric_ideally_full.boolean_completeness.boolean_completeness_r (Classicism.Meta.Intensional.SymIdeal.twoBase) (Classicism.Meta.Intensional.SymIdeal.two_hullConditions)⟩

/-- `symmetric-two-object-unpinned`: Independence (signature Σ) fails, by the argument `sigma-top`. -/
theorem symmetric_two_object_unpinned.independence_signature_r : Statements.Models.symmetric_two_object_unpinned.independence_signature_r :=
  ⟨Classicism.Meta.Signature.sigmaTop_admitted, Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.twoBase)), Classicism.Map.Arguments.sigma_top.independence_signature_r (Classicism.Meta.Intensional.Premodel.withTop (Classicism.Meta.Intensional.SymBase.model (Classicism.Meta.Intensional.SymIdeal.twoBase)) (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.twoBase))) (Classicism.Meta.Intensional.Premodel.withTop_isModel (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.twoBase))) (Classicism.Meta.Signature.sigmaTop_admitted) (Classicism.Meta.Intensional.Premodel.withTop_sigmaTop (Classicism.Meta.Intensional.SymBase.model_isModel (Classicism.Meta.Intensional.SymIdeal.twoBase)))⟩

/-- `symmetry-constrained-full-all-maps`: Truths are ND-necessary holds, by the argument `dpc-isolated-actual-world`. -/
theorem symmetry_constrained_full_all_maps.distinctness_preserving_collapse : Statements.Models.symmetry_constrained_full_all_maps.distinctness_preserving_collapse :=
  ⟨Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.allMaps, Classicism.Map.Arguments.dpc_isolated_actual_world.distinctness_preserving_collapse (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.allMaps) (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.allMaps) (Classicism.Meta.Intensional.SymFull.actualWorldIsolated (M := Classicism.Meta.Intensional.SymFull.allMaps))⟩

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

/-- `symmetry-constrained-full-collapse`: Truths are ND-necessary holds, by the argument `dpc-isolated-actual-world`. -/
theorem symmetry_constrained_full_collapse.distinctness_preserving_collapse : Statements.Models.symmetry_constrained_full_collapse.distinctness_preserving_collapse :=
  ⟨Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.permsCollapses, Classicism.Map.Arguments.dpc_isolated_actual_world.distinctness_preserving_collapse (Classicism.Meta.Intensional.SymFull.model Classicism.Meta.Intensional.SymFull.permsCollapses) (Classicism.Meta.Intensional.SymFull.model_isModel Classicism.Meta.Intensional.SymFull.permsCollapses) (Classicism.Meta.Intensional.SymFull.actualWorldIsolated (M := Classicism.Meta.Intensional.SymFull.permsCollapses))⟩

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

end Classicism.Map.Models
