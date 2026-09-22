import Classicism.Equivalence

/-!
# Booleanism: the propositional identities

Every identity here is an instance of Logical Equivalence: `propext` applied to a
closed proof of an `H`-biconditional. Together they say that the propositions form a
Boolean algebra under `∧`, `∨`, `¬`, with `True` and `False` as its bounds
(Classicism, §1.3). The six Boolean Identities of Figure 2 appear in
`Classicism/Identities.lean` in the paper's λ-form; this file keeps the pointwise
forms that proofs actually rewrite with.

Names carry a trailing `_eq` to keep clear of core's `Iff`-valued lemmas of the same
name, some of whose `=`-forms are proved through `Decidable` instances.
-/

namespace Classicism

section prop_identities
variable (p q r : Prop)

/-! ### Bounds -/

theorem and_true_eq : (p ∧ True) = p := propext ⟨fun h => h.1, fun h => ⟨h, trivial⟩⟩
theorem true_and_eq : (True ∧ p) = p := propext ⟨fun h => h.2, fun h => ⟨trivial, h⟩⟩
theorem or_true_eq : (p ∨ True) = True := propext ⟨fun _ => trivial, fun _ => Or.inr trivial⟩
theorem true_or_eq : (True ∨ p) = True := propext ⟨fun _ => trivial, fun _ => Or.inl trivial⟩
theorem and_false_eq : (p ∧ False) = False := propext ⟨fun h => h.2, fun h => h.elim⟩
theorem false_and_eq : (False ∧ p) = False := propext ⟨fun h => h.1, fun h => h.elim⟩
theorem or_false_eq : (p ∨ False) = p :=
  propext ⟨fun h => h.elim id (fun h => h.elim), fun h => Or.inl h⟩
theorem false_or_eq : (False ∨ p) = p :=
  propext ⟨fun h => h.elim (fun h => h.elim) id, fun h => Or.inr h⟩
theorem not_true_eq : (¬ True) = False := propext ⟨fun h => h trivial, fun h => h.elim⟩
theorem not_false_eq : (¬ False) = True := propext ⟨fun _ => trivial, fun _ h => h⟩
theorem true_imp_eq : (True → p) = p := propext ⟨fun h => h trivial, fun h _ => h⟩
theorem imp_true_eq : (p → True) = True := propext ⟨fun _ => trivial, fun _ _ => trivial⟩
theorem false_imp_eq : (False → p) = True := propext ⟨fun _ => trivial, fun _ h => h.elim⟩
theorem imp_false_eq : (p → False) = ¬ p := rfl
theorem iff_true_eq : (p ↔ True) = p := propext ⟨fun h => h.2 trivial, fun h => ⟨fun _ => trivial, fun _ => h⟩⟩
theorem true_iff_eq : (True ↔ p) = p := propext ⟨fun h => h.1 trivial, fun h => ⟨fun _ => h, fun _ => trivial⟩⟩
theorem iff_false_eq : (p ↔ False) = ¬ p := propext ⟨fun h => h.1, fun h => ⟨h, fun h => h.elim⟩⟩
/-
`(p = True) = p` and `(p = False) = ¬p` are deliberately absent. Lean proves them with
`propext`, but only by applying it to the hypothesis `p`: they say that every truth is
necessary, which is the Fregean Axiom, not a theorem of C. The checker rejects them.
-/

/-! ### Lattice laws -/

theorem and_comm_eq : (p ∧ q) = (q ∧ p) := propext ⟨fun h => ⟨h.2, h.1⟩, fun h => ⟨h.2, h.1⟩⟩
theorem or_comm_eq : (p ∨ q) = (q ∨ p) := propext ⟨fun h => h.elim Or.inr Or.inl, fun h => h.elim Or.inr Or.inl⟩
theorem and_assoc_eq : ((p ∧ q) ∧ r) = (p ∧ (q ∧ r)) :=
  propext ⟨fun ⟨⟨hp, hq⟩, hr⟩ => ⟨hp, hq, hr⟩, fun ⟨hp, hq, hr⟩ => ⟨⟨hp, hq⟩, hr⟩⟩
