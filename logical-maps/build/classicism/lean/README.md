# Classicism in Lean

A formalisation of Bacon and Dorr's **Classicism** inside base Lean 4, with no Mathlib
and none of Lean's own classical axioms taken for granted. The point is that the fit is
exact rather than approximate: Lean's three axioms are three principles of this map, and
removing them leaves a system in which Classicism can be stated and its theorems proved.

| Lean axiom | Principle on the map |
| --- | --- |
| `propext` | Fregean Axiom |
| `funext` (via `Quot.sound`) | Functionality |
| `Classical.choice` | Functional Choice, and more |

None of the three is a theorem of Classicism, so none may be used freely. Lean's
remaining rules for `→`, `∀`, `∧`, `∨`, `¬`, `↔`, `∃`, `=`, `True` and `False` are the
rules of the paper's `H`, short of two things, which this library adds as axioms:
excluded middle (`em`), and `∃ x : e, x = x` (`e_exists`), since Lean allows empty types
and `H` proves Existence at every type.

## C and C⁻

Dropping `e_exists` leaves the paper's `C⁻`, that is `H⁻` plus Classicism, which proves
the great majority of the paper's theorems. The library is arranged so that this line is
visible per theorem rather than global: **Existence is not built into the type system.**
The class `Ty` is a marker with no inhabitation field, so declaring `e` an `R`-type costs
nothing, and Existence is instead two theorems. `Modal.existence_rel` covers every
relational type, witnessed by the closed term `⊤_τ`, and needs no axiom.
`Modal.existence_e` is the axiom. Consequently a theorem's `#print axioms` report names
`e_exists` exactly when the theorem really uses it.

Were inhabitation folded back into `Ty`, `C⁻` could not be expressed at all, since there
`e` is a type whose inhabitation is unprovable, and `existence-r` would come out as a
triviality rather than a theorem with a stated cost. Note that an instance argument
`[Ty σ]` is a parameter, so it never propagates an axiom by itself; only instantiating at
`e` can do that.

`#classicism_audit` reports the split, and `Classicism/Tests.lean` asserts it with
`#classicism_expect_c_minus` and `#classicism_expect_needs_e`. At present 122 of the
library's 124 theorems are theorems of `C⁻`; the two exceptions are the Existence
theorem at `e` and the record that depends on it. The eleven identities are all `C⁻`,
which is what the paper says of the biconditionals generating them (n. 21).

## Logical Equivalence

Classicism is `H` closed under the rule

> **Equivalence.** If ⊢ P ↔ Q then ⊢ (λv̄.P) = (λv̄.Q).

A rule cannot be a Lean axiom. The rendering used here is a restriction on how
`propext` and `funext` may appear:

> `propext h` and `funext h` are admissible **only when `h` is closed**: the proof term
> `h` may mention object variables and global theorems, but no hypothesis, that is, no
> local variable whose type is a proposition.

Under that restriction `funext (fun v̄ => propext h)` is exactly ζ-Equivalence and
`funext (fun v => h)` with `h` a closed identity is the rule ξ, both of which
Classicism is closed under. Applied to a hypothesis instead, `propext` is the Fregean
Axiom and `funext` is Functionality. The restriction is a fact about the shape of the
proof term, and nothing in the term records it, so it is enforced mechanically by the
checker described below.

Because Classicism is already closed under Equivalence (§1.4), the closed proof `h` may
itself be a theorem of Classicism, not only of `H`. No separate `H`/`C` bookkeeping is
needed.

## The relational type system

The paper's type system `R` admits `e`, `t`, and `σ → τ` only when `τ ≠ e`. The class
`Ty σ` certifies that `σ` is an `R`-type and `Rel τ` that it is a relational one; the
only instances are `e`, `Prop` and arrows into relational types. So `∀ᵀʸ σ` is
`∀ {σ : Type} [Ty σ]`, and a schema over relational types is `∀ {τ : Type} [Rel τ]`.
`Ty` carries no inhabitation claim, for the reason given above; where a schema's proof
is *not* uniform across `e` and the relational types, as Existence is not, the schema is
written as the conjunction of its two cases instead.

