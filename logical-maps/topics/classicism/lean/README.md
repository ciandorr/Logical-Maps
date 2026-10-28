# Classicism in Lean

> This directory is a self-contained Lake project, the Lean side of the *Classicism* topic
> of the Logical Maps: run `lake build` from here. It was developed here until 21 September
> 2026, in the repository `zwlgzwlg/Lean-Classicism` (as `Cian/`) until 4 October, and is
> now back. Paths of the form `topics/classicism/…`, and the record and principle ids named
> in docstrings, refer to this topic. How the map uses it: `map/README.md`. The working
> notes cited in places (`HANDOFF.md`, `VECTORIZATION-PLAN.md`, `MAP-SURVEY.md`, `TODO.md`)
> are kept privately, outside this repository.

A formalisation of Bacon and Dorr's **Classicism** inside base Lean 4, with no Mathlib
in the shallow and strict layers and none of Lean's own classical axioms taken for
granted there. (The metalogical layer's model theory imports Mathlib; see Building.) The point is that the fit is
exact rather than approximate: Lean's three axioms are three principles of this map, and
removing them leaves a system in which Classicism can be stated and its theorems proved.

| Lean axiom | Principle on the map |
| --- | --- |
| `propext` | Fregean Axiom |
| `funext` (via `Quot.sound`) | Functionality |
| `Classical.choice` | Functional Choice, and more |

None of the three is a theorem of Classicism, so none may be used freely.

## The shape of the project

| layer | what it does | where |
| --- | --- | --- |
| **shallow** | states and proves theorems of Classicism in ordinary Lean, under a *gate* admitting `propext` and `funext` only with closed arguments | `Classicism/*.lean`, `Results/Records.lean` |
| **metalogical** | makes the object language, its derivations and its models into objects of Lean, for statements *about* Classicism; its translator turns a gated shallow proof into a kernel-checked derivation of the object language | `Syntax/`, `Semantics/`, `Results/`, with the tools in `Tools/` and their outputs in `Certified/` |
| **strict** | re-proves every theorem from the eleven closed identities alone, by a transformer carrying out Appendix A on Lean proof terms: the exploration of how the paper's type system sits inside Lean's, no longer on the route to certification | `Strict/`, with its own README |

The directories separate the mathematics from the metaprogramming, and within the
mathematics keep the metalogic next to the object level it is about:

```
Classicism/            the theory in Lean: its vocabulary, the discipline, a library of its theorems, the map's principles
Classicism/Syntax/     the object language as an object of Lean: terms, conversion, derivability
Classicism/Semantics/  its models: the reading in Prop, action models, the map's models
Classicism/Results/    the map's arrows, proved: the shallow records, their every-arity forms, SentenceSchemas/ (the results about the sentence schemas) and Consistency/ (consistency facts from the models)
Classicism/Tools/      the checkers, the quoter, the translator, the pipeline, and their audits
Classicism/Certified/  the pipeline run at build time: the map's records as certificates
Classicism/Strict/     the strict layer: Appendix A on Lean proof terms, reading the proofs above
```

A `Models/` directory, for theorems about particular models that verify the map's claims
about them, is the next to come; for now those live in `Semantics/ActionExamples.lean`.

Each is held to what it claims by a check that runs at build time. No statement quantifies
over types, so every theorem is a formula of the paper's language with type parameters,
which is what lets the metalogical layer read it.

Lean's remaining rules for `→`, `∀`, `∧`, `∨`, `¬`, `↔`, `∃`, `=`, `True` and `False` are the
rules of the paper's `H`, short of two things, which this library adds as axioms:
excluded middle (`em`), and `∃ x : e, x = x` (`e_exists`), since Lean allows empty types
and `H` proves Existence at every type.

## The theory in Lean

The files at the top of `Classicism/` are the **shallow layer**: Classicism as a theory in
Lean, everything in them available to a shallow proof and audited by the gate. They are
three things, in order of dependence.

*The vocabulary and the discipline.* `Core.lean` fixes the language: the type `e` of
individuals, `Prop` as the type `t` of propositions, the classes `Ty` and `Rel` that say
which Lean types are types of the paper's system `R` and supply the pointwise operations
at a relational type, `□` and `◇`, and the two axioms `em` and `e_exists`.
`Equivalence.lean` is the discipline: the gate that admits `propext` and `funext` only
with closed arguments, which is exactly the rule of Equivalence (and ξ) and nothing more,
and the `nec%` macro for necessitating a closed theorem.

*A library of theorems of Classicism*, of the kind any shallow proof draws on.
`Booleanism.lean` has the propositional and quantifier identities as they are used, in
`rw` form; `Identities.lean` the paper's eleven closed identities in λ-form, each an
instance of the gate; and `Pointwise.lean` the class `Pointwise`, what can be said about
the pointwise operations at an abstract relational type. The rest of the library is in
`Background/`, one module (or two) per page of the map's Background, whose lemmas cite
it: `Framework.lean` (Existence, Ordinary Comprehension), `Necessity.lean` (the modal logic
of the defined box — `K`, `T`, `4`, the Necessity of Identity, the Converse Barcan Formula,
Intensionality and its corollaries), `Order.lean` (the algebraic order `≤_τ` and its
equivalence with the boxed pointwise implication, as the class `Order`) and `Lattice.lean`
(the order laws and the lattice predicates such as `Atom`), `Atoms.lean` (atoms decide),
`Rigidity.lean` (persistence, inextensibility and the rigidity variants) and
`RigidityClosure.lean` (haecceities, unions, images), `Varieties.lean` (the chain
`□ ≤ □_≠ ≤ □̂̂ ≤ □₅`), `Relations.lean` (well-orders, Modalized Plenitude) and
`Arithmetic.lean` (finite cardinalities). Lemmas that a single record needs stay beside it
in `Results/Records/`. The three classes `Rel`, `Order`,
`Pointwise` share a design: a law that holds by recursion on the structure of a
relational type is a field, proved once at `Prop` and once at `σ → τ`, since the shallow
layer has no induction on types (the metalogical layer does, and derives each such law
for every object type from those two proofs).

*The map's principles.* `Principles/` states each principle of the Logical Map as a
proposition with its types as parameters, `Barcan σ`, `Atomicity τ`, in the map's own
formal wording, one file per category of the map. Each principle's equivalent forms (the
map's variants: its dual, its LUB form) are defined beside it, with the two directions of
the equivalence, `P.Barcan.to_dual` and `P.Barcan.of_dual`. The records that relate the
principles — the map's arrows — are proved in `Results/Records/`, one theorem per record,
a file per topic, and it is those theorems, together with the metalogical results beside
them, that the pipeline certifies.

## C and C⁻

Dropping `e_exists` leaves the paper's `C⁻`, that is `H⁻` plus Classicism, which proves
the great majority of the paper's theorems. The library is arranged so that this line is
visible per theorem rather than global: **Existence is not built into the type system.**
The class `Ty` is a marker with no inhabitation field, so declaring `e` an `R`-type costs
nothing, and Existence is instead two theorems. `existence_rel` (`Background/Framework.lean`) covers every
relational type, witnessed by the closed term `⊤_τ`, and needs no axiom.
`existence_e` is the axiom. Consequently a theorem's `#print axioms` report names
`e_exists` exactly when the theorem really uses it.

Were inhabitation folded back into `Ty`, `C⁻` could not be expressed at all, since there
`e` is a type whose inhabitation is unprovable, and `existence-r` would come out as a
triviality rather than a theorem with a stated cost. Note that an instance argument
`[Ty σ]` is a parameter, so it never propagates an axiom by itself; only instantiating at
`e` can do that.

`#classicism_audit` reports the split, and `Classicism/Tools/Tests.lean` asserts it with
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
only instances are `e`, `Prop` and arrows into relational types. So the map's `∀ᵀʸ σ` is
a parameter `(σ : Type) [Ty σ]` of a declaration, a **Ty-parameter**, and a principle over
relational types takes a **Rel-parameter** `(τ : Type) [Rel τ]`.

**No formula quantifies over types.** A principle of the map is a family of formulas
indexed by types, its instances, and it is stated as exactly that: `Functionality σ τ` is a
formula once `σ` and `τ` are fixed, and there is no proposition `∀ {σ τ}, Functionality σ τ`.
A record about principles is an implication between *instances*, with the types the
argument needs as parameters, which the paper reads as a metatheorem. The type check
enforces this: a binder over a type, guarded or not, may be a parameter of a declaration
and nothing else. It is what keeps everything the shallow layer certifies within reach of
the strict layer, since a formula with type parameters is what Appendix A's induction
handles, whereas a quantifier over types has no algebra to live in. `Ty` carries no
inhabitation claim, for the reason given above; Existence at `e` and Existence at a
relational type are two instances of one family, with different proofs.

Because `Rel` is a class and not an inductive code, **there is no induction on the
structure of a relational type.** Anything whose proof recurses on that structure has to
be a class field, discharged once per shape. That is how `boxAt`, `incl` and the order
law `Order.le_iff` are supplied. `Order` has to be a class of its own rather than another
`Rel` field, because its arrow instance needs Modalized Functionality at `σ → τ`, which
is proved *from* the `Rel (σ → τ)` fields; as a field it would be circular. This is the
main structural constraint the shallow layer imposes, and the metalogical layer, whose
types are an inductive, is what lifts it.
`Rel` also carries the pointwise Boolean structure that the paper writes with type
subscripts, and two closed identities that let Intensionality be proved uniformly at
every relational type. `Ty` is declared in `Type` rather than `Prop` so that an instance
argument is type-system evidence rather than a hypothesis, which matters to the gate.

## Names: principles, instances and schemas

One name, such as Functionality, labels objects in both layers. In the words this
project uses:

* a **principle** is the shallow definition, a family of formulas indexed by types:
  `P.Functionality σ τ` for Lean types `σ`, `τ` that stand for object types;
* an **instance** is one member of the family: in the shallow layer the Lean proposition
  `P.Functionality σ τ`, in the metalogic the sentence `P.Functionality.quoted σ' τ'`;
* a **schema** is an axiom set, a set of sentences (`AxiomSet`): the two words are
  synonyms (Cian, 2 October), as in the paper. The schema of a principle is the axiom set
  of all its instances, `P.Functionality.schema`. Schemas are what the map's arrows
  relate, and not every schema comes from a principle: the map's principles that are
  schematic in a *sentence* rather than a type — No Pure Contingency, Distinctness,
  Possibility and their kin — are formalized directly as **sentence schemas**, defined by
  a condition on sentences (`Syntax/SentenceSchemas.lean`). So a node of the map always
  has a schema, and has a principle in this project's sense only when it is indexed by
  types.
* **at every signature** (Cian, 2 October): each of the map's principles is a schema at
  every signature `Σ`, a function from signatures to schemas
  (`Certified/Signatures.lean`). A principle indexed by types gives its instances read in
  `Σ`'s language (`P.X.schemaIn`); a signature-relative sentence schema is taken at `Σ`
  (`noContingency Σ`); the pure version of one is its schema at the pure signature read in
  `Σ`'s language (`pureVersion noContingency` is No Pure Contingency). The principles' own
  declarations and the proofs about them stay at the pure signature: a pure derivation is
  one in every signature, so a pure entailment holds at every `Σ`.

| name | layer | type | what it is |
| --- | --- | --- | --- |
| `P.Functionality` | shallow | `(σ τ : Type) → [Ty σ] → [Rel τ] → Prop` | the principle: for Lean types standing for object types, the instance as Lean states it |
| `P.Functionality.quoted` | metalogic | `Ty → RTy → Sentence Signature.pure` | the instance at object types, as a sentence |
| `P.Functionality.reflect` | both | the quoted sentence, read in `Prop` with domain `e`, is `P.Functionality` at the types it denotes | the check on the quoter |
| `P.Functionality.schema` | metalogic | `AxiomSet Signature.pure` | all the instances at closed types: the axiom set |
| `foo`, e.g. `Proofs.barcan_r_implies_functionality_r` | shallow | `∀ {σ τ} [Ty σ] [Rel τ], P.Barcan σ → P.Functionality σ τ` | a record's proof, under the gate |
| `foo.derivable` | metalogic | `∀ σ' τ', Theorem C.axioms (imp (P.Barcan.quoted σ') (P.Functionality.quoted σ' τ'))` (in `C⁻` where the proof is) | the translated derivation |
| `foo.rule` | metalogic | the same, as `C.Theorem` | for a shallow core certified by `#classicism_certify`, the derivation as a rule between instances |
| `foo.entails` | metalogic | `P.Barcan.schema ⟹ P.Functionality.schema` | the map's arrow, between schemas |
| `P.Functionality.listQuoted` | metalogic | `List Ty → RTy → Sentence Signature.pure` | the list instance: `quoted` at the type variable `var 0`, vectorized along `0 ↦ σs` |
| `P.Functionality.listSchema` | metalogic | `AxiomSet Signature.pure` | the list form: all list instances at closed types, the empty list included |
| `P.Functionality.listQuoted_single` | metalogic | `listQuoted [σ] τ = quoted σ τ`, for closed `τ` | at a one-element list, the principle |
| `P.Functionality.listSchema_entails_schema` | metalogic | `P.Functionality.listSchema ⟹ P.Functionality.schema` | the list form entails the restricted form |
| `P.Functionality.schema_entails_listSchema` | metalogic | `P.Functionality.schema ⟹ P.Functionality.listSchema` | and conversely (`Results/Lists.lean`), so the two are equivalent |
| `foo.listRule` | metalogic | `∀ σs τ, τ.Closed → C.Theorem (imp (P.Barcan.listQuoted σs) (P.Functionality.listQuoted σs τ))` | the record's derivation at `var 0`, vectorized |
| `foo.listEntails` | metalogic | `P.Barcan.listSchema ⟹ P.Functionality.listSchema` | the arrow between list forms |

A **shallow core** is a gated shallow theorem that carries a result's argument, certified
as a rule; the metalogic turns it into the map's arrow, by composing it with other
entailments, by vectorizing it, or by an induction on the list or the type. ("Kernel" is kept for Lean's kernel.)

A principle with a Ty-parameter has a **restricted form**, its schema, with one instance
for each type, and a **list form**, with one instance for each finite list of types, the
empty list included: a variable of the type becomes a block of variables, a quantifier a
block of quantifiers, identity the conjunction of identities. The list forms are defined
by vectorization, and a record's list form comes from its derivation by the vectorization
theorem (`VECTORIZATION-PLAN.md`): the last seven rows of the table. The two forms of a
principle are equivalent, and a unary result at `σ → t`, vectorized, is the result at
every relational type, each being its argument types' `⇒* t`. A principle's first
Ty-parameter is the one vectorized; a second (Relational Choice's output) stays one type.
A record's instance whose first Ty-argument is not that parameter comes out restricted,
at the translated types: Extensionality at `σs ⇒* τ` in the list form of
`extensionality_r_implies_functionality_r`.

**Type parameters and type variables.** The two are different things.

| | type parameter | type variable |
| --- | --- | --- |
| what | a variable *of Lean* that stands for a type | a type *of the object language* about which nothing is known |
| where | shallow: `σ : Type` with `[Ty σ]` (a Ty-parameter) or `[Rel τ]` (a Rel-parameter); metalogic: `σ' : Ty`, `τ' : RTy` | `Ty.var i`, part of the syntax, bound by nothing |
| ranges over | all types; a proof of `∀ σ', …` may split on `σ'` | nothing: it is one type, never relational |
| used for | stating principles and records, and their translations | the vectorization theorem: a derivation at a type variable uses nothing about it, so carries over to any list of types |

A **closed** type is one with no type variable; the closed types are the paper's.

## The metalogical layer

The centre of the project since 22 September 2026: the terms of the object language,
their derivations and their models as objects of Lean, so that statements *about*
Classicism can be made and proved — that a schema entails a schema, that a closed pure
sentence is a theorem, that a sentence holds in a model — and so that a proof in the
shallow layer can be turned into a kernel-checked derivation in the object language. It
is ordinary Lean, with `funext` and Mathlib available, since it is not itself a proof in
Classicism but a theory of Classicism's proofs. `Classicism/README.md` is its README, with
the design decisions, a module-by-module account and the record of what is checked. In
outline:

* `Classicism/Syntax/`: types, intrinsically typed de Bruijn terms, βηδ-conversion, and
  **derivability**, `Derivable Ax Δ p`: `H` closed under *Elimination*'s rule Subst, the
  axiom set an index, the hole of Subst a term with a hole so that it may lie under
  binders; Classicism is `Derivable Logical`, and the eleven identities are its theorems.
  Entailment between schemas, `⟹`, is the form of the map's arrows; the sentence schemas
  (No Pure Contingency, Distinctness, Possibility, maximalization) are here too.
* `Classicism/Semantics/`: the standard reading in `Prop` with soundness (so `C` is
  consistent), and the paper's **action models** with their soundness theorem, full
  models, truncation, and the first models of the map with their verdicts, in two forms:
  the applicative form of *Classicism* (`Action*.lean`) and the **intensional** form of
  Cian's draft *Boolean Completeness without Rigid Comprehension* (`Intensional*.lean`),
  in which a relation is a set of tuples and the Boolean operations are set operations.
  The intensional form is the one the results cite and the one new models are built in.
* `Classicism/Results/`: metalogical proofs of the map's arrows, each file carrying the
  shallow lemmas its object-level steps rest on, certified in place, and the meta-level
  argument — an induction on the type, a case split on the syntax — right after them.
* `Classicism/Tools/`: the metaprogramming. The gate and the type-system check on
  shallow proofs; the **quoter**, reading a shallow statement as a sentence with a
  reflection theorem; the **translator**, reading a gated shallow proof as a derivation
  (`propext` on a closed biconditional is Subst, `funext` its consequence at every type,
  a class law at a type parameter is derived by induction on the type); and the pipeline
  that reads principles as schemas and records as entailments and rules.
* `Classicism/Certified/`: what the pipeline certifies at build time — every record
  theorem quoted, derived and read as an entailment, 28 of 28, in seconds.

## Files

```
Classicism/Core.lean                    e, em, e_exists, □ and ◇, the classes Ty and Rel
Classicism/Equivalence.lean             the gate, the nec% macro, tactic conventions
Classicism/Booleanism.lean              the propositional and quantifier identities, pointwise
Classicism/Identities.lean              the eleven closed identities in the paper's λ-form
Classicism/Pointwise.lean               the pointwise laws of ⊑ at a relational type, as a class
Classicism/Background/                  the lemmas of the map's Background pages, a module per page:
  Framework.lean                          Existence, Ordinary Comprehension
  Necessity.lean                          K, T, 4, NI, CBF, Intensionality and its corollaries; the further laws of □ and ◇
  Order.lean                              the algebraic order and its pointwise characterisation; an entailment, if true, is necessary
  Lattice.lean                            Atom, the bounds LB/GLB/UB/LUB, ActualWorld; the order laws at t, at σ → t and at a relational type
  Atoms.lean                              atoms decide everything of their type, and conversely
  Rigidity.lean                           persistence, inextensibility and the rigidity variants; rigidity is necessary if true
  RigidityClosure.lean                    haecceities are rigid; rigid unions, direct images, inverse images
  Varieties.lean                          the chain □ ≤ □_≠ ≤ □̂̂ ≤ □₅ ≤ λp. p
  Relations.lean                          well-orders; Modalized Plenitude at output t and σ' → t
  Arithmetic.lean                         the finite cardinalities 𝟎, Suc, FiniteCardinality, and countability Ctbl
Classicism/Principles/                  one Prop per principle of the map, a file per category; its forms and their equivalences beside it

Classicism/Syntax/Types.lean            the types of R as an inductive, with type variables; closed types; σs ⇒* ρ
Classicism/Syntax/Term.lean             intrinsically typed de Bruijn terms; renaming, substitution
Classicism/Syntax/Conversion.lean       β, η, δ, one-step and equivalence closures; ≡
Classicism/Syntax/Derivation.lean       derivability in H closed under Subst; terms with a hole; substEq
Classicism/Syntax/Axioms.lean           C and C⁻ as theories; the eleven identities as sentences
Classicism/Syntax/Entailment.lean       entailment between axiom sets, ⟹, with cut and its algebra
Classicism/Syntax/SentenceSchemas.lean  No Pure Contingency, Distinctness, Possibility, maximalization
Classicism/Syntax/WitnessedPossibility.lean  schemas with constants put for variables: Witnessed Possibility and its kin, Logical Necessity, Modal Freedom; Separated Structure, Independence
Classicism/Syntax/PossibilityPlus.lean  Possibility+, pure and for a signature; pairwise distinctness of a tuple
Classicism/Syntax/Infinity.lean         the Infinity schemas at e and t
Classicism/Syntax/StrongPossibility.lean  ◇_≠ and Strong Possibility, pure and for a signature
Classicism/Syntax/OrdinaryComprehension.lean  Ordinary Comprehension, and that C proves every instance
Classicism/Syntax/Inhabited.lean        closed types are inhabited; ⊤_ρ ≠ ⊥_ρ at every closed relational type
Classicism/Syntax/Sentences.lean        ND, BF and the Fregean Axiom as sentences, for both semantic layers
Classicism/Syntax/Constants.lean        the constants a term mentions
Classicism/Syntax/Pure.lean             the pure language inside every signature: terms and derivations carried across
Classicism/Syntax/Conservativity.lean   C(Σ) conservative over C for a closed signature; constants eliminated from a derivation
Classicism/Syntax/Normalize.lean        a verified βη-normalizer; conversion by reflection
Classicism/Syntax/Blocks.lean           blocks of variables: tuples, block abstraction, quantifiers and identity, their rules
Classicism/Syntax/Vectorize.lean        a type variable replaced by a list of types: the translation of terms and holes
Classicism/Syntax/VectorizeDerivable.lean  the vectorization theorem: a derivation survives vectorization
Classicism/Syntax/Examples.lean         computed checks, hand derivations, reflection by rfl

Classicism/Semantics/Denotation.lean    the standard model in Prop; soundness; C is consistent
Classicism/Semantics/Relational.lean    the readings of ∧_τ, ¬_τ, coext and the rest are the classes' operations
Classicism/Semantics/Action.lean        action premodels and models
Classicism/Semantics/ActionSoundness.lean  soundness of action models
Classicism/Semantics/ActionFull.lean    full action models are models; BF forces surjectivity
Classicism/Semantics/ActionFacts.lean   ND, BF, the Fregean Axiom in a model; truncation; □ and ◇
Classicism/Semantics/ActionProperties.lean  properties of models and what holds in all of them
Classicism/Semantics/ActionExamples.lean  the map's M-set models and their verdicts
Classicism/Semantics/Env.lean           assignments, shared by both forms of action model
Classicism/Semantics/Intensional.lean   intensional action premodels and models: relations as sets of tuples
Classicism/Semantics/IntensionalSoundness.lean  soundness; the Boolean operations are set operations
Classicism/Semantics/IntensionalFacts.lean  □ and ◇; consistency from a model; ND, BF, FA criteria; truncation
Classicism/Semantics/IntensionalTheory.lean the theory of a model (consistent, complete); the pure reduct
Classicism/Semantics/IntensionalFull.lean  full intensional models are models, at once; BF forces surjectivity
Classicism/Semantics/IntensionalProperties.lean  fullness; NPC in every one-object model
Classicism/Semantics/IntensionalExamples.lean  the M-set models in the intensional form, cited by the results
Classicism/Semantics/IdeallyFull.lean   Appendix D's technique: pinning, ideally full models, Proposition D.4

Classicism/Models/Permutations.lean     Appendix D, Part 1: the permutation model; ND, BF, Atomlessness hold, Actuality and Atomicity fail
Classicism/Models/MonoidModel.lean      the ideally full model over any monoid acting on ℕ; the verdict lemmas, parametrized
Classicism/Models/Monoids.lean          Appendix D, Parts 2 to 8: the seven monoids of functions on ℕ, the verdicts as instances
Classicism/Models/README.md             the verdict table; the survey of two-object variants and what they would add to the map

Classicism/Results/Records/             the map's records proved in the shallow layer, one theorem per record, a file per topic
Classicism/Results/SentenceSchemas/     results about the sentence schemas: Distinctness, Possibility, No Pure Contingency and their kin, and the Necessity of Arithmetic from C5
Classicism/Results/Consistency/         consistency and non-entailment facts from the models, which the incompatibilities rest on

Classicism/Tools/Check.lean             #classicism_check and #classicism_audit: the gate
Classicism/Tools/TypeSystem.lean        #classicism_types: the relational type system
Classicism/Tools/Quote.lean             the quoter: statements as sentences, reflection checked
Classicism/Tools/Translate.lean         the translator: gated shallow proofs to derivations
Classicism/Tools/Schema.lean            principles as schemas; records as entailments and rules; #classicism_certify
Classicism/Tools/Audit.lean             the audits over the shallow layer, run at build time
Classicism/Tools/Tests.lean             negative and positive controls for the checkers

Classicism/Results/Lists.lean           each principle's restricted form entails its list form: lists, codes
Classicism/Results/Arity.lean           the map's arity results: shallow cores at a type parameter, unary cores vectorized, composition
scripts/FunKinds.lean                   which `fun`s in a file are terms (written λ … ↦) and which are proofs

Classicism/Certified/Quoted.lean        the record theorems quoted; home of foo.quoted
Classicism/Certified/Derived.lean       two derivations checked at build time
Classicism/Certified/Schemas.lean       the principles quoted, and their schemas; home of P.quoted and P.schema
Classicism/Certified/Derivations.lean   the record theorems derived; home of foo.derivable
Classicism/Certified/Entailed.lean      the records as entailments; home of foo.entails
Classicism/Certified/Vectorized.lean    checks of the vectorization on three principles and one arrow
Classicism/Certified/Signatures.lean    each principle as a schema at every signature: P.X.schemaIn, pureVersion
Classicism/Statements.lean              the map's statements, written by the map's generator (pmap lean classicism)
Classicism/Map.lean                     one certificate per map result proved and per form, of its generated statement: the map's lean_refs
Classicism/ModelStatements.lean         the map's models' single verdicts, written by the map's generator
Classicism/MapModels.lean               one certificate per model verdict proved, of its generated statement
Classicism/MapArguments.lean            one certificate per general argument's verdict proved
Classicism/MapDerived.lean              the models' verdicts from those arguments, written by the map's generator
Classicism/Models/Conditions.lean       the map's conditions on models, as predicates
Classicism/Tools/MapIndex.lean          #classicism_map_index: where each certificate and its proofs are (map/index.json)

Classicism/Strict/                      the strict layer; see its README
```

## The checker

`#classicism_check foo` walks the proof term of `foo` and of every constant it reaches,
and reports an error unless both hold:

1. **Axioms.** Everything `foo` depends on is one of `propext`, `Quot.sound`, `e`,
   `e_exists`, `em`. So `Classical.choice`, `sorryAx` and the alternative axioms of
   `Classicism.Axiomatization` are all rejected.
2. **The gate.** Every `propext` and `funext` occurrence reached has a closed argument,
   in the sense above. A `have`-bound proof is looked through to its value. A gated
   primitive that occurs other than as the head of an application, say bound to a local
   name by `have`, is rejected outright, since its argument is never seen; and `opaque`
   bodies are walked like theorem bodies.

`#classicism_audit Mod₁ Mod₂ …` runs it over every theorem declared in those modules.
`Classicism/Audit.lean` runs the audit over the whole library, so `lake build` fails if
a proof strays. The walk reaches core lemmas too. Three of them, `eq_true`, `eq_false`
and `forall_congr`, are `propext` or `funext` applied to their own hypothesis and are
what `simp` leaves in a proof term; the gate checks them at the use site as it checks
`propext`, so `simp` with closed identities passes, and `simp [h]` with a hypothesis is
rejected exactly when the rewrite is the Fregean Axiom, Functionality or BF.
`Classicism/Tests.lean` asserts that each of these is rejected, and that the shapes the
library relies on are accepted.

## The type-system check

The gate says nothing about type theory, so it is not by itself enough: a proof that
quantifies over `Type`, forms `e → e`, or recurses over `Nat` passes it. `Tests.lean`
contains three such proofs, and they do pass. `#classicism_types foo`, in
`Classicism/TypeSystem.lean`, is the second check, and `#classicism_types_audit` runs it
over a module. It enforces four things.

* **Types are types of `R`.** An `R`-type as a Lean expression is `e`, `Prop`, or a
  *non-dependent* arrow whose domain is an `R`-type and whose codomain is a relational
  one. Dependency is what excludes the rest of Lean's type theory.
* **Type parameters are guarded.** A type parameter `{σ : Type} [Ty σ]` counts
  as an `R`-type exactly when the telescope guards it with a `Ty`, `Rel` or `Order`
  instance; an unguarded one is a real quantifier over Lean types and is rejected. And a
  binder over a type may occur only in the leading telescope of a declaration, never inside
  a formula: a principle is a family of formulas indexed by types, not one formula
  quantifying over them.
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
Contingency, whose instances are closed pure sentences. `simp only` with the library's
closed identities is fine (`Classicism/Equivalence.lean`); avoid `by_cases`, `by_contra`,
`decide` and `tauto`, which reach `Classical.choice`.

## Building

```sh
lake build
```

The toolchain is pinned in `lean-toolchain`. Since 23 September 2026 the package requires
Mathlib, for the metalogical layer's action models only (`Classicism/Semantics/Action*.lean`);
no other module imports it. It is pinned to the Mathlib tag matching the toolchain, and
`lake build` fetches its prebuilt cache rather than compiling it, into the default
`.lake/packages`, which is not committed. To keep one copy of Mathlib shared by every
Lean project on a machine (each copy is several GB), make that directory a symlink to a
shared one outside Dropbox, `ln -s ~/lean-packages .lake/packages`, before the first
build; the configuration itself has no machine-specific path, so continuous integration
builds unchanged. The project's own modules build in about a minute from cold.
