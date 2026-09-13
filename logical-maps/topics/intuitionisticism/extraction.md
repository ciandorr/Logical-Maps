# Manuscript coverage

Source: Zachary Goodsell, *Possibility in Intuitionistic Higher-Order Logic*, 21 August 2026, 49 pages. Coverage recorded 13 September 2026 by Codex (GPT-6).

This register accounts for every numbered theorem or lemma (1–31), every numbered definition (1–11), the four explicit questions, and the numbered equations. It records coverage, not independent verification of the entire manuscript. The graph uses the fixed theory II. No Lean statements or proofs were added.

A graph record marked **proved** has an informal proof or model verification in its record. **Conjectured** is the database status for both open proposals and manuscript theorems whose proof has not been completed here; their notes distinguish those cases. Semantic proofs and literature-only statements below do not silently become graph axioms.

## Numbered results

### Theorem 1: K, T, 4 and necessitation for □

§3.2, p. 9. Coverage: **proof-recorded**.

Original attribution: Andrew Bacon (2018). Goodsell supplies an intuitionistic proof; all four parts are recorded with that distinction.

Records: [ii-implies-k-necessity](results/ii-implies-k-necessity.yaml), [ii-implies-t-necessity](results/ii-implies-t-necessity.yaml), [ii-implies-four-necessity](results/ii-implies-four-necessity.yaml), [ii-implies-necessitation](results/ii-implies-necessitation.yaml).

### Theorem 2: Monotonic existential modal semantics iff Frame Condition 1

§3.4, pp. 14–15. Coverage: **semantic-proof**.

For necessity of FC1, a missing completion of aRb and a≤ᵢc is witnessed by the upward closure of b: the relational existential operator holds at a but not c. Conversely, transport an existential witness b across a≤ᵢc using FC1 to obtain d≥ᵢb with cRd; upward closure preserves truth. This is a theorem about arbitrary birelation frames, not a new II axiom.

### Theorem 3: IK and IS4 completeness for Plotkin–Stirling frames

§3.4, p. 15. Coverage: **literature-statement**.

Attributed to Plotkin and Stirling (1986); proof referred to Simpson (1994), Chapter 3. IK uses FC1 and FC2; IS4 additionally requires R reflexive and transitive. The cited external proof has not been independently transcribed. R is not identified with ≤ₘ in this theorem.

### Theorem 4: WK completeness with Wijesekera semantics

§3.4, p. 15. Coverage: **literature-statement**.

Attributed to Wijesekera (1990). The existential condition is ∀w′≥ᵢw ∃v.(w′Rv ∧ v∈p). WK retains K for its necessity, necessitation, PSa and PSb, but drops PSc and PSd. This is a separate relational interpretation, not a new designated possibility in II.

### Theorem 5: Two relative-consistency obstructions to possibility

§4.1, pp. 16–17; §6.2, pp. 42–44. Coverage: **proof-recorded**.

Part (i): the comb forces ¬∃f.(PSb f∧PSd f). Part (ii): the tree forces ∀f.((PSb f∧PSc f)→∃p.(¬fp∧p≠⊥)). The finite warmup only fails the existential at its root and does not force its negation.

Records: [full-infinite-comb](models/full-infinite-comb.yaml), [full-binary-tree-canopy](models/full-binary-tree-canopy.yaml), [uniform-counterexamples-exclude-ps-b-c-d](results/uniform-counterexamples-exclude-ps-b-c-d.yaml).

### Theorem 6: $\Diamond_\vee$ is a $\mathrm{Possibility}_\vee$

§4.2, p. 19. Coverage: **proof-recorded**.

The necessary PSa, PSb and PSc components are separate graph nodes; their conjunction is the displayed candidate predicate. Witness elimination proves each clause before closed necessitation.

Records: [ii-implies-necessary-ps-a-possibility-vee](results/ii-implies-necessary-ps-a-possibility-vee.yaml), [ii-implies-necessary-ps-b-possibility-vee](results/ii-implies-necessary-ps-b-possibility-vee.yaml), [ii-implies-necessary-ps-c-possibility-vee](results/ii-implies-necessary-ps-c-possibility-vee.yaml).

### Theorem 7: Truth is a $\mathrm{Possibility}_\vee$; T for $\Diamond_\vee$

§4.2, p. 19. Coverage: **proof-recorded**.

Truth=λp.p satisfies all three candidate clauses by intuitionistic logic and T for □. It witnesses p→$\Diamond_\vee$p.