theorem or_assoc_eq : ((p ∨ q) ∨ r) = (p ∨ (q ∨ r)) :=
  propext ⟨fun h => h.elim (fun h => h.elim Or.inl (fun h => Or.inr (Or.inl h))) (fun h => Or.inr (Or.inr h)),
           fun h => h.elim (fun h => Or.inl (Or.inl h)) (fun h => h.elim (fun h => Or.inl (Or.inr h)) Or.inr)⟩
theorem and_self_eq : (p ∧ p) = p := propext ⟨fun h => h.1, fun h => ⟨h, h⟩⟩
theorem or_self_eq : (p ∨ p) = p := propext ⟨fun h => h.elim id id, fun h => Or.inl h⟩
theorem and_or_distrib_eq : (p ∧ (q ∨ r)) = ((p ∧ q) ∨ (p ∧ r)) :=
  propext ⟨fun ⟨hp, h⟩ => h.elim (fun hq => Or.inl ⟨hp, hq⟩) (fun hr => Or.inr ⟨hp, hr⟩),
           fun h => h.elim (fun ⟨hp, hq⟩ => ⟨hp, Or.inl hq⟩) (fun ⟨hp, hr⟩ => ⟨hp, Or.inr hr⟩)⟩
theorem or_and_distrib_eq : (p ∨ (q ∧ r)) = ((p ∨ q) ∧ (p ∨ r)) :=
  propext ⟨fun h => h.elim (fun hp => ⟨Or.inl hp, Or.inl hp⟩) (fun ⟨hq, hr⟩ => ⟨Or.inr hq, Or.inr hr⟩),
           fun ⟨h₁, h₂⟩ => h₁.elim Or.inl (fun hq => h₂.elim Or.inl (fun hr => Or.inr ⟨hq, hr⟩))⟩
theorem and_or_absorb_eq : (p ∧ (p ∨ q)) = p := propext ⟨fun h => h.1, fun h => ⟨h, Or.inl h⟩⟩
theorem or_and_absorb_eq : (p ∨ (p ∧ q)) = p := propext ⟨fun h => h.elim id And.left, fun h => Or.inl h⟩

/-! ### Complements: the part of `H` that needs excluded middle -/

theorem em_eq : (p ∨ ¬ p) = True := propext ⟨fun _ => trivial, fun _ => em p⟩
theorem and_not_self_eq : (p ∧ ¬ p) = False := propext ⟨fun h => h.2 h.1, fun h => h.elim⟩
theorem not_not_eq : (¬ ¬ p) = p :=
  propext ⟨fun h => (em p).elim id (fun hn => (h hn).elim), fun hp hn => hn hp⟩
theorem not_and_eq : (¬ (p ∧ q)) = (¬ p ∨ ¬ q) :=
  propext ⟨fun h => (em p).elim (fun hp => Or.inr (fun hq => h ⟨hp, hq⟩)) Or.inl,
           fun h hpq => h.elim (fun hn => hn hpq.1) (fun hn => hn hpq.2)⟩
theorem not_or_eq : (¬ (p ∨ q)) = (¬ p ∧ ¬ q) :=
  propext ⟨fun h => ⟨fun hp => h (Or.inl hp), fun hq => h (Or.inr hq)⟩,
           fun h hpq => hpq.elim h.1 h.2⟩
theorem imp_eq_not_or : (p → q) = (¬ p ∨ q) :=
  propext ⟨fun h => (em p).elim (fun hp => Or.inr (h hp)) Or.inl,
           fun h hp => h.elim (fun hn => (hn hp).elim) id⟩
theorem not_imp_eq : (¬ (p → q)) = (p ∧ ¬ q) :=
  propext ⟨fun h => (em p).elim (fun hp => ⟨hp, fun hq => h (fun _ => hq)⟩) (fun hn => (h (fun hp => (hn hp).elim)).elim),
           fun ⟨hp, hnq⟩ h => hnq (h hp)⟩
theorem iff_eq_and_imp : (p ↔ q) = ((p → q) ∧ (q → p)) :=
  propext ⟨fun h => ⟨h.1, h.2⟩, fun h => ⟨h.1, h.2⟩⟩
