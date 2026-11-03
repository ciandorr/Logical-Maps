import Classicism.Results.BourbakiWitt.ActualityParts

/-!
# Vicinity, Boolean Completeness at `t` and Relational Choice imply Actuality: §3

The chain of true parts. On `X := λp. p ≤ a`, ordered by `≥` (so that suprema are greatest lower
bounds, supplied by Boolean Completeness at `t` as `glb ∧ a`), the step `F(p, r)` keeps a false
`p` and takes a true `p` to its true child. The Bourbaki–Witt lemma (its tower `M`, here at the
trivial restrictor) gives the glb `m` of `M`, with: `m` false; every other member of `M` true;
`m` the glb of the members other than `m`; and `q ≤ F(p)` for members `q < p`.
-/

set_option linter.unusedSectionVars false

namespace Classicism.Proofs.BWActuality
open Classicism.P Classicism.Paper Classicism.BW Classicism.Proofs.Settled

/-- `X := λp. p ≤ a`. -/
def Xa (a : Prop) : Prop → Prop := λ p ↦ p ≤ a

/-- The order `≥`: `x ≼ y` iff `y ≤ x`. -/
def Ge : Prop → Prop → Prop := λ x y ↦ y ≤ x

/-- `F(p, r) := [¬p ∧ r = p] ∨ [p ∧ Child(p, r) ∧ r]`. -/
def Fs (h : Prop) (K : Prop → Prop → Prop) : Prop → Prop → Prop :=
  λ p r ↦ (¬ p ∧ r = p) ∨ (p ∧ Child h K p r ∧ r)

/-- The tower `M` of `F`. -/
def Tm (h : Prop) (K : Prop → Prop → Prop) : Prop → Prop := Tower AllProps (Xa (Aa h K)) Ge (Fs h K)

/-! ### The order and its suprema -/

theorem ge_trans (X : Prop → Prop) :
    ∀ x y z, X x → X y → X z → Ge x y → Ge y z → Ge x z :=
  fun x y z _ _ _ h₁ h₂ => le_tr z y x h₂ h₁

theorem ge_refl (X : Prop → Prop) : ∀ x, X x → Ge x x := fun x _ => le_refl_prop x

theorem ge_anti (X : Prop → Prop) : ∀ x y, X x → X y → Ge x y → Ge y x → x = y :=
  fun x y _ _ h₁ h₂ => le_antisymm_prop x y h₂ h₁

/-- Every family in `X` has a supremum in `X` under `≥`: `glb ∧ a`. -/
theorem glb_sup (bc : BooleanCompleteness Prop) (a : Prop) (Z : Prop → Prop)
    (_hZ : ∀ z, Z z → Xa a z) : ∃ t, SupIn (Xa a) Ge t Z := by
  obtain ⟨g, hg⟩ := bc Z
  have hlb : LB g Z := (hg g).2 (le_refl_prop g)
  refine ⟨g ∧ a, ⟨and_le_r g a, fun z hz => le_tr _ _ _ (and_le_l g a) (hlb z hz)⟩, ?_⟩
  intro u hu
  exact le_and_le u g a ((hg u).1 hu.2) hu.1

/-! ### The tower of an abstract step

The facts about the tower used below, for an abstract `a` and step `F`, so that a use at
`Aa h K` and `Fs h K` costs the translator one instantiation of a closed lemma rather than one
of the general lemma with its admissibility hypotheses. -/

section Gen
variable (a : Prop) (F : Prop → Prop → Prop)

theorem gen_closed (hF : ∀ x y, Xa a x → F x y → Xa a y) :
    Closed AllProps (Xa a) Ge F (Tower AllProps (Xa a) Ge F) :=
  bw_closed AllProps _ _ _ hF (admits_all _)

