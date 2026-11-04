import Classicism.Coalesced.SumData
import Classicism.Certified.Entailed
import Classicism.Models.Monoids
import Classicism.Models.InfClassesTransversal
import Classicism.Semantics.IntensionalExamples
import Classicism.Semantics.Numerals
import Classicism.Results.Consistency.Consistency

/-!
# Pure sentences possible at a coalesced root (`coalesced-sums`)

With **complete components** (`SumData.CompleteComponents`), every closed pure sentence
consistent with `C` holds in the component seen from some root arrow, so it is possible at the
root, and the necessitation of a schema some Lean model refutes fails at the root
(`SumData.not_holdsAx_box_of_complete`, `RootAction.not_holds_box_of_complete`). Whatever the root
arrows: the group's arguments that use only this (`pure-sentences-possible`, `transversal-boxed`,
`necessary-axiom-of-infinity-complete-components`) need no distinguished arrows.

The Lean models refuting the unboxed principles, kept here below the map's certificates so that
the group's arguments can be certified as arguments (`MapArguments.lean`):

* **Vicinity** and **Weakly Inextensible Comprehension** fail in the truncation model (Appendix D,
  Part 6), through the map's results (`Truncs.not_vicinity`,
  `Truncs.not_weaklyInextensibleComprehension`; moved from `Results/Other/Witnesses.lean`, with the
  soundness lemmas they use and the Distinctness-Preserving Collapse there, `Monoids.Truncs.dpc`);
* **Transversal** fails at `e` in `symmetric-infinite-classes` (`SymIdeal.infClasses_not_transversal`);
* **the Axioms of Infinity** at `e` and at `t` fail in the full model with one world, one
  individual and two propositions (`MSet.model Unit`; `oneWorld_not_axInfE`, `oneWorld_not_axInfT`):
  a numeral holds of the universal property at a finite type (`Premodel.not_holds_axInf_of_finite`).
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

end Witness

open Witness

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

/-! ### At a coalesced root with complete components

What a Lean model refutes is possible at the root, so its necessitation fails there
(`RootAction.not_holds_box_of_complete`), whatever the root arrows. -/

/-- **The necessitation of a schema some Lean model refutes fails at a coalesced root with complete
components** (`pure-sentences-possible`). -/
theorem Coalesced.SumData.not_holdsAx_box_of_complete {D : Coalesced.SumData}
    (hc : D.CompleteComponents) {C : Type} [CategoryTheory.SmallCategory C]
    {B : Premodel Signature.pure C} (M : B.IsModel) {X N : AxiomSet Signature.pure}
    (hX : ClosedTypes X) (hf : ¬ B.HoldsAx X) (hN : X.box ⊆ N) :
    ¬ D.model.HoldsAx (AxiomSet.ofPure N) := fun H => by
  obtain ⟨p, hp, -, hcons⟩ := exists_consistent_neg_of_not_holdsAx M hf
  exact Coalesced.RootAction.not_holds_box_of_complete _ _ _ _ D.isModel hc.2 (hX p hp) hcons
    (H _ ⟨Term.box p, hN _ (AxiomSet.mem_box hp), rfl⟩)

/-- The same, as stated over distinguished arrows before 3 November 2026. -/
theorem Coalesced.SumData.not_holdsAx_box_of_model {D : Coalesced.SumData} (_hD : D.DistinguishedArrows)
    (hc : D.CompleteComponents) {C : Type} [CategoryTheory.SmallCategory C]
    {B : Premodel Signature.pure C} (M : B.IsModel) {X N : AxiomSet Signature.pure}
    (hX : ClosedTypes X) (hf : ¬ B.HoldsAx X) (hN : X.box ⊆ N) :
    ¬ D.model.HoldsAx (AxiomSet.ofPure N) :=
  Coalesced.SumData.not_holdsAx_box_of_complete hc M hX hf hN

/-! ### The full model with one world, one individual and two propositions -/

namespace OneWorld

local notation "A" => MSet.model Unit
local notation "M" => MSet.model_isModel Unit

instance finite_e : Finite ((A).Dom (A).W₀ .e) := inferInstanceAs (Finite Unit)