Because `Rel` is a class and not an inductive code, **there is no induction on the
structure of a relational type.** Anything whose proof recurses on that structure has to
be a class field, discharged once per shape. That is how `boxAt`, `boxImp` and the order
law `Order.le_iff` are supplied. `Order` has to be a class of its own rather than another
`Rel` field, because its arrow instance needs Modalized Functionality at `σ → τ`, which
is proved *from* the `Rel (σ → τ)` fields; as a field it would be circular. This is the
main structural constraint the shallow layer imposes, and a deep embedding is what would
lift it.
`Rel` also carries the pointwise Boolean structure that the paper writes with type
subscripts, and two closed identities that let Intensionality be proved uniformly at
every relational type. `Ty` is declared in `Type` rather than `Prop` so that an instance
argument is type-system evidence rather than a hypothesis, which matters to the gate.

## The strict policy

Under the gate, `propext` and `funext` are permitted in the ζ-Equivalence shape. Under the
**strict policy** they are banned outright and the eleven closed identities stand in their
place. `Classicism/Strict.lean` is written to that policy and `#classicism_strict` holds it
to it: the admitted axioms there are the eleven, `e`, `e_exists` and `em`, and nothing else.

That file derives the **Boolean algebra of propositions from the six Boolean Identities
alone**: the bounds, complements, idempotence, annihilation, absorption, a cancellation
lemma, associativity of both operations, uniqueness of complements, double negation and
both De Morgan laws. All 32 theorems report only Boolean axioms; not one uses `propext`,
`funext`, `Quot.sound`, or even `em`, since excluded middle is already carried by the two
Dissolution identities.

Two points of substance. The six identities are Huntington's axioms, so **associativity is
not among them and has to be derived**, which runs through the cancellation lemma
`eq_of_meet_eq`: two propositions agreeing under `p` and under `¬p` are identical. And the
strict layer keeps **its own `⊤` and `⊥`**, the paper's Figure 1 pair, because no axiom
mentions Lean's `True`: an identity can only enter from an axiom, from `rfl`, from
congruence, or from `propext`, so `(q ∨ ¬q) = True` is not reachable strictly. Since the
paper's `⊤` is some `q ∨ ¬q` with `q` closed, Dissolution-∧∨ gives `p ∧ ⊤ = p` at once.

This file is the language the Appendix A transformer will emit into.

## `boolean_eq`

`Classicism/Tautology.lean` turns the algebra into a decision procedure.
`boolean_eq` proves any goal `P = Q` where both sides are built from atoms by `∧`, `∨`,
`¬`, `⊤`, `⊥` and the paper's defined `imp` and `iff`, provided they are tautologically
equivalent, and it emits only the six Boolean Identities. On a non-equivalence it reports a
falsifying assignment.

The method is Shannon expansion, driven by the same cancellation lemma that gave
associativity. To prove `P = Q`, pick an atom `a` and prove `a ∧ P = a ∧ Q` and
`¬a ∧ P = ¬a ∧ Q`; each is settled by substituting `⊤` or `⊥` for `a`, which removes an
atom, so the recursion bottoms out at formulas of bounds only. Substitution is itself a
proof-generating recursion: conjunction and disjunction go through the distribution laws,
and negation through `relative_compl`, since `l ∧ Q = l ∧ Q'` does not give
`l ∧ ¬Q = l ∧ ¬Q'` by congruence alone.

Note that `imp` and `iff` are the paper's abbreviations, not Lean's `→` and `Iff`. Lean's
arrow is primitive and `Iff` is an inductive, and no axiom connects either to the Boolean
structure, so the strict layer cannot use them — the same point as `True`.

With `eq_of_iff_eq_top`, which converts `(P ↔ Q) = ⊤` into `P = Q`, this closes Appendix A's
`PC` case: any propositional `H`-theorem yields its identity from the six axioms.

## The quantifier cases

`Classicism/Quantifier.lean` does the rest of Appendix A's base cases from the five
Classicist Identities: Proposition A.1 (`∀x.⊤ = ⊤`) and its dual, `UI`, `EG`, `Ref`, and
the two identities behind `Gen` and `Inst`. Eleven theorems, all strict.

