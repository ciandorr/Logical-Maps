# Verification report — 21 September 2026

*Paths.* On the evening of 24 September 2026 the project was rearranged: the metalogical
modules moved from `Classicism/Meta/` to `Classicism/Syntax/`, `Semantics/`, `Results/`,
`Tools/` and `Certified/`, the checkers from `Classicism/` to `Classicism/Tools/`, and the
strict layer to `Classicism/Strict/` (`Strict.lean` became `Strict/Vocabulary.lean`,
`SyntaxSchemas.lean` became `Syntax/SentenceSchemas.lean`). The sections below keep the
paths of their day; `README.md` has the current map.

**29/77 principles defined; 27/208 records proved in Lean; 0 records carry a Lean
certificate. 122 of the library's 124 theorems are theorems of `C⁻`. The strict layer uses
no Logical Equivalence at all: it derives Boolean algebras at every relational type from the
six Boolean Identities, and from all eleven the necessitations of the primitive proof
constants. The transformer, which is Appendix A as an induction on Lean proof terms, turns
every one of the 125 gated theorems into a proof from the eleven axioms, `e`, `e_exists`
and `em`, with no `propext` or `funext`; the 222 theorems it declares all pass the strict
and type audits. No statement quantifies over types: principles are families of formulas
indexed by types, and records are implications between instances.**

## Revision, 25 September 2026: `simp` through the gate

The gate now checks three core theorems at their use site exactly as it checks `propext`
and `funext`: `eq_true`, `eq_false` and `forall_congr`, each of which is `propext` or
`funext` applied to its own hypothesis (`Check.gatedRules`). They are what `simp` leaves in
a proof term (`eq_self` is `eq_true rfl`; rewriting under `∀` is `forall_congr`), and until
now the walk descended into their bodies and rejected every goal-closing `simp`. The type
whitelist admits the eight core constants `simp` emits, and the translator unfolds them at
their use (`Translate.coreUnfolded`) and η-expands a partially applied relational operation,
as `simp`'s congruence lemmas leave it. Verified: `simp only` with closed identities passes
all three checks, at the top level and under `∀` and `∃` (`Tests.simpCloses`,
`simpUnderForall`, `simpUnderExists`); `simp [h]` with a hypothesis is still rejected, as
BF under a binder (`viaSimp`, now naming `forall_congr`) and as the Fregean Axiom at the
top level (`fregeanViaSimp`, new). Two library proofs were rewritten with `simp` as the
demonstration and re-certified: `dia_ne_imp_ne` (derived in `C⁻`) and the Atomicity step
lemma `pin_incl` (the step certifies in four seconds). The strict transformer needed the
same unfolding (`Strict.Transform.coreUnfolded`); with it, the `simp` controls transform
into proofs from the eleven identities. `by_cases`, `decide` and `tauto` remain unusable,
since they reach `Classical.choice`.

**The paper's symbols** (same day): `⊆` for `incl` in `Core.lean`, always on; and in
`Classicism/Paper.lean`, scope `Classicism.Paper`, the paper's own `∧`, `∨`, `¬`, `⊤`, `⊥` at
every relational type, plus `≡` for coextension. The connectives are elaborators that decide
by type, `And`/`Or`/`Not` at `Prop` and the `Rel` operation elsewhere, so a file opening the
scope loses nothing at `Prop`. Elaboration only: every term is unchanged, and the whole
library re-certified without any change to the checks. `Results/Atomicity.lean` is written
in them.

## Revision, 21 September 2026

Existence was moved out of the class `Ty`, which previously carried an `exists_self`
field. That field made `classicism-implies-existence-r` report no axiom dependency at
all, because declaring `e` an `R`-type discharged `e_exists` silently, and it made the
paper's `C⁻` inexpressible, since in `C⁻` the type `e` is an `R`-type whose inhabitation
is unprovable. `Ty` is now a marker class, Existence is the two theorems `existence_rel`
and `existence_e`, and `P.Existence σ` is a family with those two as its instances. The
checker now also reports, per theorem and per module, whether the axioms stay inside
`C⁻`, and `Tests.lean` asserts that split.

Later the same day, seven comprehension and choice records were added (see *What the
second batch tested*), and then the **term-level type-system check** was written, closing
the one hole the earlier report admitted. All 124 theorems pass it. Writing it found two
real laxities in what had already been accepted, both now fixed:

1. **Unguarded type binders.** Several prelude lemmas, and all five type-schematic
   Classicist Identities, were stated as `{σ : Type}` with no `Ty` guard, so they claimed
   instances at every Lean type rather than at the types of `R`. The Identity Identity, for
   example, was being asserted at `σ := Nat`. Sixteen declarations across six files gained
   a `[Ty σ]` binder.
2. **The choice definitions.** `Serial` and `Functional` were likewise unguarded.

Neither affected a proof, but both made statements stronger and wider than the map's
schemata, which is exactly the sort of drift the check is for. The original 20 September
report follows.

**Gate bypass, found and closed the same evening.** The gate recognised `propext`,
`funext` and `Quot.sound` only as the head of an application. Bound to a local name, as in
`have pe := @propext; pe ⟨fun _ => trivial, fun _ => h⟩`, the constant is an argument and
the body applies the variable `pe`, so no gated head is ever seen, and the walk did not
descend into `opaque` bodies at all. Both routes certified the Fregean Axiom `p → p = True`
as a theorem of `C⁻`, and the `funext` alias certified Functionality; the type check caught
the `funext` and `Quot.sound` aliases only by accident of their binder types. The walk now
rejects any bare occurrence of a gated primitive and descends into `opaque`s, which makes
every occurrence in the reachable term graph either checked or rejected. Five negative
controls in `Tests.lean` pin it. The library is unaffected: all 124 theorems still pass.

This is the first stage of the Lean layer. It establishes the setting and the
discipline, and ports a connected fragment of the map to test both. It does not yet
certify anything in the database: every classicism record still reads `lean: none`, and
the map displays no Lean badge. The reason is given under *Certificates* below.

## What was checked

`lake build` elaborates the library and runs `#classicism_audit` over every theorem in
it. The build fails if any theorem depends on an axiom outside
`{propext, Quot.sound, e, e_exists, em}` or applies `propext` or `funext` to a
hypothesis. On this run:

| Module | Theorems | Pass | In `C⁻` |
| --- | --- | --- | --- |
| `Booleanism` | 47 | 47 | 47 |
| `Identities` | 13 | 13 | 13 |
| `Modal` | 18 | 18 | 17 |
| `Order` | 5 | 5 | 5 |
| `Comprehension` | 10 | 10 | 10 |
| `Proofs` | 31 | 31 | 30 |

`Classicism/Tests.lean` additionally asserts that the checker **rejects** nine
deliberately bad proofs: `propext` on a hypothesis (the Fregean Axiom), `funext` on a
hypothesis (Functionality), both together (Extensionality), `Classical.em` (which
reaches `Classical.choice`), `nec%` on a hypothesis (the Fregean Axiom again), the identity
`(p = True) = p`, a `simp` call that rewrites under a binder, `sorry`, and a clean proof
that appeals to a rejected lemma. It asserts that four good shapes are **accepted**:
ζ-Equivalence, ξ, necessitation of a closed theorem, and Leibniz's Law on a hypothesis.

## The strict layer, 21 September

*Since this section was written the derivation has moved to `Classicism/Algebra.lean`, where
it is done for an arbitrary algebra presented by the six identities; `Classicism/Strict.lean`
now restates it at `Prop`. See stage four.*

Stage one of the Appendix A transformer is done. `Classicism/Strict.lean` derives the
Boolean algebra of propositions from the six Boolean Identities alone, under a policy that
bans `propext` and `funext` outright: bounds, complements, idempotence, annihilation,
absorption, a cancellation lemma, associativity of both operations, uniqueness of
complements, double negation and both De Morgan laws. `#classicism_strict_audit` reports
**36/36 strict**, and every theorem's axiom report names only Boolean identities. Not one
uses `em`, because excluded middle is already carried by the two Dissolution identities.
`Tests.lean` proves the same proposition, commutativity of `∧`, twice: once under the gate
and once strictly, and asserts that the strict policy rejects the first.

Three things about this stage are worth recording.

**Associativity is not an axiom.** The six identities are Huntington's postulates, two
commutative operations each distributing over the other with bounds and complements, and
associativity has to be derived. It goes through the cancellation lemma `eq_of_meet_eq`:
two propositions that agree under `p` and under `¬p` are identical, because the cases
recombine by distributivity over `p ∨ ¬p = ⊤`. Associativity of `∧` needs the dual
cancellation lemma, not the same one; the first attempt at deriving it from the `∧` version
was circular.

**The strict layer must keep its own `⊤` and `⊥`.** No axiom mentions Lean's `True`, and an
identity can enter a proof only from an axiom, from `rfl`, from congruence on identities
already held, or from `propext`. So `(q ∨ ¬q) = True` is not derivable strictly and the
library's `□p := (p = True)` cannot be reconstructed. The strict layer therefore uses the
paper's Figure 1 pair, `⊤ := (∀p. p) ∨ ¬(∀p. p)` and its dual. The shape is what pays:
since `⊤` is *some* `q ∨ ¬q` with `q` closed, Dissolution-∧∨ gives `p ∧ ⊤ = p` immediately.
Under the gate this whole issue is invisible, because `True = ⊤` is one unremarkable
Equivalence instance.

**All the tops are identical**, in three lines from Dissolution-∧∨ and Commutativity-∧:
`t_r = t_r ∧ t_s = t_s ∧ t_r = t_s`. That was the first result attempted and the sign that
the stage was tractable.

## Stage two: the `boolean_eq` tactic

`Classicism/Tautology.lean` makes the algebra decide things. `boolean_eq` proves any
tautologous identity between formulas built from atoms by `∧`, `∨`, `¬`, `⊤`, `⊥` and the
paper's defined `imp` and `iff`, emitting only the six Boolean Identities; on a
non-equivalence it names a falsifying assignment. It settles Peirce's law, the `PC`
self-distribution axiom, and four-atom absorption identities, none of which were proved by
hand, and it reproves commutativity, associativity and De Morgan.

The method is Shannon expansion on the atom list, driven by the same cancellation lemma
that gave associativity: to prove `P = Q`, prove it under `a` and under `¬a`, in each case
substituting a bound for `a` so that an atom disappears. The substitution is a second
proof-generating recursion, and its one delicate case is negation, since `l ∧ Q = l ∧ Q'`
does not yield `l ∧ ¬Q = l ∧ ¬Q'` by congruence; `relative_compl`, `l ∧ ¬q = l ∧ ¬(l ∧ q)`,
is the bridge. Cost is exponential in the atom count, which is correct for a complete
method and irrelevant at these sizes.

Two things this stage settled. The strict layer needs the paper's `imp` and `iff` rather
than Lean's `→` and `Iff`: the arrow is primitive and `Iff` is an inductive, and no axiom
connects either to the Boolean structure, exactly as with `True`. And `eq_of_iff_eq_top`,
which turns `(P ↔ Q) = ⊤` into `P = Q`, is four lines once the tactic exists. With it,
Appendix A's `PC` case is closed: any propositional `H`-theorem yields its identity from the
six axioms.

The tactic is untrusted. It hands the kernel a term, so a bug in it produces a rejected
proof rather than a false theorem.

## Stage three: the quantifier cases

