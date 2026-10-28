import Classicism.Results.Research.NPCAtomSwapBase

/-!
# The concrete propositional atom swap

Direct mathematical source: `topics/classicism/writeups/c5-and-atomicity-imply-no-pure-contingency.md`,
§§2–3 (unpaginated), Cian Dorr's 23 September 2026 sketch with Zachary Goodsell's
permission. Formal transcription: Codex, 23 October 2026. The concrete swap is
constructed from Boolean operations and the propositional entailment relation.
Its identities are lifted only after boxing the complete rigid guard.
-/

namespace Classicism.Research.NPCAtomSwap
open Classicism.P Classicism.Paper

theorem swap_at_left (w v p : Prop) (hh : SwapHyp w v) (hw : w) :
    swap w v p ↔ v ≤ p := by
  have hv : ¬ v := distinct_atoms_not_both w v hh hw
  exact ⟨fun h => h.elim
      (fun h => h.elim (fun h => False.elim (h.1 (Or.inl hw))) And.right)
      (fun h => False.elim (hv h.1)),
    fun hp => Or.inl (Or.inr ⟨hw, hp⟩)⟩

theorem swap_at_right (w v p : Prop) (hh : SwapHyp w v) (hv : v) :
    swap w v p ↔ w ≤ p := by
  have hw : ¬ w := distinct_atoms_not_both v w (hyp_symm w v hh) hv
  exact ⟨fun h => h.elim
      (fun h => h.elim (fun h => False.elim (h.1 (Or.inr hv)))
        (fun h => False.elim (hw h.1))) And.right,
    fun hp => Or.inr ⟨hv, hp⟩⟩

theorem swap_off (w v p : Prop) (hw : ¬ w) (hv : ¬ v) : swap w v p ↔ p :=
  ⟨fun h => h.elim (fun h => h.elim And.right (fun h => False.elim (hw h.1)))
      (fun h => False.elim (hv h.1)),
    fun hp => Or.inl (Or.inl ⟨fun h => h.elim hw hv, hp⟩)⟩

theorem le_congr_under (w p q : Prop) (hb : □ (w → (p ↔ q))) :
    (w ≤ p) ↔ (w ≤ q) :=
  ⟨fun hp => (le_iff_prop _ _).mpr
    (modal_K _ _ (modal_K _ _
      (nec% (fun (h : w → (p ↔ q)) (hp : w → p) (hw : w) => (h hw).mp (hp hw))) hb)
      ((le_iff_prop _ _).mp hp)),
   fun hq => (le_iff_prop _ _).mpr
    (modal_K _ _ (modal_K _ _
      (nec% (fun (h : w → (p ↔ q)) (hq : w → q) (hw : w) => (h hw).mpr (hq hw))) hb)
      ((le_iff_prop _ _).mp hq))⟩

theorem swap_le_left (w v p : Prop) (hnd : NecNecessityOfDistinctness Prop)
    (hh : SwapHyp w v) : (w ≤ swap w v p) ↔ (v ≤ p) :=
  (le_congr_under w (swap w v p) (v ≤ p)
    (modal_K _ _ (nec% (swap_at_left w v p)) (hyp_box w v hnd hh))).trans
    (atom_le_rigid_iff w (v ≤ p) hh.1 (rigid_le v p hnd))

theorem swap_le_right (w v p : Prop) (hnd : NecNecessityOfDistinctness Prop)
    (hh : SwapHyp w v) : (v ≤ swap w v p) ↔ (w ≤ p) :=
  (le_congr_under v (swap w v p) (w ≤ p)
    (modal_K _ _ (nec% (swap_at_right w v p)) (hyp_box w v hnd hh))).trans
    (atom_le_rigid_iff v (w ≤ p) hh.2.1 (rigid_le w p hnd))