Records: [ii-implies-t-possibility-vee](results/ii-implies-t-possibility-vee.yaml).

### Theorem 8: Nonfalsity qualifies exactly under necessary weak excluded middle

§4.2, Eq. (34), p. 19. Coverage: **proof-recorded**.

The operator-candidate characterization is an identity of propositions, not merely an unboxed biconditional. The corresponding unboxed distribution/weak-LEM equivalence is also recorded.

Records: [ii-implies-nonfalsity-candidate-characterization](results/ii-implies-nonfalsity-candidate-characterization.yaml), [necessary-weak-excluded-middle-implies-necessary-nonfalsity-disjunction](results/necessary-weak-excluded-middle-implies-necessary-nonfalsity-disjunction.yaml), [necessary-nonfalsity-disjunction-implies-necessary-weak-excluded-middle](results/necessary-nonfalsity-disjunction-implies-necessary-weak-excluded-middle.yaml).

### Theorem 9: Composition and disjunction closure; 4 for $\Diamond_\vee$

§4.2, Eqs. (35)–(36), pp. 19–20. Coverage: **proof-recorded**.

Necessary candidate conditions are used with K and their □-stability. Selected formulas are not treated as assumption-free theorems.

Records: [ii-implies-vee-composition-closure](results/ii-implies-vee-composition-closure.yaml), [ii-implies-vee-disjunction-closure](results/ii-implies-vee-disjunction-closure.yaml), [ii-implies-four-possibility-vee](results/ii-implies-four-possibility-vee.yaml).

### Theorem 10: Exact IS4− logic for □ and $\Diamond_\vee$

§4.2, p. 20; §6.3, p. 44. Coverage: **partial**.

The displayed IS4− axioms have recorded II proofs. Exactness remains pending: the trirelation definitions in §3.5 and the unwinding construction in §6.3 are unfinished. Question 1 later asks for this same logic. No graph nonimplications are inferred from exactness.

### Theorem 11: Prime propositions are $\Diamond_\vee$-possible

§4.2, p. 20. Coverage: **pending**.

The manuscript offers a short candidate-operator argument. The necessity and primeness scopes of that candidate have not been checked in full; the graph record has conjectured status and empty proof.

Records: [ii-implies-prime-possibility](results/ii-implies-prime-possibility.yaml).

### Theorem 12: $\Diamond_\infty$ qualifies and obeys T and 4

§4.4, pp. 23–24. Coverage: **partial**.

Direct existential-witness proofs establish the defining necessary PSa, PSb and PSc∞^t clauses, and Truth establishes T. The composition step needed for 4 remains pending. Binary PSc and the type-reduction claim are also pending for the printed infinitary definition.

Records: [ii-implies-necessary-ps-a-possibility-infinity](results/ii-implies-necessary-ps-a-possibility-infinity.yaml), [ii-implies-necessary-ps-b-possibility-infinity](results/ii-implies-necessary-ps-b-possibility-infinity.yaml), [ii-implies-necessary-infinitary-distribution-possibility-infinity](results/ii-implies-necessary-infinitary-distribution-possibility-infinity.yaml), [ii-implies-t-possibility-infinity](results/ii-implies-t-possibility-infinity.yaml), [ii-implies-four-possibility-infinity](results/ii-implies-four-possibility-infinity.yaml).

### Theorem 13: Exact IS4− logic for □ and $\Diamond_\infty$

§4.4, p. 24; §6.3, p. 44. Coverage: **pending**.

Depends on the unfinished unwinding argument and on the infinitary-to-binary/composition issues. Exactness is not encoded as an object-language axiom.

### Theorem 14: □₂ and ◇₂ are married

§4.5, Eq. (57), pp. 25–26. Coverage: **proof-recorded**.

Both paired PS clauses are recorded under outer □, which is the identity-with-⊤ modality used in Married. The inner necessity in those clauses is □₂.

Records: [ii-implies-necessary-ps-a-paired-two](results/ii-implies-necessary-ps-a-paired-two.yaml), [ii-implies-necessary-ps-d-paired-two](results/ii-implies-necessary-ps-d-paired-two.yaml).

### Theorem 15: □₂ and ◇₂ belong to their paired candidate classes

§4.5, p. 26. Coverage: **proof-recorded**.

Universal normality for □₂, its value at ⊤, and the necessary PSb/PSc clauses for ◇₂ combine with Theorem 14. Eq. (47) is explicitly read with the universal closure its use as a candidate property requires; the printed free variables are documented.

