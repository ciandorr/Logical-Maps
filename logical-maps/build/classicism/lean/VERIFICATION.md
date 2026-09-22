# Verification report — 21 September 2026

**29/77 principles defined; 27/208 records proved in Lean; 0 records carry a Lean
certificate. 122 of the library's 124 theorems are theorems of `C⁻`. The strict layer
derives the Boolean algebra of propositions from six axioms and Appendix A's `PC`, `UI`,
`EG`, `Ref`, `Gen` and `Inst` cases from all eleven, in 49 theorems that use no Logical
Equivalence at all. The transformer re-proves 35 gated theorems from the eleven axioms.**

## Revision, 21 September 2026

Existence was moved out of the class `Ty`, which previously carried an `exists_self`
field. That field made `classicism-implies-existence-r` report no axiom dependency at
all, because declaring `e` an `R`-type discharged `e_exists` silently, and it made the
paper's `C⁻` inexpressible, since in `C⁻` the type `e` is an `R`-type whose inhabitation
is unprovable. `Ty` is now a marker class, Existence is the two theorems `existence_rel`
and `existence_e`, and `P.Existence` is the conjunction of the schema's two cases. The
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
out, and it is the pattern stage four must automate. Lifting a *function* identity under a
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

## Stage four: the transformer

`Classicism/Transform.lean`. `#classicism_transform foo` re-proves a gated theorem from the
eleven axioms, declares the result as `foo.strict`, and reports its axioms.

It does not interpret the gated argument as an `H`-derivation. Because the kernel checks
the output, it suffices to *re-prove* each identity strictly, so each `propext` argument is
discarded and the identity handed to the decision procedures: first a search among the
eleven axioms, applied to arguments through a `congrFun` chain where needed, then
`boolean_eq`. Appendix A guarantees this can always succeed; the transformer supplies the
certificate case by case. One implementation point cost a cycle: obligations must be
discharged in the local context where they arise rather than left as holes, since a hole
filled after the walk had abstracted the surrounding binders would dangle.

The eleven identities are the satisfying case. `Classicism/Identities.lean` proves each by
one gated use of Equivalence, and transforming those proofs returns the axioms they
duplicate: `Identities.commutativity_and` becomes a theorem whose whole axiom report is
`[commutativity_and]`. Fourteen transforms run as regression tests in `Tests.lean`.

### The result overturned my expectation

Across the library: **35 transform, 30 are already strict, 61 do not.** Of those 61:

| cause | count |
| --- | --- |
| mentions `True`, `False`, Lean's `→` or Lean's `Iff` | 51 |
| needs the λ-level tactic | 3 |
| other | 7 |

I had expected the λ-level tactic to be the bottleneck. It blocks three theorems. The real
obstacle is **vocabulary**: no axiom mentions `True`, Lean's arrow or Lean's `Iff`, so an
identity mentioning any of them is unreachable strictly rather than merely unproved, and
since the library defines `□p` as `p = True`, every modal theorem inherits it.

### Translation in the transformer, not a rewrite of the library

My first reading of that was that the library should be restated in the paper's
vocabulary. That was wrong, and Cian's suggestion is better: the *transformer* translates
the statement. `translate` maps `True ↦ ⊤`, `False ↦ ⊥`, `Iff ↦ iff`, `Box ↦ Strict.Box`,
`Dia ↦ Strict.Dia`, and a non-dependent arrow between propositions to `imp`, leaving
predicate types alone; the translated statement is then proved from scratch. The shallow
layer stays idiomatic Lean, so tactics written for that setting keep working, and the
bridge lives in one place. With translation:

| module | direct | after translation | already strict | still open |
| --- | --- | --- | --- | --- |
| `Booleanism` | 20 | 22 | 1 | 4 |
| `Identities` | 11 | 0 | 0 | 2 |
| `Modal` | 2 | 0 | 6 | 9 |
| `Proofs` | 2 | 0 | 14 | 11 |

Every one of Booleanism's `True`, `→` and `Iff` lemmas transforms, including
`imp_eq_not_or`, `contrapos_eq` and `iff_eq_and_imp`.

Note that the strict theorem carries the translated type: `and_true_eq.strict` is about
`p ∧ ⊤`, not `p ∧ True`. The pair are related by Figure 1's definitions rather than by
Lean-level identity, and the translated statement is the paper's own.

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


`LL`, `β` and `η` remain among Appendix A's base cases; `β` and `η` are free in Lean, being
definitional.

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
`weak-rigid-comprehension-r-implies-very-weak-rigid-comprehension-r`,
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
discharged once per shape. That is how `boxAt`, `boxImp` and `Order.le_iff` are supplied.
`Order` also had to become a class separate from `Rel`: its arrow instance needs
Modalized Functionality at `σ → τ`, which is proved from the `Rel (σ → τ)` fields, so as
a field of `Rel` it would be circular. This is the main structural cost of the shallow
approach and is what a deep embedding would remove.

**Defining the comprehension predicates in unpacked form was the right call.** They are
written with `boxImp` and `boxAt`, so they need only `Rel τ`, and `persistent_iff_le`,
`weaklyInextensible_iff_le` and `inextensible_iff_le` then *prove* that they agree with
the Background's algebraic wording. Had they been defined algebraically, every
comprehension principle would have had to carry an `[Order τ]` binder, which would be
noise and would formally narrow each schema. `rigid_iff_box_veryWeaklyRigid` confirms the
Background's remark that rigidity is necessary very weak rigidity.

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
  enforces that every type is a type of `R`, that every bound type variable is guarded by
  a `Ty`, `Rel` or `Order` instance, and that every constant comes from a three-part
  whitelist. Writing it found two real laxities, recorded under the 21 September revision.
  Its one weakening: inside an elaboration auxiliary only the constant whitelist runs,
  because Lean drops instance arguments such an auxiliary does not literally use, so its
  statement can fall outside `R` while every use of it is inside.
- **No deep embedding yet.** There is no inductive syntax, no `Derivable`, and no
  translation of a shallow proof into a derivation. Consequently nothing here can state
  a Maximalist principle, which quantifies over syntax, and nothing here supplies model
  evidence. The models on the map remain hand-verified.
- **57 principles have no definition**, including every comprehension, choice,
  completeness, infinity and signature principle. Those need the lattice
  apparatus, Frege cardinalities, and the purity side conditions.

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
