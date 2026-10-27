import Classicism.Paper
import Classicism.Principles

/-!
# Background: *The Bounds of Possibility*, Appendix D, in C

Dorr, Hawthorne and Yli-Vakkuri, *The Bounds of Possibility* (OUP 2021), Appendix D,
*Narrower Modalities in Higher-Order S4*, pp. 400–409, read into C: the appendix's primitive
`□` is C's `λp. p = ⊤`, under which every theorem of `H_S4` is a theorem of C. The
propositions are numbered as in the appendix; only those the map's records use are here, and
F and I are stated at type `t` only. Operators are `X : Prop → Prop`.

The appendix's `□_≠` is the map's `BoxNe`, `∃q. q ∧ □(◇q → p)` (Proposition D17 makes the two
definitions equivalent; the map takes the right-hand side), its hat is the map's `Hat`, and its
`□₅ := λp. ∀X. □NKJF⟨⟩X → Xp` is `Box5A` here, the map's `Box5` being defined with S5 operators
(`□NKB`) instead. They are equivalent: `Box5A` is an S5 operator (the B part of Theorem D16,
`s5Op_box5A`), so `Box5 ≤ Box5A`.

Where the appendix uses `H_S5R`, only for `□Actuality`, the propositions here assume the witness
`W@ a` at the world of evaluation only (`D19`), as the map's records need.
-/

namespace Classicism.AppD
open Classicism.P Classicism.Paper

/-! ### Properties of operators (p. 400) -/

/-- `N X := ∀p. □p → Xp`. -/
def OpN (X : Prop → Prop) : Prop := ∀ p : Prop, □ p → X p
/-- `K X := ∀p q. X(p → q) → Xp → Xq`. -/
def OpK (X : Prop → Prop) : Prop := ∀ p q : Prop, X (p → q) → X p → X q
/-- `J X := ∀p. p → X◇p`. -/
def OpJ (X : Prop → Prop) : Prop := ∀ p : Prop, p → X (◇ p)
/-- `F⟨⟩ X := ∀Y. (∀z. X(Yz)) → X∀z. Yz`, BF for `X` at type `t`. -/
def OpF0 (X : Prop → Prop) : Prop := ∀ Y : Prop → Prop, (∀ z, X (Y z)) → X (∀ z, Y z)
/-- `NK`. -/
def OpNK (X : Prop → Prop) : Prop := OpN X ∧ OpK X
/-- `NKJ`. -/
def OpNKJ (X : Prop → Prop) : Prop := OpN X ∧ OpK X ∧ OpJ X
/-- `NKJF⟨⟩`. -/
def OpNKJF (X : Prop → Prop) : Prop := OpN X ∧ OpK X ∧ OpJ X ∧ OpF0 X

/-- The appendix's `□₅ := λp. ∀X. □NKJF⟨⟩X → Xp`. -/
def Box5A (p : Prop) : Prop := ∀ X : Prop → Prop, □ (OpNKJF X) → X p

/-- `W@ a := a ∧ ∀q. q → □(a → q)` (p. 407). -/
def WAt (a : Prop) : Prop := a ∧ ∀ q : Prop, q → □ (a → q)

/-! ### Small lemmas -/

/-- N and K carry a necessary implication: `□(p → q) → Xp → Xq`. -/
theorem op_mono (X : Prop → Prop) (h : OpNK X) (p q : Prop) (hpq : □ (p → q)) : X p → X q :=
  h.2 p q (h.1 _ hpq)

/-- And its contrapositive form for duals: `□(p → q) → ¬X¬p → ¬X¬q`. -/
theorem op_dual_mono (X : Prop → Prop) (h : OpNK X) (p q : Prop) (hpq : □ (p → q)) :
    ¬ X (¬ p) → ¬ X (¬ q) := fun hn hq =>
  hn (op_mono X h (¬ q) (¬ p) (modal_K _ _ (nec% (fun (g : p → q) (hq : ¬ q) (hp : p) => hq (g hp)))
    hpq) hq)

/-- `NKJ X → ¬X¬□r → r` (the dual `(d′)` in the proof of D19): if `¬r`, J gives `X◇¬r`,
which is `X¬□r`. -/
theorem nkj_dual (X : Prop → Prop) (h : OpNKJ X) (r : Prop) : ¬ X (¬ □ r) → r := fun hn =>
  (em r).elim id fun hr => (hn (by have := h.2.2 (¬ r) hr; rwa [dia_not_eq] at this)).elim

/-! ### Proposition D1, at type `t` -/

