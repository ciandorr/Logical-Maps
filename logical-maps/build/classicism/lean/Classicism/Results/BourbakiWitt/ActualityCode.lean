import Classicism.Results.BourbakiWitt.ActualityChain

/-!
# Vicinity, Boolean Completeness at `t` and Relational Choice imply Actuality: §§4–5

The discarded parts, coded by a second choice (§4), and the decoded step `g`, which agrees with
the step of `M` at its true members as an identity (§5). The settled chain `N` and the theorem
are in `Actuality.lean`; the two are separate modules so that each module's derivations
(`Derive/ActualityCode.lean`, `Derive/Actuality.lean`) stay within the kernel's memory.
-/

set_option linter.unusedSectionVars false

namespace Classicism.Proofs.BWActuality
open Classicism.P Classicism.Paper Classicism.BW Classicism.Proofs.Settled

/-- `Δ(d) := ∃p r. Mp ∧ p ∧ F(p, r) ∧ Child(p, d) ∧ d ≠ r`: the false children of true members. -/
def Dl (h : Prop) (K : Prop → Prop → Prop) : Prop → Prop :=
  λ d ↦ ∃ p r, Tm h K p ∧ p ∧ Fs h K p r ∧ Child h K p d ∧ ¬ (d = r)

/-- The relation the code is chosen from: `[Δ(d) ∧ Child(d, r)] ∨ [¬Δ(d) ∧ r = ⊥]`. -/
def Wd (h : Prop) (K : Prop → Prop → Prop) : Prop → Prop → Prop :=
  λ d r ↦ (Dl h K d ∧ Child h K d r) ∨ (¬ Dl h K d ∧ r = False)

/-- The chosen parts `r_d`. -/
def Rs (h : Prop) (K K₂ : Prop → Prop → Prop) : Prop → Prop := λ r ↦ ∃ d, Dl h K d ∧ K₂ d r

/-- `Mixed(x) := x ∧ b ≠ ⊥ ∧ x ∧ ¬b ≠ ⊥`. -/
def Mixed (b x : Prop) : Prop := NZ (x ∧ b) ∧ NZ (x ∧ ¬ b)

/-- `H(c) := ∃e. Child(c, e) ∧ Mixed(e)`. -/
def Hc (h : Prop) (K : Prop → Prop → Prop) (b : Prop) : Prop → Prop :=
  λ c ↦ ∃ e, Child h K c e ∧ Mixed b e

/-- The decoded step `g := λp. p ∧ ∃c. (Child(p, c) ∧ H(c)) ∧ c`, a term of type `tt`. -/
def Gd (h : Prop) (K : Prop → Prop → Prop) (b : Prop) : Prop → Prop :=
  λ p ↦ p ∧ ∃ c, (Child h K p c ∧ Hc h K b c) ∧ c

/-- The graph of `g`. -/
def Gr (h : Prop) (K : Prop → Prop → Prop) (b : Prop) : Prop → Prop → Prop :=
  λ p r ↦ r = Gd h K b p

