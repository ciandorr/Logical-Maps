# Separated Structure ⇒ General Separated Structure

<p class='cert'>Result — Source: Misc.; produced by Claude Fable 5.1 (Anthropic), 22 September 2026; recorded by Claude Fable 5.1 (Anthropic), 22 September 2026.</p>

## Premises

- **Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.

## Conclusion

- **General Separated Structure.** Let a_1…a_n and b_1…b_m be constants of Sigma, possibly with repetitions, none occurring in the closed terms F and G, and let pi be a bijection from variables x_1…x_k to the distinct constants among them. If F applied to the a’s equals G applied to the b’s, then abstracting the constants yields identical pure-position operations.

## Proof

Let $c_1,\ldots,c_k$ be the distinct constants among $a_1\ldots a_n,b_1\ldots b_m$, none occurring in $F$ or $G$, with $\pi x_j=c_j$. Put $F^{\prime}:=\lambda x_1\ldots x_k\, .\,F(\pi a_1)\cdots(\pi a_n)$ and $G^{\prime}:=\lambda x_1\ldots x_k\, .\,G(\pi b_1)\cdots(\pi b_m)$. Neither contains any $c_j$, and by $\beta$, $F^{\prime}c_1\cdots c_k=Fa_1\cdots a_n$ and $G^{\prime}c_1\cdots c_k=Gb_1\cdots b_m$. Assume the antecedent. Then $(F^{\prime}c_1\cdots c_{k-1})c_k=(G^{\prime}c_1\cdots c_{k-1})c_k$ and $c_k$ does not occur in the two applied terms, so Separated Structure gives $F^{\prime}c_1\cdots c_{k-1}=G^{\prime}c_1\cdots c_{k-1}$. After $k$ such steps, $F^{\prime}=G^{\prime}$, which is the consequent. If $k=0$ the schema is trivial.

## Notes

Bacon derives General Separated Structure from Logical Necessity; this record shows that Separated Structure alone suffices, so the two structure schemata are equivalent in C.

## Sources

- **Logical Combinatorialism** — Andrew Bacon, Logical Combinatorialism, Philosophical Review 129 (2020), §4, p. 565.

<p class='cert'>Record: <code>topics/classicism/results/separated-structure-r-implies-general-separated-structure-r.yaml</code></p>

## Paper references

- **Origin: Logical Combinatorialism.** Bacon, Andrew (2020). Logical Combinatorialism. Philosophical Review 129(4), 537–589. As cited in Classicism, §§2.5 and 3.5. Read directly for the import of 22 September 2026; section, footnote and page locators refer to the published pagination. — §4, p. 565. General Separated Structure, derived there from Logical Necessity.
- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §2.5, p. 39. The iterated form of Separated Structure for a tuple of distinct constants, said to follow by an obvious induction.
