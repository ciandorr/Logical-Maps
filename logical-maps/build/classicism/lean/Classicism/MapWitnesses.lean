import Classicism.Results.Other.Witnesses

/-!
# Model verdicts from the witnesses (1 November 2026)

Single verdicts of model records, proved from `Results/Other/Witnesses.lean`. They are kept out of
`MapModels.lean` because the witnesses use the verdicts certified there and in `MapDerived.lean`.

- `finite-support-truncations`: the Distinctness-Preserving Collapse holds (the record's own
  argument, `Monoids.Truncs.dpc`).
- The three coalesced roots with complete components and distinguished arrows
  (`coalesced-maximalist-root`, `coalesced-single-individual-root`,
  `coalesced-constant-indexed-root`): their argument `no-boxed-collapse` for `□`(Truths are
  5-necessary) and `□`(Two-hat necessity implies ND-necessity), and the group's
  `pure-sentences-possible` for `□`Vicinity and `□`Weakly Inextensible Comprehension, each from the
  Lean model refuting the unboxed principle (`Coalesced.SumData.not_holdsAx_box_of_model`).
-/

namespace Classicism.Map.Models

open Meta Meta.AxiomSet Meta.Intensional

namespace finite_support_truncations

/-- The witness: the proposition that the arrow fixes `[0, n]`, for `n` beyond the pinning set. -/
theorem truths_are_nd_necessary :
    Statements.Models.finite_support_truncations.truths_are_nd_necessary :=
  ⟨MonoidModel.model_isModel Monoids.truncs, (Premodel.holdsAx_schemaIn_iff _ _).2
    (Premodel.holdsAx_single _ Monoids.Truncs.dpc)⟩

/-- On the even truncation singletons (`Monoids.Truncs.not_bcT`). -/
theorem boolean_completeness_t : Statements.Models.finite_support_truncations.boolean_completeness_t :=
  ⟨MonoidModel.model_isModel Monoids.truncs, fun h => Monoids.Truncs.not_bcT
    ((Premodel.holdsAx_schemaIn_iff _ _).1 h _ rfl)⟩

end finite_support_truncations

namespace full_idempotent_monoid

/-- The atom `{k}` becomes `{1, k}` along `k`, where it is true (`Idem.not_aasaT`). -/
theorem atoms_are_self_atoms_t : Statements.Models.full_idempotent_monoid.atoms_are_self_atoms_t :=
  ⟨MSet.model_isModel Intensional.Idem, fun h => Intensional.Idem.not_aasaT
    ((Premodel.holdsAx_schemaIn_iff _ _).1 h _ rfl)⟩

end full_idempotent_monoid

namespace symmetric_all_surjections

/-- By a collapse and a transposition (`SymIdeal.allSurj_not_ic`). -/
theorem intensional_choice_r : Statements.Models.symmetric_all_surjections.intensional_choice_r :=
  ⟨SymIdeal.model_isModel SymIdeal.allSurj, fun h => SymIdeal.allSurj_not_ic
    ((Premodel.holdsAx_schemaIn_iff _ _).1 h _ ⟨.e, by decide, rfl⟩)⟩

end symmetric_all_surjections

namespace symmetric_infinite_classes

/-- A classifier cannot choose for a class missing its pinning set
(`SymIdeal.infClasses_not_transversal`). -/
theorem transversal_r : Statements.Models.symmetric_infinite_classes.transversal_r :=
  ⟨SymIdeal.model_isModel SymIdeal.infClasses, fun h => SymIdeal.infClasses_not_transversal
    ((Premodel.holdsAx_schemaIn_iff _ _).1 h _ ⟨.e, by decide, rfl⟩)⟩

end symmetric_infinite_classes

