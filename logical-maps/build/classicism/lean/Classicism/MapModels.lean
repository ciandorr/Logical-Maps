import Classicism.ModelStatements
import Classicism.Results.Consistency.Consistency
import Classicism.Models.Conditions
import Classicism.Models.FullActionModels
import Classicism.Models.OldNewComplete
import Classicism.Models.FiniteCompressionSeparation
import Classicism.Models.FixedPointEntranceBarcan
import Classicism.Models.FixedPointEntranceRelationalBarcan
import Classicism.Models.FixedPointEntranceChoice
import Mathlib.Data.Fintype.Powerset
import Mathlib.Data.Finite.Sigma
import Mathlib.Data.Finite.Prod

/-!
# The map's models, certified verdict by verdict

One theorem per verdict a model record proves in Lean (its `lean.verdicts`), named
`Models.<model id>.<principle id>`, whose type is the statement the map generates for it
(`Classicism/ModelStatements.lean`): that the record's Lean model is an intensional action
model, and that the principle holds in it, or fails. These are the refs `pmap lean-check`
checks, against the generated statements and the map's list of allowed axioms.

The models are those of Appendix D (`Models/`) and the two M-set models of §3
(`Semantics/IntensionalExamples.lean`), over the pure signature. A principle at every
signature, `P.X.schemaIn`, holds in such a model iff its pure schema does
(`Premodel.holdsAx_schemaIn_iff`), so each certificate cites a verdict proved in `Models/`
about a sentence of the schema. A verdict on a principle relative to a signature is about a
model of an admitted signature (the statement then also asks `Admitted`): the record's model
with `Σ` interpreted (`Semantics/Interpretations.lean`), certified through the map's arguments
(`MapDerived.lean`).

What composes these into a certificate of a whole model, the map's model statement, is
`Premodel.theory` (`Semantics/IntensionalTheory.lean`): the theory of a model of an admitted
signature is consistent, complete, and entails exactly the schemas that hold in the model.
-/

namespace Classicism.Meta.Intensional.Premodel

open CategoryTheory

variable {C : Type} [SmallCategory C] {B : Premodel Signature.pure C}

/-! ## Glue: from the verdicts as proved to the statements as generated -/

theorem verdict_holds (M : B.IsModel) {Ax : AxiomSet Signature.pure} (h : B.HoldsAx Ax) :
    B.IsModel ∧ B.HoldsAx (AxiomSet.ofPure Ax) :=
  ⟨M, (holdsAx_schemaIn_iff B Ax).2 h⟩

theorem verdict_fails (M : B.IsModel) {Ax : AxiomSet Signature.pure} (h : ¬ B.HoldsAx Ax) :
    B.IsModel ∧ ¬ B.HoldsAx (AxiomSet.ofPure Ax) :=
  ⟨M, fun h' => h ((holdsAx_schemaIn_iff B Ax).1 h')⟩

/-- A schema indexed by types holds iff its instance at each closed type does. -/
theorem holdsAx_indexed {α : Type} {Cl : α → Prop} {q : α → Sentence Signature.pure} :
    B.HoldsAx (fun a => ∃ x, Cl x ∧ a = q x) ↔ ∀ x, Cl x → B.HoldsSentence (q x) :=
  ⟨fun h x hx => h _ ⟨x, hx, rfl⟩, fun h _ ⟨x, hx, e⟩ => e ▸ h x hx⟩

/-- A schema of one sentence holds iff the sentence does. -/
theorem holdsAx_eq {q : Sentence Signature.pure} : B.HoldsAx (fun a => a = q) ↔ B.HoldsSentence q :=
  ⟨fun h => h _ rfl, fun h _ e => e ▸ h⟩

/-- A schema fails when one of its sentences does. -/
theorem not_holdsAx_of {Ax : AxiomSet Signature.pure} {a : Sentence Signature.pure} (ha : Ax a)
    (h : ¬ B.HoldsSentence a) : ¬ B.HoldsAx Ax :=
  fun H => h (H a ha)

