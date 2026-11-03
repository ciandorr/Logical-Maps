# The metalogical layer

This README covers the metalogic of the formalisation: `Syntax/`, `Semantics/` and
`Results/`, which are mathematics, and `Tools/` and `Certified/`, which are the
metaprogramming that connects them to the shallow formalisation in `Classicism/` and its
outputs. The main `README.md` describes the shallow layer and the whole; `Strict/README.md`
the strict layer, a sideline.

The shallow layer proves theorems *in* Classicism, in Lean, under a gate. This layer
proves theorems *about* it: the terms of the object language, their derivations and their
models are objects of Lean, so that one can say that a sentence is a theorem of
Classicism, that a schema entails a schema, that a closed pure sentence is necessary if
true, that a sentence holds in a model — and so that a proof in the shallow layer can be
turned, by a program the kernel checks the output of, into a derivation of the object
language. Earlier notes called this the "deep" layer; **metalogical** is the name now.

## What it is for

1. **Metalogical statements.** "Schema A entails schema B" as a theorem about instances;
   No Pure Contingency, a sentence schema over closed *pure* sentences; the Maximalist principles,
   which quantify over syntax; an induction on the structure of a relational type, which
   the shallow layer's classes cannot perform.
2. **Certificates.** A record of the map — an arrow between principles — is a shallow
   theorem `P … → Q …`; the translator makes of it a derivation in the object language
   and the pipeline reads that as `P.schema ⟹ Q.schema`, the form of the arrow, or as a
   rule between instances for use inside a metalogical proof (`Results/`).
3. **Model evidence.** The paper's action models, with soundness, are the models the map's
   non-implication records need; a model of `Ax₁` refuting a sentence of `Ax₂` shows that
   `Ax₁` does not entail `Ax₂`.
4. **The theory itself.** Classicism is defined here as the paper defines it, `H` closed
   under Subst; that the eleven identities axiomatize it (Appendix A) is a theorem to be
   proved about this definition, and the strict layer's transformer is its constructive
   evidence one theorem at a time.

## Design decisions

The first five were settled with Cian on 22 September 2026, the rest on the days named.

- **The syntax is its own datatype, not a subtype of Lean's `Expr`.** This layer proves
  theorems about substitution and conversion, and `Expr`'s are implemented behind
  `extern` with no equations; a typing relation for `Expr` is the Lean4Lean project; and
  the metalogical statements need a small closed grammar with decidable notions of
  "closed" and "pure". The bridge to the shallow layer is the reflection pattern: a
  denotation `⟦·⟧` from terms to propositions, and a quotation `⌜·⌝` the other way, with
  `⟦⌜p⌝⟧ = p` checked per theorem.
- **Terms are intrinsically typed.** `Term Sig Γ σ` is the type of terms of type `σ` with
  free variables from `Γ`; an ill-typed term cannot be written.
- **Variables are de Bruijn indices**, so α-equivalence is identity and only β and η
  remain. No higher-order abstract syntax.
- **The type system is fixed**: `e` and `t` are the only base types. Nonlogical
  vocabulary enters through a `Signature` of constants; the pure language is the empty
  signature.
- **Derivations are not a separate datatype.** `Derivable Ax Δ p` is an inductive
  predicate, by definition the smallest relation closed under its rules; a proof of it
  *is* a derivation tree. A `Type`-valued twin would allow computing with derivations at
  the price of proof relevance in every lemma, and nothing planned needs it.
- **The type-subscripted operations are constants of the syntax with an unfolding rule**
  (23 September). `∧_τ`, `¬_τ`, coextension and the rest were first functions on terms
  by recursion on the type. A function stuck at a type *parameter* is not a node of the
  syntax: renaming and substitution could not pass through it, and no derivation could
  mention `∧_τ` for `τ` a variable, which a derivation by induction on the type must. So
  `Term.andR ρ` is a constructor, and the recursion is the δ-rule of conversion,
  `∧_t ≡ ∧` and `∧_{σ→ρ} ≡ λX Y z. X z ∧_ρ Y z`, alongside β and η.
- **Mathlib, for the model theory only** (23 September). The action models import
  Mathlib (categories, functors to `Type`, sets), pinned to the tag matching the
  toolchain and checked out into one directory shared by every Lean project on the
  machine (`.lake/packages` a symlink to it; the configuration has no machine-specific
  path). The shallow layer never imports it, so its axiom audit is unaffected.
- **Classicism is `H` closed under Subst** (24 September, replacing the eleven identities
  as the definition). The rule is *Elimination*'s: from `P ⊢ Q` and `Q ⊢ P`, each on its
  own, and `Δ ⊢ R[P]`, infer `Δ ⊢ R[Q]`, for `R` a formula with one hole, under binders
  or not (`Hole`, a term with a hole, in `Syntax/Derivation.lean`). It gives no logical
  constant a special role: Equivalence is its instance at the hole `P = ⬚`, ξ its
  instance under an abstraction, and both are derived. "On its own" is the substance: the
  premises are derivations from the one hypothesis in the *logical part* of the axiom
  set (Existence at `e` and nothing proper to the theory), so the axiom set is an index
  of the inductive; were the theory's own axioms admitted there, `C + BF` would derive
  `□BF`, and the map's distinction between BF and □BF would collapse. The eleven
  identities are theorems of the system, each a Subst at `λ… P = λ… ⬚` (one is derived
  in `Syntax/Examples.lean`). A map record "`C` plus BF proves this instance" is
  derivability with the union of the axiom sets.
- **The translator reads shallow proofs directly** (24 September, replacing the route
  through the strict layer). A gated shallow proof is natural-deduction shaped: its
  constants are the rules, and the two gated primitives are exactly Subst (`propext` on
  a closed biconditional) and its consequence at every type (`funext` on a closed
  identity, `substEq`). The strict route, an Appendix-A instance per theorem re-expressed
  as natural deduction, cost ten to a hundred times more; the experiment that showed it
  is recounted at the end of this README.

## The modules, in order