Records: [ii-implies-k-necessity-two](results/ii-implies-k-necessity-two.yaml), [ii-implies-necessitation-two](results/ii-implies-necessitation-two.yaml), [ii-implies-necessary-ps-b-possibility-two](results/ii-implies-necessary-ps-b-possibility-two.yaml), [ii-implies-necessary-ps-c-possibility-two](results/ii-implies-necessary-ps-c-possibility-two.yaml).

### Theorem 16: Truth is a necessity and possibility, married to itself

§4.5, p. 26. Coverage: **proof-recorded**.

All candidate and marriage clauses at Truth reduce to intuitionistic tautologies; their closed derivations can be necessitated. These witnesses establish both T laws.

Records: [ii-implies-t-necessity-two](results/ii-implies-t-necessity-two.yaml), [ii-implies-t-possibility-two](results/ii-implies-t-possibility-two.yaml).

### Theorem 17: At least IS4 for □₂ and ◇₂

§4.5, p. 26. Coverage: **partial**.

K, paired PSa–PSd, necessitation, and both T laws have recorded proofs. The two 4 clauses retain the paper’s stated status but are conjectured in the database until its composition analogy is expanded. The conjectured exactness and the double-negation transport claim are separately pending.

Records: [ii-implies-four-necessity-two](results/ii-implies-four-necessity-two.yaml), [ii-implies-four-possibility-two](results/ii-implies-four-possibility-two.yaml).

### Theorem 18: Distinct □₂-equivalent propositions are consistent

§4.5, Eq. (61), p. 27. Coverage: **proof-recorded**.

In the tree, C≠⊥ while ¬◇₂C yields □₂¬C by paired PSd. Thus C and ⊥ refute □₂-intensionalism. The model also separates □ from □₂.

Records: [full-binary-tree-canopy](models/full-binary-tree-canopy.yaml).

### Lemma 19: Term interpretations stay in the local domain

§5.2, p. 31. Coverage: **semantic-proof**.

Convert a term to applicative combinator form. Its free variables are in the local domain by hypothesis; the required constants and combinators are locally available. Closure of application under the logical relations inductively keeps every subterm, hence the whole interpretation, in the domain.

### Lemma 20: Rerooting along metaphysical accessibility preserves models

§5.2, p. 31. Coverage: **semantic-proof**.

If w≥ₘw₀, the local domains contain the original root’s distinguished elements by monotonicity of the logical relations. Changing only the distinguished root to w preserves richness and all interpretation clauses. This licenses testing assumption-free theorems at metaphysically accessible worlds.

### Theorem 21: Soundness and completeness of bimodalized domain semantics

§5.2, pp. 31–32. Coverage: **semantic-proof-sketch**.

The interpretation clauses validate IH. Quasifunctionality gives Eq. (70): truth of □∀x.fx=gx means equality on every metaphysically accessible local domain, so f∼g at the root. For intensionality, apply validity of an assumption-free premise at each rerooted model, then use propositional congruence or quasifunctionality. Completeness is Theorem 29. This is a retained metatheoretic proof outline, not an additional assumption in the graph.

### Theorem 22: Full structures are rich and quasifunctional

§5.3, p. 33. Coverage: **semantic-proof-sketch**.

Take all informational upsets at type t and all set functions at function types, with recursively defined local congruence. Quasifunctionality follows from that definition. For Univ, f∼g at w entails agreement on every local input at each informational successor of every metaphysical successor; hence their universal truth sets agree on the metaphysical cone. The manuscript treats the logical functions and combinators similarly. The explicit countermodels invoke this construction at every type, not only their finite propositional projection.

### Theorem 23: FC1 forces nonfalsity to give a distinct disjunct

§5.5, Eq. (77), pp. 37–38. Coverage: **semantic-proof**.

If ¬¬(p∨q) holds at w, choose an informational successor u in one disjunct, say p. Since ≤ᵢ⊆≤ₘ, w≤ₘu. For every v≥ᵢw, FC1 gives d≥ᵢu with v≤ₘd; persistence makes p true at d. Thus p=⊥ fails at every v≥ᵢw, so p≠⊥ holds at w. The q case is symmetric. The graph contains the object-language conclusion as an optional principle; FC1 remains a condition on representations, not an II axiom. The prose proof’s occurrence of ⊤ where ⊥ is needed is not used.

### Lemma 24: Prime-theory extension avoiding an underivable sentence

§6.1, p. 39. Coverage: **semantic-proof-sketch**.