theorem swap_involution_iff (w v p : Prop) (hnd : NecNecessityOfDistinctness Prop)
    (hh : SwapHyp w v) : swap w v (swap w v p) ↔ p :=
  (em w).elim
    (fun hw => (swap_at_left w v _ hh hw).trans
      ((swap_le_right w v p hnd hh).trans (atom_true_le_iff w p hh.1 hw)))
    (fun hw => (em v).elim
      (fun hv => (swap_at_right w v _ hh hv).trans
        ((swap_le_left w v p hnd hh).trans (atom_true_le_iff v p hh.2.1 hv)))
      (fun hv => (swap_off w v _ hw hv).trans (swap_off w v p hw hv)))

theorem swap_involution (w v p : Prop) (hnd : NecNecessityOfDistinctness Prop)
    (hh : SwapHyp w v) : swap w v (swap w v p) = p :=
  lift_swap_eq w v _ _ hnd hh (nec% (swap_involution_iff w v p))

theorem swap_neg_iff (w v p : Prop) (_hnd : NecNecessityOfDistinctness Prop)
    (hh : SwapHyp w v) : swap w v (¬ p) ↔ ¬ swap w v p :=
  (em w).elim
    (fun hw => ⟨fun hn hp => (atom_le_neg_iff v p hh.2.1).mp
        ((swap_at_left w v (¬ p) hh hw).mp hn) ((swap_at_left w v p hh hw).mp hp),
      fun hn => (swap_at_left w v (¬ p) hh hw).mpr
        ((atom_le_neg_iff v p hh.2.1).mpr (fun hp => hn ((swap_at_left w v p hh hw).mpr hp)))⟩)
    (fun hw => (em v).elim
      (fun hv => ⟨fun hn hp => (atom_le_neg_iff w p hh.1).mp
          ((swap_at_right w v (¬ p) hh hv).mp hn) ((swap_at_right w v p hh hv).mp hp),
        fun hn => (swap_at_right w v (¬ p) hh hv).mpr
          ((atom_le_neg_iff w p hh.1).mpr (fun hp => hn ((swap_at_right w v p hh hv).mpr hp)))⟩)
      (fun hv => ⟨fun hn hp => ((swap_off w v (¬ p) hw hv).mp hn)
          ((swap_off w v p hw hv).mp hp),
        fun hn => (swap_off w v (¬ p) hw hv).mpr
          (fun hp => hn ((swap_off w v p hw hv).mpr hp))⟩))

theorem swap_neg (w v p : Prop) (hnd : NecNecessityOfDistinctness Prop)
    (hh : SwapHyp w v) : swap w v (¬ p) = ¬ swap w v p :=
  lift_swap_eq w v _ _ hnd hh (nec% (swap_neg_iff w v p))

theorem swap_and_iff (w v p q : Prop) (_hnd : NecNecessityOfDistinctness Prop)
    (hh : SwapHyp w v) : swap w v (p ∧ q) ↔ (swap w v p ∧ swap w v q) :=
  (em w).elim
    (fun hw => ⟨fun h =>
        have hpq := (le_and_iff v p q).mp ((swap_at_left w v _ hh hw).mp h)
        ⟨(swap_at_left w v p hh hw).mpr hpq.1, (swap_at_left w v q hh hw).mpr hpq.2⟩,
      fun h => (swap_at_left w v _ hh hw).mpr ((le_and_iff v p q).mpr
        ⟨(swap_at_left w v p hh hw).mp h.1, (swap_at_left w v q hh hw).mp h.2⟩)⟩)
    (fun hw => (em v).elim
      (fun hv => ⟨fun h =>
          have hpq := (le_and_iff w p q).mp ((swap_at_right w v _ hh hv).mp h)
          ⟨(swap_at_right w v p hh hv).mpr hpq.1, (swap_at_right w v q hh hv).mpr hpq.2⟩,
        fun h => (swap_at_right w v _ hh hv).mpr ((le_and_iff w p q).mpr
          ⟨(swap_at_right w v p hh hv).mp h.1, (swap_at_right w v q hh hv).mp h.2⟩)⟩)
      (fun hv => ⟨fun h =>
          have hpq := (swap_off w v _ hw hv).mp h
          ⟨(swap_off w v p hw hv).mpr hpq.1, (swap_off w v q hw hv).mpr hpq.2⟩,
        fun h => (swap_off w v _ hw hv).mpr
          ⟨(swap_off w v p hw hv).mp h.1, (swap_off w v q hw hv).mp h.2⟩⟩))

