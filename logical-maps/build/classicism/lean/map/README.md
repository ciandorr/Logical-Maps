# The Lean side of the map

How the Classicism topic's records and this Lean project fit together. The map's general
mechanism is in `scripts/pmap.py` (`lean`, `lean-check`, `build`); what follows is what this
topic puts into it.

## Where each piece lives

| piece | where |
| --- | --- |
| the topic's Lean setup: library, imports, the shape of a statement, the index, the link template | `topic.yaml`, `lean_lib` and `lean` |
| a principle's Lean schema | its record's `lean_def`, e.g. `Classicism.P.Barcan.schemaIn` |
| a variant's schema and certificate | the variant's `lean`: `ref`, `equivalence_ref`, and `status`, which `lean-check --update` writes |
| a result's certificate | its record's `certificate.lean_ref`, e.g. `Classicism.Map.barcan_r_implies_functionality_r`; `certificate.lean`, which `lean-check --update` writes |
| the statements the certificates prove | `Classicism/Statements.lean`, written by `pmap lean classicism` from the records. Never edited by hand. |
| the certificates | `Classicism/Map.lean`: one theorem per result proved, named by its id, and per variant, `<principle>.<variant>`, each one line citing the proof |
| a model's verdicts proved one by one | the model record's `lean`: `model`, a Lean term for it, and `verdicts`, each `holds` or `fails` a principle with its `ref` and `status`, which `lean-check --update` writes |
| the statements of those verdicts | `Classicism/ModelStatements.lean`, written by `pmap lean classicism`. Never edited by hand. |
| their certificates | `Classicism/MapModels.lean`: one theorem per verdict, `Models.<model id>.<principle id>`, citing the verdict proved in `Models/` |
| where every certificate, proof and principle definition is | `map/index.json`, written by `scripts/MapIndex.lean` (`Classicism/Tools/MapIndex.lean`) |

`lean-check` audits each certificate against its generated statement and the map's list of
axioms (`propext`, `Classical.choice`, `Quot.sound`), results and variants alike, and
writes the index. The build turns the index into links from each result, principle and
variant to its proofs, definitions and certificate: GitHub links pinned to the commit
the map is built from (`lean.source_url`).

## After a change to the Lean

From `logical-maps/`:

    python3 scripts/pmap.py lean-check classicism --update   # build, audit, statuses, index
    python3 scripts/pmap.py validate
    git commit …                                              # the Lean, the records, map/index.json

Contributors do not commit build output; the maintainer rebuilds `build/` and commits it,
since the website imports it, and a contributor's local `pmap build` is for looking. The
links are pinned to the commit a build runs at,
so the published map's links point at the published Lean; a local build warns when
`lean/` has uncommitted changes, whose lines the links would miss. A first build on a new
machine needs Mathlib's cache (`lake exe cache get`, from this directory), then about
twenty minutes; the model theory is the only part that imports Mathlib.

## Principles at every signature

Each of the map's principles is a schema at every signature `Σ`, a function from
signatures to schemas (`Classicism/Certified/Signatures.lean`):

| kind of principle | its schema at `Σ` | example |
| --- | --- | --- |
| indexed by types | its instances, read in `Σ`'s language | `P.Barcan.schemaIn` |
| relative to a signature | the schema at `Σ` | `noContingency _`, `distinctnessC _` |
| the pure version of one | that schema at the pure signature, read in `Σ`'s language | `pureVersion noContingency` (No Pure Contingency) |

A pure principle throws `Σ` away, but its sentences are still read in `Σ`'s language: in
Lean a sentence's type records its signature, and `ofPure` is the inclusion. These are the
`lean_def`s; Actual Profile's is its list form (`P.ActualProfile.listSchemaIn`), since the
map states it for tuples.

