# Atomlessness ⇒ Infinity Schema (type t)

<p class='cert'>Result — Source: Misc.; produced by Cian Dorr, suggestion of 19 September 2026; recorded by Claude Opus 5 (Anthropic), 19 September 2026.</p>

## Premises

- **Atomlessness.** Atomlessness in the displayed closed propositional formulation.

## Conclusion

- **Infinity Schema (type t).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.

## Proof

In C the top and bottom propositions differ, so $\Diamond\top$. Atomlessness applied to $\top$ gives a possible $q_1$ with $q_1\le\top$ and $q_1\ne\top$; applied to $q_1$ it gives a possible $q_2$ strictly below $q_1$, and so on. After $n$ steps the chain $\top,q_1,\ldots,q_n$ descends strictly in the algebraic order, and a strictly descending chain in a partial order has pairwise distinct members. For if $q_i=q_j$ with $i<j$ then $q_i\le q_{i+1}$, since $q_j\le q_{i+1}$, while $q_{i+1}\le q_i$, so antisymmetry gives $q_{i+1}=q_i$, against the choice of $q_{i+1}$. Each instance of the Infinity schema therefore needs only finitely many applications of the single Atomlessness sentence.

## Notes

Only the type-$t$ Infinity follows. Atomlessness constrains propositions, so it says nothing about how many individuals there are.

## Sources

- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, Appendix D, p. 76 (Atomlessness); §2.3, n. 47, p. 32 (Infinity).

<p class='cert'>Record: <code>topics/classicism/results/atomlessness-implies-infinity-t.yaml</code></p>

## Paper references

- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — Appendix D, p. 76; §2.3, n. 47, p. 32. Formulations of the two principles. The draft does not draw the connection between them.
