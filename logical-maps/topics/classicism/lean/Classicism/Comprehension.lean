import Classicism.Order

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

The definitions below are written in that unpacked form, using `boxImp` and `boxAt`, and
`persistent_iff_le` and `inextensible_iff_le` then prove that they agree with the
algebraic definitions above. That way the predicates need only `Rel τ`, while the
equivalence with the map's own wording is a theorem rather than something assumed;
`Classicism/Order.lean` is what makes it available.
-/

namespace Classicism

variable {τ : Type} [Rel τ]

/-- `∀x̄. Y[x̄] → □Y[x̄]`. -/
def WeaklyPersistent (Y : τ) : Prop := boxImp Y (boxAt Y)

/-- `Y ≤ λx̄. □Y[x̄]`, that is `□∀x̄. Y[x̄] → □Y[x̄]`. -/
def Persistent (Y : τ) : Prop := □ (WeaklyPersistent Y)

/-- `∀X. (∀x̄. Y[x̄] → □X[x̄]) → Y ≤ X`. -/
def WeaklyInextensible (Y : τ) : Prop :=
  ∀ X : τ, boxImp Y (boxAt X) → □ (boxImp Y X)

/-- `□∀X. (∀x̄. Y[x̄] → □X[x̄]) → Y ≤ X`. -/
def Inextensible (Y : τ) : Prop := □ (WeaklyInextensible Y)

/-- Persistent and inextensible. -/
def Rigid (Y : τ) : Prop := Persistent Y ∧ Inextensible Y

/-- Persistent and weakly inextensible. This is the map's "weakly rigid"; the draft's
unqualified "weakly rigid" is `VeryWeaklyRigid` here. -/
def WeaklyRigid (Y : τ) : Prop := Persistent Y ∧ WeaklyInextensible Y

/-- Weakly persistent and weakly inextensible. -/
def VeryWeaklyRigid (Y : τ) : Prop := WeaklyPersistent Y ∧ WeaklyInextensible Y

/-! ### Stripping boxes, by `T` -/

theorem weaklyPersistent_of_persistent {Y : τ} : Persistent Y → WeaklyPersistent Y :=
  box_elim

theorem weaklyInextensible_of_inextensible {Y : τ} :
    Inextensible Y → WeaklyInextensible Y := box_elim

theorem weaklyRigid_of_rigid {Y : τ} (h : Rigid Y) : WeaklyRigid Y :=
  ⟨h.1, weaklyInextensible_of_inextensible h.2⟩

theorem veryWeaklyRigid_of_weaklyRigid {Y : τ} (h : WeaklyRigid Y) : VeryWeaklyRigid Y :=
  ⟨weaklyPersistent_of_persistent h.1, h.2⟩

/-- The Background's remark that rigidity is *necessary* very weak rigidity, confirmed:
both conjuncts of `Rigid` carry a leading box, and the box distributes over `∧`. -/
theorem rigid_iff_box_veryWeaklyRigid (Y : τ) : Rigid Y ↔ □ (VeryWeaklyRigid Y) :=
  ⟨fun h => by rw [show VeryWeaklyRigid Y = (WeaklyPersistent Y ∧ WeaklyInextensible Y) from rfl,
                   box_and_eq]; exact h,
   fun h => by
     rw [show VeryWeaklyRigid Y = (WeaklyPersistent Y ∧ WeaklyInextensible Y) from rfl,
         box_and_eq] at h
     exact h⟩

/-! ### Agreement with the map's algebraic definitions

These need `Order τ`, which every relational type has. -/

section order
variable [Order τ]

/-- `Persistent(Y)` is the map's `Y ≤ λx̄. □Y[x̄]`. -/
theorem persistent_iff_le (Y : τ) : Persistent Y ↔ Rel.le Y (boxAt Y) :=
  (le_iff Y (boxAt Y)).symm

/-- `WeaklyInextensible(Y)` is the map's `∀X. (∀x̄. Y[x̄] → □X[x̄]) → Y ≤ X`. -/
theorem weaklyInextensible_iff_le (Y : τ) :
    WeaklyInextensible Y ↔ ∀ X : τ, boxImp Y (boxAt X) → Rel.le Y X :=
  ⟨fun h X hX => le_of_box_boxImp (h X hX), fun h X hX => (le_iff Y X).1 (h X hX)⟩

/-- `Inextensible(Y)` is the necessitation of the same. -/
theorem inextensible_iff_le (Y : τ) :
    Inextensible Y ↔ □ (∀ X : τ, boxImp Y (boxAt X) → Rel.le Y X) := by
  rw [show (∀ X : τ, boxImp Y (boxAt X) → Rel.le Y X)
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
    (h : WeaklyPersistent (Rel.neg Y)) (z : σ) : ¬ Y z → □ (¬ Y z) := h z

end pointwise

end Classicism
