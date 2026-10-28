import Classicism.Results.Records.C5

/-!
# Rigidity and lifting for the No Pure Contingency atom swap

Direct mathematical source: `topics/classicism/writeups/c5-and-atomicity-imply-no-pure-contingency.md`,
§§1–3 (unpaginated), following Cian Dorr's 23 September 2026 sketch, with Zachary
Goodsell's permission. This isolated formalization preserves that attribution and
does not modify the human-authored proof. Formal transcription: Codex, 23 October 2026.
Only boxed ND at t is used here; the established C5 lemmas derive ND/BF at each Ty.
-/

namespace Classicism.Research.NPCAtomSwap
open Classicism.P Classicism.Paper

def RigidProp (p : Prop) : Prop := p = True ∨ p = False

def SwapHyp (w v : Prop) : Prop := Atom w ∧ Atom v ∧ w ≠ v

def swap (w v p : Prop) : Prop :=
  ((¬ (w ∨ v) ∧ p) ∨ (w ∧ v ≤ p)) ∨ (v ∧ w ≤ p)

theorem rigid_true (p : Prop) (hr : RigidProp p) (hp : p) : □ p :=
  hr.elim id (fun hf => False.elim (hf ▸ hp))

theorem rigid_false (p : Prop) (hr : RigidProp p) (hp : ¬ p) : □ (¬ p) :=
  hr.elim (fun ht => False.elim (hp (ht.mpr trivial)))
    (fun hf => (box_not_eq p).mpr hf)

theorem rigid_eq {σ : Type} [Ty σ] (x y : σ)
    (hnd : NecNecessityOfDistinctness Prop) : RigidProp (x = y) :=
  (em (x = y)).elim
    (fun he => Or.inl (necessity_of_identity x y he))
    (fun hn => Or.inr ((box_not_eq (x = y)).mp
      (Proofs.necessary_distinctness_necessary_t_implies_distinctness_necessary_r hnd x y hn)))

theorem rigid_not (p : Prop) (hp : RigidProp p) : RigidProp (¬ p) :=
  hp.elim (fun ht => Or.inr (congrArg Not ht |>.trans not_true_eq))
    (fun hf => Or.inl (congrArg Not hf |>.trans not_false_eq))

theorem rigid_and (p q : Prop) (hp : RigidProp p) (hq : RigidProp q) :
    RigidProp (p ∧ q) := by
  exact hp.elim
    (fun ht => (congrArg (fun r => RigidProp r) ((congrArg (fun r => r ∧ q) ht).trans
      (true_and_eq q))).mpr hq)
    (fun hf => Or.inr ((congrArg (fun r => r ∧ q) hf).trans (false_and_eq q)))

theorem rigid_or (p q : Prop) (hp : RigidProp p) (hq : RigidProp q) :
    RigidProp (p ∨ q) :=
  hp.elim
    (fun ht => Or.inl ((congrArg (fun r => r ∨ q) ht).trans (true_or_eq q)))
    (fun hf => (congrArg (fun r => RigidProp r) ((congrArg (fun r => r ∨ q) hf).trans
      (false_or_eq q))).mpr hq)

theorem rigid_imp (p q : Prop) (hp : RigidProp p) (hq : RigidProp q) :
    RigidProp (p → q) :=
  (congrArg RigidProp (imp_eq_not_or p q)).mpr (rigid_or _ _ (rigid_not p hp) hq)

theorem rigid_iff (p q : Prop) (hp : RigidProp p) (hq : RigidProp q) :
    RigidProp (p ↔ q) :=
  (congrArg RigidProp (iff_eq_and_imp p q)).mpr
    (rigid_and _ _ (rigid_imp p q hp hq) (rigid_imp q p hq hp))

theorem rigid_forall {σ : Type} [Ty σ] (G : σ → Prop)
    (hnd : NecNecessityOfDistinctness Prop) (hr : ∀ x, RigidProp (G x)) :
    RigidProp (∀ x, G x) :=
  (em (∀ x, G x)).elim
    (fun hg => Or.inl (Proofs.necessary_nd_implies_bf hnd G
      (fun x => rigid_true (G x) (hr x) (hg x))))
    (fun hn => ((not_forall_eq G).mp hn).elim fun x hx =>
      Or.inr ((box_not_eq (∀ y, G y)).mp
        (modal_K _ _ (nec% (fun (hx : ¬ G x) (hg : ∀ y, G y) => hx (hg x)))
          (rigid_false (G x) (hr x) hx))))

theorem rigid_le (p q : Prop) (hnd : NecNecessityOfDistinctness Prop) :
    RigidProp (p ≤ q) := rigid_eq q (p ∨ q) hnd

theorem rigid_atom (w : Prop) (hnd : NecNecessityOfDistinctness Prop) :
    RigidProp (Atom w) :=
  rigid_forall (fun z : Prop => (z ≤ w ∧ z ≠ w) ↔ z ≤ ¬ z) hnd
    (fun z => rigid_iff _ _
      (rigid_and _ _ (rigid_le z w hnd) (rigid_not _ (rigid_eq z w hnd)))
      (rigid_le z (¬ z) hnd))

theorem rigid_hyp (w v : Prop) (hnd : NecNecessityOfDistinctness Prop) :
    RigidProp (SwapHyp w v) :=
  rigid_and _ _ (rigid_atom w hnd)
    (rigid_and _ _ (rigid_atom v hnd) (rigid_not _ (rigid_eq w v hnd)))