/-- **Proposition D1** at `t`: `NKJX → y ≠ z → X(y ≠ z)`. J gives `X◇(y ≠ z)`, and necessarily
`◇(y ≠ z) → y ≠ z`. -/
theorem prop_D1 (X : Prop → Prop) (h : OpNKJ X) (y z : Prop) : y ≠ z → X (y ≠ z) := fun hne =>
  op_mono X ⟨h.1, h.2.1⟩ _ _ (nec% (ne_of_dia_ne y z)) (h.2.2 _ hne)

/-- Its dual: `NKJX → ¬X¬(y = z) → y = z`. -/
theorem prop_D1_dual (X : Prop → Prop) (h : OpNKJ X) (y z : Prop) : ¬ X (¬ (y = z)) → y = z :=
  fun hn => (em (y = z)).elim id fun hne => (hn (prop_D1 X h y z hne)).elim

/-- F⟨⟩ in dual form: `¬X¬∃z. Yz → ∃z. ¬X¬Yz`, given N and K. -/
theorem f0_dual (X : Prop → Prop) (hNK : OpNK X) (hF : OpF0 X) (Y : Prop → Prop) :
    ¬ X (¬ ∃ z, Y z) → ∃ z, ¬ X (¬ Y z) := fun hn =>
  (em (∃ z, ¬ X (¬ Y z))).elim id fun hall => (hn (op_mono X hNK _ _
    (nec% (fun (H : ∀ z, ¬ Y z) (he : ∃ z, Y z) => he.elim fun z hz => H z hz))
    (hF (fun z => ¬ Y z) fun z => (em (X (¬ Y z))).elim id fun hx =>
      (hall ⟨z, hx⟩).elim))).elim

/-! ### Proposition D11 -/

/-- **Proposition D11**, first part: `p → X̂¬X¬p`. -/
theorem prop_D11a (X : Prop → Prop) (p : Prop) : p → Hat X (¬ X (¬ p)) := fun hp =>
  ⟨p, hp, nec% (fun (h : ¬ X (¬ p)) => h)⟩

/-- **Proposition D11**, second part, `¬X̂¬Xp → p`: in C it needs no hypothesis on `X`, since
`¬¬p = p`. -/
theorem prop_D11b (X : Prop → Prop) (p : Prop) : ¬ Hat X (¬ X p) → p := fun hn =>
  (em p).elim id fun hp => (hn ⟨¬ p, hp, by
    rw [not_not_eq]; exact nec% (fun (h : ¬ X p) => h)⟩).elim

/-! ### Proposition D12 -/

/-- One step of D12: from `X¬q` or `X◇(¬X¬q ∧ p)`, `X(q → ◇(¬X¬q ∧ p))`. -/
theorem d12_step (X : Prop → Prop) (h : OpNKJ X) (p q : Prop) (hp : p) :
    X (q → ◇ (¬ X (¬ q) ∧ p)) :=
  (em (X (¬ q))).elim
    (fun hx => op_mono X ⟨h.1, h.2.1⟩ _ _
      (nec% (fun (hq : ¬ q) (hq' : q) => ((hq hq').elim : ◇ (¬ X (¬ q) ∧ p)))) hx)
    (fun hx => op_mono X ⟨h.1, h.2.1⟩ _ _
      (nec% (fun (hd : ◇ (¬ X (¬ q) ∧ p)) (_ : q) => hd)) (h.2.2 _ ⟨hx, hp⟩))

/-- `∀q. q → ◇(¬X¬q ∧ p)` refutes `X̂¬p`. -/
theorem not_hat_neg_of (X : Prop → Prop) (p : Prop) :
    (∀ q, q → ◇ (¬ X (¬ q) ∧ p)) → ¬ Hat X (¬ p) := fun H ⟨q, hq, hb⟩ =>
  not_dia_of_box_not _ (modal_K _ _
    (nec% (fun (g : ¬ X (¬ q) → ¬ p) (c : ¬ X (¬ q) ∧ p) => g c.1 c.2)) hb) (H q hq)

/-- **Proposition D12**, first part: `NKJF⟨⟩X → p → X¬X̂¬p`. -/
theorem prop_D12a (X : Prop → Prop) (h : OpNKJF X) (p : Prop) : p → X (¬ Hat X (¬ p)) :=
  fun hp => op_mono X ⟨h.1, h.2.1⟩ _ _ (nec% (not_hat_neg_of X p))
    (h.2.2.2 (fun q => q → ◇ (¬ X (¬ q) ∧ p)) fun q => d12_step X ⟨h.1, h.2.1, h.2.2.1⟩ p q hp)

/-- **Proposition D12**, second part: `NKJF⟨⟩X → ¬X¬X̂p → p`. -/
theorem prop_D12b (X : Prop → Prop) (h : OpNKJF X) (p : Prop) : ¬ X (¬ Hat X p) → p :=
  fun hn => (em p).elim id fun hp => (hn (by
    have := prop_D12a X h (¬ p) hp; rwa [not_not_eq] at this)).elim

