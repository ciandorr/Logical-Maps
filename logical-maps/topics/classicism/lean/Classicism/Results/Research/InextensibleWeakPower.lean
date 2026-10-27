import Classicism.Results.Research.InextensibleDescent
import Classicism.Results.Research.InextensibleRigidPower

/-!
# ND and higher Inextensible Comprehension imply Weakly Rigid Power

Direct source: `research/2026-10-22/notes/nd-inextensible-comprehension-implies-weak-power.md`,
§6 (original research, unpaginated, `misc`, 22 October 2026).
The local statement uses current ND_t and current IC at one property type.
Neither optional premise is necessitated.
-/

namespace Classicism.Research.InextensiblePower
open Classicism.Paper Classicism.P

def DecidedTruth (p : Prop) : Prop := □ p ∨ □ (¬ p)

theorem decidedTruth_persistent (p : Prop) : DecidedTruth p → □ (DecidedTruth p) :=
  fun h => h.elim
    (fun hp => modal_K _ _ (nec% (fun h : □ p => (Or.inl h : DecidedTruth p))) (modal_four _ hp))
    (fun hn => modal_K _ _ (nec% (fun h : □ (¬ p) => (Or.inr h : DecidedTruth p))) (modal_four _ hn))

theorem bounded_decisions {σ : Type} [Ty σ] (F X : σ → Prop)
    (hf : Rigid F) (hs : InternallySeparated F) (hx : WeaklyRigid X) (hi : X ≤ F) :
    □ (∀ a, F a → DecidedTruth (X a)) :=
  (weaklyInextensible_of_inextensible hf.2) (fun a => DecidedTruth (X a))
    (fun a ha => decidedTruth_persistent _ ((em (X a)).elim
      (fun hxa => Or.inl (hx.1 a hxa))
      (fun hn => Or.inr (missing_point_sealed F X hs (incl_of_le hi) hx.2 a ha hn))))

theorem bounded_test_conclude {σ : Type} [Ty σ] (F X Z : σ → Prop) :
    (∀ a, F a → (X a → Z a)) → (∀ a, X a → F a) → ∀ a, X a → Z a :=
  fun h hi a ha => h a (hi a ha) ha

theorem bounded_wi_step {σ : Type} [Ty σ] (F X : σ → Prop) :
    WeaklyInextensible F → X ≤ F → (∀ a, F a → DecidedTruth (X a)) →
    WeaklyInextensible X := by
  intro hf hi hd Z hz
  have ht : □ (∀ a, F a → (X a → Z a)) := hf (fun a => X a → Z a)
    (fun a ha => (hd a ha).elim
      (fun hp => box_imp_of_box _ _ (hz a (box_elim hp)))
      (fun hn => box_imp_of_box_not _ _ hn))
  exact modal_K _ _ (modal_K _ _ (nec% (bounded_test_conclude F X Z)) ht)
    ((le_iff X F).1 hi)

/-- Weak rigidity bounded by a separated rigid relation is full rigidity. -/
theorem bounded_tame {σ : Type} [Ty σ] (F X : σ → Prop)
    (hf : Rigid F) (hs : InternallySeparated F) (hx : WeaklyRigid X) (hi : X ≤ F) :
    Rigid X :=
  ⟨persistent_of_weaklyRigid hx,
   modal_K _ _ (modal_K _ _ (modal_K _ _ (nec% (bounded_wi_step F X)) hf.2)
     (necessity_of_identity _ _ hi)) (bounded_decisions F X hf hs hx hi)⟩

theorem bounded_powers_coext {σ : Type} [Ty σ] (F : σ → Prop) :
    Rigid F → InternallySeparated F →
    (fun X : σ → Prop => WeaklyRigid X ∧ X ≤ F) ≡ RigidBelow F :=
  fun hf hs X =>
    ⟨fun hx => ⟨bounded_tame F X hf hs hx.1 hx.2, hx.2⟩,
     fun hx => ⟨weaklyRigid_of_rigid hx.1, hx.2⟩⟩

/-- Exact local theorem; the certification module supplies its all-tuples rule. -/
theorem nd_ic_weaklyRigidPower {σ : Type} [Ty σ] :
    NecessityOfDistinctness Prop → InextensibleComprehension ((σ → Prop) → Prop) →
    WeaklyRigidPower (σ → Prop) := by
  intro nd ic F hF
  have hf : Rigid F := nd_higher_ic_tame nd ic F hF
  have hr : Rigid (RigidBelow F) := nd_ic_rigidPower nd ic F hf
  have he : (fun X : σ → Prop => WeaklyRigid X ∧ X ≤ F) = RigidBelow F :=
    intensionality _ _ (modal_K _ _
      (modal_K _ _ (nec% (bounded_powers_coext F)) (rigid_necessary F hf))
      (weaklyRigid_separated nd F hF))
  exact weaklyRigid_of_rigid (he.symm ▸ hr)

end Classicism.Research.InextensiblePower