The Henkin-style construction extends a small closed theory while avoiding p, successively choosing disjuncts and fresh existential witnesses; compactness preserves avoidance at unions. The manuscript cites Henkin (1950), p. 86 for the construction. The constant-reserve and enumeration details have not been independently completed here.

### Lemma 25: Propositional local classes embed in truth sets on the modal cone

§6.1, p. 40. Coverage: **semantic-proof-sketch**.

If p=q is absent from w, the manuscript uses the equations of w and prime extension to obtain a metaphysical successor distinguishing p and q. This separates the corresponding truth sets. The passage from equations to provable material equivalence is retained as part of the source proof outline, not separately formalized.

### Lemma 26: The term structure is rich

§6.1, pp. 40–41. Coverage: **semantic-proof-sketch**.

Use classes of the logical constants and combinators. For implication, a missing implication permits an extension containing its antecedent without its consequent. Existential truth follows from witness completeness. For the reverse universal clause use a fresh constant and prime extension. The source supplies these cases; the other applicative checks are schematic.

### Lemma 27: The term structure is quasifunctional

§6.1, p. 41. Coverage: **semantic-proof-sketch**.

Agreement on every local input at every metaphysical successor yields ∀x.fx=gx there by the fresh-constant argument. Lemma 25 gives its identity with ⊤ at w, and modalized functionality gives f=g. This retains the dependencies on Lemma 25 and Eq. (70).

### Theorem 28: Term models exist and their root theory is exactly w₀

§6.1, p. 41. Coverage: **semantic-proof-sketch**.

Interpret each term by its relative equivalence class. Lemmas 25–27 provide the required model structure; truth at the root is membership in w₀ by construction. The source’s immediate proof is recorded with these dependencies.

### Theorem 29: Strong completeness for II

§6.1, pp. 41–42. Coverage: **semantic-proof**.

If Γ does not prove p, Lemma 24 gives a prime theory extending Γ and omitting p. Root its term model there. By Theorem 28 all of Γ is true and p is false in that model, contradicting semantic entailment. The argument is conditional on the prime extension and term-model lemmas, as in the manuscript.

### Theorem 30: Comb semantics and failure of relational representation for $\Diamond_\vee$

§6.2, p. 44. Coverage: **partial**.

At a spine world, $\Diamond_\vee$ holds exactly for upsets with a spine tail or infinitely many teeth. The detailed model record proves this. Every singleton tooth is impossible there but their infinite union is possible, precluding any fixed accessibility relation with existential semantics on all propositions. The separate assertion that $\Diamond_\infty$=Truth is pending for the printed infinitary definition.

Records: [full-infinite-comb](models/full-infinite-comb.yaml), [full-comb-infinitary-collapse](models/full-comb-infinitary-collapse.yaml).

### Theorem 31: Marriage in the comb and collapse to Truth in the tree

§6.2, p. 44. Coverage: **partial**.

The tree assertion $\Diamond_\vee$=Truth is proved by splitting a proposition absent at a node into its child-cone pieces. The same verification gives ◇₂=Truth. The comb-spouse expression is missing in the manuscript, so no spouse is invented.

Records: [full-binary-tree-canopy](models/full-binary-tree-canopy.yaml).

## Numbered definitions

**Definition 1: Birelation frame** (§3.4, pp. 13–14). A nonempty W, preorder ≤ᵢ, and arbitrary relation R; FC1 and FC2 are optional extra conditions.

**Definition 2: Metaphysical birelation frame** (§5.2, p. 29). A distinguished world w₀ and preorders ≤ᵢ⊆≤ₘ on W.

**Definition 3: Prop** (§5.2, Eq. (63), p. 29). The set of all ≤ᵢ-upward-closed subsets of W.

**Definition 4: Bimodalized domain structure** (§5.2, pp. 29–30). Disjoint nonempty type domains, a truth map to a Heyting subalgebra of Prop, application, and local partial equivalence relations respecting application and persisting in ≤ₘ. Propositional congruence means agreement on the metaphysical cone.

**Definition 5: Rich structure** (§5.2, Eqs. (66)–(69), p. 30). Locally available implication, quantifier and equality interpretations and K/S combinators with the specified semantic behavior.

**Definition 6: Quasifunctional structure** (§5.2, p. 30). Functions agreeing on all local arguments at every metaphysical successor are congruent at the original world.

**Definition 7: Bimodalized domain model** (§5.2, p. 31). A rich quasifunctional structure equipped with the specified variable, application, lambda and logical-constant interpretations. Formula truth is truth of its interpretation at the chosen root and assignment.

