import Classicism.Results.BourbakiWitt.Settled

/-!
# Vicinity, Boolean Completeness at `t` and Relational Choice imply Actuality: §§1–2

The first part of the proof of `vicinity-boolean-completeness-t-and-relational-choice-imply-actuality`,
following its write-up (the theorem: GPT-6 Astra, prompted by Daniel Kodsi, 25–26 October 2026;
the direct proof: Claude Opus 5.5, prompted by Cian Dorr, 28 October 2026, at Cian Dorr's
suggestion). Below the true `s` of Vicinity:

* §1: if no true proposition decides everything, some true `h ≤ s` has no deciding nonzero
  proposition below it. (The write-up speaks of atoms; a nonzero proposition is an atom iff it
  decides every proposition, `atom_of_decides`, and deciding is the form used here.)
* §2: a functional `K` inside the relation `R(p, q)`, which pairs each nonzero `p ≤ h` with a
  nonzero proper part, partitions each nonzero `p ≤ a` into its *children*, which are pairwise
  disjoint, nonzero proper parts of `p`, with join `p`.
-/

namespace Classicism.Proofs.BWActuality
open Classicism.P Classicism.Paper Classicism.BW Classicism.Proofs.Settled

/-! ### Order at `t` -/

theorem le_intro (p q : Prop) (h : □ (p → q)) : p ≤ q := (le_iff_prop p q).2 h

theorem le_elim (p q : Prop) (h : p ≤ q) : □ (p → q) := (le_iff_prop p q).1 h

theorem false_of_le_both (p q : Prop) (h₁ : p ≤ q) (h₂ : p ≤ ¬ q) : p = False :=
  (box_not_eq p).mp (modal_K _ _ (modal_K _ _
    (nec% (fun (a : p → q) (b : p → ¬ q) (k : p) => b k (a k))) (le_elim _ _ h₁)) (le_elim _ _ h₂))

theorem false_of_le_false (p q : Prop) (h₁ : p ≤ q) (h₂ : q = False) : p = False :=
  false_of_le_both p q h₁ (le_intro _ _ (modal_K _ _
    (nec% (fun (n : ¬ q) (_ : p) => n)) ((box_not_eq q).mpr h₂)))

theorem le_neg_of_false (p q : Prop) (h : (p ∧ q) = False) : p ≤ ¬ q :=
  le_intro _ _ (modal_K _ _ (nec% (fun (n : ¬ (p ∧ q)) (a : p) (b : q) => n ⟨a, b⟩))
    ((box_not_eq _).mpr h))

theorem false_of_le_neg (p q : Prop) (h : p ≤ ¬ q) : (p ∧ q) = False :=
  (box_not_eq _).mp (modal_K _ _ (nec% (fun (f : p → ¬ q) (k : p ∧ q) => f k.1 k.2)) (le_elim _ _ h))

theorem true_of_le (p q : Prop) (h : p ≤ q) (hp : p) : q := imp_of_le_prop p q h hp

theorem le_and_le (p q r : Prop) (h₁ : p ≤ q) (h₂ : p ≤ r) : p ≤ (q ∧ r) := le_and_prop p q r h₁ h₂

theorem and_le_l (p q : Prop) : (p ∧ q) ≤ p := and_le_left_prop p q

theorem and_le_r (p q : Prop) : (p ∧ q) ≤ q := and_le_right_prop p q

theorem le_tr (p q r : Prop) (h₁ : p ≤ q) (h₂ : q ≤ r) : p ≤ r := le_trans_prop p q r h₁ h₂

/-- `NZ(p) := p ≠ ⊥`. -/
def NZ (p : Prop) : Prop := ¬ (p = False)

theorem nz_of_true (p : Prop) (hp : p) : NZ p := fun e => e ▸ hp

theorem nz_of_le (p q : Prop) (h : p ≤ q) (hp : NZ p) : NZ q :=
  fun e => hp (false_of_le_false p q h e)

/-! ### §1: deciders -/

/-- `w` is nonzero and decides every proposition (an atom, `atom_of_decides`). -/
def Dec (w : Prop) : Prop := NZ w ∧ ∀ q : Prop, w ≤ q ∨ w ≤ ¬ q

/-- `z := ∃p. Dec(p) ∧ p`. -/
def Zd : Prop := ∃ p, Dec p ∧ p

theorem actuality_of_dec : Zd → Actuality := fun hz => hz.elim fun w k =>
  ⟨w, k.2, fun q hq => (k.1.2 q).elim (fun hl => hl) (fun hn => ((true_of_le _ _ hn k.2) hq).elim)⟩

