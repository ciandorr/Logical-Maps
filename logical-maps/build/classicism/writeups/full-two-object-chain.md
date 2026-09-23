# Full action model: two-object chain

<p class='cert'>Model — Source: Classicism (2024); produced by Andrew Bacon and Cian Dorr; recorded by OpenAI Codex (GPT-6), 17 September 2026.</p>

## Package

- **□Rigid Comprehension.** Every closed instance of Rigid Comprehension is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **□Atomicity.** Every closed instance of Atomicity is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **□Actuality.** Every closed instance of Actuality is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **Relational Choice.** Every serial binary relation has a functional subrelation.
- **□Strong Leibniz Biconditionals (type t).** Every closed instance of Strong Leibniz Biconditionals (type t) is necessary.
- **□Relational Choice.** Every closed instance of Relational Choice is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **Distinctness-preserving collapse.** Every truth is necessary under the distinctness-preserving modality.
- **¬ Fregean Axiom.** Materially equivalent propositions are identical.
- **¬ No Pure Contingency.** Each closed sentence of the pure language, if true, is necessary. This is a sentence schema, not a quantifier over propositions.
- **¬ Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **¬ Infinity Schema (type t).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Distinctness (signature Σ).** The Distinctness schema for the fixed nonlogical signature Sigma.

## Construction

Use two objects with one nonidentity arrow from W0 to W1, evaluated at W0. The source makes the Fregean Axiom false at W0 and true at W1.

## Notes

The cited construction is a model of the map’s relational-type framework. The description identifies its evaluation point; construction and verification are given at the PDF locations in References. Interpretation of Σ, fixed for this record: each relational constant denotes the top element of its type and each individual constant denotes one fixed individual. Under it the signature schemata fail. Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove. Everything that implies these fails with them. The type-t Strong Leibniz Biconditionals hold necessarily: at $W_0$ the singleton $\{k\}$ becomes $\{\mathrm{id}_{W_1}\}$ under $k$ and $\{\mathrm{id}_{W_0}\}$ becomes empty, so both singletons are strong worlds; at $W_1$ there is one arrow and one non-bottom proposition. □Relational Choice holds: the truncation of a full action model at any arrow is again a full action model, its domains at the reachable objects being unchanged, and Relational Choice holds in every full model given choice in the metatheory (Classicism, p. 61). Distinctness-preserving collapse holds: let $a$ be the proposition true at the actual world alone (the identity arrow). For any true $p$, take $q:=a$ in the definition of $\Box_{\ne}p$: under a arrow $k$ to $W_1$, $\Diamond a$ would need an arrow back to $W_0$, and none exists, since no arrow leads back to the actual world; under the identity, $p$ holds. So every truth is $\Box_{\ne}$-necessary, although ND fails.

## Revisions

- **2026-09-23** (Claude Fable 5.1 (Anthropic)) — Recorded the Distinctness-preserving collapse; see the notes. Now satisfies: Distinctness-preserving collapse.
- **2026-09-22** (Claude Fable 5.1 (Anthropic)) — Fixed an interpretation of Σ (relational constants as top, individual constants as one fixed individual) and recorded the signature schemata it refutes, at Cian Dorr’s request. Now violates: Witnessed Possibility, Separated Structure, Independence (signature Σ), Distinctness (signature Σ).
- **2026-09-22** (Claude Fable 5.1 (Anthropic)) — Added □Strong Leibniz Biconditionals (type t); see the notes. Now satisfies: □Strong Leibniz Biconditionals (type t).
- **2026-09-22** (Claude Fable 5.1 (Anthropic)) — Boxed the Relational Choice claim; see the notes. Now satisfies: □Relational Choice.
- **2026-09-20** (Claude Fable 5.1 (Anthropic)) — Added Relational Choice at Cian Dorr's direction. With choice in the metatheory a serial relation has a functional subrelation, and a full model contains every intension, so that subrelation is in the domain; see Classicism, p. 61, on the principles common to full models. The propositions at the evaluation object are the subsets of the two arrows out of it, four in all, and every intension of a full model is present, so the numerals are the finite cardinalities and the fourth holds of the universal property of propositions: the Axiom of Infinity at type t fails, as does the fifth instance of the schema. Now satisfies: Relational Choice. Now violates: Axiom of Infinity (type t), Infinity Schema (type t).
- **2026-09-17** (OpenAI Codex (GPT-6)) — Adopted the source’s relational type system at the user’s request. The cited construction now directly supplies the recorded model; the former type-extension obligation is removed. Now satisfies: □Rigid Comprehension, □Atomicity, □Actuality. Now violates: Fregean Axiom, No Pure Contingency.

## Sources

- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, §3.5, p. 59, fourth paragraph; p. 61.

<p class='cert'>Record: <code>topics/classicism/models/full-two-object-chain.yaml</code></p>

## Paper references

- **Proof: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §3.5, p. 59, fourth paragraph; p. 61
