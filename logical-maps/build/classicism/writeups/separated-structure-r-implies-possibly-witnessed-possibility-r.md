# Separated Structure ⇒ Possibly Witnessed Possibility

<p class='cert'>Result — Source: Misc.; produced by Cian Dorr, suggestion of 22 September 2026; proof written out by Claude Fable 5.1 (Anthropic), 22 September 2026; recorded by Claude Fable 5.1 (Anthropic), 22 September 2026.</p>

## Premises

- **Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.

## Conclusion

- **Possibly Witnessed Possibility.** For pure formulas P with free variables among a finite tuple x and distinct matching constants c, a possible witness to P entails that P at those constants is possible. Equivalently, P necessary at the constants is necessary universally.

## Proof

Iterating Separated Structure, as in the recorded proof of General Separated Structure, gives $F\bar c=G\bar c\to F=G$ for closed pure $F,G$ and distinct constants $\bar c$. Let $P$ be pure with free variables among $\bar x$ and put $F:=\lambda\bar x\, .\,\neg P$, $G:=\lambda\bar x\, .\,\top$, both closed and pure. Suppose $\Box\neg P[\bar c/\bar x]$, that is $\neg P[\bar c/\bar x]=\top$. By $\beta$, $F\bar c=\top=G\bar c$, so $F=G$. By NI, $\Box(F=\lambda\bar x\, .\,\top)$, and $F=\lambda\bar x\, .\,\top\to\forall\bar x\, .\,F\bar x$ is a theorem, so K gives $\Box\forall\bar x\, .\,\neg P$. Contraposing, $\Diamond\exists\bar x\, .\,P\to\Diamond P[\bar c/\bar x]$.

## Sources

- **Dorr 22 Sep** — Cian Dorr, suggestion of 22 September 2026; proof as recorded.
- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, §2.5, pp. 38–39 and n. 57.

<p class='cert'>Record: <code>topics/classicism/results/separated-structure-r-implies-possibly-witnessed-possibility-r.yaml</code></p>

## Paper references

- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §2.5, pp. 38–39 and n. 57
- **Background: Logical Combinatorialism.** Bacon, Andrew (2020). Logical Combinatorialism. Philosophical Review 129(4), 537–589. As cited in Classicism, §§2.5 and 3.5. Read directly for the import of 22 September 2026; section, footnote and page locators refer to the published pagination. — §4, pp. 561–562
