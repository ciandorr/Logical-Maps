# Full Henkin model: countably infinite individual domain

<p class='cert'>Model — Source: Misc.; produced by Claude Fable 5.1 (Anthropic), 20 September 2026; recorded by Claude Fable 5.1 (Anthropic), 20 September 2026.</p>

## Package

- **Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Infinity Schema (type e).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **Fregean Axiom.** Materially equivalent propositions are identical.
- **□Fregean Axiom.** Every closed instance of Fregean Axiom is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **Modalized Fregean Axiom.** Necessarily equivalent propositions are identical.
- **Extensionality.** At each relational type, coextensive relations are identical; include the nullary propositional case.
- **□Extensionality.** Every closed instance of Extensionality is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **Intensionality.** Necessarily coextensive relations are identical.
- **Functionality.** Operations with the same value on every argument are identical. The output type is relational.
- **Modalized Functionality.** Necessarily co-functional operations of function types are identical.
- **□Functionality.** Every closed instance of Functionality is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **Plenitude.** Every total single-valued binary relation is represented by an operation. Its output type is relational, as required by the type system.
- **□Plenitude.** Every closed instance of Plenitude is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **Functional Choice.** Every serial binary relation admits a selecting operation. Its output type is relational, as required by the type system.
- **Relational Choice.** Every serial binary relation has a functional subrelation.
- **Tractarianism.** A proposition entailing every instance of a property entails its universal generalization.
- **□Tractarianism.** Every closed instance of Tractarianism is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **□ND.** Every closed instance of ND is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **□Actuality.** Every closed instance of Actuality is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **□Atomicity.** Every closed instance of Atomicity is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **□Boolean Completeness.** Every closed instance of Boolean Completeness is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **□Rigid Comprehension.** Every closed instance of Rigid Comprehension is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **□Gallin Extensional Comprehension.** Every closed instance of Gallin Extensional Comprehension is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **No Pure Contingency.** Each closed sentence of the pure language, if true, is necessary. This is a sentence schema, not a quantifier over propositions.
- **Distinctness-preserving collapse.** Every truth is necessary under the distinctness-preserving modality.
- **Strong Leibniz Biconditionals.** At each relational type, every possible entity (one distinct from bottom) is entailed by a strong world: a possible entity that necessarily entails every entity of the type or its negation. The right-to-left direction is a theorem of C; the principle records the substantive direction.
- **□Strong Leibniz Biconditionals.** Every closed instance of the Strong Leibniz Biconditionals is necessary. Box the entire object-variable closure; retain the type range.
- **No Contingency (signature Σ).** Each closed sentence of the language of the fixed signature Sigma, if true, is necessary. A sentence schema, standing to No Pure Contingency as Possibility (signature Σ) stands to Possibility (pure).
- **B for sentences of Σ.** The B instance for every closed sentence of the language of the fixed signature Sigma.
- **□Relational Choice.** Every closed instance of Relational Choice is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **□Functional Choice.** Every closed instance of Functional Choice is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **¬ Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **¬ Infinity Schema (type t).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ Possible Infinity (type t).** Possibly there are not finitely many propositions: the Axiom of Infinity at this type, under a diamond.
- **¬ Possibility (pure).** Every closed pure sentence consistent with C is possible.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Distinctness (signature Σ).** The Distinctness schema for the fixed nonlogical signature Sigma.

## Construction

