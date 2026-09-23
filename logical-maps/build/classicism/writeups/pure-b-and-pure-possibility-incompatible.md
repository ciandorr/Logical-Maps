# B for pure sentences ∧ Possibility (pure) ⇒ False (⊥)

<p class='cert'>Result — Source: Philosophical Introduction to HOL (2024); produced by Andrew Bacon; set as Exercise 8.19, solution written out by Claude Fable 5.1 (Anthropic), 22 September 2026; recorded by Claude Fable 5.1 (Anthropic), 22 September 2026.</p>

## Premises

- **B for pure sentences.** The B instance for every closed sentence in the pure language.
- **Possibility (pure).** Every closed pure sentence consistent with C is possible.

## Conclusion

- **False (⊥).** These premises cannot all hold together.

## Proof

Let $F$ be the Fregean Axiom, a closed pure sentence. Both $F$ and $\neg F$ are consistent with C (a two-valued Henkin model and the two-element-group model), so Possibility (pure) gives $\Diamond F$ and $\Diamond\neg F$. In C, $\Box(F\to\Box F)$: the Fregean Axiom, if true, makes every truth identical to $\top$, and this reasoning is a theorem, so it holds necessarily. If $F$ then $\Box F$, contradicting $\Diamond\neg F$. If $\neg F$, B for the pure sentence $\neg F$ gives $\Box\Diamond\neg F$; but at the possibility where $F$ holds, $\Box F$ holds, so $\neg\Diamond\neg F$ holds there, a contradiction.

## Notes

Sharpens the recorded incompatibility of Possibility (pure) with No Pure Contingency and with ND: even B restricted to pure sentences is excluded.

## Sources

- **Philosophical Introduction to HOL** — Andrew Bacon, A Philosophical Introduction to Higher-Order Logics, Routledge, 2024, §8.3, Exercise 8.19, p. 172.
- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, §3.5, n. 81, p. 59.

<p class='cert'>Record: <code>topics/classicism/results/pure-b-and-pure-possibility-incompatible.yaml</code></p>

## Paper references

- **Proof: A Philosophical Introduction to Higher-Order Logics.** Bacon, Andrew (2024). A Philosophical Introduction to Higher-Order Logics. Routledge. DOI 10.4324/9781003039181. Chapter 8, Application: Consequences and strengthenings of Classicism, pp. 155–182, and Chapter 18, The model theory of classicism, pp. 389–413, were read directly on 22 September 2026; locators give the book's own page numbers. The book works in the full simple type hierarchy with Modalized Functionality at all types; its results are taken in the map's relational type system, of which its models are models. — §8.3, Exercise 8.19, p. 172. Set as an exercise: prove □(F → □F) and derive a contradiction with B from the broad contingency of the Fregean Axiom.
- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §3.5, n. 81, p. 59