| module | contents |
| --- | --- |
| `Syntax/Types.lean` | `Ty` and `RTy`, the mutual inductive of Dorr's *Elimination*, Appendix A: `e`, `t`, and `σ ⇒ ρ` for a type `σ` and a relational `ρ`. Decidable equality; every type is `e` or `σ₁ → … → σₙ → t`. |
| `Syntax/Term.lean` | `Signature`; contexts; `Var`; `Term Sig Γ σ` with the paper's six logical constants `∧`, `∨`, `¬`, `∀σ`, `∃σ`, `=σ` and the seven type-subscripted operations `∧_ρ`, `¬_ρ`, … as constructors, Figure 1's abbreviations `→`, `↔`, `⊤`, `⊥`, `□`, `◇` as definitions, and `Term.unfoldR`, the one-step unfolding of an operation at a constructor type; purity; renaming and substitution, through `Term.rec` for the kernel's sake, with the identity laws and the four composition laws. |
| `Syntax/Conversion.lean` | β, η and δ in three grades: the immediate conversion of a redex, the one-step closure `Step`, and the equivalence closure. `Conv`, written `≡`, is βηδ-conversion, proved a congruence and stable under renaming. |
| `Syntax/Derivation.lean` | `Derivable Ax Δ p`: hypotheses, axioms, the rules for `∧`, `∨`, `¬` with excluded middle, `UI`, `Gen`, `EG`, `Inst`, `Ref`, `LL`, conversion. Weakening and monotonicity admissible; `→` and `↔` rules derived. |
| `Syntax/Axioms.lean` | The eleven identities as sentences; `C.axiomsMinus` and `C.axioms`, the latter adding Existence at `e`; `C.Derivable`, `C.Theorem`. |
| `Syntax/Entailment.lean` | **Entailment between axiom sets**, `Ax₁ ⟹ Ax₂`: every sentence of `Ax₂` a theorem of `C ∪ Ax₁` — the form of the map's arrows. Unions and inclusions of axiom sets; cut (`Derivable.replaceAx`, axioms replaced by their derivations); `refl`, `trans`, monotonicity, unions; `of_imp_family`; the **deduction theorem** for axiom sets (`Derivable.ofAxiom`, `Theorem.deductionC`); `Consistent`, and the two ways it turns into non-theoremhood and back, which the side conditions of Distinctness and Possibility need. |
| `Syntax/Pure.lean` | **The pure language inside every signature**: `Term.ofPure` reads a term with no constants in any signature, `Derivable.ofPure` carries derivations across, so a theorem of `C` in the pure language is a theorem of `C(Σ)` for every `Σ`. This is how a lemma certified at `Signature.pure` is applied in a metalogical proof about a signature. The converse is `Syntax/Conservativity.lean`. |
| `Syntax/Conservativity.lean` | **Conservativity of `C(Σ)` over `C`**: a pure sentence derivable in `C(Σ)` from pure axioms is derivable in `C` from them (`Theorem.toPure`), for a signature whose constants have closed types (`Signature.Closed`). Syntactic: the derivation is weakened into the context of one individual variable `x`, every constant becomes a term built from `x` (`Term.elim`), and Existence at `e` discharges `x`. Hence a pure schema is consistent in such a signature iff it is in the pure language (`consistent_ofPure_iff`); Possibility and Distinctness (pure) are parts of their versions for the signature; and No Pure Contingency and Pure B for a signature are the pure ones read there (`npc_eq_ofPure`, which needs no conservativity). |
| `Syntax/SentenceSchemas.lean` | **The sentence schemas**, the map's principles schematic in a sentence rather than a type, which no shallow definition can express: No Pure Contingency, No Contingency, B for a signature and for pure sentences, Distinctness and Possibility relative to a theory, and `max`, the maximalization, with Maximalist Classicism `max empty`; the necessitation of a schema, `Ax.box`, which is how the map's boxed principles are formed; in the pure signature every sentence is pure. What follows from these is in `Results/SentenceSchemas/`. |
| `Semantics/Denotation.lean` | `Ty.denote`, `Env`, `Interp`, `Term.denote`: the standard reading of the syntax in Lean, with `t` as `Prop` and `e` as a chosen domain. Renaming and substitution commute with it; conversion preserves it; **soundness** of `Derivable`; the eleven identities hold in `Prop`, so `Prop` is a model of `C` and **`C` is consistent**; an axiom set true in `Prop` is consistent (`Consistent.of_interp`), and `Interp.trivial` interprets any signature over a nonempty domain. |
| `Syntax/Examples.lean` | A β-step by `rfl`, an η-step, purity decided, small derivations (commutativity of `∧` by Subst among them), and the reflection checks: sentences read back are the propositions they abbreviate, by `rfl`. |
| `Semantics/Relational.lean` | The bridge for the type-subscripted operations `∧_τ`, `¬_τ`, `∨_τ`, coextension, the pointwise box and implication (constants of `Syntax/Term.lean`, read in `Semantics/Denotation.lean` by recursion on the type): the standard reading's `SRel` and `SOrder` instances by the same recursion, and one lemma per operation, by induction on the type, that its reading is the strict layer's. Purpose four of this layer, at work. |
| `Tools/Quote.lean` | **The quoter**, first half of the translator: `#classicism_quote foo` reads the statement of `foo` as a sentence, `foo.quoted`, with its type parameters read as metalogical ones, and declares `foo.reflect`, that reading it back gives the statement, by `rfl` or by rewriting. `#classicism_quote_audit` runs it over a module. |
| `Certified/Quoted.lean` | The quoter run over the record theorems at build time; home of every `foo.quoted` and `foo.reflect`. |
| `Syntax/Normalize.lean` | A **verified βη-normalizer** on the syntax, `Term.nf`, with `Conv.of_nf`: two terms with the same normal form convert, the hypothesis decided by evaluation. |
| `Tools/Translate.lean` | **The translator**, second half: `#classicism_derive foo` reads the gated shallow proof of `foo` and declares `foo.derivable`, a kernel-checked derivation of its statement. `#classicism_derive_audit` runs it over a module. |
| `Certified/Derived.lean` | Two quick derivations run at build time, as a check that the whole chain works. |
| `Tools/Schema.lean` | **Principles as schemas and records as entailments.** `#classicism_schema P` quotes the principle `P` into `P.quoted`, `P.reflect` and `P.schema`, the axiom set of its instances over its object types. `#classicism_entails foo` reads the statement `P₁ … → … → Q …` of a record theorem and its derivation `foo.derivable` into `foo.entails : P₁.schema ∪ … ⟹ Q.schema`, specializing the derivation to each instance of `Q` and citing the premises as axioms; `#classicism_entails_audit Mod` does it for a module, deriving first. |
| `Tools/Schema.lean` (rules) | `#classicism_rule foo` reads the same derivation as a **rule between the schemas' instances**, `foo.rule : ∀ σ' …, C.Theorem (imp (P₁.quoted …) (… (Q.quoted …)))`, keeping the object types, for use inside a metalogical proof; `#classicism_certify foo` is the whole chain at the point where `foo` is stated: transform, schemas, derive, rule. |
| `Certified/Schemas.lean` | The principles (68) quoted: the home of every `P.quoted` (its instances), `P.reflect`, `P.schema` (its schema) and, for a principle with a Ty-parameter, `P.listQuoted` and `P.listSchema` (its list form). |
| `Certified/Derivations.lean` | Every record theorem of `Results/Records.lean` derived in the object language: the home of every `foo.derivable`, kept apart because it is the expensive part of the build. |
| `Certified/Entailed.lean` | The record theorems of `Results/Records.lean` certified as entailments: the home of every `foo.entails`, and, for a record with a Ty-parameter, `foo.listRule` and `foo.listEntails`. All 152 certify; 70 of the 74 with a Ty-parameter in list form too, the other four citing Relational Choice with its output at the list's type. |
| `Semantics/Action.lean` | **Action premodels and action models**, the paper's models of Classicism, directly: a rooted category, an inner action per type, the outer actions by recursion on the type, the subaction conditions, the total interpretation function `sem`, `Holds`, and `IsModel`. |
| `Semantics/ActionSoundness.lean` | **Soundness of action models**: transport, renaming, substitution, β, η, δ, conversion; every rule of `Derivable`; the eleven identities and Existence hold at every arrow of every action model; `theorem_holds`, `theoremWith_holds`. |
| `Semantics/ActionFull.lean` | **Full action models**: the powerset and exponential actions as functors; the full inner domains by recursion on the type; `Premodel.full` on any rooted category from an action for `e` and an interpretation; **`full_isModel`**, that a full premodel is a model, by the combined induction (inner-ness and transport together, the type-subscripted constants by a second induction on the size of the type); `full_bf_surjective`, the paper's (iii). |
| `Semantics/ActionFacts.lean` | `ND_σ`, `BF_σ` and the Fregean Axiom as sentences; the clauses for `□` and `◇`; **truncation** (`Premodel.truncate`, `sem_truncate`, `isModel_truncate`, `dia_iff_truncate`, `box_iff_truncate`); the paper's generalizations: `ND_σ` holds iff every `h^σ` out of the object is injective, `BF_σ` holds if every `h^σ` is surjective, the Fregean Axiom holds iff propositions agreeing at the identity are equal; and what a model verdict needs to become a fact about the theory: `⊥` fails, `¬P` holds iff `P` fails, `□P` gives `P`, **an axiom set true in an action model is consistent** (`Consistent.of_action_model`) and a sentence failing in it is not a theorem (`not_theorem_of_model`). |
| `Semantics/ActionProperties.lean` | Properties of action models — propositionally full, quasi-functionally full, full — and what holds in all models with a property: the value of a pure term does not see the arrow (`sem_pure`), so **No Pure Contingency holds in every one-object model** (`holdsAx_npc`); the Fregean Axiom fails in every propositionally full model with a second arrow out of the base. |
| `Results/Consistency/` | **Consistency facts from the models**: `Consistency.lean` (the side conditions' facts, from `Prop`, the M-set models, the permutation model and the monoid models of Appendix D, and `BF` not entailing `□BF`), `ConsistencyPointed.lean` (the pointed monoid models). The incompatibilities and the side conditions of Distinctness and Possibility rest on them. |
| `Results/SentenceSchemas/` | **The results about the sentence schemas**, the first use of the semantics to prove arrows: `PossibilityDistinctness.lean` (Distinctness and Possibility equivalent, relative to any theory over any signature), `Contingency.lean` (No Pure Contingency necessitates every pure schema — twenty records as one theorem — and the arrows among the contingency schemas), `Incompatibilities.lean` (Possibility, Distinctness and `Max T` against the necessitation of anything refutable; Maximalist Classicism against `ND`; Possibility against No Pure Contingency and pure B), `Arithmetic.lean` and `ArithmeticMeta.lean` (`C5` gives the Necessity of Arithmetic: the steps of the induction on arithmetical sentences as derived shallow theorems, and the induction itself composing their derivations). Its README lists the records covered and the ones that wait on models or definitions. |
| `Semantics/ActionExamples.lean` | Full M-set models (`MSet.model`): the idempotent monoid `{1, k}` (`ND_t`, `BF_t` and the Fregean Axiom fail — the map's `full-idempotent-monoid`) and the two-element group (the Fregean Axiom fails, `□ND_σ` and `□BF_σ` hold at every type — `full-involution-group`); at an object whose out-arrows are isomorphisms, `ND_σ` and `BF_σ`; in a groupoid, their necessitations. |
| `Semantics/Env.lean` | `IEnv`, the assignment of inner elements to the variables of a context, shared by the action models and the intensional action models, with the facts renaming and substitution need. |
| `Syntax/Sentences.lean` | `ND_σ`, `BF_σ` and the Fregean Axiom as sentences, written once for both semantic layers. |
| `Semantics/Intensional.lean` | **Intensional action premodels and models** (26 September), the form of Cian's draft *Boolean Completeness without Rigid Comprehension*: a relation is an intension, a set of tuples `⟨x̄, h⟩` with the arrow last (`Args`, `Tuple`, `Intension`), an arrow acting by precomposition; application `A @ x` commutes with the action of arrows for every intension; the premodel supplies the inner actions and an injective natural inclusion into the intensions, and nothing else; the readings of the constants as sets of tuples, the type-subscripted operations uniformly at every relational type; `sem`, `Holds`, `IsModel`. |
| `Semantics/IntensionalSoundness.lean` | **Soundness of intensional action models.** Transport and η in every premodel; **the Boolean operations are set operations** (`app_negRead`, `app_andRead`, …); substitution, β, δ (a lemma per operation), conversion; the rules of `Derivable`; the eleven identities and Existence; `theorem_holds`, `theoremWith_holds`, `entails_holds`. |
| `Semantics/IntensionalFacts.lean` | The clauses for `□` and `◇`; `⊥` fails, `¬P` holds iff `P` fails, `□P` gives `P`; **an axiom set true in an intensional action model is consistent** (`Consistent.of_model`, the name the results use) and a sentence failing in it is not a theorem; `ND_σ` iff injective, `BF_σ` if surjective, the Fregean Axiom iff propositions agreeing at the identity are equal; **truncation**, the readings transferring by `rfl`. |
| `Semantics/IntensionalFull.lean` | **Full intensional models**: the actions of intensions, of products and of the point; the full domains by the mutual recursor (`FullT`, `FullArgs`, `FullR`), the bijection `fullArgs` between the two spellings of the arguments, the inclusion as its preimage; `Premodel.full`; **`full_isModel` in two lines**, every intension being inner; `full_bf_surjective`. |
| `Semantics/IntensionalProperties.lean` | Propositionally full and full; `sem_pure`; **No Pure Contingency in every one-object model**; the Fregean Axiom fails in every propositionally full model with a second arrow out of the base. |
| `Semantics/IntensionalExamples.lean` | The M-set models ported: `Intensional.MSet.model`, `Idem.not_nd_t`, `Idem.not_bf_t`, `Idem.not_fregean`, `Invol.box_nd`, `Invol.box_bf`, `Invol.not_fregean`; these are what `Results/Consistency/Consistency.lean` now cites. |
| `Syntax/Constants.lean` | `Term.consts`, the constants a term mentions, finite. |
| `Semantics/IdeallyFull.lean` | **Appendix D's technique** (26 September): agreement of arrows on a set of individuals, pinning, finite pinning, the subaction of finitely pinned elements; the ideally full domains by the mutual recursor and `Premodel.ideal`; pinning in any premodel (`PinnedO`), closed under the set operations and application; the induction `sem_pinned` and **Proposition D.4** in two forms, `isModel_of_pinned` for any premodel whose inner elements are exactly the finitely pinned ones, and `ideal_isModel` for the construction; **Proposition D.6**, `BF_σ` at every type when every arrow out of the base is surjective on individuals (`ideal_bf_of_surjective`, by pulling an intension back along the arrow); and the paper's Part 3 argument, `BF_σ` when every arrow out of the base agrees on any finite set with one surjective on individuals (`ideal_bf_of_approx`, 28 September). |
| `Coalesced.lean`, `Coalesced/` | **Coalesced sums** (Appendix E, 31 October), for intensional action models and any root arrows (`RootArrows`: the action of the root arrows into the components, and root endo-arrows): the category `CoalescedSum`; the premodel from a root action and a root inclusion (`RootAction.coalescedSum`), equal to the components at component objects by definition; **transport** (`RootAction.sem_transport`): along a root arrow the sum is the component re-based with the transported constants (`Premodel.rebase`); **root closure** (`RootAction.isModel_iff`) and the fullest domains (`isModel_of_fullest`); the truncation by a root arrow and ◇ at the root (`truncate_arr_sem`, `holds_dia_of_component`); root domains by recursion from a domain selector (`Selector`, `selAction`, `rootClosed_iff_selected`; `fullAction`); over distinguished arrows, Appendix E and **Theorem 3.26** (`isModel_distinguished`, `theorem_3_26`, `coalesced_sum_theorem`). |
| `Coalesced/Complete.lean`, `Coalesced/SumData.lean` | **Complete components and the map's group `coalesced-sums`** (31 October): with complete components (`RootAction.CompleteComponents`) every sentence consistent with `C` is possible at the root, so Maximalism holds there in both forms (`holdsAx_possibility_of_complete`, `holdsAx_distinctness_of_complete`; for the signature, `holdsAx_possibilityC_of_complete`); the complete family (`canonicalFamily`) and the maximalist root (`maximalist`), whence **Maximalism is consistent** (`maximalism_consistent`); the group's parameter `SumData` (any root arrows, any root domains, the proof of being a model), its conditions `CompleteComponents`, `DistinguishedArrows`, `FreeRootComponent`, what they give (extensional fullness at the root, Relational Choice, the Axiom of Infinity at `e`, the isolated actual world), and three members: `maximalistRoot`, `singleIndividualData`, `constantIndexedData`. |
| `Coalesced/Transfer.lean` | **Transfer from a component's root to the root** (1 November): over distinguished arrows with the fullest root domains, the factorization of root arrows through the distinguished ones (`SumData.fac`), the **thread** with a given extension at the root and given parts in the components (`SumData.thread`), inclusion of root entities componentwise (`incl_subset_iff`, `single_subset_iff`, `subset_single_iff`); BF and Atomicity at `t` fail at the root when the components are complete (`not_holds_barcanT`, `not_holds_atomicityT`), with the semantic forms `Premodel.holds_bf_iff` and `Premodel.holds_atomicity_iff`. |
| `Semantics/Glued.lean`, `Models/GluedFreeMonoid.lean` | **Gluing constants at sites and the map's group `glued-free-monoid`** (1 November): sites at the base of a full model (`Sites`: endo-arrows through which arrows are told apart, along which the individuals glue), the entity glued from one at each site (`Sites.glue`, `map_glue`), the glued model (`Premodel.glued`), whose truncation along a site is the full model with that site's values (`truncate_site`); a pure formula with constants put for its block holds iff it holds of their values (`holds_atConsts`); **Witnessed Possibility** with rich values (`holdsAx_witnessedPossibility`) and **Logical Necessity** on one object (`holdsAx_logicalNecessity`); rich values by sentences (Bacon's Theorem A.8, `bySentences`) and by formulas (`byFormulas`). The group's parameter `GluedData` and three members at `Σ = {c : t}`: the free monoid on the sentences with thread or single individuals (`freeMonoidThread`, `freeMonoidSingleton`) and the double retraction with free sites at `W₀` (`doubleRetractionSites`, where Possibly Witnessed Possibility fails and Pure B holds). `Models/GluedFreeProduct.lean`: the fourth member, over `F_∞ * E * B * ℤ₂` (`Monoid.CoprodI`, the bicyclic factor generated by `pred` and `succ`), whose free generators are sites by the normal form at the free factor (`FreeProd.sites_sep`), with Logical Necessity and the conditions on arrows; not yet its `unique-retractions-everywhere`. |
| `Results/Lists.lean` | **Restricted ⇔ list** (1 October): for twenty-one of the twenty-five principles with a list form (Modalized Plenitude by an induction on the list of theorems of `C`, its step using the tail necessitated), `P.schema ⟹ P.listSchema`, the converse of the generated `P.listSchema ⟹ P.schema`. Thirteen by induction on the list, from two-element forms (`P.BarcanCons`, …) whose shallow steps are certified and vectorized; Plenitude, its boxed form and Actual Profile by coding a tuple `x₁ … xₙ` as the object `λR. R x₁ … xₙ`; the four theorems of `C` from their list entailments. |
| `Certified/Signatures.lean` | **Each principle at every signature**: `#classicism_schema_in` declares `P.X.schemaIn` (and `P.X.listSchemaIn`), the schema read in the signature's language; `pureVersion S`, the pure version of a signature-relative schema (No Pure Contingency is `pureVersion noContingency`); `distinctnessC`, `possibilityC`; the equations between `npc`, `pureB` and those pure versions at the pure signature. |
| `Semantics/IntensionalTheory.lean` | **The theory of a model**, the sentences holding in it: consistent, complete, and entailing exactly the schemas that hold in the model, which is what composes a model's verdicts into the map's model statement; **the pure reduct**, in which a pure schema read in the signature holds iff it holds in the model. |
| `Statements.lean` | **The map's statements**, generated by the map's own generator from its YAML (`pmap lean classicism`): one `Prop` per result whose principles all have a Lean schema, reading "every schema entailing the premises entails the conclusion" (for an incompatibility, "is inconsistent"), at every signature, and one per form, "a schema entails the principle iff it entails the form". Not edited by hand. |
| `Map.lean` | **The certificates**: one theorem per map result proved, named by its id, and one per form of a principle, named `<principle>.<form>`, of the generated type, each one line citing the result's proof (`foo.entails`, the theorem at every arity, or the metalogical theorem); the glue that carries a pure entailment to every signature. These are the map's `lean_ref`s. |
| `ModelStatements.lean` | **The models' verdicts**, generated likewise from the model records' `lean.verdicts`: that the record's Lean model is a model, and that the principle holds in it, or fails. Not edited by hand. |
| `MapModels.lean` | **Their certificates**, `Models.<model>.<principle>`, each citing the verdict proved in `Models/`; and the models' proofs that they meet conditions, `Map.Meets`. |
| `Models/Conditions.lean` | **The map's conditions on models**, as predicates: a topic's on premodels, the finite-support group's on the monoid. |
| `MapArguments.lean` | **The general arguments' certificates**, `Arguments.<argument>.<principle>` (or with the group first): every model meeting the conditions has the verdict. |
| `MapDerived.lean` | **The verdicts the arguments give the models**, generated by the map: each argument's certificate applied to the model's proofs of its conditions. Not edited by hand. |
| `Tools/MapIndex.lean` | `#classicism_map_index`: for each certificate, its file, lines and axioms, and the files and lines of the result's proofs (`map/index.json`, by `scripts/MapIndex.lean`), for the map's links. |
| `Principles/*.lean` | **The principles and their equivalent forms**: each form (a dual, an LUB form) is defined beside the official one, with the shallow proofs of the two directions, `P.X.to_<form>` and `P.X.of_<form>`, certified by the same audits as the records. The list forms are defined by vectorization and their equivalences are in `Results/Lists.lean`. |
| `Results/Arity.lean` | **Results at every arity**: shallow cores at a Rel-parameter, using the modal laws of `Pointwise`, which are at every arity already; unary cores at `σ → t` for the results that use BF over the tuple, vectorized, and reaching every relational type as `σs ⇒* t` (`schema_subset_args`); and their compositions with certified entailments into the map's records at every arity (`c5_and_actuality_imply_rigid_comprehension`, `extensionality_r_implies_atomicity_r`, …); the Boolean Completeness and Plenitude records, from their unary proofs in `Results/Records.lean`, vectorized; and Actual Profile over the empty list as Actuality. |
| `Models/Permutations.lean` | **Appendix D, Part 1**: the ideally full model over the permutations of `ℕ`. `□ND_σ`, `□BF_σ`; Actuality fails, Atomlessness holds, Atomicity at `t` fails, each a theorem about the quoted principle, from one cut lemma. |
| `Models/MonoidModel.lean` | **The ideally full model over any monoid acting on `ℕ`** (26 September, later): a proposition is a set of monoid elements, pinned down by `N` iff membership depends only on the values on `N` (`pinnedO_iff`); the cut lemma; the verdict lemmas parametrized by the fact about the monoid that decides each: `ND_e` fails at a non-injective arrow, `BF_σ` holds when every arrow is surjective (D.6), `BF_e` fails at a test property, Actuality iff `{1}` is finitely pinned (`Free 1` against), Atomlessness when every arrow is free, Atomicity at `t` when every nonzero proposition contains a finitely pinned singleton. |
| `Models/Monoids.lean` | **Appendix D, Parts 2 to 8**: the monotone surjections, the monotone functions, those collapsing `0, 1` unless the identity, the surjective ones among them, the truncations `gₙ`, the roundings `f_{2^j}`, the shifts `kₙ`, each a `Submonoid (Function.End ℕ)`, each verdict an instance; the monoid-level facts (`BCWitness`, `BFWitness`, `OnePinned`, `Singletons`) named, for reuse by the pointed models. **Boolean Completeness at `e → t` fails in all eight parts** (28 September; `MonoidModel.not_bc_of`, the semantic criterion `Premodel.holds_bc_iff`). |
| `Models/Functions.lean` | Categories of sets and a class of functions between them, and the ideally full model on one (`FunCat`); `BF` from approximation by surjections. |
| `Models/ContingentBarcan.lean` | **`BF` without `□BF`**, the paper's two-object model after Part 8: `ℕ` and a point, all functions as arrows. |
| `Models/Pointed.lean`, `Models/PointedParts.lean` | **A monoid model with a point adjoined**, the paper's other two-object construction, for any monoid of functions on `ℕ`: the verdicts at the point (everything holds), at `ℕ` (as in the one-object model, except that `ND_e` and Atomlessness fail), `□P` and `◇P` from the two; the paper's `◇(□ND ∧ Atomicity)`; the eight parts with a point adjoined. |
| `Models/README.md` | The verdict table of all eight parts, the eight pointed variants, and the **survey of two-object variants** — which further consistency facts the paper's "adjoin a second object with no arrows back" would add to the map, and how many. |
| `Syntax/Blocks.lean` | **Blocks of variables** (1 October): a block of variables over a context (by `List.reverseAux`, so that no cast is needed), tuples of terms `Terms`, taken apart by projections so that every operation computes on a tuple of known length; block application, abstraction, quantifiers, and identity as a conjunction (`⊤` for the empty block, the identity itself for one); the block constants `allC`, `exC`, `eqC`; block β and η; the pointwise operations at `σs ⇒* ρ` (`Conv.negR_block` and kin); holes over a block; and the quantifier and identity rules over a block, derived. A one-element block is the unblocked form on the nose. |
| `Syntax/Vectorize.lean` | **Vectorization**: an assignment of lists of types to type variables, and the translation along it of types, contexts, variables, terms and holes. The generic translation `Term.vecG` commutes with substitution and preserves conversion; the readable one `Term.vec` treats `∀x:σ. φ` and `a = b` as units, by one `Term.rec` carrying a view of each subterm, and converts to the generic one. |
| `Syntax/VectorizeDerivable.lean` | **The vectorization theorem**, `Derivable.vec` and `C.Theorem.vec`: a derivation survives vectorization, rule by rule. |
| `Certified/Vectorized.lean` | Checks: Barcan, Functionality and Relational Choice at `[]`, `[σ]` and `[e, t]` by `rfl`, and the list form of `barcan_r_implies_functionality_r` at every list. |

## Conventions worth knowing

- The signature variable is written `Sig`, because `Σ` is reserved syntax in Lean.
- `σ ⇒ ρ` is `RTy.arr σ ρ`, right-associative, and a relational type coerces to a type
  where one is expected, so `RTy.t ⇒ RTy.t ⇒ RTy.t` is the type of `∧`.
- `Term.v0`, `v1`, `v2` name the three innermost variables; in an axiom written
  `λpq. …`, `p` is `v1` and `q` is `v0`.
- Renamings and substitutions are functions taking their type argument explicitly,
  `r _ v`; recursive definitions over terms quantify the context inside, since `lam`
  changes it.
- This layer is ordinary Lean. `funext`, `propext` and choice may be used, and none of the
  audits of the other layers runs here: it is a theory of Classicism's proofs, not a proof
  in Classicism. Its trusted base is the definition of `Derivable`.

## The `C`/`C⁻` line

A derivation in context `Γ` may use the variables of `Γ`, and a closed derivation has
none. So from the eleven identities alone there is no term of type `e` at which to
instantiate `EG`, and `∃x:e. x = x` is not derivable: the contextual system is
existentially neutral at `e` by itself, the paper's `H⁻`. At every relational type the
closed term `λx. ⊤` exists and Existence is derivable. That is the line the shallow layer
drew with the axiom `e_exists`, here for a structural reason.

## The denotation

`Term.denote I` reads a term as a Lean value, given an interpretation `I` of `e` and of the
constants; `t` is `Prop`, so a sentence denotes a proposition. With `Prop` as `t` this is
the paper's full Henkin model. Soundness says a theorem of an axiom set that holds in `I`
holds in `I`, Subst included, by the congruence of filling a hole; Existence at `e` holds
when the domain is inhabited, so Lean's `Prop` is a model of Classicism and `C` proves no
falsehood of it, in particular not `⊥`. The eleven identities hold in `Prop` too, each by
`propext` and `funext`, a corollary of soundness kept as a direct check. The reflection
examples check that reading back a sentence gives the proposition it abbreviates, by
`rfl`: `⊤` reads back as `(∀p. p) ∨ ¬(∀p. p)`, `→` as `imp`, and an identity as the
statement of the shallow theorem. That equation, `⟦⌜p⌝⟧ = p`, is what the quoter is held
to. The readings of types are reducible, so that `⟦t⟧` *is* `Prop` to instance search and
to `simp`.

## The quoter

`Tools/Quote.lean` is a meta-program reading a shallow statement as object syntax: `Prop`,
`e`, arrows and guarded type parameters as types; `∧`, `∨`, `¬`, `→`, `↔`, `∀`, `∃`, `=`,
`True`, `False`, `□`, `◇`, the operations of `Rel` at a type parameter as the constants
`andR τ'` and the rest, and any other definition of the library through its body, so that
a principle quotes through its definition and an operation at a concrete type through its
instance. `#classicism_quote foo` declares `foo.quoted`, the sentence with the theorem's
type parameters read as metalogical ones (`Ty` for a `Ty`-guarded parameter, `RTy` for one
guarded by `Rel`, `Order` or `Pointwise`), and `foo.reflect`, the kernel-checked theorem
that reading the sentence back in the standard interpretation with domain `e` gives the
statement with each type parameter read as `⟦σ'⟧` and each instance as the class's
instance on that reading (`Semantics/Relational.lean`). Reflection is by `rfl` where the
reading is definitional, and otherwise by rewriting: the shallow `p → q` is read as
`¬p ∨ q`, `↔`, `□` and the operations at `t` likewise, and the definitions the statement
uses are unfolded (`reflectSimpSet`, `reflectDefs`). A failure of the rewriting is fatal,
not turned into `sorry`. `Certified/Quoted.lean` runs it over the record theorems at build
time.

## The translator

`Tools/Translate.lean` is the second half: `#classicism_derive foo` reads the **gated
shallow proof** of `foo` and declares `foo.derivable : ∀ σ' …, Theorem C.axioms(Minus)
(S σ' …)`, a derivation of the quoted statement that the kernel checks. The chain is then
two links for each theorem: the shallow proof in Lean under the gate, and a derivation in
`H` closed under Subst as an object of Lean, both kernel-checked, the translator
untrusted.

**What is translated to what.** A gated proof term is made of the logical inductives'
constructors, eliminators and recursors (`And.intro`, `Or.elim`, `Exists.casesOn`, …),
the identity plumbing that `rw`, `calc` and `▸` emit (`Eq.mpr`, `congrArg`, `Eq.ndrec`,
…), lambdas over hypotheses and over objects, applications, the axioms `em` and
`e_exists`, theorems of this library, and the two gated primitives. Each of the first
kinds is one rule of `Derivable` or a derived rule of `Syntax/Derivation.lean`
(`congrArg` is `LL` at a predicate, `Eq.ndrec` the same with the motive as the predicate,
the `β`-variants `allEβ`, `llβ` matching Lean's typing of an application, which
substitutes). A library theorem cited in a proof is translated **once, at object-type
variables** for its type parameters, as `c.derivable : ∀ σ' … ρ' …, Theorem Ax (S σ' … ρ' …)`,
and cited through `Derivable.ofTheorem` at the object types its type arguments quote to.
And the two primitives are where the gate pays off: `propext h`, whose `h` mentions no
hypothesis, becomes **Subst** at the hole `a = ⬚` with the two directions of `h` as its
premises, and `funext (fun x => h)` becomes `substEq` at the hole `f = λv. ⬚`, closed by
η at both ends. The premises of a Subst are derived at the logical part of the axiom set
(`withLogical`, one nesting per Subst inside a premise), and a theorem cited there is
lifted into it by `mono`.

**A law of a class at a type parameter is derived by induction on the type.** The shallow
classes `Rel`, `Order` and `Pointwise` hold their laws as fields, each proved once at
`Prop` and once at `σ → τ` from the law at `τ`. A proof that cites such a law at a type
*variable* cites no axiom and no theorem, and there is no one derivation of the law:
there is one for every object type, by induction on it. `ensureFieldInduction` builds it
through `RTy.rec`: the base case is the translation of the `Prop` instance's proof (a
`propext`, so a Subst), the step the translation of the arrow instance's proof (a
`funext`, so a `substEq`) with the law at the smaller type, cited through the instance
variable, as the induction hypothesis. The law at a constructor type has its operations
unfolded first, `unfoldConv`, by `Conv.delta` under congruences. This is the use of the
metalogical layer the shallow layer cannot provide: induction on the structure of a
relational type.

**Conversion.** Where Lean's kernel silently β-reduced, the object language has the rule
`conv`, and the certificate is one reflective lemma: `Syntax/Normalize.lean` has a
verified βη-normalizer `Term.nf`, and `Conv.of_nf n a b rfl` is a conversion proof the
kernel discharges by evaluation. An untyped shadow of the syntax, `Tm`, decides where a
conversion is needed and with how much fuel; the two trees are descended together by
congruence while their roots are stable, and `of_nf` joins the subterms at the first
difference (`diffConv`); where no conversion is needed the derivation is used as it is.
Everything is built directly as an expression with every implicit argument supplied,
never through unification; `Classicism.Meta.Translate.check` type-checks each node for
debugging, `.profile` prints the time by phase, and `.progress` a file to watch.

**What it costs.** `#classicism_derive_audit` over every theorem of the shallow library —
`Modal`, `Order`, `Comprehension`, `Pointwise`, `Lattice`, `Results/Records` — derives
95 of 95 in nine seconds for the whole run. The kernel's cost is evaluating
substitutions where a rule concludes `b[a]`, which is why `rename`, `subst`, `prename`
and `step` are written through `Term.rec` directly, with `rfl` equations as their simp
set and the structural version for the compiler (`implemented_by`). The translator
restores its memo tables after each nested declaration, since what they hold for a cited
lemma's proof is of no use to the enclosing one.

## Action models

`Semantics/Action.lean` and `Semantics/ActionSoundness.lean` (23 September) are the paper's §"Action models"
and the soundness half of its appendix "Soundness and completeness of action models for
Classicism", formalized directly, for the purpose of model evidence on the map: a
non-implication record is an action model of `C` and the antecedent refuting the
consequent, and soundness makes that a proof of non-derivability.

**The definitions.** An action of a category is a functor `C ⥤ Type`. An action
premodel (`Premodel Sig C`) on a rooted category supplies an *inner* action `-^σ` for
every type, nonempty at `e`, and a value at the root for each constant. Following Cian's
reformulation, every type also has an *outer* action `-^[σ]`, *defined* from the inner
ones by recursion on the type (`RawR`, `RawT`): `-^[e] = -^e`; `-^[t]` the powerset
action, sets of arrows out of `W` with `h` acting by division; `-^[σ→ρ]` the functions on
pairs `⟨h : W → V, x ∈ V^σ⟩` — an inner argument — into `V^[ρ]`, an outer value, with no
well-behavedness asked. The premodel then supplies the subaction, an injective natural
map `incl` from each inner relational domain into the outer one, and the paper's two
conditions on inner elements of arrow type: they are well-behaved
(`i^ρ (α⟨h, x⟩) = α⟨h ≫ i, i^σ x⟩`) and take inner values.

`RawR` is written through `RTy.rec` as a reducible definition, so that `RawR inner .t W`
*is* a `Set` to instance search and the `∈`, `∩`, `ᶜ` and `ext` of sets apply to it.
Since type variables joined the syntax (1 October) the recursor has a case for `Ty.var`:
a variable's outer domain is its inner one, as at `e`, so a variable is valued by the
premodel's `inner` and nothing has to be chosen. The default element `dflt`, built at `e`
from its nonemptiness, is defined at relational types only, the only place it is used.

**The interpretation** `sem h t g` is total: the value of a term relative to an arrow
`h : W₀ → W` and an assignment `g` of inner elements at `W` is an outer element at `W`,
by the paper's nine clauses. The paper's interpretation is partial at exactly one place,
an application whose argument's value is not inner; there `apply` takes a default. An
**action model** (`IsModel`) is a premodel in which no value is ever outside the inner
domain — the paper's definition — and in a model the two interpretations agree
everywhere. `Holds h p g` is `id_W ∈ ⟦p⟧^g_h`.

The seven type-subscripted constants are read by recursion on the type, each clause
written as the reading of its unfolding, so the δ-rule preserves the value by `rfl`.

**Soundness.** `sem_push` is the transport lemma `⟦A⟧^{i∘g}_{i∘h} = i^σ ⟦A⟧^g_h`; its
application case is where the model condition is used, through well-behavedness.
`sem_rename` and `sem_subst` pull an assignment back (the substituted terms' inner
elements, provided by the model condition); `sem_beta`, `sem_eta`, `sem_delta`, and
`sem_conv`. The "more helpful form" of the clauses — `holds_conj`, `holds_forall`,
`holds_eq` and the rest — then carries each rule of `Derivable`: `sound` says a
derivation from hypotheses holding at an arrow and assignment, in a theory whose axioms
hold at that arrow, has a conclusion holding there. The eleven identities and Existence
hold at every arrow of every action model (`axioms_holds`), each identity reduced by
`holds_eq_lam2`/`holds_eq_lam3` to its two bodies holding together at every arrow and
assignment. So: `theorem_holds`, a theorem of `C` holds in every action model, and
`theoremWith_holds`, a theorem of `C` plus an axiom set holds in every action model of
that set.

**Full models** (`Semantics/ActionFull.lean`, later on 23 September). The powerset action and the
exponential action of two actions are functors `C ⥤ Type`; the full inner domain at a
type is defined from them by recursion (through the recursor, as a reducible definition,
so that the domain at `t` *is* a `Set` to instance search); `Premodel.full` is the full
premodel on any rooted category given an action for `e` with nonempty domains and an
interpretation of the constants. **`full_isModel`**: it is an action model. The paper
states this as evident; the proof is a combined induction on terms — inner-ness and the
transport lemma together, since the application case of each needs the other — with the
six logical constants checked one by one to be well-behaved at both levels, and the
type-subscripted constants by an outer induction on the size of their type, each reading
as its unfolding does (`Term.rsize`, `fullP_all`).

**Facts and examples** (`Semantics/ActionFacts.lean`, `Semantics/ActionExamples.lean`). `ND_σ`, `BF_σ` and
the Fregean Axiom as sentences; `holds_box`; the paper's Proposition: `ND_σ` at an object
iff every `h^σ` out of it is injective (`holds_nd_iff`), `BF_σ` if every `h^σ` is
surjective (`holds_bf_of_surjective`); and the Fregean Axiom iff propositions agreeing at
the identity arrow are equal (`holds_fregean_iff`). Then the first two of the map's
models: `MSet.model M`, the full model on the one-object category of a monoid `M` with
one individual. On the idempotent monoid `{1, k}`, `k·k = k`: `k^t` sends both `∅` and
`{1}` to `∅`, so `ND_t` fails (`Idem.not_nd_t`), and `⊤` and `{1}` agree at the identity
but differ, so the Fregean Axiom fails (`Idem.not_fregean`) — the record
`full-idempotent-monoid`'s `distinctness-necessary-t` and `fregean-axiom`. On the
two-element group, every arrow is an isomorphism, so `□ND_σ` and `□BF_σ` hold at every
type (`Invol.box_nd`, `Invol.box_bf`) and the Fregean Axiom fails — `full-involution-group`'s
`necessary-distinctness-necessary-r` and `fregean-axiom`. Each verdict is a theorem about
the same object-language sentence the derivations use, so these are the first
kernel-checked model verdicts on the map.

Two Lean lessons from the day, for whoever continues: the projections of a concrete
premodel (`(full …).W₀`, `.incl`) are definitionally but not syntactically the plain
values, and `rw` and instance search see the syntax, so a proof about a particular model
should first `change` its goal to the plain form; and a Mathlib morphism in `Type` is a
bundled structure, made with `TypeCat.ofHom`, whose application is `rfl`.

The paper's (iii) — in a full model `BF_σ` at the root forces every `h^σ` out of the root
to be surjective — is `full_bf_surjective`, with the "image of the root" predicate
`rootImage` as the inner element; so `BF_t` fails in the idempotent model (`Idem.not_bf_t`,
the record's `barcan-t`), since `k^t` misses `{1}`.

**Truncation** (`Semantics/ActionFacts.lean`, last on 23 September). The paper's truncation of a
premodel by `h : W₀ → V` is `Premodel.truncate`: the same actions with `V` as base and
each constant's value moved along `h`. The paper also discards the objects with no arrow
from `V`; nothing here needs rootedness (the paper's footnote says as much), so the
`rooted` field was dropped from `Premodel` and the truncation lives on the same
category, which makes the transfer lemma `sem_truncate`, `⟦A⟧_{A_h, i} = ⟦A⟧_{A, i∘h}`,
an induction on the same terms. One thing had to be done by hand that the paper does not
mention: the readings of the constants are stuck recursions on the type with the whole
premodel as an argument, so Lean cannot see that they ignore the base and the constants,
and each is transferred by its own lemma (`truncate_constRead` and the rest). Then
`isModel_truncate`, the clause for `◇` (`holds_dia`), and **`dia_iff_truncate`**: `◇P`
holds in `A` iff `P` holds in one of its truncations; `box_iff_truncate` likewise for
`□`.

Not yet: the remaining verdicts of the two records, the intrinsic fullness criterion,
and the infinite models.

## Intensional action models

`Semantics/Intensional.lean` and the five modules after it (26 September) are the same
theory in the **intensional** form of Cian's draft *Boolean Completeness without Rigid
Comprehension* (§"Intensional action models"), which *Classicism* sketches and whose
Appendix E uses under the names `Int` and `App`. The decision (26 September, Cian): the
models of Appendix D and the draft's symmetric ideally-full models are built in this
form; the applicative modules `Action*.lean` stay as they are, a piece of formalized
mathematics and a resource, with nothing on the route to a certificate depending on them;
`Results/Consistency/Consistency.lean` takes its model facts from the intensional M-set
models. The two layers share `Semantics/Env.lean` (assignments) and
`Syntax/Sentences.lean` (`ND_σ`, `BF_σ`, the Fregean Axiom).

**The definitions.** An outer element at `τ = σ₁ → ⋯ → σₙ → t` is an *intension*: a set
of tuples `⟨x₁, …, xₙ, h⟩` with `h : W → V` and each `xₖ` inner at `V^{σₖ}` (`Args`,
`Tuple`, `Intension`), an arrow acting by precomposition (`Intension.map`). Where the
applicative form takes an element of `W^{σ→ρ}` to be a well-behaved function on pairs
`⟨h, x⟩`, here it is the set of the tuples the function accepts; application is
`A @ x = {⟨ȳ, h⟩ | ⟨h^σ x, ȳ, h⟩ ∈ A}` (`Intension.app`), and it commutes with the action
of arrows for *every* intension (`app_map`), which is what well-behavedness bought
before. A premodel supplies the inner actions, nonempty at `e`, an injective natural
inclusion of each inner relational domain into the intensions, and the constants; the
two conditions on inner elements of arrow type are gone. `apply`, the application of an
intension to an outer argument, is total: the tuples with an inner witness for the
argument's transport, which is `A @ x` when the argument is inner (`apply_Incl`). The
readings of the logical constants are sets of tuples whose membership ignores the arrow,
and the seven type-subscripted operations read *uniformly* at every relational type:
`¬_ρ` is complement, `∧_ρ` intersection, `≡_ρ` agreement of extensions, `□_ρ` holding
under every arrow, `⊑_ρ` inclusion of extensions (`negRead`, `andRead`, …). `IsModel` is
as before.

**What it bought.** Transport (`sem_push`) and η hold in every premodel, the model
condition entering only where an inner witness is chosen: substitution, β, δ, and the
clauses for the connectives. The **Boolean operations are set operations** at every
relational type (`app_negRead`, `app_andRead`, `app_inclRead`, …), the draft's lemma of
that name, so the δ-rule is a lemma per operation (`sem_delta`), where the applicative
form read each constant by recursion on the type. The readings depend on the actions and
the inclusion alone, so they transfer to a truncation by `rfl`, and the per-reading
`truncate_*` lemmas are gone. And **a full premodel is a model at once**
(`full_isModel`): every intension is the inclusion of an element of the full domain, so
the combined induction of `ActionFull.lean`, with its second induction on the size of the
type subscripts, becomes two lines. The full domains are built by the mutual recursor
(`FullT`, `FullArgs`, `FullR`, from `intensionAction`, `prodAction`, `pointAction`); at a
variable type the arguments `Args (FullT De) ρ V` and `(FullArgs De ρ).obj V` are the same
product written twice, related by the explicit bijection `fullArgs`, and the inclusion is
the preimage under it. The M-set models and their verdicts port with the same statements
(`Intensional.MSet.model`, `Idem.not_nd_t`, `Idem.not_bf_t`, `Invol.box_nd`, …), a
proposition now a set of tuples `⟨(), m⟩`.

Two Lean lessons. An arrow of a one-object category written `(k : star ⟶ star)` for
`k : M` does not fix the objects of a functor's `map`, which then wants them named
(`(X := …) (Y := …)`). And a membership `p ∈ F.obj W` needs `F.obj W` to reduce to a `Set`
at reducible transparency, so the actions of intensions, products and the point are
`abbrev`s, and where `∈` is used the elements of a full domain are typed as sets.

## Appendix D: ideally full models

`Semantics/IdeallyFull.lean` and `Models/Permutations.lean` (26 September) are the paper's
Appendix D, "Consistency results using non-full action models", in the intensional form,
and its Part 1. Cian's own appendix; its descriptions are, in his word, sketchy, and this
is the rigorous version.

**The technique.** Fix the action for `e`. Two arrows agree on a set `N` of individuals
when they send its members alike (`AgreeOn`); an element of an action is pinned down by
`N` when two arrows agreeing on `N` act on it alike (`PinnedBy`, Definition D.2), and
finitely pinned when some finite `N` does (`FinPinned`): the ideal of finite subsets, the
one ideal the paper's examples use, is built in rather than parametrized. The finitely
pinned elements of an action form a subaction (`pinnedAction`, closure (i) of the draft:
the action of `h` on an element pinned by `N` is pinned by `h[N]`). The ideally full
domains are then defined exactly as the full ones, with `pinnedAction` around the
intensions at each relational type (`IdealT`, `IdealArgs`, `IdealR`, the bijection
`idealArgs` between the two spellings of the arguments, and `Premodel.ideal`).

**Proposition D.4.** The paper proves that an ideally full premodel is a model through the
combinator form of the sufficiency condition. Here it is the induction on terms that full
models no longer needed, and it is stated for any premodel first: `PinnedO B σ N x` reads
pinning through the premodel's own action for `e` and its outer action at `σ`, and
`sem_pinned` says that if `N` pins every value of the assignment and every constant the
term mentions, it pins the term's value. The cases are the draft's closure lemma. A
variable or constant by hypothesis; the logical constants by `rfl`, their readings not
seeing the arrow; an application because application commutes with the action of arrows
for every intension (closure (iii), `pinnedO_apply`); and an abstraction because its value
depends on the arrow only through the constants (`sem_congr_const`, the generalization of
`sem_pure`) and on the assignment, both of which two arrows agreeing on `N` treat alike.
`isModel_of_pinned` then makes a model of any premodel whose inner elements are exactly
the finitely pinned ones, taking for a term the union of the finite sets that pin the
assignment's values and the term's constants (`Term.consts`, finite, is what lets this
work over any signature); `ideal_isModel` is its instance for the construction.

**Part 1** (`Models/Permutations.lean`). The one-object category of the permutations of
`ℕ`, the identity action for `e`, the ideally full model over it (`Perms.model`, a model
by D.4). A proposition is a set of tuples `⟨(), g⟩`, one per permutation, pinned down by a
finite `X` when two permutations agreeing on `X` are in it together
(`mem_iff_of_pinned`). One lemma does the work, **the cut** (`exists_ssubset_of_mem`): a
finitely pinned proposition containing `k` has a finitely pinned proposition strictly
below it still containing `k`, namely its intersection with "`h n = k n`" for an `n`
outside the pinning set; it is strictly below because the proposition also contains
`swap (k n) m ∘ k`, which agrees with `k` on the pinning set and sends `n` elsewhere. Then
the verdicts, each about the quoted principle: `□ND_σ` and `□BF_σ` (`box_nd`, `box_bf`,
every arrow an isomorphism); **Actuality fails** (`not_actuality`, the cut at `k = 1`);
**Atomlessness holds** (`atomlessness`, the cut at any `k` in `p`); **Atomicity at `t`
fails** (`not_atomicityT`, `⊤` has no atom below it, since the cut refutes atomhood of
any nonzero proposition). `not_atomicity_t` restates the last for the `t`-instance of the
type-indexed schema, whose `¬_t` and `∨_t` read as `¬` and `∨` do, by `rfl`.

`Results/Consistency/Consistency.lean` turns these into the facts the map's records need
(`Perms.not_actuality_consistent`, `Perms.nd_bf_atomless_consistent`, …), and
`Incompatibilities.lean` gets `maximalist_necActuality_inconsistent` and
`maximalist_necAtomicity_inconsistent`, two of the maximalist incompatibilities that were
waiting on a model. The model's Boolean Completeness failure, which the paper gets from
Proposition 2.5, waits on that proposition's certification.

**Proposition D.6** (`ideal_bf_of_surjective`, in `IdeallyFull.lean`). If every arrow
out of the base is surjective on individuals, `BF_σ` holds at every type in the ideally
full model. The paper argues through a right inverse; here an intension `b` at the far
end of an arrow `k` is pulled back to `pullback k X b` at the near end, the tuples whose
image agrees on `X` with something in `b`, which is pinned by `X` when `b` is pinned by
`k[X]` and is sent onto `b` by `k` when `k[X] = Y`; so the action of every arrow is
surjective on the inner domain at every type, and `holds_bf_of_surjective` finishes.

**Parts 2 to 8** (`Models/MonoidModel.lean`, `Models/Monoids.lean`). The seven remaining
one-object models are all of one shape, the ideally full model over a monoid `M` acting
on `ℕ`, so the shape is done once: `MonoidModel.model M` for any `[Monoid M]
[MulAction M ℕ]`, a proposition a set of monoid elements (`tup g`), pinned down by `N`
iff membership depends only on the values on `N` (`pinnedO_iff`), the cut lemma of
Part 1 generalized (`exists_ssubset_of_mem`), and the verdicts each parametrized by the
one fact about the monoid that decides it: `ND_e` fails at any non-injective arrow
(`not_nd_e_of_not_injective`); `BF_σ` holds when every arrow is surjective, by D.6
(`bf_of_surjective`); `BF_e` fails when some property `λy. ψz → φy`, pinned by `{z}`,
is necessarily true of every actual individual yet not of all (`not_bf_e`, the paper's
"any arrow sending `1` to `0` sends everything to `0`"); Actuality holds iff `{1}` is
finitely pinned, which fails when the identity is *free* — perturbable off any finite
set (`actuality_of_pinned_one`, `not_actuality_of_free`); Atomlessness holds when every
arrow is free (`atomlessness_of_free`); Atomicity at `t` holds when every nonzero
proposition contains a finitely pinned singleton (`atomicityT_of_singletons`) and fails
when some nonzero pinned proposition consists of free arrows (`not_atomicityT_of_free`).
`Monoids.lean` then instantiates: each monoid a `Submonoid (Function.End ℕ)`, the
paper's perturbations made concrete (`k ∘ rep m` for a monotone surjection, with `rep m`
repeating the value at `m`, which differs from `k` because a monotone surjection steps
up beyond any bound; `raise k m` for a monotone function; `gₘ` itself for the
truncations), and the singletons `{gₙ}`, `{f_{2^j}}`, `{kₙ}` pinned by two points or
one. The table is in `Models/README.md`. No Pure Contingency holds in every model on a
monoid (`holdsAx_npc`), so the necessitations come with the verdicts, and
`Results/Consistency/Consistency.lean` has one section per part: what holds, what fails,
their union consistent (the paper's Proposition D.5 without its Boolean Completeness
column), and the non-theoremhood of each failing principle from the holding ones —
`BF_e` from Actuality and Atomicity, Actuality from Atomicity, Atomicity from `BF` and
Actuality, `ND_e` from all three. The Boolean Completeness failures are still to do; the
two-object models at the end of the appendix and the symmetric model are not built, but
`Models/README.md` surveys what the two-object variants would add.

Lean lessons from Parts 1 to 8. A model built by a `def` should be an `abbrev`, so that
its projections are the plain values to `rw` and instance search; an arrow of a
one-object category is its monoid element only definitionally, so name the coercion
(`perm`, `arrow`) and apply that, never the arrow; with `variable (M)` in force an
`abbrev arrow {X Y : SingleObj M}` takes `M` explicitly and misparses, so declare it under
`variable {M} in`; a theorem named `not_bf_e` inside a namespace shadows the general
`MonoidModel.not_bf_e` it is proved from, so qualify; a numeral set at a domain type
needs the ascription `({0, 1} : Set ℕ)`; and `omega` treats `2 ^ j` as an atom but not
`(fun n => n / 2) (2 * y)`, which a `show` must beta-reduce first.

## Schemas, entailments and rules

The map's principles are type-indexed families, and its arrows say that one family
entails another. Both have a form in this layer (24 September, at Cian's direction).

**Axiom sets and `⟹`** (`Syntax/Entailment.lean`). `Ax₁ ⟹ Ax₂` says every sentence of
`Ax₂` is a theorem of `C.axioms ∪ Ax₁`. The algebra is what one expects, the one lemma of
substance being cut: a derivation from `C ∪ Ax₂` is one from `C ∪ Ax₁` when each
sentence of `Ax₂` is a theorem of `C ∪ Ax₁`, by replacing each use of an axiom by its
(closed, renamed, weakened) derivation; the logical part of both sets is `C` itself,
which is what carries Subst's premises over. Semantically, entailment transfers holding:
in `Prop` (`AxiomSet.Entails.holds`) and in an action model (`entails_holds`), so a model
of `Ax₁` refuting a sentence of `Ax₂` shows `¬ (Ax₁ ⟹ Ax₂)` (`not_entails_of_model`) —
the map's non-implication records. The three moves a metalogical proof makes when it
descends into the object language — cite an axiom of the set, cite a theorem of
Classicism, apply an implication — are `Theorem.ax`, `Theorem.ofC` and `Theorem.mp`.

**Principles as schemas** (`Tools/Schema.lean`, `Certified/Schemas.lean`). A principle
`P` of the shallow layer with parameters `σ …` is quoted as `∀ σ …, P σ …`:
`P.quoted : Ty → … → Sentence`, `P.reflect`, and
`P.schema = {P.quoted σ' … | σ' … closed}`, the instances at the paper's types, those with
no type variable (1 October; `VECTORIZATION-PLAN.md`, D2). A parameter-free principle gives
a singleton. All 68 principles are quoted; the map's
sentence schemas — No Pure Contingency, Distinctness, Possibility, `max` — are written by
hand in `Syntax/SentenceSchemas.lean`.

**Records as entailments** (`Certified/Entailed.lean`). A record theorem
`foo : P₁ … → … → Q …` has `foo.derivable : ∀ σ' …, Theorem C (imp X₁ (… Y))` with the
principles' bodies unfolded. `#classicism_entails foo` declares
`foo.entails : P₁.schema ∪ … ⟹ Q.schema`: every instance's object types are read off
the statement (`P σ Prop` reads as `P.quoted σ' t`); for each instance `Q.quoted x⃗` of the
conclusion the derivation is specialized to the parameters making its consequent that
instance, each premise is cited as an axiom of its schema and converted where an
operation at a constructor type has been unfolded in the derivation's statement (by the
translator's `unfoldConv` and `coerce`), and the instance's equation is rewritten along.
The proof is `Exists.elim`, `Derivable.impE`, `Derivable.axiom`, `Derivable.conv` and
`Eq.mpr`, checked by the kernel; it rests on `propext` and `Quot.sound` only. The
conclusion set is `Q.schema` when the statement's conclusion is `Q` at its own
parameters; the singleton `{Q.quoted τ}` when it fixes them (`Existence e`); the family
over the derivation's parameters when it builds them (`Existence (σ → t)`).
`#classicism_entails_audit` certifies every record theorem of a module: **all 152
certify**, at build time. These `foo.entails` are what the map's arrows can
cite as certificates, once the map's generator is taught the statement shape.

**List forms** (`VECTORIZATION-PLAN.md`). A principle with a Ty-parameter has a list form
beside its schema: `P.listQuoted σs …` is `P.quoted` at the type variable `var 0`,
vectorized along `0 ↦ σs`, so it is defined and cannot be mis-stated. `P.listSchema` is
its instances at closed types. `P.listQuoted_single` says that at `[σ]` it is the
principle, by computation up to the closed Rel-parameters. `P.listSchema ⟹ P.schema`
holds by inclusion, and the converse is proved in `Results/Lists.lean`. All 20 such
principles have a list form.

A record with a Ty-parameter has:
- `foo.listRule`: its derivation at `var 0`, vectorized by `C.Theorem.vec`;
- `foo.listEntails`: the arrow between the list forms.

Each instance of the vectorized statement comes out in one of two forms:
- a list form, when its first Ty-argument is the record's own vectorized parameter;
- otherwise, a restricted instance at the translated types (`Atomicity` at `σs ⇒* τ`).

A list rule takes every parameter other than the list to be closed. Each instance is
shown equal to its form by reducing both to normal form, with the closed parameters'
translations (`RTy.vec θ ρ`, `Ty.vec θ τ`) kept folded and then rewritten away by
closedness. The tactic `classicism_vec_eq` does the same inside a proof.

Every record with a Ty-parameter has a list form. They come from:
- the entailment audit, for `Results/Records.lean`;
- `#classicism_certify` and `#classicism_entails`, elsewhere.

**Records as rules** (`#classicism_rule`, `#classicism_certify`). An entailment forgets
which instance of the premise yields which instance of the conclusion; a metalogical
proof that descends into the object language needs to keep that. `foo.rule` is the
derivation read as a theorem of `C` for every choice of object types,
`∀ σ' …, C.Theorem (imp (P₁.quoted …) (… (Q.quoted …)))`, each instance written through
its schema's `quoted` so that it composes with `Theorem.mp`. `#classicism_certify foo` is
the whole chain at the point where `foo` is stated: schemas for the principles it mentions
that have none yet, the derivation, the rule, and, when `foo` has a Ty-parameter, the list
rule.

## Type variables and vectorization

A principle with a Ty-parameter has a list form beside its restricted form: one instance
for each finite list of types, a variable of the type becoming a block of variables, a
function from it a function of the block, a quantifier over it a block of quantifiers,
identity at it the conjunction of identities (`VECTORIZATION-PLAN.md`; the vocabulary is
in the top-level README). The list forms come from one theorem about the proof system.

**Type variables** (`Syntax/Types.lean`). `Ty.var i` is a type of the object language
about which nothing is known; it is never relational, so the only terms of its type are
variables (and constants of a signature that gives one that type, which the theorem rules
out by asking that constants' types be left alone). It is unlike a *type parameter*
`σ' : Ty`, a variable of Lean: a proof of `∀ σ', …` may split on `σ'`, so it says nothing
about uniformity, whereas a derivation at `Ty.var 0` cannot look inside the type.

**The translation** (`Syntax/Vectorize.lean`), along an assignment `θ` of lists of types to
type variables: a type becomes a list (one-element except at an assigned variable), a
context a context of blocks, a term a tuple. It comes in two versions, convertible to each
other: the generic `Term.vecG`, compositional in every term former and commuting with
substitution on the nose, which the proofs use; and the readable `Term.vec`, in which
`∀x:σ. φ` is `∀x₁ … ∀xₙ. φ'` and `a = b` is `a₁ = b₁ ∧ … ∧ aₙ = bₙ` on the nose, which the
list forms are stated with. A one-element list is the type itself: the translation at
`[σ]` of a principle at `var 0` is, by `rfl`, the principle at `σ`.

**The theorem** (`Syntax/VectorizeDerivable.lean`). If `Δ ⊢ p` in a theory whose axioms
vectorize to axioms, then `Δ' ⊢ p'` for the vectorizations, at every assignment;
`C.Theorem.vec` is the case of Classicism. The proof is an induction on the derivation,
each rule going to its block version (`Syntax/Blocks.lean`) and Subst to Subst. The
translator's derivations are uniform in their type parameters, so they hold at
`Ty.var 0`, and the theorem carries them to every list: `Certified/Vectorized.lean`
does this for `barcan_r_implies_functionality_r`, giving BF over a list implies
Functionality over it, for every list, from the one certified derivation.

**Restricted and list forms are equivalent** (`Results/Lists.lean`). For each of the twenty
principles with a list form, `P.schema ⟹ P.listSchema`, the converse of the generated
`P.listSchema ⟹ P.schema`. Most go by induction on the list:
- the empty list is a theorem of `C`;
- a one-element list is the restricted instance;
- the step is the principle's two-element form (`P.BarcanCons`, …), proved in the shallow
  layer from restricted instances and vectorized.

Plenitude, its boxed form and Actual Profile instead code a tuple `x₁ … xₙ` as the object
`λR. R x₁ … xₙ`. The theorems of `C` among the twenty need nothing: their list forms are
theorems of `C`.

**Results at every arity** (`Results/Arity.lean`). Every
relational type is its argument types' `⇒* t`. So a unary result at `σ → t`, vectorized
in `σ`, is the result at every relational type (`schema_subset_args`). BF at `σ` in its
proof becomes BF over the list, which BF gives by the equivalence above. A result whose
proof is pointwise reasoning at a relational type keeps its shallow core at a
Rel-parameter: it is at every arity already.

## A metalogical proof with object-level steps

A proof in logic alternates between the metalanguage and abbreviated derivations in the
object language (Cian's question of 24 September). Here the object-level reasoning is a
gated shallow theorem, certified as a rule or an entailment, and the metalogic composes
what is certified. The map's arrow `atomicity-t-and-bf-imply-atomicity` shows the shape:
its informal proof is a metatheorem "for every `n`" (BF at each argument type) with an
object-level argument inside, which the shallow layer cannot state, since `Rel` is a class
and not a code.

**The shape.** (1) The record at one argument type, `Proofs.atomicity_t_and_bf_imply_atomicity
: AtomicityT → Barcan σ → Atomicity (σ → t)` (`Results/Records.lean`), proved with Lean's
tactics in the paper's vocabulary (`em`, `le_iff`, `intensionality`, each fact carried
under the box a closed lemma necessitated with `nec%` and pushed through with `K`): for a
non-bottom `X`, BF gives `x` with `◇Xx`, Atomicity at `t` an atom `w ≤ Xx`, and
`λy. w ∧ y = x` is an atom below `X`. (2) The entailment audit (`Certified/Entailed.lean`)
translates the proof into a derivation, reads it as an entailment between schemas, and,
vectorizing it in `σ`, as `listEntails`: Atomicity at `t` and BF over a list `σs` entail
Atomicity at `σs ⇒* t`. (3) The theorem at every arity, `Meta.atomicity_t_and_bf_imply_atomicity`
(`Results/Arity.lean`), composes that with `schema_subset_args`, every relational type
being `σs ⇒* t`, and with BF over every list from BF (`Results/Lists.lean`). A shallow
core that is not a record, such as `necAtomicity_step` there, is certified in place by
`#classicism_certify` into `foo.rule` and `foo.listRule`, and applied with `Theorem.ax`,
`Theorem.ofC` and `Theorem.mp₂` (`Syntax/Entailment.lean`).

**Two routes to "for every `n`".** When the argument is the same at every argument type,
as here, prove it for one argument and vectorize: the vectorization theorem is the
induction on `n`, done once for every proof. When it is not, or when the list form is
itself what is to be proved, an induction on the list or on the type (`RTy.induction`)
applies a rule one argument at a time, choosing its instances as it goes; the inductions
of `Results/Lists.lean` are of this kind.

**`Pointwise τ`** (`Classicism/Pointwise.lean`), for a shallow core at a Rel-parameter:
the shallow `Rel τ` supplies the pointwise operations and the pointwise implication
`incl` as data and only the three laws Intensionality needs, so at a type parameter
nothing can be said about them, while the paper reasons freely about tuples ("by
Leibniz's law", "under the box"). The class states the rules of natural deduction read
pointwise — `⊑` a preorder, `∧_τ` a meet, `X ∧ ¬X` below everything, `const_τ p` above
everything when `p` holds and below everything when not, coextension implication both
ways — proved at `Prop` as tautologies and at `σ → τ` from `τ`; its mirror `SPointwise`
(`Strict/Mirror.lean`) is set up as `SOrder` is, and the translator derives each law for every
object type by induction on the type (`inductionInstances`), in milliseconds.

**The lesson about style**: write object-level steps as short closed lemmas and cite
them, as the paper does. The first version of the Atomicity step, one tactic proof of
forty lines, made the translator's process grow to 27 GB; cut into closed lemmas it
derived in minutes. The history of that experiment (24 September), which led to the
direct translation from shallow proofs to `Derivable`, is in `VERIFICATION.md`.

**Where the parts live.** A shallow lemma, its certification and a metalogical theorem can
sit in one file, as the experiment's did until 1 October. They are kept apart: the
records in `Results/Records.lean`, which imports only the shallow layer and elaborates
quickly in an editor; their certification, one audit command in `Certified/Entailed.lean`;
the compositions in `Results/Arity.lean` and `Results/SentenceSchemas/`.

## Next

The remaining verdicts of the two M-set records; then the map's other models as
instances, the symmetric and coalesced ones included. Appendix A as a theorem, and the
coincidence with the Equivalence-rule system, is deferred: nothing depends on it.
