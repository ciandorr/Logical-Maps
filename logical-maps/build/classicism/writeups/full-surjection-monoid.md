# Full action model: surjections of an infinite set

<p class='cert'>Model — Source: Classicism (2024); produced by Andrew Bacon and Cian Dorr; recorded by OpenAI Codex (GPT-6), 17 September 2026.</p>

## Package

- **□Rigid Comprehension.** Every closed instance of Rigid Comprehension is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **□Atomicity.** Every closed instance of Atomicity is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **□Actuality.** Every closed instance of Actuality is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **□BF.** Every closed instance of BF is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **No Pure Contingency.** Each closed sentence of the pure language, if true, is necessary. This is a sentence schema, not a quantifier over propositions.
- **Relational Choice.** Every serial binary relation has a functional subrelation.
- **Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **□Strong Leibniz Biconditionals (type t).** Every closed instance of Strong Leibniz Biconditionals (type t) is necessary.
- **□Relational Choice.** Every closed instance of Relational Choice is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **No Contingency (signature Σ).** Each closed sentence of the language of the fixed signature Sigma, if true, is necessary. A sentence schema, standing to No Pure Contingency as Possibility (signature Σ) stands to Possibility (pure).
- **B for sentences of Σ.** The B instance for every closed sentence of the language of the fixed signature Sigma.
- **¬ ND (type t).** ND (type t) in the displayed closed propositional formulation.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Distinctness (signature Σ).** The Distinctness schema for the fixed nonlogical signature Sigma.
- **¬ Distinctness-preserving collapse.** Every truth is necessary under the distinctness-preserving modality.

## Construction

Use the monoid of surjections of an infinite set and a surjective individual action, at its sole object. The source cites Bacon 2020, Proposition A.3 for the higher-type surjectivity argument.

## Notes

The cited construction is a model of the map’s relational-type framework. The description identifies its evaluation point; construction and verification are given at the PDF locations in References. Interpretation of Σ, fixed for this record: each relational constant denotes the top element of its type and each individual constant denotes one fixed individual $d$. Under it the signature schemata that give the constants a special role fail: with $c\in\Sigma$ of relational type $\tau$, $c=\top_\tau$ necessarily, so Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$, Independence (signature Σ) fails since $c$ denotes what a closed pure term denotes, and Distinctness (signature Σ) fails since $c=\top_\tau$ is true and unprovable. But No Contingency (signature Σ), and with it B for sentences of Σ, hold. The relational constants denote pure entities, so a closed Σ-sentence denotes what some $P(d,\ldots,d)$ denotes for a pure formula $P$; the model’s automorphisms carry every individual to every other, so $P(d,\ldots,d)$ is materially equivalent to the pure sentence $\forall x\, .\,P(x,\ldots,x)$ and its negation to $\forall x\, .\,\neg P(x,\ldots,x)$; whichever is true is necessary by No Pure Contingency, and instantiation under the box gives $\Box P(d,\ldots,d)$ or $\Box\neg P(d,\ldots,d)$. In a one-object action model whose propositions are all the sets of arrows, every singleton $\{h\}$ is a strong world proposition: seen from an arrow $i$ it becomes $\{j : j\circ i=h\}$, and every proposition at that world is the shift $\{j : j\circ i\in Y\}$ of a root proposition $Y$, whose membership for such $j$ depends only on whether $h\in Y$; so it entails every proposition or its negation, at every world. Any possible proposition contains some arrow, so the type-t Strong Leibniz Biconditionals hold at every world. □Relational Choice holds: the truncation of a full action model at any arrow is again a full action model, its domains at the reachable objects being unchanged, and Relational Choice holds in every full model given choice in the metatheory (Classicism, p. 61). Distinctness-preserving collapse fails: let $p:=\{\mathrm{id}\}$, true. Any witness $q$ for $\Box_{\ne}p$ is true, so contains the identity, and for a non-identity bijection $i$ the arrow $i^{-1}$ gives $i^{-1}\circ i\in q$, so $\Diamond q$ holds under $i$ while $p$ does not. So no true $q$ has $\Box(\Diamond q\to p)$.

## Revisions

- **2026-09-23** (Claude Fable 5.1 (Anthropic)) — Recorded the Distinctness-preserving collapse; see the notes. Now violates: Distinctness-preserving collapse.
- **2026-09-23** (Claude Fable 5.1 (Anthropic)) — Re-fixed the interpretation of Σ so as to settle No Contingency (signature Σ) and B for sentences of Σ, at Cian Dorr’s request; see the notes. Now satisfies: No Contingency (signature Σ), B for sentences of Σ.
- **2026-09-22** (Claude Fable 5.1 (Anthropic)) — Fixed an interpretation of Σ (relational constants as top, individual constants as one fixed individual) and recorded the signature schemata it refutes, at Cian Dorr’s request. Now violates: Witnessed Possibility, Separated Structure, Independence (signature Σ), Distinctness (signature Σ).
- **2026-09-22** (Claude Fable 5.1 (Anthropic)) — Added □Strong Leibniz Biconditionals (type t): every singleton of an arrow is a strong world in a propositionally full one-object model; see the notes. Now satisfies: □Strong Leibniz Biconditionals (type t).
- **2026-09-22** (Claude Fable 5.1 (Anthropic)) — Boxed the Relational Choice claim; see the notes. Now satisfies: □Relational Choice.
- **2026-09-20** (Claude Fable 5.1 (Anthropic)) — Added Relational Choice at Cian Dorr's direction. With choice in the metatheory a serial relation has a functional subrelation, and a full model contains every intension, so that subrelation is in the domain; see Classicism, p. 61, on the principles common to full models. Added both Axioms of Infinity: the individuals are an infinite set and the arrows an infinite monoid, identity at the identity arrow is literal, and the numeral sets at each type are intensions of a full model, so no finite cardinality holds of the universal property at type e or at type t. Now satisfies: Relational Choice, Axiom of Infinity (type e), Axiom of Infinity (type t).
- **2026-09-17** (OpenAI Codex (GPT-6)) — Adopted the source’s relational type system at the user’s request. The cited construction now directly supplies the recorded model; the former type-extension obligation is removed. Now satisfies: □Rigid Comprehension, □Atomicity, □Actuality, □BF, No Pure Contingency. Now violates: ND (type t).

## Sources

- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, §3.5, p. 59, third paragraph; p. 61 and n. 84.

<p class='cert'>Record: <code>topics/classicism/models/full-surjection-monoid.yaml</code></p>

## Paper references

- **Proof: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §3.5, p. 59, third paragraph; p. 61 and n. 84
- **Proof: Logical Combinatorialism.** Bacon, Andrew (2020). Logical Combinatorialism. Philosophical Review 129(4), 537–589. As cited in Classicism, §§2.5 and 3.5. Read directly for the import of 22 September 2026; section, footnote and page locators refer to the published pagination. — Proposition A.3, as cited in Classicism p. 59
