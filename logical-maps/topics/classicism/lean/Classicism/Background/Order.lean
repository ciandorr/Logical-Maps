import Classicism.Paper
import Classicism.Background.Necessity

/-!
# The algebraic order and its pointwise characterisation

The map's Background defines entailment algebraically, `X ≤_τ Y` iff `Y = X ∨_τ Y`, and
then records that "at `t` this is equivalent to `□(X → Y)`; at a relation type it is
equivalent to the necessary universal closure of the pointwise implication". That
equivalence is what this file proves, as

    Order.le_iff :  X ≼ Y  ↔  □ (incl X Y)

and it is the fact the comprehension predicates rest on. It is worth seeing why it is not
a triviality. Left to right at a relational type, the identity `Y = λz. Xz ∨ Yz` gives
the *pointwise* identities by Leibniz's Law, but they have to be boxed, which needs `NI`
and `K`. Right to left, the boxed pointwise implication has to be turned back into an
identity, which needs Modalized Functionality, and to feed that we must get from
`□∀z̄. X[z̄] → Y[z̄]` to `□∀z. □(…)`: that is axiom `4` followed by the Converse Barcan
Formula inside the outer box. Both are theorems of C, so nothing optional is used, but
Functionality is never applied to a hypothesis.

Because the proof recurses on the structure of the type, and `Rel` is a class rather than
an inductive code, the law has to be a class too, with one instance per shape of
relational type. It cannot be a field of `Rel` itself: the arrow instance needs
Modalized Functionality at `σ → τ`, which is proved *from* the `Rel (σ → τ)` fields, so
the definition would be circular. `Order` lives in `Type`, not `Prop`, for the same
reason `Ty` does: an instance argument must be type-system evidence rather than a
hypothesis, or the checker would see it as one and reject every proof that uses it.
-/

namespace Classicism
open Paper

/-- The law connecting the algebraic order to the boxed pointwise implication. -/
class Order (τ : Type) [Rel τ] : Type where
  le_iff : ∀ X Y : τ, X ≤ Y ↔ □ (X ⊆ Y)

export Order (le_iff)

/-! ### Type `t` -/

/-- At `t`: `q = (p ∨ q)` iff `□(p → q)`. Both directions are Leibniz's Law over closed
Logical-Equivalence instances. -/
theorem le_iff_prop (p q : Prop) : p ≤ q ↔ □ (p ⊆ q) :=
    ⟨fun h =>
        -- `p → q` is identical to `p → (p ∨ q)`, which is a tautology, hence `⊤`.
        calc (p → q) = (p → (p ∨ q)) := congrArg (λ r ↦ p → r) h
          _ = True := propext ⟨fun _ => trivial, fun _ hp => Or.inl hp⟩,
      fun h =>
        -- `q` is identical to `(p ∨ q) ∧ (p → q)`, a tautology; then rewrite `p → q = ⊤`.
        have h' : (p → q) = True := h
        calc q = ((p ∨ q) ∧ (p → q)) :=
              propext ⟨fun hq => ⟨Or.inr hq, fun _ => hq⟩,
                       fun ⟨hpq, himp⟩ => hpq.elim himp id⟩
          _ = ((p ∨ q) ∧ True) := by rw [h']
          _ = (p ∨ q) := and_true_eq _⟩

/-- The law is stated as a theorem first so that it has a name of its own: the strict
mirror of this instance takes its law from the transform of `le_iff_prop`. -/
instance instOrderProp : Order Prop where
  le_iff := le_iff_prop

/-! ### Relational function types -/

section arrow
variable {σ τ : Type} [Ty σ] [Rel τ] [Order τ]

/-- Left to right, as a closed lemma so that it can be necessitated: a pointwise
identity chain from the identity `Y = λz. Xz ∨ Yz`. -/
theorem incl_of_le_arrow (X Y : σ → τ) :
    X ≤ Y → X ⊆ Y := fun h z =>
  -- `congrFun` is Leibniz's Law, giving `Y z = X z ∨ Y z`, that is `X z ≼ Y z`.
  box_elim ((le_iff (X z) (Y z)).1 (congrFun h z))

/-- Right to left, as a closed lemma so that it can be necessitated: from the *boxed*
pointwise implication, `CBF` distributes the box and `Order τ` returns the pointwise
identities. -/
theorem forall_eq_of_box_incl (X Y : σ → τ) :
    □ (X ⊆ Y) → ∀ z, Y z = (X z ∨ Y z) := fun h z =>
  (le_iff (X z) (Y z)).2 (converse_barcan (λ z ↦ X z ⊆ Y z) h z)

/-- `σ → τ` satisfies the law when `τ` does. -/
theorem le_iff_arrow (X Y : σ → τ) : X ≤ Y ↔ □ (X ⊆ Y) :=
    ⟨fun h =>
        -- Box the identity with `NI`, then push the closed lemma through with `K`.
        modal_K _ _ (nec% (incl_of_le_arrow X Y)) (necessity_of_identity _ _ h),
      fun h =>
        -- `4` then `CBF` inside the box give the boxed pointwise identities, and
        -- Modalized Functionality turns those back into an identity of relations.
        modalized_functionality Y (λ z ↦ X z ∨ Y z)
          (modal_K _ _ (nec% (forall_eq_of_box_incl X Y)) (modal_four _ h))⟩

instance instOrderArrow : Order (σ → τ) where
  le_iff := le_iff_arrow

end arrow

/-! ### Consequences used downstream -/

variable {τ : Type} [Rel τ] [Order τ]

/-- The unboxed pointwise implication follows from the order, by `T`. -/
theorem incl_of_le {X Y : τ} (h : X ≤ Y) : X ⊆ Y :=
  box_elim ((le_iff X Y).1 h)

/-- And the order follows from the boxed pointwise implication. -/
theorem le_of_box_incl {X Y : τ} (h : □ (X ⊆ Y)) : X ≤ Y :=
  (le_iff X Y).2 h

/-- An entailment, if true, is necessary: `≤` is boxed inclusion, and `4`. -/
theorem box_le_rel (X Y : τ) (h : X ≤ Y) : □ (X ≤ Y) :=
  modal_K _ _ (nec% (le_iff X Y).2) (modal_four _ ((le_iff X Y).1 h))

end Classicism
