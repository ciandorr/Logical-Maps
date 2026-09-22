# Symmetric ideally-full model: arrows omitting a fixed individual

<p class='cert'>Model — Source: BC does not imply RC (draft); produced by Cian Dorr; recorded by Claude Opus 5 (Anthropic), 19 September 2026.</p>

## Package

- **Boolean Completeness.** Every property of entities of a relational type has a greatest lower bound in that type.
- **□Boolean Completeness.** Every closed instance of Boolean Completeness is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **Actuality.** There is a true proposition that entails every true proposition.
- **□Actuality.** Every closed instance of Actuality is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **No Pure Contingency.** Each closed sentence of the pure language, if true, is necessary. This is a sentence schema, not a quantifier over propositions.
- **Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **¬ BF.** The Barcan Formula at every type. The predicate formulation closes the formula schema using lambda abstraction.
- **¬ ND.** Distinct things of any type are necessarily distinct.

## Construction

A symmetric ideally-full intensional action model over one object, the set of natural numbers. Its symmetry group is the permutations fixing a distinguished individual, and its arrows are those permutations together with all the functions that omit the distinguished individual from their range. The two classes are told apart by an arrow's value at that individual, so the symmetry group is a finitely pinned proposition and Actuality holds. The evaluation point is the identity arrow.

Boolean Completeness holds by the draft's main theorem with the distinguished individual as the distinguished set. Moving points off a finite set can be done by a permutation fixing that individual, and two arrows agreeing there are either both permutations or both range-deficient, so a prescription taken from the two of them extends by nonzero values to an arrow of the same kind. One object gives No Pure Contingency and the boxed forms.

BF fails at type e. Take the property of being positive unless things are as they actually are, which is pinned down by the distinguished individual and is symmetric. Every individual necessarily has it, since an arrow either fixes the distinguished individual or omits it from its range and so sends everything to something positive; but it is not necessary that everything has it, since any arrow moving the distinguished individual leaves it out.

## Notes

The first of the draft's two variants in which BF is made to fail. Actuality and the range deficiency come from the same finite test here, which is what the next variant prises apart. Atomicity and Rigid Comprehension are not settled in the draft and are left unknown. ND fails at type e because the range-deficient arrows include non-injective ones; the draft does not draw that consequence separately. The source is a work in progress.

## Revisions

- **2026-09-20** (Claude Fable 5.1 (Anthropic)) — Added both Axioms of Infinity at Cian Dorr's direction. The individuals are the natural numbers and identity at the identity arrow is literal, so no numeral counts them. The propositions that a given individual is fixed by the arrow, one for each individual, are pairwise distinct, symmetric and pinned by that individual, so there are infinitely many propositions. The set of numerals at each type is invariant under every arrow, hence symmetric and pinned by the empty set, so finite cardinality is standard and no finite cardinality holds of the universal property at either type. Now satisfies: Axiom of Infinity (type e), Axiom of Infinity (type t).

## Sources

- **BC does not imply RC** — Cian Dorr, Boolean Completeness does not imply Rigid Comprehension, draft of 30 July 2026, §7.1, p. 21; Proposition 43 and Proposition 44, p. 22; Lemma 21, p. 10; Remark 38, p. 19.

<p class='cert'>Record: <code>topics/classicism/models/symmetric-range-gap.yaml</code></p>

## Paper references

- **Proof: Boolean Completeness does not imply Rigid Comprehension.** Dorr, Cian. Boolean Completeness does not imply Rigid Comprehension. Unpublished draft in progress, 30 July 2026, 27 pages. All page, proposition and lemma locators for this source refer to that draft. Parts of the draft were drafted with AI assistance; its mathematical claims are attributed to the author. — §7.1, p. 21; Proposition 43 and Proposition 44, p. 22; Lemma 21, p. 10; Remark 38, p. 19