`UI` and `EG` turn out to be order facts. Absorption-∨∀ says `Fy ∨ ∀F = Fy`, which is
`∀F ≤ Fy`; Absorption-∧∃ says `Fy ∧ ∃F = Fy`, which is `Fy ≤ ∃F`. Two small lemmas convert
an absorption into an implication identical to `⊤`, each one `boolean_eq` and one rewrite.
`Gen` and `Inst` come out better than rules: Distribution-∨∀ *is* the identity
`P → ∀u.Qu = ∀u.(P → Qu)`, and Distribution-∧∃ its dual, so the rules are corollaries.

### How Appendix A avoids ξ

The rule ξ, from `⊢ A = B` to `⊢ (λv.A) = (λv.B)`, is `funext`, which the strict policy
bans. The paper never needs it. Its central lemma is stated **already λ-abstracted**, and
every step of its proof rewrites the target so that one of the eleven *closed* identities
appears applied to arguments, substitutes it by Ref and Leibniz's Law, and β-reduces.
Leibniz's Law does not care how deep the position is or whether binders intervene. In Lean
that step is exactly

    congrArg (fun G => …context mentioning G…) closedIdentity

with β free. `Ref` is the case that needs it: the Identity Identity gives
`(a = a) = ∀X.(Xa ↔ Xa)`, whose body mentions `X`, so the route to `∀X.⊤` is six such
substitutions under the binder. `lam_iff_self_top` is written out that way, and it is the
pattern the transformer will automate. Lifting a *function* identity under a quantifier
needs nothing new, since `congrArg (fun F => ∀ x, F x)` does it; what is unavailable is
manufacturing the function identity from a pointwise one.

## The transformer

`#classicism_transform foo` takes a theorem proved under the gate and produces a second
theorem of the same type proved under the strict policy, then reports its axioms. That
report, naming the eleven identities and nothing else, is the cleanest demonstration
available that the shallow theory is Classicism.

It does **not** interpret the gated argument as an `H`-derivation, and does not need to.
Since the kernel checks the output, it is enough to *re-prove* each identity strictly. So
the argument of each `propext` is discarded and the identity handed to the decision
procedures: first a search for one of the eleven axioms, applied to arguments through a
`congrFun` chain if need be, then `boolean_eq`. Appendix A is what guarantees this can
always succeed; the transformer is what produces the certificate case by case. Obligations
are discharged in the local context where they arise, not collected as holes, because a
hole filled after the walk had abstracted the surrounding binders would dangle.

The satisfying case is the eleven identities themselves. `Classicism/Identities.lean`
proves each by one gated use of Equivalence, and transforming those proofs hands back the
axioms they duplicate: `Identities.commutativity_and` transforms to a theorem whose entire
axiom report is `[commutativity_and]`.

### What blocks the rest, and it is not what I expected

Over the whole library: **35 theorems transform, 30 are already strict, and 61 do not
transform.** The breakdown of those 61 is the interesting part.

| cause | count |
| --- | --- |
| mentions `True`, `False`, Lean's `→` or Lean's `Iff` | 51 |
| needs the λ-level tactic | 3 |
| other | 7 |

So the dominant obstacle is **vocabulary, not machinery**. No axiom mentions `True`,
Lean's arrow or Lean's `Iff`, so an identity mentioning any of them is not merely unproved
but unreachable: the strict layer cannot express it. Since the library defines `□p` as
`p = True`, every modal theorem inherits this. The λ-level tactic, which I had expected to
be the bottleneck, blocks only three.

### Translation, not rewriting

The right response is **not** to restate the library. The transformer translates the
*statement* into the paper's vocabulary and proves that: `translate` maps `True ↦ ⊤`,
`False ↦ ⊥`, `Iff ↦ iff`, `Box ↦ Strict.Box`, `Dia ↦ Strict.Dia`, and a non-dependent arrow
between propositions to `imp`, leaving predicate types such as `σ → Prop` alone. So the
shallow layer stays idiomatic Lean, where ordinary tactics work, and the bridge lives in
the transformer. With translation the counts become

| module | direct | after translation | already strict | still open |
| --- | --- | --- | --- | --- |
| `Booleanism` | 20 | 22 | 1 | 4 |
| `Identities` | 11 | 0 | 0 | 2 |
| `Modal` | 2 | 0 | 6 | 9 |
| `Proofs` | 2 | 0 | 14 | 11 |

