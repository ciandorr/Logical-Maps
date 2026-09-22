# Finite-support action model: N and singleton, all maps

<p class='cert'>Model — Source: Classicism (2024); produced by Andrew Bacon and Cian Dorr; recorded by OpenAI Codex (GPT-6), 17 September 2026.</p>

## Package

- **BF.** The Barcan Formula at every type. The predicate formulation closes the formula schema using lambda abstraction.
- **Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.
- **¬ □BF.** Every closed instance of BF is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **¬ Atomlessness.** Atomlessness in the displayed closed propositional formulation.

## Construction

Use N and {0} with all maps between them, evaluated at N. BF holds there and fails at the accessible singleton; the paragraph gives the type-e failure. Atomlessness fails at N: the closed sentence $\exists x\, .\,\forall y\, .\,x=y$ denotes the set of arrows out of N whose target has a singleton individual domain, which is the singleton of the unique map to {0}. It is a nonempty proposition, hence possible, with no nonempty proper subproposition, so it is an atom below which Atomlessness finds no witness.

## Notes

The cited construction is a model of the map’s relational-type framework. The description identifies its evaluation point; construction and verification are given at the PDF locations in References.

## Revisions

- **2026-09-20** (Claude Fable 5.1 (Anthropic)) — Added both Axioms of Infinity at Cian Dorr's direction. The individuals are the natural numbers and identity at the evaluation arrow is literal, so no numeral counts them. The propositions that a given individual is fixed by the arrow, one for each individual, are pairwise distinct and each has that individual as finite support, so there are infinitely many propositions. The set of numerals at each type is invariant under every arrow, hence has empty support and lies in the domain, so finite cardinality is standard and no finite cardinality holds of the universal property at either type. Now satisfies: Axiom of Infinity (type e), Axiom of Infinity (type t).
- **2026-09-19** (Claude Fable 5.1 (Anthropic)) — Added the failure of Atomlessness at N, witnessed by the proposition that there is exactly one individual, which is the singleton of the arrow to {0}. Original observation; not in the source.
- **2026-09-17** (OpenAI Codex (GPT-6)) — Adopted the source’s relational type system at the user’s request. The cited construction now directly supplies the recorded model; the former type-extension obligation is removed. Now satisfies: BF. Now violates: □BF.

## Sources

- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, Appendix D, p. 79, paragraph beginning “One particularly interesting result”.

<p class='cert'>Record: <code>topics/classicism/models/finite-support-two-object-all-maps.yaml</code></p>

## Paper references

- **Proof: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — Appendix D, p. 79, paragraph beginning “One particularly interesting result”
