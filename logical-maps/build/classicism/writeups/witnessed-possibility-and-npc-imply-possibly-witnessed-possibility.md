# Witnessed Possibility ∧ No Pure Contingency ⇒ Possibly Witnessed Possibility

<p class='cert'>Result — Source: Misc.; produced by Cian Dorr, suggestion of 22 September 2026; proof written out by Claude Fable 5.1 (Anthropic), 22 September 2026; recorded by Claude Fable 5.1 (Anthropic), 22 September 2026.</p>

## Premises

- **Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.
- **No Pure Contingency.** Each closed sentence of the pure language, if true, is necessary. This is a sentence schema, not a quantifier over propositions.

## Conclusion

- **Possibly Witnessed Possibility.** For pure formulas P with free variables among a finite tuple x and distinct matching constants c, a possible witness to P entails that P at those constants is possible. Equivalently, P necessary at the constants is necessary universally.

## Proof

$\neg\exists\bar x\, .\,P$ is a closed pure sentence, so No Pure Contingency gives $\neg\exists\bar x\, .\,P\to\Box\neg\exists\bar x\, .\,P$; contraposing, $\Diamond\exists\bar x\, .\,P\to\exists\bar x\, .\,P$. Witnessed Possibility then gives $\Diamond P[\bar c/\bar x]$.

## Notes

Together with the other records this yields Logical Necessity ⇔ Separated Structure + No Pure Contingency, the observation Classicism makes in a footnote that did not survive into the published version.

## Sources

- **Dorr 22 Sep** — Cian Dorr, suggestion of 22 September 2026; proof as recorded.
- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, §2.5, pp. 38–39 and n. 57.

<p class='cert'>Record: <code>topics/classicism/results/witnessed-possibility-and-npc-imply-possibly-witnessed-possibility.yaml</code></p>

## Paper references

- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §2.5, pp. 38–39 and n. 57
- **Background: Logical Combinatorialism.** Bacon, Andrew (2020). Logical Combinatorialism. Philosophical Review 129(4), 537–589. As cited in Classicism, §§2.5 and 3.5. Read directly for the import of 22 September 2026; section, footnote and page locators refer to the published pagination. — §4, pp. 561–562