/-- `□`Transversal fails at a coalesced root with complete components. -/
theorem coalesced_box_transversal {D : Coalesced.SumData} (hD : D.DistinguishedArrows)
    (hc : D.CompleteComponents) : ¬ D.model.HoldsAx P.NecTransversal.schemaIn :=
  Coalesced.SumData.not_holdsAx_box_of_model hD hc (SymIdeal.model_isModel SymIdeal.infClasses)
    P.Transversal.schema_closedTypes
    (fun h => SymIdeal.infClasses_not_transversal (h _ ⟨.e, by decide, rfl⟩))
    (by rintro _ ⟨_, ⟨τ, hτ, rfl⟩, rfl⟩; exact ⟨τ, hτ, rfl⟩)

/-- The four boxed failures at a coalesced root with complete components. -/
theorem coalesced_box_failures {D : Coalesced.SumData} (hD : D.DistinguishedArrows)
    (hc : D.CompleteComponents) :
    ¬ D.model.HoldsAx P.NecTwoHatImpliesNdNecessity.schemaIn ∧
    ¬ D.model.HoldsAx P.NecTruthImpliesFiveNecessity.schemaIn ∧
    ¬ D.model.HoldsAx P.NecVicinity.schemaIn ∧
    ¬ D.model.HoldsAx P.NecWeaklyInextensibleComprehension.schemaIn :=
  ⟨Coalesced.SumData.not_holdsAx_box_of_model hD hc
      (FullActionModels.unitModel_isModel FullActionModels.DRObj.w0)
      P.TwoHatImpliesNdNecessity.schema_closedTypes DoubleRetraction.not_twoHatImpliesNd
      (by rintro _ ⟨_, rfl, rfl⟩; rfl),
   Coalesced.SumData.not_holdsAx_box_of_model hD hc (MSet.model_isModel Intensional.Invol)
      P.TruthImpliesFiveNecessity.schema_closedTypes Invol.not_truthImpliesFive
      (by rintro _ ⟨_, rfl, rfl⟩; rfl),
   Coalesced.SumData.not_holdsAx_box_of_model hD hc (MonoidModel.model_isModel Monoids.truncs)
      P.Vicinity.schema_closedTypes Truncs.not_vicinity
      (by rintro _ ⟨_, rfl, rfl⟩; rfl),
   Coalesced.SumData.not_holdsAx_box_of_model hD hc (MonoidModel.model_isModel Monoids.truncs)
      P.WeaklyInextensibleComprehension.schema_closedTypes Truncs.not_weaklyInextensibleComprehension
      (by rintro _ ⟨_, ⟨τ, hτ, rfl⟩, rfl⟩; exact ⟨τ, hτ, rfl⟩)⟩

namespace coalesced_maximalist_root

theorem necessary_two_hat_implies_nd_necessity :
    Statements.Models.coalesced_maximalist_root.necessary_two_hat_implies_nd_necessity :=
  ⟨Coalesced.maximalistRoot.isModel, (coalesced_box_failures Coalesced.maximalistData_distinguished
    (Coalesced.maximalistData_complete Coalesced.sigmaTop_closed)).1⟩

theorem necessary_truth_implies_five_necessity :
    Statements.Models.coalesced_maximalist_root.necessary_truth_implies_five_necessity :=
  ⟨Coalesced.maximalistRoot.isModel, (coalesced_box_failures Coalesced.maximalistData_distinguished
    (Coalesced.maximalistData_complete Coalesced.sigmaTop_closed)).2.1⟩

theorem necessary_vicinity : Statements.Models.coalesced_maximalist_root.necessary_vicinity :=
  ⟨Coalesced.maximalistRoot.isModel, (coalesced_box_failures Coalesced.maximalistData_distinguished
    (Coalesced.maximalistData_complete Coalesced.sigmaTop_closed)).2.2.1⟩

theorem necessary_weakly_inextensible_comprehension_r :
    Statements.Models.coalesced_maximalist_root.necessary_weakly_inextensible_comprehension_r :=
  ⟨Coalesced.maximalistRoot.isModel, (coalesced_box_failures Coalesced.maximalistData_distinguished
    (Coalesced.maximalistData_complete Coalesced.sigmaTop_closed)).2.2.2⟩

