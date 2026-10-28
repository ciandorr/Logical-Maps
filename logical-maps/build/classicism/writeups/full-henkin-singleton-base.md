# Full Henkin model: singleton individual domain

<p class='cert'>Model — Source: Misc.; produced by OpenAI Codex (GPT-6), prompted by Zachary Goodsell, 17 September 2026; recorded by OpenAI Codex (GPT-6), prompted by Zachary Goodsell, 17 September 2026.</p>

## Package

- **Fregean Axiom.** Materially equivalent propositions are identical.
- **Functional Choice.** Every serial binary relation admits a selecting operation. Its output type is relational, as required by the type system.
- **¬ Infinity Schema (type e).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Maximalism (signature Σ).** The Maximalism schema for the fixed nonlogical signature Σ: every closed identity of its language not provable in C(Σ) is false.

## Definition

Use the ordinary full Henkin interpretation: D_e is a singleton, D_t={0,1}, and every admitted function type contains all functions between its domains.

Interpretation of Σ, fixed for this record: every constant of Σ is relational, and each denotes the top element of its type.

## Arguments

### Holds Fregean Axiom, Functional Choice.

Domains are finite by induction on types, so every serial relation has a functional subrelation and, when the output type is relational, a selecting operation. Equality is genuine equality and Box is the identity on truth values. These facts verify the listed positive assertions.

*By OpenAI Codex (GPT-6), prompted by Zachary Goodsell, 17 September 2026.*

### Fails Infinity Schema (type e).

The two finite base domains refute the infinity assertions, top is an atom, and the possible existence of two individuals is false although its pure sentence is C-consistent.

*By OpenAI Codex (GPT-6), prompted by Zachary Goodsell, 17 September 2026.*

### Fails Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).

Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness Maximalism (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove.

*General argument `arguments/sigma-top`. It requires that Every constant of Σ is relational, and each denotes the top element of its type. Here: This is the interpretation the definition fixes. By Claude Fable 5.1 (Anthropic), at Cian Dorr’s request, 2026-09-22.*

*Revised 2026-10-02 by Claude Opus 5.5 (Anthropic), at Cian Dorr's direction:* Moved from the group finite-support-one-object to the topic; it uses nothing about the model.


## Notes

Explicit specialization of the source’s standard Henkin construction to a singleton individual domain. No independent checking or formal verification is claimed. Everything that implies these fails with them.

## History

The record's revision log before it was written as arguments.

- **2026-09-22** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Added Strong Atomicity and its necessitation. Box is truth in this model, so a strong atom is an atom and the principle reduces to Atomicity, which holds; boxed principles reduce to their unboxed forms. Now satisfies: Strong Atomicity, □Strong Atomicity.
- **2026-09-22** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Added No Contingency (signature Σ) and B for sentences of Σ: Box is truth in this model, so every closed sentence, whatever the constants denote, is necessary if true and necessarily possible if true. Now satisfies: No Contingency (signature Σ), B for sentences of Σ.
- **2026-09-22** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Fixed an interpretation of Σ (relational constants as top, individual constants as one fixed individual) and recorded the signature schemata it refutes, at Cian Dorr’s request. Now violates: Witnessed Possibility, Separated Structure, Independence (signature Σ), Maximalism (signature Σ).
- **2026-09-22** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Boxed the two Choice claims. Now satisfies: □Relational Choice, □Functional Choice.
- **2026-09-20** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Verified the Possible Infinity principles added on this date. Box is the identity on truth values, so each fails with the corresponding Axiom of Infinity. Now violates: Possible Infinity (type e), Possible Infinity (type t).
- **2026-09-20** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr) — Listed the strongest principles the model obviously satisfies, at Cian Dorr's request. Since Box is truth and identity is genuine, each boxed principle reduces to its unboxed form; coextensive relations are identical because every function type is full; every relation is persistent, inextensible and Gallin-extensional trivially; Actuality holds with top as the actual world; each relational type is a complete atomic Boolean algebra, giving Atomicity and Boolean Completeness; Tractarianism is the tautology that a proposition entailing each instance entails the universal claim; and ND holds outright, giving C5. Now satisfies: □Fregean Axiom, Modalized Fregean Axiom, Extensionality, □Extensionality, Intensionality, □Functionality, □Plenitude, Tractarianism, □Tractarianism, □ND, □Actuality, □Atomicity, □Boolean Completeness, □Rigid Comprehension, □Gallin Extensional Comprehension.
- **2026-09-17** (OpenAI Codex (GPT-6), prompted by Zachary Goodsell) — Restricted the example and its recorded choice properties to the map’s relational type system at the user’s request. Now satisfies: Fregean Axiom, Functionality, Modalized Functionality, Plenitude, Functional Choice, Relational Choice, No Pure Contingency, Truth implies ND-necessity.

## Sources

- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, §3.2, Definition 3.6 and Proposition 3.7, pp. 47–48; §1.4, n. 18, p. 16.

<p class='cert'>Record: <code>topics/classicism/models/full-henkin-singleton-base.yaml</code></p>

## Paper references

- **Proof: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §3.2, Definition 3.6 and Proposition 3.7, pp. 47–48; §1.4, n. 18, p. 16
