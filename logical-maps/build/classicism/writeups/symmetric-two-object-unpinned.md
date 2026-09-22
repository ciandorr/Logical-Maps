# Symmetric ideally-full model: two objects, the second unpinned

<p class='cert'>Model — Source: BC does not imply RC (draft); produced by Cian Dorr; recorded by Claude Opus 5 (Anthropic), 19 September 2026.</p>

## Package

- **□Boolean Completeness.** Every closed instance of Boolean Completeness is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **□Actuality.** Every closed instance of Actuality is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **¬ Rigid Comprehension.** Every relation, including a proposition, is coextensive with a rigid one.
- **¬ □BF.** Every closed instance of BF is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **¬ No Pure Contingency.** Each closed sentence of the pure language, if true, is necessary. This is a sentence schema, not a quantifier over propositions.
- **¬ ND.** Distinct things of any type are necessarily distinct.

## Construction

A symmetric ideally-full intensional action model over two objects, each a copy of the natural numbers. The arrows from the first object to itself are the permutations; the arrows from the first to the second and from the second to itself are all the functions; there are none back. Both symmetry groups are all the permutations. The first object carries the ideal of finite sets, the second the improper ideal, so at the second object every symmetric intension belongs to the domain. The evaluation point is the identity arrow on the first object.

Actuality holds at both objects, and hence necessarily: at each, the orbit of the identity under the symmetry group is the smallest symmetric set of arrows containing it, and it is in the domain, at the first object because it is pinned down by the empty set and at the second because nothing is required there. Boolean Completeness holds at both, and hence necessarily: at the first by the draft's main theorem with the empty distinguished set, since an arrow to the first object is automatically a permutation and so separated, while for arrows to the second splicing is unconstrained; at the second trivially, since its domains are closed under arbitrary unions.

Rigid Comprehension fails: no rigid property of individuals is coextensive with the universal one. Weak persistence together with finite pinning forces any candidate to contain every pair whose arrow targets the second object, so its transport there is the top property. But the property of being in the range of one's arrow is symmetric and persistent, its extension at that world is everything, and the top property does not entail it, because the arrows out of the second object include non-surjections. So the rigidity criterion fails at that world.

## Notes

The point of the model is that boxed Boolean Completeness and boxed Actuality, and so Weak Rigid Comprehension, do not yield Rigid Comprehension. The gap is exactly the leading box of the inextensibility conjunct. The draft records that the type-e instance of BF is true at the base world and false at the second object, so BF is true while boxed BF is false; that is what the violation of boxed BF records, and it also refutes No Pure Contingency, since that instance is a closed pure sentence true at the base and false at an accessible world. The status of the unboxed BF schema at the base world is left unknown here: the draft's working comments report that higher-type instances fail there, which would make the schema fail, but its text does not. ND fails at type e because some arrow to the second object collapses two individuals. The source is a work in progress.

## Revisions

- **2026-09-20** (Claude Fable 5.1 (Anthropic)) — Added both Axioms of Infinity at Cian Dorr's direction. The individuals are the natural numbers and identity at the identity arrow is literal, so no numeral counts them. The propositions that a given individual is fixed by the arrow, one for each individual, are pairwise distinct, symmetric and pinned by that individual, so there are infinitely many propositions. The set of numerals at each type is invariant under every arrow, hence symmetric and pinned by the empty set, so finite cardinality is standard and no finite cardinality holds of the universal property at either type. Now satisfies: Axiom of Infinity (type e), Axiom of Infinity (type t).

## Sources

- **BC does not imply RC** — Cian Dorr, Boolean Completeness does not imply Rigid Comprehension, draft of 30 July 2026, Definition 39, p. 19; Proposition 40 and Proposition 41, p. 20; Remark 42, p. 21.

<p class='cert'>Record: <code>topics/classicism/models/symmetric-two-object-unpinned.yaml</code></p>

## Paper references

- **Proof: Boolean Completeness does not imply Rigid Comprehension.** Dorr, Cian. Boolean Completeness does not imply Rigid Comprehension. Unpublished draft in progress, 30 July 2026, 27 pages. All page, proposition and lemma locators for this source refer to that draft. Parts of the draft were drafted with AI assistance; its mathematical claims are attributed to the author. — Definition 39, p. 19; Proposition 40 and Proposition 41, p. 20; Remark 42, p. 21
- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — Appendix D, pp. 73–79. The per-object ideals that this construction uses, and the two-object models built on them.
