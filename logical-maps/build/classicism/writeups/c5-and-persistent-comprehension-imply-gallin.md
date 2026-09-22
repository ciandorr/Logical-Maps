# □ND ∧ Persistent Comprehension ⇒ Gallin Extensional Comprehension

<p class='cert'>Result — Source: Misc.; produced by Claude Opus 5 (Anthropic), 20 September 2026, from a suggestion of Cian Dorr; recorded by Claude Opus 5 (Anthropic), 20 September 2026.</p>

## Premises

- **□ND.** Every closed instance of ND is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **Persistent Comprehension.** Every relation, including a proposition, is coextensive with a persistent one.

## Conclusion

- **Gallin Extensional Comprehension.** Every relation is coextensive with one that is persistent and has a persistent pointwise negation. This is the source’s comparison with Gallin’s different rigidity convention.

## Proof

Let $X$ be given and let $Y$ be a persistent coextension, which Persistent Comprehension supplies. Only persistence of $Y$ is used. What has to be added is that $\neg Y$ is persistent, which is the necessitation of a pointwise implication, so the argument must run at every world; that is what the boxed premise supplies. At any world, take $\bar x$ with $\neg Y[\bar x]$ and suppose $\Diamond Y[\bar x]$. Persistence of $Y$ is itself necessary, so $\Diamond Y[\bar x]$ yields $\Diamond\Box Y[\bar x]$. Boxed ND gives B at every world, and B in the form $\Diamond\Box p\to p$ then yields $Y[\bar x]$, against the assumption. So $\Box\neg Y[\bar x]$, which is persistence of $\neg Y$. Hence $Y$ is Gallin-extensional and coextensive with $X$.

## Notes

Rigid Comprehension implies Persistent Comprehension, so this covers the reading on which rigidity yields Gallin-extensionality. The boxed form of ND is needed rather than the plain form, because persistence of the negation is itself a boxed claim and the argument has to be available at every world. In the other direction the draft's note uses BF, which is doing separate work: it stops a world from having instances that the base world does not supply, and no amount of ND replaces it.

## Sources

- **Dorr 20 Sep** — Cian Dorr, suggestion of 20 September 2026.
- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, §2.1, p. 22 (B); §2.3, n. 37, p. 28.

<p class='cert'>Record: <code>topics/classicism/results/c5-and-persistent-comprehension-imply-gallin.yaml</code></p>

## Paper references

- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §2.1, p. 22; §2.3, n. 37, p. 28. The equivalence of ND with B, and the Gallin convention.
