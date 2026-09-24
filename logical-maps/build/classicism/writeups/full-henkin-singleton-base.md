# Full Henkin model: singleton individual domain

<p class='cert'>Model — Source: Misc.; produced by OpenAI Codex (GPT-6), 17 September 2026; recorded by OpenAI Codex (GPT-6), 17 September 2026.</p>

## Package

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
- **Strong Leibniz Biconditionals.** At each relational type, every possible entity (one distinct from bottom) is entailed by a strong world: a possible entity that necessarily entails every entity of the type or its negation. The right-to-left direction is a theorem of C; the principle records the substantive direction.
- **□Strong Leibniz Biconditionals.** Every closed instance of the Strong Leibniz Biconditionals is necessary. Box the entire object-variable closure; retain the type range.
- **No Contingency (signature Σ).** Each closed sentence of the language of the fixed signature Sigma, if true, is necessary. A sentence schema, standing to No Pure Contingency as Possibility Maximalism (signature Σ) stands to Possibility Maximalism (pure).
- **B for sentences of Σ.** The B instance for every closed sentence of the language of the fixed signature Sigma.
- **□Relational Choice.** Every closed instance of Relational Choice is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **□Functional Choice.** Every closed instance of Functional Choice is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **¬ Infinity Schema (type e).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ Infinity Schema (type t).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.
- **¬ Atomlessness.** Atomlessness in the displayed closed propositional formulation.
- **¬ Possibility Maximalism (pure).** Every closed pure sentence consistent with C is possible.
- **¬ Possible Infinity (type e).** Possibly there are not finitely many individuals: the Axiom of Infinity at this type, under a diamond.
- **¬ Possible Infinity (type t).** Possibly there are not finitely many propositions: the Axiom of Infinity at this type, under a diamond.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Distinctness Maximalism (signature Σ).** The Distinctness Maximalism schema for the fixed nonlogical signature Sigma.

## Construction

Use the ordinary full Henkin interpretation: D_e is a singleton, D_t={0,1}, and every admitted function type contains all functions between its domains. Domains are finite by induction on types, so every serial relation has a functional subrelation and, when the output type is relational, a selecting operation. Equality is genuine equality and Box is the identity on truth values. These facts verify the listed positive assertions. The two finite base domains refute the infinity assertions, top is an atom, and the possible existence of two individuals is false although its pure sentence is C-consistent.

## Notes

Explicit specialization of the source’s standard Henkin construction to a singleton individual domain. No independent checking or formal verification is claimed. The model is a standard model of extensional classical type theory in which the defined necessity is truth: a boxed principle holds exactly when its unboxed form does, coextensive relations are identical, every relation is rigid in every recorded sense, the Boolean algebra at each relational type is the complete atomic algebra of subsets of the domain, and every closed sentence is non-contingent. The pure schemata fail because C-consistent sentences about how many individuals there are can be false. No Contingency (signature Σ) and B for sentences of Σ hold in a one-world model however the constants are interpreted. Interpretation of Σ, fixed for this record: each relational constant denotes the top element of its type and each individual constant denotes one fixed individual. Under it the signature schemata fail. Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness Maximalism (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove. Everything that implies these fails with them. Box is truth in this one-world model, so □Relational Choice and □Functional Choice hold with their unboxed forms.

## Revisions

- **2026-09-22** (Claude Fable 5.1 (Anthropic)) — Added the Strong Leibniz Biconditionals and their necessitation. Box is truth in this model, so a strong world is an atom and the principle reduces to Atomicity, which holds; boxed principles reduce to their unboxed forms. Now satisfies: Strong Leibniz Biconditionals, □Strong Leibniz Biconditionals.
- **2026-09-22** (Claude Fable 5.1 (Anthropic)) — Added No Contingency (signature Σ) and B for sentences of Σ: Box is truth in this model, so every closed sentence, whatever the constants denote, is necessary if true and necessarily possible if true. Now satisfies: No Contingency (signature Σ), B for sentences of Σ.
- **2026-09-22** (Claude Fable 5.1 (Anthropic)) — Fixed an interpretation of Σ (relational constants as top, individual constants as one fixed individual) and recorded the signature schemata it refutes, at Cian Dorr’s request. Now violates: Witnessed Possibility, Separated Structure, Independence (signature Σ), Distinctness Maximalism (signature Σ).
- **2026-09-22** (Claude Fable 5.1 (Anthropic)) — Boxed the two Choice claims. Now satisfies: □Relational Choice, □Functional Choice.
- **2026-09-20** (Claude Fable 5.1 (Anthropic)) — Verified the Possible Infinity principles added on this date. Box is the identity on truth values, so each fails with the corresponding Axiom of Infinity. Now violates: Possible Infinity (type e), Possible Infinity (type t).
- **2026-09-20** (Claude Fable 5.1 (Anthropic)) — Listed the strongest principles the model obviously satisfies, at Cian Dorr's request. Since Box is truth and identity is genuine, each boxed principle reduces to its unboxed form; coextensive relations are identical because every function type is full; every relation is persistent, inextensible and Gallin-extensional trivially; Actuality holds with top as the actual world; each relational type is a complete atomic Boolean algebra, giving Atomicity and Boolean Completeness; Tractarianism is the tautology that a proposition entailing each instance entails the universal claim; and ND holds outright, giving C5. Now satisfies: □Fregean Axiom, Modalized Fregean Axiom, Extensionality, □Extensionality, Intensionality, □Functionality, □Plenitude, Tractarianism, □Tractarianism, □ND, □Actuality, □Atomicity, □Boolean Completeness, □Rigid Comprehension, □Gallin Extensional Comprehension.
- **2026-09-17** (OpenAI Codex (GPT-6)) — Restricted the example and its recorded choice properties to the map’s relational type system at the user’s request. Now satisfies: Fregean Axiom, Functionality, Modalized Functionality, Plenitude, Functional Choice, Relational Choice, No Pure Contingency, Distinctness-preserving collapse.

## Sources

- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, §3.2, Definition 3.6 and Proposition 3.7, pp. 47–48; §1.4, n. 18, p. 16.

<p class='cert'>Record: <code>topics/classicism/models/full-henkin-singleton-base.yaml</code></p>

## Paper references

- **Proof: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §3.2, Definition 3.6 and Proposition 3.7, pp. 47–48; §1.4, n. 18, p. 16
