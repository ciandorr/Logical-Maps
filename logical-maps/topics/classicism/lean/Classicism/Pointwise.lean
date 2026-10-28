import Classicism.Paper
import Classicism.Background.Order

/-!
# Pointwise reasoning at a relational type

The paper reasons at a relational type `τ = σ₁ → ⋯ → σₙ → t` by writing tuples: `Y ≤ X`
is `□∀ȳ. Y[ȳ] → X[ȳ]`, and a step such as "`(w ∧ ȳ = x̄) → Xȳ` follows from `w → Xx̄` by
Leibniz's law" is propositional reasoning about the values at a tuple. The shallow layer
has no tuples: `Rel τ` supplies the pointwise operations `∧_τ`, `¬_τ`, `const_τ` and the
pointwise implication `incl` (`∀ȳ. X[ȳ] → Y[ȳ]`, unboxed) as *data*, and only the three
laws Intensionality needs. At a concrete type such as `σ → t` the operations unfold and
Lean's own tactics do the propositional reasoning; at a type *variable* `τ` nothing can be
said about them.

This class says what can be said: the pointwise implication is a preorder under which
`∧_τ` is a meet, `X ∧_τ ¬_τ X` is below everything, the constant relation at a
proposition is above everything when the proposition holds and below everything when it
fails, coextension is implication both ways, and negation is classical (negation
introduction and double negation). These are the rules of natural deduction read pointwise, and every "by Leibniz's law" and "under the box" of a proof at a
relational type is a short chain of them. The list is a basis, not a catalogue; a law
that is a consequence of these goes below as a theorem, and a law that is not can be
added as a field.

As with `Order`, the class is the shallow layer's way of stating a fact that is proved by
recursion on the structure of the type: the `Prop` instance is the base case and the
arrow instance the step. Its strict mirror is `SPointwise` in `Classicism/Mirror.lean`,
and the translator derives each law for every object type by induction on the type.
-/

namespace Classicism
open Paper

/-- The pointwise laws at a relational type. -/
class Pointwise (τ : Type) [Rel τ] : Type where
  /-- `X ⊑ X`. -/
  incl_refl : ∀ X : τ, X ⊆ X
  /-- `X ⊑ Y → Y ⊑ Z → X ⊑ Z`. -/
  incl_trans : ∀ X Y Z : τ, X ⊆ Y → Y ⊆ Z → X ⊆ Z
  /-- `Z ⊑ X → Z ⊑ Y → Z ⊑ X ∧_τ Y`. -/
  incl_and : ∀ X Y Z : τ, Z ⊆ X → Z ⊆ Y → Z ⊆ (X ∧ Y)
  /-- `X ∧_τ Y ⊑ X`. -/
  incl_and_left : ∀ X Y : τ, (X ∧ Y) ⊆ X
  /-- `X ∧_τ Y ⊑ Y`. -/
  incl_and_right : ∀ X Y : τ, (X ∧ Y) ⊆ Y
  /-- `X ∧_τ ¬_τ X ⊑ Y`: a contradiction at a tuple yields anything there. -/
  incl_and_neg : ∀ X Y : τ, (X ∧ ¬ X) ⊆ Y
  /-- `p → X ⊑ const_τ p`. -/
  incl_constP : ∀ (X : τ) (p : Prop), p → X ⊆ constP p
  /-- `¬p → const_τ p ⊑ X`. -/
  incl_of_constP : ∀ (X : τ) (p : Prop), ¬ p → constP p ⊆ X
  /-- `X ⊑ Y → Y ⊑ X → X ≡ Y`. -/
  coext_of_incl : ∀ X Y : τ, X ⊆ Y → Y ⊆ X → X ≡ Y
  /-- `X ≡ Y → X ⊑ Y`. -/
  incl_of_coext : ∀ X Y : τ, X ≡ Y → X ⊆ Y
  /-- `X ≡ Y → Y ⊑ X`. -/
  incl_of_coext' : ∀ X Y : τ, X ≡ Y → Y ⊆ X
  -- The modal laws, added 28 September for the results at every arity
  -- (`Results/Arity.lean`): each is a fact about `□` at `t`, read pointwise.
  /-- `□(X ⊑ Y) → ⊤ ⊑ □(¬X ∨ Y)`: the converse Barcan formula, pointwise. -/
  top_boxAt_of_box : ∀ X Y : τ, □ (incl X Y) → incl (Rel.top τ) (boxAt (Rel.or (Rel.neg X) Y))
  /-- `□X ⊑ □□X`: 4, pointwise. -/
  boxAt_four : ∀ X : τ, incl (boxAt X) (boxAt (boxAt X))
  /-- If every `q` is `□(¬w ∨ q)` exactly when true, `X` is coextensive with `λx̄. □(¬w ∨ X[x̄])`. -/
  coext_boxAt_actual : ∀ (X : τ) (w : Prop), (∀ q : Prop, q ↔ □ (¬ w ∨ q)) →
    coext X (boxAt (Rel.or (Rel.neg (constP w)) X))
  /-- `□X ⊑ X`: T, pointwise. -/
  boxAt_T : ∀ X : τ, incl (boxAt X) X
  /-- If every truth is necessary, `X ⊑ □X`. -/
  incl_boxAt_of_all : ∀ X : τ, (∀ p : Prop, p → □ p) → incl X (boxAt X)
  /-- With `B`, where `Y` fails and `□(Y → □Y)`, `Y` fails necessarily: `¬Y ⊑ □¬Y`. -/
  neg_incl_boxAt_of_b : ∀ Y : τ, (∀ p : Prop, p → □ ◇ p) →
    incl (Rel.top τ) (boxAt (Rel.or (Rel.neg Y) (boxAt Y))) → incl (Rel.neg Y) (boxAt (Rel.neg Y))
  -- The classical laws of negation, added 4 October for the dual forms of the lattice
  -- principles (`Principles/Lattice.lean`): with them `¬_τ` is an involution and an atom
  -- lies below `X` or below `¬_τ X` (`Lattice.lean`).
  /-- `X ∧_τ Y ⊑ Z → X ∧_τ Y ⊑ ¬_τ Z → X ⊑ ¬_τ Y`: negation introduction, pointwise. -/
  incl_neg_intro : ∀ X Y Z : τ, (X ∧ Y) ⊆ Z → (X ∧ Y) ⊆ (¬ Z) → X ⊆ ¬ Y
  /-- `¬_τ ¬_τ X ⊑ X`: double negation, pointwise. -/
  incl_neg_neg : ∀ X : τ, (¬ ¬ X) ⊆ X