`Classicism/Quantifier.lean`, eleven theorems, all strict and all inside `R`: Proposition
A.1 (`∀x.⊤ = ⊤`) and its dual, `UI`, `EG`, `Ref`, and the identities behind `Gen` and
`Inst`. With stage two this covers every base case of the paper's `hardlemma` except `LL`,
`β` and `η`.

**`UI` and `EG` are order facts.** Absorption-∨∀ says `Fy ∨ ∀F = Fy`, which is `∀F ≤ Fy`;
Absorption-∧∃ says `Fy ∧ ∃F = Fy`, which is `Fy ≤ ∃F`. Two lemmas convert an absorption
into an implication identical to `⊤`, each one `boolean_eq` and one rewrite. Neither needs
anything under a binder, since the instances come from the closed axiom by `congrFun`.

**`Gen` and `Inst` come out as identities, not rules.** Distribution-∨∀ *is*
`P → ∀u.Qu = ∀u.(P → Qu)` and Distribution-∧∃ is its dual, so the rules are one-line
corollaries.

**How the paper avoids ξ, and why it matters.** ξ, from `⊢ A = B` to
`⊢ (λv.A) = (λv.B)`, is `funext`, which the strict policy bans. The paper's `hardlemma` is
stated already λ-abstracted, and every step rewrites the target so that one of the eleven
*closed* identities appears applied to arguments, substitutes it by Ref and Leibniz's Law,
and β-reduces. Leibniz's Law is indifferent to depth and to intervening binders, so in Lean
the step is `congrArg (fun G => …G…) closedIdentity`. `Ref` is where this bites: the
Identity Identity gives `(a = a) = ∀X.(Xa ↔ Xa)`, whose body mentions `X`, so reaching
`∀X.⊤` takes six such substitutions under the binder. That is `lam_iff_self_top`, written
out, and it is the pattern stage four automates, as `liftClosed`. Lifting a *function* identity under a
quantifier needs nothing new, as `congrArg (fun F => ∀ x, F x)` does it; what is
unavailable is manufacturing the function identity from a pointwise one.

**Two encoding leaks found and fixed.** The Identity Identity had been stated with Lean's
`Iff`, which the strict layer cannot use for the same reason it cannot use `True`; it now
uses the paper's Figure 1 `iff`, defined in `Classicism/Core.lean` along with `imp`. And
`ref_top` at first reported `propext`, because reaching `Ty (σ → Prop)` ran through the
`Rel` instance, whose identity fields are gated. The type system is now carried by two pure
marker classes, `Ty` and the new `RelTy`, with `Rel` layered on top, so type-system
evidence is free of the gate. The term-level checker flagged the change the moment it was
made, which is what it is for.

## Stage four: the transformer, redesigned 21 September

The first version of the transformer **discarded** the gated argument of each `propext` and
tried to re-prove the identity with decision procedures. That cannot work in general, since
the quantifier and identity fragment has no decision procedure, and it led an earlier
revision of this report to call part of the gap permanent. That diagnosis was an artefact
of the design. Appendix A does not re-prove anything: it is an induction on the given
derivation, one fixed calculation per axiom scheme and per rule. The transformer now does
the same, and the old core is deleted.

What was built and checked:

* `Classicism/Algebra.lean`: the class `BA τ` whose six fields are the Boolean Identities in
  closed form, its instance at `Prop` (the axioms verbatim) and at `σ → τ` (one `congrArg`
  per field), and Huntington's development for an arbitrary such algebra. 42 theorems,
  42 strict. `Classicism/Strict.lean` is now 36 restatements of these at `Prop`.
* `boolean_eq` ported to any `BA τ`, reading Boolean structure under λ-binders. All its
  earlier uses pass unchanged.
* `Classicism/Rules.lean`: the rule lemmas for hypotheses, weakening, implication
  introduction and elimination, negation elimination, `UI`'s Boolean part, and Proposition
  A.3, each for any `BA τ`.
* `Classicism/Primitives.lean`: necessitations of the core proof constants. The
  propositional ones are `boolean_eq` between λ-terms closed by Proposition A.1. `Ref` and
  `LL` are derived λ-closed from the Identity Identity; `∃`-elimination from
  Distribution-∧∃ and `UI`; Existence at `e` from `Ref`, `EG` and the axiom `e_exists`.
* `Classicism/Transform.lean`: the induction. It declares `foo.nec : S' = ⊤` and
  `foo.strict : S'`, with kernel checking forced synchronous so that a rejected proof is an
  error on the spot.

All of these modules pass `#classicism_strict_audit` and `#classicism_types_audit` at build
time. The type check needed one change: `BA` is registered as type-system evidence, and its
arrow instance carries `[Ty σ]`, so that a `BA τ` exists exactly when `τ` is `v̄ → Prop` for
`R`-types `v̄`.

**Coverage after the mirrors, measured at build time by `Classicism/Transformed.lean`: 105 of 125.**
`Booleanism` 47/47, `Identities` 13/13, `Modal` 18/18, `Order` 6/6, `Comprehension` 10/10,
`Proofs` 11/31. The library count rose by one net, because the two `Order` instance laws
were given names (`le_iff_prop`, `le_iff_arrow`) and the class projection `Order.le_iff` is
no longer listed as a theorem to transform. Everything the transformer declares, 182
theorems, passes `#classicism_strict_audit` and `#classicism_types_audit` at build time.

**The class mirrors, 21 September.** `Classicism/Mirror.lean` defines `SRel` and `SOrder`.
`SRel`'s three laws are closed λ-identities. Its instance at `Prop` is three uses of
`boolean_eq` between λ-terms. Its instance at `σ → τ` lifts each law from `τ` by
`congrArg`; the third uses Absorption-∨∀ under the binders and a Boolean lemma, and contains
no `funext`, where the shallow instance has two. `SOrder`'s law at each instance is the
`.nec` the transformer produces from the shallow proof, so nothing about `Order` was proved
by hand. The type check caught two helper lemmas of mine with unguarded type parameters, now
guarded. The transformer gained a registry (`#classicism_mirror`, `#classicism_nec`) and
translation of a theorem's parameters, so that `[Rel τ]` becomes `[SRel τ]`.

A structural fix came with this. The transformer declares its outputs in the module that
runs it, and the audit and the tests both ran it, so generated *definitions* clashed on
import. The outputs now have one home, `Classicism/Transformed.lean`, which both import.

**Principles as families, 22 September.** The outer mode was built and then removed.
Cian's ruling: `□S` for a schema `S` is the family of boxed instances, and "schema A
implies schema B" is a metalogical statement; what belongs in either layer is the
instance-level statement, with the types as parameters, and the shallow layer must
certify nothing the strict layer cannot reach. So every principle is now a family
`P.Name σ τ … : Prop` with explicit type parameters, every record is an implication between
instances naming the types the argument uses, and the type-system check rejects a binder
over a type, guarded or not, anywhere but in the leading telescope of a declaration
(three negative controls pin this in `Tests.lean`). With no schema left, every theorem has
a necessitation, and the boxed records follow by `K`; one is checked in the tests.

The outer mode as built had copied a schema hypothesis as a schema hypothesis, so its
output still quantified over types; the version that would have matched the instance-level
reading, extracting the instances a proof uses, was never built. Its removal deletes the
`Copy` lemmas, `isSchematic`, `copy`, `cfeed`, `ccoerce` and `ensureCopy`, and the
transformer has one mode again. **Coverage is 125 of 125**, and the 222 theorems the
transformer declares all pass the strict and type audits.

Two changes were forced by this. `Exists.elim` is restated through `Prim.exists_rec`,
which the choice record needs. And the type audit now walks a whole module in one pass,
descending into each library constant once, with the heartbeat cap lifted for that pass;
before, each declaration re-walked the library, and the audit of the generated theorems
took longer than a build step is allowed.

**Known limits of the induction itself.** A motive that depends on the identity proof, a
recursor eliminating into data, and a type or instance abstraction inside a formula are
reported and not transformed. The bridge between two readings of one Lean formula handles
agreement up to unfolding, Boolean equivalence, and congruence under a shared connective or
quantifier, and reports anything else. A bare gated `funext` at a relational type other
than `Prop` that does not end in `propext` is not handled. Axiom reports are now coarser:
the six Boolean Identities are bundled in the `BA Prop` instance, so a transformed theorem
reports all six even if it uses one.

## The metalogical layer, 22 September

Begun after the shallow and strict layers were complete. Four modules under
`Classicism/Meta/`, all ordinary Lean (this layer is a theory *of* Classicism's proofs, so
`funext` and the other axioms are available and no audit runs over it): types as the mutual
inductive of *Elimination* Appendix A with decidable equality; intrinsically typed de
Bruijn terms over a signature, with the paper's six logical constants and Figure 1's
abbreviations; renaming and substitution with the identity laws and all four composition
laws proved; β and η as immediate, one-step and equivalence-closed relations, with
conversion `≡` proved a congruence. The examples file checks a β-step by `rfl`.

Then `Derivable Ax Δ p` (`Meta/Derivation.lean`), an inductive relation over an axiom set
with the rules of `H` in natural-deduction form and no special rule; weakening,
monotonicity in the axioms, and the `→`/`↔` rules are proved. `Meta/Axioms.lean` writes the
eleven identities as sentences and defines `C.axiomsMinus` and `C.axioms`. The examples
derive `⊤`, each axiom, `∃F` from `∀F` in a context, `∧`-symmetry from a hypothesis, and
Existence at a relational type from `λx. ⊤`. The definition of `Derivable` is the trusted
base of this layer: what it means for a sentence to be a theorem of Classicism is that
inductive, and nothing else.

Then `Meta/Denotation.lean`: the denotation of types, environments (an inductive family,
after nested pairs proved not reducibly equal to the context's reading and broke every
rewrite), interpretations, and terms; renaming and substitution commute with the
denotation, conversion preserves it, and `Derivable.sound` is proved by induction on the
derivation. The eleven identities are verified in `Prop` one by one, each by `propext` and
`funext`, so `C.Theorem.holds` and `C.consistent` follow. The examples check by `rfl` that
sentences read back are the strict layer's propositions: `⊤` is `Strict.Top`, `→` is
`imp`, and the axioms are the statements of the Lean axioms.

Then the quoter (`Meta/Quote.lean`), the first half of the translator. It builds the
sentence as syntax and elaborates it, so well-typedness is Lean's; and the reflection
theorem is checked by the kernel by `rfl`, so a wrong quotation cannot pass. It caught one
during development: `Term.dia` had been written as `¬□¬`, where the strict layer's `Dia`
is `¬(· = ⊥)`, and seven statements failed to reflect until the definition matched. The
reflection interpretation has domain the Lean type `e` itself, since statements mention
it. Run over the library at build time (`Meta/Quoted.lean`): 90 of 111 strict statements
in `Transformed`, and 16 of 22 in `Mirror`, quote and reflect; every failure is a
parameter of class `SRel` or `SOrder`. Two primitives, `Prim.congr_arg` and
`Prim.congr_fun`, had their codomain guarded by `Ty` rather than `RelTy`, which the type
check had accepted because the arrow's own `Ty` instance was assumed; the quoter refused
them, and they now say `RelTy`.

