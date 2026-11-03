import Classicism.Background.AppendixD
import Classicism.Background.Varieties

/-!
# Background: the theory of 5-necessity

The facts about `□₅` that the Background page *Varieties of necessity* states and the map's
records use, as theorems of C:

* every S5 operator in the map's sense (`S5Op`: necessarily N, K and B) is NKJF⟨⟩, and obeys
  the Barcan formula at every type, by Prior's derivation from B (`s5Op_barcan`);
* hence the map's `Box5` and Appendix D's `Box5A` are the same operator
  (`box5A_le_box5`, `box5_eq_box5A`): the converse of `AppD.box5_le_box5A`;
* **Theorem D9** of *The Bounds of Possibility*, Appendix D: `□₅` materially implies every
  operator that is NKJF⟨⟩ (`AppD.theorem_D9`);
* `□₅` is N, K, T, B and 4, so an S5 operator (`s5Op_box5`);
* **the Barcan formula for `□₅`** at every type, and its dual (`box5_barcan`,
  `dia5_exists`), the Background's `box5-barcan`;
* identities and their negations, and their truth-functional compounds, are 5-necessary when
  true (`box5_of_eq`, `box5_of_ne`, `box5_iff_of_decided`).

The dual `◇₅p` is written out, as `¬□₅¬p`.
-/

namespace Classicism
open Classicism.P Classicism.Paper Classicism.AppD

/-! ### S5 operators -/

/-- The dual of B: `B X → ¬X¬Xq → q`. -/
theorem b_dual (X : Prop → Prop) (hB : ∀ p : Prop, p → X (¬ X (¬ p))) (q : Prop) :
    ¬ X (¬ X q) → q := fun hn =>
  (em q).elim id fun hq => (hn (by have h := hB (¬ q) hq; rwa [not_not_eq] at h)).elim

/-- N gives `¬X¬p → ◇p`. -/
theorem n_dual_dia (X : Prop → Prop) (hN : ∀ p : Prop, □ p → X p) (p : Prop) :
    ¬ X (¬ p) → ◇ p := fun hn hp => hn (hN _ ((box_not_eq p).mpr hp))

/-- The closed core of Prior's derivation: for an operator that is N, K and B,
`¬X¬(∀z. X(Yz)) → ∀z. Yz`. -/
theorem nkb_barcan_core {σ : Type} [Ty σ] (X : Prop → Prop) (Y : σ → Prop) :
    (∀ p : Prop, □ p → X p) → (∀ p q : Prop, X (p → q) → X p → X q) →
      (∀ p : Prop, p → X (¬ X (¬ p))) → ¬ X (¬ ∀ z, X (Y z)) → ∀ z, Y z :=
  fun hN hK hB hn z => b_dual X hB (Y z) (op_dual_mono X ⟨hN, hK⟩ _ _
    (nec% (fun (H : ∀ z, X (Y z)) => H z)) hn)

/-- **BF for an S5 operator**, at every type: Prior's derivation from B. With
`U := ∀z. X(Yz)`, B gives `X¬X¬U`, and necessarily `¬X¬U → ∀z. Yz` (`nkb_barcan_core`), so N
and K give `X∀z. Yz`. -/
theorem s5Op_barcan {σ : Type} [Ty σ] (X : Prop → Prop) (h : S5Op X) (Y : σ → Prop) :
    (∀ z, X (Y z)) → X (∀ z, Y z) := fun hY =>
  have hb : □ (¬ X (¬ ∀ z, X (Y z)) → ∀ z, Y z) := modal_K _ _ (modal_K _ _ (modal_K _ _
    (nec% (nkb_barcan_core X Y)) h.1) h.2.1) h.2.2
  box_elim h.2.1 _ _ (box_elim h.1 _ hb) (box_elim h.2.2 _ hY)

/-- An S5 operator is NKJF⟨⟩: J from B and necessary N. -/
theorem nkjf_of_s5Op (X : Prop → Prop) (h : S5Op X) : OpNKJF X :=
  ⟨box_elim h.1, box_elim h.2.1,
   fun p hp => box_elim h.2.1 _ _ (box_elim h.1 _ (modal_K _ _
     (nec% (fun (hN : ∀ q : Prop, □ q → X q) => n_dual_dia X hN p)) h.1)) (box_elim h.2.2 p hp),
   fun Y => s5Op_barcan X h Y⟩

/-- Being an S5 operator is necessary when true, by `4`. -/
theorem box_s5Op (X : Prop → Prop) (h : S5Op X) : □ (S5Op X) :=
  modal_K _ _ (modal_K _ _ (modal_K _ _
    (nec% (fun (a : □ (∀ p : Prop, □ p → X p)) (b : □ (∀ p q : Prop, X (p → q) → X p → X q))
        (c : □ (∀ p : Prop, p → X (¬ X (¬ p)))) => (⟨a, b, c⟩ : S5Op X)))
    (modal_four _ h.1)) (modal_four _ h.2.1)) (modal_four _ h.2.2)