theorem necessary_transversal_r : Statements.Models.coalesced_maximalist_root.necessary_transversal_r :=
  ⟨Coalesced.maximalistRoot.isModel, coalesced_box_transversal Coalesced.maximalistData_distinguished
    (Coalesced.maximalistData_complete Coalesced.sigmaTop_closed)⟩

end coalesced_maximalist_root

namespace coalesced_single_individual_root

theorem necessary_two_hat_implies_nd_necessity :
    Statements.Models.coalesced_single_individual_root.necessary_two_hat_implies_nd_necessity :=
  ⟨Coalesced.singleIndividualData.isModel, (coalesced_box_failures
    Coalesced.singleIndividualData_distinguished Coalesced.singleIndividualData_complete).1⟩

theorem necessary_truth_implies_five_necessity :
    Statements.Models.coalesced_single_individual_root.necessary_truth_implies_five_necessity :=
  ⟨Coalesced.singleIndividualData.isModel, (coalesced_box_failures
    Coalesced.singleIndividualData_distinguished Coalesced.singleIndividualData_complete).2.1⟩

theorem necessary_vicinity : Statements.Models.coalesced_single_individual_root.necessary_vicinity :=
  ⟨Coalesced.singleIndividualData.isModel, (coalesced_box_failures
    Coalesced.singleIndividualData_distinguished Coalesced.singleIndividualData_complete).2.2.1⟩

theorem necessary_weakly_inextensible_comprehension_r :
    Statements.Models.coalesced_single_individual_root.necessary_weakly_inextensible_comprehension_r :=
  ⟨Coalesced.singleIndividualData.isModel, (coalesced_box_failures
    Coalesced.singleIndividualData_distinguished Coalesced.singleIndividualData_complete).2.2.2⟩

theorem necessary_transversal_r : Statements.Models.coalesced_single_individual_root.necessary_transversal_r :=
  ⟨Coalesced.singleIndividualData.isModel, coalesced_box_transversal Coalesced.singleIndividualData_distinguished
    Coalesced.singleIndividualData_complete⟩

end coalesced_single_individual_root

namespace coalesced_constant_indexed_root

theorem necessary_two_hat_implies_nd_necessity :
    Statements.Models.coalesced_constant_indexed_root.necessary_two_hat_implies_nd_necessity :=
  ⟨Coalesced.constantIndexedData.isModel, (coalesced_box_failures
    Coalesced.constantIndexedData_distinguished Coalesced.constantIndexedData_complete).1⟩

theorem necessary_truth_implies_five_necessity :
    Statements.Models.coalesced_constant_indexed_root.necessary_truth_implies_five_necessity :=
  ⟨Coalesced.constantIndexedData.isModel, (coalesced_box_failures
    Coalesced.constantIndexedData_distinguished Coalesced.constantIndexedData_complete).2.1⟩

theorem necessary_vicinity : Statements.Models.coalesced_constant_indexed_root.necessary_vicinity :=
  ⟨Coalesced.constantIndexedData.isModel, (coalesced_box_failures
    Coalesced.constantIndexedData_distinguished Coalesced.constantIndexedData_complete).2.2.1⟩

theorem necessary_weakly_inextensible_comprehension_r :
    Statements.Models.coalesced_constant_indexed_root.necessary_weakly_inextensible_comprehension_r :=
  ⟨Coalesced.constantIndexedData.isModel, (coalesced_box_failures
    Coalesced.constantIndexedData_distinguished Coalesced.constantIndexedData_complete).2.2.2⟩

theorem necessary_transversal_r : Statements.Models.coalesced_constant_indexed_root.necessary_transversal_r :=
  ⟨Coalesced.constantIndexedData.isModel, coalesced_box_transversal Coalesced.constantIndexedData_distinguished
    Coalesced.constantIndexedData_complete⟩

end coalesced_constant_indexed_root

end Classicism.Map.Models
