# Symmetric ideally-full model: arrows omitting or reserving a fixed individual

<p class='cert'>Model — Source: BC does not imply RC (draft); produced by Cian Dorr; recorded by Claude Opus 5 (Anthropic), 19 September 2026.</p>

## Package

- **Boolean Completeness.** Every property of entities of a relational type has a greatest lower bound in that type.
- **□Boolean Completeness.** Every closed instance of Boolean Completeness is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **No Pure Contingency.** Each closed sentence of the pure language, if true, is necessary. This is a sentence schema, not a quantifier over propositions.
- **Atomlessness.** Atomlessness in the displayed closed propositional formulation.
- **Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **¬ BF.** The Barcan Formula at every type. The predicate formulation closes the formula schema using lambda abstraction.
- **¬ Actuality.** There is a true proposition that entails every true proposition.
- **¬ Atomicity (type t).** Atomicity (type t) in the displayed closed propositional formulation.
- **¬ ND.** Distinct things of any type are necessarily distinct.
- **¬ Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **¬ Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.
- **¬ Independence (signature Σ).** No constant of Sigma is a pure operation applied to other constants: for a closed pure term A and distinct constants c, d_1,…,d_n with n ≥ 0, c differs from A applied to the d’s. With n = 0, no constant denotes a pure entity.
- **¬ Distinctness Maximalism (signature Σ).** The Distinctness Maximalism schema for the fixed nonlogical signature Sigma.

## Construction

A symmetric ideally-full intensional action model over one object, the set of natural numbers. Its arrows are of two disjoint kinds: the surjections for which the distinguished individual is its own only preimage, and the functions that omit the distinguished individual from their range. Its symmetry group is the permutations fixing that individual, which is now a proper subset of the first kind. An arrow's value at the distinguished individual still tells the two kinds apart, but no finite set separates any arrow. The evaluation point is the identity arrow.

Boolean Completeness holds by the draft's main theorem with the distinguished individual as the distinguished set. Two arrows agreeing there lie in the same one of the two classes, and a prescription taken from the two of them extends within that class, by nonzero values in the second case and by surjective nonzero values in the first. One object gives No Pure Contingency and the boxed form.

BF fails at type e by the argument of the previous variant, which goes through verbatim. Actuality and Atomicity fail because the first class of arrows contains non-injective ones, which restores the arguments used for the all-surjections model: given a true proposition pinned down by a finite set containing the distinguished individual and one other, the proposition that a fresh individual is not collapsed with that set is a strictly stronger truth; and the same splitting applied to an arbitrary nonzero proposition rather than a true one gives Atomlessness.

## Notes

The second of the draft's two variants in which BF fails, arranged so that the range deficiency no longer brings Actuality with it. Since Actuality fails, Weak Rigid Comprehension and Rigid Comprehension fail too, which are recorded as derived verdicts. Atomlessness is the Proposition 45 argument for Atomicity read for an arbitrary nonzero proposition, and the failure of ND at type e follows from the non-injective arrows; neither is displayed separately in the draft. The source is a work in progress. Interpretation of Σ, fixed for this record: each relational constant denotes the top element of its type and each individual constant denotes one fixed individual. Under it the signature schemata fail. Let $c\in\Sigma$ have relational type $\tau$, so $c=\top_\tau$ necessarily. Witnessed Possibility fails for the pure formula $x\ne\top_\tau$, witnessed by $\bot_\tau$ but impossible of $c$; Separated Structure fails since $\lambda x\, .\,x$ and $\lambda x\, .\,\top_\tau$ agree on $c$ and differ; Independence (signature Σ) fails since $c$ denotes what the closed pure term $\top_\tau$ denotes; Distinctness Maximalism (signature Σ) fails since $c=\top_\tau$ is a true identity that C(Σ) does not prove. Everything that implies these fails with them.

## Revisions

- **2026-09-22** (Claude Fable 5.1 (Anthropic)) — Fixed an interpretation of Σ (relational constants as top, individual constants as one fixed individual) and recorded the signature schemata it refutes, at Cian Dorr’s request. Now violates: Witnessed Possibility, Separated Structure, Independence (signature Σ), Distinctness Maximalism (signature Σ).
- **2026-09-20** (Claude Fable 5.1 (Anthropic)) — Added both Axioms of Infinity at Cian Dorr's direction. The individuals are the natural numbers and identity at the identity arrow is literal, so no numeral counts them. The propositions that a given individual is fixed by the arrow, one for each individual, are pairwise distinct, symmetric and pinned by that individual, so there are infinitely many propositions. The set of numerals at each type is invariant under every arrow, hence symmetric and pinned by the empty set, so finite cardinality is standard and no finite cardinality holds of the universal property at either type. Now satisfies: Axiom of Infinity (type e), Axiom of Infinity (type t).

## Sources

- **BC does not imply RC** — Cian Dorr, Boolean Completeness does not imply Rigid Comprehension, draft of 30 July 2026, §7.2, p. 22; Proposition 45, p. 22; Remark 38, p. 19.

<p class='cert'>Record: <code>topics/classicism/models/symmetric-range-gap-without-actuality.yaml</code></p>

## Paper references

- **Proof: Boolean Completeness does not imply Rigid Comprehension.** Dorr, Cian. Boolean Completeness does not imply Rigid Comprehension. Unpublished draft in progress, 30 July 2026, 27 pages. All page, proposition and lemma locators for this source refer to that draft. Parts of the draft were drafted with AI assistance; its mathematical claims are attributed to the author. — §7.2, p. 22; Proposition 45, p. 22; Remark 38, p. 19