Every one of Booleanism's `True`, `→` and `Iff` lemmas now transforms, `imp_eq_not_or`,
`contrapos_eq` and `iff_eq_and_imp` among them.

One thing to note before the diagnosis below: the strict theorem carries the **translated
type**, so `and_true_eq.strict` is about `p ∧ ⊤` rather than `p ∧ True`. The pair are
related by Figure 1's definitions, not by Lean-level identity, and the translated statement
is the paper's own.

### Why the rest is still open, and which part of that is permanent

Two causes, and they are quite different.

**One: translation acts on whole statements, and only identities can be reproved.** The
translation path fires when the target's statement is an identity, because proving a
translated statement from scratch is something the decision procedures can do only for
identities. A target that is an *implication* cannot take that path at all and must go
through the walk, where each obligation has to be met in the **original** vocabulary. That
is impossible when the obligation mentions `True`, Lean's `→` or Lean's `Iff`, and
obligations cannot be translated piecemeal, because a translated proof has a different type
and no longer fits its hole.

`modal_four` shows this exactly. Its obligation is `(p = p) = True`, and
`Quantifier.ref_top` is the strict theorem `(a = a) = ⊤`. Nothing mathematical is missing;
the two sit in different vocabularies and the transformer has no way to cross at that
point. Citation of strict lemmas is wired in and changes nothing here, which confirms the
diagnosis rather than fixing it.

This *will* recur, and by default rather than exceptionally, since most theorems worth
having are implications: every `X ⇒ Y` record, every modal axiom, the whole comprehension
layer. But it is fixable, and an earlier version of this file said otherwise. It claimed
proofs cannot be translated because `⊤` has no constructor and `iff` is a conjunction of
disjunctions. That was wrong. With `em`, which is an axiom of the theory, every shape a
proof term can take translates:

| Lean form | translates to | needs |
| --- | --- | --- |
| `True.intro` | a proof of `⊤` | `em` |
| `fun h => …` at an implication | a proof of `imp` | `em` |
| application | modus ponens on `imp` | nothing |
| `Iff.intro` | a proof of `iff` | `em` |
| `Iff.mp`, `Iff.mpr` | elimination from `iff` | nothing |
| `False.elim` | elimination from `⊥` | nothing |

So the proper fix is to translate whole declarations, statement and proof together, by
those six clauses, instead of translating statements and reproving. Every obligation would
then arise already in the paper's vocabulary and the existing procedures would apply.

**Two: the identity and quantifier fragment has no decision procedure, and cannot have
one.** Separately from the above, some obligations are theorems of `C` that simply have no
proof yet: `Xy ∧ ∀X = ∀X`, `¬∀x.Xx = ∃x.¬Xx`, `∀x.(Xx ∧ Yx) = (∀x.Xx ∧ ∀x.Yx)`, and the
laws of the box. `boolean_eq` is complete for the propositional fragment, which is a
special case; the rest is essentially higher-order logic, so no complete procedure exists.

This cause is permanent. The response to it is not another tactic but a growing library of
strict lemmas for the transformer to cite, which is why citation is wired in even though it
pays nothing today. Once the vocabulary problem above is fixed, that library is what
determines coverage.


## Files

```
Classicism/Core.lean            e, em, e_exists, □ and ◇, the classes Ty and Rel
Classicism/Equivalence.lean     the gate, the nec% macro, tactic conventions
Classicism/Booleanism.lean      the propositional and quantifier identities, pointwise
Classicism/Identities.lean      the eleven closed identities in the paper's λ-form
Classicism/Axiomatization.lean  the same eleven as axioms, for the strict policy
Classicism/Strict.lean          the Boolean algebra of propositions, strictly
Classicism/Tautology.lean       the boolean_eq tactic, Appendix A's PC case
Classicism/Quantifier.lean      Appendix A's quantifier cases: UI, EG, Ref, Gen, Inst
Classicism/Transform.lean       #classicism_transform: gated proof to strict proof
Classicism/Modal.lean           K, T, 4, NI, CBF, Intensionality and its corollaries
Classicism/Order.lean           the algebraic order and its pointwise characterisation
Classicism/Comprehension.lean   persistence, inextensibility and the rigidity variants
Classicism/Principles.lean      one Prop per principle of the map
Classicism/Proofs.lean          one theorem per record of the map
Classicism/Check.lean           #classicism_check and #classicism_audit
Classicism/TypeSystem.lean      #classicism_types: the relational type system
Classicism/Audit.lean           runs the audit over the library at build time
Classicism/Tests.lean           negative and positive controls for the checker
```