/-- No Pure Contingency, in a model on one object: every model on a monoid. -/
theorem holdsAx_npc_pure [Subsingleton C] (M : B.IsModel) : B.HoldsAx (AxiomSet.noContingency _) := by
  rw [← AxiomSet.npc_pure_eq]
  exact B.holdsAx_npc M

/-- In a model on one object, a pure sentence of the paper's language that holds is necessary. -/
theorem holdsSentence_box_of_npc [Subsingleton C] (M : B.IsModel) {p : Sentence Signature.pure}
    (hc : p.closedTypes = true) (h : B.HoldsSentence p) : B.HoldsSentence (Term.box p) := by
  have hi := B.holdsAx_npc M (Term.imp p (Term.box p))
    ⟨by simp [hc], p, Term.pure_of_pureSig p, rfl⟩
  exact (B.holds_imp M _ _ _ _).1 hi h

end Classicism.Meta.Intensional.Premodel

namespace Classicism.Map.Models

open Meta Meta.Intensional Meta.Intensional.Premodel

namespace finite_support_permutations

local notation "M" => Classicism.Meta.Intensional.Perms.model_isModel

theorem distinctness_necessary_r : Statements.Models.finite_support_permutations.distinctness_necessary_r :=
  verdict_holds M <|
    holdsAx_indexed.2 fun σ _ => holdsSentence_of_box _ M (Perms.box_nd σ)

theorem atomlessness : Statements.Models.finite_support_permutations.atomlessness :=
  verdict_holds M <|
    holdsAx_eq.2 Perms.atomlessness

theorem boolean_completeness_r : Statements.Models.finite_support_permutations.boolean_completeness_r :=
  verdict_fails M <|
    not_holdsAx_of ⟨.arr .e .t, by simp, rfl⟩ (Perms.not_bc)

end finite_support_permutations

namespace finite_support_monotone_surjections

local notation "M" => Classicism.Meta.Intensional.MonoidModel.model_isModel Classicism.Meta.Intensional.Monoids.monoSurj

theorem atomlessness : Statements.Models.finite_support_monotone_surjections.atomlessness :=
  verdict_holds M <|
    holdsAx_eq.2 Monoids.MonoSurj.atomlessness

theorem distinctness_necessary_r : Statements.Models.finite_support_monotone_surjections.distinctness_necessary_r :=
  verdict_fails M <|
    not_holdsAx_of ⟨.e, trivial, rfl⟩ (Monoids.MonoSurj.not_nd_e)

theorem boolean_completeness_r : Statements.Models.finite_support_monotone_surjections.boolean_completeness_r :=
  verdict_fails M <|
    not_holdsAx_of ⟨.arr .e .t, by simp, rfl⟩ (Monoids.MonoSurj.not_bc)

end finite_support_monotone_surjections

namespace finite_support_monotone_maps

local notation "M" => Classicism.Meta.Intensional.MonoidModel.model_isModel Classicism.Meta.Intensional.Monoids.mono

theorem atomlessness : Statements.Models.finite_support_monotone_maps.atomlessness :=
  verdict_holds M <|
    holdsAx_eq.2 Monoids.Mono.atomlessness

theorem boolean_completeness_r : Statements.Models.finite_support_monotone_maps.boolean_completeness_r :=
  verdict_fails M <|
    not_holdsAx_of ⟨.arr .e .t, by simp, rfl⟩ (Monoids.Mono.not_bc)

end finite_support_monotone_maps

namespace finite_support_identity_or_collapse

local notation "M" => Classicism.Meta.Intensional.MonoidModel.model_isModel Classicism.Meta.Intensional.Monoids.mono01

theorem boolean_completeness_r : Statements.Models.finite_support_identity_or_collapse.boolean_completeness_r :=
  verdict_fails M <|
    not_holdsAx_of ⟨.arr .e .t, by simp, rfl⟩ (Monoids.Mono01.not_bc)

