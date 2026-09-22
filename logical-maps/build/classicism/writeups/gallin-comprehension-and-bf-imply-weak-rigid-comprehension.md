# Gallin Extensional Comprehension ∧ BF ⇒ Weak Rigid Comprehension

<p class='cert'>Result — Source: Misc.; produced by Cian Dorr, suggestion of 20 September 2026; proof by Claude Fable 5.1 (Anthropic), 20 September 2026; recorded by Claude Fable 5.1 (Anthropic), 20 September 2026.</p>

## Premises

- **Gallin Extensional Comprehension.** Every relation is coextensive with one that is persistent and has a persistent pointwise negation. This is the source’s comparison with Gallin’s different rigidity convention.
- **BF.** The Barcan Formula at every type. The predicate formulation closes the formula schema using lambda abstraction.

## Conclusion

- **Weak Rigid Comprehension.** Every relation, including a proposition, is coextensive with a weakly rigid one, that is, with one that is persistent and weakly inextensible.

## Proof

Let $X$ be given and let $Y$ be the coextension that Gallin Extensional Comprehension supplies, with $Y$ and $\neg Y$ persistent. Persistence of $Y$ is the first conjunct of weak rigidity. For weak inextensibility, let $Z$ satisfy $\forall\bar x\, .\,Y[\bar x]\to\Box Z[\bar x]$. For any $\bar x$, either $Y[\bar x]$, and then $\Box Z[\bar x]$, or $\neg Y[\bar x]$, and then $\Box\neg Y[\bar x]$ by persistence of $\neg Y$ (with T); in both cases $\Box(Y[\bar x]\to Z[\bar x])$ by K. So $\forall\bar x\, .\,\Box(Y[\bar x]\to Z[\bar x])$, and BF, applied to the abstract $\lambda\bar x\, .\,Y[\bar x]\to Z[\bar x]$ one argument at a time, gives $\Box\forall\bar x\, .\,Y[\bar x]\to Z[\bar x]$, which is $Y\le Z$. Hence $Y$ is weakly rigid and coextensive with $X$.

## Notes

The direct argument, using BF once and at the world of evaluation. The claim strengthens: the same witness is fully rigid, since Gallin Extensional Comprehension gives ND, ND with BF gives □ND, □ND gives □BF, and with BF at every world the same argument runs inside the box of inextensibility; that is the recorded gallin-comprehension-and-bf-imply-rigid-comprehension, of which this record is therefore a consequence. It is kept because it isolates what BF at the evaluation world alone buys.

## Sources

- **Dorr 20 Sep** — Cian Dorr, suggestion of 20 September 2026.
- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, §2.3, n. 37, p. 28.
- **BC does not imply RC (draft)** — Cian Dorr, Boolean Completeness does not imply Rigid Comprehension, draft of 30 July 2026, pp. 2 and 12 (weak rigidity).

<p class='cert'>Record: <code>topics/classicism/results/gallin-comprehension-and-bf-imply-weak-rigid-comprehension.yaml</code></p>

## Paper references

- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §2.3, n. 37, p. 28. The source's note states that under BF a relation persistent together with its negation is inextensible; this record is the part of that argument that uses BF at the world of evaluation only.
