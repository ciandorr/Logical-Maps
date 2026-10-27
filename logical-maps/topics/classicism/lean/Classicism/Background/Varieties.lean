import Classicism.Paper
import Classicism.Principles

/-!
# Background: varieties of necessity

The chain of theorems of C on the Background page *Varieties of necessity*:

    □ ≤ □_≠ ≤ □̂̂ ≤ □₅ ≤ λp. p

proved link by link. The link `□̂̂ ≤ □₅` is Proposition D21 of *The Bounds of Possibility*,
Appendix D, right to left; here it is proved directly.
-/

namespace Classicism
open Classicism.P Classicism.Paper

/-- `□p → □_≠p`: take `q := ⊤`. -/
theorem box_le_boxNe (p : Prop) : □ p → BoxNe p := fun h =>
  ⟨True, trivial, modal_K _ _ (nec% (fun (hp : p) (_ : ◇ True) => hp)) h⟩

/-- `¬□_≠¬q → ◇q`: if `q = ⊥`, then `¬q` is `⊤`, so `□_≠¬q` with witness `⊤`. -/
theorem dia_of_not_boxNe_neg (q : Prop) : ¬ BoxNe (¬ q) → ◇ q := fun h hq =>
  h ⟨True, trivial, by rw [hq]; exact nec% (fun (_ : ◇ True) => (fun h => h : ¬ False))⟩

/-- `□_≠p → □̂̂p`: a witness `q` of `□_≠p` is one of `□̂̂p`, since `¬□_≠¬q → ◇q`
necessarily. (That is, `□_≠ = □̂` and hatting is monotone.) -/
theorem boxNe_le_boxHH (p : Prop) : BoxNe p → BoxHH p := fun ⟨q, hq, hb⟩ =>
  ⟨q, hq, modal_K _ _ (nec% (fun (h : ◇ q → p) (hn : ¬ BoxNe (¬ q)) =>
    h (dia_of_not_boxNe_neg q hn))) hb⟩

/-- `□₅p → p`: the identity operator is an S5 operator. -/
theorem box5_le (p : Prop) : Box5 p → p := fun h =>
  h (fun r => r)
    ⟨nec% (fun (r : Prop) (h : □ r) => box_elim h),
     nec% (fun (r s : Prop) (h : r → s) (hr : r) => h hr),
     nec% (fun (r : Prop) (hr : r) (hn : ¬ r) => hn hr)⟩

/-- `□_≠ ≤ X` for an operator `X` that is N, K and B, and necessarily N: from a witness `s`
of `□_≠r`, B gives `X(¬X¬s)`, necessary N gives `□(¬X¬s → ◇s)`, so `□(¬X¬s → r)`, and N
and K give `Xr`. -/
theorem boxNe_le_of_nkb (X : Prop → Prop) :
    (∀ p, □ p → X p) → (∀ p q : Prop, X (p → q) → X p → X q) →
      (∀ p, p → X (¬ X (¬ p))) → □ (∀ p, □ p → X p) → ∀ r, BoxNe r → X r :=
  fun hN hK hB bN r ⟨s, hs, hb⟩ =>
    hK _ _ (hN _ (modal_K _ _ (modal_K _ _
      (nec% (fun (N : ∀ p, □ p → X p) (h : ◇ s → r) (hx : ¬ X (¬ s)) =>
        h (fun hs₀ => hx (N (¬ s) ((box_not_eq s).mpr hs₀))))) bN) hb)) (hB s hs)

/-- `□̂̂p → □₅p`, Proposition D21 of *The Bounds of Possibility*, Appendix D, right to left.
Given an S5 operator `X` and a witness `q` of `□̂̂p`: necessarily `□_≠ ≤ X`
(`boxNe_le_of_nkb`, using `4` for necessary N), so `□(¬X¬q → p)`, and B, N and K give `Xp`. -/
theorem boxHH_le_box5 (p : Prop) : BoxHH p → Box5 p := fun ⟨q, hq, hb⟩ X ⟨bN, bK, bB⟩ =>
  have dom : □ (∀ r, BoxNe r → X r) := modal_K _ _ (modal_K _ _ (modal_K _ _ (modal_K _ _
    (nec% (boxNe_le_of_nkb X)) bN) bK) bB) (modal_four _ bN)
  box_elim bK _ _ (box_elim bN _ (modal_K _ _ (modal_K _ _
      (nec% (fun (D : ∀ r, BoxNe r → X r) (h : ¬ BoxNe (¬ q) → p) (hx : ¬ X (¬ q)) =>
        h (fun hb' => hx (D _ hb')))) dom) hb))
    (box_elim bB q hq)

end Classicism