export Pointwise (incl_refl incl_trans incl_and incl_and_left incl_and_right
  incl_and_neg incl_constP incl_of_constP coext_of_incl incl_of_coext
  incl_of_coext' top_boxAt_of_box boxAt_four
  coext_boxAt_actual boxAt_T incl_boxAt_of_all neg_incl_boxAt_of_b
  incl_neg_intro incl_neg_neg)

/-! ### Type `t`

Each law is a propositional fact about `p → q`, `p ∧ q`, `¬p`, `p ↔ q`. They are stated
as theorems of their own so that the strict mirror can take its laws from their
transforms. -/

theorem incl_refl_prop (X : Prop) : X ⊆ X := fun h => h
theorem incl_trans_prop (X Y Z : Prop) : X ⊆ Y → Y ⊆ Z → X ⊆ Z :=
  fun h₁ h₂ h => h₂ (h₁ h)
theorem incl_and_prop (X Y Z : Prop) : Z ⊆ X → Z ⊆ Y → Z ⊆ Rel.and X Y :=
  fun h₁ h₂ h => ⟨h₁ h, h₂ h⟩
theorem incl_and_left_prop (X Y : Prop) : Rel.and X Y ⊆ X := fun h => h.1
theorem incl_and_right_prop (X Y : Prop) : Rel.and X Y ⊆ Y := fun h => h.2
theorem incl_and_neg_prop (X Y : Prop) : (Rel.and X (Rel.neg X)) ⊆ Y :=
  fun h => absurd h.1 h.2
theorem incl_constP_prop (X : Prop) (p : Prop) : p → X ⊆ constP p := fun hp _ => hp
theorem incl_of_constP_prop (X : Prop) (p : Prop) : ¬ p → constP p ⊆ X :=
  fun hn hp => absurd hp hn
theorem coext_of_incl_prop (X Y : Prop) : X ⊆ Y → Y ⊆ X → X ≡ Y :=
  fun h₁ h₂ => ⟨h₁, h₂⟩
theorem incl_of_coext_prop (X Y : Prop) : X ≡ Y → X ⊆ Y := fun h => h.1
theorem incl_of_coext'_prop (X Y : Prop) : X ≡ Y → Y ⊆ X := fun h => h.2

