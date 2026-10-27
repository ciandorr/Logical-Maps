import Classicism.Paper
import Classicism.Background.Order
import Classicism.Pointwise
import Classicism.Background.Lattice

/-!
# Rigidity and the comprehension predicates

The Background of `topics/classicism` defines, for a relation `Y` with a finite argument
tuple including the empty one,

    Persistent(Y)   := Y ≤ λx̄. □Y[x̄]
    Inextensible(Y) := □∀X. (∀x̄. Y[x̄] → □X[x̄]) → Y ≤ X
    Rigid(Y)        := Persistent(Y) ∧ Inextensible(Y)

and the weak variants obtained by dropping a leading box. It also records that, because
`Y ≤ Z` *is* the necessitated universally closed pointwise implication, `Persistent(Y)`
unpacks as `□∀x̄. Y[x̄] → □Y[x̄]`.

The definitions below are written in that unpacked form, using `incl` and `boxAt`, and
`persistent_iff_le` and `inextensible_iff_le` then prove that they agree with the
algebraic definitions above. That way the predicates need only `Rel τ`, while the
equivalence with the map's own wording is a theorem rather than something assumed;
`Classicism/Order.lean` is what makes it available.
-/

namespace Classicism
open Paper

variable {τ : Type} [Rel τ]

/-- `∀x̄. Y[x̄] → □Y[x̄]`. -/
def WeaklyPersistent (Y : τ) : Prop := Y ⊆ boxAt Y

/-- `Y ≤ λx̄. □Y[x̄]`, that is `□∀x̄. Y[x̄] → □Y[x̄]`. -/
def Persistent (Y : τ) : Prop := □ (WeaklyPersistent Y)

/-- `∀X. (∀x̄. Y[x̄] → □X[x̄]) → Y ≤ X`. -/
def WeaklyInextensible (Y : τ) : Prop :=
  ∀ X : τ, Y ⊆ boxAt X → □ (Y ⊆ X)

/-- `□∀X. (∀x̄. Y[x̄] → □X[x̄]) → Y ≤ X`. -/
def Inextensible (Y : τ) : Prop := □ (WeaklyInextensible Y)

/-- Persistent and inextensible. -/
def Rigid (Y : τ) : Prop := Persistent Y ∧ Inextensible Y

/-- Weakly persistent and weakly inextensible: rigidity without its leading boxes. A weakly
rigid relation is persistent too (`persistent_of_weaklyRigid`). -/
def WeaklyRigid (Y : τ) : Prop := WeaklyPersistent Y ∧ WeaklyInextensible Y

/-! ### Stripping boxes, by `T` -/

theorem weaklyPersistent_of_persistent {Y : τ} : Persistent Y → WeaklyPersistent Y :=
  box_elim

theorem weaklyInextensible_of_inextensible {Y : τ} :
    Inextensible Y → WeaklyInextensible Y := box_elim

theorem weaklyRigid_of_rigid {Y : τ} (h : Rigid Y) : WeaklyRigid Y :=
  ⟨weaklyPersistent_of_persistent h.1, weaklyInextensible_of_inextensible h.2⟩

/-- The Background's remark that rigidity is *necessary* weak rigidity, confirmed: both
conjuncts of `Rigid` carry a leading box, and the box distributes over `∧`. -/
theorem rigid_iff_box_weaklyRigid (Y : τ) : Rigid Y ↔ □ (WeaklyRigid Y) :=
  ⟨fun h => by rw [show WeaklyRigid Y = (WeaklyPersistent Y ∧ WeaklyInextensible Y) from rfl,
                   box_and_eq]; exact h,
   fun h => by
     rw [show WeaklyRigid Y = (WeaklyPersistent Y ∧ WeaklyInextensible Y) from rfl,
         box_and_eq] at h
     exact h⟩

/-- **A weakly rigid relation is persistent.** Weak inextensibility, applied to `λx̄. □Y[x̄]`:
every instance of `Y` is necessarily one of it, by weak persistence and `4`, so
`Y ≤ λx̄. □Y[x̄]`, which is persistence. -/
theorem persistent_of_weaklyRigid [Pointwise τ] {Y : τ} (h : WeaklyRigid Y) : Persistent Y :=
  h.2 (boxAt Y) (Pointwise.incl_trans Y (boxAt Y) (boxAt (boxAt Y)) h.1 (Pointwise.boxAt_four Y))

/-! ### Agreement with the map's algebraic definitions

These need `Order τ`, which every relational type has. -/

section order
variable [Order τ]

/-- `Persistent(Y)` is the map's `Y ≤ λx̄. □Y[x̄]`. -/
theorem persistent_iff_le (Y : τ) : Persistent Y ↔ Y ≤ boxAt Y :=
  (le_iff Y (boxAt Y)).symm

/-- `WeaklyInextensible(Y)` is the map's `∀X. (∀x̄. Y[x̄] → □X[x̄]) → Y ≤ X`. -/
theorem weaklyInextensible_iff_le (Y : τ) :
    WeaklyInextensible Y ↔ ∀ X : τ, Y ⊆ boxAt X → Y ≤ X :=
  ⟨fun h X hX => le_of_box_incl (h X hX), fun h X hX => (le_iff Y X).1 (h X hX)⟩

/-- `Inextensible(Y)` is the necessitation of the same. -/
theorem inextensible_iff_le (Y : τ) :
    Inextensible Y ↔ □ (∀ X : τ, Y ⊆ boxAt X → Y ≤ X) := by
  rw [show (∀ X : τ, Y ⊆ boxAt X → Y ≤ X)
        = WeaklyInextensible Y from
      propext (weaklyInextensible_iff_le Y).symm]
  exact Iff.rfl

end order

/-! ### Pointwise use at `σ → t`

At a one-place relational type the predicates apply pointwise, definitionally. These
restatements are what the record proofs actually use. -/

section pointwise
variable {σ : Type} [Ty σ]

theorem weaklyPersistent_apply {Y : σ → Prop} (h : WeaklyPersistent Y) (z : σ) :
    Y z → □ (Y z) := h z

/-- Weak persistence of the pointwise negation `¬_τ Y`. -/
theorem weaklyPersistent_neg_apply {Y : σ → Prop}
    (h : WeaklyPersistent (¬ Y)) (z : σ) : ¬ Y z → □ (¬ Y z) := h z

end pointwise

/-! ### Further facts -/

/-- Rigidity, if true, is necessary: it is necessary weak rigidity, and `4`. -/
theorem rigid_necessary {τ : Type} [Rel τ] (X : τ) (h : Rigid X) : □ (Rigid X) :=
  modal_K _ _ (nec% (rigid_iff_box_weaklyRigid X).2)
    (modal_four _ ((rigid_iff_box_weaklyRigid X).1 h))

/-- Coextensive weakly rigid relations are identical: each is below the other by the other's
weak persistence and its own weak inextensibility, and `≤` is antisymmetric. -/
theorem eq_of_weaklyRigid_coext {τ : Type} [Rel τ] [Order τ] [Pointwise τ] {F G : τ}
    (hF : WeaklyRigid F) (hG : WeaklyRigid G) (h : F ≡ G) : F = G :=
  le_antisymm_rel F G
    (le_of_box_incl (hF.2 G (Pointwise.incl_trans F G (boxAt G) (Pointwise.incl_of_coext F G h)
      hG.1)))
    (le_of_box_incl (hG.2 F (Pointwise.incl_trans G F (boxAt F) (Pointwise.incl_of_coext' F G h)
      hF.1)))

end Classicism
