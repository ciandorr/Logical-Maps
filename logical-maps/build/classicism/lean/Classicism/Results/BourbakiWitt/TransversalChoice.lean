import Classicism.Results.BourbakiWitt.Settled

/-!
# Vicinity and Relational Choice imply Transversal Choice

The record `vicinity-and-relational-choice-imply-transversal-choice`, following its write-up
(the theorem: GPT-6 Astra, prompted by Daniel Kodsi, 26 October 2026; the direct proof: Claude
Opus 5.5, prompted by Cian Dorr, 26–28 October 2026, with Christopher Sun's collection
argument, `Settled.collection`). At `σ`: Vicinity and Relational Choice at `(σ → t, σ)` give
Transversal Choice at `σ`.

Given an equivalence relation `R`, *candidates* are the `B ≤ λx. s` that are necessarily partial
transversals of `Q := λx y. ∀z. Rxz ↔ Ryz`. Relational Choice gives `K`, choosing for each `B`
a point outside the cells `B` meets if there is one, and `fB` adds it to `B`. The Bourbaki–Witt
lemma for admissible chains (`BW.bourbaki_witt_fixed_point`, through
`Settled.bw_settled_fixed_point`), with the settled properties admissible, the candidates ordered by `≤` and the graph of `f` as the step, gives a candidate
`m` with `fm = m`, which is a transversal.
-/

namespace Classicism.Proofs.BWChoice
open Classicism.P Classicism.Paper Classicism.BW Classicism.Proofs.Settled

set_option linter.unusedSectionVars false

variable {σ : Type} [Ty σ]

/-- `(Qx)y := ∀z. (Rx)z ↔ (Ry)z`, an equivalence relation by pure logic. -/
def Q (R : σ → σ → Prop) : σ → σ → Prop := λ x y ↦ ∀ z, R x z ↔ R y z

/-- `B̄ := λx. ∃y. (Qx)y ∧ By`, the union of the cells `B` meets. -/
def Bbar (R : σ → σ → Prop) (B : σ → Prop) : σ → Prop := λ x ↦ ∃ y, Q R x y ∧ B y

/-- `PT(B)`: `B` is a partial transversal of `Q`. -/
def PT (R : σ → σ → Prop) (B : σ → Prop) : Prop := ∀ x y, B x → B y → Q R x y → x = y

/-- `Full(B) := ∀x. B̄x`. -/
def Full (R : σ → σ → Prop) (B : σ → Prop) : Prop := ∀ x, Bbar R B x

/-- `B` is a candidate: `B ≤ λx. s` and `□PT(B)`. -/
def Cand (s : Prop) (R : σ → σ → Prop) (B : σ → Prop) : Prop :=
  B ≤ (λ _ ↦ s : σ → Prop) ∧ □ (PT R B)

/-- The serial relation `(UB)a := Full(B) ∨ ¬B̄a`. -/
def U (R : σ → σ → Prop) : (σ → Prop) → σ → Prop := λ B a ↦ Full R B ∨ ¬ Bbar R B a

/-- `D_B := λx. s ∧ (KB)x ∧ (∀y. (KB)y ∧ (Qx)y → y = x) ∧ ¬B̄x`. -/
def D (s : Prop) (R : σ → σ → Prop) (K : (σ → Prop) → σ → Prop) (B : σ → Prop) : σ → Prop :=
  λ x ↦ s ∧ K B x ∧ (∀ y, K B y ∧ Q R x y → y = x) ∧ ¬ Bbar R B x

/-- `fB := λx. Bx ∨ D_B x`, a term with `s` and `K` as parameters. -/
def f (s : Prop) (R : σ → σ → Prop) (K : (σ → Prop) → σ → Prop) (B : σ → Prop) : σ → Prop :=
  λ x ↦ B x ∨ D s R K B x

theorem q_refl (R : σ → σ → Prop) (x : σ) : Q R x x := fun _ => Iff.rfl

theorem q_symm (R : σ → σ → Prop) (x y : σ) (h : Q R x y) : Q R y x := fun z => (h z).symm

/-! ### Hypothesis 3: `f` is progressive -/

theorem pt_f (s : Prop) (R : σ → σ → Prop) (K : (σ → Prop) → σ → Prop) (B : σ → Prop) :
    PT R B → PT R (f s R K B) := by
  intro hB x y hx hy hxy
  rcases hx with hx | hx <;> rcases hy with hy | hy
  · exact hB x y hx hy hxy
  · exact (hy.2.2.2 ⟨x, q_symm R x y hxy, hx⟩).elim
  · exact (hx.2.2.2 ⟨y, hxy, hy⟩).elim
  · exact (hx.2.2.1 y ⟨hy.2.1, hxy⟩).symm

