# Finite-support action model: monotone surjections of N

<p class='cert'>Model — Source: Classicism (2024); produced by Andrew Bacon and Cian Dorr; recorded by OpenAI Codex (GPT-6), 17 September 2026.</p>

## Package

- **BF.** The Barcan Formula at every type. The predicate formulation closes the formula schema using lambda abstraction.
- **No Pure Contingency.** Each closed sentence of the pure language, if true, is necessary. This is a sentence schema, not a quantifier over propositions.
- **□BF.** Every closed instance of BF is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **Atomlessness.** Atomlessness in the displayed closed propositional formulation.
- **Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Distinctness-preserving collapse.** Every truth is necessary under the distinctness-preserving modality.
- **Relational Choice.** Every serial binary relation has a functional subrelation.
- **□Relational Choice.** Every closed instance of Relational Choice is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **¬ ND.** Distinct things of any type are necessarily distinct.
- **¬ Atomicity.** Every non-bottom entity of each relational type has an atom below it.
- **¬ Actuality.** There is a true proposition that entails every true proposition.
- **¬ Boolean Completeness.** Every property of entities of a relational type has a greatest lower bound in that type.
- **¬ Rigid Comprehension.** Every relation, including a proposition, is coextensive with a rigid one.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Distinctness (signature Σ).** The Distinctness schema for the fixed nonlogical signature Sigma.
- **¬ Countable Boolean Completeness.** Every countable property of entities of a relational type has a least upper bound in that type, where a property is countable when it injects into the natural numbers.

## Construction

Proposition D.5, part 2 (pp. 76–77): the one-object category whose arrows are the monotone surjections of $\mathbb N$ (the source first considers all surjections, which gives the same package, and restricts to the monotone ones to make the failure of Boolean Completeness easier to exhibit). ND fails at the non-injective arrows; BF holds by Proposition D.6 since every arrow is a surjection; Atomlessness holds as in part 1; Boolean Completeness fails at type $e\to t$ because the haecceities of the even numbers have no least upper bound, the strongest persistent property containing them and pinned down by $\{0,\ldots,n\}$ becoming strictly stronger as $n$ grows. In every part, $W_0^\ddagger$ is the set of finite subsets of $\mathbb N$ and the model is ideally full: a proposition is a set of arrows whose membership depends only on the arrows’ values on some finite set of individuals (it is pinned down by that set), an entity of a higher type is an applicative behaviour profile pinned down by a finite set in the same sense, and the individuals are the natural numbers acted on by the arrows themselves. Propositions and properties are thus about finitely many individuals and indifferent to how the arrows treat the rest. Evaluation point: the sole object, at the identity arrow.

## Notes

The cited construction is a model of the map’s relational-type framework. The description identifies its evaluation point; construction and verification are given at the PDF locations in References. Boxed positive flags use the source’s explicit one-object No Pure Contingency observation, applied separately to each closed instance. Interpretation of Σ, fixed for this record: each relational constant denotes the top element of its type and each individual constant denotes one fixed individual. Under it the signature schemata fail. Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove. Everything that implies these fails with them. Countable Boolean Completeness fails as well, at type $e\to t$: the property $E$ that the source shows to lack a least upper bound has as its extension a countable family of haecceities, and the extensional fullness the source invokes to put $E$ in the domain also puts in the relation pairing the haecceity of the $k$-th member of that family with the numeral $k$, which injects $E$ into the numerals. Observation of 23 September 2026. Distinctness-preserving collapse holds: for a true proposition $p$ pinned down by a finite set take as the witness $q$ the proposition that the arrow fixes $0,\ldots,N$ for $N$ beyond the pinning set. An arrow fixing $0,\ldots,N$ agrees with the identity on that set and so is in $p$. An arrow $h$ that does not, with least moved point $m\le N$, has $hm<m$ by monotone surjectivity and so collapses $m-1$ and $m$; then no $k\circ h$ can fix both, so $\Diamond q$ fails at $h$. Hence $\Box(\Diamond q\to p)$. Relational Choice holds, necessarily. The model is ideally full, hence extensionally full at every object (Appendix D, the remark after Definition D.3): for any set $R$ of tuples from the domains at an object $V$, the intension that assigns to every arrow out of $V$ into an object $U$ a fixed set $R_U$ of tuples from $U$’s domains, with $R_V=R$, is pinned down by $\emptyset$, so it is the intension of an element of $V^{\bar\sigma\to t}$ with extension $R$ at $1_V$. Given a relation $U$ serial at $V$, choose for each $x$ a $y$ with $(Ux)y$, by choice in the metatheory; the graph is such an $R$, and its element $S$ is functional and a subrelation of $U$ at $1_V$, both conditions being unboxed. The closed Relational Choice instance is true at an arrow $h\colon W_0\to V$ iff it is true at $1_V$ in the truncation by $h$, whose domains at $V$ are those of the model, so it holds at every arrow and $\Box$Relational Choice follows. Cian Dorr’s observation of 23 September 2026.

## Revisions

- **2026-09-23** (Claude Fable 5.1 (Anthropic)) — Expanded the description from Appendix D, naming Proposition D.5 and its part; added the failure of Countable Boolean Completeness at type e→t; settled the Distinctness-preserving collapse. Now satisfies: Distinctness-preserving collapse. Now violates: Countable Boolean Completeness.
- **2026-09-23** (Claude Fable 5.1 (Anthropic)) — Added Relational Choice and its necessitation at Cian Dorr’s direction: ideally full models are extensionally full at every object, and choice in the metatheory supplies the functional subrelation; see the notes. Now satisfies: Relational Choice, □Relational Choice.
- **2026-09-22** (Claude Fable 5.1 (Anthropic)) — Fixed an interpretation of Σ (relational constants as top, individual constants as one fixed individual) and recorded the signature schemata it refutes, at Cian Dorr’s request. Now violates: Witnessed Possibility, Separated Structure, Independence (signature Σ), Distinctness (signature Σ).
- **2026-09-20** (Claude Fable 5.1 (Anthropic)) — Added both Axioms of Infinity at Cian Dorr's direction. The individuals are the natural numbers and identity at the evaluation arrow is literal, so no numeral counts them. The propositions that a given individual is fixed by the arrow, one for each individual, are pairwise distinct and each has that individual as finite support, so there are infinitely many propositions. The set of numerals at each type is invariant under every arrow, hence has empty support and lies in the domain, so finite cardinality is standard and no finite cardinality holds of the universal property at either type. Now satisfies: Axiom of Infinity (type e), Axiom of Infinity (type t).
- **2026-09-17** (OpenAI Codex (GPT-6)) — Adopted the source’s relational type system at the user’s request. The cited construction now directly supplies the recorded model; the former type-extension obligation is removed. Now satisfies: BF, No Pure Contingency, □BF, Atomlessness. Now violates: ND, Atomicity, Actuality, Boolean Completeness, Rigid Comprehension.

## Sources

- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, Appendix D, Proposition D.5, part 2, pp. 74, 76–77; p. 79 (No Pure Contingency).

<p class='cert'>Record: <code>topics/classicism/models/finite-support-monotone-surjections.yaml</code></p>

## Paper references

- **Proof: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — Appendix D, Proposition D.5(2), pp. 74–75; construction pp. 76–77; p. 79 (No Pure Contingency)
