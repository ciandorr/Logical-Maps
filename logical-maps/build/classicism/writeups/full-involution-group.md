# Full action model: two-element group

<p class='cert'>Model — Source: Classicism (2024); produced by Andrew Bacon and Cian Dorr; recorded by OpenAI Codex (GPT-6), 17 September 2026.</p>

## Package

- **□Rigid Comprehension.** Every closed instance of Rigid Comprehension is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **□Atomicity.** Every closed instance of Atomicity is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **□Actuality.** Every closed instance of Actuality is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **□ND.** Every closed instance of ND is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **No Pure Contingency.** Each closed sentence of the pure language, if true, is necessary. This is a sentence schema, not a quantifier over propositions.
- **Relational Choice.** Every serial binary relation has a functional subrelation.
- **□Strong Leibniz Biconditionals (type t).** Every closed instance of Strong Leibniz Biconditionals (type t) is necessary.
- **□Relational Choice.** Every closed instance of Relational Choice is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **Transversal Choice.** Every equivalence relation, at any type including e, has a transversal, that is, a property with exactly one instance in each of its cells.
- **¬ Fregean Axiom.** Materially equivalent propositions are identical.
- **¬ Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **¬ Infinity Schema (type t).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Distinctness Maximalism (signature Σ).** The Distinctness Maximalism schema for the fixed nonlogical signature Sigma.
- **¬ No Contingency (signature Σ).** Each closed sentence of the language of the fixed signature Sigma, if true, is necessary. A sentence schema, standing to No Pure Contingency as Possibility Maximalism (signature Σ) stands to Possibility Maximalism (pure).

## Construction

Change the two-arrow multiplication to k²=1; evaluate at the sole object. The source establishes boxed ND and exhibits four propositions.

## Notes

The cited construction is a model of the map’s relational-type framework. The description identifies its evaluation point; construction and verification are given at the PDF locations in References. Interpretation of Σ, fixed for this record: one designated relational constant $c$ of type $\tau=\bar\sigma t$ denotes $\lambda\bar x\, .\,a$, where $a$ is the unique true atom of the model, the actual-world proposition described above; every other relational constant denotes the top element of its type and every individual constant one fixed individual. Under it: No Contingency (signature Σ) fails, since the Σ-sentence $\forall\bar x\, .\,c\bar x$ denotes $a$, true and contingent; Witnessed Possibility fails for the pure formula $x=\top_\tau$, witnessed by $\top_\tau$, since $\Diamond(c=\top_\tau)$ is $\Diamond\Box a$ and $a$ is necessary at no arrow; Separated Structure fails with it, being equivalent to Possibly Witnessed Possibility; Independence (signature Σ) and Distinctness Maximalism (signature Σ) fail through the other relational constants, Σ being assumed to contain at least one: such a constant $c'$ of type $\tau'$ denotes what the closed pure term $\top_{\tau'}$ denotes, and $c'=\top_{\tau'}$ is a true identity that C(Σ) does not prove. The designated constant refutes neither: closed pure terms denote entities fixed by every arrow (Classicism, §3.5, p. 58), whereas $a$ is fixed by no arrow but the identity, so no closed pure term denotes $\lambda\bar x\, .\,a$. Everything that implies these fails with them. In a one-object model whose propositions are all the sets of arrows, a singleton $\{h\}$ is a strong world exactly when its transport $\{j : j\circ i=h\}$ along every arrow $i$ has at most one member, since the propositions at that world are again all sets of arrows and a two-element set is split by a singleton. Here the arrows form a group, so $j\circ i=j^{\prime}\circ i$ forces $j=j^{\prime}$. So every singleton is a strong world, every possible proposition contains an arrow, and the type-t Strong Leibniz Biconditionals hold at every world. □Relational Choice holds: the truncation of a full action model at any arrow is again a full action model, its domains at the reachable objects being unchanged, and Relational Choice holds in every full model given choice in the metatheory (Classicism, p. 61).

## Revisions

- **2026-09-25** (Claude Fable 5.1 (Anthropic)) — Added Transversal Choice, by the argument recorded for Relational Choice: a full model contains every intension, in particular one whose extension at the evaluation point is a transversal, chosen in the metatheory, of the extension there of an equivalence relation; the equivalence and transversal conditions are unboxed. Recorded on a question of Zachary Goodsell, after an observation of Christopher Sun. Now satisfies: Transversal Choice.
- **2026-09-23** (Claude Fable 5.1 (Anthropic)) — Re-fixed the interpretation of Σ so as to settle No Contingency (signature Σ) and B for sentences of Σ, at Cian Dorr’s request; see the notes. Now violates: No Contingency (signature Σ).
- **2026-09-23** (Claude Fable 5.1 (Anthropic)) — Corrected the reason given for the failures of Independence (signature Σ) and Distinctness (signature Σ): the true atom is denoted by no closed pure term, since such terms denote entities fixed by every arrow; the failures come from the other relational constants, which denote top. No verdict changes.
- **2026-09-23** (Claude Fable 5.1 (Anthropic)) — Corrected the justification of □Strong Leibniz Biconditionals (type t): the 22 September argument tacitly used that the monoid is right-cancellative, which holds here; no verdict changes.
- **2026-09-22** (Claude Fable 5.1 (Anthropic)) — Fixed an interpretation of Σ (relational constants as top, individual constants as one fixed individual) and recorded the signature schemata it refutes, at Cian Dorr’s request. Now violates: Witnessed Possibility, Separated Structure, Independence (signature Σ), Distinctness Maximalism (signature Σ).
- **2026-09-22** (Claude Fable 5.1 (Anthropic)) — Added □Strong Leibniz Biconditionals (type t): every singleton of an arrow is a strong world in a propositionally full one-object model; see the notes. Now satisfies: □Strong Leibniz Biconditionals (type t).
- **2026-09-22** (Claude Fable 5.1 (Anthropic)) — Boxed the Relational Choice claim; see the notes. Now satisfies: □Relational Choice.
- **2026-09-20** (Claude Fable 5.1 (Anthropic)) — Added Relational Choice at Cian Dorr's direction. With choice in the metatheory a serial relation has a functional subrelation, and a full model contains every intension, so that subrelation is in the domain; see Classicism, p. 61, on the principles common to full models. The propositions at the evaluation object are the subsets of the two arrows out of it, four in all, and every intension of a full model is present, so the numerals are the finite cardinalities and the fourth holds of the universal property of propositions: the Axiom of Infinity at type t fails, as does the fifth instance of the schema. Now satisfies: Relational Choice. Now violates: Axiom of Infinity (type t), Infinity Schema (type t).
- **2026-09-17** (OpenAI Codex (GPT-6)) — Adopted the source’s relational type system at the user’s request. The cited construction now directly supplies the recorded model; the former type-extension obligation is removed. Now satisfies: □Rigid Comprehension, □Atomicity, □Actuality, □ND, No Pure Contingency. Now violates: Fregean Axiom.

## Sources

- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, §3.5, p. 59, second paragraph; p. 61.

<p class='cert'>Record: <code>topics/classicism/models/full-involution-group.yaml</code></p>

## Paper references

- **Proof: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §3.5, p. 59, second paragraph; p. 61
