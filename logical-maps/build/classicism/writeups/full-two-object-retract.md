# Full action model: two-object retract

<p class='cert'>Model — Source: Classicism (2024); produced by Andrew Bacon and Cian Dorr; recorded by OpenAI Codex (GPT-6), 17 September 2026.</p>

## Package

- **□Rigid Comprehension.** Every closed instance of Rigid Comprehension is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **□Atomicity.** Every closed instance of Atomicity is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **□Actuality.** Every closed instance of Actuality is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **ND (type t).** ND (type t) in the displayed closed propositional formulation.
- **B for pure sentences.** The B instance for every closed sentence in the pure language.
- **Relational Choice.** Every serial binary relation has a functional subrelation.
- **□Relational Choice.** Every closed instance of Relational Choice is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **¬ □ND (type t).** Every closed instance of ND (type t) is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **¬ No Pure Contingency.** Each closed sentence of the pure language, if true, is necessary. This is a sentence schema, not a quantifier over propositions.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Distinctness (signature Σ).** The Distinctness schema for the fixed nonlogical signature Sigma.
- **¬ Strong Leibniz Biconditionals (type t).** The type-t instance of the Strong Leibniz Biconditionals: every possible proposition is entailed by a strong world proposition, one that is possible and necessarily entails every proposition or its negation.
- **¬ Distinctness-preserving collapse.** Every truth is necessary under the distinctness-preserving modality.

## Construction

Use the source’s category with h:W0→W1, j:W1→W0 and k:W1→W1, evaluated at W0. ND at t holds there and fails at W1. Only the type-t ND assertion is recorded.

## Notes

The cited construction is a model of the map’s relational-type framework. The description identifies its evaluation point; construction and verification are given at the PDF locations in References. Interpretation of Σ, fixed for this record: each relational constant denotes the top element of its type and each individual constant denotes one fixed individual. Under it the signature schemata fail. Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove. Everything that implies these fails with them. The type-t Strong Leibniz Biconditionals fail at $W_0$: the possible proposition $\{h\}$ has only itself as a candidate strong world below it, but under $h$ it becomes $\{x : x\circ h=h\}=\{\mathrm{id}_{W_1},k\}$, which the proposition $\{\mathrm{id}_{W_1}\}$ of $W_1$’s full domain separates, so $\{h\}$ does not necessarily settle every proposition. Since Atomicity holds in this full model, this shows that Atomicity (type t) alone does not yield the type-t Strong Leibniz Biconditionals; BF (type t) fails here, $h$ acting non-surjectively from a four-element to an eight-element domain. □Relational Choice holds: the truncation of a full action model at any arrow is again a full action model, its domains at the reachable objects being unchanged, and Relational Choice holds in every full model given choice in the metatheory (Classicism, p. 61). Distinctness-preserving collapse fails at $W_0$: let $p:=\{\mathrm{id}_{W_0}\}$, true. A witness $q$ contains $\mathrm{id}_{W_0}$, and $j\circ h=\mathrm{id}_{W_0}$, so $\Diamond q$ holds under $h$ while $p$ does not.

## Revisions

- **2026-09-23** (Claude Fable 5.1 (Anthropic)) — Recorded the Distinctness-preserving collapse; see the notes. Now violates: Distinctness-preserving collapse.
- **2026-09-22** (Claude Fable 5.1 (Anthropic)) — Fixed an interpretation of Σ (relational constants as top, individual constants as one fixed individual) and recorded the signature schemata it refutes, at Cian Dorr’s request. Now violates: Witnessed Possibility, Separated Structure, Independence (signature Σ), Distinctness (signature Σ).
- **2026-09-22** (Claude Fable 5.1 (Anthropic)) — Added the failure of Strong Leibniz Biconditionals (type t) at W0; see the notes. Now violates: Strong Leibniz Biconditionals (type t).
- **2026-09-22** (Claude Fable 5.1 (Anthropic)) — Boxed the Relational Choice claim; see the notes. Now satisfies: □Relational Choice.
- **2026-09-20** (Claude Fable 5.1 (Anthropic)) — Added Relational Choice at Cian Dorr's direction. With choice in the metatheory a serial relation has a functional subrelation, and a full model contains every intension, so that subrelation is in the domain; see Classicism, p. 61, on the principles common to full models. Now satisfies: Relational Choice.
- **2026-09-17** (OpenAI Codex (GPT-6)) — Adopted the source’s relational type system at the user’s request. The cited construction now directly supplies the recorded model; the former type-extension obligation is removed. Now satisfies: □Rigid Comprehension, □Atomicity, □Actuality, ND (type t), B for pure sentences. Now violates: □ND (type t), No Pure Contingency.

## Sources

- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, §3.5, p. 59, fifth paragraph and n. 81; p. 61.

<p class='cert'>Record: <code>topics/classicism/models/full-two-object-retract.yaml</code></p>

## Paper references

- **Proof: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §3.5, p. 59, fifth paragraph and n. 81; p. 61