theorem not_or_of_imp (x y : Prop) : (x → y) → ¬ x ∨ y :=
  fun h => (em x).elim (fun hx => Or.inr (h hx)) (fun hn => Or.inl hn)

theorem top_boxAt_of_box_prop (X Y : Prop) :
    □ (X ⊆ Y) → Rel.top Prop ⊆ boxAt (Rel.or (Rel.neg X) Y) :=
  fun h _ => modal_K _ _ (nec% (not_or_of_imp X Y)) h
theorem boxAt_four_prop (X : Prop) : boxAt X ⊆ boxAt (boxAt X) := modal_four X
theorem coext_boxAt_actual_prop (X w : Prop) : (∀ q : Prop, q ↔ □ (¬ w ∨ q)) →
    X ≡ boxAt (Rel.or (Rel.neg (constP w)) X) := fun h => h X
theorem neg_of_dia_neg_persist (y : Prop) : ◇ (¬ y) → (¬ y ∨ □ y) → ¬ y :=
  fun hd h => Or.elim h (fun hn => hn) (fun hb => (hd (by rw [hb]; exact not_true_eq)).elim)
theorem boxAt_T_prop (X : Prop) : boxAt X ⊆ X := fun h => box_elim h
theorem incl_boxAt_of_all_prop (X : Prop) : (∀ p : Prop, p → □ p) → X ⊆ boxAt X :=
  fun h hx => h X hx
theorem neg_incl_boxAt_of_b_prop (Y : Prop) : (∀ p : Prop, p → □ ◇ p) →
    Rel.top Prop ⊆ boxAt (Rel.or (Rel.neg Y) (boxAt Y)) → Rel.neg Y ⊆ boxAt (Rel.neg Y) :=
  fun b h hny => modal_K _ _ (modal_K _ _ (nec% (neg_of_dia_neg_persist Y)) (b _ hny)) (h trivial)
theorem incl_neg_intro_prop (X Y Z : Prop) :
    Rel.and X Y ⊆ Z → Rel.and X Y ⊆ Rel.neg Z → X ⊆ Rel.neg Y :=
  fun h₁ h₂ hx hy => h₂ ⟨hx, hy⟩ (h₁ ⟨hx, hy⟩)
theorem incl_neg_neg_prop (X : Prop) : Rel.neg (Rel.neg X) ⊆ X :=
  fun h => (em X).elim (fun hx => hx) (fun hn => absurd hn h)

instance instPointwiseProp : Pointwise Prop where
  incl_refl := incl_refl_prop
  incl_trans := incl_trans_prop
  incl_and := incl_and_prop
  incl_and_left := incl_and_left_prop
  incl_and_right := incl_and_right_prop
  incl_and_neg := incl_and_neg_prop
  incl_constP := incl_constP_prop
  incl_of_constP := incl_of_constP_prop
  coext_of_incl := coext_of_incl_prop
  incl_of_coext := incl_of_coext_prop
  incl_of_coext' := incl_of_coext'_prop
  top_boxAt_of_box := top_boxAt_of_box_prop
  boxAt_four := boxAt_four_prop
  coext_boxAt_actual := coext_boxAt_actual_prop
  boxAt_T := boxAt_T_prop
  incl_boxAt_of_all := incl_boxAt_of_all_prop
  neg_incl_boxAt_of_b := neg_incl_boxAt_of_b_prop
  incl_neg_intro := incl_neg_intro_prop
  incl_neg_neg := incl_neg_neg_prop

/-! ### Relational function types

At `σ → τ` the operations are pointwise and `incl X Y` is `∀z. X z ⊑ Y z`, so each law is
the law at `τ` under a `∀`. -/

section arrow
variable {σ τ : Type} [Ty σ] [Rel τ] [Pointwise τ]

theorem incl_refl_arrow (X : σ → τ) : X ⊆ X := fun z => incl_refl (X z)
theorem incl_trans_arrow (X Y Z : σ → τ) : X ⊆ Y → Y ⊆ Z → X ⊆ Z :=
  fun h₁ h₂ z => incl_trans (X z) (Y z) (Z z) (h₁ z) (h₂ z)
theorem incl_and_arrow (X Y Z : σ → τ) :
    Z ⊆ X → Z ⊆ Y → Z ⊆ (X ∧ Y) :=
  fun h₁ h₂ z => incl_and (X z) (Y z) (Z z) (h₁ z) (h₂ z)
theorem incl_and_left_arrow (X Y : σ → τ) : (X ∧ Y) ⊆ X :=
  fun z => incl_and_left (X z) (Y z)