Since 6 October every principle has one. Two are schemas over syntax written directly:
General Separated Structure (`generalSeparatedStructure _`, as `P[c̄/x̄] = Q[c̄/x̄] → λx̄. P =
λx̄. Q`; its docstring says why that is the map's schema up to β), and Necessity of Arithmetic
(`ofPure necessityOfArithmetic`, over Goodsell's arithmetical sentences `AForm`, read at every
closed type `σ`, in `Certified/Arithmetic.lean`). The latter's vocabulary, `𝟎_σ`, `Suc_σ`,
`ℕ_σ`, `Sum_σ` and `Prod_σ`, is written as shallow definitions with a type parameter and
quoted by `#classicism_quote_term` (`Tools/QuoteTerm.lean`), which reads each type parameter
as a metalogical type and checks each term's reading against its definition, at every such
type, as `#classicism_quote` does a statement's.

## The shape of a statement

A result, `A₁, …, Aₙ ⇒ C`:

    ∀ {Sig} (_ : Sig.Admitted) (Ax : AxiomSet Sig),
      Entails Ax A₁ → … → Entails Ax Aₙ → Entails Ax C

every schema over any signature that entails the premises entails the conclusion: the
entailment `A₁ ∪ … ∪ Aₙ ⟹ C`, at every signature. An incompatibility ends instead in
`¬ Consistent Ax`: every schema entailing the premises is inconsistent. A form `F` of a
principle `P`:

    ∀ {Sig} (_ : Sig.Admitted) (Ax : AxiomSet Sig), Entails Ax P ↔ Entails Ax F

`Ax` appears because the map's generator builds a statement as a chain with one proposition
per principle, and `Entails Ax A` is that proposition. `Sig` is bound because a statement is
one closed proposition about functions of the signature. It ranges over the signatures the
map's Background admits (`Signature.Admitted`): their constants have closed types, the
paper's (a Lean `Signature` may also give a constant a type variable, and then `∃v. v = v`
at that type is a pure theorem of `C(Σ)` that `C` does not prove, so the results relating
a schema for a signature to its pure version fail there); and, the Background's standing
assumption, at least one constant has a type other than `e` (the proofs of the
incompatibilities of Witnessed Possibility, Separated Structure and No Contingency need a
constant of relational type).

A model, satisfying `S₁, …, Sₘ` and violating `V₁, …, Vₖ`:

    ∃ (Sig) (_ : Sig.Admitted) (Ax : AxiomSet Sig), Consistent Ax ∧ Complete Ax ∧
      Entails Ax S₁ ∧ … ∧ ¬ Entails Ax V₁ ∧ …