theorem dec_settled (v : Prop) (hs : Vs v) : SettledP (Vs v) Dec :=
  fun _ => settled_and _ _ _ hs (settled_not _ _ (settled_eq v hs _ _)) fun _ =>
    settled_forall v hs _ fun _ => settled_or _ _ _ hs (settled_le v hs _ _) (settled_le v hs _ _)

/-- `h := s ∧ ¬z`. -/
def Hd (v : Prop) : Prop := Vs v ∧ ¬ Zd

theorem hd_le (v : Prop) : Hd v ≤ Vs v := and_le_l _ _

/-- Nothing nonzero below `h` decides. -/
theorem no_dec_below (v : Prop) (hs : Vs v) (q : Prop) (hq : NZ q) (hqh : q ≤ Hd v) : ¬ Dec q :=
  fun hd => hq (false_of_le_both q Zd
    (le_tr _ _ _ (le_and_le _ _ _ (le_tr _ _ _ hqh (hd_le v)) (le_refl_prop q))
      (settled_family_join_upper v hs Dec (dec_settled v hs) q hd))
    (le_tr _ _ _ hqh (and_le_r _ _)))

/-- A nonzero proposition that does not decide has a nonzero proper part. -/
theorem proper_part (p : Prop) (hp : NZ p) (hd : ¬ Dec p) :
    ∃ q, NZ q ∧ q ≤ p ∧ ¬ (q = p) := by
  rcases em (∃ q, ¬ p ≤ q ∧ ¬ p ≤ ¬ q) with h | h
  · obtain ⟨q, h₁, h₂⟩ := h
    refine ⟨p ∧ q, fun e => h₂ (le_neg_of_false p q e), and_le_l p q, fun e => h₁ ?_⟩
    rw [← e]
    exact and_le_r p q
  · refine (hd ⟨hp, fun q => ?_⟩).elim
    rcases em (p ≤ q) with h₁ | h₁
    · exact Or.inl h₁
    · rcases em (p ≤ ¬ q) with h₂ | h₂
      · exact Or.inr h₂
      · exact (h ⟨q, h₁, h₂⟩).elim

/-! ### §2: partitions -/

/-- `R(p, q) := [⊥ < p ≤ h ∧ ⊥ < q < p] ∨ [¬(⊥ < p ≤ h) ∧ q = ⊥]`. -/
def Rp (h : Prop) : Prop → Prop → Prop :=
  λ p q ↦ (NZ p ∧ p ≤ h ∧ NZ q ∧ q ≤ p ∧ ¬ (q = p)) ∨ (¬ (NZ p ∧ p ≤ h) ∧ q = False)

theorem rp_serial (v : Prop) (hs : Vs v) : Serial (Rp (Hd v)) := fun p => by
  rcases em (NZ p ∧ p ≤ Hd v) with h | h
  · obtain ⟨q, hq, hqp, hne⟩ := proper_part p h.1 (no_dec_below v hs p h.1 h.2)
    exact ⟨q, Or.inl ⟨h.1, h.2, hq, hqp, hne⟩⟩
  · exact ⟨False, Or.inr ⟨h, rfl⟩⟩

theorem rp_settled (v : Prop) (hs : Vs v) (h p q : Prop) : Settled (Vs v) (Rp h p q) :=
  have hnz : ∀ x : Prop, Settled (Vs v) (NZ x) := fun _ => settled_not _ _ (settled_eq v hs _ _)
  settled_or _ _ _ hs
    (settled_and _ _ _ hs (hnz p) fun _ => settled_and _ _ _ hs (settled_le v hs _ _) fun _ =>
      settled_and _ _ _ hs (hnz q) fun _ => settled_and _ _ _ hs (settled_le v hs _ _) fun _ =>
        settled_not _ _ (settled_eq v hs _ _))
    (settled_and _ _ _ hs
      (settled_not _ _ (settled_and _ _ _ hs (hnz p) fun _ => settled_le v hs _ _))
      fun _ => settled_eq v hs _ _)

/-- `c_p(q) := K(p, q) ∧ R(p, q) ∧ ∀z. K(p, z) ∧ R(p, z) → z = q`. -/
def Cc (h : Prop) (K : Prop → Prop → Prop) : Prop → Prop → Prop :=
  λ p q ↦ K p q ∧ Rp h p q ∧ ∀ z, K p z ∧ Rp h p z → z = q

/-- `a := h ∧ ∀p. ∃q. c_p(q)`. -/
def Aa (h : Prop) (K : Prop → Prop → Prop) : Prop := h ∧ ∀ p, ∃ q, Cc h K p q