end finite_support_identity_or_collapse

namespace finite_support_identity_or_collapse_surjections

local notation "M" => Classicism.Meta.Intensional.MonoidModel.model_isModel Classicism.Meta.Intensional.Monoids.monoSurj01

theorem boolean_completeness_r : Statements.Models.finite_support_identity_or_collapse_surjections.boolean_completeness_r :=
  verdict_fails M <|
    not_holdsAx_of ⟨.arr .e .t, by simp, rfl⟩ (Monoids.MonoSurj01.not_bc)

end finite_support_identity_or_collapse_surjections

namespace finite_support_truncations

local notation "M" => Classicism.Meta.Intensional.MonoidModel.model_isModel Classicism.Meta.Intensional.Monoids.truncs

theorem actuality : Statements.Models.finite_support_truncations.actuality :=
  verdict_fails M <|
    not_holdsAx_of rfl (Monoids.Truncs.not_actuality)

theorem boolean_completeness_r : Statements.Models.finite_support_truncations.boolean_completeness_r :=
  verdict_fails M <|
    not_holdsAx_of ⟨.arr .e .t, by simp, rfl⟩ (Monoids.Truncs.not_bc)

end finite_support_truncations

namespace finite_support_dyadic_roundings

local notation "M" => Classicism.Meta.Intensional.MonoidModel.model_isModel Classicism.Meta.Intensional.Monoids.pow2

theorem barcan_r : Statements.Models.finite_support_dyadic_roundings.barcan_r :=
  verdict_fails M <|
    not_holdsAx_of ⟨.e, trivial, rfl⟩ (Monoids.Pow2.not_bf_e)

theorem boolean_completeness_r : Statements.Models.finite_support_dyadic_roundings.boolean_completeness_r :=
  verdict_fails M <|
    not_holdsAx_of ⟨.arr .e .t, by simp, rfl⟩ (Monoids.Pow2.not_bc)

end finite_support_dyadic_roundings

namespace finite_support_truncated_shifts

local notation "M" => Classicism.Meta.Intensional.MonoidModel.model_isModel Classicism.Meta.Intensional.Monoids.shifts

theorem boolean_completeness_r : Statements.Models.finite_support_truncated_shifts.boolean_completeness_r :=
  verdict_fails M <|
    not_holdsAx_of ⟨.arr .e .t, by simp, rfl⟩ (Monoids.Shifts.not_bc)

end finite_support_truncated_shifts

namespace finite_support_two_object_all_maps

local notation "M" => Classicism.Meta.Intensional.ContingentBarcan.model_isModel

theorem barcan_r : Statements.Models.finite_support_two_object_all_maps.barcan_r :=
  verdict_holds M <|
    holdsAx_indexed.2 fun σ _ => ContingentBarcan.bf σ

theorem necessary_barcan_r : Statements.Models.finite_support_two_object_all_maps.necessary_barcan_r :=
  verdict_fails M <|
    not_holdsAx_of ⟨.e, trivial, rfl⟩ (ContingentBarcan.not_box_bf_e)

end finite_support_two_object_all_maps

namespace symmetric_two_object_unpinned

/-- Least upper bounds at both objects: at the first by the group's theorem, at the second as
unions (`SymIdeal.two_hasLUBs`); so Boolean Completeness holds at every world. -/
theorem necessary_boolean_completeness_r :
    Statements.Models.symmetric_two_object_unpinned.necessary_boolean_completeness_r :=
  verdict_holds (SymBase.model_isModel SymIdeal.twoBase) <|
    SymIdeal.twoBase.model.entails_holds (SymBase.model_isModel SymIdeal.twoBase)
      P.NecBooleanCompleteness.of_lub.entails
      (holdsAx_indexed.2 fun ρ _ => SymBase.holds_box_bc_lub (SymIdeal.two_hasLUBs ρ))

end symmetric_two_object_unpinned

namespace symmetric_old_new_individuals