a consistent **complete** theory (`Syntax/ClosedTypes.lean`: it decides every sentence of the
paper's language), the syntactic form of a single model. Without completeness the violations
need not hold together: the empty theory entails neither the Fregean Axiom nor its negation,
so a merely consistent theory would "violate" both (Astra's audit, 4 October). The statement
cannot name the model's construction; the certificate's proof is where that construction
appears.

**Symmetric ideally full models.** `Semantics/Symmetric.lean` has Dorr's Definitions 17–18
(*BC does not imply RC*, draft of 30 July 2026): symmetry under a family of arrows `G V`
closed under inverses, and `Premodel.symIdeal`, whose domains are the symmetric finitely
pinned intensions. Proposition 20, that it is a model (`symIdeal_isModel`), combines the
induction of Proposition D.4 with `sem_symmetric`: every logical constant's reading is
symmetric when the domains are, and an abstraction's value moves along a symmetry as its
body's does. `Models/SymmetricFull.lean` has the group `symmetry-constrained-full`, for any
monoid of maps on three individuals containing the permutations (`Maps3`): all maps
(`allMaps`) and the permutations with the collapses (`permsCollapses`), each with the
conditions one object, finitely many propositions, extensionally full (orbits) and actual
world isolated (the permutations). `Models/SymmetricIdeal.lean` has six members of `symmetric-ideally-full`:
five on one object, `ℕ` (`Base`: a monoid of maps with symmetries among them, each with its
inverse), and the two-object qualitative contrast. The actual world is the set of symmetries,
and isolated, when a composite is a symmetry exactly when both factors are and the
symmetries are told apart from the other arrows on a finite set (`actualWorldIsolated_of`):
the collapse pair (on `{0, 1}`) and the range gap (on `{0}`). The two-object model with the
improper ideal at its second object is below; not yet: Base 3.

The group's own arguments are proved for every base (`Models/SymBase.lean`, the group's Lean
parameter `SymBase`, Dorr's Definition 15): `actuality` (the symmetry group, finitely pinned,
is a true atom), `barcan-fixes-or-omits` (BF at `e` fails), `relational-choice` (Lemma 19(iv) and a
transposition fixing the pinning set and the property), `axiom-of-infinity-e` and `-t` (the
finite cardinalities' property is arrow-blind and symmetric; separable collapses give infinitely
many propositions), and `barcan-surjective` (a surjective arrow is surjective on every domain,
by a pullback, which stays symmetric). The members meet the conditions in
`Models/SymmetricIdeal.lean`; transposability for all five one-object members comes from one
lemma (`transposable_of`).

`boolean-completeness`, the draft's main theorem (Theorem 36), is proved for every base with
one object that meets `hull-conditions` (`SymBase.HullConditions`, the draft's splicing and
moving hypotheses with a fixed finite `M₀`): the least upper bound of a property is the union of
its instances' hulls (`SymBase.lub_of_hull`, with the orbit lemma, Lemma 35, as `orbit_ext`). The
all-surjections model meets the conditions with `M₀ = ∅` and the collapse pair with the pair
(`allSurj_hullConditions`, `collapsePair_hullConditions`); infinite classes with `M₀ = ∅` and
the two range gaps with `M₀ = {0}` (`infClasses_hullConditions`, `rangeGap_hullConditions`,
`rangeGapNoAct_hullConditions`). The theorem is for any number of objects: separation asks that
every arrow agreeing on `M` be a symmetry of the base, and splicing is into any one object.

A base carries a per-object ideal of pinning sets (`SymBase.J`, a `PinIdeal`: finite sets, binary
unions, images along arrows), required to be the finite sets at the base; the symmetric ideally
full premodel admits at each object the symmetric intensions pinned down by a member of its ideal
(Proposition 20 for any such ideal). Every member but one carries the finite sets everywhere, the
group condition `finite-pinning`, which `barcan-surjective` uses. The exception is the two-object
model with its second object unpinned (`SymIdeal.twoBase`, `symmetric-two-object-unpinned`): it
meets `hull-conditions` (`two_hullConditions`), and its own `□BC` holds because the least upper
bound at the second object is the union of the instances (`two_hasLUBs`, `SymBase.holds_box_bc_lub`).

**The sentence schemas range over the paper's language.** The object language here also has
type variables, a device of the metalogic; every sentence schema (No Contingency, No Pure
Contingency, B, Distinctness, Possibility, Witnessed Possibility and its kin, Separated
Structure, Independence, Possibility+, Strong Possibility, Ordinary Comprehension) requires
each instance to have only closed types (`Term.closedTypes`), and every principle's schema is
shown to have only such instances (`P.X.schema_closedTypes`). Before 4 October they did not,
so that "type variable `0` is empty" was an instance of No Contingency and of Possibility
(Astra's audit).

**A model's verdicts, one by one.** A model whose whole package is not yet formalized can
still have its verdicts certified singly. For the record's Lean model `A`, a verdict that `P`
holds reads

    A.IsModel ∧ A.HoldsAx P.schemaIn

and one that it fails `A.IsModel ∧ ¬ A.HoldsAx P.schemaIn`; for a principle relative to a
signature (category `signature`), the statement also asks `A.Admitted`, that the model's
signature is one the map's statements range over, so a model of the pure language cannot
certify those. The models of `Models/` are of the pure language, where `P.X.schemaIn` holds
iff `P.X.schema` does (`Premodel.holdsAx_schemaIn_iff`, `Semantics/IntensionalTheory.lean`).
On 5 October 91 verdicts of eleven models were certified this way: Parts 1 to 8 of Appendix D
and the two-object model after Part 8 (`finite-support-*` on the map), and the two M-set models
of §3, on the idempotent monoid and the two-element group (`full-idempotent-monoid`,
`full-involution-group`, from `Semantics/IntensionalExamples.lean`). On 6 October the other
four full action models of §3 followed (`Models/FullActionModels.lean`): the monoid of
surjections and the group of permutations of `ℕ`, the two-object chain, and the retract, each
with one individual.
On 8 October a new member of the finite-support group, Dorr's pair-preserving injections and
collapses (`finite-support-pair-injections-or-collapses`, `Models/PairInjCollapse.lean`), with
its four own verdicts: Vicinity, BF, Atomlessness, and the failure of Rigid Power, the map's
first. The last unfolds the quoted sentence by `simp` into the semantics of rigidity (`SRig`,
persistence along every arrow and inextensibility at every world) and refutes it with `F := ⊤`.
Its symmetric analogue is Base 2 (`symmetric-collapse-pair`), where Rigid Power fails by the same
argument; that verdict is not yet in Lean.

The verdicts compose into the whole model's statement once the model is of an admitted
signature: `Premodel.theory`, the sentences holding in a model, is consistent
(`theory_consistent`) and complete (`theory_complete`), and entails a schema iff the schema
holds in the model (`theory_entails_iff`). With every verdict of a record certified, the
model statement is `⟨Sig, hAdm, A.theory, theory_consistent M, theory_complete M, …⟩`, each
conjunct `entails_of_holdsAx M h` or `not_entails_of_not_holdsAx M h`. What is missing is a
model of an admitted signature: the Appendix D models with `Σ` interpreted as the records
say, and the verdicts on the principles relative to a signature there.

**General arguments, and the verdicts they give.** A general argument on the map says that
every model meeting some conditions has a verdict. In Lean it is a theorem over models
(`MapArguments.lean`), and its statement is generated (`ModelStatements.lean`):

- **Topic argument:** `Arguments.<argument>.<principle>` reads: for every intensional action
  model meeting the argument's conditions, the verdict. Each condition is the Lean predicate
  named in `conditions.yaml` (`Models/Conditions.lean`).
- **Group argument:** `Arguments.<group>.<argument>.<principle>` reads: for every value of
  what the group's construction is built from, meeting the group's conditions, the verdict
  in the model built from it. For the finite-support group this is a monoid acting faithfully
  on `ℕ`.

A model meets a condition by a proof named in its record's `lean.meets`, or in its group's
`lean.meets` for every member; member-specific proofs are in `MapModels.lean` under
`Map.Meets`. The map then generates `MapDerived.lean`. For each argument the map applies to a
model, it certifies the model's verdict by applying the argument's certificate to the model's
proofs. So the Lean follows the map's route: a verdict that rests on an argument is proved
by that argument, and only the meeting of conditions is particular to the model.

By 6 October, 32 verdicts of 25 arguments were proved this way:

| Argument | Condition | Verdict |
| --- | --- | --- |
| `no-pure-contingency-one-object` | one object | No Pure Contingency holds |
| `barcan-d6` | Proposition D.6's surjectivity | BF holds |
| the finite-support group's `actual-world` | actual-world-pinned | Actuality holds |
| `collapsing-atomless` | collapse-unpinned | Atomicity and Atomicity (`t`) fail |
| `barcan-positive` | positive-preserving | BF fails |
| `relational-choice-full` | full, choice | Relational Choice holds |
| `relational-choice-full-boxed` | full action model, choice | □Relational Choice holds |
| `transversal-choice-extensionally-full` | extensionally full, choice | Transversal Choice holds |
| `dpc-isolated-actual-world` | actual world isolated | Distinctness-Preserving Collapse holds |
| `one-individual` | one individual | the Axiom of Infinity, the Infinity schema and Possible Infinity at `e` fail |
| `finitely-many-propositions` | full, finitely many propositions | the Infinity schema at `t` fails |
| `finitely-many-propositions-everywhere` | finitely many propositions at every reachable object | Possible Infinity at `t` fails |
| `infinitely-many-individuals`, `infinitely-many-propositions` | extensionally full, infinitely many | the Axiom of Infinity and the Infinity schema hold at `e`, at `t` |
| `full-atomicity` | full | □Atomicity holds |
| `full-rigid-comprehension` | full | □Rigid Comprehension holds |
| `full-epic-barcan` | full, epic arrows | □BF holds |
| `invertible-arrows` | invertible arrows | □ND and □BF hold |
| `retractions` | retractions | ND holds |
| `unretracted-arrow` | full, an arrow with no retraction | ND (`t`) fails |
| `nonidentity-arrow` | full, an arrow other than the identity | the Fregean Axiom fails |
| `nonepic-strong-atomicity` | full, a non-epi arrow | Strong Atomicity (`t`) fails |
| `dpc-returning-arrow` | full, a returning arrow | Distinctness-Preserving Collapse fails |
| `coherent-retractions` | full, coherent retractions | Gallin Extensional Comprehension holds |
| `fewer-propositions-after` | fewer propositions after some arrow, and after it | B for pure sentences fails |

The semantic facts behind them are in `Semantics/FullModels.lean` (choice, transversals, the
isolated actual world), `Semantics/Counting.lean` (the `n`-th instance of the Infinity schema
holds iff there are `n` distinct entities, and the sentences counting them are pure and in the
paper's language), `Semantics/OneIndividual.lean` (`Suc 𝟎` counts the universal property),
`Semantics/Numerals.lean` (the numerals, and the Axiom of Infinity from infinitely many
entities) and `Semantics/Arrows.lean` (the conditions on arrows). Lean's metatheory has choice: the arguments that use it are marked
`choice: uses` on the map, and its variants read without choice (README, "Model groups") have no Lean.

On 6 October they gave 66 of the 166 model verdicts certified. The first 23 replaced 21
that had been certified model by model and added Atomicity's failure in the two
identity-or-collapse models. Later that day they gave 125 of 211.

**The division of labour.** A verdict is proved by a general argument whenever its proof uses
only a property the model has; the model record then proves only that it meets the condition,
usually in a line or two (`Models/FullActionModels.lean`, `MapModels.lean`'s `Meets`). A
verdict the engine derives from others is not proved at all. So the six full action models of
§3 have no arguments of their own left: everything they get beyond the derivation is a topic
argument, and their `lean.verdicts`, proved one by one before the arguments existed, are
superseded but kept. `intensional-choice-well-ordering` and `rigid-power-tight` are the
ones without Lean yet (`three-numbers` was withdrawn on 16 October, when Countable Boolean
Completeness became schematic in the type it counts at). The finite-support models' group meets
`extensionally-full` (`Premodel.ideal_extFull`: the intension blind to arrows is pinned down by
`∅`) in Lean.

Several arguments are not proved yet, because the condition the Lean proves differs from
the map's prose:

- **`boolean-completeness`:** the Lean lemma `not_bc_of` assumes `BCWitness`, which is not
  the condition `unbounded-haecceities` as the map states it.
- **`atomicity`:** the Lean lemma `atomicityT_of_singletons` gives Atomicity at `t` only,
  where the argument claims it at every relational type.

Not proved yet for other reasons: `intensional-choice-well-ordering` and `rigid-power-tight` (their principles have no
`lean_def`).

**Models with `Σ` interpreted.** A verdict on a principle relative to the signature is about
a model of an admitted signature, and the statement also asks `Admitted`. The record's Lean
model is of the pure language; the topic builds the model with `Σ` interpreted from it by
the record's setting `sigma` (`topic.yaml`, `lean.verdict.relative_models`), so no record
names it. For `sigma: top` it is `Premodel.withTop B M`, with `Σ` one constant of type `t`
denoting `⊤` (`Signature.sigmaTop`), in `Semantics/Interpretations.lean`. What makes it work
is substitution of definitions for constants: where each constant denotes what a closed pure
term denotes, a term of `Σ` denotes what the pure term with the definitions substituted
denotes (`sem_substConsts`). So the reinterpretation of a model is a model
(`isModel_interp`), its verdicts at every signature are the original model's
(`holdsAx_interp_ofPure`), and No Pure Contingency gives No Contingency relative to `Σ`.

On 6 October two topic arguments gave 24 Σ verdicts this way: `sigma-top` (Independence
relative to `Σ` fails, at `c ≠ ⊤_ρ`) and `sigma-top-npc` (No Contingency relative to `Σ`
holds, given No Pure Contingency). A relative argument's statement has the hypothesis
`Admitted` after the model's (`lean.argument.relative`). With these the engine settles 11 or 12
of the 14 Σ verdicts of each one-object model from Lean alone. What it lacks: General Separated
Structure has no `lean_def`, and the results Separated Structure ⇒ Possibly Witnessed
Possibility and Strong Possibility (`Σ`) ⇒ Possibility (`Σ`) are stated, not proved. Not
done yet: the rest of `sigma-top` (Witnessed Possibility, which the two-object chain needs),
and the true-atom interpretation (`sigma-true-atom`), which no model in Lean uses.

The certificate is the object-language entailment, not the shallow proof. The claim is
about `C`, and the map's axiom list is harmless elsewhere but not here: `propext` is the
Fregean Axiom, so a shallow proof passing that check would show nothing about `C`. The
entailments use `propext` and `Quot.sound` only as reasoning about syntax.

## Open points

- **Axioms.** Every certificate rests on `propext`, `Quot.sound` and `Classical.choice` at
  most, the map's list. (Until 4 October three rested also on `Classicism.e` and `e_exists`,
  through the model in `Prop` built on the shallow layer's `e`; it is now built on `Unit`.)
- **Coverage.** 14 of the map's 109 principles have no `lean_def` yet: General Separated
  Structure and the Necessity of Arithmetic, and those added to the map since 2 October
  (Rigid Power, Tame Rigidity, Intensional Choice and others), so 50 results have no
  statement. Of the 266 stated, 32 are not yet proved here: the newest,
  `atomicity-t-and-weakly-inextensible-comprehension-imply-actuality`, and Appendix E's incompatibilities, the Gödel results, the
  six conjectured ones, most of those about Separated Structure and Independence, Strong
  Possibility, the Infinity schemas, Bacon's Theorem 8.2, and C5 and Atomicity ⇒ No Pure
  Contingency (now that No Pure Contingency ranges over the paper's language only, this one
  is open to the automorphism proof; see HANDOFF, §8).
- **Variants.** 60 of the map's 77 have a Lean statement, and 56 of those a certificate:
  the 20 polyadic variants whose two directions are proved (`P.X.listSchema_entails_schema`,
  by inclusion; `P.X.schema_entails_listSchema`, `Results/Lists.lean`); the 26 duals of
  principles with a shallow statement and the 3 LUB forms (`P.X.to_<variant>`,
  `P.X.of_<variant>`, beside the principle in `Principles/`); and the 7 dual polyadic
  variants, composed from both. Stated but not proved: the polyadic variants of Transversal,
  Transversal Choice and their boxed forms. Not stated: the duals of the sentence schemas,
  the GLB forms of Countable Boolean Completeness, and the variants of principles without a
  `lean_def`.
- **Models.** 14 of the map's 97 models get statements (`∃` a consistent complete `Ax`
  entailing what the model satisfies and not what it violates, above); the others' verdicts
  mention a principle without a `lean_def`. None is certified as a whole yet; 166 single
  verdicts of fifteen models are (above).
- **No Pure Contingency defined twice.** `npc Σ` (P → □P for each pure sentence of `Σ`'s
  language) and `pureVersion noContingency` are the same set (`npc_eq_pureVersion`), and so
  are the two Pure B's.
- **Conservativity.** `C(Σ)` is conservative over `C` for a closed signature
  (`Syntax/Conservativity.lean`), so the consistency facts proved in the pure language hold
  at every such signature (`consistent_ofPure_iff`).
- **Mathlib.** `lean-check` runs `lake build` on the topic's Lean directory; this project
  needs Mathlib (for the model theory only).