theorem f_below (s : Prop) (R : σ → σ → Prop) (K : (σ → Prop) → σ → Prop) (B : σ → Prop) :
    (∀ x, B x → s) → ∀ x, f s R K B x → s :=
  fun h x hx => hx.elim (h x) (fun hd => hd.1)

theorem le_f (s : Prop) (R : σ → σ → Prop) (K : (σ → Prop) → σ → Prop) (B : σ → Prop) :
    B ≤ f s R K B :=
  le_of_box_incl (nec% (fun (x : σ) (h : B x) => (Or.inl h : f s R K B x)))

theorem cand_f (s : Prop) (R : σ → σ → Prop) (K : (σ → Prop) → σ → Prop) (B : σ → Prop)
    (hB : Cand s R B) : Cand s R (f s R K B) :=
  ⟨le_of_box_incl (modal_K _ _ (nec% (f_below s R K B)) ((le_iff _ _).1 hB.1)),
   modal_K _ _ (nec% (pt_f s R K B)) hB.2⟩

/-! ### Hypothesis 2: settled chains of candidates have suprema -/

/-- `J := λx. s ∧ ∃B. ZB ∧ Bx`. -/
def J (s : Prop) (Z : (σ → Prop) → Prop) : σ → Prop := λ x ↦ s ∧ ∃ B, Z B ∧ B x

theorem member_sub_J (s : Prop) (Z : (σ → Prop) → Prop) (B : σ → Prop) :
    (∀ x, B x → s) → (s → Z B) → ∀ x, B x → J s Z x :=
  fun h hz x hx => ⟨h x hx, B, hz (h x hx), hx⟩

theorem member_le_J (v : Prop) (hs : Vs v) (R : σ → σ → Prop) (Z : (σ → Prop) → Prop)
    (hZs : SettledP (Vs v) Z) (B : σ → Prop) (hB : Z B) (hc : Cand (Vs v) R B) :
    B ≤ J (Vs v) Z :=
  le_of_box_incl (modal_K _ _ (modal_K _ _ (nec% (member_sub_J (Vs v) Z B)) ((le_iff _ _).1 hc.1))
    ((le_iff_prop _ _).1 (le_of_settled _ _ hs (hZs B) hB)))