/-! The old/new model in Lean (`Models/OldNew*.lean`), ported 24 October 2026 from Daniel
Kodsi's submission; proofs by GPT-6 Astra (OpenAI), prompted by Daniel Kodsi. -/

theorem distinctness_necessary_r :
    Statements.Models.symmetric_old_new_individuals.distinctness_necessary_r :=
  verdict_holds OldNew.isModel OldNew.holds_nd_schema

theorem boolean_completeness_r :
    Statements.Models.symmetric_old_new_individuals.boolean_completeness_r :=
  verdict_holds OldNew.isModel OldNew.holds_bc_schema

/-- Boolean Completeness fails at `et` at the object `O`, which the evaluation point reaches. -/
theorem necessary_boolean_completeness_r :
    Statements.Models.symmetric_old_new_individuals.necessary_boolean_completeness_r :=
  verdict_fails OldNew.isModel <|
    not_holdsAx_of ⟨OldNew.et, ⟨trivial, trivial⟩, rfl⟩ OldNew.root_not_box_bc_et

end symmetric_old_new_individuals

namespace symmetric_finite_compression_entrance

/-! The finite-compression model in Lean (`Models/FiniteCompression*.lean`), ported 25 October 2026
from Daniel Kodsi's submission; proofs by GPT-6 Astra (OpenAI), prompted by Daniel Kodsi. -/

open Classicism.Meta.Intensional

theorem tame_rigidity_r :
    Statements.Models.symmetric_finite_compression_entrance.tame_rigidity_r :=
  verdict_holds FiniteCompression.isModel FiniteCompression.holds_tame_schema

theorem rigid_power_r :
    Statements.Models.symmetric_finite_compression_entrance.rigid_power_r :=
  verdict_holds FiniteCompression.isModel FiniteCompression.holds_rigid_power_schema

/-- Weakly Rigid Power fails at `et`. -/
theorem weakly_rigid_power_r :
    Statements.Models.symmetric_finite_compression_entrance.weakly_rigid_power_r :=
  verdict_fails FiniteCompression.isModel <|
    not_holdsAx_of ⟨FiniteCompression.et, ⟨trivial, trivial⟩, rfl⟩
      FiniteCompression.not_weakly_rigid_power_et

end symmetric_finite_compression_entrance

namespace symmetric_entrance_qualitative_links

/-! The one-point entrance to the qualitative-links tail (`Models/FixedPointEntrance*.lean`), ported
25 October 2026 from Daniel Kodsi's submission; proofs by GPT-6 Astra (OpenAI), prompted by Daniel
Kodsi. The rigidity verdicts are not formalized there. -/

open Classicism.Meta.Intensional.FixedPointEntrance

theorem relational_choice_r :
    Statements.Models.symmetric_entrance_qualitative_links.relational_choice_r :=
  verdict_holds Qualitative.isModel Qualitative.RelationalChoice.holds_relational_choice_schema

theorem barcan_t :
    Statements.Models.symmetric_entrance_qualitative_links.barcan_t :=
  verdict_fails Qualitative.isModel <| not_holdsAx_of rfl Qualitative.Barcan.not_barcan_t

theorem barcan_relational :
    Statements.Models.symmetric_entrance_qualitative_links.barcan_relational :=
  verdict_fails Qualitative.isModel <|
    not_holdsAx_of ⟨.t, trivial, rfl⟩ (Qualitative.RelationalBarcan.not_barcan_relational .t)

end symmetric_entrance_qualitative_links

namespace finite_support_pair_injections_or_collapses

local notation "M" => Classicism.Meta.Intensional.MonoidModel.model_isModel Classicism.Meta.Intensional.Monoids.pairInjCol

/-- Vicinity, with witness the proposition `0 ≠ 1` (`Monoids.pairInjCol_vicinity`). -/
theorem vicinity : Statements.Models.finite_support_pair_injections_or_collapses.vicinity :=
  verdict_holds M <| holdsAx_eq.2 Monoids.pairInjCol_vicinity