Then `Meta/Relational.lean`: the relational operations by recursion on the type, the
instances `instSRelDenote` and `instSOrderDenote` on the readings of relational types by
the same recursion, and seven lemmas by induction on the type that reading each operation
back gives the strict layer's. The quoter now sends a class parameter to a variable of
type `RTy` and a class operation to the recursive one, and proves reflection by
`reflect_by_rewriting`, a `simp only` with those lemmas followed by `rfl` for the
unfolding of `⟦t⟧` to `Prop`. A tactic failure is fatal: an earlier version had let an
elaboration error become `sorry` and reported success, which was caught when a residual
goal was printed; `Term.withoutErrToSorry` and a `hasSorry` check now guard it. With this,
**every strict statement quotes and reflects**: 111 of 111 in `Transformed`, 22 of 22 in
`Mirror`.

Then the translator (`Meta/Translate.lean`, with `Meta/Normalize.lean`). A survey of the
strict layer's proof terms found them almost entirely equational, the eleven axioms
entering through the fields of the Boolean-algebra instances, and the natural-deduction
constructors a handful of times; so the translation is Leibniz's Law at a predicate for
each of Lean's identity lemmas, with derived rules `eqCongr`, `eqTrans`, `eqMp` and
β-contracted variants `allEβ`, `substβ`, `eqCongrβ` whose conclusions are stated with
`Term.instantiate`, as Lean's typing of an application substitutes. A cited library
theorem is translated at its instantiation and declared as `c.derivable_n`, weakened
into the context by `Derivable.ofTheorem`, which needed `Derivable.rename`, proved. The
verified normalizer `Term.nf` (β by parallel passes, η by a strengthening that is proved
a section of weakening) gives conversion by reflection, `Conv.of_nf n a b rfl`; an untyped
shadow of the syntax decides where a conversion is needed and with what fuel.

The first derivations checked were `Strict.meet_comm`, `meet_top`, `join_idem`,
`compl_join` and `and_comm_eq.strict`, the last going through the whole strict machinery,
176 specializations of library lemmas among them. Getting there found: a memoization
keyed by context depth rather than context, which reused a quotation under the wrong
binder; the untyped shadow carrying each constant's context, so the same constant under
two binders compared unequal; η-reduction at the quoter, which made the hand-written
axioms mismatch, since `(λpq. p ∧ q)` became `∧`; and the kernel's cost of evaluating the
normalizer, which was the whole cost and was cut ten-fold by giving it exact fuel,
quoting faithfully so that most conversions vanish, using the β-contracted rules, and
evaluating on one side only where the other is normal. What remained cost about a minute
for that theorem, most of it the kernel evaluating substitutions.

Then the library-wide run, which taught three things. A run that printed nothing for an
hour was taken for a runaway and killed, twice; it was only slow, and its progress
lines had gone nowhere, since Lean captures what elaboration prints into the message
log. The audit now appends a line per theorem to a file named by an option, and runs
under a finite `maxHeartbeats`, with `checkSystem` calls in the translator's own loops so
that the limit is felt. Second, the elaborator's own normalization cost, 17 seconds of
that minute, was Meta-level `whnf` evaluating the same substitutions the kernel would;
the shadow now performs `instantiate`, `weaken` and `close` on itself, and that phase
is a second. Third, a micro-benchmark of the kernel found a 40-node substitution costing
17 ms, and the same function written through `Term.rec` directly 1.5 ms: `brecOn` is
what the kernel is slow at. `rename`, `subst`, `prename` and `step` are now defined by
the recursor, with `rfl` equations as their simp set and the structural definitions
kept for the compiler by `implemented_by`; the proofs that unfolded them needed only
the equation names. `absorption_and_exists.strict` went from 120 s to 44 s, the kernel's
share from 109 s to 33 s, with 407 specializations of library lemmas.

The library-wide run on the faster build found, in its first sixty theorems, twelve
failures with one cause: a law of a mirror class — `SRel.and_constP_true`, `coext_refl`,
`SOrder.le_iff`, held as fields and proved once at `Prop` and once at an arrow from the
law at the smaller type — cited at a type *parameter*, which is neither an axiom nor a
theorem. There is no single derivation of such a law; there is one for every object
type, by induction on the type, and the translator now builds it through `RTy.rec`,
the `Prop` instance's proof translated as the base case and the arrow instance's as the
step, with the law at the smaller type as induction hypothesis and any lemma cited
under it taking the hypothesis as a parameter. A first version translated such lemmas in
place instead and thrashed for forty minutes.

The first derivation by induction then failed in the kernel, and the failure was a
design fault: the relational operations were functions on terms by recursion on the
type, and a function stuck at a type parameter is not a node of the syntax, so `close`,
`weaken` and `instantiate` could not pass through it and the kernel could not see
`close S ≡ S`. With Cian's agreement (23 September) `∧_τ` and the other six are now
constructors of `Term`, their recursion the δ-rule of conversion (`Term.unfoldR`,
`Conv.delta`), their reading a recursion on the Lean side, and the bridge to the strict
layer's `SRel` a lemma per operation as before. Every proof over the syntax gained seven
trivial cases. A first attempt put δ into the kernel-evaluated normalizer, where it is
stuck at a type parameter and so useless — a stuck term on one side of `nf n a = b`
matches nothing — so δ stays out of the normalizer: the translator unfolds an operation
at a constructor type itself, by `Conv.delta rfl` under congruences, and the quoters
emit an operation constant only at a type parameter, reading it through the unfolded
instance at a constructor type. After that `SRel.coext_refl_nec.derivable : ∀ τ',
Theorem C⁻ (∀X. coext_τ' X X = ⊤)` checked in two seconds, the first theorem of this
project proved by induction on the structure of a relational type. Reflection over the
library still holds, 111 of 111 and 22 of 22.

The rest of that day went to the cost, and found the architecture. Each derivation was
specializing every cited lemma at the types it was used at, re-deriving the Boolean
identities through the arrow instances' congruence proofs at each type; `ll_lam`, whose
tautology sits three arrows deep, spent hours in the kernel. With the operations now
constants at a type parameter, every class-parametric lemma is translated **once, at
metalogical type parameters**, `BA` joins `SRel` and `SOrder` in the induction on the type, and a
citation applies the one derivation to the object types it needs. The proof term is
walked as a DAG (memoized): `ll_lam`'s is 4,407 nodes shared and 1,516,016 as a tree.
Then three measurements about the kernel: a two-sided `Conv.of_nf n a b` makes it
unfold both sides in step and compare the recursor's minor premises at every level, so
the certificate is always one-sided; comparing a substitution form with another lazily
is its slowest path, so each side of a coercion is bridged to its canonical tree first;
and the normalizer is evaluated only on the subterms that differ, reached by
congruence. Explicit β-certificates for every pass were tried in between and cost more
than any of these, in the elaborator and the kernel both. Results: `and_comm_eq.strict`
17 s (from 73), `absorption_and_exists.strict` 10 s of kernel (from 109), `ll_lam` 17 s
(from hours), the four class laws and the audit's first failures all deriving. Then the
library-wide run on this build: **111 of 111 strict theorems derived**, in eleven
minutes, the slowest 85 seconds. Every theorem of the library now has, kernel-checked,
a shallow proof, a strict proof from the eleven identities, and a derivation in the
metalogical layer's `H` plus the eleven identities as an axiom set, each link produced
by an untrusted program and checked by the kernel.

One Lean point worth recording: a rewrite whose motive's codomain is `Ty.denote D t` fails, since that is
`Prop` only after unfolding, so the formula-level lemmas are stated at `Prop` or applied
through `Eq.mp`.

## Records proved

Twenty results, each stated as the conjunction of its recorded premises implying its
recorded conclusion, with the premises taken as hypotheses rather than as axioms.

Theorems of Classicism (no premises): `classicism-implies-modal-k`,
`-modal-t`, `-modal-four`, `-modalized-fregean`, `-intensionality-r`,
`-modalized-functionality-r`, `-identity-necessary-r`, `-converse-barcan-r`,
`-existence-r`.

Implications: `distinctness-necessary-t-implies-modal-five`, `modal-five-implies-modal-b`,
`modal-b-implies-distinctness-necessary-r`, `barcan-r-implies-barcan-t`,
`necessary-barcan-t-implies-barcan-t`,
`necessary-distinctness-necessary-t-implies-distinctness-necessary-t`,
`extensionality-r-implies-fregean-axiom`, `fregean-axiom-implies-extensionality-r`,
`tractarianism-r-implies-barcan-r`, `functionality-r-implies-tractarianism-r`,
`barcan-r-implies-functionality-r`.

Comprehension and choice, added 21 September:
`rigid-comprehension-r-implies-persistent-comprehension-r`,
`rigid-comprehension-r-implies-inextensible-comprehension-r`,
`rigid-comprehension-r-implies-weak-rigid-comprehension-r`,
`weak-rigid-comprehension-r-implies-persistent-comprehension-r`,
`weak-rigid-comprehension-r-implies-very-weak-rigid-comprehension-r` (retired 8 October 2026, with Very Weak Rigid Comprehension),
`gallin-comprehension-implies-nd`, `functional-choice-r-implies-relational-choice-r`.

## What the second batch tested

The seven records above were chosen to put the setting under load rather than to raise
the count, and three things came out of it.

**The algebraic order is not a triviality at higher types.** The Background defines
`X ≤ Y` as `Y = X ∨_τ Y` and records that it is equivalent to the necessitated,
universally closed pointwise implication. Proving that equivalence, in
`Classicism/Order.lean`, is where the modal prelude earned its keep. Left to right, the
pointwise identities come from the relational identity by Leibniz's Law but then have to
be boxed, which is `NI` and `K`. Right to left, the boxed pointwise implication has to
become an identity again, which is Modalized Functionality, and feeding that needs the
step from `□∀z̄. X[z̄] → Y[z̄]` to `□∀z. □(…)`, which is axiom `4` followed by the
Converse Barcan Formula inside the outer box. The naive route fails exactly where it
should: an *unboxed* pointwise identity gives the relational identity only by
Functionality, which is the principle C lacks.

**There is no induction on the structure of a relational type.** `Rel` is a class, not an
inductive code, so any law whose proof recurses on type structure must be a class field
discharged once per shape. That is how `boxAt`, `incl` and `Order.le_iff` are supplied.
`Order` also had to become a class separate from `Rel`: its arrow instance needs
Modalized Functionality at `σ → τ`, which is proved from the `Rel (σ → τ)` fields, so as
a field of `Rel` it would be circular. This is the main structural cost of the shallow
approach and is what the metalogical layer's inductive types remove.

**Defining the comprehension predicates in unpacked form was the right call.** They are
written with `incl` and `boxAt`, so they need only `Rel τ`, and `persistent_iff_le`,
`weaklyInextensible_iff_le` and `inextensible_iff_le` then *prove* that they agree with
the Background's algebraic wording. Had they been defined algebraically, every
comprehension principle would have had to carry an `[Order τ]` binder, which would be
noise and would formally narrow each schema. `rigid_iff_box_weaklyRigid` confirms the
Background's remark that rigidity is necessary weak rigidity (called very weak rigidity until 8 October
2026, when "weakly rigid" took that meaning).

Otherwise the ergonomics held up. The three definitional-projection records are one line
each, and `gallin-comprehension-implies-nd` is six lines that read like the record's own
prose. No proof in this batch needed a workaround for the Equivalence gate. The only
friction was that `rw` cannot see through a class field's definitional unfolding, so a
hypothesis occasionally needs re-ascribing with `have h' : … := h` first.