/-- The values `p ∧ c_p(q) ∧ t`, for `t` either `q` (the write-up's `u₀`) or `¬q` (`u₁`). -/
def Val (h : Prop) (K : Prop → Prop → Prop) (p q t : Prop) : Prop := p ∧ Cc h K p q ∧ t

/-- `Child(p, r) := ⊥ < p ≤ a ∧ r ≠ ⊥ ∧ ∃q. r = u₀(p, q) ∨ r = u₁(p, q)`. -/
def Child (h : Prop) (K : Prop → Prop → Prop) : Prop → Prop → Prop :=
  λ p r ↦ NZ p ∧ p ≤ Aa h K ∧ NZ r ∧ ∃ q, r = Val h K p q q ∨ r = Val h K p q (¬ q)

theorem aa_true (h : Prop) (hh : h) (K : Prop → Prop → Prop) (hK : Functional K)
    (hKR : ∀ p q, K p q → Rp h p q) : Aa h K :=
  ⟨hh, fun p => (hK p).elim fun q hq =>
    ⟨q, hq.1, hKR p q hq.1, fun z hz => (hq.2 z hz.1).symm⟩⟩

theorem aa_le (v h : Prop) (hh : h ≤ Vs v) (K : Prop → Prop → Prop) : Aa h K ≤ Vs v :=
  le_tr _ _ _ (and_le_l _ _) hh

theorem child_settled (v : Prop) (hs : Vs v) (h : Prop) (K : Prop → Prop → Prop) (p r : Prop) :
    Settled (Vs v) (Child h K p r) :=
  settled_and _ _ _ hs (settled_not _ _ (settled_eq v hs _ _)) fun _ =>
    settled_and _ _ _ hs (settled_le v hs _ _) fun _ =>
    settled_and _ _ _ hs (settled_not _ _ (settled_eq v hs _ _)) fun _ =>
    settled_exists v hs _ fun _ => settled_or _ _ _ hs (settled_eq v hs _ _) (settled_eq v hs _ _)

theorem val_le_p (h : Prop) (K : Prop → Prop → Prop) (p q t : Prop) : Val h K p q t ≤ p :=
  le_intro _ _ (nec% (fun (k : Val h K p q t) => k.1))

theorem val_le_t (h : Prop) (K : Prop → Prop → Prop) (p q t : Prop) : Val h K p q t ≤ t :=
  le_intro _ _ (nec% (fun (k : Val h K p q t) => k.2.2))

theorem val_le_rp (h : Prop) (K : Prop → Prop → Prop) (p q t : Prop) :
    Val h K p q t ≤ Rp h p q :=
  le_intro _ _ (nec% (fun (k : Val h K p q t) => k.2.1.2.1))

theorem cc_unique (h : Prop) (K : Prop → Prop → Prop) (p q q' t t' : Prop) :
    (Val h K p q t ∧ Val h K p q' t') → q' = q :=
  fun k => k.1.2.1.2.2 q' ⟨k.2.2.1.1, k.2.2.1.2.1⟩

/-- A nonzero value has `R(p, q)` true, since `R(p, q)` is settled and the value is below `s`. -/
theorem val_rp (v : Prop) (hs : Vs v) (h : Prop) (hh : h ≤ Vs v) (K : Prop → Prop → Prop)
    (p q t : Prop) (hp : p ≤ Aa h K) (hn : NZ (Val h K p q t)) : Rp h p q := by
  rcases em (Rp h p q) with hr | hr
  · exact hr
  · exact (hn (false_of_le_both _ _ (val_le_rp h K p q t)
      (le_tr _ _ _ (le_tr _ _ _ (le_tr _ _ _ (val_le_p h K p q t) hp) (aa_le v h hh K))
        (le_neg_of_settled _ _ hs (rp_settled v hs h p q) hr)))).elim

/-- Values at distinct `q ≠ q'` are disjoint. -/
theorem val_disjoint (v : Prop) (hs : Vs v) (h : Prop) (hh : h ≤ Vs v) (K : Prop → Prop → Prop)
    (p q q' t t' : Prop) (hp : p ≤ Aa h K) (hq : ¬ (q' = q)) :
    (Val h K p q t ∧ Val h K p q' t') = False :=
  false_of_le_both _ (q' = q) (le_intro _ _ (nec% (cc_unique h K p q q' t t')))
    (le_tr _ _ _ (le_tr _ _ _ (le_tr _ _ _ (and_le_l _ _)
      (le_tr _ _ _ (val_le_p h K p q t) hp)) (aa_le v h hh K))
      (le_neg_of_settled _ _ hs (settled_eq v hs _ _) hq))

theorem val_disjoint_self (h : Prop) (K : Prop → Prop → Prop) (p q : Prop) :
    (Val h K p q q ∧ Val h K p q (¬ q)) = False :=
  (box_not_eq _).mp (nec% (fun (k : Val h K p q q ∧ Val h K p q (¬ q)) => k.2.2.2 k.1.2.2))

/-- Children are proper parts. -/
theorem child_proper (v : Prop) (hs : Vs v) (h : Prop) (hh : h ≤ Vs v) (K : Prop → Prop → Prop)
    (p r : Prop) (hc : Child h K p r) : r ≤ p ∧ ¬ (r = p) := by
  obtain ⟨hp, hpa, hr, q, hq⟩ := hc
  have hph : p ≤ h := le_tr _ _ _ hpa (and_le_l _ _)
  rcases hq with e | e
  · subst e
    have hR := val_rp v hs h hh K p q q hpa hr
    rcases hR with hR | hR
    · refine ⟨val_le_p h K p q q, fun e => hR.2.2.2.2 (le_antisymm_prop q p hR.2.2.2.1 ?_)⟩
      rw [← e]
      exact val_le_t h K p q q
    · exact (hR.1 ⟨hp, hph⟩).elim
  · subst e
    have hR := val_rp v hs h hh K p q (¬ q) hpa hr
    rcases hR with hR | hR
    · refine ⟨val_le_p h K p q (¬ q), fun e => hR.2.2.1 ?_⟩
      have h₁ : p ≤ ¬ q := by rw [← e]; exact val_le_t h K p q (¬ q)
      exact false_of_le_both q q (le_refl_prop q) (le_tr _ _ _ hR.2.2.2.1 h₁)
    · exact (hR.1 ⟨hp, hph⟩).elim

theorem child_le (v : Prop) (hs : Vs v) (h : Prop) (hh : h ≤ Vs v) (K : Prop → Prop → Prop)
    (p r : Prop) (hc : Child h K p r) : r ≤ p := (child_proper v hs h hh K p r hc).1

/-- Distinct children are disjoint. -/
theorem child_disjoint (v : Prop) (hs : Vs v) (h : Prop) (hh : h ≤ Vs v) (K : Prop → Prop → Prop)
    (p r r' : Prop) (hc : Child h K p r) (hc' : Child h K p r') (hne : ¬ (r = r')) :
    (r ∧ r') = False := by
  obtain ⟨_, hpa, _, q, hq⟩ := hc
  obtain ⟨_, _, _, q', hq'⟩ := hc'
  rcases em (q' = q) with e | e
  · subst e
    rcases hq with e₁ | e₁ <;> rcases hq' with e₂ | e₂ <;> subst e₁ <;> subst e₂
    · exact (hne rfl).elim
    · exact val_disjoint_self h K p q'
    · rw [and_comm_eq]; exact val_disjoint_self h K p q'
    · exact (hne rfl).elim
  · rcases hq with e₁ | e₁ <;> rcases hq' with e₂ | e₂ <;> subst e₁ <;> subst e₂ <;>
      exact val_disjoint v hs h hh K p q q' _ _ hpa e

/-- `p ≤ a` is below the join of its values. -/
theorem le_vals (h : Prop) (K : Prop → Prop → Prop) (p : Prop) :
    (p → Aa h K) → p → ∃ q, Val h K p q q ∨ Val h K p q (¬ q) := fun f hp =>
  ((f hp).2 p).elim fun q hq => ⟨q, (em q).elim (fun k => Or.inl ⟨hp, hq, k⟩)
    (fun k => Or.inr ⟨hp, hq, k⟩)⟩

/-- A value is a child, or is `⊥`. -/
theorem val_child_or (h : Prop) (K : Prop → Prop → Prop) (p q t : Prop) (hp : NZ p)
    (hpa : p ≤ Aa h K) (ht : t = q ∨ t = ¬ q) :
    Child h K p (Val h K p q t) ∨ Val h K p q t = False := by
  rcases em (Val h K p q t = False) with e | e
  · exact Or.inr e
  · refine Or.inl ⟨hp, hpa, e, q, ?_⟩
    rcases ht with ht | ht <;> subst ht
    · exact Or.inl rfl
    · exact Or.inr rfl

theorem box_val_imp (h : Prop) (K : Prop → Prop → Prop) (p q t w : Prop) (hp : NZ p)
    (hpa : p ≤ Aa h K) (ht : t = q ∨ t = ¬ q) (hw : ∀ r, Child h K p r → r ≤ w) :
    □ (Val h K p q t → w) :=
  (val_child_or h K p q t hp hpa ht).elim (fun hc => le_elim _ _ (hw _ hc))
    fun e => modal_K _ _ (nec% (fun (n : ¬ Val h K p q t) (k : Val h K p q t) => ((n k).elim : w)))
      ((box_not_eq _).mpr e)

/-- The join of the children of `p` is `p`: any bound of them bounds `p`. -/
theorem join_least (v : Prop) (hs : Vs v) (h : Prop) (hh : h ≤ Vs v) (K : Prop → Prop → Prop)
    (p : Prop) (hpa : p ≤ Aa h K) (w : Prop) (hw : ∀ r, Child h K p r → r ≤ w) : p ≤ w := by
  rcases em (NZ p) with hp | hp
  · have hall : Vs v ≤ ∀ q, (Val h K p q q ∨ Val h K p q (¬ q)) → w :=
      collection v hs _ fun q => le_of_box _ _ (modal_K _ _ (modal_K _ _
        (nec% (fun (f : Val h K p q q → w) (g : Val h K p q (¬ q) → w)
          (k : Val h K p q q ∨ Val h K p q (¬ q)) => k.elim f g))
        (box_val_imp h K p q q w hp hpa (Or.inl rfl) hw))
        (box_val_imp h K p q (¬ q) w hp hpa (Or.inr rfl) hw))
    exact le_mono₂ _ _ _ _ (le_tr _ _ _ (le_tr _ _ _ hpa (aa_le v h hh K)) hall) (le_intro _ _ (modal_K _ _
      (nec% (le_vals h K p)) (le_elim _ _ hpa)))
      (nec% (fun (f : ∀ q, (Val h K p q q ∨ Val h K p q (¬ q)) → w)
        (k : ∃ q, Val h K p q q ∨ Val h K p q (¬ q)) => k.elim fun q hq => f q hq))
  · have e : p = False := (em (p = False)).elim id (fun n => (hp n).elim)
    rw [e]
    exact bot_le_prop w

/-- A true `p ≤ a` has a true child. -/
theorem true_child (h : Prop) (K : Prop → Prop → Prop) (p : Prop) (hpa : p ≤ Aa h K) (hp : p) :
    ∃ r, Child h K p r ∧ r := by
  obtain ⟨q, hq⟩ := le_vals h K p (true_of_le _ _ hpa) hp
  rcases hq with hq | hq
  · exact ⟨_, ⟨nz_of_true p hp, hpa, nz_of_true _ hq, q, Or.inl rfl⟩, hq⟩
  · exact ⟨_, ⟨nz_of_true p hp, hpa, nz_of_true _ hq, q, Or.inr rfl⟩, hq⟩

/-- At most one child is true. -/
theorem true_child_unique (v : Prop) (hs : Vs v) (h : Prop) (hh : h ≤ Vs v)
    (K : Prop → Prop → Prop) (p r r' : Prop) (hc : Child h K p r) (hr : r)
    (hc' : Child h K p r') (hr' : r') : r = r' := by
  rcases em (r = r') with e | e
  · exact e
  · have hf := child_disjoint v hs h hh K p r r' hc hc' e
    exact ((hf ▸ (⟨hr, hr'⟩ : r ∧ r')) : False).elim

/-- A nonzero `p ≤ a` has a child other than any given one. -/
theorem other_child (v : Prop) (hs : Vs v) (h : Prop) (hh : h ≤ Vs v) (K : Prop → Prop → Prop)
    (p r : Prop) (hc : Child h K p r) : ∃ d, Child h K p d ∧ ¬ (d = r) := by
  rcases em (∃ d, Child h K p d ∧ ¬ (d = r)) with hd | hd
  · exact hd
  · have hp := child_proper v hs h hh K p r hc
    refine (hp.2 (le_antisymm_prop r p hp.1 (join_least v hs h hh K p hc.2.1 r fun d hcd => ?_))).elim
    rcases em (d = r) with e | e
    · rw [e]; exact le_refl_prop r
    · exact (hd ⟨d, hcd, e⟩).elim

/-- A nonzero `p ≤ a` has a child. -/
theorem some_child (v : Prop) (hs : Vs v) (h : Prop) (hh : h ≤ Vs v) (K : Prop → Prop → Prop)
    (p : Prop) (hp : NZ p) (hpa : p ≤ Aa h K) : ∃ r, Child h K p r := by
  rcases em (∃ r, Child h K p r) with hr | hr
  · exact hr
  · exact (hp (false_of_le_false p False (join_least v hs h hh K p hpa False
      (fun r hc => (hr ⟨r, hc⟩).elim)) rfl)).elim

end Classicism.Proofs.BWActuality