**Definition 8: Full structure** (§5.3, pp. 32–33). All informational upsets at t, all set functions at function types, and recursively defined congruence on every metaphysical cone; local domains are the self-congruent elements.

**Definition 9: Full model** (§5.3, p. 33). The interpretation associated with the full structure; the source invokes Theorem 22 for existence.

**Definition 10: Term structure** (§6.1, p. 40). Prime theories as worlds, inclusion as ≤ᵢ, preservation of equations as ≤ₘ; terms represented by their world-indexed local equivalence classes; application induced by syntax.

**Definition 11: Term model** (§6.1, p. 41). The term structure interpreted by classes of the logical constants and terms, with root truth given by membership.

## Explicit open questions

**Question 1: Exact propositional modal logic of □ and $\Diamond_\vee$** (§7.1, pp. 45–46). Conflicts with the asserted exactness of Theorem 10; retained as unresolved while §6.3 is incomplete.

**Question 2: Exact propositional modal logic of □₂ and ◇₂** (§7.1, p. 46). Theorem 17 states the IS4 lower bound and conjectures exactness. The two 4 proofs still need expansion in this map.

**Question 3: Spouse uniqueness for □ and general monogamy** (§7.1, p. 46). Both qualified uniqueness statements are principle nodes. §4.5 contains contrary draft remarks about polygamy, but no completed countermodel is supplied.

**Question 4: Consequences of Descriptions over II** (§7.1, p. 46). The type-ambiguous necessary description principle is recorded. No S5 conclusion is imported from the discussion of Classicism.

## Equation inventory

| Equations | Content | Where recorded |
| --- | --- | --- |
| 1–3 | Standing intensionality rules and the hypothetical extensional rule | Framework; propositional-extensionality |
| 4 | Quantifier/implication scope example | Notation only; not an asserted law |
| 5–11 | Reduction of logical constants | Background definitions |
| 12–18 | Disjunction, nonfalsity and necessary falsehood | Named operator PS conditions, weak-LEM and stability records |
| 19–21 | Relational semantic clauses | Semantic background; Theorems 2–4 |
| 22–25 | PSa–PSd as properties of functions | Background definitions and named instances |
| 26–29 | Consistency obstructions and stability | Comb/tree models and stability graph |
| 30–31 | General quantifier recipe for broad modalities | Background explanation; no extra unindexed modality |
| 32–36 | $\mathrm{Possibility}_\vee$ and closure | Definitions; Theorems 6–9 |
| 37–41 | World/prime reductions and recovery of IK | Prime-representation nodes; necessary PSd edge pending |
| 42–45 | Inextensibility and $\mathrm{Possibility}_\infty$ | Definitions, named distribution instances, type-reduction question |
| 46–56 | Normality, marriage and paired modalities | Definitions; universal-closure decision for Eq. (47) explicit |
| 57–60 | Marriage of □₂ and ◇₂ | Theorem 14 proof records |
| 61 | Failure of □₂-intensionalism | Tree/canopy model |
| 62 | Infinitary normality | Type-ambiguous K∞ principles for □ and □₂ |
| 63–69 | Domain-model structure | Definitions 3–5, semantic background |
| 70 | Modalized functionality | Type-ambiguous principle; all-types syntactic proof recorded |
| 71–72 | Universal-quantifier congruence calculation | Theorem 22 semantic proof sketch |
| 73–75 | Ideal and accessibility descriptions of possibility | Semantic background; infinitary identification pending |
| 76–79 | Weak LEM and consequences of FC1/self-necessitation | Theorem 23 and graph connections |
| 80–84 | Frames (80), (81), (84) and classical rewrite (82)–(83) | Explicit models and excluded-middle-to-PSd(≠⊥) proof; unwinding remains pending |
| 85 | Necessary nonfalsity without necessity | Full classical-root chain model |
| 86 | Descriptions | Type-ambiguous necessary axiom schema |
| 87–88 | Contingency and incontingency candidates | Background definitions at each named possibility; no unsupported collapse |

## Deferred claims and transcription decisions