**One place the formalisation improved on the record.** The recorded argument for
`functional-choice-r-implies-relational-choice-r` case-splits, saying that *if* the output
type is `e` one should first replace each output individual by its haecceity. The
haecceity detour is in fact uniform: it works at every output type, so no case split is
needed, and the Lean proof takes that route throughout. This was lucky as well as tidier,
because a case split on whether a type is `e` is **not expressible** with marker classes;
had the argument really needed one, this record could not have been done at all.

Each Lean proof follows the argument written in the record. Where the record cites the
paper, the Lean proof is that paper argument; `modal-b-implies-distinctness-necessary-r`
is Prior's, as the record says.

## Scope decisions

- **Existence is kept out of the type system**, so that `C⁻` is the base and the axiom
  shows up only where it is used. `Ty` is a marker class with no inhabitation field;
  `existence_rel` proves Existence at every relational type from the closed term `⊤_τ`
  with no axiom, and `existence_e` is the axiom. An earlier version put the witness in
  `Ty`, which made `classicism-implies-existence-r` report no axioms at all, hid the cost
  in the `Ty e` instance, and left `C⁻` inexpressible, since there `e` is a type whose
  inhabitation is unprovable. Because the schema's proof is not uniform across the two
  shapes of `R`-type, `P.Existence` is written as the conjunction of its two cases rather
  than as `∀ {σ} [Ty σ]`. An instance argument `[Ty σ]` is a parameter and propagates no
  axiom by itself; only instantiation at `e` does.
- **99 of the library's 101 theorems are theorems of `C⁻`.** The audit reports the split
  per module, and `Tests.lean` asserts it for a representative set. The two exceptions
  are `existence_e` and `classicism-implies-existence-r`. All thirteen identity theorems
  are `C⁻`, matching the paper's remark (n. 21) that the biconditionals generating them
  belong to `H⁻`.
- **Excluded middle is an axiom** (`em`), separate from `Classical.em`, whose proof goes
  through `Classical.choice` and so through Functional Choice.
- **`(p = True) = p` and `(p = False) = ¬p` are deliberately absent** from the Boolean
  prelude. Lean proves both, but only by applying `propext` to a hypothesis: they say
  that every truth is necessary, which with a propositional variable is another form of
  the Fregean Axiom, not a theorem of C, and not the map's No Pure Contingency, which is
  the weaker schema restricted to closed pure sentences. Their
  admissible replacements are `Modal.box_not_eq` and `Modal.box_and_eq`, proved by
  Leibniz's Law over closed identities.
- **The eleven identities appear twice.** `Classicism/Identities.lean` proves each by one
  gated use of Equivalence; `Classicism/Axiomatization.lean` states the same eleven as
  axioms, for the strict policy in which `propext` and `funext` are banned outright. The
  `example`s there certify by `type_of%` that each axiom is word for word the statement
  the gated file proves. Nothing in the library proves from the axioms, and the checker
  rejects a proof that does, so the two policies are at present two ways of reading one
  file rather than two developments.

## Remaining barriers

- **The term-level type-system check now exists** and all 124 theorems pass it. It
  enforces that every type is a type of `R`, that every type parameter is guarded by
  a `Ty`, `Rel` or `Order` instance, and that every constant comes from a three-part
  whitelist. Writing it found two real laxities, recorded under the 21 September revision.
  Its one weakening: inside an elaboration auxiliary only the constant whitelist runs,
  because Lean drops instance arguments such an auxiliary does not literally use, so its
  statement can fall outside `R` while every use of it is inside.
- **The metalogical layer translates statements but not yet proofs.** Its syntax,
  `Derivable`, the standard model and the quoter exist, every strict statement quotes and
  reflects, and `C` is proved consistent, but nothing yet connects a strict proof to a
  derivation. The map's other models remain hand-verified, and the Maximalist
  principles are not yet stated.
- **57 principles have no definition**, including every comprehension, choice,
  completeness, infinity, signature and fundamentality principle. Those need the lattice
  apparatus, Frege cardinalities, and the purity side conditions.

## Action models, 23 September