## The checker

`#classicism_check foo` walks the proof term of `foo` and of every constant it reaches,
and reports an error unless both hold:

1. **Axioms.** Everything `foo` depends on is one of `propext`, `Quot.sound`, `e`,
   `e_exists`, `em`. So `Classical.choice`, `sorryAx` and the alternative axioms of
   `Classicism.Axiomatization` are all rejected.
2. **The gate.** Every `propext` and `funext` occurrence reached has a closed argument,
   in the sense above. A `have`-bound proof is looked through to its value.

`#classicism_audit Mod₁ Mod₂ …` runs it over every theorem declared in those modules.
`Classicism/Audit.lean` runs the audit over the whole library, so `lake build` fails if
a proof strays. The walk reaches core lemmas too, which is why `simp` is unusable here:
it rewrites under binders through `forall_congr`, which applies `funext` to a
hypothesis. `Classicism/Tests.lean` asserts that each of these is rejected, and that the
shapes the library relies on are accepted.

## The type-system check

The gate says nothing about type theory, so it is not by itself enough: a proof that
quantifies over `Type`, forms `e → e`, or recurses over `Nat` passes it. `Tests.lean`
contains three such proofs, and they do pass. `#classicism_types foo`, in
`Classicism/TypeSystem.lean`, is the second check, and `#classicism_types_audit` runs it
over a module. It enforces three things.

* **Types are types of `R`.** An `R`-type as a Lean expression is `e`, `Prop`, or a
  *non-dependent* arrow whose domain is an `R`-type and whose codomain is a relational
  one. Dependency is what excludes the rest of Lean's type theory.
* **Type variables are guarded.** A schema over types is written `∀ {σ : Type} [Ty σ] …`,
  so a bound type variable counts as an `R`-type exactly when the telescope guards it
  with a `Ty`, `Rel` or `Order` instance. An unguarded `∀ {σ : Type}` is a real quantifier
  over Lean types and is rejected.
* **Constants come from a whitelist**, in three named groups: the logical inductives with
  their constructors and recursors, which are the constants of `L` and the rules of `H`;
  the `Eq` plumbing that `rw`, `calc` and `▸` emit, which is all Leibniz's Law; and the
  formalisation's own metalanguage, `Trans` from `calc` and `PUnit` from the marker field
  of `Ty`. The three are listed separately so the distinction stays visible. A whitelisted
  core constant is treated as an accepted primitive and not descended into, since its
  definition is generic Lean; what is checked is that it is *applied at* `R`-types.

The library reaches only 59 core constants in total, which is why a whitelist is the
right instrument here. Nothing from arithmetic appears.

One weakening is worth stating plainly. Lean lifts an instance's proof fields into
`_proof_N` declarations and compiles `match` into `match_N` auxiliaries, dropping instance
arguments they do not literally use, so an auxiliary's *statement* can fall outside `R`
even when every use of it is inside. An eliminator's `motive` is the clearest case. Inside
such an auxiliary the binder and type checks are skipped and only the constant whitelist
runs, which is still what catches a forbidden recursor.

## Writing a proof

Use `rw`, `calc`, `▸`, `Eq.subst`, `congrArg` and `congrFun` freely: they are Leibniz's
Law. `rfl` proves only `βηδ`-conversions, which `H` proves. Case on a proposition with
`em_cases`, which uses this theory's `em`. Necessitate a closed theorem with
`nec% (theorem_name args)`, never `nec% h` for a hypothesis `h`: that yields `p → □p`
with `p` a variable, which is a form of the Fregean Axiom, not the map's No Pure
Contingency, whose instances are closed pure sentences. Avoid `simp`, `by_cases`,
`by_contra`, `decide` and `tauto`.

## Building

```sh
lake build
```

The toolchain is pinned in `lean-toolchain` and there are no dependencies, so the build
is self-contained and takes about a minute from cold.