instance finite_t : Finite ((A).Dom (A).W₀ (.rel .t)) := by
  have : Finite (CategoryTheory.SingleObj Unit) := inferInstanceAs (Finite Unit)
  have : ∀ V W : CategoryTheory.SingleObj Unit, Finite (V ⟶ W) := fun _ _ => inferInstanceAs (Finite Unit)
  change Finite (Set (Σ V : CategoryTheory.SingleObj Unit, PUnit × (CategoryTheory.SingleObj.star Unit ⟶ V)))
  infer_instance

/-- **The Axiom of Infinity at `e` fails** with one individual. -/
theorem not_axInfE : ¬ (A).HoldsAx P.AxiomOfInfinityE.schema := fun H =>
  Premodel.not_holds_axInf_of_finite M (CategoryTheory.CategoryStruct.id _) .e (H _ rfl)

/-- **The Axiom of Infinity at `t` fails** with two propositions. -/
theorem not_axInfT : ¬ (A).HoldsAx P.AxiomOfInfinityT.schema := fun H =>
  Premodel.not_holds_axInf_of_finite M (CategoryTheory.CategoryStruct.id _) (.rel .t) (H _ rfl)

end OneWorld

/-! ### The boxed failures at a coalesced root with complete components -/

namespace Coalesced.SumData

variable {D : Coalesced.SumData} (hc : D.CompleteComponents)
include hc

/-- `□`Vicinity fails: Vicinity fails in the truncation model. -/
theorem not_holds_necVicinity : ¬ D.model.HoldsAx P.NecVicinity.schemaIn :=
  not_holdsAx_box_of_complete hc (MonoidModel.model_isModel Monoids.truncs)
    P.Vicinity.schema_closedTypes Truncs.not_vicinity (by rintro _ ⟨_, rfl, rfl⟩; rfl)

/-- `□`Weakly Inextensible Comprehension fails: it fails in the truncation model. -/
theorem not_holds_necWIC : ¬ D.model.HoldsAx P.NecWeaklyInextensibleComprehension.schemaIn :=
  not_holdsAx_box_of_complete hc (MonoidModel.model_isModel Monoids.truncs)
    P.WeaklyInextensibleComprehension.schema_closedTypes Truncs.not_weaklyInextensibleComprehension
    (by rintro _ ⟨_, ⟨τ, hτ, rfl⟩, rfl⟩; exact ⟨τ, hτ, rfl⟩)

/-- `□`Transversal fails: Transversal fails at `e` in `symmetric-infinite-classes`. -/
theorem not_holds_necTransversal : ¬ D.model.HoldsAx P.NecTransversal.schemaIn :=
  not_holdsAx_box_of_complete hc (SymIdeal.model_isModel SymIdeal.infClasses)
    P.Transversal.schema_closedTypes
    (fun h => SymIdeal.infClasses_not_transversal (h _ ⟨.e, by decide, rfl⟩))
    (by rintro _ ⟨_, ⟨τ, hτ, rfl⟩, rfl⟩; exact ⟨τ, hτ, rfl⟩)

/-- `□`(the Axiom of Infinity at `e`) fails: one individual refutes it. -/
theorem not_holds_necAxInfE : ¬ D.model.HoldsAx P.NecAxiomOfInfinityE.schemaIn :=
  not_holdsAx_box_of_complete hc (MSet.model_isModel Unit)
    P.AxiomOfInfinityE.schema_closedTypes OneWorld.not_axInfE (by rintro _ ⟨_, rfl, rfl⟩; rfl)

/-- `□`(the Axiom of Infinity at `t`) fails: two propositions refute it. -/
theorem not_holds_necAxInfT : ¬ D.model.HoldsAx P.NecAxiomOfInfinityT.schemaIn :=
  not_holdsAx_box_of_complete hc (MSet.model_isModel Unit)
    P.AxiomOfInfinityT.schema_closedTypes OneWorld.not_axInfT (by rintro _ ⟨_, rfl, rfl⟩; rfl)

end Coalesced.SumData

end Classicism.Meta