theorem gen_inv (hF : ∀ x y, Xa a x → F x y → Xa a y)
    (hfun : ∀ x y y', Xa a x → F x y → F x y' → y = y') :
    ∀ x x' y y', Xa a x → Xa a x' → Ge x x' → Ge x' x → F x y → F x' y' → Ge y y' ∧ Ge y' y :=
  invariant_of_partial _ _ _ (ge_refl _) (ge_anti _) hF hfun

theorem gen_total (hF : ∀ x y, Xa a x → F x y → Xa a y) (hser : ∀ x, Xa a x → ∃ y, F x y)
    (hprog : ∀ x y, Xa a x → F x y → Ge x y)
    (hfun : ∀ x y y', Xa a x → F x y → F x y' → y = y') :
    TotalOn Ge (Tower AllProps (Xa a) Ge F) :=
  bw_total AllProps _ _ _ (ge_trans _) hF hser hprog (gen_inv a F hF hfun) (admits_all _)
    (admits_all _) (fun _ _ _ _ => admits_all _)

theorem gen_comp (hF : ∀ x y, Xa a x → F x y → Xa a y) (hser : ∀ x, Xa a x → ∃ y, F x y)
    (hprog : ∀ x y, Xa a x → F x y → Ge x y)
    (hfun : ∀ x y y', Xa a x → F x y → F x y' → y = y') (p q r : Prop)
    (hp : Tower AllProps (Xa a) Ge F p) (hq : Tower AllProps (Xa a) Ge F q) (hf : F p r) :
    p ≤ q ∨ q ≤ r :=
  bw_comparable AllProps _ _ _ (ge_trans _) hF hser hprog (gen_inv a F hF hfun) (admits_all _)
    (admits_all _) (fun _ _ _ _ => admits_all _) p q r hp hq hf

/-- Above a false member: if the step fixes false propositions, a false member `q` is below
every member. -/
theorem gen_above (hF : ∀ x y, Xa a x → F x y → Xa a y) (hser : ∀ x, Xa a x → ∃ y, F x y)
    (hprog : ∀ x y, Xa a x → F x y → Ge x y)
    (hfun : ∀ x y y', Xa a x → F x y → F x y' → y = y')
    (hfalse : ∀ p r, ¬ p → F p r → r = p) (q : Prop) (hq : Tower AllProps (Xa a) Ge F q)
    (hq' : ¬ q) : ∀ x, Tower AllProps (Xa a) Ge F x → Tower AllProps (Xa a) Ge F x ∧ q ≤ x := by
  have hC := gen_closed a F hF
  have hT := gen_total a F hF hser hprog hfun
  refine tower_sub AllProps _ _ _ (λ x ↦ Tower AllProps (Xa a) Ge F x ∧ q ≤ x) (admits_all _)
    ⟨fun x hx => hC.1 x hx.1, fun x y hx hf => ?_, fun Z t _ hZ _ ht => ?_⟩
  · refine ⟨hC.2.1 x y hx.1 hf, ?_⟩
    rcases em (x = q) with e | e
    · subst e
      rw [hfalse x y hq' hf]
      exact le_refl_prop x
    · exact (gen_comp a F hF hser hprog hfun x q y hx.1 hq hf).elim
        (fun k => (e (le_antisymm_prop x q k hx.2)).elim) id
  · exact ⟨hC.2.2 Z t trivial (fun z hz => (hZ z hz).1)
      (fun x y hx hy => hT x y (hZ x hx).1 (hZ y hy).1) ht,
      ht.2 q ⟨hC.1 q hq, fun z hz => (hZ z hz).2⟩⟩

/-- Fact 3 for an abstract step: if a true member steps to a true proper part, and the only
false member is `m`, then `m` is the glb of the other members. -/
theorem gen_glb_rest (hF : ∀ x y, Xa a x → F x y → Xa a y) (hser : ∀ x, Xa a x → ∃ y, F x y)
    (hprog : ∀ x y, Xa a x → F x y → Ge x y)
    (hfun : ∀ x y y', Xa a x → F x y → F x y' → y = y') (bc : BooleanCompleteness Prop)
    (hstep : ∀ t, Xa a t → t → ∃ r, F t r ∧ r ∧ r ≤ t ∧ ¬ (r = t)) (m : Prop) (hmf : ¬ m)
    (hfm : ∀ t, Tower AllProps (Xa a) Ge F t → ¬ t → t = m) (ha : a)
    (haT : Tower AllProps (Xa a) Ge F a) (w : Prop)
    (hw : ∀ x, Tower AllProps (Xa a) Ge F x → ¬ (x = m) → w ≤ x) : w ≤ m := by
  have hC := gen_closed a F hF
  have hT := gen_total a F hF hser hprog hfun
  obtain ⟨t, ht⟩ := glb_sup bc a (λ x ↦ Tower AllProps (Xa a) Ge F x ∧ ¬ (x = m))
    (fun x hx => hC.1 x hx.1)
  have htm : Tower AllProps (Xa a) Ge F t := hC.2.2 _ t trivial (fun _ k => k.1)
    (fun x y hx hy => hT x y hx.1 hy.1) ht
  have e : t = m := by
    rcases em (t = m) with e | e
    · exact e
    · rcases em t with h₁ | h₁
      · obtain ⟨r, hf, hr, hrt, hne⟩ := hstep t ht.1.1 h₁
        have hrm : Tower AllProps (Xa a) Ge F r := hC.2.1 t r htm hf
        have htr : t ≤ r := ht.1.2 r ⟨hrm, fun e' => hmf (e' ▸ hr)⟩
        exact (hne (le_antisymm_prop r t hrt htr)).elim
      · exact hfm t htm h₁
  have hwa : w ≤ a := hw _ haT (fun e' => hmf (e' ▸ ha))
  rw [← e]
  exact ht.2 w ⟨hwa, fun x hx => hw x hx.1 hx.2⟩

end Gen

/-! ### The step -/

section Step
variable (v : Prop) (hs : Vs v) (h : Prop) (hh : h ≤ Vs v) (K : Prop → Prop → Prop)
include hs hh

theorem fs_true (p r : Prop) (hp : p) (hf : Fs h K p r) : Child h K p r ∧ r :=
  hf.elim (fun k => (k.1 hp).elim) (fun k => k.2)

theorem fs_false (p r : Prop) (hp : ¬ p) (hf : Fs h K p r) : r = p :=
  hf.elim (fun k => k.2) (fun k => (hp k.1).elim)

theorem fs_X : ∀ x y, Xa (Aa h K) x → Fs h K x y → Xa (Aa h K) y :=
  fun x y hx hf => hf.elim (fun k => k.2 ▸ hx)
    (fun k => le_tr _ _ _ (child_le v hs h hh K x y k.2.1) hx)

theorem fs_ser : ∀ x, Xa (Aa h K) x → ∃ y, Fs h K x y := fun x hx =>
  (em x).elim (fun hx' => (true_child h K x hx hx').elim fun r hr => ⟨r, Or.inr ⟨hx', hr⟩⟩)
    (fun hx' => ⟨x, Or.inl ⟨hx', rfl⟩⟩)

theorem fs_prog : ∀ x y, Xa (Aa h K) x → Fs h K x y → Ge x y :=
  fun x y _ hf => hf.elim (fun k => k.2 ▸ le_refl_prop x)
    (fun k => child_le v hs h hh K x y k.2.1)

theorem fs_fun : ∀ x y y', Xa (Aa h K) x → Fs h K x y → Fs h K x y' → y = y' :=
  fun x y y' _ hf hf' => (em x).elim
    (fun hx => true_child_unique v hs h hh K x y y' (fs_true v hs h hh K x y hx hf).1
      (fs_true v hs h hh K x y hx hf).2 (fs_true v hs h hh K x y' hx hf').1 (fs_true v hs h hh K x y' hx hf').2)
    (fun hx => (fs_false v hs h hh K x y hx hf).trans (fs_false v hs h hh K x y' hx hf').symm)

theorem fs_inv : ∀ x x' y y', Xa (Aa h K) x → Xa (Aa h K) x' → Ge x x' → Ge x' x →
    Fs h K x y → Fs h K x' y' → Ge y y' ∧ Ge y' y :=
  invariant_of_partial _ _ _ (ge_refl _) (ge_anti _) (fs_X v hs h hh K) (fs_fun v hs h hh K)

/-! ### The tower `M` -/

theorem tm_closed : Closed AllProps (Xa (Aa h K)) Ge (Fs h K) (Tm h K) :=
  gen_closed _ _ (fs_X v hs h hh K)

theorem tm_X (x : Prop) (hx : Tm h K x) : x ≤ Aa h K := (tm_closed v hs h hh K).1 x hx

theorem tm_total : TotalOn Ge (Tm h K) :=
  gen_total _ _ (fs_X v hs h hh K) (fs_ser v hs h hh K) (fs_prog v hs h hh K) (fs_fun v hs h hh K)

/-- Clause (b): `p ≤ q ∨ q ≤ r` for members `p`, `q` and `F(p, r)`. -/
theorem tm_comp (p q r : Prop) (hp : Tm h K p) (hq : Tm h K q) (hf : Fs h K p r) :
    p ≤ q ∨ q ≤ r :=
  gen_comp _ _ (fs_X v hs h hh K) (fs_ser v hs h hh K) (fs_prog v hs h hh K) (fs_fun v hs h hh K)
    p q r hp hq hf

/-- Fact 4: `q ≤ F(p)` for members `q < p`. -/
theorem tm_below (p q r : Prop) (hp : Tm h K p) (hq : Tm h K q) (hqp : q ≤ p) (hne : ¬ (q = p))
    (hf : Fs h K p r) : q ≤ r :=
  (tm_comp v hs h hh K p q r hp hq hf).elim (fun k => (hne (le_antisymm_prop q p hqp k)).elim) id

theorem tm_a : Tm h K (Aa h K) :=
  (tm_closed v hs h hh K).2.2 (λ _ ↦ False) _ trivial (fun _ k => k.elim)
    (fun _ _ k => k.elim) ⟨⟨le_refl_prop _, fun _ k => k.elim⟩, fun _ hu => hu.1⟩

theorem tm_step (p r : Prop) (hp : Tm h K p) (hf : Fs h K p r) : Tm h K r :=
  (tm_closed v hs h hh K).2.1 p r hp hf

/-- A true member steps to a true proper part. -/
theorem fs_step (t : Prop) (ht : Xa (Aa h K) t) (h₁ : t) :
    ∃ r, Fs h K t r ∧ r ∧ r ≤ t ∧ ¬ (r = t) := by
  obtain ⟨r, hc, hr⟩ := true_child h K t ht h₁
  have hp := child_proper v hs h hh K t r hc
  exact ⟨r, Or.inr ⟨h₁, hc, hr⟩, hr, hp.1, hp.2⟩

theorem tm_sup (bc : BooleanCompleteness Prop) : ∃ m, SupIn (Xa (Aa h K)) Ge m (Tm h K) :=
  glb_sup bc _ _ (tm_X v hs h hh K)

theorem tm_sup_mem (m : Prop) (hm : SupIn (Xa (Aa h K)) Ge m (Tm h K)) : Tm h K m :=
  (tm_closed v hs h hh K).2.2 _ m trivial (fun _ k => k) (tm_total v hs h hh K) hm

/-- Fact 1: the glb `m` of `M` is false. -/
theorem m_false (m : Prop) (hm : SupIn (Xa (Aa h K)) Ge m (Tm h K)) : ¬ m := fun hm' => by
  obtain ⟨r, hc, hr⟩ := true_child h K m hm.1.1 hm'
  have hf : Fs h K m r := Or.inr ⟨hm', hc, hr⟩
  have hrm : m ≤ r := hm.1.2 r (tm_step v hs h hh K m r (tm_sup_mem v hs h hh K m hm) hf)
  have hp := child_proper v hs h hh K m r hc
  exact hp.2 (le_antisymm_prop r m hp.1 hrm)

/-- Fact 2: a false member of `M` is `m`. -/
theorem false_member (m : Prop) (hm : SupIn (Xa (Aa h K)) Ge m (Tm h K)) (q : Prop)
    (hq : Tm h K q) (hq' : ¬ q) : q = m := by
  have hY := gen_above _ _ (fs_X v hs h hh K) (fs_ser v hs h hh K) (fs_prog v hs h hh K)
    (fs_fun v hs h hh K) (fs_false v hs h hh K) q hq hq'
  exact le_antisymm_prop q m (hY m (tm_sup_mem v hs h hh K m hm)).2 (hm.1.2 q hq)

/-- Fact 3: `m` is the glb of the members of `M` other than `m`. -/
theorem m_glb_rest (bc : BooleanCompleteness Prop) (ha : Aa h K) (m : Prop)
    (hm : SupIn (Xa (Aa h K)) Ge m (Tm h K)) (w : Prop)
    (hw : ∀ x, Tm h K x → ¬ (x = m) → w ≤ x) : w ≤ m :=
  gen_glb_rest _ _ (fs_X v hs h hh K) (fs_ser v hs h hh K) (fs_prog v hs h hh K)
    (fs_fun v hs h hh K) bc (fs_step v hs h hh K) m (m_false v hs h hh K m hm)
    (fun t ht h₁ => false_member v hs h hh K m hm t ht h₁) ha (tm_a v hs h hh K) w hw

end Step

end Classicism.Proofs.BWActuality
