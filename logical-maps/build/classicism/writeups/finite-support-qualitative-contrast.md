# Finite-support action model: qualitative contrast

<p class='cert'>Model — Source: Classicism (2024); produced by Andrew Bacon and Cian Dorr; recorded by OpenAI Codex (GPT-6), 17 September 2026.</p>

## Package

- **□ND.** Every closed instance of ND is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **Actuality.** There is a true proposition that entails every true proposition.
- **Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **¬ □Actuality.** Every closed instance of Actuality is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **¬ Atomicity.** Every non-bottom entity of each relational type has an atom below it.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Distinctness (signature Σ).** The Distinctness schema for the fixed nonlogical signature Sigma.
- **¬ Distinctness-preserving collapse.** Every truth is necessary under the distinctness-preserving modality.

## Construction

Appendix D, p. 79, the final construction: two objects $W_0$ and $W_1$, both copies of $\mathbb N$, with the permutations of $\mathbb N$ as the arrows between any pair of objects, finite subsets as $W_i^\ddagger$, and one constraint beyond ideal fullness: a set of arrows belongs to $W_i^t$ only if, whenever it contains an arrow $h$ into $W_0$, it contains $g\circ h$ for every permutation $g$ of $W_0$. Intuitively $W_0$ is a state in which all individuals are qualitatively indiscernible and $W_1$ one in which each plays a unique role. The smallest proposition of $W_0^t$ containing the identity is the set of all arrows $W_0\to W_0$, which witnesses Actuality at $W_0$; Actuality fails at $W_1$ as in part 1, so $\Box$Actuality and hence Atomicity fail at $W_0$ although C5 holds. Evaluation point: $W_0$, at its identity arrow.

## Notes

The cited construction is a model of the map’s relational-type framework. The description identifies its evaluation point; construction and verification are given at the PDF locations in References. Interpretation of Σ, fixed for this record: each relational constant denotes the top element of its type and each individual constant denotes one fixed individual. Under it the signature schemata fail. Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove. Everything that implies these fails with them. Distinctness-preserving collapse fails at $W_0$: every arrow has an inverse, so $\Diamond q$ holds at every arrow for every true $q$, and $\Box(\Diamond q\to p)$ would force every true $p$ to contain every arrow; but the true proposition consisting of all arrows $W_0\to W_0$ together with the arrows into $W_1$ fixing $0$ is pinned down by $\{0\}$, meets the closure constraint, and omits arrows. Relational Choice is left unknown here: the construction constrains $W_i^t$ beyond ideal fullness, so the paper’s remark that ideally full models are extensionally full does not apply to it as stated, and no other argument has been checked.

## Revisions

- **2026-09-23** (Claude Fable 5.1 (Anthropic)) — Expanded the description from Appendix D; settled the Distinctness-preserving collapse. Now violates: Distinctness-preserving collapse.
- **2026-09-23** (Claude Fable 5.1 (Anthropic)) — Noted why Relational Choice is left unknown: the construction goes beyond ideal fullness, so the extensional-fullness argument used for the other Appendix D models does not apply as stated.
- **2026-09-22** (Claude Fable 5.1 (Anthropic)) — Fixed an interpretation of Σ (relational constants as top, individual constants as one fixed individual) and recorded the signature schemata it refutes, at Cian Dorr’s request. Now violates: Witnessed Possibility, Separated Structure, Independence (signature Σ), Distinctness (signature Σ).
- **2026-09-20** (Claude Fable 5.1 (Anthropic)) — Added both Axioms of Infinity at Cian Dorr's direction. The individuals are the natural numbers and identity at the evaluation arrow is literal, so no numeral counts them. The propositions that a given individual is fixed by the arrow, one for each individual, are pairwise distinct and each has that individual as finite support, so there are infinitely many propositions. The set of numerals at each type is invariant under every arrow, hence has empty support and lies in the domain, so finite cardinality is standard and no finite cardinality holds of the universal property at either type. Now satisfies: Axiom of Infinity (type e), Axiom of Infinity (type t).
- **2026-09-17** (OpenAI Codex (GPT-6)) — Adopted the source’s relational type system at the user’s request. The cited construction now directly supplies the recorded model; the former type-extension obligation is removed. Now satisfies: □ND, Actuality. Now violates: □Actuality, Atomicity.

## Sources

- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, Appendix D, p. 79, final construction (two copies of N).

<p class='cert'>Record: <code>topics/classicism/models/finite-support-qualitative-contrast.yaml</code></p>

## Paper references

- **Proof: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — Appendix D, p. 79, final construction (two copies of N)