The next project after the translator, at Cian's direction, was models rather than
Appendix A: the map's non-implication records need a model of `C` and an antecedent
refuting the consequent, and a soundness theorem for the class of models, and the paper's
own notion is the *action model* (§"Action models", Appendix "Soundness and
completeness"). `Classicism/Meta/Action.lean` has the definitions and
`ActionSoundness.lean` the soundness half, 1,026 lines together, proved in one session.

Two choices of encoding are worth recording. Cian's outer/inner formulation replaces the
paper's partial interpretation function by a total one: each type has an outer action
defined by recursion from the inner ones (powerset at `t`; at `σ→ρ`, functions from
inner arguments to outer values), the inner action is a subaction of it, the value of a
term is outer, and "model" says the values of terms under inner assignments are inner.
The paper's interpretation is undefined at one place only, an application whose argument
is not inner, and there the outer reading takes a default (`Classical.choice` on the
nonemptiness of `W^e`); in a model the two agree. And the outer domain at `t` is written
through `RTy.rec` as a reducible definition so that it *is* a `Set` to instance search.

What is proved: transport (`sem_push`), renaming, substitution (`sem_subst`, with the
substituted terms' inner elements supplied by the model condition), β, η, δ (by `rfl`:
each constant's reading was written as the reading of its unfolding), conversion; every
rule of `Derivable` (`sound`); the eleven identities and Existence at every arrow of every
action model (`axioms_holds`); hence `theorem_holds` and `theoremWith_holds`. The axioms
used are `propext`, `Classical.choice` and `Quot.sound`, the classical base, which is
right for model theory and irrelevant to the shallow and strict layers' audit since
nothing there imports these modules.

Mathlib was added for this (tag `v4.33.1`, matching the toolchain), as the plan of 22
September had foreseen but never done. At Cian's request there is one copy shared by every
Lean project on the machine: `.lake/packages` is a symlink to `~/lean-packages`, outside
Dropbox and the repository, and `.lake/` is marked ignored for Dropbox. (A first version
put that path in `lakefile.toml` as `packagesDir`, which broke the repository's
continuous-integration build, since the runner cannot create it; the symlink keeps the
configuration free of anything machine-specific.)

Later the same day, at Cian's direction to try some of the map's models and see whether
the system has hidden flaws: `ActionFull.lean` (full action models on any rooted category,
and the theorem `full_isModel` that a full premodel is a model — the one place the paper
says "uniquely determines a full action model" and the formalization has to prove it, by
a combined induction with a second induction on the size of the type subscripts),
`ActionFacts.lean` (the paper's characterizations of `ND_σ`, `BF_σ` and the Fregean Axiom
at an object) and `ActionExamples.lean` (the full M-set models on the idempotent monoid
and the two-element group). Verified against the records: `full-idempotent-monoid`
violates `distinctness-necessary-t`, `barcan-t` (by the paper's (iii), `full_bf_surjective`,
with the "image of the root" predicate as the inner witness) and `fregean-axiom`; `full-involution-group` satisfies
`necessary-distinctness-necessary-r` (and `□BF_σ` at every type, not yet on the record)
and violates `fregean-axiom`. No flaw in the definitions surfaced; the difficulties were
Lean's (bundled morphisms in `Type`, projections of a concrete structure not reducing
syntactically). The axioms used remain `propext`, `Classical.choice`, `Quot.sound`.

Truncation followed (`Premodel.truncate`, with the `rooted` field dropped from `Premodel`
since nothing used it and the paper calls it a convenience): `sem_truncate`,
`isModel_truncate`, `holds_dia`, and `dia_iff_truncate` / `box_iff_truncate`, the facts
the map's `◇`- and `□`-verdicts run through. The readings of the constants had to be
transferred to the truncation one by one, being stuck recursions on the type with the
whole premodel as argument.

Not yet done: the remaining verdicts of those two records and the map's other models.

## Schemas, entailments, and the pipeline, 24 September

At Cian's direction the layer now states the map's arrows: `AxiomSet.Entails`
(`Entailment.lean`), with cut proved by replacing axioms by derivations; the map's
principles quoted into schemas from their strict twins (`Schema.lean`, `Schemas.lean`,
28 of them, each with a `rfl` reflection); and a command that reads a record theorem's
kernel-checked derivation into `P.schema ⟹ Q.schema` (`#classicism_entails`,
`Entailed.lean`). The sentence schemas (No Pure Contingency, Distinctness,
Possibility, maximalization in the paper's official form) are in `SyntaxSchemas.lean`;
`ActionProperties.lean` has the first "holds in every model with this property" fact,
No Pure Contingency in one-object models, from the arrow-independence of pure terms.

The pipeline certifies all 28 record theorems of `Proofs.lean` (three helper lemmas are
skipped as not records). Getting there took three refinements, each a real fact about the
material rather than a bug: a principle with a relational parameter has an `RTy`
parameter in its schema, so the instance's types must be read with the quoter's
`quoteRTy`; a premise cited at a *constructor* type has its relational operations
unfolded there (`coext` at `t` is `↔`), so it matches its schema's instance only up to
δβ-conversion, and the command converts by the translator's `unfoldConv` and `coerce`,
as `citeTheorem` does — which also required the declared quotations to be reducible;
and a conclusion whose types the statement fixes (`Existence e`) or builds from the
parameters (`Existence (σ → t)`) is not the whole schema but a singleton or a family
over the derivation's parameters, and the certificate says so:
`empty ⟹ single (Existence.quoted e)`, `empty ⟹ fun a => ∃ τ', a = Existence.quoted (Ty.rel τ')`.
Every instance's types are now read off the strict statement, never by unification
against the derivation's formulas, which on the comprehension records took over a
minute to fail. Entailments rest on `propext` and `Quot.sound` only. The derivations,
the expensive part, live in `Derivations.lean` so that the entailments and schemas can
change without re-deriving.

## A metalogical proof with object-level steps, 24 September

Cian asked how integral the separate directory and the slow build are to formalizing a
proof that alternates between metalanguage and object language, and for an experiment.
`Classicism/Meta/Atomicity.lean` is the map's arrow "Atomicity (`t`) and BF imply
Atomicity", a metatheorem "for every `n`" with object-level reasoning inside. The step
`Atomicity τ → BF σ → Atomicity (σ → τ)` is proved in the shallow layer with ordinary
tactics; `#classicism_certify` (new, `Schema.lean`) transforms it, derives it, and reads
the derivation as a rule between schema instances, `atomicity_step.rule`; the theorem
`atomicity_of_atomicityT_barcan : P.AtomicityT.schema ∪ P.Barcan.schema ⟹ P.Atomicity.schema`
is an induction on the relational type (`RTy.induction`) whose step cites the rule. The
tools added: the shallow class `Pointwise` with its mirror `SPointwise` (the pointwise
laws at an abstract relational type, which `Rel` lacks), `Atom` and `Atomicity`,
`Theorem.ax`/`ofC`/`mp`, `#classicism_rule`, `#classicism_certify`; the mirror is
registered with the transformer, quoter, translator and type check like `SOrder`.

What is verified: the whole file elaborates without error by `lake env lean` in twelve
minutes, both certifications reporting `propext` and `Quot.sound` only, and the final
theorem type-checking. What is not: the file is not in any library, because writing its
`.olean` does not finish (Lean's export of every declaration's axioms walks each body;
the module holds the derivations of nine lemmas and all they cite; a module with one of
them writes in seconds). Two other things went wrong on the way and are fixed: the
step as one forty-line tactic proof made the translator's process grow to 27 GB
(now nine closed lemmas, which is also the paper's style); and a file that certifies
without importing `Schemas` re-transforms the shallow library in memory (the import is
now required and stated). The translator also restores its memo tables after each nested
declaration. The audits (`Audit.lean`) cover `Pointwise.lean`, `Lattice.lean` and the
two new instances.

The experiment's conclusion, taken with Cian the same day, is to move certification off
the strict layer: a direct translation of gated shallow proofs into `Derivable`, with
`Derivable` defined by Elimination's rule Subst and the axiom set as an index, the
eleven identities becoming Appendix A's theorem. `Meta/README.md` has the design.

## The direct route, 24 September (evening)

At Cian's direction, and for a presentation the next day, the certification was moved
off the strict layer the same evening. The tag `strict-route-final` marks the last commit
of the old route.

*Derivability.* `Derivable` (`Meta/Derivation.lean`) is now `H` closed under
*Elimination*'s rule Subst, with the axiom set as an index and the rule's two premises at
the logical part of that set (`AxiomSet.logical`: Existence at `e`, nothing proper to the
theory), which is what keeps `C + BF` from proving `□BF`. The hole of Subst is a term with
a hole, `Hole Sig Γ σ Γ' τ`, so that it may lie under binders; `Hole.plug`, composition,
renaming and the congruence for conversion are proved, and `substEq`, substitution of
provably identical terms at any depth, by induction on the type, gives ξ. `C.axioms` is
the logical set; the eleven identities are `C.identities`, theorems of the system
(commutativity of `∧` is derived by Subst in `Examples.lean`). Both soundness theorems
carry the new rule through a plug-congruence lemma in each model (`Hole.plug_denote_congr`,
`Premodel.sem_plug_congr`); cut for axiom sets takes the logical side condition. The
readings of types are reducible now, so that `⟦t⟧` is `Prop` to `simp`.

*Translation.* The translator reads gated shallow proofs directly: `propext` is Subst at
`a = ⬚`, `funext` is `substEq` at `f = λv. ⬚`, cited theorems are lifted into the logical
part inside premises, the shallow classes `Rel`, `Order`, `Pointwise` supply the type
inductions, and the recursors of tactic proofs (`Or.casesOn`, `Exists.casesOn`,
`And.casesOn`, `Iff.casesOn`, `False.casesOn`) and the `Iff` combinators are handled;
point-free case branches are η-expanded. The quoter reads the shallow vocabulary, and
reflection of a shallow statement is by rewriting with the readings of the operations as
the shallow classes' and the identifications `(¬p ∨ q) = (p → q)` and the like
(`Meta/Relational.lean`), unfolding the definitions the statement uses. The pipeline
telescopes only the parameters of a statement, since a record's premises are now arrows.

*Checked.* `#classicism_derive_audit` over `Modal`, `Order`, `Comprehension`,
`Pointwise`, `Lattice` and `Proofs` derives **95 of 95 theorems, in nine seconds for the
whole run** (the old route took eleven minutes for the strict library and half an hour
for the records); `modal_K` and `converse_barcan` at build time (`Derived.lean`); the
record theorems quote and reflect (`Quoted.lean`); all 44 principles quote into schemas
from their shallow statements (`Schemas.lean`); `Atomicity.lean` certifies through
`#classicism_certify` with no transform step (its build is reported below). The
strict-layer modules still build and are audited as before; nothing on the route to a
certificate uses them. Three translator gaps the shallow proofs exposed, each a few
lines: a class-law induction must telescope only the class's parameters (the shallow
laws have their own `∀`s where the strict mirrors held closed necessitations); a
hypothesis binder whose codomain mentions the proof only through a motive's redex is
not dependent (`betaDeep`); and the recursors, `Eq.subst` and the `Iff` combinators of
tactic proofs, with point-free branches η-expanded and constants of known arity fed
their extra arguments.

## Intensional action models, 26 September

The action models again in the intensional form of Cian's draft *Boolean Completeness
without Rigid Comprehension*, at his decision, as the form new models are built in:
`Semantics/Intensional.lean` (premodels, readings, `sem`, `Holds`, `IsModel`),
`IntensionalSoundness.lean` (transport and η in every premodel; the Boolean operations
are set operations; substitution, β, δ, conversion; the rules; the eleven identities;
`theorem_holds`, `theoremWith_holds`, `entails_holds`), `IntensionalFacts.lean` (`□`, `◇`,
consistency from a model, the ND/BF/Fregean criteria, truncation), `IntensionalFull.lean`
(full models are models; `BF_σ` forces surjectivity), `IntensionalProperties.lean` (NPC in
every one-object model; propositional fullness refutes the Fregean Axiom),
`IntensionalExamples.lean` (the two M-set models, the same verdicts). `IEnv` moved to
`Semantics/Env.lean` and the sentences `ND_σ`, `BF_σ`, FA to `Syntax/Sentences.lean`,
shared by both forms; the applicative modules are otherwise untouched and keep building.

*Checked.* Every new module builds with no `sorry` and no axiom beyond the classical
three, in a few seconds each; the full project builds (815 jobs).
`Results/Consistency/Consistency.lean` now imports the intensional examples and every
consistency fact and non-theoremhood fact it states, and everything downstream
(`Incompatibilities.lean`, the records' entailments), builds unchanged: the model
facts have the same statements in both forms. The applicative `Consistent.of_model` is
renamed `Consistent.of_action_model`; the intensional one takes the plain name.

*What the port tested.* The claim that the intensional form is easier to reason about
formally holds up where it was expected to: `full_isModel` is two lines instead of three
hundred, the δ-rule is a lemma per operation instead of a reading by recursion on the
type with nothing to prove, transport and η need no model hypothesis, and truncation
transfers the readings by `rfl`. The costs were in elaboration rather than mathematics:
the two spellings of the arguments of a relational type at a variable type (`Args` over
the full actions, and the full arguments by the mutual recursor) are related by an
explicit bijection, and facts about a particular model are stated in the plain form of
its domains, since the model's projections are the plain values only definitionally.

## Appendix D: ideally full models, 26 September (later)

The paper's Appendix D in the intensional form: `Semantics/IdeallyFull.lean` (agreement,
pinning, the finitely pinned subaction, the ideally full domains by the mutual recursor,
`Premodel.ideal`; pinning in any premodel, closed under the set operations and
application; `sem_congr_const`; the induction `sem_pinned`; Proposition D.4 as
`isModel_of_pinned` for any premodel whose inner elements are exactly the finitely
pinned ones, and `ideal_isModel` for the construction), `Syntax/Constants.lean`
(`Term.consts`, finite, so that the model condition is checked over any signature), and
`Models/Permutations.lean`, Part 1: the permutation model, with `box_nd`, `box_bf`,
`not_actuality`, `atomlessness`, `not_atomicityT`, `not_atomicity_t`, each about the
quoted principle. `Results/Consistency/Consistency.lean` gains the facts they give and
`Incompatibilities.lean` the maximalist incompatibilities with `□`Actuality and
`□`Atomicity, two of those the previous audit listed as waiting on models.

*Checked.* Every module builds with no `sorry`; the full project builds; the new
theorems are stated against `P.Actuality.quoted`, `P.Atomlessness.quoted`,
`P.AtomicityT.quoted` and `P.Atomicity.quoted RTy.t` as `Certified/Schemas.lean`
declares them, so a verdict is about the very sentence the map's records name. The
`t`-instance of the type-indexed Atomicity is spelled with `¬_t` and `∨_t`, and its
value in an intensional model is by `rfl` that of the spelling with `¬` and `∨`, which is
how `not_atomicity_t` follows from `not_atomicityT`.

*Where the paper was sketchy and the proof had to choose.* D.4 is proved by induction on
terms rather than through the combinator criterion, and for any premodel first; the
model condition of a term uses only the constants the term mentions, which is what makes
the construction a model over any signature, a point the paper leaves implicit. In Part
1 the paper takes the cut `{h ∈ p | h n = n}`; relative to an arbitrary `k` in `p` (for
Atomlessness) the cut is `{h ∈ p | h n = k n}` and the witness that it is strict is
`swap (k n) m ∘ k` for `m` outside `k[X] ∪ {k n}`, which the paper's "let `h′` be the
function that agrees with `h` except that `h′n = n + 1`" does not quite give, since
`n + 1` may lie in `k[X]`.

## Appendix D: D.6 and Parts 2 to 8, 26 September (later still)

Proposition D.6 in `Semantics/IdeallyFull.lean` (`pullback`, `pullback_pinned`,
`map_pullback`, `ideal_map_surjective`, `ideal_bf_of_surjective`: `BF_σ` at every type
when every arrow out of the base is surjective on individuals); `Models/MonoidModel.lean`,
the ideally full model over any monoid acting on `ℕ` with the verdict lemmas
parametrized by the deciding fact (`not_nd_e_of_not_injective`, `bf_of_surjective`,
`not_bf_e`, `actuality_of_pinned_one`, `not_actuality_of_free`, `atomlessness_of_free`,
`atomicityT_of_singletons`, `not_atomicityT_of_free`); `Models/Monoids.lean`, Parts 2 to
8 as instances, every entry of the paper's table but the Boolean Completeness column;
`Results/Consistency/Consistency.lean`, a section per part with `holdsAx_pos`, `holdsAx_neg`,
`consistent`, and `*_not_theorem` for each failing principle.

*Checked.* Every module builds with no `sorry`; the full project builds (899 jobs). The
verdicts are stated against the quoted principles as before; the packages use
`P.Barcan.schema`, `P.Actuality.schema`, `P.Atomlessness.schema`, `P.AtomicityT.schema`
and `single (Term.neg …)` for the failures, and `npc Signature.pure` for No Pure
Contingency, which `Premodel.holdsAx_npc` gives in every one-object model, so the
necessitated forms are left to `npc_union_entails_box` rather than restated.

*Where the paper was sketchy and the proof had to choose.* The paper's perturbations
"let `h'` agree with `h` except beyond `m`" are made concrete per monoid: for a monotone
surjection `k`, `k ∘ rep m` with `rep m` repeating the value at `m` (monotone and
surjective, and different from `k` because a monotone surjection steps up beyond any
bound, `exists_step`); for a monotone function, `raise k m`, one more beyond `m`; for
Part 5, `k ∘ rep (max m 1)`, so that the perturbation still collapses `0` and `1`. The
paper's Part 7 indexes by the power of two and pins `{fₙ}` by three points; here by the
exponent, and two points suffice (`{2^j - 1, 2^j}`), since an arrow of the monoid fixing
`2^j` and sending `2^j - 1` to `0` is `f_{2^j}`. In Part 6 the paper pins `{gₙ}` by
`{n - 1, n, n + 1}`; `{n, n + 1}` suffices. The `BF_e` failures are all instances of one
lemma, `not_bf_e`, whose test property `λy. ψz → φy` is the paper's "any arrow that
sends `1` to `0` sends everything to `0`" (Part 6), "to an even number" (Part 7), "any
arrow sending `0` to something positive sends everything to something positive" (Part
3, with `ψ = φ = (· ≠ 0)`).

*Not verified, and said so.* The Boolean Completeness column; the remark at the end of
the appendix about two-object variants, which `Models/README.md` analyses without
formalizing, and where it corrects the paper on two points (`ND` and Atomlessness fail
at the base of every such variant).

## Results at every arity, 28 September (night)

`Results/Arity.lean`, with six modal laws added to `Pointwise`, two principles
(`NecGallinExtensionalComprehension`, `NecPlenitude`) and two auxiliary schemas
(`BarcanArgs`, `NecBarcanArgs`) added to `Principles.lean` and quoted, and six routine
records added to `Results/Records.lean`. Twelve records of the map proved at every arity,
listed in `HANDOFF.md` §4a.

*Checked.* The full build passes; every shallow step and shallow core is certified by
`#classicism_certify` (a derivation checked by the kernel, read as a rule between schema
instances) and `#classicism_entails`; the new `Pointwise` laws are derived for every type
by the translator's induction; the metalogical theorems are kernel-checked compositions
of certified entailments (`Entails.trans`, `Entails.union`) and inductions on `RTy`. The
record audits report 157 of 157 derived and 73 of 73 certified.

Later the same night, 38 routine records in `Results/Records.lean` and four more arity
results in `Results/Arity.lean`, with sixteen principles and three `Pointwise` laws
(`HANDOFF.md` §4a); the record audits then report 199 of 199 derived and 111 of 111
certified. Each new principle is the record's `formal` field with its type quantifier made
a parameter; `SAtom` is Bacon's strong atom with `◇_τ W := W ≠ ⊥_τ`, and `BoxNe` the
distinctness-preserving necessity of §2.6, both as the map's Background defines them.

*Choices.* BF over a tuple is stated as `(⊤ ⊆ □X) → □(⊤ ⊆ X)` at the relational type, so
that it needs no tuple syntax, and it is not a map principle: every result that uses it
reaches the map's premises by composing with `barcanArgs_of_barcan` or its boxed form.
Atomicity at `t` in the compositions is the `t`-instance of the type-indexed Atomicity,
not the separate principle `AtomicityT`; `atomicity_of_atomicity_at_t_barcan` is the
Atomicity induction from that instance.

## Proposition 2.11, 28 September

Cian asked (28 September) for Proposition 2.11 with `BF` strengthened to `□BF`, after the
first gap in n. 42 (part (iv) boxes a pointwise claim with `BF` where `□BF` is needed).
Checking the rest of part (iv) turned up a second gap that `□BF` does not close, so the
proposition is not formalized. What is formalized, in `Results/Records.lean` after
Proposition 2.16:

- `lub_haec_le`, `box_lub_haec_of`, `lub_haec_imp`: n. 42 parts (i) to (iii) for `X*`, the
  least upper bound of the haecceities of the `X`s (Boolean Completeness at `σ → t`):
  it is below every property necessary of each `X`; each `X` is necessarily `X*`; with
  Actuality, every `X*` is an `X`.
- `rigid_comprehension_r_of_restriction`: Actuality, Boolean Completeness at `σ → t`,
  `BF` at `σ → t` and the restriction principle give Rigid Comprehension at `σ → t`.
- `restriction_of_box_b`: the restriction principle holds in `C5`.

The restriction principle: for all `p`, `q` there is `r` with `p ≤ (r = q)` and, for all
`s`, `p ≤ (q ≤ s)` implies `r ≤ s`. It is what part (iv)'s `w″` is for, with `p` the
supposition `∀x. X*x → □Yx` and `q` the counterinstance `∃z. X*z ∧ ¬Yz`; stated for
arbitrary `p`, `q` it needs no atoms, and the quantifier over `Y` is boxed with `BF` at
the actual world, so the first gap does not arise.

*The second gap.* Part (iv) takes an atom `w` entailing the supposition and a `w′` that
`w` entails to be an atom below `X*z ∧ ¬Yz`, then says that without loss of generality
`w′` is the GLB of the `p` with `w ≤ (p = w′)`, "if it isn't, let `w″` be that GLB; then
`w″` will also be the GLB of the `p` such that `w ≤ (p = w″)`". The proof then needs `w″`
to be what `w` entails is an atom below `X*z ∧ ¬Yz`, which requires `w ≤ (w″ = w′)`.
Nothing in the premises gives that. A propositional structure where it fails:

- Points `@`, `x`, `y*`, and `n` for each natural number. Propositions: all subsets `J`
  of `{@̂, x̂} ∪ ℕ`, true at `@` iff `@̂ ∈ J`, at `x` iff `x̂ ∈ J`, at `n` iff `n ∈ J`, and at
  `y*` iff `J ∩ ℕ ∈ U`, for a fixed non-principal ultrafilter `U` on `ℕ`.
- `@` sees every point, `x` sees `x` and `y*`, every other point sees only itself; `□J`
  is true at a point iff `J` is true at every point it sees, and is again a proposition
  (take `J ∩ ℕ` on `ℕ`, and `x̂`, `@̂` as the conditions at `x` and `@` require).
- Every point's propositions are atomic modulo necessary equivalence there (at `x` there
  are four classes, fixed by the truth values at `x` and at `y*`); at `@` the propositions
  are all of `𝒫({@̂, x̂} ∪ ℕ)`, so complete; the propositional quantifiers range over the
  same propositions at every point, so `BF` at `t` holds everywhere.
