# Symmetric ideally-full model: qualitative link structure (Base 3)

<p class='cert'>Model — Source: BC does not imply RC (draft); produced by Cian Dorr; recorded by Claude Opus 5 (Anthropic), 19 September 2026.</p>

## Package

- **Boolean Completeness.** Every property of entities of a relational type has a greatest lower bound in that type.
- **□Boolean Completeness.** Every closed instance of Boolean Completeness is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **Actuality.** There is a true proposition that entails every true proposition.
- **□Actuality.** Every closed instance of Actuality is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **No Pure Contingency.** Each closed sentence of the pure language, if true, is necessary. This is a sentence schema, not a quantifier over propositions.
- **Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **¬ Rigid Comprehension.** Every relation, including a proposition, is coextensive with a rigid one.
- **¬ ND.** Distinct things of any type are necessarily distinct.

## Construction

A symmetric ideally-full intensional action model over one object whose individuals carry qualitative structure. The domain is the disjoint union of points, of two companions for each point, and of infinitely many links for each ordered pair of distinct points. A ternary relation holds of two points and a third individual when that individual is a link over the two if they differ, and a companion of them if they coincide, so the relation's fibres are infinite over distinct points and of size two over a repeated point. The arrows are required to preserve that relation. The symmetry group is the relation-preserving permutations that fix a distinguished pair of points setwise, and the remaining arrows are the surjective relation-preserving maps that collapse that pair. The evaluation point is the identity arrow.

Actuality holds, and necessarily, since membership in the symmetry group is again the condition that the distinguished pair is not collapsed, so the group is pinned down by that pair. The type-e instance of BF holds, and necessarily, since every arrow is surjective, so a property necessarily had by everything is the top property. Boolean Completeness holds, and necessarily, by the draft's main theorem in its closure-operation form: the constant closure operations do not work here, and the operation used instead adds to a finite set the point coordinates of its members and then both companions of each of its points.

Rigid Comprehension fails at type e. The property of being related to the distinguished pair is persistent and finitely pinned, and it is shown to be the only candidate coextensive with itself. But at a world collapsing the pair, its extension shrinks to a two-element fibre, and the union of the two haecceities of that fibre is persistent with the same extension there while being strictly stronger, because some arrow merges the two companions. So the rigidity criterion fails at that world.

## Notes

This is the draft's answer to the question its two-object model leaves open. Boxed Boolean Completeness, boxed Actuality and the boxed type-e instance of BF all hold, and Rigid Comprehension still fails, so the obstruction need not live at a world where BF fails; it can live inside a qualitative fibre that BF at type e cannot see. The map has no separate principle for the type-e instance of BF, and the draft leaves the higher-type instances unchecked, so the BF schema is recorded as unknown here. The draft also asserts that Atomicity fails, as in the collapse-pair model, but does not write the argument out, so that too is left unknown; note that the recorded implication from boxed Atomicity, Boolean Completeness and BF to Rigid Comprehension means one of those two unknowns has to come out negative. ND fails at type e because the collapsing arrows are arrows. The source is a work in progress, and its own status note describes this section as exploratory though complete for the claims recorded here.

## Revisions

- **2026-09-20** (Claude Fable 5.1 (Anthropic)) — Added both Axioms of Infinity at Cian Dorr's direction. The individuals are the natural numbers and identity at the identity arrow is literal, so no numeral counts them. The propositions that a given individual is fixed by the arrow, one for each individual, are pairwise distinct, symmetric and pinned by that individual, so there are infinitely many propositions. The set of numerals at each type is invariant under every arrow, hence symmetric and pinned by the empty set, so finite cardinality is standard and no finite cardinality holds of the universal property at either type. Now satisfies: Axiom of Infinity (type e), Axiom of Infinity (type t).

## Sources

- **BC does not imply RC** — Cian Dorr, Boolean Completeness does not imply Rigid Comprehension, draft of 30 July 2026, §8, pp. 23–26; Definition 47 and Lemma 48, p. 24; Proposition 49, p. 25; Proposition 50, p. 26.

<p class='cert'>Record: <code>topics/classicism/models/symmetric-qualitative-links.yaml</code></p>

## Paper references

- **Proof: Boolean Completeness does not imply Rigid Comprehension.** Dorr, Cian. Boolean Completeness does not imply Rigid Comprehension. Unpublished draft in progress, 30 July 2026, 27 pages. All page, proposition and lemma locators for this source refer to that draft. Parts of the draft were drafted with AI assistance; its mathematical claims are attributed to the author. — §8, pp. 23–26; Definition 47 and Lemma 48, p. 24; Proposition 49, p. 25; Proposition 50, p. 26
