import Classicism.Results.Other.Meta
import Classicism.Certified.Entailed
import Classicism.Coalesced.TransferBC
import Classicism.Models.InfClassesTransversal
import Classicism.Coalesced.TransferChoice
import Classicism.Coalesced.TransferSelfAtoms

/-!
# Witnesses: failures in Lean models, through the map's results (1 November 2026)

A failure of a principle in a Lean model, obtained from the model's certified verdicts by the
map's certified results, read semantically (`Premodel.entails_holds`, soundness): if `X ∪ Y ⟹ Z`,
`Y` holds in a model and `Z` fails there, `X` fails there. Each failure makes the negation of a
failing instance consistent with `C` (`consistent_neg_of_not_holdsAx`), which is what the
incompatibilities with Maximalism need (`maximalist_box_inconsistent_of_model`).

- **Truths are 5-necessary** and **Truths are two-hat necessary** fail in the full model on the
  two-element group (`full-involution-group`): `□ND` gives `□(□̂̂ ⇒ □_≠)`, hence `□̂̂ ⇒ □_≠`;
  `□`Rigid Comprehension gives Actuality, hence `□₅ ⇒ □̂̂`; so `□₅ ⇒ □_≠`, and with
  `p ⇒ □₅p` the Distinctness-Preserving Collapse would hold, which fails there.
- **Two-hat necessity implies ND-necessity** and **5-necessity implies ND-necessity** fail in the
  full two-object model with two retractions (`full-two-object-double-retraction`): Actuality holds
  there (from `□`Rigid Comprehension), and with `□̂̂ ⇒ □_≠` it gives Strong Actuality, which fails.
- **Weakly Inextensible Comprehension** fails in the truncation model (Appendix D, Part 6,
  `finite-support-truncations`): Atomicity at `t` holds there, Actuality fails, and the two give
  Actuality (`atomicity-t-and-weakly-inextensible-comprehension-imply-actuality`).
- **Tame Rigidity** fails in the two-object model after Part 8 (`finite-support-two-object-all-maps`):
  BF holds there and `□BF` fails (`tame-rigidity-and-barcan-imply-necessary-barcan`).
-/

/-! ### The Distinctness-Preserving Collapse in the truncation model -/

section
open Classicism.Meta Classicism.Meta.Intensional Classicism.Meta.Intensional.MonoidModel Classicism.Meta.Intensional.Monoids CategoryTheory

namespace Classicism.Meta.Intensional.Monoids.Truncs

/-- Every arrow lowers every number. -/
theorem apply_le (f : truncs) (y : ℕ) : (f : F) y ≤ y := by
  rcases f.2 with e | ⟨n, e⟩
  · rw [e]; exact le_rfl
  · rw [e]; exact min_le_left y n

