# Possibly Witnessed Possibility ⇒ Separated Structure

<p class='cert'>Result — Source: Misc.; produced by Cian Dorr, suggestion of 22 September 2026; proof written out by Claude Fable 5.1 (Anthropic), 22 September 2026; recorded by Claude Fable 5.1 (Anthropic), 22 September 2026.</p>

## Premises

- **Possibly Witnessed Possibility.** For pure formulas P with free variables among a finite tuple x and distinct matching constants c, a possible witness to P entails that P at those constants is possible. Equivalently, P necessary at the constants is necessary universally.

## Conclusion

- **Separated Structure.** For each typed nonlogical constant c and closed same-typed terms F,G not containing c, equality after application to c implies equality of F and G.

## Proof

It suffices to prove $F\bar c=G\bar c\to F=G$ for closed pure $F,G$ of a type $\bar\sigma\tau$ and distinct constants $\bar c$; Separated Structure follows by abstracting the other constants, as in the recorded proof from Quantified Separated Structure. Let $H:=\lambda\bar x\, .\,(F\bar x=G\bar x)$, closed and pure. If $F\bar c=G\bar c$ then NI gives $\Box(F\bar c=G\bar c)$, i.e. $\Box H\bar c$ by $\beta$. The contrapositive form of Possibly Witnessed Possibility, $\Box P[\bar c/\bar x]\to\Box\forall\bar x\, .\,P$ with $P:=(F\bar x=G\bar x)$, gives $\Box\forall\bar x\, .\,F\bar x=G\bar x$, and Modalized Functionality at the relevant arity, a theorem of C, gives $F=G$.

## Notes

With the converse record this makes Separated Structure equivalent to a principle stated purely in terms of possibility at the constants.

## Sources

- **Dorr 22 Sep** — Cian Dorr, suggestion of 22 September 2026; proof as recorded.
- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, §2.5, pp. 38–39 and n. 57.

<p class='cert'>Record: <code>topics/classicism/results/possibly-witnessed-possibility-r-implies-separated-structure-r.yaml</code></p>

## Paper references

- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §2.5, pp. 38–39 and n. 57
- **Background: Logical Combinatorialism.** Bacon, Andrew (2020). Logical Combinatorialism. Philosophical Review 129(4), 537–589. As cited in Classicism, §§2.5 and 3.5. Read directly for the import of 22 September 2026; section, footnote and page locators refer to the published pagination. — §4, pp. 561–562
