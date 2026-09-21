import Classicism.Check
import Classicism.TypeSystem
import Classicism.Modal
import Classicism.Identities
import Classicism.Proofs
import Classicism.Strict
import Classicism.Tautology
import Classicism.Quantifier
import Classicism.Transform

/-!
# Controls for the checker

Every declaration here is deliberately outside Classicism, except the positive controls
at the end. `#classicism_expect_rejection` fails the build if the checker *accepts* one
of them, so these are the regression tests for the gate itself. None of this file is
imported by the library proper.
-/

namespace Classicism.Tests

/-! ### The three axioms Classicism rejects -/

/-- `propext` applied to a hypothesis is the Fregean Axiom, which C does not prove. -/
theorem fregeanAxiom (p q : Prop) (h : p ↔ q) : p = q := propext h

/-- `funext` applied to a hypothesis is Functionality, which C does not prove. -/
theorem functionality {σ : Type} [Ty σ] (X Y : σ → Prop) (h : ∀ z, X z = Y z) : X = Y := funext h

/-- Full Extensionality, the two together. -/
theorem extensionality {σ : Type} [Ty σ] (X Y : σ → Prop) (h : ∀ z, X z ↔ Y z) : X = Y :=
  funext fun z => propext (h z)

/-- `Classical.em` reaches `Classical.choice`, which gives Functional Choice at every
type. The theory's own `em` axiom must be used instead. -/
theorem viaChoice (p : Prop) : p ∨ ¬ p := Classical.em p

/-! ### Two more routes to the Fregean Axiom

Both of the next two say that a true proposition is necessary, with `p` a propositional
*variable*. Generalised, `∀p. p → □p` is interderivable with the Fregean Axiom in
Booleanism: one direction applies the axiom to `p ↔ ⊤`, the other splits on `p` and
identifies it with `⊤` or with `⊥`. So neither is No Pure Contingency, which is the much
weaker *sentence schema* `P → □P` for `P` a closed pure sentence, and which the map
records as an optional principle in its own right. Nothing here can express that schema,
since it quantifies over syntax rather than over propositions.

They are kept apart because each exercises a different path in the checker: the first
reaches `propext` through the `nec%` macro with a free hypothesis, the second nests
`propext` inside the argument of another `propext`, so catching it needs the walk to
descend under a binder and pick the hypothesis up there. -/

/-- `nec%` applied to a hypothesis. The macro is the rule of Necessitation only when its
argument is closed; applied to `h : p` it is the Fregean Axiom. The macro cannot tell the
difference; the checker can. -/
theorem fregeanAxiomViaNec (p : Prop) (h : p) : □ p := nec% h

/-- `(p = True) = p`, that is `□p = p`, another form of the same axiom: it follows from
the Fregean Axiom, and returns `p → □p` by Leibniz's Law. Lean proves it only by applying
`propext` to the hypothesis, under a binder. This is why `Classicism/Booleanism.lean`
omits it. -/
theorem fregeanAxiomViaBoxIdentity (p : Prop) : (p = True) = p :=
  propext ⟨fun h => h ▸ trivial, fun h => propext ⟨fun _ => trivial, fun _ => h⟩⟩

/-- `simp` rewrites under binders with `forall_congr`, which applies `funext` to a
hypothesis. Any `simp` call that does so is rejected, which is why the prelude avoids
the tactic. -/
theorem viaSimp {σ : Type} [Ty σ] (X : σ → Prop) (h : ∀ z, X z = True) : (∀ z, X z) = True := by
  simp [h]

/-- An unfinished proof. -/
theorem viaSorry (p : Prop) : p := sorry

/-- The walk is transitive: a proof that is itself impeccable is still rejected when it
appeals to a rejected lemma. -/
theorem viaSmuggledLemma (p q : Prop) (h : p ↔ q) : □ (p = q) :=
  nec% (fregeanAxiom p q h)

#classicism_expect_rejection fregeanAxiom functionality extensionality viaChoice
#classicism_expect_rejection fregeanAxiomViaNec fregeanAxiomViaBoxIdentity
#classicism_expect_rejection viaSimp viaSorry viaSmuggledLemma

/-! ### Positive controls

These must pass: the gate has to admit the shapes the library actually relies on. -/

/-- ζ-Equivalence: `funext` of `propext` of a closed biconditional. -/
theorem zetaEquivalence {σ : Type} [Ty σ] : (fun x : σ => x = x) = (fun _ : σ => True) :=
  funext fun x => propext ⟨fun _ => trivial, fun _ => rfl⟩

