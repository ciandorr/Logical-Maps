import Classicism.Completeness.Worlds
import Mathlib.CategoryTheory.Category.Preorder
import Classicism.Semantics.IntensionalSoundness
import Classicism.Completeness.CanonicalTruth

/-!
# Completeness of intensional action models for Classicism

For the paper's language — a countable signature whose constants have closed types, and
axiom sets and sentences all of whose types are closed — an axiom set consistent with `C`
holds in some intensional action model, and a sentence true in every intensional action
model of an axiom set is a theorem of it. With `sound`
(`Semantics/IntensionalSoundness.lean`), consistency is satisfiability.

The restriction to closed types is needed by this construction, whose worlds say that every
type is inhabited (`World.exists_self_mem`): `C` does not prove that of a type variable.

The model is the **canonical** one: the category is the preorder of worlds
(`Completeness/Worlds.lean`), the inner domain at a world and a type is the set of closed
terms of the world's language modulo the identities the world contains, transport along
`w ≤ v` is the identity on terms, and a term class is included in the intensions by its
extensions at the accessible worlds, read off their theories. The truth lemma, by
induction on terms, says that the value of a term is the intension of the class of the
closed term it becomes under the assignment; so the premodel is a model, and a sentence
holds at a world iff it is in the world's theory.

This replaces the paper's route (BBK models, their categories, and the representation of an
intensional category by an action model) by the construction of Bacon's book, Chapter 18,
read in the intensional form.

The construction is in `Completeness/Canonical.lean` (term classes, the canonical inclusion,
the readings of the type-subscripted operations) and `Completeness/CanonicalTruth.lean` (the
premodel, the truth lemma, the model condition); the world theory it rests on is
`Completeness/Worlds.lean`, and the object-language facts `Completeness/ObjectLemmas.lean`.
-/

namespace Classicism.Meta

namespace Completeness

open CategoryTheory

variable {Sig : Signature}

/-- **Completeness**, in model-existence form: an axiom set of the paper's language
consistent with `C`, in a countable signature of the paper's language, holds in an
intensional action model. The category is a preorder. -/
theorem exists_model [Countable Sig.Const] (hS : Sig.Closed) {Ax : AxiomSet Sig}
    (hc : AxiomSet.ClosedTypes Ax) (h : AxiomSet.Consistent Ax) :
    ∃ (W : Type) (_ : Preorder W) (A : Intensional.Premodel Sig W), A.IsModel ∧ A.HoldsAx Ax := by
  obtain ⟨w, hw⟩ := exists_world hS hc h
  exact ⟨World Sig, inferInstance, Canonical.premodel w, Canonical.isModel w,
    fun a ha => (Canonical.holdsSentence_iff w a).2 (hw _ ⟨a, ha, rfl⟩)⟩

/-- **Completeness**: a sentence of the paper's language that holds in every intensional
action model of `Ax`, a theory of the paper's language, is a theorem of `C + Ax`. -/
theorem theorem_of_valid [Countable Sig.Const] (hS : Sig.Closed) {Ax : AxiomSet Sig}
    {p : Sentence Sig} (hc : AxiomSet.ClosedTypes Ax) (hp : p.closedTypes = true)
    (h : ∀ (W : Type) [SmallCategory W] (A : Intensional.Premodel Sig W),
      A.IsModel → A.HoldsAx Ax → A.HoldsSentence p) :
    Theorem (C.axioms ∪ Ax) p := by
  by_contra hn
  obtain ⟨w, hw⟩ := exists_world hS
    (AxiomSet.ClosedTypes.union hc (fun a ha => by
      rw [show a = Term.neg p from ha]; simpa [Term.closedTypes] using hp))
    (AxiomSet.consistent_neg_of_not_theorem hn)
  have hp := (Canonical.holdsSentence_iff w p).1
    (h (World Sig) (Canonical.premodel w) (Canonical.isModel w)
      fun a ha => (Canonical.holdsSentence_iff w a).2 (hw _ ⟨a, Or.inl ha, rfl⟩))
  exact World.not_mem_and_neg hp (hw _ ⟨Term.neg p, Or.inr rfl, rfl⟩)

/-- **A complete family**, as the coalesced sums use it: a family of intensional action
models, indexed by a type, in which every sentence of the paper's language consistent with
`C` holds at the base of some member. The family is the canonical model with its base
varying over the worlds. -/
theorem exists_complete_family [Countable Sig.Const] (hS : Sig.Closed) :
    ∃ (ι : Type) (W : ι → Type) (_ : ∀ k, Preorder (W k))
      (A : ∀ k, Intensional.Premodel Sig (W k)),
      (∀ k, (A k).IsModel) ∧
      ∀ p : Sentence Sig, p.closedTypes = true → AxiomSet.Consistent (AxiomSet.single p) →
        ∃ k, (A k).HoldsSentence p := by
  refine ⟨World Sig, fun _ => World Sig, fun _ => inferInstance, Canonical.premodel,
    Canonical.isModel, fun p hpc hp => ?_⟩
  obtain ⟨w, hw⟩ := exists_world hS (fun a ha => by rw [show a = p from ha]; exact hpc) hp
  exact ⟨w, (Canonical.holdsSentence_iff w p).2 (hw _ ⟨p, rfl, rfl⟩)⟩

end Completeness

end Classicism.Meta
