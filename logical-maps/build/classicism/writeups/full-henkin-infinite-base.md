# Full Henkin model: countably infinite individual domain

<p class='cert'>Model — Source: Misc.; produced by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 20 September 2026; recorded by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 20 September 2026.</p>

## Package

- **Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Fregean Axiom.** Materially equivalent propositions are identical.
- **Functional Choice.** Every serial binary relation admits a selecting operation. Its output type is relational, as required by the type system.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.

## Definition

Use the ordinary full Henkin interpretation with $D_e$ countably infinite, $D_t=\{0,1\}$, and every admitted function type containing all functions between its domains; by Proposition 3.7 it is a model of C. Identity is genuine identity and $\Box$ is the identity on truth values, so $\Diamond$ is truth.

Interpretation of Σ, fixed for this record: every constant of Σ is relational, and each denotes the top element of its type.

## Arguments

### Holds Axiom of Infinity (type e).

Because every domain is full, $\operatorname{FiniteCardinality}_\sigma$ holds exactly of the values of the numerals $\operatorname{Suc}_\sigma^k\mathbf{0}_\sigma$: the characteristic function of that set is in the domain and is inductive. At type $e$ the $k$-th numeral says that there are exactly $k$ individuals, which is false for every $k$, so the Axiom of Infinity at type $e$ holds, and with it the schema.

*By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 20 September 2026.*

### Holds Fregean Axiom, Functional Choice.

The remaining positive assertions hold as in every two-valued full model: each boxed principle reduces to its unboxed form; coextensive relations are identical, so Extensionality, the Fregean axiom and its modalized form hold; every relation is persistent, inextensible and Gallin-extensional, giving the comprehension principles; Actuality holds with top as the actual world; each relational type is the complete atomic Boolean algebra of subsets of a domain, giving Atomicity and Boolean Completeness; Tractarianism is a tautology; ND holds outright, giving C5; every closed sentence is non-contingent; and the choice principles hold because every function between domains is present, using choice in the metatheory to select from a serial relation on an infinite domain.

*By Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 20 September 2026.*

### Fails Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).

Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness Maximalism (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove.

*General argument `arguments/sigma-top`. It requires that Every constant of Σ is relational, and each denotes the top element of its type. Here: This is the interpretation the definition fixes. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic; it uses nothing about the model.


## Notes

Explicit specialization of the source's standard Henkin construction to an infinite individual domain, recorded to separate the type-$e$ infinity principles from the type-$t$ ones: it satisfies the Axiom of Infinity at type $e$, hence Possible Infinity at type $e$, while violating the Axiom of Infinity at type $t$. It also shows that the sentence used in pure-possibility-implies-axiom-of-infinity-t, that there could be any positive number of individuals, does not follow from the Axiom of Infinity at type $e$: here there is not possibly exactly one individual. It also witnesses the consistency of C with Goodsell's $I$, assumed in n. 14 of Arithmetic is Necessary: with infinitely many individuals the numerals are pairwise distinct, so $\operatorname{Suc}_e$ is injective on finite cardinalities and $I^*$, hence $I$, is true. With Boolean Completeness listed, the model also shows Countable Boolean Completeness consistent with C. Everything that implies these fails with them.

## History

The record's revision log before it was written as arguments.

- **2026-09-22** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Added Strong Atomicity and its necessitation. Box is truth in this model, so a strong atom is an atom and the principle reduces to Atomicity, which holds; boxed principles reduce to their unboxed forms. Now satisfies: Strong Atomicity, □Strong Atomicity.
- **2026-09-22** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Added No Contingency (signature Σ) and B for sentences of Σ: Box is truth in this model, so every closed sentence, whatever the constants denote, is necessary if true and necessarily possible if true. Now satisfies: No Contingency (signature Σ), B for sentences of Σ.
- **2026-09-22** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Fixed an interpretation of Σ (relational constants as top, individual constants as one fixed individual) and recorded the signature schemata it refutes, at Cian Dorr’s request. Now violates: Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).
- **2026-09-22** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Boxed the two Choice claims. Now satisfies: □Relational Choice, □Functional Choice.

## Sources

- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, §3.2, Definition 3.6 and Proposition 3.7, pp. 47–48.

<p class='cert'>Record: <code>topics/classicism/models/full-henkin-infinite-base.yaml</code></p>

## Paper references

- **Proof: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §3.2, Definition 3.6 and Proposition 3.7, pp. 47–48
