# Full Henkin model: singleton individual domain

<p class='cert'>Model — Source: Misc.; produced by OpenAI Codex (GPT-6), 17 September 2026; recorded by OpenAI Codex (GPT-6), 17 September 2026.</p>

## Package

- **Fregean Axiom.** Materially equivalent propositions are identical.
- **Functionality.** Operations with the same value on every argument are identical. The output type is relational.
- **Modalized Functionality.** Necessarily co-functional operations of function types are identical.
- **Plenitude.** Every total single-valued binary relation is represented by an operation. Its output type is relational, as required by the type system.
- **Functional Choice.** Every serial binary relation admits a selecting operation. Its output type is relational, as required by the type system.
- **Relational Choice.** Every serial binary relation has a functional subrelation.
- **No Pure Contingency.** Each closed sentence of the pure language, if true, is necessary. This is a sentence schema, not a quantifier over propositions.
- **Distinctness-preserving collapse.** Every truth is necessary under the distinctness-preserving modality.
- **¬ Infinity (type e).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ Infinity (type t).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ Atomlessness.** Atomlessness in the displayed closed propositional formulation.
- **¬ Possibility (pure).** Every closed pure sentence consistent with C is possible.

## Construction

Use the ordinary full Henkin interpretation: D_e is a singleton, D_t={0,1}, and every admitted function type contains all functions between its domains. Domains are finite by induction on types, so every serial relation has a functional subrelation and, when the output type is relational, a selecting operation. Equality is genuine equality and Box is the identity on truth values. These facts verify the listed positive assertions. The two finite base domains refute the infinity assertions, top is an atom, and the possible existence of two individuals is false although its pure sentence is C-consistent.

## Notes

Explicit specialization of the source’s standard Henkin construction to a singleton individual domain. No independent checking or formal verification is claimed.

## Revisions

- **2026-09-17** (OpenAI Codex (GPT-6)) — Restricted the example and its recorded choice properties to the map’s relational type system at the user’s request. Now satisfies: Fregean Axiom, Functionality, Modalized Functionality, Plenitude, Functional Choice, Relational Choice, No Pure Contingency, Distinctness-preserving collapse.

## Sources

- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, §3.2, Definition 3.6 and Proposition 3.7, pp. 47–48; §1.4, n. 18, p. 16.

<p class='cert'>Record: <code>topics/classicism/models/full-henkin-singleton-base.yaml</code></p>

## Paper references

- **Proof: Classicism.** Bacon, Andrew, and Cian Dorr. Classicism. Draft dated 16 May 2023, 87 pages. All page, proposition and footnote locators in this map refer to this draft. — §3.2, Definition 3.6 and Proposition 3.7, pp. 47–48; §1.4, n. 18, p. 16