/-! ### Proposition D14 -/

/-- `NK X` gives `¬X¬(q ∧ q') → ¬X¬q ∧ ¬X¬q'`. -/
theorem nk_dual_and (X : Prop → Prop) (h : OpNK X) (q q' : Prop) :
    ¬ X (¬ (q ∧ q')) → ¬ X (¬ q) ∧ ¬ X (¬ q') := fun hn =>
  ⟨op_dual_mono X h _ _ (nec% (fun (c : q ∧ q') => c.1)) hn,
   op_dual_mono X h _ _ (nec% (fun (c : q ∧ q') => c.2)) hn⟩

/-- `NK X` gives `¬X¬p → ◇p`. -/
theorem nk_dual_dia (X : Prop → Prop) (h : OpNK X) (p : Prop) : ¬ X (¬ p) → ◇ p :=
  fun hn hp => hn (h.1 _ ((box_not_eq p).mpr hp))

/-- **Proposition D14**, unboxed: `□NKX → NKJX̂`. -/
theorem prop_D14_core (X : Prop → Prop) (h : □ (OpNK X)) : OpNKJ (Hat X) :=
  ⟨fun p hp => ⟨True, trivial, modal_K _ _ (nec% (fun (hp : p) (_ : ¬ X (¬ True)) => hp)) hp⟩,
   fun p r ⟨q, hq, hb⟩ ⟨q', hq', hb'⟩ => ⟨q ∧ q', ⟨hq, hq'⟩, modal_K _ _ (modal_K _ _ (modal_K _ _
     (nec% (fun (hX : OpNK X) (g : ¬ X (¬ q) → (p → r)) (g' : ¬ X (¬ q') → p)
         (hn : ¬ X (¬ (q ∧ q'))) =>
       g (nk_dual_and X hX q q' hn).1 (g' (nk_dual_and X hX q q' hn).2))) h) hb) hb'⟩,
   fun p hp => ⟨p, hp, modal_K _ _ (nec% (fun (hX : OpNK X) => nk_dual_dia X hX p)) h⟩⟩

/-- **Proposition D14**: `□NKX → □NKJX̂`. -/
theorem prop_D14 (X : Prop → Prop) (h : □ (OpNK X)) : □ (OpNKJ (Hat X)) :=
  modal_K _ _ (nec% (prop_D14_core X)) (modal_four _ h)

/-! ### Proposition D15, at type `t` -/

/-- **Proposition D15** at `t`, unboxed: `□NKJF⟨⟩X → F⟨⟩X̂`. The witness is `q := ∀z. X̂(Yz)`:
necessarily, `¬X¬q` gives `¬X¬X̂(Yz)` for each `z` (N, K), hence `Yz` (D12, second part). -/
theorem prop_D15_core (X : Prop → Prop) (h : □ (OpNKJF X)) : OpF0 (Hat X) := fun Y hY =>
  ⟨∀ z, Hat X (Y z), hY, modal_K _ _
    (nec% (fun (hX : OpNKJF X) (hn : ¬ X (¬ ∀ z, Hat X (Y z))) (z : Prop) =>
      prop_D12b X hX (Y z) (op_dual_mono X ⟨hX.1, hX.2.1⟩ _ _
        (nec% (fun (H : ∀ z, Hat X (Y z)) => H z)) hn))) h⟩

/-- `□NKJF⟨⟩X → NKJF⟨⟩X̂`: D14 and D15. -/
theorem nkjf_hat (X : Prop → Prop) (h : □ (OpNKJF X)) : OpNKJF (Hat X) :=
  have h14 := prop_D14_core X (modal_K _ _ (nec% (fun (hX : OpNKJF X) =>
    (⟨hX.1, hX.2.1⟩ : OpNK X))) h)
  ⟨h14.1, h14.2.1, h14.2.2, prop_D15_core X h⟩

/-- `□NKJF⟨⟩X → □NKJF⟨⟩X̂`. -/
theorem box_nkjf_hat (X : Prop → Prop) (h : □ (OpNKJF X)) : □ (OpNKJF (Hat X)) :=
  modal_K _ _ (nec% (nkjf_hat X)) (modal_four _ h)

/-! ### `□₅` (Theorem D16, the parts the map needs) -/

/-- N for `□₅`. -/
theorem box5A_n : OpN Box5A := fun p hp _ hX => (box_elim hX).1 p hp

/-- K for `□₅`. -/
theorem box5A_k : OpK Box5A := fun p q h₁ h₂ X hX => (box_elim hX).2.1 p q (h₁ X hX) (h₂ X hX)

/-- **Theorem D16**, B for `□₅`: `p → □₅¬□₅¬p`. For `X` with `□NKJF⟨⟩X`, D12 gives `X¬X̂¬p`;
and `X̂` is `□NKJF⟨⟩` (D14, D15), so necessarily `□₅¬p → X̂¬p`. -/
theorem box5A_b (p : Prop) : p → Box5A (¬ Box5A (¬ p)) := fun hp X hX =>
  op_mono X ⟨(box_elim hX).1, (box_elim hX).2.1⟩ _ _
    (modal_K _ _ (nec% (fun (H : □ (OpNKJF (Hat X))) (hn : ¬ Hat X (¬ p))
        (hb : Box5A (¬ p)) => hn (hb (Hat X) H))) (modal_four _ (box_nkjf_hat X hX)))
    (prop_D12a X (box_elim hX) p hp)

/-- `□₅` is an S5 operator in the map's sense: necessarily N, K and B. -/
theorem s5Op_box5A : S5Op Box5A :=
  ⟨nec% box5A_n, nec% box5A_k, nec% box5A_b⟩

/-- The map's `□₅` implies the appendix's. -/
theorem box5_le_box5A (p : Prop) : Box5 p → Box5A p := fun h => h Box5A s5Op_box5A

/-! ### Relativization (as in Proposition D8) -/

/-- For any `X`, `λr. NKJF⟨⟩X → Xr` is NKJF⟨⟩, outright, and so necessarily. -/
theorem nkjf_relativized (X : Prop → Prop) : OpNKJF (fun r => OpNKJF X → X r) :=
  ⟨fun p hp hX => hX.1 p hp,
   fun p q h₁ h₂ hX => hX.2.1 p q (h₁ hX) (h₂ hX),
   fun p hp hX => hX.2.2.1 p hp,
   fun Y hY hX => hX.2.2.2 Y fun z => hY z hX⟩

/-- So whatever is `□₅` is `X` wherever `X` is NKJF⟨⟩. -/
theorem box5A_le_of_nkjf (X : Prop → Prop) (hX : OpNKJF X) (p : Prop) : Box5A p → X p :=
  fun h => h (fun r => OpNKJF X → X r) (nec% (nkjf_relativized X)) hX

/-! ### Propositions D18 and D19, with `W@ a` at the world of evaluation -/

/-- **Proposition D18**, left to right, at a world where `W@ a`: `X̂p → □(¬X¬a → p)`. -/
theorem prop_D18_lr (X : Prop → Prop) (h : □ (OpNK X)) (a : Prop) (ha : WAt a) (p : Prop) :
    Hat X p → □ (¬ X (¬ a) → p) := fun ⟨q, hq, hb⟩ =>
  modal_K _ _ (modal_K _ _ (modal_K _ _
    (nec% (fun (hX : OpNK X) (haq : □ (a → q)) (g : ¬ X (¬ q) → p) (hn : ¬ X (¬ a)) =>
      g (op_dual_mono X hX a q haq hn))) h) (modal_four _ (ha.2 q hq))) hb

/-- The core of D19, at any world: from NKJ, `□(a → ∀z. □(¬X¬a → Yz))` and `¬X¬a`, `∀z. Yz`
(steps 2–6). -/
theorem d19_core (X : Prop → Prop) (hX : OpNKJ X) (a : Prop) (Y : Prop → Prop)
    (h₁ : □ (a → ∀ z, □ (¬ X (¬ a) → Y z))) (hn : ¬ X (¬ a)) (z : Prop) : Y z :=
  nkj_dual X hX (¬ X (¬ a) → Y z)
    (op_dual_mono X ⟨hX.1, hX.2.1⟩ _ _
      (nec% (fun (H : ∀ z, □ (¬ X (¬ a) → Y z)) => H z))
      (op_dual_mono X ⟨hX.1, hX.2.1⟩ _ _ h₁ hn)) hn

/-- **Proposition D19**, with `W@ a` at the world of evaluation only: `□NKJX → F⟨⟩X̂`. -/
theorem prop_D19 (X : Prop → Prop) (h : □ (OpNKJ X)) (a : Prop) (ha : WAt a) :
    OpF0 (Hat X) := fun Y hY =>
  have hNK : □ (OpNK X) := modal_K _ _ (nec% (fun (hX : OpNKJ X) =>
    (⟨hX.1, hX.2.1⟩ : OpNK X))) h
  have he : ∀ z, □ (¬ X (¬ a) → Y z) := fun z => prop_D18_lr X hNK a ha (Y z) (hY z)
  ⟨a, ha.1, modal_K _ _ (modal_K _ _
    (nec% (fun (hX : OpNKJ X) (h₁ : □ (a → ∀ z, □ (¬ X (¬ a) → Y z))) (hn : ¬ X (¬ a)) =>
      (d19_core X hX a Y h₁ hn : ∀ z, Y z))) h)
    (modal_four _ (ha.2 _ he))⟩

end Classicism.AppD