/-- BF at every type, every arrow agreeing on a finite set with a surjective one. -/
theorem barcan_r : Statements.Models.finite_support_pair_injections_or_collapses.barcan_r :=
  verdict_holds M <| holdsAx_indexed.2 fun σ _ => Monoids.pairInjCol_bf σ

theorem atomlessness : Statements.Models.finite_support_pair_injections_or_collapses.atomlessness :=
  verdict_holds M <| holdsAx_eq.2 Monoids.pairInjCol_atomlessness

/-- **Rigid Power fails** at `e → t`, with `F := ⊤` (`Monoids.PairInjCol.not_rigidPower`). -/
theorem rigid_power_r : Statements.Models.finite_support_pair_injections_or_collapses.rigid_power_r :=
  verdict_fails M <| not_holdsAx_of ⟨.arr .e .t, by simp, rfl⟩ Monoids.PairInjCol.not_rigidPower

end finite_support_pair_injections_or_collapses

end Classicism.Map.Models

/-! ## The models' proofs that they meet the map's conditions

What a model's record names under `lean.meets` where no lemma of `Models/` is already the
proof: the conditions of the finite-support group, for the monoids of Appendix D. -/

namespace Classicism.Map.Meets

open CategoryTheory Meta Meta.Intensional Meta.Intensional.MonoidModel Meta.Intensional.Monoids

