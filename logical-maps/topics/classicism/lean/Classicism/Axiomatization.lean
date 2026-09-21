import Classicism.Identities

/-!
# The eleven identities as axioms

The alternative, decidable axiomatization of Classicism (§1.3, Figures 2 and 3): `H`
plus these eleven closed identities, with no rule of Equivalence. Under the strict
policy in which `propext` and `funext` are banned, these are the only additional
axioms, and a proof's `#print axioms` report is then exactly `e`, `e_exists`, `em`
and members of this namespace. Nothing else in the library imports this file; the
`example`s at the end certify, by `type_of%`, that each axiom is word for word the
theorem `Classicism.Identities` proves by gated Equivalence, so that the two policies
prove the same statements. Appendix A of the paper is the metatheorem that they
prove the same theorems; a transformer realising it on Lean proof terms is planned.
-/

namespace Classicism.Axiomatic

axiom commutativity_and : (fun p q : Prop => p ∧ q) = (fun p q => q ∧ p)
axiom commutativity_or : (fun p q : Prop => p ∨ q) = (fun p q => q ∨ p)
axiom distribution_and_or : (fun p q r : Prop => p ∧ (q ∨ r)) = (fun p q r => (p ∧ q) ∨ (p ∧ r))
axiom distribution_or_and : (fun p q r : Prop => p ∨ (q ∧ r)) = (fun p q r => (p ∨ q) ∧ (p ∨ r))
axiom dissolution_and_or : (fun p q : Prop => p ∧ (q ∨ ¬ q)) = (fun p _ => p)
axiom dissolution_or_and : (fun p q : Prop => p ∨ (q ∧ ¬ q)) = (fun p _ => p)

axiom identity_identity (σ : Type) [Ty σ] :
  (fun y z : σ => y = z) = (fun y z => ∀ X : σ → Prop, Classicism.iff (X y) (X z))
axiom absorption_or_forall (σ : Type) [Ty σ] : (fun (X : σ → Prop) y => X y ∨ ∀ x, X x) = (fun X y => X y)
axiom distribution_or_forall (σ : Type) [Ty σ] : (fun (X : σ → Prop) p => p ∨ ∀ x, X x) = (fun X p => ∀ y, p ∨ X y)
axiom absorption_and_exists (σ : Type) [Ty σ] : (fun (X : σ → Prop) y => X y ∧ ∃ x, X x) = (fun X y => X y)
axiom distribution_and_exists (σ : Type) [Ty σ] : (fun (X : σ → Prop) p => p ∧ ∃ x, X x) = (fun X p => ∃ y, p ∧ X y)

/-! Each axiom's statement is the statement of the corresponding gated theorem. -/

example : type_of% commutativity_and := Identities.commutativity_and
example : type_of% commutativity_or := Identities.commutativity_or
example : type_of% distribution_and_or := Identities.distribution_and_or
example : type_of% distribution_or_and := Identities.distribution_or_and
example : type_of% dissolution_and_or := Identities.dissolution_and_or
example : type_of% dissolution_or_and := Identities.dissolution_or_and
example : type_of% identity_identity := Identities.identity_identity
example : type_of% absorption_or_forall := Identities.absorption_or_forall
example : type_of% distribution_or_forall := Identities.distribution_or_forall
example : type_of% absorption_and_exists := Identities.absorption_and_exists
example : type_of% distribution_and_exists := Identities.distribution_and_exists

end Classicism.Axiomatic
