import Classicism.Results.BourbakiWitt.ActualityCode

/-!
# Vicinity, Boolean Completeness at `t` and Relational Choice imply Actuality: §6

After the discarded parts and the decoded step `g` (§§4–5, `ActualityCode.lean`): the settled
chain `N`, the tower of `g`
under the Bourbaki–Witt lemma for admissible chains with the settled properties admissible,
which contains `M`, so that `m`, the glb of a settled family of truths, is true (§6).
-/

set_option linter.unusedSectionVars false

namespace Classicism.Proofs.BWActuality
open Classicism.P Classicism.Paper Classicism.BW Classicism.Proofs.Settled

/-! ### The settled tower of an abstract step

The facts about `N` used below, for an abstract `a` and step `G`, so that a use at `Aa h K` and
`Gr h K b` costs the translator one instantiation of a closed lemma. -/

section GenN
variable (v : Prop) (hs : Vs v) (a : Prop) (G : Prop → Prop → Prop)
include hs

theorem gen_tn_settled (hGs : ∀ x y, Settled (Vs v) (G x y)) :
    SettledP (Vs v) (Tower (SettledP (Vs v)) (Xa a) Ge G) :=
  tower_settled v hs _ _ _ (xa_settled v hs _) (ge_settled v hs) hGs

theorem gen_tn_closed (hG : ∀ x y, Xa a x → G x y → Xa a y) :
    Closed (SettledP (Vs v)) (Xa a) Ge G (Tower (SettledP (Vs v)) (Xa a) Ge G) :=
  bw_closed _ _ _ _ hG (admits_settled _ _ (xa_settled v hs _))