/-- The pair condition for `PT(J)`, uncurried over the two members. -/
def Pair (R : σ → σ → Prop) (Z : (σ → Prop) → Prop) (B B' : σ → Prop) (x y : σ) : Prop :=
  Z B → Z B' → B x → B' y → Q R x y → x = y

theorem pair_of_le (R : σ → σ → Prop) (Z : (σ → Prop) → Prop) (B B' : σ → Prop) (x y : σ) :
    (∀ x, B x → B' x) → PT R B' → Pair R Z B B' x y :=
  fun h p _ _ hx hy hq => p x y (h x hx) hy hq

theorem pair_of_ge (R : σ → σ → Prop) (Z : (σ → Prop) → Prop) (B B' : σ → Prop) (x y : σ) :
    (∀ x, B' x → B x) → PT R B → Pair R Z B B' x y :=
  fun h p _ _ hx hy hq => p x y hx (h y hy) hq

theorem pair_le (v : Prop) (hs : Vs v) (R : σ → σ → Prop) (Z : (σ → Prop) → Prop)
    (hZs : SettledP (Vs v) Z) (hZ : ∀ B, Z B → Cand (Vs v) R B)
    (hT : TotalOn (fun B D : σ → Prop => B ≤ D) Z) (B B' : σ → Prop) (x y : σ) :
    Vs v ≤ Pair R Z B B' x y := by
  rcases em (Z B) with hB | hB
  · rcases em (Z B') with hB' | hB'
    · rcases hT B B' hB hB' with h | h
      · exact le_of_box _ _ (modal_K _ _ (modal_K _ _ (nec% (pair_of_le R Z B B' x y))
          ((le_iff _ _).1 h)) (hZ B' hB').2)
      · exact le_of_box _ _ (modal_K _ _ (modal_K _ _ (nec% (pair_of_ge R Z B B' x y))
          ((le_iff _ _).1 h)) (hZ B hB).2)
    · exact le_mono _ _ _ (le_neg_of_settled _ _ hs (hZs B') hB')
        (nec% (fun (n : ¬ Z B') (_ : Z B) (k : Z B') => ((n k).elim : B x → B' y → Q R x y → x = y)))
  · exact le_mono _ _ _ (le_neg_of_settled _ _ hs (hZs B) hB)
      (nec% (fun (n : ¬ Z B) (k : Z B) => ((n k).elim : Z B' → B x → B' y → Q R x y → x = y)))

theorem pt_J_of (s : Prop) (R : σ → σ → Prop) (Z : (σ → Prop) → Prop) :
    (s → ∀ B B' x y, Pair R Z B B' x y) → PT R (J s Z) :=
  fun h x y hx hy hq => hx.2.elim fun B hBx => hy.2.elim fun B' hBy =>
    h hx.1 B B' x y hBx.1 hBy.1 hBx.2 hBy.2 hq

theorem cand_J (v : Prop) (hs : Vs v) (R : σ → σ → Prop) (Z : (σ → Prop) → Prop)
    (hZs : SettledP (Vs v) Z) (hZ : ∀ B, Z B → Cand (Vs v) R B)
    (hT : TotalOn (fun B D : σ → Prop => B ≤ D) Z) : Cand (Vs v) R (J (Vs v) Z) := by
  have h : Vs v ≤ ∀ B B' x y, Pair R Z B B' x y :=
    collection v hs _ fun B => collection v hs _ fun B' => collection v hs _ fun x =>
      collection v hs _ fun y => pair_le v hs R Z hZs hZ hT B B' x y
  exact ⟨le_of_box_incl (nec% (fun (x : σ) (k : J (Vs v) Z x) => k.1)),
    modal_K _ _ (nec% (pt_J_of (Vs v) R Z)) ((le_iff_prop _ _).1 h)⟩

theorem J_sub_of (s : Prop) (Z : (σ → Prop) → Prop) (D' : σ → Prop) :
    (s → ∀ B, Z B → ∀ x, B x → D' x) → ∀ x, J s Z x → D' x :=
  fun h x hx => hx.2.elim fun B hB => h hx.1 B hB.1 x hB.2

theorem J_least (v : Prop) (hs : Vs v) (Z : (σ → Prop) → Prop) (hZs : SettledP (Vs v) Z)
    (D' : σ → Prop) (hD : ∀ B, Z B → B ≤ D') : J (Vs v) Z ≤ D' := by
  have h : Vs v ≤ ∀ B, Z B → ∀ x, B x → D' x := collection v hs _ fun B => by
    rcases em (Z B) with hB | hB
    · exact le_of_box _ _ (modal_K _ _ (nec% (imp_intro' (Z B) (∀ x, B x → D' x)))
        ((le_iff _ _).1 (hD B hB)))
    · exact le_mono _ _ _ (le_neg_of_settled _ _ hs (hZs B) hB)
        (nec% (fun (n : ¬ Z B) (k : Z B) => ((n k).elim : ∀ x, B x → D' x)))
  exact le_of_box_incl (modal_K _ _ (nec% (J_sub_of (Vs v) Z D')) ((le_iff_prop _ _).1 h))

theorem cand_sup (v : Prop) (hs : Vs v) (R : σ → σ → Prop) :
    ∀ Z : (σ → Prop) → Prop, SettledP (Vs v) Z → (∀ z, Z z → Cand (Vs v) R z) →
      TotalOn (fun B D : σ → Prop => B ≤ D) Z →
      ∃ u, SupIn (Cand (Vs v) R) (fun B D : σ → Prop => B ≤ D) u Z :=
  fun Z hZs hZ hT => ⟨J (Vs v) Z,
    ⟨cand_J v hs R Z hZs hZ hT, fun B hB => member_le_J v hs R Z hZs B hB (hZ B hB)⟩,
    fun D' hD' => J_least v hs Z hZs D' hD'.2⟩

/-! ### The data are settled -/

theorem cand_settled (v : Prop) (hs : Vs v) (R : σ → σ → Prop) :
    SettledP (Vs v) (Cand (Vs v) R) :=
  fun _ => settled_and _ _ _ hs (settled_le_rel v hs _ _) fun _ => settled_box v hs _

/-! ### The fixed point is a transversal -/

theorem full_of_fixed (s : Prop) (hs : s) (R : σ → σ → Prop) (K : (σ → Prop) → σ → Prop)
    (hK : Functional K) (hKU : ∀ B a, K B a → U R B a) (m : σ → Prop) (e : m = f s R K m) :
    Full R m := by
  rcases em (Full R m) with h | h
  · exact h
  · obtain ⟨a, hKa, hu⟩ := hK m
    have hn : ¬ Bbar R m a := (hKU m a hKa).elim (fun hf => (h hf).elim) id
    have hd : f s R K m a := Or.inr ⟨hs, hKa, fun y hy => (hu y hy.1).symm, hn⟩
    have hma : m a := by rw [e]; exact hd
    exact (hn ⟨a, q_refl R a, hma⟩).elim

theorem transversal_of_full (R : σ → σ → Prop) (hR : EquivRel R) (m : σ → Prop)
    (hf : Full R m) (hp : PT R m) : ∀ x, ∃ y, R x y ∧ m y ∧ ∀ z, (R x z ∧ m z) → y = z := by
  intro x
  obtain ⟨y, hxy, hy⟩ := hf x
  have Rxy : R x y := (hxy y).2 (hR.1 y)
  refine ⟨y, Rxy, hy, fun z hz => hp y z hy hz.2 fun w => ?_⟩
  exact ⟨fun h => hR.2.2 z x w (hR.2.1 x z hz.1) (hR.2.2 x y w Rxy h),
    fun h => hR.2.2 y x w (hR.2.1 x y Rxy) (hR.2.2 x z w hz.1 h)⟩

/-! ### The theorem -/

theorem serial_U (R : σ → σ → Prop) (x₀ : σ) : Serial (U R) := fun B =>
  (em (Full R B)).elim (fun h => ⟨x₀, Or.inl h⟩) fun h =>
    (em (∃ a, ¬ Bbar R B a)).elim (fun ⟨a, ha⟩ => ⟨a, Or.inr ha⟩)
      fun hn => (h fun a => (em (Bbar R B a)).elim id fun ha => (hn ⟨a, ha⟩).elim).elim

/-- The fixed point: a candidate `m` with `fm = m`, by the Bourbaki–Witt lemma for admissible
chains with the settled properties admissible (`Settled.bw_settled_fixed_point`). -/
theorem cand_fixed (v : Prop) (hs : Vs v) (R : σ → σ → Prop) (K : (σ → Prop) → σ → Prop) :
    ∃ m, Cand (Vs v) R m ∧ m = f (Vs v) R K m :=
  bw_settled_fixed_point v hs (Cand (Vs v) R)
    (fun B D : σ → Prop => B ≤ D) (fun B D => D = f (Vs v) R K B)
    (cand_settled v hs R) (fun B D => settled_le_rel v hs B D)
    (fun B D => settled_eq v hs D _)
    (fun B _ => le_refl_arrow_prop B)
    (fun B D E _ _ _ h₁ h₂ => le_trans_arrow B D E h₁ h₂)
    (fun B D _ _ h₁ h₂ => le_antisymm_arrow B D h₁ h₂)
    (fun Z hZs hZ hT => cand_sup v hs R Z hZs hZ hT)
    (fun B _ => ⟨f (Vs v) R K B, rfl⟩)
    (fun B D hB e => e ▸ cand_f (Vs v) R K B hB)
    (fun B D _ e => e ▸ le_f (Vs v) R K B)
    (fun _ _ _ _ e₁ e₂ => e₁.trans e₂.symm)

theorem transversal_choice_core (v : Prop) (hs : Vs v) (R : σ → σ → Prop) (hR : EquivRel R)
    (K : (σ → Prop) → σ → Prop) (hK : Functional K) (hKU : ∀ B a, K B a → U R B a) :
    ∃ F : σ → Prop, ∀ x, ∃ y, R x y ∧ F y ∧ ∀ z, (R x z ∧ F z) → y = z :=
  (cand_fixed v hs R K).elim fun m hm =>
    ⟨m, transversal_of_full R hR m (full_of_fixed (Vs v) hs R K hK hKU m hm.2) (box_elim hm.1.2)⟩

/-- **The record.** -/
theorem vicinity_and_relational_choice_imply_transversal_choice :
    Vicinity → RelationalChoice (σ → Prop) σ → TransversalChoice σ := by
  intro vic rc R hR
  obtain ⟨v, hv, hA⟩ := vic
  rcases em (∃ x : σ, x = x) with hx | hx
  · obtain ⟨x₀, _⟩ := hx
    obtain ⟨K, hK, hKU⟩ := rc (U R) (serial_U R x₀)
    exact transversal_choice_core v ⟨hv, hA⟩ R hR K hK hKU
  · exact ⟨λ _ ↦ True, fun x => (hx ⟨x, rfl⟩).elim⟩

end Classicism.Proofs.BWChoice
