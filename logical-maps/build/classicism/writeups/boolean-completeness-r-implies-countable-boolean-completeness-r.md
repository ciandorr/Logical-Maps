# Boolean Completeness ⇒ Countable Boolean Completeness

<p class='cert'>Result — Source: Arithmetic is Necessary (2024 draft); produced by Zachary Goodsell; recorded by Claude Fable 5.1 (Anthropic), 20 September 2026.</p>

## Premises

- **Boolean Completeness.** Every property of entities of a relational type has a greatest lower bound in that type.

## Conclusion

- **Countable Boolean Completeness.** Every countable property of entities of a relational type has a least upper bound in that type, where a property is countable when it injects into the natural numbers.

## Proof

Countable Boolean Completeness is the restriction of Boolean Completeness to countable properties. The map's Boolean Completeness supplies greatest lower bounds; the least upper bound of $X$ is the pointwise negation of the greatest lower bound of $\lambda y\, .\,X(\neg y)$, by the Boolean laws that Logical Equivalence makes identities, so every property, countable or not, has a least upper bound.

## Notes

The source presents the restriction as immediate. The converse is not expected; the source uses only the countable case.

## Sources

- **Arithmetic is Necessary** — Zachary Goodsell, Arithmetic is Necessary, draft of 5 June 2024, §3.1, p. 8.
- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, §2.2, pp. 23–24.

<p class='cert'>Record: <code>topics/classicism/results/boolean-completeness-r-implies-countable-boolean-completeness-r.yaml</code></p>

## Paper references

- **Formulation: Arithmetic is Necessary.** Goodsell, Zachary William Lee. Arithmetic is Necessary. Draft dated 5 June 2024, 28 pages. Derives the necessity of arithmetic in the logic HKC (H plus K plus Countable Boolean Completeness) and shows that Boolean Completeness is inconsistent with the maximalization of any recursively enumerable extension of HK consistent with I, answering the question of Classicism, §2.6. Locators refer to this draft. — §3.1, p. 8
- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §2.2, pp. 23–24. The greatest-lower-bound formulation and its dual.