/-- Among the monotone maps with `h0 = h1`, and the identity, the arrows other than the
identity are those collapsing `0` and `1`. -/
theorem ne_one_iff_collapse {S : Submonoid F} (hS : ∀ f ∈ S, f 0 = f 1 ∨ f = id) (g : S) :
    g ≠ 1 ↔ (g : F) 0 = (g : F) 1 := by
  constructor
  · intro h
    rcases hS g g.2 with h' | h'
    · exact h'
    · exact absurd (Subtype.ext h') h
  · rintro h rfl
    exact Nat.zero_ne_one h

namespace finite_support_monotone_maps

theorem positive_preserving : PositivePreserving mono :=
  ⟨fun g => g.2, ⟨fun _ => 1, monotone_const⟩, Nat.one_pos⟩

end finite_support_monotone_maps

namespace finite_support_identity_or_collapse

theorem positive_preserving : PositivePreserving mono01 :=
  ⟨fun g => g.2.1, ⟨fun _ => 1, monotone_const, Or.inl rfl⟩, Nat.one_pos⟩

theorem collapse_unpinned : CollapseUnpinned mono01 := by
  have hne := ne_one_iff_collapse (S := mono01) fun f hf => hf.2
  refine ⟨?_, ⟨Mono01.zero, (hne _).2 rfl⟩, fun g hg =>
    not_finPinned_of_free _ (Mono01.free_of_collapse g ((hne g).1 hg))⟩
  have : (ofPred fun g : mono01 => g ≠ 1) = Mono01.collapse := by
    show ofPred _ = ofPred _
    congr 1
    funext g
    exact propext (hne g)
  rw [this]
  exact ⟨{0, 1}, Set.toFinite _, Mono01.collapse_pinned⟩

end finite_support_identity_or_collapse

namespace finite_support_identity_or_collapse_surjections

theorem collapse_unpinned : CollapseUnpinned monoSurj01 := by
  have hne := ne_one_iff_collapse (S := monoSurj01) fun f hf => hf.2.2
  refine ⟨?_, ⟨MonoSurj01.half, (hne _).2 rfl⟩, fun g hg =>
    not_finPinned_of_free _ (MonoSurj01.free_of_collapse g ((hne g).1 hg))⟩
  have : (ofPred fun g : monoSurj01 => g ≠ 1) = MonoSurj01.collapse := by
    show ofPred _ = ofPred _
    congr 1
    funext g
    exact propext (hne g)
  rw [this]
  exact ⟨{0, 1}, Set.toFinite _, MonoSurj01.collapse_pinned⟩

end finite_support_identity_or_collapse_surjections

/-- A full M-set model has one individual. -/
theorem mset_one_individual (M : Type) [Monoid M] : (MSet.model M).OneIndividual :=
  fun _ => inferInstanceAs (Subsingleton Unit)

/-- A full M-set model on a finite monoid has finitely many propositions: sets of arrows. -/
theorem mset_finitely_many_propositions (M : Type) [Monoid M] [Finite M] :
    (MSet.model M).FinitelyManyPropositions := by
  haveI : Finite (SingleObj M) := inferInstanceAs (Finite Unit)
  haveI : ∀ V W : SingleObj M, Finite (V ⟶ W) := fun _ _ => inferInstanceAs (Finite M)
  change Finite (Set (Σ V : SingleObj M, PUnit × (SingleObj.star M ⟶ V)))
  infer_instance

instance : Fintype Idem := ⟨{.one, .k}, fun x => by cases x <;> simp⟩
instance : Fintype Invol := ⟨{.one, .k}, fun x => by cases x <;> simp⟩

namespace full_idempotent_monoid

/-- `k` has no retraction: `m · k = k` for both arrows `m`. -/
theorem unretracted : (MSet.model Idem).UnretractedArrow :=
  ⟨CategoryTheory.SingleObj.star Idem,
    (Idem.k : CategoryTheory.SingleObj.star Idem ⟶ CategoryTheory.SingleObj.star Idem),
    fun (m : CategoryTheory.SingleObj.star Idem ⟶ CategoryTheory.SingleObj.star Idem) e =>
      Idem.k_ne_one ((Idem.mul_k m).symm.trans (show (show Idem from m) * Idem.k = 1 from e))⟩

/-- The actual-world proposition `{1}` is isolated: the only other arrow is `k`, and every
arrow after `k` is `k` again. -/
theorem actual_world_isolated : (MSet.model Idem).ActualWorldIsolated := by
  let S := CategoryTheory.SingleObj.star Idem
  obtain ⟨a, ha⟩ := MSet.model_full Idem .t S ({MSet.arrow Idem 1} : MSet.Prop' Idem)
  refine ⟨a, ?_, fun p hp => ?_, fun {V U} i j hi => ?_⟩
  · change (⟨S, PUnit.unit, 𝟙 S⟩ : Tuple (MSet.model Idem).inner .t S) ∈
      (MSet.model Idem).incl .t S a
    rw [ha, MSet.arrow_id]
    rfl
  · change (⟨S, PUnit.unit, 𝟙 S⟩ : Tuple (MSet.model Idem).inner .t S) ∈
      (MSet.model Idem).incl .t S p at hp
    change (MSet.model Idem).incl .t S a ⊆ (MSet.model Idem).incl .t S p
    rw [ha]
    intro t ht
    rw [Set.mem_singleton_iff.1 ht, ← MSet.arrow_id]
    exact hp
  · obtain rfl : V = S := Subsingleton.elim _ _
    obtain rfl : U = S := Subsingleton.elim _ _
    change (⟨S, PUnit.unit, i⟩ : Tuple (MSet.model Idem).inner .t S) ∉
      (MSet.model Idem).incl .t S a at hi
    change (⟨S, PUnit.unit, i ≫ j⟩ : Tuple (MSet.model Idem).inner .t S) ∉
      (MSet.model Idem).incl .t S a
    rw [ha] at hi ⊢
    have key : ∀ m n : Idem, m ≠ 1 → n * m ≠ 1 := by
      intro m n; cases m <;> cases n <;> decide
    intro h
    have e := MSet.arrow_injective Idem (Set.mem_singleton_iff.1 h)
    rw [CategoryTheory.SingleObj.comp_as_mul] at e
    exact key i j (fun e' => hi (by rw [Set.mem_singleton_iff]; exact congrArg (MSet.arrow Idem) e')) e

end full_idempotent_monoid

end Classicism.Map.Meets