- **Exactness and unwinding:** Theorems 10 and 13 depend on unfinished §§3.5 and 6.3. The small trirelation example and the assertion that an operator is unmarried are not full II countermodels until the translation is supplied.
- **Infinitary distribution:** Eq. (43) is retained with exactly the displayed Inex restriction and the σ=t convention. The suggested finite predicate after that equation has a provably true existential; its use does not immediately yield binary PSc. The type reduction, the needed composition argument, and consequences depending on the intended finite-distribution reduction remain pending.
- **Paired normality:** Eq. (47) leaves p,q free inside a purported property of N. The map explicitly uses ∀p,q for K, as required for the subsequent candidate definitions. This is a documented scoping interpretation, not an unnoticed transcription change.
- **Theorem 17:** Its two 4 clauses remain conjectured in the database. The already proved K, T, marriage and normality clauses remain available independently.
- **Prime propositions:** The stated prime-possibility theorem and the prime-representation recovery of necessary PSd retain their formulations, with scope-sensitive proofs pending.
- **Ideal semantics:** The proposed condition that a relevant ideal is empty conflicts with the earlier requirement that ideals contain ∅. No empty-ideal characterization is adopted. The principal-ideal and maximal-FC1 descriptions of the infinitary operator also depend on its printed definition being checked.
- **Tree proof:** The prose on p. 43 says that ≠⊥ must fail PSb. Since PSb(≠⊥) is ¬¬(⊥=⊥), that sentence cannot be used as a mathematical premise. The explicit model verifies failure of PSc and the actual statements of Theorems 5(ii) and 18.
- **Marriage sketches:** §4.5 mentions polygamy, strongest/weakest spouses and nontransitivity without finished constructions. §7.1 asks monogamy as an open question. The unspecified comb spouse in Theorem 31 is left unspecified.
- **§4.6:** The proposed combination of marriage and infinitary distributivity, the suggested weakened infinitary axioms, and the assertion that every identification pattern among the three candidates is consistent lack completed definitions or models. Equality principles are recorded as optional questions; the claimed full pattern of consistency is not asserted.
- **Classicalization:** The local classical-root construction is recorded with an explicit witness to excluded middle without necessary excluded middle. It does not automatically transfer every universally quantified or intuitionistically negated statement from an arbitrary old root.
- **Descriptions:** Only the precise type-ambiguous necessary schema is recorded. The S5 conclusion discussed for Classicism is not imported into II.
- **Contingency:** The alternative properties in Eqs. (87)–(88) are defined in the Background tab at each named operator. They are not turned into universally asserted contingency axioms. The two negative necessity formulations in Eq. (87) are intuitionistically equivalent by De Morgan’s law.

## Additional source attributions

- Andrew Bacon (2018), *The Broadest Necessity*, Journal of Philosophical Logic 47.5, pp. 733–783: original attribution of Theorem 1; the intuitionistic presentation used here is Goodsell’s.
- Gordon Plotkin and Colin Stirling (1986), *A framework for intuitionistic modal logics*, TARK, pp. 399–406; Alex K. Simpson (1994), *The Proof Theory and Semantics of Intuitionistic Modal Logic*, Chapter 3: Theorem 3.
- Duminda Wijesekera (1990), *Constructive Modal Logics I*, Annals of Pure and Applied Logic 50.3, pp. 271–301: Theorem 4.
- Andrew Bacon and Cian Dorr (2024), *Classicism*, in Higher-Order Metaphysics, pp. 109–190: equivalence involving modalized functionality cited in the proof of Theorem 21.
- Leon Henkin (1950), *Completeness in the Theory of Types*, Journal of Symbolic Logic 15.2, pp. 81–91: background for Lemma 24. The II adaptation is Goodsell’s.

These bibliographic details and attributions are taken from the supplied manuscript. The external proofs have not been independently audited in this pass. New connecting deductions carry the Misc. source and separate Codex credit. The manuscript PDF itself is not redistributed.

## Subsequent connection audit

The 13 September connection pass records candidate-class inclusion, possibility bounds,
spouse/equality equivalences, necessity comparisons, identity transitivity and modal
lifts. See `connections.yaml` for the boxed-counterpart inventory and result IDs.
Necessitated labels now use a □ prefix, including LEM/□LEM and
Descriptions/□Descriptions. IDs and earlier formulations remain stable.

The pending record `ii-implies-modalized-functionality` now has an all-types
syntactic proof and `was_conjectured: true`. Bacon and Dorr retain the original
mathematical attribution reported by Goodsell; the new proof is separately
credited to Codex. The unexpanded infinitary and paired-4 arguments remain
pending. Boxed lifting never uses a conjecture or necessitates an unboxed
assumption. In particular, the spouse equivalence for ◇_∨ is not asserted
without further conditions for ◇_∞.