Use the ordinary full Henkin interpretation with $D_e$ countably infinite, $D_t=\{0,1\}$, and every admitted function type containing all functions between its domains; by Proposition 3.7 it is a model of C. Identity is genuine identity and $\Box$ is the identity on truth values, so $\Diamond$ is truth. Because every domain is full, $\operatorname{FiniteCardinality}_\sigma$ holds exactly of the values of the numerals $\operatorname{Suc}_\sigma^k\mathbf{0}_\sigma$: the characteristic function of that set is in the domain and is inductive. At type $e$ the $k$-th numeral says that there are exactly $k$ individuals, which is false for every $k$, so the Axiom of Infinity at type $e$ holds, and with it the schema. At type $t$ the second numeral holds of $\lambda p\, .\,\top$, so the Axiom of Infinity at type $t$ fails, as does the third instance of the schema, and Possible Infinity at type $t$ fails because $\Diamond$ is truth. Possibility (pure) fails since the C-consistent pure sentence that there is exactly one individual is false. The remaining positive assertions hold as in every two-valued full model: each boxed principle reduces to its unboxed form; coextensive relations are identical, so Extensionality, the Fregean axiom and its modalized form hold; every relation is persistent, inextensible and Gallin-extensional, giving the comprehension principles; Actuality holds with top as the actual world; each relational type is the complete atomic Boolean algebra of subsets of a domain, giving Atomicity and Boolean Completeness; Tractarianism is a tautology; ND holds outright, giving C5; every closed sentence is non-contingent; and the choice principles hold because every function between domains is present, using choice in the metatheory to select from a serial relation on an infinite domain.

## Notes

Explicit specialization of the source's standard Henkin construction to an infinite individual domain, recorded to separate the type-$e$ infinity principles from the type-$t$ ones: it satisfies the Axiom of Infinity at type $e$, hence Possible Infinity at type $e$, while violating the Axiom of Infinity at type $t$. It also shows that the sentence used in pure-possibility-implies-axiom-of-infinity-t, that there could be any positive number of individuals, does not follow from the Axiom of Infinity at type $e$: here there is not possibly exactly one individual. It also witnesses the consistency of C with Goodsell's $I$, assumed in n. 14 of Arithmetic is Necessary: with infinitely many individuals the numerals are pairwise distinct, so $\operatorname{Suc}_e$ is injective on finite cardinalities and $I^*$, hence $I$, is true. No Contingency (signature Σ) and B for sentences of Σ hold in a one-world model however the constants are interpreted. With Boolean Completeness listed, the model also shows Countable Boolean Completeness consistent with C. Interpretation of Σ, fixed for this record: each relational constant denotes the top element of its type and each individual constant denotes one fixed individual. Under it the signature schemata fail. Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove. Everything that implies these fails with them. Box is truth in this one-world model, so □Relational Choice and □Functional Choice hold with their unboxed forms.

## Revisions

- **2026-09-22** (Claude Fable 5.1 (Anthropic)) — Added the Strong Leibniz Biconditionals and their necessitation. Box is truth in this model, so a strong world is an atom and the principle reduces to Atomicity, which holds; boxed principles reduce to their unboxed forms. Now satisfies: Strong Leibniz Biconditionals, □Strong Leibniz Biconditionals.
- **2026-09-22** (Claude Fable 5.1 (Anthropic)) — Added No Contingency (signature Σ) and B for sentences of Σ: Box is truth in this model, so every closed sentence, whatever the constants denote, is necessary if true and necessarily possible if true. Now satisfies: No Contingency (signature Σ), B for sentences of Σ.
- **2026-09-22** (Claude Fable 5.1 (Anthropic)) — Fixed an interpretation of Σ (relational constants as top, individual constants as one fixed individual) and recorded the signature schemata it refutes, at Cian Dorr’s request. Now violates: Witnessed Possibility, Separated Structure, Independence (signature Σ), Distinctness (signature Σ).
- **2026-09-22** (Claude Fable 5.1 (Anthropic)) — Boxed the two Choice claims. Now satisfies: □Relational Choice, □Functional Choice.

## Sources

- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, §3.2, Definition 3.6 and Proposition 3.7, pp. 47–48.

<p class='cert'>Record: <code>topics/classicism/models/full-henkin-infinite-base.yaml</code></p>

## Paper references

- **Proof: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §3.2, Definition 3.6 and Proposition 3.7, pp. 47–48