theorem incl_and_right_arrow (X Y : σ → τ) : (X ∧ Y) ⊆ Y :=
  fun z => incl_and_right (X z) (Y z)
theorem incl_and_neg_arrow (X Y : σ → τ) : (X ∧ ¬ X) ⊆ Y :=
  fun z => incl_and_neg (X z) (Y z)
theorem incl_constP_arrow (X : σ → τ) (p : Prop) : p → X ⊆ constP p :=
  fun hp z => incl_constP (X z) p hp
theorem incl_of_constP_arrow (X : σ → τ) (p : Prop) : ¬ p → constP p ⊆ X :=
  fun hn z => incl_of_constP (X z) p hn
theorem coext_of_incl_arrow (X Y : σ → τ) : X ⊆ Y → Y ⊆ X → X ≡ Y :=
  fun h₁ h₂ z => coext_of_incl (X z) (Y z) (h₁ z) (h₂ z)
theorem incl_of_coext_arrow (X Y : σ → τ) : X ≡ Y → X ⊆ Y :=
  fun h z => incl_of_coext (X z) (Y z) (h z)
theorem incl_of_coext'_arrow (X Y : σ → τ) : X ≡ Y → Y ⊆ X :=
  fun h z => incl_of_coext' (X z) (Y z) (h z)

theorem top_boxAt_of_box_arrow (X Y : σ → τ) :
    □ (X ⊆ Y) → Rel.top (σ → τ) ⊆ boxAt (Rel.or (Rel.neg X) Y) :=
  fun h z => top_boxAt_of_box (X z) (Y z) (converse_barcan (λ z ↦ X z ⊆ Y z) h z)
theorem boxAt_four_arrow (X : σ → τ) : boxAt X ⊆ boxAt (boxAt X) := fun z => boxAt_four (X z)
theorem coext_boxAt_actual_arrow (X : σ → τ) (w : Prop) : (∀ q : Prop, q ↔ □ (¬ w ∨ q)) →
    X ≡ boxAt (Rel.or (Rel.neg (constP w)) X) := fun h z => coext_boxAt_actual (X z) w h
theorem boxAt_T_arrow (X : σ → τ) : boxAt X ⊆ X := fun z => boxAt_T (X z)
theorem incl_boxAt_of_all_arrow (X : σ → τ) : (∀ p : Prop, p → □ p) → X ⊆ boxAt X :=
  fun h z => incl_boxAt_of_all (X z) h
theorem neg_incl_boxAt_of_b_arrow (Y : σ → τ) : (∀ p : Prop, p → □ ◇ p) →
    Rel.top (σ → τ) ⊆ boxAt (Rel.or (Rel.neg Y) (boxAt Y)) → Rel.neg Y ⊆ boxAt (Rel.neg Y) :=
  fun b h z => neg_incl_boxAt_of_b (Y z) b (h z)
theorem incl_neg_intro_arrow (X Y Z : σ → τ) :
    (X ∧ Y) ⊆ Z → (X ∧ Y) ⊆ (¬ Z) → X ⊆ ¬ Y :=
  fun h₁ h₂ z => incl_neg_intro (X z) (Y z) (Z z) (h₁ z) (h₂ z)
theorem incl_neg_neg_arrow (X : σ → τ) : (¬ ¬ X) ⊆ X := fun z => incl_neg_neg (X z)

instance instPointwiseArrow : Pointwise (σ → τ) where
  incl_refl := incl_refl_arrow
  incl_trans := incl_trans_arrow
  incl_and := incl_and_arrow
  incl_and_left := incl_and_left_arrow
  incl_and_right := incl_and_right_arrow
  incl_and_neg := incl_and_neg_arrow
  incl_constP := incl_constP_arrow
  incl_of_constP := incl_of_constP_arrow
  coext_of_incl := coext_of_incl_arrow
  incl_of_coext := incl_of_coext_arrow
  incl_of_coext' := incl_of_coext'_arrow
  top_boxAt_of_box := top_boxAt_of_box_arrow
  boxAt_four := boxAt_four_arrow
  coext_boxAt_actual := coext_boxAt_actual_arrow
  boxAt_T := boxAt_T_arrow
  incl_boxAt_of_all := incl_boxAt_of_all_arrow
  neg_incl_boxAt_of_b := neg_incl_boxAt_of_b_arrow
  incl_neg_intro := incl_neg_intro_arrow
  incl_neg_neg := incl_neg_neg_arrow

end arrow

/-! ### Consequences, at any relational type -/

