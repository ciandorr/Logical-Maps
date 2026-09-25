# Finite-support action model: N and singleton, all maps

<p class='cert'>Model — Source: Classicism (2024); produced by Andrew Bacon and Cian Dorr; recorded by OpenAI Codex (GPT-6), 17 September 2026.</p>

## Package

- **BF.** The Barcan Formula at every type. The predicate formulation closes the formula schema using lambda abstraction.
- **Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Relational Choice.** Every serial binary relation has a functional subrelation.
- **□Relational Choice.** Every closed instance of Relational Choice is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **¬ □BF.** Every closed instance of BF is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **¬ Atomlessness.** Atomlessness in the displayed closed propositional formulation.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Distinctness Maximalism (signature Σ).** The Distinctness Maximalism schema for the fixed nonlogical signature Sigma.
- **¬ Distinctness-preserving collapse.** Every truth is necessary under the distinctness-preserving modality.

## Construction

Appendix D, p. 79, the paragraph beginning “One particularly interesting result”: two objects, $W_0=\mathbb N$ and $W_1=\{0\}$, with all functions between them as arrows, $W_i^\ddagger$ the finite subsets of $W_i$, and the model ideally full as in Proposition D.5. BF holds at $W_0$, since every map agrees on any finite set with a surjection, and fails at $W_1$, where $\forall y\,\Box\,x=y$ holds of the one individual but $\Box\forall y\,x=y$ does not; so BF holds without $\Box$BF. Atomlessness fails at $W_0$: the closed sentence that there is exactly one individual denotes the singleton of the unique map to $W_1$, a nonempty proposition with no nonempty proper subproposition. Evaluation point: $W_0$, at its identity arrow.

## Notes

The cited construction is a model of the map’s relational-type framework. The description identifies its evaluation point; construction and verification are given at the PDF locations in References. Interpretation of Σ, fixed for this record: each relational constant denotes the top element of its type and each individual constant denotes one fixed individual. Under it the signature schemata fail. Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness Maximalism (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove. Everything that implies these fails with them. Distinctness-preserving collapse fails at $W_0$: the transposition of $5$ and $6$ is an arrow with an inverse, so for any true $q$ the composite of a member of $q$ with the inverse carries the transposition into $q$, making $\Diamond q$ true there, while the true proposition that $5$ is fixed is false there. Relational Choice holds, necessarily. The model is ideally full, hence extensionally full at every object (Appendix D, the remark after Definition D.3): for any set $R$ of tuples from the domains at an object $V$, the intension that assigns to every arrow out of $V$ into an object $U$ a fixed set $R_U$ of tuples from $U$’s domains, with $R_V=R$, is pinned down by $\emptyset$, so it is the intension of an element of $V^{\bar\sigma\to t}$ with extension $R$ at $1_V$. Given a relation $U$ serial at $V$, choose for each $x$ a $y$ with $(Ux)y$, by choice in the metatheory; the graph is such an $R$, and its element $S$ is functional and a subrelation of $U$ at $1_V$, both conditions being unboxed. The closed Relational Choice instance is true at an arrow $h\colon W_0\to V$ iff it is true at $1_V$ in the truncation by $h$, whose domains at $V$ are those of the model, so it holds at every arrow and $\Box$Relational Choice follows. Cian Dorr’s observation of 23 September 2026.

## Revisions

- **2026-09-23** (Claude Fable 5.1 (Anthropic)) — Expanded the description from Appendix D; settled the Distinctness-preserving collapse. Now violates: Distinctness-preserving collapse.
- **2026-09-23** (Claude Fable 5.1 (Anthropic)) — Added Relational Choice and its necessitation at Cian Dorr’s direction: ideally full models are extensionally full at every object, and choice in the metatheory supplies the functional subrelation; see the notes. Now satisfies: Relational Choice, □Relational Choice.
- **2026-09-22** (Claude Fable 5.1 (Anthropic)) — Fixed an interpretation of Σ (relational constants as top, individual constants as one fixed individual) and recorded the signature schemata it refutes, at Cian Dorr’s request. Now violates: Witnessed Possibility, Separated Structure, Independence (signature Σ), Distinctness Maximalism (signature Σ).
- **2026-09-20** (Claude Fable 5.1 (Anthropic)) — Added both Axioms of Infinity at Cian Dorr's direction. The individuals are the natural numbers and identity at the evaluation arrow is literal, so no numeral counts them. The propositions that a given individual is fixed by the arrow, one for each individual, are pairwise distinct and each has that individual as finite support, so there are infinitely many propositions. The set of numerals at each type is invariant under every arrow, hence has empty support and lies in the domain, so finite cardinality is standard and no finite cardinality holds of the universal property at either type. Now satisfies: Axiom of Infinity (type e), Axiom of Infinity (type t).
- **2026-09-19** (Claude Fable 5.1 (Anthropic)) — Added the failure of Atomlessness at N, witnessed by the proposition that there is exactly one individual, which is the singleton of the arrow to {0}. Original observation; not in the source.
- **2026-09-17** (OpenAI Codex (GPT-6)) — Adopted the source’s relational type system at the user’s request. The cited construction now directly supplies the recorded model; the former type-extension obligation is removed. Now satisfies: BF. Now violates: □BF.

## Sources

- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, Appendix D, p. 79, paragraph beginning “One particularly interesting result”.

<p class='cert'>Record: <code>topics/classicism/models/finite-support-two-object-all-maps.yaml</code></p>

## Paper references

- **Proof: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — Appendix D, p. 79, paragraph beginning “One particularly interesting result”