theorem swap_and (w v p q : Prop) (hnd : NecNecessityOfDistinctness Prop)
    (hh : SwapHyp w v) : swap w v (p ∧ q) = (swap w v p ∧ swap w v q) :=
  lift_swap_eq w v _ _ hnd hh (nec% (swap_and_iff w v p q))

theorem swap_true_iff (w v : Prop) (_hnd : NecNecessityOfDistinctness Prop)
    (hh : SwapHyp w v) : swap w v True ↔ True :=
  ⟨fun _ => trivial, fun _ => (em w).elim
    (fun hw => (swap_at_left w v True hh hw).mpr (le_top_prop v))
    (fun hw => (em v).elim
      (fun hv => (swap_at_right w v True hh hv).mpr (le_top_prop w))
      (fun hv => (swap_off w v True hw hv).mpr trivial))⟩

theorem swap_true (w v : Prop) (hnd : NecNecessityOfDistinctness Prop)
    (hh : SwapHyp w v) : swap w v True = True :=
  lift_swap_eq w v _ _ hnd hh (nec% (swap_true_iff w v))

theorem swap_eq_iff {σ : Type} [Ty σ] (w v : Prop) (x y : σ)
    (hnd : NecNecessityOfDistinctness Prop) (hh : SwapHyp w v) :
    swap w v (x = y) ↔ (x = y) :=
  (em w).elim
    (fun hw => (swap_at_left w v _ hh hw).trans
      (atom_le_rigid_iff v _ hh.2.1 (rigid_eq x y hnd)))
    (fun hw => (em v).elim
      (fun hv => (swap_at_right w v _ hh hv).trans
        (atom_le_rigid_iff w _ hh.1 (rigid_eq x y hnd)))
      (fun hv => swap_off w v _ hw hv))

theorem swap_eq {σ : Type} [Ty σ] (w v : Prop) (x y : σ)
    (hnd : NecNecessityOfDistinctness Prop) (hh : SwapHyp w v) :
    swap w v (x = y) = (x = y) :=
  lift_swap_eq w v _ _ hnd hh (nec% (swap_eq_iff w v x y))

theorem swap_forall_iff {σ : Type} [Ty σ] (w v : Prop) (G : σ → Prop)
    (hnd : NecNecessityOfDistinctness Prop) (hh : SwapHyp w v) :
    swap w v (∀ x, G x) ↔ (∀ x, swap w v (G x)) :=
  (em w).elim
    (fun hw => ⟨fun h x => (swap_at_left w v _ hh hw).mpr
        ((le_forall_iff v G hnd).mp ((swap_at_left w v _ hh hw).mp h) x),
      fun h => (swap_at_left w v _ hh hw).mpr ((le_forall_iff v G hnd).mpr
        (fun x => (swap_at_left w v _ hh hw).mp (h x)))⟩)
    (fun hw => (em v).elim
      (fun hv => ⟨fun h x => (swap_at_right w v _ hh hv).mpr
          ((le_forall_iff w G hnd).mp ((swap_at_right w v _ hh hv).mp h) x),
        fun h => (swap_at_right w v _ hh hv).mpr ((le_forall_iff w G hnd).mpr
          (fun x => (swap_at_right w v _ hh hv).mp (h x)))⟩)
      (fun hv => ⟨fun h x => (swap_off w v _ hw hv).mpr ((swap_off w v _ hw hv).mp h x),
        fun h => (swap_off w v _ hw hv).mpr (fun x => (swap_off w v _ hw hv).mp (h x))⟩))

theorem swap_forall {σ : Type} [Ty σ] (w v : Prop) (G : σ → Prop)
    (hnd : NecNecessityOfDistinctness Prop) (hh : SwapHyp w v) :
    swap w v (∀ x, G x) = (∀ x, swap w v (G x)) :=
  lift_swap_eq w v _ _ hnd hh (nec% (swap_forall_iff w v G))

end Classicism.Research.NPCAtomSwap