theorem hyp_box (w v : Prop) (hnd : NecNecessityOfDistinctness Prop)
    (hh : SwapHyp w v) : □ (SwapHyp w v) := rigid_true _ (rigid_hyp w v hnd) hh

theorem guard_persistent (w v : Prop) :
    (NecNecessityOfDistinctness Prop ∧ SwapHyp w v) →
      □ (NecNecessityOfDistinctness Prop ∧ SwapHyp w v) :=
  fun h => (box_and_eq _ _).mpr ⟨modal_four _ h.1, hyp_box w v h.1 h.2⟩

/-- The premise is already boxed: this lemma never necessitates an optional hypothesis. -/
theorem lift_swap_eq (w v p q : Prop) (hnd : NecNecessityOfDistinctness Prop)
    (hh : SwapHyp w v)
    (hb : □ (NecNecessityOfDistinctness Prop → SwapHyp w v → (p ↔ q))) : p = q :=
  modalized_fregean p q
    (modal_K _ _ (modal_K _ _ hb (modal_four _ hnd)) (hyp_box w v hnd hh))

theorem lift_swap_funext {σ τ : Type} [Ty σ] [Rel τ] (w v : Prop) (X Y : σ → τ)
    (hnd : NecNecessityOfDistinctness Prop) (hh : SwapHyp w v)
    (hb : □ (NecNecessityOfDistinctness Prop → SwapHyp w v → ∀ x, X x = Y x)) : X = Y :=
  modalized_functionality X Y
    (modal_K _ _ (modal_K _ _ hb (modal_four _ hnd)) (hyp_box w v hnd hh))

theorem atom_nonbottom (w : Prop) (hw : Atom w) : w ≠ False :=
  fun hf => not_le_neg_of_atom hw (le_neg_of_eq_false w hf)

theorem atom_not_both_le (w p : Prop) (hw : Atom w) (hp : w ≤ p)
    (hn : w ≤ ¬ p) : False :=
  atom_nonbottom w hw (le_antisymm_prop w False
    ((congrArg (fun r => w ≤ r) (and_not_self_eq p)).mp (le_and_prop w p (¬ p) hp hn))
    (bot_le_prop w))

theorem atom_le_neg_iff (w p : Prop) (hw : Atom w) : (w ≤ ¬ p) ↔ ¬ (w ≤ p) :=
  ⟨fun hn hp => atom_not_both_le w p hw hp hn,
   fun hn => (atom_le_or_le_neg w p hw).elim (fun hp => False.elim (hn hp)) id⟩

theorem atom_true_le_iff (w p : Prop) (hw : Atom w) (ht : w) : (w ≤ p) ↔ p :=
  ⟨fun hp => imp_of_le_prop w p hp ht,
   fun hp => (atom_le_or_le_neg w p hw).elim id
     (fun hn => False.elim ((imp_of_le_prop w (¬ p) hn ht) hp))⟩

theorem distinct_atoms_le_neg (w v : Prop) (hh : SwapHyp w v) : w ≤ ¬ v :=
  (atom_le_or_le_neg w v hh.1).elim
    (fun hp => False.elim (not_le_neg_of_atom hh.1 ((hh.2.1 w).mp ⟨hp, hh.2.2⟩))) id

theorem hyp_symm (w v : Prop) (hh : SwapHyp w v) : SwapHyp v w :=
  ⟨hh.2.1, hh.1, fun he => hh.2.2 he.symm⟩

theorem distinct_atoms_not_both (w v : Prop) (hh : SwapHyp w v) (hw : w) : ¬ v :=
  imp_of_le_prop w (¬ v) (distinct_atoms_le_neg w v hh) hw

theorem atom_le_rigid_iff (w p : Prop) (hw : Atom w) (hr : RigidProp p) :
    (w ≤ p) ↔ p :=
  hr.elim
    (fun ht => ⟨fun _ => ht.mpr trivial,
      fun _ => (congrArg (fun r => w ≤ r) ht).mpr (le_top_prop w)⟩)
    (fun hf => ⟨fun hp => False.elim (atom_nonbottom w hw
      (le_antisymm_prop w False ((congrArg (fun r => w ≤ r) hf).mp hp) (bot_le_prop w))),
      fun hp => False.elim (hf ▸ hp)⟩)

theorem le_and_iff (w p q : Prop) : (w ≤ (p ∧ q)) ↔ (w ≤ p ∧ w ≤ q) :=
  ⟨fun h => ⟨le_trans_prop _ _ _ h (and_le_left_prop p q),
    le_trans_prop _ _ _ h (and_le_right_prop p q)⟩,
   fun h => le_and_prop w p q h.1 h.2⟩

theorem le_forall_iff {σ : Type} [Ty σ] (w : Prop) (G : σ → Prop)
    (hnd : NecNecessityOfDistinctness Prop) :
    (w ≤ (∀ x, G x)) ↔ (∀ x, w ≤ G x) :=
  ⟨fun h x => le_of_le_of_box_imp w (∀ x, G x) (G x) h
      (nec% (fun (hg : ∀ x, G x) => hg x)),
   fun h => (le_iff_prop _ _).mpr
      (modal_K _ _ (nec% (fun (hg : ∀ x, w → G x) (hw : w) (x : σ) => hg x hw))
        (Proofs.necessary_nd_implies_bf hnd (fun x => w → G x)
          (fun x => (le_iff_prop _ _).mp (h x))))⟩

end Classicism.Research.NPCAtomSwap