/-- **The Distinctness-Preserving Collapse holds** in the truncation model: for a truth `p`
pinned down below `n`, the witness is the proposition that the arrow fixes `[0, n]`. -/
theorem dpc : (model truncs).HoldsSentence P.TruthsAreNDNecessary.quoted := by
  have Mo : (model truncs).IsModel := model_isModel truncs
  rw [Premodel.HoldsSentence]
  unfold P.TruthsAreNDNecessary.quoted
  rw [(model truncs).holds_forall Mo]
  intro p
  rw [(model truncs).holds_imp Mo]
  intro hp
  have hp1 : tup 1 ∈ (model truncs).Incl _ (star truncs) p := (holds_var_id truncs _ _).1 hp
  obtain ⟨N, hN, hpin⟩ := finPinned'_Incl p
  obtain ⟨n, hn⟩ := exists_bound hN
  obtain ⟨q, hq⟩ := exists_inner (M := truncs)
    (q := ofPred fun g : truncs => ∀ x ≤ n, (g : F) x = x)
    ⟨Set.Iic n, Set.finite_Iic n, ofPred_pinned (M := truncs) _ _ fun (g g' : truncs) ha => by
      refine forall_congr' fun x => imp_congr_right fun hx => ?_
      rw [show (g : F) x = (g' : F) x from ha x hx]⟩
  rw [(model truncs).holds_exists Mo]
  refine ⟨q, ?_⟩
  rw [(model truncs).holds_conj Mo]
  refine ⟨(holds_var_id truncs _ _).2 (by
    show tup (1 : truncs) ∈ (model truncs).Incl _ (star truncs) q
    rw [hq]; intro x _; rfl), ?_⟩
  rw [(model truncs).holds_box Mo]
  intro V k
  cases V
  rw [(model truncs).holds_imp Mo, (model truncs).holds_dia Mo]
  rintro ⟨U, j, hj⟩
  cases U
  rw [Category.assoc, (model truncs).push_push] at hj
  have hj' := (holds_var_push truncs _ _ _).1 hj
  change tup (arrow (M := truncs) j * arrow (M := truncs) k) ∈ (model truncs).Incl _ (star truncs) q at hj'
  rw [hq] at hj'
  have hk : ∀ x ∈ N, ((arrow (M := truncs) k : truncs) : F) x = x := fun x hx => by
    have e : ((arrow (M := truncs) j : truncs) : F) (((arrow (M := truncs) k : truncs) : F) x) = x := hj' x (hn x hx)
    have h1 := apply_le (arrow (M := truncs) j) (((arrow (M := truncs) k : truncs) : F) x)
    have h2 := apply_le (arrow (M := truncs) k) x
    omega
  refine (holds_var_push truncs (Var.zero.succ) _ k).2 ?_
  exact (mem_iff_of_pinned hpin fun x hx => hk x hx).2 hp1

end Classicism.Meta.Intensional.Monoids.Truncs

end

namespace Classicism.Meta

open AxiomSet Intensional

namespace Witness

variable {C : Type} [CategoryTheory.SmallCategory C] {B : Premodel Signature.pure C}

/-! ### Soundness of the map's results, in a model -/

theorem holds₁ (M : B.IsModel) {X Z : AxiomSet Signature.pure} (e : X ⟹ Z) (h : B.HoldsAx X) :
    B.HoldsAx Z :=
  B.entails_holds M e h

theorem holds₂ (M : B.IsModel) {X Y Z : AxiomSet Signature.pure} (e : X ∪ Y ⟹ Z) (hX : B.HoldsAx X)
    (hY : B.HoldsAx Y) : B.HoldsAx Z :=
  B.entails_holds M e (Premodel.holdsAx_union B hX hY)

theorem not_holds₁ (M : B.IsModel) {X Z : AxiomSet Signature.pure} (e : X ⟹ Z) (hZ : ¬ B.HoldsAx Z) :
    ¬ B.HoldsAx X := fun h => hZ (holds₁ M e h)

theorem not_holds_left (M : B.IsModel) {X Y Z : AxiomSet Signature.pure} (e : X ∪ Y ⟹ Z)
    (hY : B.HoldsAx Y) (hZ : ¬ B.HoldsAx Z) : ¬ B.HoldsAx X := fun h => hZ (holds₂ M e h hY)

theorem not_holds_right (M : B.IsModel) {X Y Z : AxiomSet Signature.pure} (e : X ∪ Y ⟹ Z)
    (hX : B.HoldsAx X) (hZ : ¬ B.HoldsAx Z) : ¬ B.HoldsAx Y := fun h => hZ (holds₂ M e hX h)

/-- A schema failing in a model has an instance whose negation is consistent with `C`. -/
theorem exists_consistent_neg_of_not_holdsAx (M : B.IsModel) {X : AxiomSet Signature.pure}
    (h : ¬ B.HoldsAx X) : ∃ p, X p ∧ ¬ B.HoldsSentence p ∧ Consistent (single (Term.neg p)) := by
  by_contra hn
  refine h fun p hp => Classical.byContradiction fun hq => hn ⟨p, hp, hq, ?_⟩
  exact Consistent.of_model B M (Premodel.holdsAx_single B ((B.holdsSentence_neg M p).2 hq))

/-- A sentence failing in a model has a negation consistent with `C`. -/
theorem consistent_neg_of_not_holds (M : B.IsModel) {q : Sentence Signature.pure}
    (h : ¬ B.HoldsSentence q) : Consistent (single (Term.neg q)) :=
  Consistent.of_model B M (Premodel.holdsAx_single B ((B.holdsSentence_neg M q).2 h))

/-- A model of the map's verdict statement, read in the pure language. -/
theorem pure_of {X : AxiomSet Signature.pure} (h : B.HoldsAx (AxiomSet.ofPure X)) : B.HoldsAx X :=
  (Premodel.holdsAx_schemaIn_iff B X).1 h

end Witness

open Witness

/-! ### The full model on the two-element group -/

namespace Invol

local notation "A" => MSet.model Intensional.Invol
local notation "M" => MSet.model_isModel Intensional.Invol

theorem holdsAx_twoHatImpliesNd : (A).HoldsAx P.TwoHatImpliesNdNecessity.schema :=
  holds₁ M Proofs.necessary_two_hat_implies_nd_necessity_implies_two_hat_implies_nd_necessity.entails
    (holds₁ M Proofs.necessary_distinctness_necessary_t_implies_necessary_two_hat_implies_nd.entails
      (holds₁ M Proofs.necessary_distinctness_necessary_r_implies_necessary_distinctness_necessary_t.entails
        (pure_of Map.Models.full_involution_group.necessary_distinctness_necessary_r.2)))

theorem holdsAx_actuality : (A).HoldsAx P.Actuality.schema :=
  holds₁ M Proofs.rigid_comprehension_r_implies_actuality.entails
    (holds₁ M Proofs.necessary_rigid_comprehension_r_implies_rigid_comprehension_r.entails
      (pure_of Map.Models.full_involution_group.necessary_rigid_comprehension_r.2))

theorem holdsAx_fiveImpliesNd : (A).HoldsAx P.FiveImpliesNdNecessity.schema :=
  holds₂ M Proofs.two_hat_implies_nd_and_five_implies_two_hat_imply_five_implies_nd.entails
    holdsAx_twoHatImpliesNd (holds₁ M Proofs.actuality_implies_five_implies_two_hat.entails holdsAx_actuality)

/-- **Truths are 5-necessary fails** in the full model on the two-element group. -/
theorem not_truthImpliesFive : ¬ (A).HoldsAx P.TruthImpliesFiveNecessity.schema :=
  not_holds_right M Proofs.five_implies_nd_and_truth_implies_five_imply_truth_implies_nd.entails
    holdsAx_fiveImpliesNd (fun h => Map.Models.full_involution_group.truths_are_nd_necessary.2
      ((Premodel.holdsAx_schemaIn_iff _ _).2 h))

/-- **Truths are two-hat necessary fails** there too. -/
theorem not_truthImpliesTwoHat : ¬ (A).HoldsAx P.TruthImpliesTwoHatNecessity.schema :=
  not_holds₁ M Proofs.truth_implies_two_hat_implies_truth_implies_five.entails not_truthImpliesFive

end Invol

/-! ### The full two-object model with two retractions -/

namespace DoubleRetraction

local notation "A" => FullActionModels.doubleRetraction
local notation "M" => FullActionModels.unitModel_isModel FullActionModels.DRObj.w0

theorem holdsAx_actuality : (A).HoldsAx P.Actuality.schema :=
  holds₁ M Proofs.rigid_comprehension_r_implies_actuality.entails
    (holds₁ M Proofs.necessary_rigid_comprehension_r_implies_rigid_comprehension_r.entails
      (pure_of Map.Models.full_two_object_double_retraction.necessary_rigid_comprehension_r.2))

/-- **Two-hat necessity implies ND-necessity fails** in the full two-object model with two
retractions: with Actuality it would give Strong Actuality. -/
theorem not_twoHatImpliesNd : ¬ (A).HoldsAx P.TwoHatImpliesNdNecessity.schema :=
  not_holds_right M Proofs.actuality_and_two_hat_implies_nd_imply_strong_actuality.entails
    holdsAx_actuality (fun h => Map.Models.full_two_object_double_retraction.strong_actuality.2
      ((Premodel.holdsAx_schemaIn_iff _ _).2 h))

/-- **5-necessity implies ND-necessity fails** there too. -/
theorem not_fiveImpliesNd : ¬ (A).HoldsAx P.FiveImpliesNdNecessity.schema :=
  not_holds₁ M Proofs.five_implies_nd_implies_two_hat_implies_nd.entails not_twoHatImpliesNd

end DoubleRetraction

/-! ### The truncation model (Appendix D, Part 6) -/

namespace Truncs

local notation "A" => MonoidModel.model Monoids.truncs
local notation "M" => MonoidModel.model_isModel Monoids.truncs

/-- **Weakly Inextensible Comprehension fails** in the truncation model: with Atomicity at `t`
it gives Actuality, which fails. -/
theorem not_weaklyInextensibleComprehension :
    ¬ (A).HoldsAx P.WeaklyInextensibleComprehension.schema :=
  not_holds_right M Proofs.atomicity_t_and_weakly_inextensible_comprehension_imply_actuality.entails
    (Premodel.holdsAx_single _ Monoids.Truncs.atomicityT)
    (fun h => Monoids.Truncs.not_actuality (h _ rfl))

/-- **Vicinity fails** in the truncation model: with the Distinctness-Preserving Collapse,
which holds there (`Monoids.Truncs.dpc`), it gives Actuality, which fails. -/
theorem not_vicinity : ¬ (A).HoldsAx P.Vicinity.schema :=
  not_holds_left M Proofs.vicinity_and_truths_are_nd_necessary_imply_actuality.entails
    (Premodel.holdsAx_single _ Monoids.Truncs.dpc)
    (fun h => Monoids.Truncs.not_actuality (h _ rfl))

end Truncs

/-! ### The two-object model after Part 8 -/

namespace ContingentBarcan

local notation "A" => Intensional.ContingentBarcan.model
local notation "M" => Intensional.ContingentBarcan.model_isModel

/-- **Tame Rigidity fails** in the two-object model after Part 8: with BF it gives `□BF`. -/
theorem not_tameRigidity : ¬ (A).HoldsAx P.TameRigidity.schema :=
  not_holds_left M Proofs.tame_rigidity_and_barcan_imply_necessary_barcan.entails
    (pure_of Map.Models.finite_support_two_object_all_maps.barcan_r.2)
    (fun h => Map.Models.finite_support_two_object_all_maps.necessary_barcan_r.2
      ((Premodel.holdsAx_schemaIn_iff _ _).2 h))

end ContingentBarcan

/-! ### Maximalism against the necessitations

`maximalist_box_inconsistent_of_model` at each failure above. -/

/-- `maximalist-distinctness-incompatible-with-necessary-truth-implies-five-necessity`. -/
theorem maximalist_necTruthImpliesFive_inconsistent :
    ¬ Consistent (maximalist (Sig := Signature.pure) ∪ P.NecTruthImpliesFiveNecessity.schema) :=
  maximalist_box_inconsistent_of_model _ (MSet.model_isModel Intensional.Invol)
    P.TruthImpliesFiveNecessity.schema_closedTypes Invol.not_truthImpliesFive
    (by rintro _ ⟨_, rfl, rfl⟩; rfl)

/-- `maximalist-distinctness-incompatible-with-necessary-truth-implies-two-hat-necessity`. -/
theorem maximalist_necTruthImpliesTwoHat_inconsistent :
    ¬ Consistent (maximalist (Sig := Signature.pure) ∪ P.NecTruthImpliesTwoHatNecessity.schema) :=
  maximalist_box_inconsistent_of_model _ (MSet.model_isModel Intensional.Invol)
    P.TruthImpliesTwoHatNecessity.schema_closedTypes Invol.not_truthImpliesTwoHat
    (by rintro _ ⟨_, rfl, rfl⟩; rfl)

/-- `maximalist-distinctness-incompatible-with-necessary-two-hat-implies-nd-necessity`. -/
theorem maximalist_necTwoHatImpliesNd_inconsistent :
    ¬ Consistent (maximalist (Sig := Signature.pure) ∪ P.NecTwoHatImpliesNdNecessity.schema) :=
  maximalist_box_inconsistent_of_model _ (FullActionModels.unitModel_isModel FullActionModels.DRObj.w0)
    P.TwoHatImpliesNdNecessity.schema_closedTypes DoubleRetraction.not_twoHatImpliesNd
    (by rintro _ ⟨_, rfl, rfl⟩; rfl)

/-- `maximalist-distinctness-incompatible-with-necessary-five-implies-nd-necessity`. -/
theorem maximalist_necFiveImpliesNd_inconsistent :
    ¬ Consistent (maximalist (Sig := Signature.pure) ∪ P.NecFiveImpliesNdNecessity.schema) :=
  maximalist_box_inconsistent_of_model _ (FullActionModels.unitModel_isModel FullActionModels.DRObj.w0)
    P.FiveImpliesNdNecessity.schema_closedTypes DoubleRetraction.not_fiveImpliesNd
    (by rintro _ ⟨_, rfl, rfl⟩; rfl)

/-- `maximalist-distinctness-incompatible-with-necessary-weakly-inextensible-comprehension-r`. -/
theorem maximalist_necWeaklyInextensibleComprehension_inconsistent :
    ¬ Consistent (maximalist (Sig := Signature.pure) ∪ P.NecWeaklyInextensibleComprehension.schema) :=
  maximalist_box_inconsistent_of_model _ (MonoidModel.model_isModel Monoids.truncs)
    P.WeaklyInextensibleComprehension.schema_closedTypes Truncs.not_weaklyInextensibleComprehension
    (by rintro _ ⟨_, ⟨τ, hτ, rfl⟩, rfl⟩; exact ⟨τ, hτ, rfl⟩)

/-- `maximalist-distinctness-incompatible-with-necessary-boolean-completeness-t`: BC at `t` fails
in the truncation model (`Monoids.Truncs.not_bcT`, `Coalesced/TransferBC.lean`). -/
theorem maximalist_necBooleanCompletenessT_inconsistent :
    ¬ Consistent (maximalist (Sig := Signature.pure) ∪ P.NecBooleanCompletenessT.schema) :=
  max_box_inconsistent (Consistent.empty_union Monoids.Truncs.not_bcT_consistent) rfl

/-- `possibility-and-necessary-strong-atomicity-t-incompatible`: Strong Atomicity at `t` fails in
the full model on the idempotent monoid (`nonepic-strong-atomicity`). -/
theorem maximalist_necStrongAtomicityT_inconsistent :
    ¬ Consistent (maximalist (Sig := Signature.pure) ∪ P.NecStrongAtomicityT.schema) :=
  maximalist_box_inconsistent_of_model _ (MSet.model_isModel Intensional.Idem)
    P.StrongAtomicityT.schema_closedTypes
    (fun h => Map.Models.full_idempotent_monoid.strong_atomicity_t.2
      ((Premodel.holdsAx_schemaIn_iff _ _).2 h))
    (by rintro _ ⟨_, rfl, rfl⟩; rfl)

/-- `possibility-and-necessary-atoms-are-self-atoms-t-incompatible`: it fails in the full model on
the idempotent monoid (`Idem.not_aasaT`). -/
theorem maximalist_necAtomsAreSelfAtomsT_inconsistent :
    ¬ Consistent (maximalist (Sig := Signature.pure) ∪ P.NecAtomsAreSelfAtomsT.schema) :=
  max_box_inconsistent (Consistent.empty_union Intensional.Idem.not_aasaT_consistent) rfl

/-- `possibility-and-necessary-intensional-choice-incompatible`: it fails at `e` in the symmetric
model on all surjections (`SymIdeal.allSurj_not_ic`). -/
theorem maximalist_necIntensionalChoice_inconsistent :
    ¬ Consistent (maximalist (Sig := Signature.pure) ∪ P.NecIntensionalChoice.schema) :=
  maximalist_box_inconsistent_of_model _ (SymIdeal.model_isModel SymIdeal.allSurj)
    P.IntensionalChoice.schema_closedTypes
    (fun h => SymIdeal.allSurj_not_ic (h _ ⟨.e, by decide, rfl⟩))
    (by rintro _ ⟨_, ⟨τ, hτ, rfl⟩, rfl⟩; exact ⟨τ, hτ, rfl⟩)

/-- `maximalist-distinctness-incompatible-with-necessary-transversal-r`: Transversal fails at `e` in
`symmetric-infinite-classes` (`SymIdeal.infClasses_not_transversal`). -/
theorem maximalist_necTransversal_inconsistent :
    ¬ Consistent (maximalist (Sig := Signature.pure) ∪ P.NecTransversal.schema) :=
  maximalist_box_inconsistent_of_model _ (SymIdeal.model_isModel SymIdeal.infClasses)
    P.Transversal.schema_closedTypes
    (fun h => SymIdeal.infClasses_not_transversal (h _ ⟨.e, by decide, rfl⟩))
    (by rintro _ ⟨_, ⟨τ, hτ, rfl⟩, rfl⟩; exact ⟨τ, hτ, rfl⟩)

/-- `maximalist-distinctness-incompatible-with-necessary-vicinity`. -/
theorem maximalist_necVicinity_inconsistent :
    ¬ Consistent (maximalist (Sig := Signature.pure) ∪ P.NecVicinity.schema) :=
  maximalist_box_inconsistent_of_model _ (MonoidModel.model_isModel Monoids.truncs)
    P.Vicinity.schema_closedTypes Truncs.not_vicinity
    (by rintro _ ⟨_, rfl, rfl⟩; rfl)

/-- `maximalist-distinctness-incompatible-with-necessary-tame-rigidity-r`. -/
theorem maximalist_necTameRigidity_inconsistent :
    ¬ Consistent (maximalist (Sig := Signature.pure) ∪ P.NecTameRigidity.schema) :=
  maximalist_box_inconsistent_of_model _ Intensional.ContingentBarcan.model_isModel
    P.TameRigidity.schema_closedTypes ContingentBarcan.not_tameRigidity
    (by rintro _ ⟨_, ⟨τ, hτ, rfl⟩, rfl⟩; exact ⟨τ, hτ, rfl⟩)


/-! ### At a coalesced root with complete components

What a Lean model refutes is possible at the root, so its necessitation fails there
(`RootAction.not_holds_box_of_complete`, over the distinguished arrows). -/

theorem Coalesced.SumData.not_holdsAx_box_of_model {D : Coalesced.SumData} (hD : D.DistinguishedArrows)
    (hc : D.CompleteComponents) {C : Type} [CategoryTheory.SmallCategory C]
    {B : Premodel Signature.pure C} (M : B.IsModel) {X N : AxiomSet Signature.pure}
    (hX : ClosedTypes X) (hf : ¬ B.HoldsAx X) (hN : X.box ⊆ N) :
    ¬ D.model.HoldsAx (AxiomSet.ofPure N) := fun H => by
  obtain ⟨p, hp, -, hcons⟩ := exists_consistent_neg_of_not_holdsAx M hf
  exact Coalesced.RootAction.not_holds_box_of_complete _ _ _ _ D.isModel
    (Coalesced.SumData.completeComponents_root hD hc) (hX p hp) hcons
    (H _ ⟨Term.box p, hN _ (AxiomSet.mem_box hp), rfl⟩)

end Classicism.Meta