/-- ξ: `funext` of a closed identity. -/
theorem xiRule {σ : Type} [Ty σ] (p q : Prop) (h : p = q) :
    (fun _ : σ => p ∧ True) = (fun _ : σ => p) :=
  funext fun _ => and_true_eq p

/-- Necessitation of a closed theorem, the intended use of `nec%`. -/
theorem necessitation (p : Prop) : □ (p ∨ ¬ p) := nec% (em p)

/-- Leibniz's Law on a hypothesis is unrestricted. -/
theorem leibniz (p q : Prop) (h : p = q) (hp : □ p) : □ q := h ▸ hp

#classicism_check zetaEquivalence xiRule necessitation leibniz

/-! ### Where `e_exists` is and is not needed

`C⁻` is `H⁻` plus Classicism, and it proves nearly everything the paper proves: the only
Existence instance `H⁻` misses is the one at `e`. The library is built so that a
theorem's axiom report says which side of that line it falls on. These assertions pin
the line down. The eleven identities come out `C⁻`, which is what the paper says of the
biconditionals that generate them (n. 21). -/

#classicism_expect_c_minus intensionality modalized_functionality modal_K modal_four
#classicism_expect_c_minus necessity_of_identity converse_barcan existence_rel
#classicism_expect_c_minus Classicism.Identities.identity_identity
#classicism_expect_c_minus Classicism.Identities.distribution_or_forall
#classicism_expect_c_minus Classicism.Identities.dissolution_and_or
#classicism_expect_c_minus Classicism.Proofs.barcan_r_implies_functionality_r
#classicism_expect_c_minus Classicism.Proofs.existence_at_relational_types

#classicism_expect_needs_e existence_e Classicism.Proofs.classicism_implies_existence_r

/-! ### Controls for the type-system check

The gate says nothing about type theory, so these all pass it and must be caught by
`#classicism_types` instead. That is the point of having both. -/

/-- Quantification over Lean types with no `Ty` guard. This is a genuine type quantifier,
not the map's metalinguistic `∀ᵀʸ`. -/
theorem unguardedTypeQuantifier : ∀ (σ : Type) (x : σ), x = x := fun _ _ => rfl

/-- A type outside `R`: `e → e` is not admitted, since a function type must end in `t`. -/
theorem nonRelationalArrow (f : e → e) (x : e) : f x = f x := rfl

/-- A dependent function type is outside `R` however its parts behave: `R` admits only
non-dependent `σ → τ`. -/
theorem dependentType (F : (σ : Type) → σ → Prop) (x : e) : F e x = F e x := rfl

/-- An inductive type that is not a logical constant, with its recursor. -/
theorem usesNat (n : Nat) : n = n := rfl

/-- Recursion over `Nat`: the clearest case of leaving the type theory, even though the
statement is about propositions only. -/
theorem usesNatRec (p : Prop) (h : p) : ∀ n : Nat, p := fun n => Nat.rec h (fun _ ih => ih) n

#classicism_types_expect_rejection unguardedTypeQuantifier nonRelationalArrow
#classicism_types_expect_rejection dependentType usesNat usesNatRec

-- All three pass the *gate*, which is exactly why the type check has to exist: the
-- axiom and Equivalence checks say nothing about type theory.
#classicism_check unguardedTypeQuantifier nonRelationalArrow usesNat

/-! Positive controls: the shapes the library relies on must survive the type check. -/

#classicism_types zetaEquivalence xiRule necessitation leibniz

/-! ### Controls for the strict policy

`Classicism/Strict.lean` uses no Logical Equivalence at all. Its theorems therefore pass
`#classicism_strict`, while the gate-policy library does not: every `_eq` lemma in
`Classicism/Booleanism.lean` proves the same thing by one `propext`, which the strict
policy bans. The two below are the same proposition proved under the two policies. -/

#classicism_strict Classicism.Strict.meet_assoc Classicism.Strict.compl_join
#classicism_strict Classicism.Strict.compl_compl Classicism.Strict.join_assoc

/-- Commutativity of `∧` under the gate, via `propext`: banned by the strict policy. -/
theorem gatedCommutativity (p q : Prop) : (p ∧ q) = (q ∧ p) := and_comm_eq p q

/-- The same proposition under the strict policy, via Commutativity-∧ and `congrFun`. -/
theorem strictCommutativity (p q : Prop) : (p ∧ q) = (q ∧ p) := Strict.meet_comm p q

