import Classicism.Statements
import Classicism.Results.Arity
import Classicism.Results.SentenceSchemas.Incompatibilities
import Classicism.Results.SentenceSchemas.RigidPower
import Classicism.Results.SentenceSchemas.WitnessedPossibility
import Classicism.Results.SentenceSchemas.PossibilityPlus
import Classicism.Results.SentenceSchemas.Infinity
import Classicism.Results.SentenceSchemas.Constants
import Classicism.Results.SentenceSchemas.ArithmeticMeta
import Classicism.Certified.Research
import Classicism.Results.Research.NPCC5Atomicity
import Classicism.Results.Research.RigidityClosureResearchAtomicPowerCertificates
import Classicism.Results.Research.ModalPropagationCertificates.StrongAtomicity
import Classicism.Results.Research.ModalPropagationCertificates.BoxedComprehension

/-!
# The map's results, certified

One theorem per map result proved in Lean, named by the result's id, whose type is the
statement the map generates for it (`Classicism/Statements.lean`, written by the map's own
generator from its YAML: `pmap lean classicism`); and one per equivalent form of a principle,
named `<principle id>.<form id>`. These are the map's `lean_ref`s: what `pmap lean-check`
checks, against the generated statement and the map's list of allowed axioms.

Each principle is a schema at every signature (`Certified/Signatures.lean`). A result's
statement reads: for every signature and every schema `Ax` over it, if `Ax` entails each
premise then it entails the conclusion; for an incompatibility, `Ax` is inconsistent. That
is equivalent to the entailment between the schemas, or to their inconsistency. A form's
statement reads: `Ax` entails the principle iff it entails the form.

Each certificate is one line citing the result's proof. That proof is found, for a reader,
by name: `Proofs.<id>` in `Results/Records.lean` (the shallow proof, at one argument type
where the result is at every arity), `<id>` or `Meta.<id>` in `Results/Arity.lean` (a shallow
core, the result at every arity); otherwise the theorem the certificate cites, in
`Results/SentenceSchemas/`; for a form, the two directions beside the principle in `Principles/`
(`P.<Name>.to_<form>`, `P.<Name>.of_<form>`), or for a list form in `Results/Lists.lean`.
`#classicism_map_index` (`Tools/MapIndex.lean`) writes these locations out for the map
(`map/index.json`).
-/

namespace Classicism.Meta.AxiomSet

variable {Sig : Signature}

/-! ## Glue: from the entailments as proved to the statements as generated -/

/-- **A pure entailment holds in every signature**, its schemas read there. -/
theorem Entails.ofPure {A B : AxiomSet Signature.pure} (h : A ⟹ B) :
    AxiomSet.ofPure (Sig := Sig) A ⟹ AxiomSet.ofPure B := by
  rintro a ⟨p, hp, rfl⟩
  exact Derivable.mono (ofPure_union_subset A) (Theorem.ofPure (h p hp))

theorem Entails.ofPure_union {Ax : AxiomSet Sig} {A B : AxiomSet Signature.pure}
    (h₁ : Ax ⟹ AxiomSet.ofPure A) (h₂ : Ax ⟹ AxiomSet.ofPure B) :
    Ax ⟹ AxiomSet.ofPure (A ∪ B) := by
  rintro a ⟨p, hp | hp, rfl⟩
  · exact h₁ _ ⟨p, hp, rfl⟩
  · exact h₂ _ ⟨p, hp, rfl⟩

theorem Entails.ofPure_empty {Ax : AxiomSet Sig} : Ax ⟹ AxiomSet.ofPure empty := by
  rintro a ⟨p, hp, rfl⟩
  exact hp.elim

theorem Entails.to_empty {Ax : AxiomSet Sig} : Ax ⟹ empty := fun _ h => h.elim

/-- What is inconsistent stays so when enlarged. -/
theorem not_consistent_mono {A B : AxiomSet Sig} (hs : A ⊆ B) (h : ¬ Consistent A) :
    ¬ Consistent B := fun hc => h (Consistent.mono hs hc)

/-- `A ∪ B ⊆ A ∪ B'` from `B ⊆ B'`. -/
theorem union_subset_union_right {A B B' : AxiomSet Sig} (h : B ⊆ B') : A ∪ B ⊆ A ∪ B' :=
  fun a => Or.imp_right (h a)

/-- No Pure Contingency of the pure language, read in a signature, is part of No Pure
Contingency there. -/
theorem npc_ofPure_subset : AxiomSet.ofPure (npc Signature.pure) ⊆ npc Sig := by
  rw [npc_eq_ofPure (Sig := Sig)]; exact fun _ => id

/-- B for the pure sentences, likewise. -/
theorem pureB_ofPure_subset : AxiomSet.ofPure (pureB Signature.pure) ⊆ pureB Sig := by
  rw [pureB_eq_ofPure (Sig := Sig)]; exact fun _ => id

/-- An entailment of No Pure Contingency in the form `Results/SentenceSchemas/` proves it, as
the pure version of No Contingency. -/
theorem Entails.to_pureVersion_noContingency {X : AxiomSet Sig}
    (h : X ⟹ AxiomSet.ofPure (npc Signature.pure)) : X ⟹ pureVersion noContingency := by
  rw [pureVersion_noContingency]
  exact h

/-- Likewise for Pure B, as the pure version of Signature B. -/
theorem Entails.to_pureVersion_signatureB {X : AxiomSet Sig}
    (h : X ⟹ AxiomSet.ofPure (pureB Signature.pure)) : X ⟹ pureVersion signatureB := by
  rw [pureVersion_signatureB]
  exact h

end Classicism.Meta.AxiomSet

namespace Classicism.Map

open Meta Meta.AxiomSet

/-- Assemble `Ax ⟹ S`, for `S` a union of the statement's premises, from the hypotheses
`Ax ⟹ Aᵢ`, in any order and nesting, read in the signature or not. -/
syntax "map_premises" : tactic
macro_rules
  | `(tactic| map_premises) => `(tactic| first
      | assumption
      | (rw [← AxiomSet.pureVersion_noContingency]; assumption)
      | (rw [← AxiomSet.pureVersion_signatureB]; assumption)
      | exact AxiomSet.Entails.ofPure_empty
      | exact AxiomSet.Entails.to_empty
      | exact AxiomSet.Entails.trans (by assumption)
          (AxiomSet.Entails.ofPure Meta.distinctness_schema_r_implies_possibility_schema_r)
      | exact AxiomSet.Entails.trans (by assumption) Meta.distinctness_signature_r_implies_possibility_signature_r
      | (apply AxiomSet.Entails.ofPure_union <;> map_premises)
      | (apply AxiomSet.Entails.union <;> map_premises))

/-- A certificate from a pure entailment `h : S ⟹ C`, `S` a union of the premises. -/
macro "map_cert " h:term : tactic => `(tactic| (
  intro _ _ _
  intros
  exact AxiomSet.Entails.trans (by map_premises) (AxiomSet.Entails.ofPure $h)))

/-- A certificate from an entailment at every signature. -/
macro "map_cert_sig " h:term : tactic => `(tactic| (
  intro _ _ _
  intros
  exact AxiomSet.Entails.trans (by map_premises) $h))

/-- A certificate for an incompatibility, from a pure inconsistency `h : ¬ Consistent S`. -/
macro "map_cert_incompatible " h:term : tactic => `(tactic| (
  intro _ _ _
  intros
  intro hc
  exact AxiomSet.not_consistent_ofPure $h (AxiomSet.Consistent.of_entails (by map_premises) hc)))

/-- A certificate for an equivalent form, from two entailments at every signature. -/
macro "map_form_sig " h₁:term:max h₂:term:max : tactic => `(tactic| (
  intro _ _ _
  exact ⟨fun h => AxiomSet.Entails.trans h $h₁, fun h => AxiomSet.Entails.trans h $h₂⟩))