- `w := {x̂}` is an atom at `@`; `w′ := ℕ` is, at `x`, the atom "true at `y*`". The `p`
  with `w ≤ (p = w′)` are the `J` with `x̂ ∉ J` and `J ∩ ℕ ∈ U`; their GLB is `∅`, which is
  not identical to `w′` at `x`. The restriction principle fails for `p := {x̂}`, `q := ℕ` by
  the same computation.

This is only the propositional part: it has not been checked to extend to a model of
Classicism with individuals and all higher types satisfying the premises, so it shows
that the step needs an argument, not that Proposition 2.11 is false.

*Checked.* The module builds; the full project builds, with both audits (the new
theorems are helpers, not records, since the restriction principle is not one of the
map's principles, and are derived in the object language like the rest of the file).

## Vectorization, 1 October

`VECTORIZATION-PLAN.md`, Phases 1 to 7: type variables in the object language, the
vectorization theorem, the list form of every principle with a Ty-parameter and of every
record with one, the equivalence of each principle's restricted and list forms, and the
results at every arity as unary proofs vectorized. It supersedes the auxiliary schemas
`BarcanArgs` and `NecBarcanArgs` of 28 September and the inductions on the type that used
them, which are gone.

*Checked.* What a list-form certificate rests on, each piece kernel-checked:

- **The theorem**, `Derivable.vecG` and its case `C.Theorem.vec`
  (`Syntax/VectorizeDerivable.lean`): an induction on derivations, each rule going to its
  block version (`Syntax/Blocks.lean`). It rests on `propext` and `Quot.sound`.
- **The statements.** `P.listQuoted` is *defined* as the vectorization of `P.quoted` at
  `var 0`, so a list form cannot be mis-stated against its principle. It is stated with
  the readable translation `Term.vec` (`∀x₁ … ∀xₙ`, `a₁ = b₁ ∧ …` on the nose), proved
  convertible to the generic one the theorem is about. `P.listQuoted_single` shows that
  at a one-element list it is the principle, and `Certified/Vectorized.lean` checks three
  list instances by `rfl` against the sentences written out.
- **The generators are untrusted.** `#classicism_schema` (list forms), `foo.listRule` and
  `foo.listEntails` (`Tools/Schema.lean`), and the tactic `classicism_vec_eq` each build a
  term the kernel checks. Where a closed parameter's translation stands unreduced in a
  vectorized sentence, it is rewritten away by a proved lemma (`RTy.vec_closed`,
  `Ty.vec_closed`), not by fiat.
- **Restricted ⇔ list** (`Results/Lists.lean`): `P.schema ⟹ P.listSchema` for the twenty
  principles. Its shallow steps (the two-element forms, the coding of tuples) are
  certified like records, and the inductions on the list are kernel-checked theorems.
  They rest on `propext` and `Quot.sound` only, as do the arity results built on them
  (`Results/Arity.lean`, `Results/Atomicity.lean`).

The full build passes. The record audits report 199 of 199 theorems derived, 110 of 110
records certified as entailments, and 42 of 42 records with a Ty-parameter certified in
list form.

*Phase 9, the same day.* Twelve map results at every arity in `Results/Arity.lean`, each
a composition of kernel-checked list entailments resting on `propext` and `Quot.sound`
only. They come from unary records at `σ → t` (or output `σ' → t`) in
`Results/Records.lean`, and cover Boolean Completeness, Plenitude, Boolean Completeness
with Actuality to Weak Rigid Comprehension, and Actual Profile to Actuality. The record
audits then report:
- 216 of 216 theorems derived and passing the gate and type checks;
- 113 of 113 records certified as entailments;
- 48 of 48 records with a Ty-parameter certified in list form;
- 215 of 216 transformed by the strict transformer, the same one exception as before.

Proposition 2.11 is not proved: Cian reports a countermodel.

*Choices.*
- A type variable is never relational. So the class laws the translator derives by
  recursion on a Rel-parameter's type are never needed at a variable.
- The first Ty-parameter of a principle is the one vectorized. A second (Relational
  Choice's output) is passed as the type variable `var 1` assigned its one-element list,
  so that a principle and a record over the same Ty-parameters vectorize alike.
- A unary result in `C5` takes `□ND` at `t` and gets `□`BF at `σ` inside its proof, so
  its list form needs no list premise.
- Plenitude and Actual Profile reach lists by coding a tuple `x₁ … xₙ` as the object
  `λR. R x₁ … xₙ`, which needs no induction. Plenitude's two-element step would need
  Functionality.

## The map's additions of 25–28 September, 1 October

Nine principles from `zwlgzwlg/Logical-Maps` at 8edffb3 (Transversal, Transversal Choice,
Weakly Inextensible Comprehension, Vicinity, their boxed forms, Modalized Plenitude),
quoted and reflected, and 34 of their results:
- in `Results/Records.lean`, unary where the principle is over relational types, with
  their every-arity forms in `Results/Arity.lean`;
- the four No Pure Contingency results in `Results/SentenceSchemas/Contingency.lean`.

*Checked.* The full build passes. The record audits report:
- 273 of 273 theorems passing the gate and type checks, and derived;
- 143 of 143 records certified as entailments;
- 272 of 273 transformed by the strict transformer, the same one exception as before.

The theorems checked rest on `propext` and `Quot.sound` only.

63 of the 67 records with a Ty-parameter have list forms. The four without cite Relational
Choice with its output at the list's own type, which no single type fills. The map states
Transversal Choice at single types, so nothing needs those list forms.

*Choices.*
- `Equiv(R)` is the map's: reflexive, symmetric and transitive at the evaluation point
  (`P.EquivRel`).
- Where Transversal Choice is derived from Relational Choice, seriality of
  `(UC)y := Cy ∨ ¬∃z. Cz` needs an element of the type. The proofs split on whether the
  type has one: if not, Transversal Choice holds vacuously.

## Strong Atomicity, 1 October

Seven of the map's eight Strong Atomicity results, in `Results/Records.lean`, section
"Strong Atomicity". Five are over relational types: they are proved unary at `σ → t` and
reach every arity in `Results/Arity.lean`. The other two are proved as stated. Not proved: `necessary-strong-atomicity-and-rigid-comprehension-imply-
necessary-bf-t` (Bacon's Theorem 8.2).

*Checked.* The full build passes. The record audits report:
- 295 of 295 theorems passing the gate and type checks, and derived;
- 151 of 151 records certified as entailments, 69 of the 73 with a Ty-parameter in list
  form too (the same four exceptions as before);
- 294 of 295 transformed by the strict transformer, the same one exception as before.

The theorems checked rest on `propext` and `Quot.sound` only.

*Choices.*
- `necessary-strong-atomicity-t-and-necessary-bf-imply-necessary-strong-atomicity` goes
  through a record that is not a map result, `strong_atomicity_t_and_bf_imply_strong_atomicity`
  (Strong Atomicity at `t` and BF at `σ` give Strong Atomicity at `σ → t`), proved under `□`.

## Atomicity folded in, 2 October

`Results/Atomicity.lean` is gone. `atomicity-t-and-bf-imply-atomicity` is now proved like
the other results at every arity: the record at `σ → t` in `Results/Records.lean`, from
the lemmas of Strong Atomicity section (an atom at `t`, pinned at `x` as
`λy. w ∧ y = x`, decides every property and is an atom), certified by the entailment audit,
and at every arity in `Results/Arity.lean`. The boxed step there, `necAtomicity_step`, is
the record necessitated, at `σ → t` rather than at a Rel-parameter, which no use needed.
The conversion from Atomicity at `t` as the instance of Atomicity to the map's
Atomicity at `t` is certified there as a rule (`atomicityT_of_atomicity_at_t`): the two
sentences are not equal by `rfl`.

*Checked.* The full build passes: 297 of 297 theorems of `Results/Records.lean` pass the
gate and type checks and are derived, 152 of 152 records are certified as entailments
(70 of the 74 with a Ty-parameter in list form too, the same four exceptions), and 296 of
297 are transformed by the strict transformer, the same one exception.

## The map's certificates, 2 October

`Classicism/Statements.lean` is written by the map's own generator (`generate_lean_statements`
in `zwlgzwlg/Logical-Maps`, `scripts/pmap.py`, at 8edffb3), run by `map/generate.py` with the
fields of `map/lean.yaml` added; so the statements are the map's, not a transcription of
them. A statement says that every consistent schema, over any signature, that entails the
premises entails the conclusion (or `False`); that is equivalent to the entailment between
the schemas, or to their inconsistency. `Classicism/Map.lean` proves 202 of them, one per
result counted as proved in `MAP-SURVEY.md`, each from the certified entailment it cites.

*Checked.* The full build passes. `scripts/MapIndex.lean` reports the axioms of each
certificate: 193 rest on `propext` and `Quot.sound` only, 6 on `Classical.choice` as well
(consistency facts from models), and 3 on `Classicism.e` and `e_exists` as well (the model in
`Prop`), which the map's list of allowed axioms does not include.

*Choices.*
- The certificate is the object-language entailment, not the shallow proof: the map's
  allowed `propext` is the Fregean Axiom, so a shallow proof passing its check would show
  nothing about `C`.
- The statements quantify over signatures, so that the seven results about
  signature-relative principles can be stated; a pure entailment is carried to every
  signature by `AxiomSet.Entails.ofPure` (`Map.lean`).
- The glue lives in `Map.lean`: carrying an entailment to a signature, assembling the
  premises in any order (`map_premises`), and identifying a boxed principle's schema with
  the box of the principle's (`map_box`).

## Signatures, statements and forms, 2 October (later)

Three changes to the map's Lean side.

- **Principles at every signature** (`Certified/Signatures.lean`). Each map principle is a
  schema at every signature: `P.X.schemaIn` (declared for all 94 schemas and list forms by
  `#classicism_schema_in`), a signature-relative sentence schema at `Σ`, and
  `pureVersion S` for the pure version of one. The `lean_def`s are these. At the pure
  signature `npc` is `noContingency` and `pureB` is `signatureB` (`npc_pure_eq`,
  `pureB_pure_eq`), so No Pure Contingency as `pureVersion noContingency` is the form in
  which `Results/SentenceSchemas/` proves it.
- **No consistency hypothesis.** A result's statement is now "every schema entailing the
  premises entails the conclusion", an incompatibility's "every schema entailing the
  premises is inconsistent". This needs the map's generator to write `False` as the topic
  says (`lean.result.falsum`), part of `map/pmap.patch`, which `map/generate.py` applies in
  memory.
- **Forms**, piloted with Boolean Completeness: `P.BooleanCompletenessLUB` beside the
  official GLB form in `Principles.lean`; both directions in `Results/Forms.lean`, a module
  the record audits now cover; the statement "a schema entails the principle iff it entails
  the form", generated by the second part of `map/pmap.patch`; its certificate in
  `Map.lean`.

*Checked.* The full build passes. `Results/Records.lean`: 297 of 297 theorems pass the
gate and type checks and are derived, 152 of 152 records certified, 70 of 74 in list form
too, 296 of 297 transformed. `Results/Forms.lean`: 6 of 6 theorems pass and are derived and
transformed, both records certified. All 202 result certificates and the form's prove the
regenerated statements; their axioms are as before (193 on `propext` and `Quot.sound` only,
6 also on `Classical.choice`, 3 also on `Classicism.e` and `e_exists`), the form's on
`propext` and `Quot.sound`.

*Choices.*
- The template key is `falsum`, not `false`: YAML reads `false:` as the boolean.
- A form's certificate is named `<principle>.<form>` in `Classicism.Map`, as its statement
  is in `Classicism.Statements`, so forms and results cannot collide.
- `npc` and `pureB` keep their direct definitions (P → □P for each pure sentence of `Σ`'s
  language), which the proofs use; that they equal the pure versions at every `Σ` is proved
  in one direction only, the other needing every pure sentence of `Σ`'s language to come
  from the pure signature.

## The library, and the list forms as forms, 2 October (later still)

- **General lemmas moved to the library** (policy: `HANDOFF.md` §3). 49 lemmas stating
  broadly applicable properties left the results files: 20 laws of `□` and `◇` (with the
  closed propositional lemmas they necessitate) to `Modal.lean`, and 29 facts about the
  order, atoms and bounds, at `t`, at `σ → t` and at a relational type, to `Lattice.lean`,
  which now imports `Pointwise.lean`. Among them reflexivity and transitivity of `≤` at a
  relational type and the GLB/LUB lemmas, from `Results/Forms.lean`. Closed one-step lemmas
  shaped for one proof, and constructions particular to one, stay with their results.
- **The list forms are forms**: the 20 principles whose list form is proved equivalent
  to the restricted one get the list form on the map (Actual Profile, whose official form
  is the list form, gets the single-argument form), with a certificate each in `Map.lean`.
- **Generated declarations have locations**: `#classicism_schema` records, for each
  declaration it makes for a principle (`P.X.quoted`, `P.X.listQuoted`, …), the position
  of the principle's name in the command, so that the index can link a list form to its
  definition.
- **A fix**: `map/generate.py --refs` cut `map/lean.yaml` at the first `lean_ref:`, which
  since the forms is inside a form; the file committed in 903b606 was damaged that way (the
  form's `lean_ref` lost, the results' list under it). It now matches `lean_ref:` at the
  start of a line, and the file is rebuilt.

*Checked.* The full build passes. `Results/Records.lean`: 252 of 252 theorems pass the
gate and type checks and are derived, 152 of 152 records certified, 70 of 74 in list form
too, 251 of 252 transformed. `Modal.lean` 38 of 38 and `Lattice.lean` 47 of 47 theorems
pass. `Results/Forms.lean`: 2 of 2. The 202 result certificates and 21 form certificates
prove their generated statements; `scripts/MapIndex.lean` indexes all 223.

## Modalized Plenitude's list form, and Necessitation, 2 October (later still)

Modalized Plenitude is a theorem of `C` at every list of input types
(`Lists.modalized_plenitude_list`), so its list form is equivalent to it and is a form on the
map. Its record is at output `σ' → t`, where the operation it builds is a meet, so its
vectorization covers every output, not every input list; the input list goes by induction.
The step (`modalized_plenitude_cons`, two inputs, certified as a rule and carried to every
tail by its list rule) uses the tail's instance under the box, which an axiom cannot supply
but a theorem of `C` can: **Necessitation**, `C.Theorem.nec` (`Syntax/Entailment.lean`),
from Subst with `p` and `⊤` each derivable from the other in the logical part. Also
`modal-b-implies-pure-b-r` is certified: `modalB_entails_pureB` proved it but was not
counted.

*Checked.* The full build passes. 203 result certificates and 22 form certificates prove
their generated statements; 3 rest on `Classicism.e` and `e_exists`, as before.

## `boxImp` renamed `incl`; conservativity of `C(Σ)` over `C`, 2 October (night)

`boxImp`, the pointwise implication `λXY. ∀z̄. Xz̄ → Yz̄`, is now `incl` throughout (the
`Rel` field, its laws, `Term.inclR`, `Term.unfoldIncl`, `RTy.inclD`, `inclRead`); nothing
else changed.

**Conservativity** (`Syntax/Conservativity.lean`): a pure sentence derivable in `C(Σ)` from
pure axioms is derivable in `C` from them, for `Σ` whose constants have closed types
(`Signature.Closed`). The proof is syntactic, by induction on the derivation, as
`Derivable.ofPure` is: the derivation is renamed into the context `[e]`, and `Term.elim`
replaces each constant of type `e` by that variable and each constant of a relational type
by a term built from it (`x = x` at `t`, constant functions above); it commutes with
renaming, substitution (when the substitution sends the variable to a variable), the
unfoldings, conversion and holes, and leaves a pure term as it is; then `exE` on Existence
at `e` discharges the variable. A constant of a type variable would have no term to become,
and there the theorem fails (`∃v. v = v` at that type), so the map's statements now range
over closed signatures: `∀ {Sig} (_ : Sig.Closed) (Ax : AxiomSet Sig), …`.

Consequences: `consistent_ofPure_iff`; Possibility and Distinctness (pure) are parts of the
versions for a closed signature, which certifies
`possibility-signature-r-implies-possibility-schema-r` and
`distinctness-signature-r-implies-distinctness-schema-r`; and `npc Σ = pureVersion
noContingency` (`npc_eq_pureVersion`; by `Term.exists_ofPure`, a pure term of any signature
comes from the pure language), likewise Pure B, which settles the "defined twice" point.

*Checked.* The full build passes. 205 result certificates and 22 form certificates prove
their generated statements; 3 rest on `Classicism.e` and `e_exists`, as before.

## The Infinity principles, Countable Boolean Completeness, and two maximalist incompatibilities, 2 October (night)

**Principles.** `Cardinality.lean` holds the Background's finite cardinalities (`ZeroCard`,
`SucCard`, `FiniteCardinality`, impredicatively) and countability (`Ctbl`, into the finite
cardinalities of individuals). `Principles.lean` adds the Axiom of Infinity at `e` and at
`t` in the map's form (no finite cardinality holds of the universal property), Possible
Infinity at each, and Countable Boolean Completeness; their schemas are in
`Certified/Schemas.lean` and their `lean_def`s in `map/lean.yaml` (81 of 97 principles).

**Records** (`Results/Records.lean`, certified by the audits): `axiom-of-infinity-{e,t}-implies-possible-infinity-{e,t}`
(`p → ◇p`); `atomlessness-implies-axiom-of-infinity-t` (a finite cardinality holds only of
properties that leave out, below each possible proposition, a possible one: by the
induction `FiniteCardinality` gives, with Atomlessness in the successor step); and
`boolean-completeness-r-implies-countable-boolean-completeness-r` (`lub_of_glb_ubs`). The
strict transformer cannot bridge the `¬∃` of the Atomlessness one, as with one record
before (254 of 256 transformed).

**Metalogical results.** `possible-infinity-{e,t}-and-no-pure-contingency-imply-axiom-of-infinity-{e,t}`
(No Pure Contingency at the negation of the pure Axiom, and the shallow lemma
`npc_dia_imp`); `possibility-schema-r-implies-possible-infinity-e` (the Axiom of Infinity at
`e` holds in the full Henkin model on `ℕ`, `axiomOfInfinityE_holds_nat`: a finite
cardinality holds only of finite sets); and, item 4 of the night's list,
`maximalist-distinctness-incompatible-with-necessary-functionality-r` and
`-necessary-rigid-comprehension-r`, through instances whose negations are consistent
because they imply refuted ones (`consistent_neg_of_imp`, in `Syntax/Entailment.lean`, with
the records `functionality-r-implies-tractarianism-r` and
`rigid-comprehension-r-implies-boolean-completeness-r` as rules).

*Checked.* The full build passes. Records: 256 of 256 derived, 156 certified as
entailments. 214 result certificates and 22 form certificates prove their generated
statements; 3 rest on `Classicism.e` and `e_exists`, as before.

## Witnessed Possibility and its kin, 2 October (night)

`Syntax/WitnessedPossibility.lean` defines the schemas of a signature with distinct
constants put for the variables of a pure formula, `P[c̄/x̄]` (`Term.atConsts`: the pure
formula, in a block context, read in the signature and substituted by the tuple of
constants): Witnessed Possibility, its converse, Possibly Witnessed Possibility, Logical
Necessity and Modal Freedom, each with the empty tuple included. Nine results are proved in
`Results/SentenceSchemas/WitnessedPossibility.lean`, each instance by one certified
shallow lemma about propositions instantiated at the sentences involved: the three
"implies No Pure Contingency" (the instances with no constants), No Pure Contingency ⇒ the
converse, No Contingency ⇒ Modal Freedom, Witnessed Possibility and No Pure Contingency ⇒
Possibly Witnessed Possibility and ⇒ Logical Necessity, Possibly Witnessed Possibility ⇒
Witnessed Possibility, and Logical Necessity ⇒ Witnessed Possibility. New in the library:
`Derivable.allE₃β` (three quantifiers instantiated by one simultaneous substitution, which
the kernel evaluates; one at a time would weaken the instantiated sentences, which does not
compute) and, in `Syntax/Blocks.lean`, a block at its own variables (`allEBlock_vars`,
`exIBlock_vars`) and the block De Morgan laws.

Not proved: the three incompatibilities of Witnessed Possibility (with No Contingency for
the signature, Signature B, ND), which need a constant: at a signature with none, Witnessed
Possibility says only `P → ◇P`, so as statements over every signature they are false; and
`possibility-signature-r-implies-witnessed-possibility-r`, which needs a variant of
conservativity that turns given constants into distinct variables.

*Checked.* The full build passes. 223 result certificates and 22 form certificates prove
their generated statements; 3 rest on `Classicism.e` and `e_exists`, as before.

## Possibility+, Ordinary Comprehension, the Infinity schemas, Strong Possibility, Separated Structure and Independence, 2 October (night)

Definitions, each a schema at every signature (`Syntax/`): **Possibility+** pure and for a
signature (`PossibilityPlus.lean`; an open formula is consistent when its existential
closure is; for a signature the individual constants of `P` are given as a list that
includes them, which gives an equivalent schema); **Ordinary Comprehension**
(`OrdinaryComprehension.lean`, `∀z̄. ∃X. ∀ȳ. X ȳ ↔ P`); the **Infinity schemas** at `e`
and `t` (`Infinity.lean`); **Strong Possibility**, pure and for a signature, with
`◇_≠p := ¬∃q. q ∧ □(◇q → ¬p)` (`StrongPossibility.lean`); and **Separated Structure** and
**Independence** (`WitnessedPossibility.lean`). 95 of the map's 97 principles have a
`lean_def`; General Separated Structure and the Necessity of Arithmetic do not.

Certified: `classicism-implies-ordinary-comprehension-r` (the witness `λȳ. P`, with
`Conv.appBlock_lamBlock_vars`; two new lemmas about lifts over a block);
`possibility-plus-r-implies-possibility-schema-r` and
`possibility-plus-signature-r-implies-possibility-signature-r` (the instances with no
variables); `possibility-plus-signature-r-implies-possibility-plus-r` (a pure instance read
in a closed signature is an instance for it; its consistency by conservativity); and
`fregean-incompatible-with-infinity-t` (the instance at `n = 3`, refuted by the certified
shallow lemma `fregean_not_three`). `not_consistent_of_imp_neg` moved from `Map.lean` to
`Syntax/Entailment.lean`.

*Checked.* The full build passes. 228 result certificates and 22 form certificates prove
their generated statements; 3 rest on `Classicism.e` and `e_exists`, as before.

## Possible Infinity and BF, 2 October (night)

`possible-infinity-t-and-bf-t-imply-axiom-of-infinity-t` and
`possible-infinity-e-and-bf-imply-axiom-of-infinity-e`, from the map's write-up, schematic
in the type: `Cardinality.lean` now has its two lemmas (finite cardinalities respect
coextension; under BF a finite count is necessary, of a property including the one
counted), each by the induction `FiniteCardinality` provides, and `Results/Records.lean`
the theorem at a type and the two records. `Cardinality.lean` joins the library audits (5 of
5 theorems in C⁻, inside R).

*Checked.* The full build passes. Records: 259 of 259 derived, 158 certified as
entailments. 230 result certificates and 22 form certificates prove their generated
statements; 3 rest on `Classicism.e` and `e_exists`, as before.

## The map's signatures, 2 October (night)

The statements now range over `Signature.Admitted` signatures: closed, and, the
Background's standing assumption, with at least one constant of a type other than `e`
("each of these schemata holds trivially when Σ is empty"). The three certificates that use
the hypothesis take its first half (`hS.1`). The full build passes.

## What a constant of the signature excludes, 2 October (night)

With the Background's standing assumption in the statements (a constant `c` of a type
`ρ ≠ e`, closed, so relational), four incompatibilities are proved
(`Results/SentenceSchemas/Constants.lean`): Witnessed Possibility with ND, with No
Contingency for the signature, and with Signature B; and Separated Structure with ND. Each
object-level argument is a shallow lemma at a relational type, certified once and
instantiated at `c`, read at `ρ` through the equation `typeOf c = ρ`; the pure formulas
(`x = ⊤_ρ`, `x ≠ ⊤_ρ`) and closed terms (`λx. x`, `λx. ⊤_ρ`, `λx. x ≠ ⊤_ρ`, `λx. ⊤`) are put
at the constant's type through the same equation, and the casts carried out by lemmas
proved by `subst`. New in the library (`Syntax/Inhabited.lean`): a universal over a closed
type with a body not mentioning its variable gives the body (an inhabitant: `⊤_ρ`, or
Existence at `e`), and hence `⊤_ρ ≠ ⊥_ρ` at every closed relational type, by induction on
the type. One nested necessitation (`nec%` inside `nec%`) did not translate; it was split
into a lemma (`eq_top_not_dia_ne`).

