import Classicism.Booleanism

/-!
# The eleven closed identities (Classicism, Figures 2 and 3)

Classicism can be axiomatized over `H` by six Boolean Identities and, for each type
`σ`, five Classicist Identities (§1.3, Appendix A). Here each is proved as a theorem
by one gated use of Logical Equivalence, in the paper's exact λ-form. They are
regression tests for the Equivalence discipline: every proof is
`funext … (propext h)` with `h` closed, so `#print axioms` reports only `propext`,
`Quot.sound` and, where a complement law is involved, `em`.

`Classicism/Axiomatization.lean` restates the same eleven identities as axioms, for
the alternative policy in which `propext` and `funext` are banned outright.
-/

namespace Classicism.Identities

/-! ### Boolean Identities (Figure 2) -/

theorem commutativity_and : (fun p q : Prop => p ∧ q) = (fun p q => q ∧ p) :=
  funext fun p => funext fun q => and_comm_eq p q
theorem commutativity_or : (fun p q : Prop => p ∨ q) = (fun p q => q ∨ p) :=
  funext fun p => funext fun q => or_comm_eq p q
theorem distribution_and_or : (fun p q r : Prop => p ∧ (q ∨ r)) = (fun p q r => (p ∧ q) ∨ (p ∧ r)) :=
  funext fun p => funext fun q => funext fun r => and_or_distrib_eq p q r
theorem distribution_or_and : (fun p q r : Prop => p ∨ (q ∧ r)) = (fun p q r => (p ∨ q) ∧ (p ∨ r)) :=
  funext fun p => funext fun q => funext fun r => or_and_distrib_eq p q r
theorem dissolution_and_or : (fun p q : Prop => p ∧ (q ∨ ¬ q)) = (fun p _ => p) :=
  funext fun p => funext fun q => and_em_eq p q
theorem dissolution_or_and : (fun p q : Prop => p ∨ (q ∧ ¬ q)) = (fun p _ => p) :=
  funext fun p => funext fun q => or_and_not_eq p q

/-! ### Classicist Identities (Figure 3), one family per type `σ` -/

variable (σ : Type) [Ty σ]

theorem identity_identity :
    (fun y z : σ => y = z) = (fun y z => ∀ X : σ → Prop, Classicism.iff (X y) (X z)) :=
  funext fun y => funext fun z => eq_eq_forall_iff y z
theorem absorption_or_forall : (fun (X : σ → Prop) y => X y ∨ ∀ x, X x) = (fun X y => X y) :=
  funext fun X => funext fun y => or_forall_absorb_eq X y
theorem distribution_or_forall : (fun (X : σ → Prop) p => p ∨ ∀ x, X x) = (fun X p => ∀ y, p ∨ X y) :=
  funext fun X => funext fun p => or_forall_distrib_eq X p
theorem absorption_and_exists : (fun (X : σ → Prop) y => X y ∧ ∃ x, X x) = (fun X y => X y) :=
  funext fun X => funext fun y => and_exists_absorb_eq X y
theorem distribution_and_exists : (fun (X : σ → Prop) p => p ∧ ∃ x, X x) = (fun X p => ∃ y, p ∧ X y) :=
  funext fun X => funext fun p => and_exists_distrib_eq X p

/-! ### Consequences the paper displays (§1.3): duality of the quantifiers -/

theorem forall_duality : (fun X : σ → Prop => ∀ x, X x) = (fun X => ¬ ∃ x, ¬ X x) :=
  funext fun X => by rw [← not_forall_eq, not_not_eq]
theorem exists_duality : (fun X : σ → Prop => ∃ x, X x) = (fun X => ¬ ∀ x, ¬ X x) :=
  funext fun X => by rw [not_forall_eq]; exact (funext fun x => (not_not_eq (X x)).symm) ▸ rfl

end Classicism.Identities