theorem disj_below (d d' r : Prop) (hd : (d ∧ r) = False) (h : d' ≤ r) : (d ∧ d') = False :=
  false_of_le_false _ _ (le_intro _ _ (modal_K _ _
    (nec% (fun (f : d' → r) (k : d ∧ d') => (⟨k.1, f k.2⟩ : d ∧ r))) (le_elim _ _ h))) hd

theorem le_of_and_neg_false (d b : Prop) (h : (d ∧ ¬ b) = False) : d ≤ b :=
  le_intro _ _ (modal_K _ _ (nec% (fun (n : ¬ (d ∧ ¬ b)) (k : d) =>
    (em b).elim id (fun nb => (n ⟨k, nb⟩).elim))) ((box_not_eq _).mpr h))

theorem and_neg_false_of_le (e b : Prop) (h : e ≤ b) : (e ∧ ¬ b) = False :=
  (box_not_eq _).mp (modal_K _ _ (nec% (fun (f : e → b) (k : e ∧ ¬ b) => k.2 (f k.1)))
    (le_elim _ _ h))

theorem xa_settled (v : Prop) (hs : Vs v) (a : Prop) : SettledP (Vs v) (Xa a) :=
  fun _ => settled_le v hs _ _

theorem ge_settled (v : Prop) (hs : Vs v) : ∀ x y, Settled (Vs v) (Ge x y) :=
  fun _ _ => settled_le v hs _ _

section Code
variable (v : Prop) (hs : Vs v) (h : Prop) (hh : h ≤ Vs v) (K : Prop → Prop → Prop)
include hs hh

/-! ### §4: the discarded parts -/

theorem dl_le (d : Prop) (hd : Dl h K d) : NZ d ∧ d ≤ Aa h K :=
  hd.elim fun p hp' => hp'.elim fun _ k =>
    ⟨k.2.2.2.1.2.2.1, le_tr _ _ _ (child_le v hs h hh K p d k.2.2.2.1) (tm_X v hs h hh K p k.1)⟩

/-- The discarded parts are pairwise disjoint. -/
theorem dl_disjoint (d d' : Prop) (hd : Dl h K d) (hd' : Dl h K d') (hne : ¬ (d = d')) :
    (d ∧ d') = False := by
  obtain ⟨p, r, hp, hpt, hf, hc, hdr⟩ := hd
  obtain ⟨p', r', hp', hpt', hf', hc', hdr'⟩ := hd'
  have hcr := (fs_true v hs h hh K p r hpt hf).1
  have hcr' := (fs_true v hs h hh K p' r' hpt' hf').1
  rcases em (p = p') with e | e
  · subst e
    exact child_disjoint v hs h hh K p d d' hc hc' hne
  · rcases tm_total v hs h hh K p p' hp hp' with h₁ | h₁
    · -- `p' ≤ p`
      have hle := tm_below v hs h hh K p p' r hp hp' h₁ (fun e' => e e'.symm) hf
      exact disj_below d d' r (child_disjoint v hs h hh K p d r hc hcr hdr)
        (le_tr _ _ _ (child_le v hs h hh K p' d' hc') hle)
    · have hle := tm_below v hs h hh K p' p r' hp' hp h₁ e hf'
      have e₂ := disj_below d' d r' (child_disjoint v hs h hh K p' d' r' hc' hcr' hdr')
        (le_tr _ _ _ (child_le v hs h hh K p d hc) hle)
      rw [and_comm_eq]
      exact e₂

theorem wd_serial : Serial (Wd h K) := fun d =>
  (em (Dl h K d)).elim
    (fun hd => (some_child v hs h hh K d (dl_le v hs h hh K d hd).1 (dl_le v hs h hh K d hd).2).elim
      fun r hr => ⟨r, Or.inl ⟨hd, hr⟩⟩)
    (fun hd => ⟨False, Or.inr ⟨hd, rfl⟩⟩)

section Second
variable (K₂ : Prop → Prop → Prop) (hK₂ : Functional K₂) (hK₂W : ∀ d r, K₂ d r → Wd h K d r)
  (b : Prop) (hb : LUB b (Rs h K K₂))
include hK₂ hK₂W hb

theorem k2_child (d r : Prop) (hd : Dl h K d) (hk : K₂ d r) : Child h K d r :=
  (hK₂W d r hk).elim (fun k => k.2) (fun k => (k.1 hd).elim)

/-- `b ∧ d = r_d`. -/
theorem b_meet (d r : Prop) (hd : Dl h K d) (hk : K₂ d r) : (b ∧ d) = r := by
  have hrb : r ≤ b := (hb b).2 (le_refl_prop b) r ⟨d, hd, hk⟩
  have hrd : r ≤ d := child_le v hs h hh K d r (k2_child v hs h hh K K₂ hK₂ hK₂W b hb d r hd hk)
  have hub : b ≤ (¬ d ∨ r) := (hb (¬ d ∨ r)).1 fun r' hr' => by
    obtain ⟨e, he, hk'⟩ := hr'
    rcases em (e = d) with e₁ | e₁
    · subst e₁
      obtain ⟨r₀, _, hu⟩ := hK₂ e
      have e₂ : r' = r := (hu r' hk').symm.trans (hu r hk)
      rw [e₂]
      exact le_or_right_prop _ _
    · exact le_or_of_le_left_prop _ _ _ (le_tr _ _ _
        (child_le v hs h hh K e r' (k2_child v hs h hh K K₂ hK₂ hK₂W b hb e r' he hk'))
        (le_neg_of_false e d (dl_disjoint v hs h hh K e d he hd e₁)))
  exact le_antisymm_prop _ _
    (le_intro _ _ (modal_K _ _ (nec% (fun (f : b → ¬ d ∨ r) (k : b ∧ d) =>
      (f k.1).elim (fun n => (n k.2).elim) id)) (le_elim _ _ hub)))
    (le_and_le _ _ _ hrb hrd)

/-- `H` fails at a discarded part `d` through its chosen part `r_d`. -/
theorem h_fails_chosen (d e : Prop) (hd : Dl h K d) (hmix : Mixed b e) (hk : K₂ d e) : False :=
  hmix.2 (and_neg_false_of_le e b ((hb b).2 (le_refl_prop b) e ⟨d, hd, hk⟩))

/-- `H` fails at a discarded part `d` through a child other than `r_d`. -/
theorem h_fails_other (d e r : Prop) (hd : Dl h K d) (hce : Child h K d e) (hmix : Mixed b e)
    (hk : K₂ d r) (e₁ : ¬ (e = r)) : False := by
  have hcr := k2_child v hs h hh K K₂ hK₂ hK₂W b hb d r hd hk
  have hdis := child_disjoint v hs h hh K d e r hce hcr e₁
  have hed : e ≤ d := child_le v hs h hh K d e hce
  refine hmix.1 (false_of_le_false _ (e ∧ (b ∧ d)) (le_intro _ _ (modal_K _ _
    (nec% (fun (f : e → d) (k : e ∧ b) => (⟨k.1, k.2, f k.1⟩ : e ∧ (b ∧ d)))) (le_elim _ _ hed))) ?_)
  rw [b_meet v hs h hh K K₂ hK₂ hK₂W b hb d r hd hk]
  exact hdis

theorem h_fails_at (d e r : Prop) (hd : Dl h K d) (hce : Child h K d e) (hmix : Mixed b e)
    (hk : K₂ d r) : False :=
  (em (e = r)).elim (fun e₁ => h_fails_chosen v hs h hh K K₂ hK₂ hK₂W b hb d e hd hmix (e₁ ▸ hk))
    (fun e₁ => h_fails_other v hs h hh K K₂ hK₂ hK₂W b hb d e r hd hce hmix hk e₁)

/-- `H` fails at every discarded part. -/
theorem h_fails (d : Prop) (hd : Dl h K d) : ¬ Hc h K b d := fun hH =>
  hH.elim fun e he => (hK₂ d).elim fun r hr =>
    h_fails_at v hs h hh K K₂ hK₂ hK₂W b hb d e r hd he.1 he.2 hr.1

/-- `H` holds at every true member of `M`. -/
theorem h_holds (c : Prop) (hc : Tm h K c) (hct : c) : Hc h K b c := by
  obtain ⟨r, hf⟩ := fs_ser v hs h hh K c (tm_X v hs h hh K c hc)
  have hcr := (fs_true v hs h hh K c r hct hf).1
  obtain ⟨d, hcd, hdr⟩ := other_child v hs h hh K c r hcr
  have hd : Dl h K d := ⟨c, r, hc, hct, hf, hcd, hdr⟩
  obtain ⟨rd, hk, _⟩ := hK₂ d
  have hdrd := k2_child v hs h hh K K₂ hK₂ hK₂W b hb d rd hd hk
  have e : (d ∧ b) = rd := (and_comm_eq d b).trans (b_meet v hs h hh K K₂ hK₂ hK₂W b hb d rd hd hk)
  refine ⟨d, hcd, ?_, fun e' => ?_⟩
  · rw [e]; exact hdrd.2.2.1
  · have hdb := le_of_and_neg_false d b e'
    have hp := child_proper v hs h hh K d rd hdrd
    refine hp.2 (le_antisymm_prop _ _ hp.1 ?_)
    rw [← e]
    exact le_and_le _ _ _ (le_refl_prop d) hdb

theorem hc_settled (c : Prop) : Settled (Vs v) (Hc h K b c) :=
  settled_exists v hs _ fun e => settled_and _ _ _ hs (child_settled v hs h K c e) fun _ =>
    settled_and _ _ _ hs (settled_not _ _ (settled_eq v hs _ _)) fun _ =>
      settled_not _ _ (settled_eq v hs _ _)

/-! ### §5: the decoded step -/

/-- At a true member `p` of `M`, `g(p) = F(p)`. -/
theorem g_eq (p r : Prop) (hp : Tm h K p) (hpt : p) (hf : Fs h K p r) : Gd h K b p = r := by
  have hcr := fs_true v hs h hh K p r hpt hf
  have hPs : SettledP (Vs v) (λ c ↦ Child h K p c ∧ Hc h K b c) := fun c =>
    settled_and _ _ _ hs (child_settled v hs h K p c) fun _ => hc_settled v hs h hh K K₂ hK₂ hK₂W b hb c
  have honly : ∀ c, Child h K p c ∧ Hc h K b c → c ≤ r := fun c hc => by
    rcases em (c = r) with e | e
    · rw [e]; exact le_refl_prop r
    · exact (h_fails v hs h hh K K₂ hK₂ hK₂W b hb c ⟨p, r, hp, hpt, hf, hc.1, e⟩ hc.2).elim
  have hPr : Child h K p r ∧ Hc h K b r :=
    ⟨hcr.1, h_holds v hs h hh K K₂ hK₂ hK₂W b hb r (tm_step v hs h hh K p r hp hf) hcr.2⟩
  have hps : p ≤ Vs v := le_tr _ _ _ (tm_X v hs h hh K p hp) (aa_le v h hh K)
  have hrp : r ≤ p := child_le v hs h hh K p r hcr.1
  refine le_antisymm_prop _ _ (le_tr _ _ _ ?_ (settled_family_join_least v hs _ hPs r honly)) ?_
  · exact le_intro _ _ (modal_K _ _ (nec% (fun (f : p → Vs v) (k : Gd h K b p) =>
      (⟨f k.1, k.2⟩ : Vs v ∧ ∃ c, (Child h K p c ∧ Hc h K b c) ∧ c))) (le_elim _ _ hps))
  · exact le_and_le _ _ _ hrp (le_tr _ _ _ (le_and_le _ _ _ (le_tr _ _ _ hrp hps) (le_refl_prop r))
      (settled_family_join_upper v hs _ hPs r hPr))

end Second

end Code

end Classicism.Proofs.BWActuality