theorem gen_tn_total (hGs : ∀ x y, Settled (Vs v) (G x y))
    (hG : ∀ x y, Xa a x → G x y → Xa a y) (hser : ∀ x, Xa a x → ∃ y, G x y)
    (hprog : ∀ x y, Xa a x → G x y → Ge x y)
    (hfun : ∀ x y y', Xa a x → G x y → G x y' → y = y') :
    TotalOn Ge (Tower (SettledP (Vs v)) (Xa a) Ge G) :=
  have hX := xa_settled v hs a
  bw_total _ _ _ _ (ge_trans _) hG hser hprog (gen_inv a G hG hfun) (admits_settled _ _ hX)
    (admits_settled _ _ (pivot_settled v hs _ _ _ hX (ge_settled v hs) hGs))
    (fun c e _ _ => admits_settled _ _ (mce_settled v hs _ _ _ hX (ge_settled v hs) hGs c e))

/-- Claim A for abstract steps: if `G` agrees with `F` at the true members of the tower of `F`,
and `F` fixes false propositions, the tower of `F` is included in the settled tower of `G`. -/
theorem gen_claim_A (F : Prop → Prop → Prop) (hGs : ∀ x y, Settled (Vs v) (G x y))
    (hG : ∀ x y, Xa a x → G x y → Xa a y) (hser : ∀ x, Xa a x → ∃ y, G x y)
    (hprog : ∀ x y, Xa a x → G x y → Ge x y)
    (hfun : ∀ x y y', Xa a x → G x y → G x y' → y = y')
    (hF : ∀ x y, Xa a x → F x y → Xa a y) (hFser : ∀ x, Xa a x → ∃ y, F x y)
    (hFprog : ∀ x y, Xa a x → F x y → Ge x y)
    (hFfun : ∀ x y y', Xa a x → F x y → F x y' → y = y')
    (hfalse : ∀ p r, ¬ p → F p r → r = p)
    (hFG : ∀ x y, Tower AllProps (Xa a) Ge F x → x → F x y → G x y) :
    ∀ p, Tower AllProps (Xa a) Ge F p → Tower (SettledP (Vs v)) (Xa a) Ge G p := by
  have hN := gen_tn_closed v hs a G hG
  have hNs := gen_tn_settled v hs a G hGs
  have hNt := gen_tn_total v hs a G hGs hG hser hprog hfun
  have hM := gen_closed a F hF
  have hMt := gen_total a F hF hFser hFprog hFfun
  have hY := tower_sub AllProps (Xa a) Ge F
    (λ p ↦ Tower AllProps (Xa a) Ge F p ∧ Tower (SettledP (Vs v)) (Xa a) Ge G p) (admits_all _)
    ⟨fun x hx => hM.1 x hx.1, fun x y hx hf => ?_, fun Z t _ hZ _ ht => ?_⟩
  · exact fun p hp => (hY p hp).2
  · refine ⟨hM.2.1 x y hx.1 hf, ?_⟩
    rcases em x with h₁ | h₁
    · exact hN.2.1 x y hx.2 (hFG x y hx.1 h₁ hf)
    · rw [hfalse x y h₁ hf]
      exact hx.2
  · refine ⟨hM.2.2 Z t trivial (fun z hz => (hZ z hz).1)
      (fun x y hx hy => hMt x y (hZ x hx).1 (hZ y hy).1) ht, ?_⟩
    refine hN.2.2 (λ p ↦ Tower (SettledP (Vs v)) (Xa a) Ge G p ∧ t ≤ p) t
      (fun p => settled_and _ _ _ hs (hNs p) fun _ => settled_le v hs _ _)
      (fun _ k => k.1) (fun x y hx hy => hNt x y hx.1 hy.1)
      ⟨⟨ht.1.1, fun _ k => k.2⟩, fun u hu => ht.2 u ⟨hu.1, fun z hz => hu.2 z ⟨(hZ z hz).2, ht.1.2 z hz⟩⟩⟩

end GenN

/-! ### The argument of §6 for an abstract decoded step

Claims A–C for an abstract `g` in place of the decoded step, so that the theorem below costs the
translator one instantiation, at `Gd h K b`. -/

/-- The graph of a step `g`: `(Gr g)(p, r) := r = g p`. -/
def GrOf (g : Prop → Prop) : Prop → Prop → Prop := λ p r ↦ r = g p

section GenM
variable (v : Prop) (hs : Vs v) (a : Prop) (g : Prop → Prop)

theorem grOf_X (hgle : ∀ p, g p ≤ p) : ∀ x y, Xa a x → GrOf g x y → Xa a y :=
  fun x _ hx e => e ▸ le_tr _ _ _ (hgle x) hx

theorem grOf_ser : ∀ x, Xa a x → ∃ y, GrOf g x y := fun x _ => ⟨g x, rfl⟩

theorem grOf_prog (hgle : ∀ p, g p ≤ p) : ∀ x y, Xa a x → GrOf g x y → Ge x y :=
  fun x _ _ e => e ▸ hgle x

theorem grOf_fun : ∀ x y y', Xa a x → GrOf g x y → GrOf g x y' → y = y' :=
  fun _ _ _ _ e₁ e₂ => e₁.trans e₂.symm

include hs

theorem grOf_settled : ∀ x y, Settled (Vs v) (GrOf g x y) := fun _ _ => settled_eq v hs _ _

/-- Claims A–C: `m`, the glb of the tower of `F`, is true, given that `g` agrees with `F` at the
true members of that tower and `m` is the glb of the tower's other members. -/
theorem gen_m_true (F : Prop → Prop → Prop) (hgle : ∀ p, g p ≤ p)
    (hF : ∀ x y, Xa a x → F x y → Xa a y) (hFser : ∀ x, Xa a x → ∃ y, F x y)
    (hFprog : ∀ x y, Xa a x → F x y → Ge x y)
    (hFfun : ∀ x y y', Xa a x → F x y → F x y' → y = y')
    (hfalse : ∀ p r, ¬ p → F p r → r = p)
    (hFG : ∀ x y, Tower AllProps (Xa a) Ge F x → x → F x y → y = g x) (m : Prop)
    (hmle : ∀ x, Tower AllProps (Xa a) Ge F x → m ≤ x)
    (hfm : ∀ q, Tower AllProps (Xa a) Ge F q → ¬ q → q = m)
    (hglb : ∀ w, (∀ x, Tower AllProps (Xa a) Ge F x → ¬ (x = m) → w ≤ x) → w ≤ m) : m := by
  have hGs := grOf_settled v hs g
  have hG := grOf_X a g hgle
  have hser := grOf_ser a g
  have hprog := grOf_prog a g hgle
  have hfun := grOf_fun a g
  have hNt := gen_tn_total v hs a (GrOf g) hGs hG hser hprog hfun
  have hNs := gen_tn_settled v hs a (GrOf g) hGs
  have hA := gen_claim_A v hs a (GrOf g) F hGs hG hser hprog hfun hF hFser hFprog hFfun hfalse hFG
  -- Claim B: members of `N` strictly above `m` are true.
  have hB : ∀ p, Tower (SettledP (Vs v)) (Xa a) Ge (GrOf g) p → m ≤ p → ¬ (p = m) → p := by
    intro p hp hmp hne
    rcases em p with h₁ | h₁
    · exact h₁
    · refine (hne (le_antisymm_prop p m (hglb p fun x hx hxm => ?_) hmp)).elim
      have hxt : x := (em x).elim id fun k => (hxm (hfm x hx k)).elim
      exact (hNt x p (hA x hx) hp).elim id (fun k => (h₁ (true_of_le x p k hxt)).elim)
  -- Claim C.
  have hIs : SettledP (Vs v)
      (λ p ↦ Tower (SettledP (Vs v)) (Xa a) Ge (GrOf g) p ∧ m ≤ p ∧ ¬ (p = m)) := fun p =>
    settled_and _ _ _ hs (hNs p) fun _ =>
      settled_and _ _ _ hs (settled_le v hs _ _) fun _ => settled_not _ _ (settled_eq v hs _ _)
  have hw : Vs v ∧ ∀ p, (Tower (SettledP (Vs v)) (Xa a) Ge (GrOf g) p ∧ m ≤ p ∧ ¬ (p = m)) → p :=
    ⟨hs, fun p hp => hB p hp.1 hp.2.1 hp.2.2⟩
  have hwm := hglb _ fun x hx hxm => settled_family_meet v hs _ hIs x ⟨hA x hx, hmle x hx, hxm⟩
  exact true_of_le _ _ hwm hw

end GenM

section Code
variable (v : Prop) (hs : Vs v) (h : Prop) (hh : h ≤ Vs v) (K : Prop → Prop → Prop)
include hs hh

section Second
variable (K₂ : Prop → Prop → Prop) (hK₂ : Functional K₂) (hK₂W : ∀ d r, K₂ d r → Wd h K d r)
  (b : Prop) (hb : LUB b (Rs h K K₂))
include hK₂ hK₂W hb

/-! ### §6: the settled chain -/

theorem g_le (p : Prop) : Gd h K b p ≤ p := le_intro _ _ (nec% (fun (k : Gd h K b p) => k.1))

/-- Claims A–C: `m` is true, given that `a` is (`gen_m_true` at `g`). -/
theorem m_true (bc : BooleanCompleteness Prop) (ha : Aa h K) (m : Prop)
    (hm : SupIn (Xa (Aa h K)) Ge m (Tm h K)) : m :=
  gen_m_true v hs _ (Gd h K b) (Fs h K) (g_le v hs h hh K K₂ hK₂ hK₂W b hb)
    (fs_X v hs h hh K) (fs_ser v hs h hh K) (fs_prog v hs h hh K) (fs_fun v hs h hh K)
    (fs_false v hs h hh K) (fun x y hx h₁ hf => (g_eq v hs h hh K K₂ hK₂ hK₂W b hb x y hx h₁ hf).symm) m
    (fun x hx => hm.1.2 x hx) (fun q hq hq' => false_member v hs h hh K m hm q hq hq')
    (fun w hw => m_glb_rest v hs h hh K bc ha m hm w hw)

end Second

end Code

/-! ### The theorem -/

theorem not_zd_contradiction (v : Prop) (hs : Vs v) (hz : ¬ Zd) (bc : BooleanCompleteness Prop)
    (rc : RelationalChoice Prop Prop) : False := by
  have hh : Hd v ≤ Vs v := hd_le v
  obtain ⟨K, hK, hKR⟩ := rc (Rp (Hd v)) (rp_serial v hs)
  have ha := aa_true (Hd v) ⟨hs, hz⟩ K hK hKR
  obtain ⟨K₂, hK₂, hK₂W⟩ := rc (Wd (Hd v) K) (wd_serial v hs (Hd v) hh K)
  obtain ⟨b, hb⟩ := BooleanCompleteness.to_lub bc (Rs (Hd v) K K₂)
  obtain ⟨m, hm⟩ := tm_sup v hs (Hd v) hh K bc
  exact m_false v hs (Hd v) hh K m hm
    (m_true v hs (Hd v) hh K K₂ hK₂ hK₂W b hb bc ha m hm)

/-- **The record.** -/
theorem vicinity_boolean_completeness_t_and_relational_choice_imply_actuality :
    Vicinity → BooleanCompletenessT → RelationalChoice Prop Prop → Actuality := by
  intro vic bc rc
  obtain ⟨v, hv, hA⟩ := vic
  rcases em Zd with hz | hz
  · exact actuality_of_dec hz
  · exact (not_zd_contradiction v ⟨hv, hA⟩ hz bc rc).elim

end Classicism.Proofs.BWActuality