*Checked.* The full build passes. 234 result certificates and 22 form certificates prove
their generated statements; 3 rest on `Classicism.e` and `e_exists`, as before.

## Counting at every type: Countable Boolean Completeness and Necessity of Arithmetic, 16 October

Both principles had fixed Goodsell's number type at `(e → t) → t`. They are now schemas in the
type `σ` whose finite cardinalities are the numbers.

**Principles.** `Ctbl σ X` (`Cardinality.lean`) injects `X` into `FiniteCardinality` at
`σ`; `CountableBooleanCompleteness σ τ` and its boxed form (`Principles/Lattice.lean`) take
`σ` as a second type parameter, which `#classicism_schema` reads as a second schema
parameter, as for Relational Choice. The three records in `Results/Records/Infinity.lean`
take `σ` and keep their proofs; `#classicism_entails` already allows a conclusion parameter
that no premise mentions.

**Necessity of Arithmetic.** `Arith.zero`, `suc`, `N`, `Sum` and `Prod`
(`Certified/Arithmetic.lean`) take `(σ : Type) [Ty σ]`. `#classicism_quote_term`
(`Tools/QuoteTerm.lean`) now accepts leading type parameters, as `#classicism_quote` does:
`foo.term : (σ' : Ty) → Term …` and `foo.reflect`, at every `σ'`, that the term denotes
`foo (⟦σ'⟧)` over the domain `e`, checked by `rfl` or the same rewriting. `Ty.nu`, `numCtx`,
`ATerm.toTerm`, `AForm.toTerm` and `arithI` take `σ : Ty`, and `necessityOfArithmetic` is
the union over closed `σ`. The closed-types lemmas, before by `rfl`, are by `simp` from
`σ.Closed`; `npc_entails_necessityOfArithmetic` is otherwise unchanged.

