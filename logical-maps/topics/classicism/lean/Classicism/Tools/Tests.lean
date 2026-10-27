import Classicism.Tools.Check
import Classicism.Tools.TypeSystem
import Classicism.Background.Necessity
import Classicism.Identities
import Classicism.Results.Records

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

/-- `simp [h]` with a hypothesis under a binder: `forall_congr` applied to `h`, which is
`funext` applied to `h`, which is BF at `σ`. `simp` itself is admissible (see the positive
controls below); what is rejected is this use of it, and the gate names `forall_congr`. -/
theorem viaSimp {σ : Type} [Ty σ] (X : σ → Prop) (h : ∀ z, X z = True) : (∀ z, X z) = True := by
  simp [h]

/-- An unfinished proof. -/
theorem viaSorry (p : Prop) : p := sorry

/-- The walk is transitive: a proof that is itself impeccable is still rejected when it
appeals to a rejected lemma. -/
theorem viaSmuggledLemma (p q : Prop) (h : p ↔ q) : □ (p = q) :=
  nec% (fregeanAxiom p q h)

/-- `simp [h]` with a biconditional hypothesis at the top level: `propext h`, the Fregean
Axiom, reached through `simp` instead of `rw`. -/
theorem fregeanViaSimp (p q : Prop) (h : p ↔ q) : (p ∧ True) = q := by
  simp only [h, and_true_eq]

#classicism_expect_rejection fregeanAxiom functionality extensionality viaChoice
#classicism_expect_rejection fregeanAxiomViaNec fregeanAxiomViaBoxIdentity
#classicism_expect_rejection viaSimp viaSorry viaSmuggledLemma fregeanViaSimp

/-! ### The gated primitive reached other than by name

The gate recognises `propext`, `funext` and `Quot.sound` as the head of an application.
Bound to a local name, or hidden in an `opaque`, the constant never stands at a head, and
the application in the body has a variable as its head. Each proof below was certified as
a theorem of `C⁻` before the walk rejected a bare occurrence of a gated primitive and
descended into `opaque` bodies. They are the Fregean Axiom and Functionality again. -/

/-- `propext` under a `have`-bound alias. `have` is `letFun`, so `@propext` is an argument
and the body applies the local `pe`. -/
theorem fregeanViaHave (p : Prop) (h : p) : p = True :=
  have pe := @propext; pe ⟨fun _ => trivial, fun _ => h⟩

/-- The same through `let`, which is a separate node of the walk. -/
theorem fregeanViaLet (p : Prop) (h : p) : p = True :=
  let pe := @propext; pe ⟨fun _ => trivial, fun _ => h⟩

/-- `funext` under an alias: Functionality. -/
theorem functionalityViaHave {σ : Type} [Ty σ] (X Y : σ → Prop) (h : ∀ z, X z = Y z) :
    X = Y :=
  have fe := @funext; fe h

/-- The alias inside a global lemma, reached transitively. -/
theorem fregeanViaAliasLemma (p : Prop) (h : p) : □ p := fregeanViaHave p h

/-- An `opaque` body is a proof term like any other. `#print axioms` sees through it, so
the walk must too. -/
opaque hiddenFregean : ∀ p : Prop, p → p = True :=
  fun _ h => propext ⟨fun _ => trivial, fun _ => h⟩
theorem fregeanViaOpaque (p : Prop) (h : p) : p = True := hiddenFregean p h

#classicism_expect_rejection fregeanViaHave fregeanViaLet functionalityViaHave
#classicism_expect_rejection fregeanViaAliasLemma fregeanViaOpaque

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

/-- `simp` closing a goal cites `eq_self`, which is `eq_true rfl`: Necessitation of a
closed identity, gated at the use site (`Check.gatedRules`). -/
theorem simpCloses (p : Prop) : ((p ∧ True) ∨ False) = p := by
  simp only [and_true_eq, or_false_eq]

/-- `simp` under `∀` cites `forall_congr` at a closed argument: the rule ξ. -/
theorem simpUnderForall {σ : Type} [Ty σ] (X : σ → Prop) :
    (∀ z, X z ∧ True) = (∀ z, X z) := by
  simp only [and_true_eq]

/-- `simp` under `∃` applies `funext` directly, at a closed argument. -/
theorem simpUnderExists {σ : Type} [Ty σ] (X : σ → Prop) :
    (∃ z, X z ∧ True) = (∃ z, X z) := by
  simp only [and_true_eq]

#classicism_check zetaEquivalence xiRule necessitation leibniz
#classicism_check simpCloses simpUnderForall simpUnderExists
#classicism_types simpCloses simpUnderForall simpUnderExists

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
#classicism_expect_c_minus Classicism.Proofs.classicism_implies_existence_r_relational

#classicism_expect_needs_e existence_e Classicism.Proofs.classicism_implies_existence_r_at_e

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

end Classicism.Tests