theorem contrapos_eq : (p → q) = (¬ q → ¬ p) :=
  propext ⟨fun h hnq hp => hnq (h hp), fun h hp => (em q).elim id (fun hnq => (h hnq hp).elim)⟩

/-- Dissolution-∧∨ pointwise: `p ∧ (q ∨ ¬q) = p`. -/
theorem and_em_eq : (p ∧ (q ∨ ¬ q)) = p := propext ⟨fun h => h.1, fun h => ⟨h, em q⟩⟩
/-- Dissolution-∨∧ pointwise: `p ∨ (q ∧ ¬q) = p`. -/
theorem or_and_not_eq : (p ∨ (q ∧ ¬ q)) = p :=
  propext ⟨fun h => h.elim id (fun h => (h.2 h.1).elim), fun h => Or.inl h⟩

end prop_identities

/-! ### Quantifier identities, pointwise (Classicism, Figure 3) -/

section quantifier_identities
variable {σ : Type} [Ty σ]

theorem or_forall_absorb_eq (X : σ → Prop) (y : σ) : (X y ∨ ∀ x, X x) = X y :=
  propext ⟨fun h => h.elim id (fun h => h y), fun h => Or.inl h⟩
theorem or_forall_distrib_eq (X : σ → Prop) (p : Prop) : (p ∨ ∀ x, X x) = ∀ x, p ∨ X x :=
  propext ⟨fun h x => h.elim Or.inl (fun h => Or.inr (h x)),
           fun h => (em p).elim Or.inl (fun hn => Or.inr (fun x => (h x).elim (fun hp => (hn hp).elim) id))⟩
theorem and_exists_absorb_eq (X : σ → Prop) (y : σ) : (X y ∧ ∃ x, X x) = X y :=
  propext ⟨fun h => h.1, fun h => ⟨h, y, h⟩⟩
theorem and_exists_distrib_eq (X : σ → Prop) (p : Prop) : (p ∧ ∃ x, X x) = ∃ x, p ∧ X x :=
  propext ⟨fun ⟨hp, x, hx⟩ => ⟨x, hp, hx⟩, fun ⟨x, hp, hx⟩ => ⟨hp, x, hx⟩⟩
theorem and_forall_absorb_eq (X : σ → Prop) (y : σ) : (X y ∧ ∀ x, X x) = ∀ x, X x :=
  propext ⟨fun h => h.2, fun h => ⟨h y, h⟩⟩
theorem forall_and_distrib_eq (X Y : σ → Prop) : (∀ x, X x ∧ Y x) = ((∀ x, X x) ∧ ∀ x, Y x) :=
  propext ⟨fun h => ⟨fun x => (h x).1, fun x => (h x).2⟩, fun h x => ⟨h.1 x, h.2 x⟩⟩
theorem not_forall_eq (X : σ → Prop) : (¬ ∀ x, X x) = ∃ x, ¬ X x :=
  propext ⟨fun h => (em (∃ x, ¬ X x)).elim id
             (fun hn => (h (fun x => (em (X x)).elim id (fun hnx => (hn ⟨x, hnx⟩).elim))).elim),
           fun ⟨x, hnx⟩ h => hnx (h x)⟩
theorem not_exists_eq (X : σ → Prop) : (¬ ∃ x, X x) = ∀ x, ¬ X x :=
  propext ⟨fun h x hx => h ⟨x, hx⟩, fun h ⟨x, hx⟩ => h x hx⟩
/-- The Identity Identity pointwise: `y = z` iff `y` and `z` share every property. The
biconditional is the paper's `iff`, not Lean's `Iff`; see `Classicism/Core.lean`. -/
theorem eq_eq_forall_iff (y z : σ) : (y = z) = ∀ X : σ → Prop, Classicism.iff (X y) (X z) :=
  propext
    ⟨fun h X => Eq.subst (motive := fun w => Classicism.iff (X y) (X w)) h
        (show Classicism.iff (X y) (X y) from
          ⟨(em (X y)).elim Or.inr Or.inl, (em (X y)).elim Or.inr Or.inl⟩),
     fun h => ((h (fun w => y = w)).1).elim (fun hn => absurd rfl hn) id⟩

end quantifier_identities

end Classicism