section consequences
variable {τ : Type} [Rel τ] [Pointwise τ]

/-- `Z ⊑ X ∧_τ Y → Z ⊑ X`. -/
theorem incl_and_elim_left (X Y Z : τ) : Z ⊆ (X ∧ Y) → Z ⊆ X :=
  fun h => incl_trans Z (X ∧ Y) X h (incl_and_left X Y)

/-- `Z ⊑ X ∧_τ Y → Z ⊑ Y`. -/
theorem incl_and_elim_right (X Y Z : τ) : Z ⊆ (X ∧ Y) → Z ⊆ Y :=
  fun h => incl_trans Z (X ∧ Y) Y h (incl_and_right X Y)

/-- `X ⊑ ¬_τ X → X ⊑ Y`: what is below its own negation is below everything. -/
theorem incl_of_incl_neg (X Y : τ) : X ⊆ ¬ X → X ⊆ Y :=
  fun h => incl_trans X (X ∧ ¬ X) Y
    (incl_and X (¬ X) X (incl_refl X) h) (incl_and_neg X Y)

/-- `X ⊑ Y → Y ⊑ ¬_τ Y → X ⊑ ¬_τ X`. -/
theorem incl_neg_of_incl (X Y : τ) :
    X ⊆ Y → Y ⊆ ¬ Y → X ⊆ ¬ X :=
  fun h₁ h₂ => incl_trans X (Y ∧ ¬ Y) (¬ X)
    (incl_and Y (¬ Y) X h₁ (incl_trans X Y (¬ Y) h₁ h₂))
    (incl_and_neg Y (¬ X))

/-- `p → X ⊑ X ∧_τ const_τ p`. -/
theorem incl_and_constP_self (X : τ) (p : Prop) : p → X ⊆ (X ∧ constP p) :=
  fun hp => incl_and X (constP p) X (incl_refl X) (incl_constP X p hp)

/-- `¬p → X ∧_τ const_τ p ⊑ Y`. -/
theorem incl_of_and_constP (X Y : τ) (p : Prop) : ¬ p → (X ∧ constP p) ⊆ Y :=
  fun hn => incl_trans (X ∧ constP p) (constP p) Y
    (incl_and_right X (constP p)) (incl_of_constP Y p hn)

/-- `p → X ∧_τ const_τ p ⊑ ¬_τ (X ∧_τ const_τ p) → X ⊑ ¬_τ X`. -/
theorem incl_neg_of_and_constP (X : τ) (p : Prop) :
    p → (X ∧ constP p) ⊆ (¬ (X ∧ constP p)) → X ⊆ ¬ X :=
  fun hp h => incl_neg_of_incl X (X ∧ constP p) (incl_and_constP_self X p hp) h

/-- `X ⊑ ¬_τ ¬_τ X`, from negation introduction. -/
theorem incl_neg_neg' (X : τ) : X ⊆ ¬ ¬ X :=
  incl_neg_intro X (¬ X) X (incl_and_left X (¬ X)) (incl_and_right X (¬ X))

/-- `X ⊑ Y → ¬_τ Y ⊑ ¬_τ X`: contraposition, pointwise. -/
theorem incl_contra (X Y : τ) : X ⊆ Y → (¬ Y) ⊆ (¬ X) :=
  fun h => incl_neg_intro (¬ Y) X Y (incl_trans _ X Y (incl_and_right (¬ Y) X) h)
    (incl_and_left (¬ Y) X)

/-- `X ⊑ Y → X ⊑ ¬_τ Y → X ⊑ ¬_τ X`: what is below a relation and its negation is below
its own negation. -/
theorem incl_neg_of_incl_both (X Y : τ) : X ⊆ Y → X ⊆ ¬ Y → X ⊆ ¬ X :=
  fun h₁ h₂ => incl_trans X (Y ∧ ¬ Y) (¬ X) (incl_and Y (¬ Y) X h₁ h₂) (incl_and_neg Y (¬ X))

/-- `X ∧_τ Y ⊑ ¬_τ (X ∧_τ Y) → X ⊑ ¬_τ Y`: if the meet is bottom, `X` is below `¬_τ Y`. -/
theorem incl_neg_of_and_incl_neg (X Y : τ) : (X ∧ Y) ⊆ ¬ (X ∧ Y) → X ⊆ ¬ Y :=
  fun h => incl_neg_intro X Y (X ∧ Y) (incl_refl (X ∧ Y)) h

end consequences

end Classicism
