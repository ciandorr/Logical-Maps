import Classicism.Results.Research.NPCAtomSwap

/-!
# Derived connectives and existential quantification for the atom swap

Source: `topics/classicism/writeups/c5-and-atomicity-imply-no-pure-contingency.md`,
§3, Cian Dorr's 23 September 2026 sketch, with Zachary Goodsell's permission.
Formal transcription: Codex, 23 October 2026. All hypothesis-sensitive equalities
under binders are handled by the guarded lifting lemma, never unrestricted ξ.
-/

namespace Classicism.Research.NPCAtomSwap
open Classicism.P Classicism.Paper

theorem swap_false (w v : Prop) (hnd : NecNecessityOfDistinctness Prop)
    (hh : SwapHyp w v) : swap w v False = False :=
  calc swap w v False = swap w v (¬ True) := congrArg (swap w v) not_true_eq.symm
       _ = ¬ swap w v True := swap_neg w v True hnd hh
       _ = ¬ True := congrArg Not (swap_true w v hnd hh)
       _ = False := not_true_eq

theorem swap_or (w v p q : Prop) (hnd : NecNecessityOfDistinctness Prop)
    (hh : SwapHyp w v) : swap w v (p ∨ q) = (swap w v p ∨ swap w v q) :=
  calc swap w v (p ∨ q) = swap w v (¬ ¬ (p ∨ q)) :=
         congrArg (swap w v) (not_not_eq (p ∨ q)).symm
       _ = swap w v (¬ (¬ p ∧ ¬ q)) :=
         congrArg (fun r => swap w v (¬ r)) (not_or_eq p q)
       _ = ¬ swap w v (¬ p ∧ ¬ q) := swap_neg w v _ hnd hh
       _ = ¬ (swap w v (¬ p) ∧ swap w v (¬ q)) :=
         congrArg Not (swap_and w v _ _ hnd hh)
       _ = ¬ (¬ swap w v p ∧ swap w v (¬ q)) :=
         congrArg (fun r => ¬ (r ∧ swap w v (¬ q))) (swap_neg w v p hnd hh)
       _ = ¬ (¬ swap w v p ∧ ¬ swap w v q) :=
         congrArg (fun r => ¬ (¬ swap w v p ∧ r)) (swap_neg w v q hnd hh)
       _ = ¬ ¬ (swap w v p ∨ swap w v q) :=
         congrArg Not (not_or_eq _ _).symm
       _ = (swap w v p ∨ swap w v q) := not_not_eq _

theorem swap_imp (w v p q : Prop) (hnd : NecNecessityOfDistinctness Prop)
    (hh : SwapHyp w v) : swap w v (p → q) = (swap w v p → swap w v q) :=
  calc swap w v (p → q) = swap w v (¬ p ∨ q) := congrArg (swap w v) (imp_eq_not_or p q)
       _ = (swap w v (¬ p) ∨ swap w v q) := swap_or w v _ _ hnd hh
       _ = (¬ swap w v p ∨ swap w v q) :=
         congrArg (fun r => r ∨ swap w v q) (swap_neg w v p hnd hh)
       _ = (swap w v p → swap w v q) := (imp_eq_not_or _ _).symm

theorem swap_iff (w v p q : Prop) (hnd : NecNecessityOfDistinctness Prop)
    (hh : SwapHyp w v) : swap w v (p ↔ q) = (swap w v p ↔ swap w v q) :=
  calc swap w v (p ↔ q) = swap w v ((p → q) ∧ (q → p)) :=
         congrArg (swap w v) (iff_eq_and_imp p q)
       _ = (swap w v (p → q) ∧ swap w v (q → p)) := swap_and w v _ _ hnd hh
       _ = ((swap w v p → swap w v q) ∧ swap w v (q → p)) :=
         congrArg (fun r => r ∧ swap w v (q → p)) (swap_imp w v p q hnd hh)
       _ = ((swap w v p → swap w v q) ∧ (swap w v q → swap w v p)) :=
         congrArg (fun r => (swap w v p → swap w v q) ∧ r) (swap_imp w v q p hnd hh)
       _ = (swap w v p ↔ swap w v q) := (iff_eq_and_imp _ _).symm

theorem exists_dual {σ : Type} [Ty σ] (G : σ → Prop) :
    (∃ x, G x) = ¬ (∀ x, ¬ G x) :=
  (not_not_eq (∃ x, G x)).symm.trans (congrArg Not (not_exists_eq G))

theorem swap_exists_iff {σ : Type} [Ty σ] (w v : Prop) (G : σ → Prop)
    (hnd : NecNecessityOfDistinctness Prop) (hh : SwapHyp w v) :
    swap w v (∃ x, G x) ↔ (∃ x, swap w v (G x)) := by
  have he : swap w v (∃ x, G x) = ¬ (∀ x, swap w v (¬ G x)) :=
    calc swap w v (∃ x, G x) = swap w v (¬ (∀ x, ¬ G x)) :=
           congrArg (swap w v) (exists_dual G)
         _ = ¬ swap w v (∀ x, ¬ G x) := swap_neg w v _ hnd hh
         _ = ¬ (∀ x, swap w v (¬ G x)) :=
           congrArg Not (swap_forall w v (fun x => ¬ G x) hnd hh)
  exact ⟨fun h => ((not_forall_eq (fun x => swap w v (¬ G x))).mp (he.mp h)).elim
      (fun x hx => ⟨x, (em (swap w v (G x))).elim id
        (fun hn => False.elim (hx ((swap_neg w v (G x) hnd hh).mpr hn)))⟩),
    fun h => he.mpr (fun hn => h.elim fun x hx =>
      ((swap_neg w v (G x) hnd hh).mp (hn x)) hx)⟩

theorem swap_exists {σ : Type} [Ty σ] (w v : Prop) (G : σ → Prop)
    (hnd : NecNecessityOfDistinctness Prop) (hh : SwapHyp w v) :
    swap w v (∃ x, G x) = (∃ x, swap w v (G x)) :=
  lift_swap_eq w v _ _ hnd hh (nec% (swap_exists_iff w v G))

end Classicism.Research.NPCAtomSwap