/-- An S5 operator is necessarily NKJF⟨⟩. -/
theorem box_nkjf_of_s5Op (X : Prop → Prop) (h : S5Op X) : □ (OpNKJF X) :=
  modal_K _ _ (nec% (nkjf_of_s5Op X)) (box_s5Op X h)

/-! ### The two definitions of `□₅` -/

/-- Appendix D's `□₅` implies the map's: every S5 operator is necessarily NKJF⟨⟩. -/
theorem box5A_le_box5 (p : Prop) : Box5A p → Box5 p := fun h X hX => h X (box_nkjf_of_s5Op X hX)

/-- **The map's `□₅` is Appendix D's** (the Background's "necessarily equivalent"):
`box5_le_box5A` and `box5A_le_box5`. -/
theorem box5_eq_box5A : Box5 = Box5A :=
  funext fun p => propext ⟨box5_le_box5A p, box5A_le_box5 p⟩

/-- **Theorem D9** of *The Bounds of Possibility*, Appendix D: `□₅` materially implies every
operator that is NKJF⟨⟩, by relativization (`box5A_le_of_nkjf`). -/
theorem AppD.theorem_D9 (X : Prop → Prop) (hX : OpNKJF X) (p : Prop) : Box5 p → X p :=
  fun h => box5A_le_of_nkjf X hX p (box5_le_box5A p h)

/-! ### `□₅` is N, K, B and 4 -/

/-- N for `□₅`. -/
theorem box5_n (p : Prop) : □ p → Box5 p := fun hp _ hX => box_elim hX.1 p hp

/-- K for `□₅`. -/
theorem box5_k (p q : Prop) : Box5 (p → q) → Box5 p → Box5 q := fun h₁ h₂ X hX =>
  box_elim hX.2.1 p q (h₁ X hX) (h₂ X hX)

/-- `□₅` is monotone under necessary implication. -/
theorem box5_mono (p q : Prop) (h : □ (p → q)) : Box5 p → Box5 q := box5_k p q (box5_n _ h)

/-- B for `□₅`, from B for Appendix D's (Theorem D16). -/
theorem box5_b (p : Prop) : p → Box5 (¬ Box5 (¬ p)) := fun hp =>
  box5A_le_box5 _ (op_mono Box5A ⟨box5A_n, box5A_k⟩ _ _
    (nec% (fun (h : ¬ Box5A (¬ p)) (h' : Box5 (¬ p)) => h (box5_le_box5A _ h')))
    (box5A_b p hp))

/-- `□₅` is an S5 operator. -/
theorem s5Op_box5 : S5Op Box5 := ⟨nec% box5_n, nec% box5_k, nec% box5_b⟩

/-- The dual of B for `□₅`: `◇₅□₅q → q`. -/
theorem box5_b_dual (q : Prop) : ¬ Box5 (¬ Box5 q) → q := b_dual Box5 box5_b q

/-- `◇r → □₅^A◇r`: each `X` that is NKJF⟨⟩ is J at `◇r`, and `◇◇r → ◇r`. -/
theorem dia_box5A (r : Prop) : ◇ r → Box5A (◇ r) := fun hr X hX =>
  op_mono X ⟨(box_elim hX).1, (box_elim hX).2.1⟩ _ _ (nec% (dia_dia r)) ((box_elim hX).2.2.1 _ hr)

/-- F⟨⟩ for Appendix D's `□₅`. -/
theorem box5A_f : OpF0 Box5A := fun Y hY X hX => (box_elim hX).2.2.2 Y fun z => hY z X hX

/-- For `X` NKJF⟨⟩, so is `λr. X□₅^A r`. -/
theorem nkjf_comp_box5A (X : Prop → Prop) (hX : OpNKJF X) : OpNKJF (fun r => X (Box5A r)) :=
  ⟨fun p hp => hX.1 _ (modal_K _ _ (nec% (box5A_n p)) (modal_four _ hp)),
   fun p q h₁ h₂ => hX.2.1 _ _ (op_mono X ⟨hX.1, hX.2.1⟩ _ _ (nec% (box5A_k p q)) h₁) h₂,
   fun p hp => op_mono X ⟨hX.1, hX.2.1⟩ _ _ (nec% (dia_box5A p)) (hX.2.2.1 p hp),
   fun Y hY => op_mono X ⟨hX.1, hX.2.1⟩ _ _ (nec% (box5A_f Y))
     (hX.2.2.2 (fun z => Box5A (Y z)) hY)⟩

/-- 4 for Appendix D's `□₅`: relativize to `λr. X□₅^A r`. -/
theorem box5A_four (p : Prop) : Box5A p → Box5A (Box5A p) := fun h X hX =>
  h (fun r => X (Box5A r)) (modal_K _ _ (nec% (nkjf_comp_box5A X)) hX)

/-- 4 for `□₅`. -/
theorem box5_four (p : Prop) : Box5 p → Box5 (Box5 p) := fun h =>
  box5A_le_box5 _ (op_mono Box5A ⟨box5A_n, box5A_k⟩ _ _ (nec% (box5A_le_box5 p))
    (box5A_four p (box5_le_box5A p h)))

/-- `◇p` is 5-necessary when true: B, and `◇₅ ≤ ◇`. -/
theorem box5_dia (q : Prop) : q → Box5 (◇ q) := fun hq =>
  box5_mono _ _ (nec% (n_dual_dia Box5 box5_n q)) (box5_b q hq)

/-! ### The Barcan formula for `□₅` (the Background's `box5-barcan`) -/

/-- **The Barcan formula for `□₅`**, at every type. -/
theorem box5_barcan {σ : Type} [Ty σ] (R : σ → Prop) : (∀ x, Box5 (R x)) → Box5 (∀ x, R x) :=
  fun h X hX => s5Op_barcan X hX R fun x => h x X hX

/-- `(∀x. ¬Rx) → ¬∃x. Rx`. -/
theorem not_exists_of_forall_not5 {σ : Type} [Ty σ] (R : σ → Prop) :
    (∀ x, ¬ R x) → ¬ ∃ x, R x := fun h he => he.elim fun x hx => h x hx

/-- Its dual: `◇₅∃x. Rx → ∃x. ◇₅Rx`. -/
theorem dia5_exists {σ : Type} [Ty σ] (R : σ → Prop) :
    ¬ Box5 (¬ ∃ x, R x) → ∃ x, ¬ Box5 (¬ R x) := fun hn =>
  (em (∃ x, ¬ Box5 (¬ R x))).elim id fun hall => (hn (box5_mono _ _
    (nec% (not_exists_of_forall_not5 R))
    (box5_barcan (fun x => ¬ R x) fun x => (em (Box5 (¬ R x))).elim id fun h =>
      (hall ⟨x, h⟩).elim))).elim

/-! ### Decided propositions -/

/-- A true identity is 5-necessary (NI and N). -/
theorem box5_of_eq {σ : Type} [Ty σ] (x y : σ) : x = y → Box5 (x = y) := fun h =>
  box5_n _ (necessity_of_identity x y h)

/-- `◇₅(x ≠ y) → x ≠ y`. -/
theorem ne_of_dia5_ne {σ : Type} [Ty σ] (x y : σ) : ¬ Box5 (¬ (x ≠ y)) → x ≠ y := fun g e =>
  g (box5_mono _ _ (nec% (fun (h : x = y) (hn : x ≠ y) => hn h)) (box5_of_eq x y e))

/-- A true distinctness is 5-necessary: B for `□₅`. -/
theorem box5_of_ne {σ : Type} [Ty σ] (x y : σ) : x ≠ y → Box5 (x ≠ y) := fun h =>
  box5_mono _ _ (nec% (ne_of_dia5_ne x y)) (box5_b (x ≠ y) h)

/-- Decided conjunctions: if `φ` and `ψ` are each 5-necessary when true and their negations
likewise, so is `φ ∧ ψ`, and its negation. -/
theorem box5_and_of_decided (φ ψ : Prop) (h₁ : φ → Box5 φ) (h₂ : ¬ φ → Box5 (¬ φ))
    (h₃ : ψ → Box5 ψ) (h₄ : ¬ ψ → Box5 (¬ ψ)) :
    ((φ ∧ ψ) → Box5 (φ ∧ ψ)) ∧ (¬ (φ ∧ ψ) → Box5 (¬ (φ ∧ ψ))) :=
  ⟨fun h => box5_k _ _ (box5_mono _ _ (nec% (fun (a : φ) (b : ψ) => (⟨a, b⟩ : φ ∧ ψ)))
      (h₁ h.1)) (h₃ h.2),
   fun h => (em φ).elim
     (fun a => box5_mono _ _ (nec% (fun (nb : ¬ ψ) (c : φ ∧ ψ) => nb c.2)) (h₄ fun b => h ⟨a, b⟩))
     (fun na => box5_mono _ _ (nec% (fun (na : ¬ φ) (c : φ ∧ ψ) => na c.1)) (h₂ na))⟩

/-- Decided biconditionals: if `φ` and `ψ` are decided, `φ ↔ ψ` is 5-necessary when true. -/
theorem box5_iff_of_decided (φ ψ : Prop) (h₁ : φ → Box5 φ) (h₂ : ¬ φ → Box5 (¬ φ))
    (h₃ : ψ → Box5 ψ) (h₄ : ¬ ψ → Box5 (¬ ψ)) : (φ ↔ ψ) → Box5 (φ ↔ ψ) := fun h =>
  (em φ).elim
    (fun a => box5_k _ _ (box5_mono _ _
      (nec% (fun (a : φ) (b : ψ) => (⟨fun _ => b, fun _ => a⟩ : φ ↔ ψ))) (h₁ a)) (h₃ (h.1 a)))
    (fun na => box5_k _ _ (box5_mono _ _
      (nec% (fun (na : ¬ φ) (nb : ¬ ψ) =>
        (⟨fun a => (na a).elim, fun b => (nb b).elim⟩ : φ ↔ ψ))) (h₂ na))
      (h₄ fun b => na (h.2 b)))

end Classicism
