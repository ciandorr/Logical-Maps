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
- **¬ Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **¬ Infinity Schema (type t).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ Possible Infinity (type t).** Possibly there are not finitely many propositions: the Axiom of Infinity at this type, under a diamond.
- **¬ Possibility (pure).** Every closed pure sentence consistent with C is possible.

## Construction

Use the ordinary full Henkin interpretation with $D_e$ countably infinite, $D_t=\{0,1\}$, and every admitted function type containing all functions between its domains; by Proposition 3.7 it is a model of C. Identity is genuine identity and $\Box$ is the identity on truth values, so $\Diamond$ is truth. Because every domain is full, $\operatorname{FiniteCardinality}_\sigma$ holds exactly of the values of the numerals $\operatorname{Suc}_\sigma^k\mathbf{0}_\sigma$: the characteristic function of that set is in the domain and is inductive. At type $e$ the $k$-th numeral says that there are exactly $k$ individuals, which is false for every $k$, so the Axiom of Infinity at type $e$ holds, and with it the schema. At type $t$ the second numeral holds of $\lambda p\, .\,\top$, so the Axiom of Infinity at type $t$ fails, as does the third instance of the schema, and Possible Infinity at type $t$ fails because $\Diamond$ is truth. Possibility (pure) fails since the C-consistent pure sentence that there is exactly one individual is false. The remaining positive assertions hold as in every two-valued full model: each boxed principle reduces to its unboxed form; coextensive relations are identical, so Extensionality, the Fregean axiom and its modalized form hold; every relation is persistent, inextensible and Gallin-extensional, giving the comprehension principles; Actuality holds with top as the actual world; each relational type is the complete atomic Boolean algebra of subsets of a domain, giving Atomicity and Boolean Completeness; Tractarianism is a tautology; ND holds outright, giving C5; every closed sentence is non-contingent; and the choice principles hold because every function between domains is present, using choice in the metatheory to select from a serial relation on an infinite domain.

## Notes

Explicit specialization of the source's standard Henkin construction to an infinite individual domain, recorded to separate the type-$e$ infinity principles from the type-$t$ ones: it satisfies the Axiom of Infinity at type $e$, hence Possible Infinity at type $e$, while violating the Axiom of Infinity at type $t$. It also shows that the sentence used in pure-possibility-implies-axiom-of-infinity-t, that there could be any positive number of individuals, does not follow from the Axiom of Infinity at type $e$: here there is not possibly exactly one individual. It also witnesses the consistency of C with Goodsell's $I$, assumed in n. 14 of Arithmetic is Necessary: with infinitely many individuals the numerals are pairwise distinct, so $\operatorname{Suc}_e$ is injective on finite cardinalities and $I^*$, hence $I$, is true. Signature principles are not listed, since they depend on how the nonlogical constants are interpreted. With Boolean Completeness listed, the model also shows Countable Boolean Completeness consistent with C.

## Sources

- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, §3.2, Definition 3.6 and Proposition 3.7, pp. 47–48.

<p class='cert'>Record: <code>topics/classicism/models/full-henkin-infinite-base.yaml</code></p>

## Paper references

- **Proof: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §3.2, Definition 3.6 and Proposition 3.7, pp. 47–48