#classicism_strict_expect_rejection gatedCommutativity
#classicism_strict strictCommutativity

/-! ### The tautology tactic

`boolean_eq` decides identities between `∧`/`∨`/`¬` formulas from the six Boolean
Identities. These are all checked strictly, so each reports only Boolean axioms. -/

namespace Taut
open Classicism.Strict

/-- A law proved by hand in `Strict.lean`, now by tactic. -/
theorem byTactic_comm (p q : Prop) : (p ∧ q) = (q ∧ p) := by boolean_eq
/-- Associativity, which by hand needed the dual cancellation lemma. -/
theorem byTactic_assoc (p q r : Prop) : (p ∨ (q ∨ r)) = ((p ∨ q) ∨ r) := by boolean_eq
/-- De Morgan. -/
theorem byTactic_deMorgan (p q : Prop) : (¬ (p ∧ q)) = ((¬ p) ∨ (¬ q)) := by boolean_eq
/-- A tautology is identical to `⊤`. -/
theorem byTactic_taut (p q : Prop) : ((p ∧ q) ∨ ((¬ p) ∨ (¬ q))) = Top := by boolean_eq
/-- Four atoms, beyond anything proved by hand. -/
theorem byTactic_four (p q r s : Prop) :
    ((p ∨ q) ∧ ((¬ p) ∨ r) ∧ (q ∨ r ∨ s)) = ((p ∨ q) ∧ ((¬ p) ∨ r)) := by boolean_eq
/-- Peirce's law, through the paper's defined implication. -/
theorem byTactic_peirce (p q : Prop) : imp (imp (imp p q) p) p = Top := by boolean_eq
/-- The self-distribution axiom of `PC`. -/
theorem byTactic_selfDistrib (p q r : Prop) :
    imp (imp p (imp q r)) (imp (imp p q) (imp p r)) = Top := by boolean_eq

#classicism_strict byTactic_comm byTactic_assoc byTactic_deMorgan byTactic_taut
#classicism_strict byTactic_four byTactic_peirce byTactic_selfDistrib
#classicism_strict Classicism.Strict.eq_of_iff_eq_top Classicism.Strict.iff_eq_top_of_eq

end Taut

/-! ### The quantifier cases of Appendix A

Every axiom of `H` that governs a quantifier or identity, shown identical to `⊤` from the
Classicist Identities, plus the two identities behind `Gen` and `Inst`. All strict. -/

namespace Quant
open Classicism.Strict

#classicism_strict Classicism.Strict.forall_const_top Classicism.Strict.exists_const_bot
#classicism_strict Classicism.Strict.ui_top Classicism.Strict.eg_top
#classicism_strict Classicism.Strict.imp_forall Classicism.Strict.meet_exists
#classicism_strict Classicism.Strict.lam_iff_self_top Classicism.Strict.ref_top
#classicism_strict Classicism.Strict.gen_top

end Quant

/-! ### The transformer

`#classicism_transform foo` re-proves `foo` from the eleven axioms and declares the result.
Each line below both exercises the transformer and, by the reported axioms, demonstrates
that the shallow theory is Classicism. The first group are ordinary Boolean lemmas; the
second are the eleven identities themselves, whose gated proofs transform back into the
axioms they duplicate. -/

#classicism_transform Classicism.and_comm_eq Classicism.or_comm_eq Classicism.and_assoc_eq
#classicism_transform Classicism.not_not_eq Classicism.not_and_eq Classicism.not_or_eq
#classicism_transform Classicism.and_or_distrib_eq Classicism.and_em_eq
#classicism_transform Classicism.or_and_absorb_eq Classicism.and_or_absorb_eq

#classicism_transform Classicism.Identities.commutativity_and
#classicism_transform Classicism.Identities.dissolution_and_or
#classicism_transform Classicism.Identities.absorption_or_forall
#classicism_transform Classicism.Identities.identity_identity

/-! Statements outside the axioms' vocabulary transform once the *statement* is translated
into the paper's `⊤`, `⊥`, `imp` and `iff`. The strict theorem then has the translated type,
which is the paper's own, so this is a change of statement and not only of proof. -/

#classicism_transform Classicism.and_true_eq Classicism.or_true_eq Classicism.not_true_eq
#classicism_transform Classicism.and_false_eq Classicism.em_eq Classicism.true_imp_eq
#classicism_transform Classicism.imp_eq_not_or Classicism.contrapos_eq
#classicism_transform Classicism.iff_eq_and_imp Classicism.not_imp_eq

end Classicism.Tests