/-- A certificate for an equivalent form, from the two pure entailments between the
official form and it. -/
macro "map_form " h₁:term:max h₂:term:max : tactic => `(tactic| (
  intro _ _ _
  exact ⟨fun h => AxiomSet.Entails.trans h (AxiomSet.Entails.ofPure $h₁),
    fun h => AxiomSet.Entails.trans h (AxiomSet.Entails.ofPure $h₂)⟩))

/-- `N ⊆ box A` or `box A ⊆ N`, for `N` the schema of the boxed principle of `A`: their
instances are the same sentences. (`cases` rather than `rintro … rfl`: inside a macro the
pattern `rfl` is renamed by hygiene and no longer substitutes.) -/
syntax "map_box" : tactic
macro_rules
  | `(tactic| map_box) => `(tactic| first
      | (intro _ h; cases h; exact AxiomSet.mem_box rfl)
      | (intro _ h; obtain ⟨_, hc, he⟩ := h; cases he; exact AxiomSet.mem_box ⟨_, hc, rfl⟩)
      | (intro _ h; obtain ⟨_, _, hc₁, hc₂, he⟩ := h; cases he
         exact AxiomSet.mem_box ⟨_, _, hc₁, hc₂, rfl⟩)
      | (intro _ h; obtain ⟨_, hp, he⟩ := h; cases hp; cases he; rfl)
      | (intro _ h; obtain ⟨_, ⟨_, hc, hp⟩, he⟩ := h; cases hp; cases he; exact ⟨_, hc, rfl⟩)
      | (intro _ h; obtain ⟨_, ⟨_, _, hc₁, hc₂, hp⟩, he⟩ := h; cases hp; cases he
         exact ⟨_, _, hc₁, hc₂, rfl⟩))

/-! ## The certificates -/

/-- `actuality-and-bf-imply-inextensible-comprehension` -/
theorem actuality_and_bf_imply_inextensible_comprehension : Statements.actuality_and_bf_imply_inextensible_comprehension := by
  map_cert Meta.actuality_and_bf_imply_inextensible_comprehension

/-- `actuality-and-bf-t-imply-strong-actuality` -/
theorem actuality_and_bf_t_imply_strong_actuality : Statements.actuality_and_bf_t_imply_strong_actuality := by
  map_cert Proofs.actuality_and_bf_t_imply_strong_actuality.entails

/-- `actuality-and-distinctness-preserving-collapse-imply-inextensible-comprehension` -/
theorem actuality_and_distinctness_preserving_collapse_imply_inextensible_comprehension : Statements.actuality_and_distinctness_preserving_collapse_imply_inextensible_comprehension := by
  map_cert Meta.actuality_and_distinctness_preserving_collapse_imply_inextensible_comprehension

/-- `actuality-and-distinctness-preserving-collapse-imply-strong-actuality` -/
theorem actuality_and_distinctness_preserving_collapse_imply_strong_actuality : Statements.actuality_and_distinctness_preserving_collapse_imply_strong_actuality := by
  map_cert Proofs.actuality_and_distinctness_preserving_collapse_imply_strong_actuality.entails

/-- `actuality-implies-persistent-comprehension-r` -/
theorem actuality_implies_persistent_comprehension_r : Statements.actuality_implies_persistent_comprehension_r := by
  map_cert Meta.actuality_implies_persistent_comprehension_r

/-- `actuality-implies-transversal` -/
theorem actuality_implies_transversal : Statements.actuality_implies_transversal := by
  map_cert Proofs.actuality_implies_transversal.entails

/-- `actuality-implies-vicinity` -/
theorem actuality_implies_vicinity : Statements.actuality_implies_vicinity := by
  map_cert Proofs.actuality_implies_vicinity.entails

/-- `actuality-implies-weakly-inextensible-comprehension-r` -/
theorem actuality_implies_weakly_inextensible_comprehension_r : Statements.actuality_implies_weakly_inextensible_comprehension_r := by
  map_cert Meta.actuality_implies_weakly_inextensible_comprehension_r

/-- `actuality-incompatible-with-atomlessness` -/
theorem actuality_incompatible_with_atomlessness : Statements.actuality_incompatible_with_atomlessness := by
  map_cert_incompatible (not_consistent_of_imp_neg Proofs.actuality_incompatible_with_atomlessness.derivable)

/-- `atomicity-and-bf-imply-necessary-actuality` -/
theorem atomicity_and_bf_imply_necessary_actuality : Statements.atomicity_and_bf_imply_necessary_actuality := by
  map_cert Proofs.atomicity_and_bf_imply_necessary_actuality.entails

/-- `atomicity-and-bf-imply-strong-atomicity` -/
theorem atomicity_and_bf_imply_strong_atomicity : Statements.atomicity_and_bf_imply_strong_atomicity := by
  map_cert Meta.atomicity_and_bf_imply_strong_atomicity

/-- `atomicity-r-implies-atomicity-t` -/
theorem atomicity_r_implies_atomicity_t : Statements.atomicity_r_implies_atomicity_t := by
  map_cert Proofs.atomicity_r_implies_atomicity_t.entails

/-- `atomicity-t-and-bf-imply-atomicity` -/
theorem atomicity_t_and_bf_imply_atomicity : Statements.atomicity_t_and_bf_imply_atomicity := by
  map_cert Meta.atomicity_t_and_bf_imply_atomicity

/-- `atomicity-t-and-bf-imply-necessary-actuality` -/
theorem atomicity_t_and_bf_imply_necessary_actuality : Statements.atomicity_t_and_bf_imply_necessary_actuality := by
  map_cert Proofs.atomicity_t_and_bf_imply_necessary_actuality.entails

/-- `atomicity-t-and-bf-t-imply-strong-atomicity-t` -/
theorem atomicity_t_and_bf_t_imply_strong_atomicity_t : Statements.atomicity_t_and_bf_t_imply_strong_atomicity_t := by
  map_cert Proofs.atomicity_t_and_bf_t_imply_strong_atomicity_t.entails

/-- `atomicity-t-incompatible-with-atomlessness` -/
theorem atomicity_t_incompatible_with_atomlessness : Statements.atomicity_t_incompatible_with_atomlessness := by
  map_cert_incompatible (not_consistent_of_imp_neg Proofs.atomicity_t_incompatible_with_atomlessness.derivable)

/-- `atomlessness-implies-axiom-of-infinity-t` -/
theorem atomlessness_implies_axiom_of_infinity_t : Statements.atomlessness_implies_axiom_of_infinity_t := by
  map_cert Proofs.atomlessness_implies_axiom_of_infinity_t.entails

/-- `axiom-of-infinity-e-implies-possible-infinity-e` -/
theorem axiom_of_infinity_e_implies_possible_infinity_e : Statements.axiom_of_infinity_e_implies_possible_infinity_e := by
  map_cert Proofs.axiom_of_infinity_e_implies_possible_infinity_e.entails

/-- `axiom-of-infinity-t-implies-possible-infinity-t` -/
theorem axiom_of_infinity_t_implies_possible_infinity_t : Statements.axiom_of_infinity_t_implies_possible_infinity_t := by
  map_cert Proofs.axiom_of_infinity_t_implies_possible_infinity_t.entails

/-- `barcan-r-implies-barcan-t` -/
theorem barcan_r_implies_barcan_t : Statements.barcan_r_implies_barcan_t := by
  map_cert Proofs.barcan_r_implies_barcan_t.entails

/-- `barcan-r-implies-functionality-r` -/
theorem barcan_r_implies_functionality_r : Statements.barcan_r_implies_functionality_r := by
  map_cert Proofs.barcan_r_implies_functionality_r.entails

/-- `boolean-completeness-r-implies-boolean-completeness-t` -/
theorem boolean_completeness_r_implies_boolean_completeness_t : Statements.boolean_completeness_r_implies_boolean_completeness_t := by
  map_cert Proofs.boolean_completeness_r_implies_boolean_completeness_t.entails

/-- `boolean-completeness-r-implies-countable-boolean-completeness-r` -/
theorem boolean_completeness_r_implies_countable_boolean_completeness_r : Statements.boolean_completeness_r_implies_countable_boolean_completeness_r := by
  map_cert Proofs.boolean_completeness_r_implies_countable_boolean_completeness_r.entails

/-- `boolean-completeness-r-implies-weakly-inextensible-comprehension-r` -/
theorem boolean_completeness_r_implies_weakly_inextensible_comprehension_r : Statements.boolean_completeness_r_implies_weakly_inextensible_comprehension_r := by
  map_cert Meta.boolean_completeness_r_implies_weakly_inextensible_comprehension_r

/-- `c5-and-actuality-imply-completeness` -/
theorem c5_and_actuality_imply_completeness : Statements.c5_and_actuality_imply_completeness := by
  map_cert Meta.c5_and_actuality_imply_completeness

/-- `c5-and-actuality-imply-rigid-comprehension` -/
theorem c5_and_actuality_imply_rigid_comprehension : Statements.c5_and_actuality_imply_rigid_comprehension := by
  map_cert Meta.c5_and_actuality_imply_rigid_comprehension

/-- `c5-and-atomicity-imply-necessary-atomicity` -/
theorem c5_and_atomicity_imply_necessary_atomicity : Statements.c5_and_atomicity_imply_necessary_atomicity := by
  map_cert Meta.c5_and_atomicity_imply_necessary_atomicity

/-- `c5-and-atomicity-imply-necessary-completeness` -/
theorem c5_and_atomicity_imply_necessary_completeness : Statements.c5_and_atomicity_imply_necessary_completeness := by
  map_cert Meta.c5_and_atomicity_imply_necessary_completeness

/-- `c5-and-atomicity-imply-necessary-plenitude` -/
theorem c5_and_atomicity_imply_necessary_plenitude : Statements.c5_and_atomicity_imply_necessary_plenitude := by
  map_cert Meta.c5_and_atomicity_imply_necessary_plenitude

/-- `c5-and-atomicity-imply-necessary-rigid-comprehension` -/
theorem c5_and_atomicity_imply_necessary_rigid_comprehension : Statements.c5_and_atomicity_imply_necessary_rigid_comprehension := by
  map_cert Meta.c5_and_atomicity_imply_necessary_rigid_comprehension

/-- `c5-and-completeness-imply-actuality` -/
theorem c5_and_completeness_imply_actuality : Statements.c5_and_completeness_imply_actuality := by
  map_cert Proofs.c5_and_completeness_imply_actuality.entails

/-- `c5-and-completeness-imply-plenitude` -/
theorem c5_and_completeness_imply_plenitude : Statements.c5_and_completeness_imply_plenitude := by
  map_cert Meta.c5_and_completeness_imply_plenitude

/-- `c5-and-necessary-actuality-imply-atomicity` -/
theorem c5_and_necessary_actuality_imply_atomicity : Statements.c5_and_necessary_actuality_imply_atomicity := by
  map_cert Meta.c5_and_necessary_actuality_imply_atomicity

/-- `c5-and-necessary-completeness-imply-atomicity` -/
theorem c5_and_necessary_completeness_imply_atomicity : Statements.c5_and_necessary_completeness_imply_atomicity := by
  map_cert Meta.c5_and_necessary_completeness_imply_atomicity

/-- `c5-and-necessary-rigid-comprehension-imply-necessary-gallin-comprehension` -/
theorem c5_and_necessary_rigid_comprehension_imply_necessary_gallin_comprehension : Statements.c5_and_necessary_rigid_comprehension_imply_necessary_gallin_comprehension := by
  map_cert _root_.Classicism.c5_and_necessary_rigid_comprehension_imply_necessary_gallin_comprehension.entails

/-- `c5-and-persistent-comprehension-imply-gallin` -/
theorem c5_and_persistent_comprehension_imply_gallin : Statements.c5_and_persistent_comprehension_imply_gallin := by
  map_cert _root_.Classicism.c5_and_persistent_comprehension_imply_gallin.entails

/-- `completeness-and-actuality-imply-weak-rigid-comprehension` -/
theorem completeness_and_actuality_imply_weak_rigid_comprehension : Statements.completeness_and_actuality_imply_weak_rigid_comprehension := by
  map_cert Meta.completeness_and_actuality_imply_weak_rigid_comprehension

/-- `converse-witnessed-possibility-r-implies-no-pure-contingency-r` -/
theorem converse_witnessed_possibility_r_implies_no_pure_contingency_r : Statements.converse_witnessed_possibility_r_implies_no_pure_contingency_r := by
  map_cert_sig (Entails.to_pureVersion_noContingency converseWitnessedPossibility_entails_npc)

/-- `distinctness-necessary-r-implies-distinctness-necessary-t` -/
theorem distinctness_necessary_r_implies_distinctness_necessary_t : Statements.distinctness_necessary_r_implies_distinctness_necessary_t := by
  map_cert Proofs.distinctness_necessary_r_implies_distinctness_necessary_t.entails

/-- `distinctness-necessary-t-implies-modal-five` -/
theorem distinctness_necessary_t_implies_modal_five : Statements.distinctness_necessary_t_implies_modal_five := by
  map_cert Proofs.distinctness_necessary_t_implies_modal_five.entails

/-- `distinctness-necessary-t-implies-vicinity` -/
theorem distinctness_necessary_t_implies_vicinity : Statements.distinctness_necessary_t_implies_vicinity := by
  map_cert Proofs.distinctness_necessary_t_implies_vicinity.entails

/-- `distinctness-preserving-collapse-and-nd-imply-fregean-axiom` -/
theorem distinctness_preserving_collapse_and_nd_imply_fregean_axiom : Statements.distinctness_preserving_collapse_and_nd_imply_fregean_axiom := by
  map_cert Proofs.distinctness_preserving_collapse_and_nd_imply_fregean_axiom.entails

/-- `distinctness-signature-r-implies-distinctness-schema-r` -/
theorem distinctness_signature_r_implies_distinctness_schema_r : Statements.distinctness_signature_r_implies_distinctness_schema_r :=
  fun hS _ h => Entails.trans h (Entails.of_subset (pureVersion_distinctnessC_subset hS.1))

/-- `extensionality-r-implies-actuality` -/
theorem extensionality_r_implies_actuality : Statements.extensionality_r_implies_actuality := by
  map_cert Proofs.extensionality_r_implies_actuality.entails

/-- `extensionality-r-implies-atomicity-r` -/
theorem extensionality_r_implies_atomicity_r : Statements.extensionality_r_implies_atomicity_r := by
  map_cert Meta.extensionality_r_implies_atomicity_r

/-- `extensionality-r-implies-boolean-completeness-r` -/
theorem extensionality_r_implies_boolean_completeness_r : Statements.extensionality_r_implies_boolean_completeness_r := by
  map_cert Meta.extensionality_r_implies_boolean_completeness_r

/-- `extensionality-r-implies-fregean-axiom` -/
theorem extensionality_r_implies_fregean_axiom : Statements.extensionality_r_implies_fregean_axiom := by
  map_cert Proofs.extensionality_r_implies_fregean_axiom.entails

/-- `extensionality-r-implies-functionality-r` -/
theorem extensionality_r_implies_functionality_r : Statements.extensionality_r_implies_functionality_r := by
  map_cert Proofs.extensionality_r_implies_functionality_r.entails

/-- `extensionality-r-implies-necessary-extensionality-r` -/
theorem extensionality_r_implies_necessary_extensionality_r : Statements.extensionality_r_implies_necessary_extensionality_r := by
  map_cert Proofs.extensionality_r_implies_necessary_extensionality_r.entails

/-- `extensionality-r-implies-plenitude-r` -/
theorem extensionality_r_implies_plenitude_r : Statements.extensionality_r_implies_plenitude_r := by
  map_cert Meta.extensionality_r_implies_plenitude_r

/-- `extensionality-r-implies-rigid-comprehension-r` -/
theorem extensionality_r_implies_rigid_comprehension_r : Statements.extensionality_r_implies_rigid_comprehension_r := by
  map_cert _root_.Classicism.extensionality_r_implies_rigid_comprehension_r.entails

/-- `five-and-strong-atomicity-t-imply-necessary-b` -/
theorem five_and_strong_atomicity_t_imply_necessary_b : Statements.five_and_strong_atomicity_t_imply_necessary_b := by
  map_cert Proofs.five_and_strong_atomicity_t_imply_necessary_b.entails

/-- `fregean-axiom-implies-distinctness-preserving-collapse` -/
theorem fregean_axiom_implies_distinctness_preserving_collapse : Statements.fregean_axiom_implies_distinctness_preserving_collapse := by
  map_cert Proofs.fregean_axiom_implies_distinctness_preserving_collapse.entails

/-- `fregean-axiom-implies-extensionality-r` -/
theorem fregean_axiom_implies_extensionality_r : Statements.fregean_axiom_implies_extensionality_r := by
  map_cert Proofs.fregean_axiom_implies_extensionality_r.entails

/-- `fregean-axiom-implies-necessary-distinctness-necessary-r` -/
theorem fregean_axiom_implies_necessary_distinctness_necessary_r : Statements.fregean_axiom_implies_necessary_distinctness_necessary_r := by
  map_cert Proofs.fregean_axiom_implies_necessary_distinctness_necessary_r.entails

/-- `fregean-axiom-implies-necessary-fregean-axiom` -/
theorem fregean_axiom_implies_necessary_fregean_axiom : Statements.fregean_axiom_implies_necessary_fregean_axiom := by
  map_cert Proofs.fregean_axiom_implies_necessary_fregean_axiom.entails

/-- `fregean-axiom-implies-no-contingency-signature-r` -/
theorem fregean_axiom_implies_no_contingency_signature_r : Statements.fregean_axiom_implies_no_contingency_signature_r := by
  map_cert_sig fregean_entails_noContingency

/-- `fregean-axiom-implies-no-pure-contingency-r` -/
theorem fregean_axiom_implies_no_pure_contingency_r : Statements.fregean_axiom_implies_no_pure_contingency_r := by
  map_cert_sig (Entails.to_pureVersion_noContingency (Entails.ofPure fregean_entails_npc_pure))

/-- `fregean-incompatible-with-infinity-t` -/
theorem fregean_incompatible_with_infinity_t : Statements.fregean_incompatible_with_infinity_t := by
  map_cert_incompatible fregean_infinityT_inconsistent

/-- `functional-choice-r-implies-plenitude-r` -/
theorem functional_choice_r_implies_plenitude_r : Statements.functional_choice_r_implies_plenitude_r := by
  map_cert Proofs.functional_choice_r_implies_plenitude_r.entails

/-- `functional-choice-r-implies-relational-choice-r` -/
theorem functional_choice_r_implies_relational_choice_r : Statements.functional_choice_r_implies_relational_choice_r := by
  map_cert Proofs.functional_choice_r_implies_relational_choice_r.entails

/-- `functionality-r-implies-tractarianism-r` -/
theorem functionality_r_implies_tractarianism_r : Statements.functionality_r_implies_tractarianism_r := by
  map_cert Proofs.functionality_r_implies_tractarianism_r.entails

/-- `gallin-comprehension-and-bf-imply-rigid-comprehension` -/
theorem gallin_comprehension_and_bf_imply_rigid_comprehension : Statements.gallin_comprehension_and_bf_imply_rigid_comprehension := by
  map_cert Meta.gallin_comprehension_and_bf_imply_rigid_comprehension

/-- `gallin-comprehension-and-bf-imply-weak-rigid-comprehension` -/
theorem gallin_comprehension_and_bf_imply_weak_rigid_comprehension : Statements.gallin_comprehension_and_bf_imply_weak_rigid_comprehension := by
  map_cert Meta.gallin_comprehension_and_bf_imply_weak_rigid_comprehension

/-- `gallin-comprehension-implies-nd` -/
theorem gallin_comprehension_implies_nd : Statements.gallin_comprehension_implies_nd := by
  map_cert Proofs.gallin_comprehension_implies_nd.entails

/-- `inextensible-comprehension-r-implies-weakly-inextensible-comprehension-r` -/
theorem inextensible_comprehension_r_implies_weakly_inextensible_comprehension_r : Statements.inextensible_comprehension_r_implies_weakly_inextensible_comprehension_r := by
  map_cert Proofs.inextensible_comprehension_r_implies_weakly_inextensible_comprehension_r.entails

/-- `logical-necessity-r-implies-no-pure-contingency-r` -/
theorem logical_necessity_r_implies_no_pure_contingency_r : Statements.logical_necessity_r_implies_no_pure_contingency_r := by
  map_cert_sig (Entails.to_pureVersion_noContingency logicalNecessity_entails_npc)

/-- `logical-necessity-r-implies-witnessed-possibility-r` -/
theorem logical_necessity_r_implies_witnessed_possibility_r : Statements.logical_necessity_r_implies_witnessed_possibility_r := by
  map_cert_sig logicalNecessity_entails_witnessedPossibility

/-- `maximalist-distinctness-incompatible-with-nd` -/
theorem maximalist_distinctness_incompatible_with_nd : Statements.maximalist_distinctness_incompatible_with_nd := by
  map_cert_incompatible maximalist_nd_inconsistent

/-- `maximalist-distinctness-incompatible-with-necessary-actuality` -/
theorem maximalist_distinctness_incompatible_with_necessary_actuality : Statements.maximalist_distinctness_incompatible_with_necessary_actuality := by
  map_cert_incompatible maximalist_necActuality_inconsistent

/-- `maximalist-distinctness-incompatible-with-necessary-atomicity-r` -/
theorem maximalist_distinctness_incompatible_with_necessary_atomicity_r : Statements.maximalist_distinctness_incompatible_with_necessary_atomicity_r := by
  map_cert_incompatible
    (not_consistent_mono (B := maximalist ∪ P.NecAtomicity.schema)
      (union_subset_union_right (A := maximalist) (B := AxiomSet.box P.Atomicity.schema)
        (B' := P.NecAtomicity.schema) (by map_box)) maximalist_necAtomicity_inconsistent)

/-- `maximalist-distinctness-incompatible-with-necessary-atomicity-t` -/
theorem maximalist_distinctness_incompatible_with_necessary_atomicity_t : Statements.maximalist_distinctness_incompatible_with_necessary_atomicity_t := by
  map_cert_incompatible maximalist_necAtomicityT_inconsistent

/-- `maximalist-distinctness-incompatible-with-necessary-barcan-r` -/
theorem maximalist_distinctness_incompatible_with_necessary_barcan_r : Statements.maximalist_distinctness_incompatible_with_necessary_barcan_r := by
  map_cert_incompatible
    (not_consistent_mono (B := maximalist ∪ P.NecBarcan.schema)
      (union_subset_union_right (A := maximalist) (B := AxiomSet.box P.Barcan.schema)
        (B' := P.NecBarcan.schema) (by map_box)) maximalist_necBarcan_inconsistent)

/-- `maximalist-distinctness-incompatible-with-necessary-boolean-completeness-r` -/
theorem maximalist_distinctness_incompatible_with_necessary_boolean_completeness_r : Statements.maximalist_distinctness_incompatible_with_necessary_boolean_completeness_r := by
  map_cert_incompatible maximalist_necBooleanCompleteness_inconsistent'

/-- `maximalist-distinctness-incompatible-with-necessary-functionality-r` -/
theorem maximalist_distinctness_incompatible_with_necessary_functionality_r : Statements.maximalist_distinctness_incompatible_with_necessary_functionality_r := by
  map_cert_incompatible maximalist_necFunctionality_inconsistent

/-- `maximalist-distinctness-incompatible-with-necessary-rigid-comprehension-r` -/
theorem maximalist_distinctness_incompatible_with_necessary_rigid_comprehension_r : Statements.maximalist_distinctness_incompatible_with_necessary_rigid_comprehension_r := by
  map_cert_incompatible maximalist_necRigidComprehension_inconsistent

/-- `maximalist-distinctness-incompatible-with-necessary-tractarianism-r` -/
theorem maximalist_distinctness_incompatible_with_necessary_tractarianism_r : Statements.maximalist_distinctness_incompatible_with_necessary_tractarianism_r := by
  map_cert_incompatible
    (not_consistent_mono (B := maximalist ∪ P.NecTractarianism.schema)
      (union_subset_union_right (A := maximalist) (B := AxiomSet.box P.Tractarianism.schema)
        (B' := P.NecTractarianism.schema) (by map_box)) maximalist_necTractarianism_inconsistent)

/-- `modal-b-implies-distinctness-necessary-r` -/
theorem modal_b_implies_distinctness_necessary_r : Statements.modal_b_implies_distinctness_necessary_r := by
  map_cert Proofs.modal_b_implies_distinctness_necessary_r.entails

/-- `modal-b-implies-pure-b-r` -/
theorem modal_b_implies_pure_b_r : Statements.modal_b_implies_pure_b_r := by
  map_cert_sig (Entails.to_pureVersion_signatureB (Entails.ofPure modalB_entails_pureB))

/-- `modal-b-implies-signature-b-r` -/
theorem modal_b_implies_signature_b_r : Statements.modal_b_implies_signature_b_r := by
  map_cert_sig modalB_entails_signatureB

/-- `modal-five-implies-modal-b` -/
theorem modal_five_implies_modal_b : Statements.modal_five_implies_modal_b := by
  map_cert Proofs.modal_five_implies_modal_b.entails

/-- `modal-freedom-signature-r-implies-no-pure-contingency-r` -/
theorem modal_freedom_signature_r_implies_no_pure_contingency_r : Statements.modal_freedom_signature_r_implies_no_pure_contingency_r := by
  map_cert_sig (Entails.to_pureVersion_noContingency modalFreedom_entails_npc)

/-- `nd-and-bf-imply-necessary-nd` -/
theorem nd_and_bf_imply_necessary_nd : Statements.nd_and_bf_imply_necessary_nd := by
  map_cert Proofs.nd_and_bf_imply_necessary_nd.entails

/-- `necessary-actuality-and-necessary-bf-t-imply-necessary-strong-actuality` -/
theorem necessary_actuality_and_necessary_bf_t_imply_necessary_strong_actuality : Statements.necessary_actuality_and_necessary_bf_t_imply_necessary_strong_actuality := by
  map_cert Proofs.necessary_actuality_and_necessary_bf_t_imply_necessary_strong_actuality.entails

/-- `necessary-actuality-implies-actuality` -/
theorem necessary_actuality_implies_actuality : Statements.necessary_actuality_implies_actuality := by
  map_cert Proofs.necessary_actuality_implies_actuality.entails

/-- `necessary-actuality-implies-necessary-transversal` -/
theorem necessary_actuality_implies_necessary_transversal : Statements.necessary_actuality_implies_necessary_transversal := by
  map_cert Proofs.necessary_actuality_implies_necessary_transversal.entails

/-- `necessary-actuality-implies-necessary-vicinity` -/
theorem necessary_actuality_implies_necessary_vicinity : Statements.necessary_actuality_implies_necessary_vicinity := by
  map_cert Proofs.necessary_actuality_implies_necessary_vicinity.entails

/-- `necessary-actuality-implies-necessary-weakly-inextensible-comprehension-r` -/
theorem necessary_actuality_implies_necessary_weakly_inextensible_comprehension_r : Statements.necessary_actuality_implies_necessary_weakly_inextensible_comprehension_r := by
  map_cert Meta.necessary_actuality_implies_necessary_weakly_inextensible_comprehension_r

/-- `necessary-atomicity-and-necessary-bf-imply-necessary-strong-atomicity` -/
theorem necessary_atomicity_and_necessary_bf_imply_necessary_strong_atomicity : Statements.necessary_atomicity_and_necessary_bf_imply_necessary_strong_atomicity := by
  map_cert Meta.necessary_atomicity_and_necessary_bf_imply_necessary_strong_atomicity

/-- `necessary-atomicity-and-necessary-bf-t-imply-necessary-strong-atomicity-t` -/
theorem necessary_atomicity_and_necessary_bf_t_imply_necessary_strong_atomicity_t : Statements.necessary_atomicity_and_necessary_bf_t_imply_necessary_strong_atomicity_t := by
  map_cert Proofs.necessary_atomicity_and_necessary_bf_t_imply_necessary_strong_atomicity_t.entails

/-- `necessary-atomicity-r-implies-atomicity-r` -/
theorem necessary_atomicity_r_implies_atomicity_r : Statements.necessary_atomicity_r_implies_atomicity_r := by
  map_cert Proofs.necessary_atomicity_r_implies_atomicity_r.entails

/-- `necessary-barcan-r-implies-barcan-r` -/
theorem necessary_barcan_r_implies_barcan_r : Statements.necessary_barcan_r_implies_barcan_r := by
  map_cert Proofs.necessary_barcan_r_implies_barcan_r.entails

/-- `necessary-barcan-r-implies-necessary-barcan-t` -/
theorem necessary_barcan_r_implies_necessary_barcan_t : Statements.necessary_barcan_r_implies_necessary_barcan_t := by
  map_cert Proofs.necessary_barcan_r_implies_necessary_barcan_t.entails

/-- `necessary-barcan-r-implies-necessary-functionality-r` -/
theorem necessary_barcan_r_implies_necessary_functionality_r : Statements.necessary_barcan_r_implies_necessary_functionality_r := by
  map_cert Proofs.necessary_barcan_r_implies_necessary_functionality_r.entails

/-- `necessary-barcan-t-implies-barcan-t` -/
theorem necessary_barcan_t_implies_barcan_t : Statements.necessary_barcan_t_implies_barcan_t := by
  map_cert Proofs.necessary_barcan_t_implies_barcan_t.entails

/-- `necessary-bf-and-actuality-imply-inextensible-comprehension` -/
theorem necessary_bf_and_actuality_imply_inextensible_comprehension : Statements.necessary_bf_and_actuality_imply_inextensible_comprehension := by
  map_cert Meta.necessary_bf_and_actuality_imply_inextensible_comprehension

/-- `necessary-boolean-completeness-r-implies-boolean-completeness-r` -/
theorem necessary_boolean_completeness_r_implies_boolean_completeness_r : Statements.necessary_boolean_completeness_r_implies_boolean_completeness_r := by
  map_cert Proofs.necessary_boolean_completeness_r_implies_boolean_completeness_r.entails

/-- `necessary-distinctness-necessary-r-implies-distinctness-necessary-r` -/
theorem necessary_distinctness_necessary_r_implies_distinctness_necessary_r : Statements.necessary_distinctness_necessary_r_implies_distinctness_necessary_r := by
  map_cert Proofs.necessary_distinctness_necessary_r_implies_distinctness_necessary_r.entails

/-- `necessary-distinctness-necessary-r-implies-necessary-barcan-r` -/
theorem necessary_distinctness_necessary_r_implies_necessary_barcan_r : Statements.necessary_distinctness_necessary_r_implies_necessary_barcan_r := by
  map_cert Proofs.necessary_distinctness_necessary_r_implies_necessary_barcan_r.entails

/-- `necessary-distinctness-necessary-r-implies-necessary-distinctness-necessary-t` -/
theorem necessary_distinctness_necessary_r_implies_necessary_distinctness_necessary_t : Statements.necessary_distinctness_necessary_r_implies_necessary_distinctness_necessary_t := by
  map_cert Proofs.necessary_distinctness_necessary_r_implies_necessary_distinctness_necessary_t.entails

/-- `necessary-distinctness-necessary-r-implies-necessary-modal-five` -/
theorem necessary_distinctness_necessary_r_implies_necessary_modal_five : Statements.necessary_distinctness_necessary_r_implies_necessary_modal_five := by
  map_cert Proofs.necessary_distinctness_necessary_r_implies_necessary_modal_five.entails

/-- `necessary-distinctness-necessary-t-implies-distinctness-necessary-t` -/
theorem necessary_distinctness_necessary_t_implies_distinctness_necessary_t : Statements.necessary_distinctness_necessary_t_implies_distinctness_necessary_t := by
  map_cert Proofs.necessary_distinctness_necessary_t_implies_distinctness_necessary_t.entails

/-- `necessary-distinctness-necessary-t-implies-necessary-distinctness-necessary-r` -/
theorem necessary_distinctness_necessary_t_implies_necessary_distinctness_necessary_r : Statements.necessary_distinctness_necessary_t_implies_necessary_distinctness_necessary_r := by
  map_cert Proofs.necessary_distinctness_necessary_t_implies_necessary_distinctness_necessary_r.entails

/-- `necessary-distinctness-necessary-t-implies-necessary-vicinity` -/
theorem necessary_distinctness_necessary_t_implies_necessary_vicinity : Statements.necessary_distinctness_necessary_t_implies_necessary_vicinity := by
  map_cert Proofs.necessary_distinctness_necessary_t_implies_necessary_vicinity.entails

/-- `necessary-extensionality-r-implies-extensionality-r` -/
theorem necessary_extensionality_r_implies_extensionality_r : Statements.necessary_extensionality_r_implies_extensionality_r := by
  map_cert Proofs.necessary_extensionality_r_implies_extensionality_r.entails

/-- `necessary-fregean-axiom-implies-fregean-axiom` -/
theorem necessary_fregean_axiom_implies_fregean_axiom : Statements.necessary_fregean_axiom_implies_fregean_axiom := by
  map_cert Proofs.necessary_fregean_axiom_implies_fregean_axiom.entails

/-- `necessary-functional-choice-r-implies-functional-choice-r` -/
theorem necessary_functional_choice_r_implies_functional_choice_r : Statements.necessary_functional_choice_r_implies_functional_choice_r := by
  map_cert Proofs.necessary_functional_choice_r_implies_functional_choice_r.entails

/-- `necessary-functional-choice-r-implies-necessary-plenitude-r` -/
theorem necessary_functional_choice_r_implies_necessary_plenitude_r : Statements.necessary_functional_choice_r_implies_necessary_plenitude_r := by
  map_cert Proofs.necessary_functional_choice_r_implies_necessary_plenitude_r.entails

/-- `necessary-functional-choice-r-implies-necessary-relational-choice-r` -/
theorem necessary_functional_choice_r_implies_necessary_relational_choice_r : Statements.necessary_functional_choice_r_implies_necessary_relational_choice_r := by
  map_cert Proofs.necessary_functional_choice_r_implies_necessary_relational_choice_r.entails

/-- `necessary-functionality-r-implies-functionality-r` -/
theorem necessary_functionality_r_implies_functionality_r : Statements.necessary_functionality_r_implies_functionality_r := by
  map_cert Proofs.necessary_functionality_r_implies_functionality_r.entails

/-- `necessary-functionality-r-implies-necessary-tractarianism-r` -/
theorem necessary_functionality_r_implies_necessary_tractarianism_r : Statements.necessary_functionality_r_implies_necessary_tractarianism_r := by
  map_cert Proofs.necessary_functionality_r_implies_necessary_tractarianism_r.entails

/-- `necessary-gallin-comprehension-implies-gallin-comprehension` -/
theorem necessary_gallin_comprehension_implies_gallin_comprehension : Statements.necessary_gallin_comprehension_implies_gallin_comprehension := by
  map_cert Proofs.necessary_gallin_comprehension_implies_gallin_comprehension.entails

/-- `necessary-gallin-comprehension-implies-necessary-nd` -/
theorem necessary_gallin_comprehension_implies_necessary_nd : Statements.necessary_gallin_comprehension_implies_necessary_nd := by
  map_cert Proofs.necessary_gallin_comprehension_implies_necessary_nd.entails

/-- `necessary-gallin-comprehension-implies-necessary-rigid-comprehension` -/
theorem necessary_gallin_comprehension_implies_necessary_rigid_comprehension : Statements.necessary_gallin_comprehension_implies_necessary_rigid_comprehension := by
  map_cert Meta.necessary_gallin_comprehension_implies_necessary_rigid_comprehension

/-- `necessary-modal-b-implies-modal-b` -/
theorem necessary_modal_b_implies_modal_b : Statements.necessary_modal_b_implies_modal_b := by
  map_cert Proofs.necessary_modal_b_implies_modal_b.entails

/-- `necessary-modal-b-implies-necessary-distinctness-necessary-r` -/
theorem necessary_modal_b_implies_necessary_distinctness_necessary_r : Statements.necessary_modal_b_implies_necessary_distinctness_necessary_r := by
  map_cert Proofs.necessary_modal_b_implies_necessary_distinctness_necessary_r.entails

/-- `necessary-modal-five-implies-modal-five` -/
theorem necessary_modal_five_implies_modal_five : Statements.necessary_modal_five_implies_modal_five := by
  map_cert Proofs.necessary_modal_five_implies_modal_five.entails

/-- `necessary-modal-five-implies-necessary-modal-b` -/
theorem necessary_modal_five_implies_necessary_modal_b : Statements.necessary_modal_five_implies_necessary_modal_b := by
  map_cert Proofs.necessary_modal_five_implies_necessary_modal_b.entails

/-- `necessary-nd-implies-bf` -/
theorem necessary_nd_implies_bf : Statements.necessary_nd_implies_bf := by
  map_cert Proofs.necessary_nd_implies_bf.entails

/-- `necessary-plenitude-r-implies-atomicity-r` -/
theorem necessary_plenitude_r_implies_atomicity_r : Statements.necessary_plenitude_r_implies_atomicity_r := by
  map_cert Meta.necessary_plenitude_r_implies_atomicity_r

/-- `necessary-plenitude-r-implies-necessary-actuality` -/
theorem necessary_plenitude_r_implies_necessary_actuality : Statements.necessary_plenitude_r_implies_necessary_actuality := by
  map_cert Proofs.necessary_plenitude_r_implies_necessary_actuality.entails

/-- `necessary-plenitude-r-implies-necessary-atomicity-r` -/
theorem necessary_plenitude_r_implies_necessary_atomicity_r : Statements.necessary_plenitude_r_implies_necessary_atomicity_r := by
  map_cert Meta.necessary_plenitude_r_implies_necessary_atomicity_r

/-- `necessary-plenitude-r-implies-necessary-distinctness-necessary-r` -/
theorem necessary_plenitude_r_implies_necessary_distinctness_necessary_r : Statements.necessary_plenitude_r_implies_necessary_distinctness_necessary_r := by
  map_cert Proofs.necessary_plenitude_r_implies_necessary_distinctness_necessary_r.entails

/-- `necessary-plenitude-r-implies-plenitude-r` -/
theorem necessary_plenitude_r_implies_plenitude_r : Statements.necessary_plenitude_r_implies_plenitude_r := by
  map_cert Proofs.necessary_plenitude_r_implies_plenitude_r.entails

/-- `necessary-relational-choice-and-necessary-plenitude-imply-necessary-functional-choice` -/
theorem necessary_relational_choice_and_necessary_plenitude_imply_necessary_functional_choice : Statements.necessary_relational_choice_and_necessary_plenitude_imply_necessary_functional_choice := by
  map_cert Proofs.necessary_relational_choice_and_necessary_plenitude_imply_necessary_functional_choice.entails

/-- `necessary-relational-choice-r-implies-relational-choice-r` -/
theorem necessary_relational_choice_r_implies_relational_choice_r : Statements.necessary_relational_choice_r_implies_relational_choice_r := by
  map_cert Proofs.necessary_relational_choice_r_implies_relational_choice_r.entails

/-- `necessary-rigid-comprehension-r-implies-necessary-actuality` -/
theorem necessary_rigid_comprehension_r_implies_necessary_actuality : Statements.necessary_rigid_comprehension_r_implies_necessary_actuality := by
  map_cert Proofs.necessary_rigid_comprehension_r_implies_necessary_actuality.entails

/-- `necessary-rigid-comprehension-r-implies-necessary-boolean-completeness-r` -/
theorem necessary_rigid_comprehension_r_implies_necessary_boolean_completeness_r : Statements.necessary_rigid_comprehension_r_implies_necessary_boolean_completeness_r := by
  map_cert Meta.necessary_rigid_comprehension_r_implies_necessary_boolean_completeness_r

/-- `necessary-rigid-comprehension-r-implies-rigid-comprehension-r` -/
theorem necessary_rigid_comprehension_r_implies_rigid_comprehension_r : Statements.necessary_rigid_comprehension_r_implies_rigid_comprehension_r := by
  map_cert Proofs.necessary_rigid_comprehension_r_implies_rigid_comprehension_r.entails

/-- `necessary-strong-actuality-implies-necessary-actuality` -/
theorem necessary_strong_actuality_implies_necessary_actuality : Statements.necessary_strong_actuality_implies_necessary_actuality := by
  map_cert Proofs.necessary_strong_actuality_implies_necessary_actuality.entails

/-- `necessary-strong-actuality-implies-strong-actuality` -/
theorem necessary_strong_actuality_implies_strong_actuality : Statements.necessary_strong_actuality_implies_strong_actuality := by
  map_cert Proofs.necessary_strong_actuality_implies_strong_actuality.entails

/-- `necessary-strong-atomicity-implies-necessary-atomicity` -/
theorem necessary_strong_atomicity_implies_necessary_atomicity : Statements.necessary_strong_atomicity_implies_necessary_atomicity := by
  map_cert Meta.necessary_strong_atomicity_implies_necessary_atomicity

/-- `necessary-strong-atomicity-r-implies-necessary-strong-atomicity-t` -/
theorem necessary_strong_atomicity_r_implies_necessary_strong_atomicity_t : Statements.necessary_strong_atomicity_r_implies_necessary_strong_atomicity_t := by
  map_cert Proofs.necessary_strong_atomicity_r_implies_necessary_strong_atomicity_t.entails

/-- `necessary-strong-atomicity-r-implies-strong-atomicity-r` -/
theorem necessary_strong_atomicity_r_implies_strong_atomicity_r : Statements.necessary_strong_atomicity_r_implies_strong_atomicity_r := by
  map_cert Proofs.necessary_strong_atomicity_r_implies_strong_atomicity_r.entails

/-- `necessary-strong-atomicity-t-and-necessary-bf-imply-necessary-strong-atomicity` -/
theorem necessary_strong_atomicity_t_and_necessary_bf_imply_necessary_strong_atomicity : Statements.necessary_strong_atomicity_t_and_necessary_bf_imply_necessary_strong_atomicity := by
  map_cert Meta.necessary_strong_atomicity_t_and_necessary_bf_imply_necessary_strong_atomicity

/-- `necessary-strong-atomicity-t-implies-necessary-strong-actuality` -/
theorem necessary_strong_atomicity_t_implies_necessary_strong_actuality : Statements.necessary_strong_atomicity_t_implies_necessary_strong_actuality := by
  map_cert Proofs.necessary_strong_atomicity_t_implies_necessary_strong_actuality.entails

/-- `necessary-strong-atomicity-t-implies-strong-atomicity-t` -/
theorem necessary_strong_atomicity_t_implies_strong_atomicity_t : Statements.necessary_strong_atomicity_t_implies_strong_atomicity_t := by
  map_cert Proofs.necessary_strong_atomicity_t_implies_strong_atomicity_t.entails

/-- `necessary-tractarianism-r-implies-necessary-barcan-r` -/
theorem necessary_tractarianism_r_implies_necessary_barcan_r : Statements.necessary_tractarianism_r_implies_necessary_barcan_r := by
  map_cert Proofs.necessary_tractarianism_r_implies_necessary_barcan_r.entails

/-- `necessary-tractarianism-r-implies-tractarianism-r` -/
theorem necessary_tractarianism_r_implies_tractarianism_r : Statements.necessary_tractarianism_r_implies_tractarianism_r := by
  map_cert Proofs.necessary_tractarianism_r_implies_tractarianism_r.entails

/-- `necessary-transversal-and-necessary-relational-choice-imply-necessary-transversal-choice` -/
theorem necessary_transversal_and_necessary_relational_choice_imply_necessary_transversal_choice : Statements.necessary_transversal_and_necessary_relational_choice_imply_necessary_transversal_choice := by
  map_cert Proofs.necessary_transversal_and_necessary_relational_choice_imply_necessary_transversal_choice.entails

/-- `necessary-transversal-choice-r-implies-necessary-relational-choice-r` -/
theorem necessary_transversal_choice_r_implies_necessary_relational_choice_r : Statements.necessary_transversal_choice_r_implies_necessary_relational_choice_r := by
  map_cert Proofs.necessary_transversal_choice_r_implies_necessary_relational_choice_r.entails

/-- `necessary-transversal-choice-r-implies-necessary-transversal-r` -/
theorem necessary_transversal_choice_r_implies_necessary_transversal_r : Statements.necessary_transversal_choice_r_implies_necessary_transversal_r := by
  map_cert Proofs.necessary_transversal_choice_r_implies_necessary_transversal_r.entails

/-- `necessary-transversal-choice-r-implies-transversal-choice-r` -/
theorem necessary_transversal_choice_r_implies_transversal_choice_r : Statements.necessary_transversal_choice_r_implies_transversal_choice_r := by
  map_cert Proofs.necessary_transversal_choice_r_implies_transversal_choice_r.entails

/-- `necessary-transversal-r-implies-transversal-r` -/
theorem necessary_transversal_r_implies_transversal_r : Statements.necessary_transversal_r_implies_transversal_r := by
  map_cert Proofs.necessary_transversal_r_implies_transversal_r.entails

/-- `necessary-vicinity-and-necessary-weakly-inextensible-comprehension-imply-necessary-actuality` -/
theorem necessary_vicinity_and_necessary_weakly_inextensible_comprehension_imply_necessary_actuality : Statements.necessary_vicinity_and_necessary_weakly_inextensible_comprehension_imply_necessary_actuality := by
  map_cert Proofs.necessary_vicinity_and_necessary_weakly_inextensible_comprehension_imply_necessary_actuality.entails

/-- `necessary-vicinity-implies-vicinity` -/
theorem necessary_vicinity_implies_vicinity : Statements.necessary_vicinity_implies_vicinity := by
  map_cert Proofs.necessary_vicinity_implies_vicinity.entails

/-- `necessary-weakly-inextensible-comprehension-r-implies-weakly-inextensible-comprehension-r` -/
theorem necessary_weakly_inextensible_comprehension_r_implies_weakly_inextensible_comprehension_r : Statements.necessary_weakly_inextensible_comprehension_r_implies_weakly_inextensible_comprehension_r := by
  map_cert Proofs.necessary_weakly_inextensible_comprehension_r_implies_weakly_inextensible_comprehension_r.entails

/-- `no-contingency-signature-incompatible-with-witnessed-possibility` -/
theorem no_contingency_signature_incompatible_with_witnessed_possibility : Statements.no_contingency_signature_incompatible_with_witnessed_possibility :=
  fun hS _ h₁ h₂ hc => noContingency_witnessedPossibility_inconsistent hS (Consistent.of_entails (Entails.union h₁ h₂) hc)

/-- `no-contingency-signature-r-implies-modal-freedom-signature-r` -/
theorem no_contingency_signature_r_implies_modal_freedom_signature_r : Statements.no_contingency_signature_r_implies_modal_freedom_signature_r := by
  map_cert_sig noContingency_entails_modalFreedom

/-- `no-contingency-signature-r-implies-no-pure-contingency-r` -/
theorem no_contingency_signature_r_implies_no_pure_contingency_r : Statements.no_contingency_signature_r_implies_no_pure_contingency_r := by
  map_cert_sig (Entails.to_pureVersion_noContingency
    (Entails.mono_right npc_ofPure_subset noContingency_entails_npc))

/-- `no-contingency-signature-r-implies-signature-b-r` -/
theorem no_contingency_signature_r_implies_signature_b_r : Statements.no_contingency_signature_r_implies_signature_b_r := by
  map_cert_sig noContingency_entails_signatureB

/-- `no-pure-contingency-and-actuality-imply-necessary-actuality` -/
theorem no_pure_contingency_and_actuality_imply_necessary_actuality : Statements.no_pure_contingency_and_actuality_imply_necessary_actuality := by
  map_cert npc_actuality_entails_necActuality

/-- `no-pure-contingency-and-atomicity-imply-necessary-atomicity` -/
theorem no_pure_contingency_and_atomicity_imply_necessary_atomicity : Statements.no_pure_contingency_and_atomicity_imply_necessary_atomicity := by
  map_cert (Entails.mono_right (Ax₃ := P.NecAtomicity.schema) (by map_box) npc_atomicity_entails_box)

/-- `no-pure-contingency-and-b-imply-necessary-b` -/
theorem no_pure_contingency_and_b_imply_necessary_b : Statements.no_pure_contingency_and_b_imply_necessary_b := by
  map_cert (Entails.mono_right (Ax₃ := P.NecModalB.schema) (by map_box) (npc_union_entails_box_pure P.ModalB.schema_closedTypes))

/-- `no-pure-contingency-and-bf-imply-necessary-bf` -/
theorem no_pure_contingency_and_bf_imply_necessary_bf : Statements.no_pure_contingency_and_bf_imply_necessary_bf := by
  map_cert (Entails.mono_right (Ax₃ := P.NecBarcan.schema) (by map_box) npc_barcan_entails_box)

/-- `no-pure-contingency-and-bf-t-imply-necessary-bf-t` -/
theorem no_pure_contingency_and_bf_t_imply_necessary_bf_t : Statements.no_pure_contingency_and_bf_t_imply_necessary_bf_t := by
  map_cert npc_barcanT_entails_necBarcanT

/-- `no-pure-contingency-and-completeness-imply-necessary-completeness` -/
theorem no_pure_contingency_and_completeness_imply_necessary_completeness : Statements.no_pure_contingency_and_completeness_imply_necessary_completeness := by
  map_cert (Entails.mono_right (Ax₃ := P.NecBooleanCompleteness.schema) (by map_box) npc_booleanCompleteness_entails_box)

/-- `no-pure-contingency-and-extensionality-imply-necessary-extensionality` -/
theorem no_pure_contingency_and_extensionality_imply_necessary_extensionality : Statements.no_pure_contingency_and_extensionality_imply_necessary_extensionality := by
  map_cert (Entails.mono_right (Ax₃ := P.NecExtensionality.schema) (by map_box) (npc_union_entails_box_pure P.Extensionality.schema_closedTypes))

/-- `no-pure-contingency-and-five-imply-necessary-five` -/
theorem no_pure_contingency_and_five_imply_necessary_five : Statements.no_pure_contingency_and_five_imply_necessary_five := by
  map_cert (Entails.mono_right (Ax₃ := P.NecModalFive.schema) (by map_box) (npc_union_entails_box_pure P.ModalFive.schema_closedTypes))

/-- `no-pure-contingency-and-fregean-imply-necessary-fregean` -/
theorem no_pure_contingency_and_fregean_imply_necessary_fregean : Statements.no_pure_contingency_and_fregean_imply_necessary_fregean := by
  map_cert (Entails.mono_right (Ax₃ := P.NecFregeanAxiom.schema) (by map_box) npc_fregean_entails_box)

/-- `no-pure-contingency-and-functional-choice-imply-necessary-functional-choice` -/
theorem no_pure_contingency_and_functional_choice_imply_necessary_functional_choice : Statements.no_pure_contingency_and_functional_choice_imply_necessary_functional_choice := by
  map_cert (Entails.mono_right (Ax₃ := P.NecFunctionalChoice.schema) (by map_box) (npc_union_entails_box_pure P.FunctionalChoice.schema_closedTypes))

/-- `no-pure-contingency-and-functionality-imply-necessary-functionality` -/
theorem no_pure_contingency_and_functionality_imply_necessary_functionality : Statements.no_pure_contingency_and_functionality_imply_necessary_functionality := by
  map_cert (Entails.mono_right (Ax₃ := P.NecFunctionality.schema) (by map_box) (npc_union_entails_box_pure P.Functionality.schema_closedTypes))

/-- `no-pure-contingency-and-gallin-comprehension-imply-necessary-gallin-comprehension` -/
theorem no_pure_contingency_and_gallin_comprehension_imply_necessary_gallin_comprehension : Statements.no_pure_contingency_and_gallin_comprehension_imply_necessary_gallin_comprehension := by
  map_cert (Entails.mono_right (Ax₃ := P.NecGallinExtensionalComprehension.schema) (by map_box) (npc_union_entails_box_pure P.GallinExtensionalComprehension.schema_closedTypes))

/-- `no-pure-contingency-and-nd-imply-necessary-nd` -/
theorem no_pure_contingency_and_nd_imply_necessary_nd : Statements.no_pure_contingency_and_nd_imply_necessary_nd := by
  map_cert (Entails.mono_right (Ax₃ := P.NecNecessityOfDistinctness.schema) (by map_box) npc_nd_entails_box)

/-- `no-pure-contingency-and-nd-t-imply-necessary-nd-t` -/
theorem no_pure_contingency_and_nd_t_imply_necessary_nd_t : Statements.no_pure_contingency_and_nd_t_imply_necessary_nd_t := by
  map_cert npc_ndT_entails_necNdT

/-- `no-pure-contingency-and-plenitude-imply-necessary-plenitude` -/
theorem no_pure_contingency_and_plenitude_imply_necessary_plenitude : Statements.no_pure_contingency_and_plenitude_imply_necessary_plenitude := by
  map_cert (Entails.mono_right (Ax₃ := P.NecPlenitude.schema) (by map_box) (npc_union_entails_box_pure P.Plenitude.schema_closedTypes))

/-- `no-pure-contingency-and-relational-choice-imply-necessaryelational-choice` -/
theorem no_pure_contingency_and_relational_choice_imply_necessaryelational_choice : Statements.no_pure_contingency_and_relational_choice_imply_necessaryelational_choice := by
  map_cert (Entails.mono_right (Ax₃ := P.NecRelationalChoice.schema) (by map_box) (npc_union_entails_box_pure P.RelationalChoice.schema_closedTypes))

/-- `no-pure-contingency-and-rigid-comprehension-imply-necessary-rigid-comprehension` -/
theorem no_pure_contingency_and_rigid_comprehension_imply_necessary_rigid_comprehension : Statements.no_pure_contingency_and_rigid_comprehension_imply_necessary_rigid_comprehension := by
  map_cert (Entails.mono_right (Ax₃ := P.NecRigidComprehension.schema) (by map_box) (npc_union_entails_box_pure P.RigidComprehension.schema_closedTypes))

/-- `no-pure-contingency-and-strong-actuality-imply-necessary-strong-actuality` -/
theorem no_pure_contingency_and_strong_actuality_imply_necessary_strong_actuality : Statements.no_pure_contingency_and_strong_actuality_imply_necessary_strong_actuality := by
  map_cert npc_strongActuality_entails_necStrongActuality

/-- `no-pure-contingency-and-strong-atomicity-imply-necessary-strong-atomicity` -/
theorem no_pure_contingency_and_strong_atomicity_imply_necessary_strong_atomicity : Statements.no_pure_contingency_and_strong_atomicity_imply_necessary_strong_atomicity := by
  map_cert (Entails.mono_right (Ax₃ := P.NecStrongAtomicity.schema) (by map_box) (npc_union_entails_box_pure P.StrongAtomicity.schema_closedTypes))

/-- `no-pure-contingency-and-strong-atomicity-t-imply-necessary-strong-atomicity-t` -/
theorem no_pure_contingency_and_strong_atomicity_t_imply_necessary_strong_atomicity_t : Statements.no_pure_contingency_and_strong_atomicity_t_imply_necessary_strong_atomicity_t := by
  map_cert (Entails.mono_right (Ax₃ := P.NecStrongAtomicityT.schema) (by map_box) (npc_union_entails_box_pure P.StrongAtomicityT.schema_closedTypes))

/-- `no-pure-contingency-and-tractarianism-imply-necessary-tractarianism` -/
theorem no_pure_contingency_and_tractarianism_imply_necessary_tractarianism : Statements.no_pure_contingency_and_tractarianism_imply_necessary_tractarianism := by
  map_cert (Entails.mono_right (Ax₃ := P.NecTractarianism.schema) (by map_box) (npc_union_entails_box_pure P.Tractarianism.schema_closedTypes))

/-- `no-pure-contingency-and-transversal-choice-imply-necessary-transversal-choice` -/
theorem no_pure_contingency_and_transversal_choice_imply_necessary_transversal_choice : Statements.no_pure_contingency_and_transversal_choice_imply_necessary_transversal_choice := by
  map_cert npc_transversalChoice_entails_necTransversalChoice

/-- `no-pure-contingency-and-transversal-imply-necessary-transversal` -/
theorem no_pure_contingency_and_transversal_imply_necessary_transversal : Statements.no_pure_contingency_and_transversal_imply_necessary_transversal := by
  map_cert npc_transversal_entails_necTransversal

/-- `no-pure-contingency-and-vicinity-imply-necessary-vicinity` -/
theorem no_pure_contingency_and_vicinity_imply_necessary_vicinity : Statements.no_pure_contingency_and_vicinity_imply_necessary_vicinity := by
  map_cert npc_vicinity_entails_necVicinity

/-- `no-pure-contingency-and-weakly-inextensible-comprehension-imply-necessary-weakly-inextensible-comprehension` -/
theorem no_pure_contingency_and_weakly_inextensible_comprehension_imply_necessary_weakly_inextensible_comprehension : Statements.no_pure_contingency_and_weakly_inextensible_comprehension_imply_necessary_weakly_inextensible_comprehension := by
  map_cert npc_weaklyInextensibleComprehension_entails_box

/-- `no-pure-contingency-r-implies-converse-witnessed-possibility-r` -/
theorem no_pure_contingency_r_implies_converse_witnessed_possibility_r : Statements.no_pure_contingency_r_implies_converse_witnessed_possibility_r := by
  map_cert_sig npc_entails_converseWitnessedPossibility

/-- `no-pure-contingency-r-implies-pure-b-r` -/
theorem no_pure_contingency_r_implies_pure_b_r : Statements.no_pure_contingency_r_implies_pure_b_r := by
  map_cert_sig (Entails.to_pureVersion_signatureB
    (Entails.ofPure (npc_entails_pureB (Sig := Signature.pure))))

/-- `persistent-comprehension-r-implies-actuality` -/
theorem persistent_comprehension_r_implies_actuality : Statements.persistent_comprehension_r_implies_actuality := by
  map_cert Proofs.persistent_comprehension_r_implies_actuality.entails

/-- `plenitude-r-implies-actuality` -/
theorem plenitude_r_implies_actuality : Statements.plenitude_r_implies_actuality := by
  map_cert Proofs.plenitude_r_implies_actuality.entails

/-- `plenitude-r-implies-distinctness-necessary-r` -/
theorem plenitude_r_implies_distinctness_necessary_r : Statements.plenitude_r_implies_distinctness_necessary_r := by
  map_cert Proofs.plenitude_r_implies_distinctness_necessary_r.entails

/-- `possibility-and-necessary-barcan-t-incompatible` -/
theorem possibility_and_necessary_barcan_t_incompatible : Statements.possibility_and_necessary_barcan_t_incompatible := by
  map_cert_incompatible possibility_necBarcanT_inconsistent

/-- `possibility-and-necessary-rigid-power-incompatible` -/
theorem possibility_and_necessary_rigid_power_incompatible : Statements.possibility_and_necessary_rigid_power_incompatible := by
  map_cert_incompatible possibility_necRigidPower_inconsistent

/-- `possibility-and-no-pure-contingency-incompatible` -/
theorem possibility_and_no_pure_contingency_incompatible : Statements.possibility_and_no_pure_contingency_incompatible := by
  map_cert_incompatible possibility_schema_npc_inconsistent

/-- `possibility-plus-r-implies-possibility-schema-r` -/
theorem possibility_plus_r_implies_possibility_schema_r : Statements.possibility_plus_r_implies_possibility_schema_r := by
  map_cert (Entails.trans possibilityPlus_entails_possibility Meta.possibility_schema_r_implies_distinctness_schema_r)

/-- `possibility-plus-signature-r-implies-possibility-plus-r` -/
theorem possibility_plus_signature_r_implies_possibility_plus_r : Statements.possibility_plus_signature_r_implies_possibility_plus_r :=
  fun hS _ h => Entails.trans h (Entails.of_subset (ofPure_possibilityPlus_subset hS.1))

/-- `possibility-plus-signature-r-implies-possibility-signature-r` -/
theorem possibility_plus_signature_r_implies_possibility_signature_r : Statements.possibility_plus_signature_r_implies_possibility_signature_r := by
  map_cert_sig (Entails.trans possibilityPlusSig_entails_possibility
    Meta.possibility_signature_r_implies_distinctness_signature_r)

/-- `possibility-schema-r-implies-possible-infinity-e` -/
theorem possibility_schema_r_implies_possible_infinity_e : Statements.possibility_schema_r_implies_possible_infinity_e := by
  map_cert possibility_entails_possibleInfinityE

/-- `possible-infinity-e-and-bf-imply-axiom-of-infinity-e` -/
theorem possible_infinity_e_and_bf_imply_axiom_of_infinity_e : Statements.possible_infinity_e_and_bf_imply_axiom_of_infinity_e := by
  map_cert Proofs.possible_infinity_e_and_bf_imply_axiom_of_infinity_e.entails

/-- `possible-infinity-e-and-no-pure-contingency-imply-axiom-of-infinity-e` -/
theorem possible_infinity_e_and_no_pure_contingency_imply_axiom_of_infinity_e : Statements.possible_infinity_e_and_no_pure_contingency_imply_axiom_of_infinity_e := by
  map_cert npc_possibleInfinityE_entails_axiomOfInfinityE

/-- `possible-infinity-t-and-bf-t-imply-axiom-of-infinity-t` -/
theorem possible_infinity_t_and_bf_t_imply_axiom_of_infinity_t : Statements.possible_infinity_t_and_bf_t_imply_axiom_of_infinity_t := by
  map_cert Proofs.possible_infinity_t_and_bf_t_imply_axiom_of_infinity_t.entails

/-- `possible-infinity-t-and-no-pure-contingency-imply-axiom-of-infinity-t` -/
theorem possible_infinity_t_and_no_pure_contingency_imply_axiom_of_infinity_t : Statements.possible_infinity_t_and_no_pure_contingency_imply_axiom_of_infinity_t := by
  map_cert npc_possibleInfinityT_entails_axiomOfInfinityT

/-- `possibly-witnessed-possibility-r-implies-witnessed-possibility-r` -/
theorem possibly_witnessed_possibility_r_implies_witnessed_possibility_r : Statements.possibly_witnessed_possibility_r_implies_witnessed_possibility_r := by
  map_cert_sig possiblyWitnessedPossibility_entails_witnessedPossibility

/-- `pure-b-and-pure-possibility-incompatible` -/
theorem pure_b_and_pure_possibility_incompatible : Statements.pure_b_and_pure_possibility_incompatible := by
  map_cert_incompatible possibility_pureB_inconsistent

/-- `relational-choice-and-extensionality-imply-transversal-choice` -/
theorem relational_choice_and_extensionality_imply_transversal_choice : Statements.relational_choice_and_extensionality_imply_transversal_choice := by
  map_cert Proofs.relational_choice_and_extensionality_imply_transversal_choice.entails

/-- `relational-choice-and-plenitude-imply-functional-choice-r` -/
theorem relational_choice_and_plenitude_imply_functional_choice_r : Statements.relational_choice_and_plenitude_imply_functional_choice_r := by
  map_cert Proofs.relational_choice_and_plenitude_imply_functional_choice_r.entails

/-- `relational-choice-and-weak-rigid-comprehension-imply-transversal-choice` -/
theorem relational_choice_and_weak_rigid_comprehension_imply_transversal_choice : Statements.relational_choice_and_weak_rigid_comprehension_imply_transversal_choice := by
  map_cert Proofs.relational_choice_and_weak_rigid_comprehension_imply_transversal_choice.entails

/-- `rigid-comprehension-and-bf-imply-necessary-bf` -/
theorem rigid_comprehension_and_bf_imply_necessary_bf : Statements.rigid_comprehension_and_bf_imply_necessary_bf := by
  map_cert Proofs.rigid_comprehension_and_bf_imply_necessary_bf.entails

/-- `weak-rigid-comprehension-and-nd-imply-plenitude` -/
theorem weak_rigid_comprehension_and_nd_imply_plenitude : Statements.weak_rigid_comprehension_and_nd_imply_plenitude := by
  map_cert Meta.weak_rigid_comprehension_and_nd_imply_plenitude

/-- `rigid-comprehension-r-implies-actuality` -/
theorem rigid_comprehension_r_implies_actuality : Statements.rigid_comprehension_r_implies_actuality := by
  map_cert Proofs.rigid_comprehension_r_implies_actuality.entails

/-- `rigid-comprehension-r-implies-boolean-completeness-r` -/
theorem rigid_comprehension_r_implies_boolean_completeness_r : Statements.rigid_comprehension_r_implies_boolean_completeness_r := by
  map_cert Meta.rigid_comprehension_r_implies_boolean_completeness_r

/-- `rigid-comprehension-r-implies-inextensible-comprehension-r` -/
theorem rigid_comprehension_r_implies_inextensible_comprehension_r : Statements.rigid_comprehension_r_implies_inextensible_comprehension_r := by
  map_cert Proofs.rigid_comprehension_r_implies_inextensible_comprehension_r.entails

/-- `rigid-comprehension-r-implies-persistent-comprehension-r` -/
theorem rigid_comprehension_r_implies_persistent_comprehension_r : Statements.rigid_comprehension_r_implies_persistent_comprehension_r := by
  map_cert Proofs.rigid_comprehension_r_implies_persistent_comprehension_r.entails

/-- `rigid-comprehension-r-implies-weak-rigid-comprehension-r` -/
theorem rigid_comprehension_r_implies_weak_rigid_comprehension_r : Statements.rigid_comprehension_r_implies_weak_rigid_comprehension_r := by
  map_cert Proofs.rigid_comprehension_r_implies_weak_rigid_comprehension_r.entails

/-- `separated-structure-incompatible-with-nd` -/
theorem separated_structure_incompatible_with_nd : Statements.separated_structure_incompatible_with_nd :=
  fun hS _ h₁ h₂ hc => separatedStructure_nd_inconsistent hS (Consistent.of_entails (Entails.union h₁ h₂) hc)

/-- `signature-b-and-witnessed-possibility-incompatible` -/
theorem signature_b_and_witnessed_possibility_incompatible : Statements.signature_b_and_witnessed_possibility_incompatible :=
  fun hS _ h₁ h₂ hc => signatureB_witnessedPossibility_inconsistent hS (Consistent.of_entails (Entails.union h₁ h₂) hc)

/-- `signature-b-r-implies-pure-b-r` -/
theorem signature_b_r_implies_pure_b_r : Statements.signature_b_r_implies_pure_b_r := by
  map_cert_sig (Entails.to_pureVersion_signatureB
    (Entails.mono_right pureB_ofPure_subset signatureB_entails_pureB))

/-- `strong-actuality-implies-actuality` -/
theorem strong_actuality_implies_actuality : Statements.strong_actuality_implies_actuality := by
  map_cert Proofs.strong_actuality_implies_actuality.entails

/-- `strong-atomicity-r-implies-atomicity-r` -/
theorem strong_atomicity_r_implies_atomicity_r : Statements.strong_atomicity_r_implies_atomicity_r := by
  map_cert Meta.strong_atomicity_r_implies_atomicity_r

/-- `strong-atomicity-r-implies-strong-atomicity-t` -/
theorem strong_atomicity_r_implies_strong_atomicity_t : Statements.strong_atomicity_r_implies_strong_atomicity_t := by
  map_cert Proofs.strong_atomicity_r_implies_strong_atomicity_t.entails

/-- `strong-atomicity-t-implies-atomicity-t` -/
theorem strong_atomicity_t_implies_atomicity_t : Statements.strong_atomicity_t_implies_atomicity_t := by
  map_cert Proofs.strong_atomicity_t_implies_atomicity_t.entails

/-- `strong-atomicity-t-implies-necessary-actuality` -/
theorem strong_atomicity_t_implies_necessary_actuality : Statements.strong_atomicity_t_implies_necessary_actuality := by
  map_cert Proofs.strong_atomicity_t_implies_necessary_actuality.entails

/-- `strong-atomicity-t-implies-strong-actuality` -/
theorem strong_atomicity_t_implies_strong_actuality : Statements.strong_atomicity_t_implies_strong_actuality := by
  map_cert Proofs.strong_atomicity_t_implies_strong_actuality.entails

/-- `tractarianism-r-implies-barcan-r` -/
theorem tractarianism_r_implies_barcan_r : Statements.tractarianism_r_implies_barcan_r := by
  map_cert Proofs.tractarianism_r_implies_barcan_r.entails

/-- `transversal-and-relational-choice-imply-transversal-choice` -/
theorem transversal_and_relational_choice_imply_transversal_choice : Statements.transversal_and_relational_choice_imply_transversal_choice := by
  map_cert Proofs.transversal_and_relational_choice_imply_transversal_choice.entails

/-- `transversal-choice-r-implies-relational-choice-r` -/
theorem transversal_choice_r_implies_relational_choice_r : Statements.transversal_choice_r_implies_relational_choice_r := by
  map_cert Proofs.transversal_choice_r_implies_relational_choice_r.entails

/-- `transversal-choice-r-implies-transversal-r` -/
theorem transversal_choice_r_implies_transversal_r : Statements.transversal_choice_r_implies_transversal_r := by
  map_cert Proofs.transversal_choice_r_implies_transversal_r.entails

/-- `vicinity-and-distinctness-preserving-collapse-imply-actuality` -/
theorem vicinity_and_distinctness_preserving_collapse_imply_actuality : Statements.vicinity_and_distinctness_preserving_collapse_imply_actuality := by
  map_cert Proofs.vicinity_and_distinctness_preserving_collapse_imply_actuality.entails

/-- `vicinity-and-weakly-inextensible-comprehension-imply-actuality` -/
theorem vicinity_and_weakly_inextensible_comprehension_imply_actuality : Statements.vicinity_and_weakly_inextensible_comprehension_imply_actuality := by
  map_cert Proofs.vicinity_and_weakly_inextensible_comprehension_imply_actuality.entails

/-- `weak-rigid-comprehension-r-implies-boolean-completeness-r` -/
theorem weak_rigid_comprehension_r_implies_boolean_completeness_r : Statements.weak_rigid_comprehension_r_implies_boolean_completeness_r := by
  map_cert Meta.weak_rigid_comprehension_r_implies_boolean_completeness_r

/-- `weak-rigid-comprehension-r-implies-persistent-comprehension-r` -/
theorem weak_rigid_comprehension_r_implies_persistent_comprehension_r : Statements.weak_rigid_comprehension_r_implies_persistent_comprehension_r := by
  map_cert Proofs.weak_rigid_comprehension_r_implies_persistent_comprehension_r.entails

/-- `weak-rigid-comprehension-r-implies-weakly-inextensible-comprehension-r` -/
theorem weak_rigid_comprehension_r_implies_weakly_inextensible_comprehension_r : Statements.weak_rigid_comprehension_r_implies_weakly_inextensible_comprehension_r := by
  map_cert Proofs.weak_rigid_comprehension_r_implies_weakly_inextensible_comprehension_r.entails

/-! ## Equivalent forms -/

/-- `witnessed-possibility-and-no-pure-contingency-imply-logical-necessity` -/
theorem witnessed_possibility_and_no_pure_contingency_imply_logical_necessity : Statements.witnessed_possibility_and_no_pure_contingency_imply_logical_necessity := by
  map_cert_sig npc_witnessedPossibility_entails_logicalNecessity

/-- `witnessed-possibility-and-npc-imply-possibly-witnessed-possibility` -/
theorem witnessed_possibility_and_npc_imply_possibly_witnessed_possibility : Statements.witnessed_possibility_and_npc_imply_possibly_witnessed_possibility := by
  map_cert_sig npc_witnessedPossibility_entails_possiblyWitnessedPossibility

/-- `witnessed-possibility-incompatible-with-nd` -/
theorem witnessed_possibility_incompatible_with_nd : Statements.witnessed_possibility_incompatible_with_nd :=
  fun hS _ h₁ h₂ hc => witnessedPossibility_nd_inconsistent hS (Consistent.of_entails (Entails.union h₁ h₂) hc)

/-- `boolean-completeness-r`, variant `lub`: Boolean Completeness and its LUB form. -/
theorem boolean_completeness_r.lub : Statements.boolean_completeness_r.lub := by
  map_form P.BooleanCompleteness.to_lub.entails P.BooleanCompleteness.of_lub.entails

/-- `barcan-r`, variant `polyadic`: the principle for every list of argument types. -/
theorem barcan_r.polyadic : Statements.barcan_r.polyadic := by
  map_form P.Barcan.schema_entails_listSchema P.Barcan.listSchema_entails_schema

/-- `necessary-barcan-r`, variant `polyadic`: the principle for every list of argument types. -/
theorem necessary_barcan_r.polyadic : Statements.necessary_barcan_r.polyadic := by
  map_form P.NecBarcan.schema_entails_listSchema P.NecBarcan.listSchema_entails_schema

/-- `tractarianism-r`, variant `polyadic`: the principle for every list of argument types. -/
theorem tractarianism_r.polyadic : Statements.tractarianism_r.polyadic := by
  map_form P.Tractarianism.schema_entails_listSchema P.Tractarianism.listSchema_entails_schema

/-- `necessary-tractarianism-r`, variant `polyadic`: the principle for every list of argument types. -/
theorem necessary_tractarianism_r.polyadic : Statements.necessary_tractarianism_r.polyadic := by
  map_form P.NecTractarianism.schema_entails_listSchema P.NecTractarianism.listSchema_entails_schema

/-- `distinctness-necessary-r`, variant `polyadic`: the principle for every list of argument types. -/
theorem distinctness_necessary_r.polyadic : Statements.distinctness_necessary_r.polyadic := by
  map_form P.NecessityOfDistinctness.schema_entails_listSchema P.NecessityOfDistinctness.listSchema_entails_schema

/-- `necessary-distinctness-necessary-r`, variant `polyadic`: the principle for every list of argument types. -/
theorem necessary_distinctness_necessary_r.polyadic : Statements.necessary_distinctness_necessary_r.polyadic := by
  map_form P.NecNecessityOfDistinctness.schema_entails_listSchema P.NecNecessityOfDistinctness.listSchema_entails_schema

/-- `functionality-r`, variant `polyadic`: the principle for every list of argument types. -/
theorem functionality_r.polyadic : Statements.functionality_r.polyadic := by
  map_form P.Functionality.schema_entails_listSchema P.Functionality.listSchema_entails_schema

/-- `necessary-functionality-r`, variant `polyadic`: the principle for every list of argument types. -/
theorem necessary_functionality_r.polyadic : Statements.necessary_functionality_r.polyadic := by
  map_form P.NecFunctionality.schema_entails_listSchema P.NecFunctionality.listSchema_entails_schema

/-- `functional-choice-r`, variant `polyadic`: the principle for every list of argument types. -/
theorem functional_choice_r.polyadic : Statements.functional_choice_r.polyadic := by
  map_form P.FunctionalChoice.schema_entails_listSchema P.FunctionalChoice.listSchema_entails_schema

/-- `necessary-functional-choice-r`, variant `polyadic`: the principle for every list of argument types. -/
theorem necessary_functional_choice_r.polyadic : Statements.necessary_functional_choice_r.polyadic := by
  map_form P.NecFunctionalChoice.schema_entails_listSchema P.NecFunctionalChoice.listSchema_entails_schema

/-- `relational-choice-r`, variant `polyadic`: the principle for every list of argument types. -/
theorem relational_choice_r.polyadic : Statements.relational_choice_r.polyadic := by
  map_form P.RelationalChoice.schema_entails_listSchema P.RelationalChoice.listSchema_entails_schema

/-- `necessary-relational-choice-r`, variant `polyadic`: the principle for every list of argument types. -/
theorem necessary_relational_choice_r.polyadic : Statements.necessary_relational_choice_r.polyadic := by
  map_form P.NecRelationalChoice.schema_entails_listSchema P.NecRelationalChoice.listSchema_entails_schema

/-- `plenitude-r`, variant `polyadic`: the principle for every list of argument types. -/
theorem plenitude_r.polyadic : Statements.plenitude_r.polyadic := by
  map_form P.Plenitude.schema_entails_listSchema P.Plenitude.listSchema_entails_schema

/-- `necessary-plenitude-r`, variant `polyadic`: the principle for every list of argument types. -/
theorem necessary_plenitude_r.polyadic : Statements.necessary_plenitude_r.polyadic := by
  map_form P.NecPlenitude.schema_entails_listSchema P.NecPlenitude.listSchema_entails_schema

/-- `atomicity-r`, variant `dual`: the dual form. -/
theorem atomicity_r.dual : Statements.atomicity_r.dual := by
  map_form P.Atomicity.to_dual.entails
    P.Atomicity.of_dual.entails

/-- `atomicity-t`, variant `dual`: the dual form. -/
theorem atomicity_t.dual : Statements.atomicity_t.dual := by
  map_form P.AtomicityT.to_dual.entails
    P.AtomicityT.of_dual.entails

/-- `actuality`, variant `actual-profile`: Actual Profile, at every list of argument types. -/
theorem actuality.actual_profile : Statements.actuality.actual_profile := by
  map_form Proofs.actuality_implies_actual_profile_r.listEntails
    Meta.actual_profile_r_implies_actuality

/-- `barcan-r`, variant `dual`: the dual form. -/
theorem barcan_r.dual : Statements.barcan_r.dual := by
  map_form P.Barcan.to_dual.entails
    P.Barcan.of_dual.entails

/-- `barcan-r`, variant `universal-weakly-rigid`: the universal property is weakly rigid. -/
theorem barcan_r.universal_weakly_rigid : Statements.barcan_r.universal_weakly_rigid := by
  map_form P.Barcan.to_universalWeaklyRigid.entails
    P.Barcan.of_universalWeaklyRigid.entails

/-- `barcan-r`, variant `dual-polyadic`: the dual form, for every list of argument types. -/
theorem barcan_r.dual_polyadic : Statements.barcan_r.dual_polyadic := by
  map_form (Entails.trans P.Barcan.schema_entails_listSchema P.Barcan.to_dual.listEntails)
    (Entails.trans P.Barcan.of_dual.listEntails P.Barcan.listSchema_entails_schema)

/-- `barcan-t`, variant `dual`: the dual form. -/
theorem barcan_t.dual : Statements.barcan_t.dual := by
  map_form P.BarcanT.to_dual.entails
    P.BarcanT.of_dual.entails

/-- `boolean-completeness-t`, variant `lub`: the least-upper-bound form. -/
theorem boolean_completeness_t.lub : Statements.boolean_completeness_t.lub := by
  map_form P.BooleanCompletenessT.to_lub.entails
    P.BooleanCompletenessT.of_lub.entails

/-- `distinctness-necessary-r`, variant `dual`: the dual form. -/
theorem distinctness_necessary_r.dual : Statements.distinctness_necessary_r.dual := by
  map_form P.NecessityOfDistinctness.to_dual.entails
    P.NecessityOfDistinctness.of_dual.entails

/-- `distinctness-necessary-r`, variant `dual-polyadic`: the dual form, for every list of argument types. -/
theorem distinctness_necessary_r.dual_polyadic : Statements.distinctness_necessary_r.dual_polyadic := by
  map_form (Entails.trans P.NecessityOfDistinctness.schema_entails_listSchema P.NecessityOfDistinctness.to_dual.listEntails)
    (Entails.trans P.NecessityOfDistinctness.of_dual.listEntails P.NecessityOfDistinctness.listSchema_entails_schema)

/-- `distinctness-necessary-t`, variant `dual`: the dual form. -/
theorem distinctness_necessary_t.dual : Statements.distinctness_necessary_t.dual := by
  map_form P.NecessityOfDistinctnessT.to_dual.entails
    P.NecessityOfDistinctnessT.of_dual.entails

/-- `distinctness-preserving-collapse`, variant `dual`: the dual form. -/
theorem distinctness_preserving_collapse.dual : Statements.distinctness_preserving_collapse.dual := by
  map_form P.DistinctnessPreservingCollapse.to_dual.entails
    P.DistinctnessPreservingCollapse.of_dual.entails

/-- `modal-b`, variant `dual`: the dual form. -/
theorem modal_b.dual : Statements.modal_b.dual := by
  map_form P.ModalB.to_dual.entails
    P.ModalB.of_dual.entails

/-- `modal-five`, variant `dual`: the dual form. -/
theorem modal_five.dual : Statements.modal_five.dual := by
  map_form P.ModalFive.to_dual.entails
    P.ModalFive.of_dual.entails

/-- `necessary-atomicity-r`, variant `dual`: the dual form. -/
theorem necessary_atomicity_r.dual : Statements.necessary_atomicity_r.dual := by
  map_form P.NecAtomicity.to_dual.entails
    P.NecAtomicity.of_dual.entails

/-- `necessary-barcan-r`, variant `dual`: the dual form. -/
theorem necessary_barcan_r.dual : Statements.necessary_barcan_r.dual := by
  map_form P.NecBarcan.to_dual.entails
    P.NecBarcan.of_dual.entails

/-- `necessary-barcan-r`, variant `universal-rigid`: the universal property is rigid. -/
theorem necessary_barcan_r.universal_rigid : Statements.necessary_barcan_r.universal_rigid := by
  map_form P.NecBarcan.to_universalRigid.entails
    P.NecBarcan.of_universalRigid.entails

/-- `necessary-barcan-r`, variant `dual-polyadic`: the dual form, for every list of argument types. -/
theorem necessary_barcan_r.dual_polyadic : Statements.necessary_barcan_r.dual_polyadic := by
  map_form (Entails.trans P.NecBarcan.schema_entails_listSchema P.NecBarcan.to_dual.listEntails)
    (Entails.trans P.NecBarcan.of_dual.listEntails P.NecBarcan.listSchema_entails_schema)

/-- `necessary-barcan-t`, variant `dual`: the dual form. -/
theorem necessary_barcan_t.dual : Statements.necessary_barcan_t.dual := by
  map_form P.NecBarcanT.to_dual.entails
    P.NecBarcanT.of_dual.entails

/-- `weak-rigid-comprehension-r`, variant `persistent`: a weakly rigid relation is persistent. -/
theorem weak_rigid_comprehension_r.persistent : Statements.weak_rigid_comprehension_r.persistent := by
  map_form P.WeakRigidComprehension.to_persistent.entails P.WeakRigidComprehension.of_persistent.entails

/-- `necessary-weak-rigid-comprehension-r`, variant `persistent`. -/
theorem necessary_weak_rigid_comprehension_r.persistent :
    Statements.necessary_weak_rigid_comprehension_r.persistent := by
  map_form P.NecWeakRigidComprehension.to_persistent.entails P.NecWeakRigidComprehension.of_persistent.entails

/-- `distinctness-schema-r`, variant `possibility`: Maximalism's possibility form. -/
theorem distinctness_schema_r.possibility : Statements.distinctness_schema_r.possibility := by
  map_form Meta.distinctness_schema_r_implies_possibility_schema_r
    Meta.possibility_schema_r_implies_distinctness_schema_r

/-- `distinctness-signature-r`, variant `possibility`: likewise in the signature. -/
theorem distinctness_signature_r.possibility : Statements.distinctness_signature_r.possibility := by
  map_form_sig Meta.distinctness_signature_r_implies_possibility_signature_r
    Meta.possibility_signature_r_implies_distinctness_signature_r

/-- `necessary-boolean-completeness-r`, variant `lub`: the least-upper-bound form. -/
theorem necessary_boolean_completeness_r.lub : Statements.necessary_boolean_completeness_r.lub := by
  map_form P.NecBooleanCompleteness.to_lub.entails
    P.NecBooleanCompleteness.of_lub.entails

/-- `necessary-distinctness-necessary-r`, variant `dual`: the dual form. -/
theorem necessary_distinctness_necessary_r.dual : Statements.necessary_distinctness_necessary_r.dual := by
  map_form P.NecNecessityOfDistinctness.to_dual.entails
    P.NecNecessityOfDistinctness.of_dual.entails

/-- `necessary-distinctness-necessary-r`, variant `dual-polyadic`: the dual form, for every list of argument types. -/
theorem necessary_distinctness_necessary_r.dual_polyadic : Statements.necessary_distinctness_necessary_r.dual_polyadic := by
  map_form (Entails.trans P.NecNecessityOfDistinctness.schema_entails_listSchema P.NecNecessityOfDistinctness.to_dual.listEntails)
    (Entails.trans P.NecNecessityOfDistinctness.of_dual.listEntails P.NecNecessityOfDistinctness.listSchema_entails_schema)

/-- `necessary-distinctness-necessary-t`, variant `dual`: the dual form. -/
theorem necessary_distinctness_necessary_t.dual : Statements.necessary_distinctness_necessary_t.dual := by
  map_form P.NecNecessityOfDistinctnessT.to_dual.entails
    P.NecNecessityOfDistinctnessT.of_dual.entails

/-- `necessary-modal-b`, variant `dual`: the dual form. -/
theorem necessary_modal_b.dual : Statements.necessary_modal_b.dual := by
  map_form P.NecModalB.to_dual.entails
    P.NecModalB.of_dual.entails

/-- `necessary-modal-five`, variant `dual`: the dual form. -/
theorem necessary_modal_five.dual : Statements.necessary_modal_five.dual := by
  map_form P.NecModalFive.to_dual.entails
    P.NecModalFive.of_dual.entails

/-- `necessary-strong-atomicity-r`, variant `dual`: the dual form. -/
theorem necessary_strong_atomicity_r.dual : Statements.necessary_strong_atomicity_r.dual := by
  map_form P.NecStrongAtomicity.to_dual.entails
    P.NecStrongAtomicity.of_dual.entails

/-- `necessary-strong-atomicity-t`, variant `dual`: the dual form. -/
theorem necessary_strong_atomicity_t.dual : Statements.necessary_strong_atomicity_t.dual := by
  map_form P.NecStrongAtomicityT.to_dual.entails
    P.NecStrongAtomicityT.of_dual.entails

/-- `necessary-tractarianism-r`, variant `dual`: the dual form. -/
theorem necessary_tractarianism_r.dual : Statements.necessary_tractarianism_r.dual := by
  map_form P.NecTractarianism.to_dual.entails
    P.NecTractarianism.of_dual.entails

/-- `necessary-tractarianism-r`, variant `dual-polyadic`: the dual form, for every list of argument types. -/
theorem necessary_tractarianism_r.dual_polyadic : Statements.necessary_tractarianism_r.dual_polyadic := by
  map_form (Entails.trans P.NecTractarianism.schema_entails_listSchema P.NecTractarianism.to_dual.listEntails)
    (Entails.trans P.NecTractarianism.of_dual.listEntails P.NecTractarianism.listSchema_entails_schema)

/-- `strong-atomicity-r`, variant `dual`: the dual form. -/
theorem strong_atomicity_r.dual : Statements.strong_atomicity_r.dual := by
  map_form P.StrongAtomicity.to_dual.entails
    P.StrongAtomicity.of_dual.entails

/-- `strong-atomicity-t`, variant `dual`: the dual form. -/
theorem strong_atomicity_t.dual : Statements.strong_atomicity_t.dual := by
  map_form P.StrongAtomicityT.to_dual.entails
    P.StrongAtomicityT.of_dual.entails

/-- `tractarianism-r`, variant `dual`: the dual form. -/
theorem tractarianism_r.dual : Statements.tractarianism_r.dual := by
  map_form P.Tractarianism.to_dual.entails
    P.Tractarianism.of_dual.entails

/-- `tractarianism-r`, variant `dual-polyadic`: the dual form, for every list of argument types. -/
theorem tractarianism_r.dual_polyadic : Statements.tractarianism_r.dual_polyadic := by
  map_form (Entails.trans P.Tractarianism.schema_entails_listSchema P.Tractarianism.to_dual.listEntails)
    (Entails.trans P.Tractarianism.of_dual.listEntails P.Tractarianism.listSchema_entails_schema)


/-! ## Added 6 October 2026: the newly defined principles -/

/-- `necessary-weak-rigid-comprehension-r-implies-weak-rigid-comprehension-r` -/
theorem necessary_weak_rigid_comprehension_r_implies_weak_rigid_comprehension_r : Statements.necessary_weak_rigid_comprehension_r_implies_weak_rigid_comprehension_r := by
  map_cert Proofs.necessary_weak_rigid_comprehension_r_implies_weak_rigid_comprehension_r.entails

/-- `necessary-persistent-comprehension-r-implies-persistent-comprehension-r` -/
theorem necessary_persistent_comprehension_r_implies_persistent_comprehension_r : Statements.necessary_persistent_comprehension_r_implies_persistent_comprehension_r := by
  map_cert Proofs.necessary_persistent_comprehension_r_implies_persistent_comprehension_r.entails

/-- `necessary-inextensible-comprehension-r-implies-inextensible-comprehension-r` -/
theorem necessary_inextensible_comprehension_r_implies_inextensible_comprehension_r : Statements.necessary_inextensible_comprehension_r_implies_inextensible_comprehension_r := by
  map_cert Proofs.necessary_inextensible_comprehension_r_implies_inextensible_comprehension_r.entails

/-- `necessary-tame-rigidity-r-implies-tame-rigidity-r` -/
theorem necessary_tame_rigidity_r_implies_tame_rigidity_r : Statements.necessary_tame_rigidity_r_implies_tame_rigidity_r := by
  map_cert Proofs.necessary_tame_rigidity_r_implies_tame_rigidity_r.entails

/-- `necessary-rigid-power-r-implies-rigid-power-r` -/
theorem necessary_rigid_power_r_implies_rigid_power_r : Statements.necessary_rigid_power_r_implies_rigid_power_r := by
  map_cert Proofs.necessary_rigid_power_r_implies_rigid_power_r.entails

/-- `necessary-rigid-comprehension-implies-necessary-weak-rigid-comprehension` -/
theorem necessary_rigid_comprehension_implies_necessary_weak_rigid_comprehension : Statements.necessary_rigid_comprehension_implies_necessary_weak_rigid_comprehension := by
  map_cert Proofs.necessary_rigid_comprehension_implies_necessary_weak_rigid_comprehension.entails

/-- `necessary-rigid-comprehension-implies-necessary-inextensible-comprehension` -/
theorem necessary_rigid_comprehension_implies_necessary_inextensible_comprehension : Statements.necessary_rigid_comprehension_implies_necessary_inextensible_comprehension := by
  map_cert Proofs.necessary_rigid_comprehension_implies_necessary_inextensible_comprehension.entails

/-- `necessary-weak-rigid-comprehension-implies-necessary-persistent-comprehension` -/
theorem necessary_weak_rigid_comprehension_implies_necessary_persistent_comprehension : Statements.necessary_weak_rigid_comprehension_implies_necessary_persistent_comprehension := by
  map_cert Proofs.necessary_weak_rigid_comprehension_implies_necessary_persistent_comprehension.entails

/-- `necessary-inextensible-comprehension-implies-necessary-wic` -/
theorem necessary_inextensible_comprehension_implies_necessary_wic : Statements.necessary_inextensible_comprehension_implies_necessary_wic := by
  map_cert Proofs.necessary_inextensible_comprehension_implies_necessary_wic.entails

/-- `necessary-atomicity-t-implies-atomicity-t` -/
theorem necessary_atomicity_t_implies_atomicity_t : Statements.necessary_atomicity_t_implies_atomicity_t := by
  map_cert Proofs.necessary_atomicity_t_implies_atomicity_t.entails

/-- `necessary-boolean-completeness-t-implies-boolean-completeness-t` -/
theorem necessary_boolean_completeness_t_implies_boolean_completeness_t : Statements.necessary_boolean_completeness_t_implies_boolean_completeness_t := by
  map_cert Proofs.necessary_boolean_completeness_t_implies_boolean_completeness_t.entails

/-- `necessary-atomicity-r-implies-necessary-atomicity-t` -/
theorem necessary_atomicity_r_implies_necessary_atomicity_t : Statements.necessary_atomicity_r_implies_necessary_atomicity_t := by
  map_cert Proofs.necessary_atomicity_r_implies_necessary_atomicity_t.entails

/-- `necessary-boolean-completeness-r-implies-necessary-boolean-completeness-t` -/
theorem necessary_boolean_completeness_r_implies_necessary_boolean_completeness_t : Statements.necessary_boolean_completeness_r_implies_necessary_boolean_completeness_t := by
  map_cert Proofs.necessary_boolean_completeness_r_implies_necessary_boolean_completeness_t.entails

/-- `necessary-strong-atomicity-t-implies-necessary-atomicity-t` -/
theorem necessary_strong_atomicity_t_implies_necessary_atomicity_t : Statements.necessary_strong_atomicity_t_implies_necessary_atomicity_t := by
  map_cert Proofs.necessary_strong_atomicity_t_implies_necessary_atomicity_t.entails

/-- `necessary-persistent-comprehension-implies-necessary-actuality` -/
theorem necessary_persistent_comprehension_implies_necessary_actuality : Statements.necessary_persistent_comprehension_implies_necessary_actuality := by
  map_cert Proofs.necessary_persistent_comprehension_implies_necessary_actuality.entails

/-- `necessary-intensional-choice-r-implies-intensional-choice-r` -/
theorem necessary_intensional_choice_r_implies_intensional_choice_r : Statements.necessary_intensional_choice_r_implies_intensional_choice_r := by
  map_cert Proofs.necessary_intensional_choice_r_implies_intensional_choice_r.entails

/-- `necessary-countable-boolean-completeness-r-implies-countable-boolean-completeness-r` -/
theorem necessary_countable_boolean_completeness_r_implies_countable_boolean_completeness_r : Statements.necessary_countable_boolean_completeness_r_implies_countable_boolean_completeness_r := by
  map_cert Proofs.necessary_countable_boolean_completeness_r_implies_countable_boolean_completeness_r.entails

/-- `necessary-boolean-completeness-r-implies-necessary-countable-boolean-completeness-r` -/
theorem necessary_boolean_completeness_r_implies_necessary_countable_boolean_completeness_r : Statements.necessary_boolean_completeness_r_implies_necessary_countable_boolean_completeness_r := by
  map_cert Proofs.necessary_boolean_completeness_r_implies_necessary_countable_boolean_completeness_r.entails

/-- `no-pure-contingency-and-atomicity-t-imply-necessary-atomicity-t` -/
theorem no_pure_contingency_and_atomicity_t_imply_necessary_atomicity_t : Statements.no_pure_contingency_and_atomicity_t_imply_necessary_atomicity_t := by
  map_cert (Entails.mono_right (Ax₃ := P.NecAtomicityT.schema) (by map_box) (npc_union_entails_box_pure P.AtomicityT.schema_closedTypes))

/-- `no-pure-contingency-and-boolean-completeness-t-imply-necessary-boolean-completeness-t` -/
theorem no_pure_contingency_and_boolean_completeness_t_imply_necessary_boolean_completeness_t : Statements.no_pure_contingency_and_boolean_completeness_t_imply_necessary_boolean_completeness_t := by
  map_cert (Entails.mono_right (Ax₃ := P.NecBooleanCompletenessT.schema) (by map_box) (npc_union_entails_box_pure P.BooleanCompletenessT.schema_closedTypes))

/-- `no-pure-contingency-and-countable-boolean-completeness-imply-necessary-countable-boolean-completeness` -/
theorem no_pure_contingency_and_countable_boolean_completeness_imply_necessary_countable_boolean_completeness : Statements.no_pure_contingency_and_countable_boolean_completeness_imply_necessary_countable_boolean_completeness := by
  map_cert (Entails.mono_right (Ax₃ := P.NecCountableBooleanCompleteness.schema) (by map_box) (npc_union_entails_box_pure P.CountableBooleanCompleteness.schema_closedTypes))

/-- `no-pure-contingency-and-inextensible-comprehension-imply-necessary-inextensible-comprehension` -/
theorem no_pure_contingency_and_inextensible_comprehension_imply_necessary_inextensible_comprehension : Statements.no_pure_contingency_and_inextensible_comprehension_imply_necessary_inextensible_comprehension := by
  map_cert (Entails.mono_right (Ax₃ := P.NecInextensibleComprehension.schema) (by map_box) (npc_union_entails_box_pure P.InextensibleComprehension.schema_closedTypes))

/-- `no-pure-contingency-and-intensional-choice-imply-necessary-intensional-choice` -/
theorem no_pure_contingency_and_intensional_choice_imply_necessary_intensional_choice : Statements.no_pure_contingency_and_intensional_choice_imply_necessary_intensional_choice := by
  map_cert (Entails.mono_right (Ax₃ := P.NecIntensionalChoice.schema) (by map_box) (npc_union_entails_box_pure P.IntensionalChoice.schema_closedTypes))

/-- `no-pure-contingency-and-persistent-comprehension-imply-necessary-persistent-comprehension` -/
theorem no_pure_contingency_and_persistent_comprehension_imply_necessary_persistent_comprehension : Statements.no_pure_contingency_and_persistent_comprehension_imply_necessary_persistent_comprehension := by
  map_cert (Entails.mono_right (Ax₃ := P.NecPersistentComprehension.schema) (by map_box) (npc_union_entails_box_pure P.PersistentComprehension.schema_closedTypes))

/-- `no-pure-contingency-and-rigid-power-imply-necessary-rigid-power` -/
theorem no_pure_contingency_and_rigid_power_imply_necessary_rigid_power : Statements.no_pure_contingency_and_rigid_power_imply_necessary_rigid_power := by
  map_cert (Entails.mono_right (Ax₃ := P.NecRigidPower.schema) (by map_box) (npc_union_entails_box_pure P.RigidPower.schema_closedTypes))

/-- `no-pure-contingency-and-tame-rigidity-imply-necessary-tame-rigidity` -/
theorem no_pure_contingency_and_tame_rigidity_imply_necessary_tame_rigidity : Statements.no_pure_contingency_and_tame_rigidity_imply_necessary_tame_rigidity := by
  map_cert (Entails.mono_right (Ax₃ := P.NecTameRigidity.schema) (by map_box) (npc_union_entails_box_pure P.TameRigidity.schema_closedTypes))

/-- `no-pure-contingency-and-weak-rigid-comprehension-imply-necessary-weak-rigid-comprehension` -/
theorem no_pure_contingency_and_weak_rigid_comprehension_imply_necessary_weak_rigid_comprehension : Statements.no_pure_contingency_and_weak_rigid_comprehension_imply_necessary_weak_rigid_comprehension := by
  map_cert (Entails.mono_right (Ax₃ := P.NecWeakRigidComprehension.schema) (by map_box) (npc_union_entails_box_pure P.WeakRigidComprehension.schema_closedTypes))

/-- `tame-rigidity-and-weak-rigid-comprehension-imply-rigid-comprehension` -/
theorem tame_rigidity_and_weak_rigid_comprehension_imply_rigid_comprehension : Statements.tame_rigidity_and_weak_rigid_comprehension_imply_rigid_comprehension := by
  map_cert Proofs.tame_rigidity_and_weak_rigid_comprehension_imply_rigid_comprehension.entails

/-- `necessary-tame-rigidity-and-necessary-weak-rigid-comprehension-imply-necessary-rigid-comprehension` -/
theorem necessary_tame_rigidity_and_necessary_weak_rigid_comprehension_imply_necessary_rigid_comprehension : Statements.necessary_tame_rigidity_and_necessary_weak_rigid_comprehension_imply_necessary_rigid_comprehension := by
  map_cert Proofs.necessary_tame_rigidity_and_necessary_weak_rigid_comprehension_imply_necessary_rigid_comprehension.entails

/-- `rigid-comprehension-implies-tame-rigidity` -/
theorem rigid_comprehension_implies_tame_rigidity : Statements.rigid_comprehension_implies_tame_rigidity := by
  map_cert Proofs.rigid_comprehension_implies_tame_rigidity.entails

/-- `necessary-rigid-comprehension-implies-necessary-tame-rigidity` -/
theorem necessary_rigid_comprehension_implies_necessary_tame_rigidity : Statements.necessary_rigid_comprehension_implies_necessary_tame_rigidity := by
  map_cert Proofs.necessary_rigid_comprehension_implies_necessary_tame_rigidity.entails

/-- `necessary-atomicity-t-and-necessary-bf-imply-necessary-atomicity` -/
theorem necessary_atomicity_t_and_necessary_bf_imply_necessary_atomicity : Statements.necessary_atomicity_t_and_necessary_bf_imply_necessary_atomicity := by
  map_cert Meta.necessary_atomicity_t_and_necessary_bf_imply_necessary_atomicity

/-- `necessary-atomicity-t-and-necessary-bf-t-imply-necessary-strong-atomicity-t` -/
theorem necessary_atomicity_t_and_necessary_bf_t_imply_necessary_strong_atomicity_t : Statements.necessary_atomicity_t_and_necessary_bf_t_imply_necessary_strong_atomicity_t := by
  map_cert Proofs.necessary_atomicity_t_and_necessary_bf_t_imply_necessary_strong_atomicity_t.entails

/-- `necessary-actuality-and-necessary-bf-imply-necessary-inextensible-comprehension` -/
theorem necessary_actuality_and_necessary_bf_imply_necessary_inextensible_comprehension : Statements.necessary_actuality_and_necessary_bf_imply_necessary_inextensible_comprehension := by
  map_cert Meta.necessary_actuality_and_necessary_bf_imply_necessary_inextensible_comprehension

/-- `necessary-completeness-and-necessary-actuality-imply-necessary-weak-rigid-comprehension` -/
theorem necessary_completeness_and_necessary_actuality_imply_necessary_weak_rigid_comprehension : Statements.necessary_completeness_and_necessary_actuality_imply_necessary_weak_rigid_comprehension := by
  map_cert Meta.necessary_completeness_and_necessary_actuality_imply_necessary_weak_rigid_comprehension

/-- `extensionality-r-implies-intensional-choice-r` -/
theorem extensionality_r_implies_intensional_choice_r : Statements.extensionality_r_implies_intensional_choice_r := by
  map_cert Proofs.extensionality_r_implies_intensional_choice_r.entails

/-- `no-pure-contingency-implies-necessity-of-arithmetic` -/
theorem no_pure_contingency_implies_necessity_of_arithmetic : Statements.no_pure_contingency_implies_necessity_of_arithmetic := by
  map_cert npc_entails_necessityOfArithmetic

/-- `c5-implies-necessity-of-arithmetic` -/
theorem c5_implies_necessity_of_arithmetic : Statements.c5_implies_necessity_of_arithmetic := by
  map_cert c5_entails_necessityOfArithmetic

/-- `c5-implies-necessary-rigid-power` -/
theorem c5_implies_necessary_rigid_power : Statements.c5_implies_necessary_rigid_power := by
  map_cert Meta.c5_implies_necessary_rigid_power

/-- `c5-implies-tame-rigidity` -/
theorem c5_implies_tame_rigidity : Statements.c5_implies_tame_rigidity := by
  map_cert Meta.c5_implies_tame_rigidity

/-- `c5-implies-necessary-tame-rigidity` -/
theorem c5_implies_necessary_tame_rigidity : Statements.c5_implies_necessary_tame_rigidity := by
  map_cert Meta.c5_implies_necessary_tame_rigidity

/-- `weakly-rigid-power-implies-tame-rigidity` -/
theorem weakly_rigid_power_implies_tame_rigidity : Statements.weakly_rigid_power_implies_tame_rigidity := by
  map_cert Proofs.weakly_rigid_power_implies_tame_rigidity.entails

/-- `weakly-rigid-power-implies-rigid-power` -/
theorem weakly_rigid_power_implies_rigid_power : Statements.weakly_rigid_power_implies_rigid_power := by
  map_cert Proofs.weakly_rigid_power_implies_rigid_power.entails

/-- `necessary-tame-rigidity-and-rigid-power-imply-weakly-rigid-power` -/
theorem necessary_tame_rigidity_and_rigid_power_imply_weakly_rigid_power : Statements.necessary_tame_rigidity_and_rigid_power_imply_weakly_rigid_power := by
  map_cert Proofs.necessary_tame_rigidity_and_rigid_power_imply_weakly_rigid_power.entails

/-- `necessary-weakly-rigid-power-r-implies-weakly-rigid-power-r` -/
theorem necessary_weakly_rigid_power_r_implies_weakly_rigid_power_r : Statements.necessary_weakly_rigid_power_r_implies_weakly_rigid_power_r := by
  map_cert Proofs.necessary_weakly_rigid_power_r_implies_weakly_rigid_power_r.entails

/-- `necessary-weakly-rigid-power-implies-necessary-tame-rigidity` -/
theorem necessary_weakly_rigid_power_implies_necessary_tame_rigidity : Statements.necessary_weakly_rigid_power_implies_necessary_tame_rigidity := by
  map_cert Proofs.necessary_weakly_rigid_power_implies_necessary_tame_rigidity.entails

/-- `necessary-weakly-rigid-power-implies-necessary-rigid-power` -/
theorem necessary_weakly_rigid_power_implies_necessary_rigid_power : Statements.necessary_weakly_rigid_power_implies_necessary_rigid_power := by
  map_cert Proofs.necessary_weakly_rigid_power_implies_necessary_rigid_power.entails

/-- `necessary-tame-rigidity-and-necessary-rigid-power-imply-necessary-weakly-rigid-power` -/
theorem necessary_tame_rigidity_and_necessary_rigid_power_imply_necessary_weakly_rigid_power : Statements.necessary_tame_rigidity_and_necessary_rigid_power_imply_necessary_weakly_rigid_power := by
  map_cert Proofs.necessary_tame_rigidity_and_necessary_rigid_power_imply_necessary_weakly_rigid_power.entails

/-- `no-pure-contingency-and-weakly-rigid-power-imply-necessary-weakly-rigid-power` -/
theorem no_pure_contingency_and_weakly_rigid_power_imply_necessary_weakly_rigid_power : Statements.no_pure_contingency_and_weakly_rigid_power_imply_necessary_weakly_rigid_power := by
  map_cert (Entails.mono_right (Ax₃ := P.NecWeaklyRigidPower.schema) (by map_box) (npc_union_entails_box_pure P.WeaklyRigidPower.schema_closedTypes))

/-- `rigid-rigidity-implies-necessary-rigid-rigidity` -/
theorem rigid_rigidity_implies_necessary_rigid_rigidity : Statements.rigid_rigidity_implies_necessary_rigid_rigidity := by
  map_cert Proofs.rigid_rigidity_implies_necessary_rigid_rigidity.entails

/-- `necessary-rigid-rigidity-r-implies-rigid-rigidity-r` -/
theorem necessary_rigid_rigidity_r_implies_rigid_rigidity_r : Statements.necessary_rigid_rigidity_r_implies_rigid_rigidity_r := by
  map_cert Proofs.necessary_rigid_rigidity_r_implies_rigid_rigidity_r.entails

/-- `weakly-rigid-weak-rigidity-implies-necessary-tame-rigidity` -/
theorem weakly_rigid_weak_rigidity_implies_necessary_tame_rigidity : Statements.weakly_rigid_weak_rigidity_implies_necessary_tame_rigidity := by
  map_cert Proofs.weakly_rigid_weak_rigidity_implies_necessary_tame_rigidity.entails

/-- `weakly-rigid-weak-rigidity-implies-rigid-rigidity` -/
theorem weakly_rigid_weak_rigidity_implies_rigid_rigidity : Statements.weakly_rigid_weak_rigidity_implies_rigid_rigidity := by
  map_cert Proofs.weakly_rigid_weak_rigidity_implies_rigid_rigidity.entails

/-- `rigid-rigidity-and-necessary-tame-rigidity-imply-weakly-rigid-weak-rigidity` -/
theorem rigid_rigidity_and_necessary_tame_rigidity_imply_weakly_rigid_weak_rigidity : Statements.rigid_rigidity_and_necessary_tame_rigidity_imply_weakly_rigid_weak_rigidity := by
  map_cert Proofs.rigid_rigidity_and_necessary_tame_rigidity_imply_weakly_rigid_weak_rigidity.entails

/-- `weakly-rigid-weak-rigidity-implies-necessary-weakly-rigid-weak-rigidity` -/
theorem weakly_rigid_weak_rigidity_implies_necessary_weakly_rigid_weak_rigidity : Statements.weakly_rigid_weak_rigidity_implies_necessary_weakly_rigid_weak_rigidity := by
  map_cert Proofs.weakly_rigid_weak_rigidity_implies_necessary_weakly_rigid_weak_rigidity.entails

/-- `necessary-weakly-rigid-weak-rigidity-r-implies-weakly-rigid-weak-rigidity-r` -/
theorem necessary_weakly_rigid_weak_rigidity_r_implies_weakly_rigid_weak_rigidity_r : Statements.necessary_weakly_rigid_weak_rigidity_r_implies_weakly_rigid_weak_rigidity_r := by
  map_cert Proofs.necessary_weakly_rigid_weak_rigidity_r_implies_weakly_rigid_weak_rigidity_r.entails

/-- `barcan-and-weakly-rigid-power-imply-weakly-rigid-weak-rigidity` -/
theorem barcan_and_weakly_rigid_power_imply_weakly_rigid_weak_rigidity : Statements.barcan_and_weakly_rigid_power_imply_weakly_rigid_weak_rigidity := by
  map_cert Meta.barcan_and_weakly_rigid_power_imply_weakly_rigid_weak_rigidity

/-- `barcan-and-weakly-rigid-power-imply-necessary-tame-rigidity` -/
theorem barcan_and_weakly_rigid_power_imply_necessary_tame_rigidity : Statements.barcan_and_weakly_rigid_power_imply_necessary_tame_rigidity := by
  map_cert Meta.barcan_and_weakly_rigid_power_imply_necessary_tame_rigidity

/-- `rigid-rigidity-implies-necessary-barcan` -/
theorem rigid_rigidity_implies_necessary_barcan : Statements.rigid_rigidity_implies_necessary_barcan := by
  map_cert Meta.rigid_rigidity_implies_necessary_barcan

/-- `necessary-barcan-and-rigid-power-imply-rigid-rigidity` -/
theorem necessary_barcan_and_rigid_power_imply_rigid_rigidity : Statements.necessary_barcan_and_rigid_power_imply_rigid_rigidity := by
  map_cert Meta.necessary_barcan_and_rigid_power_imply_rigid_rigidity

/-- `barcan-r-implies-barcan-relational` -/
theorem barcan_r_implies_barcan_relational : Statements.barcan_r_implies_barcan_relational := by
  map_cert Proofs.barcan_r_implies_barcan_relational.entails

/-- `barcan-relational-implies-barcan-t` -/
theorem barcan_relational_implies_barcan_t : Statements.barcan_relational_implies_barcan_t := by
  map_cert Proofs.barcan_relational_implies_barcan_t.entails

/-- `necessary-barcan-r-implies-necessary-barcan-relational` -/
theorem necessary_barcan_r_implies_necessary_barcan_relational : Statements.necessary_barcan_r_implies_necessary_barcan_relational := by
  map_cert Proofs.necessary_barcan_r_implies_necessary_barcan_relational.entails

/-- `necessary-barcan-relational-implies-necessary-barcan-t` -/
theorem necessary_barcan_relational_implies_necessary_barcan_t : Statements.necessary_barcan_relational_implies_necessary_barcan_t := by
  map_cert Proofs.necessary_barcan_relational_implies_necessary_barcan_t.entails

/-- `necessary-barcan-relational-implies-barcan-relational` -/
theorem necessary_barcan_relational_implies_barcan_relational : Statements.necessary_barcan_relational_implies_barcan_relational := by
  map_cert Proofs.necessary_barcan_relational_implies_barcan_relational.entails

/-- `no-pure-contingency-and-bf-relational-imply-necessary-bf-relational` -/
theorem no_pure_contingency_and_bf_relational_imply_necessary_bf_relational : Statements.no_pure_contingency_and_bf_relational_imply_necessary_bf_relational := by
  map_cert (Entails.mono_right (Ax₃ := P.NecBarcanRelational.schema) (by map_box) (npc_union_entails_box_pure P.BarcanRelational.schema_closedTypes))

/-- `tame-rigidity-and-bf-relational-imply-necessary-bf-relational` -/
theorem tame_rigidity_and_bf_relational_imply_necessary_bf_relational : Statements.tame_rigidity_and_bf_relational_imply_necessary_bf_relational := by
  map_cert Proofs.tame_rigidity_and_bf_relational_imply_necessary_bf_relational.entails

/-- `tame-rigidity-and-barcan-imply-necessary-barcan` -/
theorem tame_rigidity_and_barcan_imply_necessary_barcan : Statements.tame_rigidity_and_barcan_imply_necessary_barcan := by
  map_cert Proofs.tame_rigidity_and_barcan_imply_necessary_barcan.entails

/-- `atomicity-and-bf-relational-imply-strong-atomicity` -/
theorem atomicity_and_bf_relational_imply_strong_atomicity : Statements.atomicity_and_bf_relational_imply_strong_atomicity := by
  map_cert Meta.atomicity_and_bf_relational_imply_strong_atomicity

/-- `necessary-atomicity-and-necessary-bf-relational-imply-necessary-strong-atomicity` -/
theorem necessary_atomicity_and_necessary_bf_relational_imply_necessary_strong_atomicity : Statements.necessary_atomicity_and_necessary_bf_relational_imply_necessary_strong_atomicity := by
  map_cert Meta.necessary_atomicity_and_necessary_bf_relational_imply_necessary_strong_atomicity

/-- `gallin-comprehension-implies-strong-actuality` -/
theorem gallin_comprehension_implies_strong_actuality : Statements.gallin_comprehension_implies_strong_actuality := by
  map_cert Proofs.gallin_comprehension_implies_strong_actuality.entails

/-- `necessary-gallin-comprehension-implies-necessary-strong-actuality` -/
theorem necessary_gallin_comprehension_implies_necessary_strong_actuality : Statements.necessary_gallin_comprehension_implies_necessary_strong_actuality := by
  map_cert Proofs.necessary_gallin_comprehension_implies_necessary_strong_actuality.entails

/-- `nd-and-strong-actuality-imply-gallin-comprehension` -/
theorem nd_and_strong_actuality_imply_gallin_comprehension : Statements.nd_and_strong_actuality_imply_gallin_comprehension := by
  map_cert Meta.nd_and_strong_actuality_imply_gallin_comprehension

/-- `c5-and-necessary-strong-actuality-imply-necessary-gallin-comprehension` -/
theorem c5_and_necessary_strong_actuality_imply_necessary_gallin_comprehension : Statements.c5_and_necessary_strong_actuality_imply_necessary_gallin_comprehension := by
  map_cert Meta.c5_and_necessary_strong_actuality_imply_necessary_gallin_comprehension

/-- `necessary-actuality-implies-necessary-persistent-comprehension` -/
theorem necessary_actuality_implies_necessary_persistent_comprehension : Statements.necessary_actuality_implies_necessary_persistent_comprehension := by
  map_cert _root_.Classicism.necessary_actuality_implies_necessary_persistent_comprehension.entails

/-- `c5-and-necessary-persistent-comprehension-imply-necessary-gallin` -/
theorem c5_and_necessary_persistent_comprehension_imply_necessary_gallin : Statements.c5_and_necessary_persistent_comprehension_imply_necessary_gallin := by
  map_cert _root_.Classicism.c5_and_necessary_persistent_comprehension_imply_necessary_gallin.entails

/-- `necessary-bf-atomicity-and-rigid-comprehension-imply-necessary-rigid-power` -/
theorem necessary_bf_atomicity_and_rigid_comprehension_imply_necessary_rigid_power : Statements.necessary_bf_atomicity_and_rigid_comprehension_imply_necessary_rigid_power := by
  map_cert Meta.necessary_bf_atomicity_and_rigid_comprehension_imply_necessary_rigid_power

/-- `atomicity-t-and-weakly-inextensible-comprehension-imply-actuality` -/
theorem atomicity_t_and_weakly_inextensible_comprehension_imply_actuality : Statements.atomicity_t_and_weakly_inextensible_comprehension_imply_actuality := by
  map_cert Proofs.atomicity_t_and_weakly_inextensible_comprehension_imply_actuality.entails

/-- `necessary-atomicity-t-and-necessary-wic-imply-necessary-actuality` -/
theorem necessary_atomicity_t_and_necessary_wic_imply_necessary_actuality : Statements.necessary_atomicity_t_and_necessary_wic_imply_necessary_actuality := by
  map_cert Proofs.necessary_atomicity_t_and_necessary_wic_imply_necessary_actuality.entails

/-- `well-ordering-r-implies-transversal-choice-r` -/
theorem well_ordering_r_implies_transversal_choice_r : Statements.well_ordering_r_implies_transversal_choice_r := by
  map_cert Proofs.well_ordering_r_implies_transversal_choice_r.entails

/-- `necessary-well-ordering-r-implies-well-ordering-r` -/
theorem necessary_well_ordering_r_implies_well_ordering_r : Statements.necessary_well_ordering_r_implies_well_ordering_r := by
  map_cert Proofs.necessary_well_ordering_r_implies_well_ordering_r.entails

/-- `necessary-well-ordering-r-implies-necessary-transversal-choice-r` -/
theorem necessary_well_ordering_r_implies_necessary_transversal_choice_r : Statements.necessary_well_ordering_r_implies_necessary_transversal_choice_r := by
  map_cert Proofs.necessary_well_ordering_r_implies_necessary_transversal_choice_r.entails

/-- `modal-well-ordering-r-implies-intensional-choice-r` -/
theorem modal_well_ordering_r_implies_intensional_choice_r : Statements.modal_well_ordering_r_implies_intensional_choice_r := by
  map_cert Proofs.modal_well_ordering_r_implies_intensional_choice_r.entails

/-- `modal-well-ordering-r-implies-necessary-intensional-choice-r` -/
theorem modal_well_ordering_r_implies_necessary_intensional_choice_r : Statements.modal_well_ordering_r_implies_necessary_intensional_choice_r := by
  map_cert Proofs.modal_well_ordering_r_implies_necessary_intensional_choice_r.entails

/-- `modal-well-ordering-r-implies-necessary-well-ordering-r` -/
theorem modal_well_ordering_r_implies_necessary_well_ordering_r : Statements.modal_well_ordering_r_implies_necessary_well_ordering_r := by
  map_cert Proofs.modal_well_ordering_r_implies_necessary_well_ordering_r.entails

/-- `necessary-well-ordering-and-intensional-choice-imply-modal-well-ordering` -/
theorem necessary_well_ordering_and_intensional_choice_imply_modal_well_ordering : Statements.necessary_well_ordering_and_intensional_choice_imply_modal_well_ordering := by
  map_cert Proofs.necessary_well_ordering_and_intensional_choice_imply_modal_well_ordering.entails

/-- `transversal-choice-r-implies-zorn-r` -/
theorem transversal_choice_r_implies_zorn_r : Statements.transversal_choice_r_implies_zorn_r := by
  map_cert Proofs.transversal_choice_r_implies_zorn_r.entails

/-- `zorn-r-implies-well-ordering-r` -/
theorem zorn_r_implies_well_ordering_r : Statements.zorn_r_implies_well_ordering_r := by
  map_cert Proofs.zorn_r_implies_well_ordering_r.entails

/-- `necessary-transversal-choice-r-implies-necessary-well-ordering-r` -/
theorem necessary_transversal_choice_r_implies_necessary_well_ordering_r : Statements.necessary_transversal_choice_r_implies_necessary_well_ordering_r := by
  map_cert Proofs.necessary_transversal_choice_r_implies_necessary_well_ordering_r.entails

/-- `well-ordering-weak-rigid-comprehension-and-bf-imply-modal-well-ordering` -/
theorem well_ordering_weak_rigid_comprehension_and_bf_imply_modal_well_ordering : Statements.well_ordering_weak_rigid_comprehension_and_bf_imply_modal_well_ordering := by
  map_cert Proofs.well_ordering_weak_rigid_comprehension_and_bf_imply_modal_well_ordering.entails

/-- `bf-weak-rigid-comprehension-atomicity-and-relational-choice-imply-intensional-choice` -/
theorem bf_weak_rigid_comprehension_atomicity_and_relational_choice_imply_intensional_choice : Statements.bf_weak_rigid_comprehension_atomicity_and_relational_choice_imply_intensional_choice := by
  map_cert Meta.bf_weak_rigid_comprehension_atomicity_and_relational_choice_imply_intensional_choice

/-- `strong-atomicity-weak-rigid-comprehension-and-relational-choice-imply-intensional-choice` -/
theorem strong_atomicity_weak_rigid_comprehension_and_relational_choice_imply_intensional_choice : Statements.strong_atomicity_weak_rigid_comprehension_and_relational_choice_imply_intensional_choice := by
  map_cert Proofs.strong_atomicity_weak_rigid_comprehension_and_relational_choice_imply_intensional_choice.entails

/-- `strong-atomicity-t-necessary-rigid-comprehension-and-rigid-power-imply-bf-t` -/
theorem strong_atomicity_t_necessary_rigid_comprehension_and_rigid_power_imply_bf_t : Statements.strong_atomicity_t_necessary_rigid_comprehension_and_rigid_power_imply_bf_t := by
  map_cert _root_.Classicism.slt_nrc_rp_bft.entails

/-- `strong-atomicity-necessary-rigid-comprehension-and-rigid-power-imply-bf-relational` -/
theorem strong_atomicity_necessary_rigid_comprehension_and_rigid_power_imply_bf_relational : Statements.strong_atomicity_necessary_rigid_comprehension_and_rigid_power_imply_bf_relational := by
  map_cert Meta.strong_atomicity_necessary_rigid_comprehension_and_rigid_power_imply_bf_relational

/-- `atomicity-and-rigid-comprehension-imply-rigid-power` -/
theorem atomicity_and_rigid_comprehension_imply_rigid_power : Statements.atomicity_and_rigid_comprehension_imply_rigid_power := by
  map_cert Meta.atomicity_and_rigid_comprehension_imply_rigid_power

/-- `necessary-atomicity-and-necessary-rigid-comprehension-imply-necessary-rigid-power` -/
theorem necessary_atomicity_and_necessary_rigid_comprehension_imply_necessary_rigid_power : Statements.necessary_atomicity_and_necessary_rigid_comprehension_imply_necessary_rigid_power := by
  map_cert Meta.necessary_atomicity_and_necessary_rigid_comprehension_imply_necessary_rigid_power

/-- `necessary-strong-atomicity-and-necessary-rigid-comprehension-imply-necessary-bf-relational` -/
theorem necessary_strong_atomicity_and_necessary_rigid_comprehension_imply_necessary_bf_relational : Statements.necessary_strong_atomicity_and_necessary_rigid_comprehension_imply_necessary_bf_relational := by
  map_cert Meta.necessary_strong_atomicity_and_necessary_rigid_comprehension_imply_necessary_bf_relational

/-- `modalized-relational-choice-implies-intensional-choice` -/
theorem modalized_relational_choice_implies_intensional_choice : Statements.modalized_relational_choice_implies_intensional_choice := by
  map_cert Proofs.modalized_relational_choice_implies_intensional_choice.entails

/-- `modalized-relational-choice-implies-relational-choice` -/
theorem modalized_relational_choice_implies_relational_choice : Statements.modalized_relational_choice_implies_relational_choice := by
  map_cert Proofs.modalized_relational_choice_implies_relational_choice.entails

/-- `necessary-relational-choice-and-intensional-choice-imply-modalized-relational-choice` -/
theorem necessary_relational_choice_and_intensional_choice_imply_modalized_relational_choice : Statements.necessary_relational_choice_and_intensional_choice_imply_modalized_relational_choice := by
  map_cert Proofs.necessary_relational_choice_and_intensional_choice_imply_modalized_relational_choice.entails

/-- `necessary-modalized-relational-choice-r-implies-modalized-relational-choice-r` -/
theorem necessary_modalized_relational_choice_r_implies_modalized_relational_choice_r : Statements.necessary_modalized_relational_choice_r_implies_modalized_relational_choice_r := by
  map_cert Proofs.necessary_modalized_relational_choice_r_implies_modalized_relational_choice_r.entails

/-- `necessary-modalized-relational-choice-implies-necessary-intensional-choice` -/
theorem necessary_modalized_relational_choice_implies_necessary_intensional_choice : Statements.necessary_modalized_relational_choice_implies_necessary_intensional_choice := by
  map_cert Proofs.necessary_modalized_relational_choice_implies_necessary_intensional_choice.entails

/-- `necessary-modalized-relational-choice-implies-necessary-relational-choice` -/
theorem necessary_modalized_relational_choice_implies_necessary_relational_choice : Statements.necessary_modalized_relational_choice_implies_necessary_relational_choice := by
  map_cert Proofs.necessary_modalized_relational_choice_implies_necessary_relational_choice.entails

/-- `necessary-relational-choice-and-necessary-intensional-choice-imply-necessary-modalized-relational-choice` -/
theorem necessary_relational_choice_and_necessary_intensional_choice_imply_necessary_modalized_relational_choice : Statements.necessary_relational_choice_and_necessary_intensional_choice_imply_necessary_modalized_relational_choice := by
  map_cert Proofs.necessary_relational_choice_and_necessary_intensional_choice_imply_necessary_modalized_relational_choice.entails

/-- `no-pure-contingency-and-modalized-relational-choice-imply-necessary-modalized-relational-choice` -/
theorem no_pure_contingency_and_modalized_relational_choice_imply_necessary_modalized_relational_choice : Statements.no_pure_contingency_and_modalized_relational_choice_imply_necessary_modalized_relational_choice := by
  map_cert (Entails.mono_right (Ax₃ := P.NecModalizedRelationalChoice.schema) (by map_box) (npc_union_entails_box_pure P.ModalizedRelationalChoice.schema_closedTypes))

/-- `modal-well-ordering-implies-modalized-relational-choice` -/
theorem modal_well_ordering_implies_modalized_relational_choice : Statements.modal_well_ordering_implies_modalized_relational_choice := by
  map_cert Proofs.modal_well_ordering_implies_modalized_relational_choice.entails

/-- `modal-well-ordering-implies-necessary-modalized-relational-choice` -/
theorem modal_well_ordering_implies_necessary_modalized_relational_choice : Statements.modal_well_ordering_implies_necessary_modalized_relational_choice := by
  map_cert Proofs.modal_well_ordering_implies_necessary_modalized_relational_choice.entails

/-- `five-implies-nd-implies-two-hat-implies-nd` -/
theorem five_implies_nd_implies_two_hat_implies_nd : Statements.five_implies_nd_implies_two_hat_implies_nd := by
  map_cert Proofs.five_implies_nd_implies_two_hat_implies_nd.entails

/-- `truth-implies-nd-implies-five-implies-nd` -/
theorem truth_implies_nd_implies_five_implies_nd : Statements.truth_implies_nd_implies_five_implies_nd := by
  map_cert Proofs.truth_implies_nd_implies_five_implies_nd.entails

/-- `truth-implies-nd-implies-truth-implies-five` -/
theorem truth_implies_nd_implies_truth_implies_five : Statements.truth_implies_nd_implies_truth_implies_five := by
  map_cert Proofs.truth_implies_nd_implies_truth_implies_five.entails

/-- `truth-implies-two-hat-implies-five-implies-two-hat` -/
theorem truth_implies_two_hat_implies_five_implies_two_hat : Statements.truth_implies_two_hat_implies_five_implies_two_hat := by
  map_cert Proofs.truth_implies_two_hat_implies_five_implies_two_hat.entails

/-- `truth-implies-two-hat-implies-truth-implies-five` -/
theorem truth_implies_two_hat_implies_truth_implies_five : Statements.truth_implies_two_hat_implies_truth_implies_five := by
  map_cert Proofs.truth_implies_two_hat_implies_truth_implies_five.entails

/-- `five-implies-nd-implies-five-implies-two-hat` -/
theorem five_implies_nd_implies_five_implies_two_hat : Statements.five_implies_nd_implies_five_implies_two_hat := by
  map_cert Proofs.five_implies_nd_implies_five_implies_two_hat.entails

/-- `five-implies-nd-and-truth-implies-five-imply-truth-implies-nd` -/
theorem five_implies_nd_and_truth_implies_five_imply_truth_implies_nd : Statements.five_implies_nd_and_truth_implies_five_imply_truth_implies_nd := by
  map_cert Proofs.five_implies_nd_and_truth_implies_five_imply_truth_implies_nd.entails

/-- `five-implies-two-hat-and-truth-implies-five-imply-truth-implies-two-hat` -/
theorem five_implies_two_hat_and_truth_implies_five_imply_truth_implies_two_hat : Statements.five_implies_two_hat_and_truth_implies_five_imply_truth_implies_two_hat := by
  map_cert Proofs.five_implies_two_hat_and_truth_implies_five_imply_truth_implies_two_hat.entails

/-- `two-hat-implies-nd-and-five-implies-two-hat-imply-five-implies-nd` -/
theorem two_hat_implies_nd_and_five_implies_two_hat_imply_five_implies_nd : Statements.two_hat_implies_nd_and_five_implies_two_hat_imply_five_implies_nd := by
  map_cert Proofs.two_hat_implies_nd_and_five_implies_two_hat_imply_five_implies_nd.entails

/-- `necessary-distinctness-necessary-t-implies-necessary-two-hat-implies-nd` -/
theorem necessary_distinctness_necessary_t_implies_necessary_two_hat_implies_nd : Statements.necessary_distinctness_necessary_t_implies_necessary_two_hat_implies_nd := by
  map_cert Proofs.necessary_distinctness_necessary_t_implies_necessary_two_hat_implies_nd.entails

/-- `necessary-five-implies-nd-implies-two-hat-implies-nd` -/
theorem necessary_five_implies_nd_implies_two_hat_implies_nd : Statements.necessary_five_implies_nd_implies_two_hat_implies_nd := by
  map_cert Proofs.necessary_five_implies_nd_implies_two_hat_implies_nd.entails

/-- `necessary-truth-implies-nd-implies-necessary-five-implies-nd` -/
theorem necessary_truth_implies_nd_implies_necessary_five_implies_nd : Statements.necessary_truth_implies_nd_implies_necessary_five_implies_nd := by
  map_cert Proofs.necessary_truth_implies_nd_implies_necessary_five_implies_nd.entails

/-- `necessary-truth-implies-nd-implies-necessary-truth-implies-five` -/
theorem necessary_truth_implies_nd_implies_necessary_truth_implies_five : Statements.necessary_truth_implies_nd_implies_necessary_truth_implies_five := by
  map_cert Proofs.necessary_truth_implies_nd_implies_necessary_truth_implies_five.entails

/-- `necessary-truth-implies-two-hat-implies-five-implies-two-hat` -/
theorem necessary_truth_implies_two_hat_implies_five_implies_two_hat : Statements.necessary_truth_implies_two_hat_implies_five_implies_two_hat := by
  map_cert Proofs.necessary_truth_implies_two_hat_implies_five_implies_two_hat.entails

/-- `necessary-truth-implies-two-hat-implies-truth-implies-five` -/
theorem necessary_truth_implies_two_hat_implies_truth_implies_five : Statements.necessary_truth_implies_two_hat_implies_truth_implies_five := by
  map_cert Proofs.necessary_truth_implies_two_hat_implies_truth_implies_five.entails

/-- `necessary-five-implies-nd-implies-five-implies-two-hat` -/
theorem necessary_five_implies_nd_implies_five_implies_two_hat : Statements.necessary_five_implies_nd_implies_five_implies_two_hat := by
  map_cert Proofs.necessary_five_implies_nd_implies_five_implies_two_hat.entails

/-- `necessary-five-implies-nd-and-necessary-truth-implies-five-imply-necessary-truth-implies-nd` -/
theorem necessary_five_implies_nd_and_necessary_truth_implies_five_imply_necessary_truth_implies_nd : Statements.necessary_five_implies_nd_and_necessary_truth_implies_five_imply_necessary_truth_implies_nd := by
  map_cert Proofs.necessary_five_implies_nd_and_necessary_truth_implies_five_imply_necessary_truth_implies_nd.entails

/-- `necessary-five-implies-two-hat-and-truth-implies-five-imply-truth-implies-two-hat` -/
theorem necessary_five_implies_two_hat_and_truth_implies_five_imply_truth_implies_two_hat : Statements.necessary_five_implies_two_hat_and_truth_implies_five_imply_truth_implies_two_hat := by
  map_cert Proofs.necessary_five_implies_two_hat_and_truth_implies_five_imply_truth_implies_two_hat.entails

/-- `necessary-two-hat-implies-nd-and-five-implies-two-hat-imply-five-implies-nd` -/
theorem necessary_two_hat_implies_nd_and_five_implies_two_hat_imply_five_implies_nd : Statements.necessary_two_hat_implies_nd_and_five_implies_two_hat_imply_five_implies_nd := by
  map_cert Proofs.necessary_two_hat_implies_nd_and_five_implies_two_hat_imply_five_implies_nd.entails

/-- `necessary-truth-implies-five-necessity-implies-truth-implies-five-necessity` -/
theorem necessary_truth_implies_five_necessity_implies_truth_implies_five_necessity : Statements.necessary_truth_implies_five_necessity_implies_truth_implies_five_necessity := by
  map_cert Proofs.necessary_truth_implies_five_necessity_implies_truth_implies_five_necessity.entails

/-- `necessary-truth-implies-two-hat-necessity-implies-truth-implies-two-hat-necessity` -/
theorem necessary_truth_implies_two_hat_necessity_implies_truth_implies_two_hat_necessity : Statements.necessary_truth_implies_two_hat_necessity_implies_truth_implies_two_hat_necessity := by
  map_cert Proofs.necessary_truth_implies_two_hat_necessity_implies_truth_implies_two_hat_necessity.entails

/-- `necessary-five-implies-two-hat-necessity-implies-five-implies-two-hat-necessity` -/
theorem necessary_five_implies_two_hat_necessity_implies_five_implies_two_hat_necessity : Statements.necessary_five_implies_two_hat_necessity_implies_five_implies_two_hat_necessity := by
  map_cert Proofs.necessary_five_implies_two_hat_necessity_implies_five_implies_two_hat_necessity.entails

/-- `necessary-five-implies-nd-necessity-implies-five-implies-nd-necessity` -/
theorem necessary_five_implies_nd_necessity_implies_five_implies_nd_necessity : Statements.necessary_five_implies_nd_necessity_implies_five_implies_nd_necessity := by
  map_cert Proofs.necessary_five_implies_nd_necessity_implies_five_implies_nd_necessity.entails

/-- `necessary-two-hat-implies-nd-necessity-implies-two-hat-implies-nd-necessity` -/
theorem necessary_two_hat_implies_nd_necessity_implies_two_hat_implies_nd_necessity : Statements.necessary_two_hat_implies_nd_necessity_implies_two_hat_implies_nd_necessity := by
  map_cert Proofs.necessary_two_hat_implies_nd_necessity_implies_two_hat_implies_nd_necessity.entails

/-- `vicinity-and-barcan-t-imply-two-hat-implies-nd` -/
theorem vicinity_and_barcan_t_imply_two_hat_implies_nd : Statements.vicinity_and_barcan_t_imply_two_hat_implies_nd := by
  map_cert Proofs.vicinity_and_barcan_t_imply_two_hat_implies_nd.entails

/-- `necessary-vicinity-and-necessary-barcan-t-imply-necessary-two-hat-implies-nd` -/
theorem necessary_vicinity_and_necessary_barcan_t_imply_necessary_two_hat_implies_nd : Statements.necessary_vicinity_and_necessary_barcan_t_imply_necessary_two_hat_implies_nd := by
  map_cert Proofs.necessary_vicinity_and_necessary_barcan_t_imply_necessary_two_hat_implies_nd.entails

/-- `strong-atomicity-t-implies-two-hat-implies-nd` -/
theorem strong_atomicity_t_implies_two_hat_implies_nd : Statements.strong_atomicity_t_implies_two_hat_implies_nd := by
  map_cert Proofs.strong_atomicity_t_implies_two_hat_implies_nd.entails

/-- `necessary-strong-atomicity-t-implies-necessary-two-hat-implies-nd` -/
theorem necessary_strong_atomicity_t_implies_necessary_two_hat_implies_nd : Statements.necessary_strong_atomicity_t_implies_necessary_two_hat_implies_nd := by
  map_cert Proofs.necessary_strong_atomicity_t_implies_necessary_two_hat_implies_nd.entails

/-- `no-pure-contingency-and-truth-implies-five-necessity-imply-necessary-truth-implies-five-necessity` -/
theorem no_pure_contingency_and_truth_implies_five_necessity_imply_necessary_truth_implies_five_necessity : Statements.no_pure_contingency_and_truth_implies_five_necessity_imply_necessary_truth_implies_five_necessity := by
  map_cert npc_truthImpliesFive_entails_nec

/-- `no-pure-contingency-and-truth-implies-two-hat-necessity-imply-necessary-truth-implies-two-hat-necessity` -/
theorem no_pure_contingency_and_truth_implies_two_hat_necessity_imply_necessary_truth_implies_two_hat_necessity : Statements.no_pure_contingency_and_truth_implies_two_hat_necessity_imply_necessary_truth_implies_two_hat_necessity := by
  map_cert npc_truthImpliesTwoHat_entails_nec

/-- `no-pure-contingency-and-five-implies-two-hat-necessity-imply-necessary-five-implies-two-hat-necessity` -/
theorem no_pure_contingency_and_five_implies_two_hat_necessity_imply_necessary_five_implies_two_hat_necessity : Statements.no_pure_contingency_and_five_implies_two_hat_necessity_imply_necessary_five_implies_two_hat_necessity := by
  map_cert npc_fiveImpliesTwoHat_entails_nec

/-- `no-pure-contingency-and-five-implies-nd-necessity-imply-necessary-five-implies-nd-necessity` -/
theorem no_pure_contingency_and_five_implies_nd_necessity_imply_necessary_five_implies_nd_necessity : Statements.no_pure_contingency_and_five_implies_nd_necessity_imply_necessary_five_implies_nd_necessity := by
  map_cert npc_fiveImpliesNd_entails_nec

/-- `no-pure-contingency-and-two-hat-implies-nd-necessity-imply-necessary-two-hat-implies-nd-necessity` -/
theorem no_pure_contingency_and_two_hat_implies_nd_necessity_imply_necessary_two_hat_implies_nd_necessity : Statements.no_pure_contingency_and_two_hat_implies_nd_necessity_imply_necessary_two_hat_implies_nd_necessity := by
  map_cert npc_twoHatImpliesNd_entails_nec

/-- `actuality-implies-five-implies-two-hat` -/
theorem actuality_implies_five_implies_two_hat : Statements.actuality_implies_five_implies_two_hat := by
  map_cert Proofs.actuality_implies_five_implies_two_hat.entails

/-- `necessary-actuality-implies-necessary-five-implies-two-hat` -/
theorem necessary_actuality_implies_necessary_five_implies_two_hat : Statements.necessary_actuality_implies_necessary_five_implies_two_hat := by
  map_cert Proofs.necessary_actuality_implies_necessary_five_implies_two_hat.entails

/-- `necessary-two-hat-implies-nd-implies-necessary-five-implies-two-hat` -/
theorem necessary_two_hat_implies_nd_implies_necessary_five_implies_two_hat : Statements.necessary_two_hat_implies_nd_implies_necessary_five_implies_two_hat := by
  map_cert Proofs.necessary_two_hat_implies_nd_implies_necessary_five_implies_two_hat.entails

/-- `actuality-and-two-hat-implies-nd-imply-strong-actuality` -/
theorem actuality_and_two_hat_implies_nd_imply_strong_actuality : Statements.actuality_and_two_hat_implies_nd_imply_strong_actuality := by
  map_cert Proofs.actuality_and_two_hat_implies_nd_imply_strong_actuality.entails

/-- `necessary-actuality-and-necessary-two-hat-implies-nd-imply-necessary-strong-actuality` -/
theorem necessary_actuality_and_necessary_two_hat_implies_nd_imply_necessary_strong_actuality : Statements.necessary_actuality_and_necessary_two_hat_implies_nd_imply_necessary_strong_actuality := by
  map_cert Proofs.necessary_actuality_and_necessary_two_hat_implies_nd_imply_necessary_strong_actuality.entails


/-! ### Ported from Daniel Kodsi's submission (24 October 2026)

Proofs by GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, in `Results/Research/`; certified
there by the map's own pipeline. -/

/-- `relational-choice-and-boolean-completeness-imply-actuality` -/
theorem relational_choice_and_boolean_completeness_imply_actuality : Statements.relational_choice_and_boolean_completeness_imply_actuality := by
  map_cert _root_.Classicism.Research.Choice.choice_completeness_actuality_sharp.entails

/-- `strong-atomicity-and-rigid-comprehension-imply-necessary-strong-atomicity` -/
theorem strong_atomicity_and_rigid_comprehension_imply_necessary_strong_atomicity : Statements.strong_atomicity_and_rigid_comprehension_imply_necessary_strong_atomicity := by
  map_cert (AxiomSet.Entails.mono_right (schema_subset_args _)
    _root_.Classicism.Research.SealedWorldCover.strong_atomicity_rc_implies_necessary_strong_atomicity.listEntails)

/-- `strong-atomicity-and-rigid-comprehension-imply-necessary-rigid-comprehension` -/
theorem strong_atomicity_and_rigid_comprehension_imply_necessary_rigid_comprehension : Statements.strong_atomicity_and_rigid_comprehension_imply_necessary_rigid_comprehension := by
  map_cert (
    have sl := AxiomSet.Entails.union_left P.StrongAtomicity.schema P.RigidComprehension.schema
    have rc := AxiomSet.Entails.union_right P.StrongAtomicity.schema P.RigidComprehension.schema
    have hs := AxiomSet.Entails.union (AxiomSet.Entails.union (AxiomSet.Entails.union
      (AxiomSet.Entails.union sl sl) sl) sl) sl
    have hr := AxiomSet.Entails.union (AxiomSet.Entails.union (AxiomSet.Entails.union
      (AxiomSet.Entails.union hs rc) rc) rc) rc
    AxiomSet.Entails.mono_right (schema_subset_args _) (AxiomSet.Entails.trans hr
      _root_.Classicism.Research.ModalPropagationConsequences.strong_atomicity_rc_necessary_comprehension.listEntails))

/-- `c5-and-atomicity-t-imply-no-pure-contingency` (ported 25 October 2026) -/
theorem c5_and_atomicity_t_imply_no_pure_contingency : Statements.c5_and_atomicity_t_imply_no_pure_contingency :=
  _root_.Classicism.Meta.Research.NPC.c5_and_atomicity_t_imply_no_pure_contingency

/-- `c5-and-atomicity-imply-no-pure-contingency`, through Atomicity ⇒ Atomicity (type t) -/
theorem c5_and_atomicity_imply_no_pure_contingency : Statements.c5_and_atomicity_imply_no_pure_contingency := by
  intro Sig hS Ax hnd hat
  exact c5_and_atomicity_t_imply_no_pure_contingency hS Ax hnd (atomicity_r_implies_atomicity_t hS Ax hat)

/-- `atomicity-and-rigid-comprehension-imply-weakly-rigid-power` -/
theorem atomicity_and_rigid_comprehension_imply_weakly_rigid_power : Statements.atomicity_and_rigid_comprehension_imply_weakly_rigid_power := by
  map_cert (AxiomSet.Entails.mono_right (schema_subset_args _)
    _root_.Classicism.Research.RigidityClosure.atomicity_rc_implies_weak_power.listEntails)

/-- `distinctness-necessary-t-and-inextensible-comprehension-imply-weakly-rigid-power`: the
certified rule has ND at every type as its premise, recovered from ND at `t` through 5 and B. -/
theorem distinctness_necessary_t_and_inextensible_comprehension_imply_weakly_rigid_power : Statements.distinctness_necessary_t_and_inextensible_comprehension_imply_weakly_rigid_power := by
  map_cert (
    have ndt := AxiomSet.Entails.union_left P.NecessityOfDistinctnessT.schema P.InextensibleComprehension.schema
    have ic := AxiomSet.Entails.union_right P.NecessityOfDistinctnessT.schema P.InextensibleComprehension.schema
    have nd := AxiomSet.Entails.trans ndt (AxiomSet.Entails.trans
      Proofs.distinctness_necessary_t_implies_modal_five.entails (AxiomSet.Entails.trans
        Proofs.modal_five_implies_modal_b.entails Proofs.modal_b_implies_distinctness_necessary_r.entails))
    AxiomSet.Entails.mono_right (schema_subset_args _) (AxiomSet.Entails.trans (AxiomSet.Entails.union nd ic)
      _root_.Classicism.Research.InextensiblePower.nd_ic_weaklyRigidPower.listEntails))

end Classicism.Map