*Checked.* The full build passes. The five certified records that mention the two principles
(`boolean-completeness-r-implies-countable-boolean-completeness-r`, its boxed form,
`necessary-countable-boolean-completeness-r-implies-countable-boolean-completeness-r`,
`no-pure-contingency-and-countable-boolean-completeness-imply-necessary-countable-boolean-completeness`,
`no-pure-contingency-implies-necessity-of-arithmetic`) prove their regenerated statements;
341 of 577 results verified in all. `lean-check` still reports the 26 model records that
claim `lean: stated` without a generated statement, unchanged by this work.

## Varieties of necessity defined, 16 October

The eleven principles added on 14 October (Truth, 5-necessity, two-hat necessity and
ND-necessity compared, and their boxed forms, including `□`Truth implies ND-necessity) had no
`lean_def`, so no model with a verdict on one of them had a generated statement and
`lean-check` failed on 26 model records claiming `lean: stated`.
`Principles/Schematic.lean` now defines, beside `BoxNe`, the hat of an operator (`Hat`),
two-hat necessity (`BoxHH`, the hat of `BoxNe`), S5 operators (`S5Op`: necessarily N, K and B)
and 5-necessity (`Box5`), as in the Background, and the eleven principles from them; all are
quoted by `#classicism_schema` (142 schemas).

*Checked.* The full build passes and `lean-check` reports OK: 132 of 132 principles defined,
577 of 577 records with generated statements (the 26 model records among them), 341 proofs
verified; no claim fails.

## Certificates

No record's `lean` field was changed; all 208 remain `none`. Two things have to happen
first, and both are outside this topic's directory:

1. `pmap lean` generates `<lib>/Statements.lean` from the records, so that a proof
   inhabits a machine-written statement and cannot drift from the recorded claim. Its
   generator is specific to the unbounded-utility framework: it emits
   `∀ {O} [MeasurableSpace O] [LinearOrder O] (P : Pref O) [P.Regular]` for every
   statement. Generalising it to a per-topic statement shape is a change to
   `scripts/pmap.py`, shared tooling.
2. `pmap lean-check` is what may set `lean: verified`, and it is reached only through
   `lean_lib` in `topic.yaml`, which this topic deliberately does not yet set, precisely
   so that the broken generator is not run.

So the twenty-seven record theorems here are proved and audited, but they are not yet
certificates in the database's sense, because the statements they prove are hand-written
rather than generated from the records. The statements were checked against the records by hand and
by name; that is the current level of assurance, and the report says so rather than
claiming more.
