# Very Weak Rigid Comprehension ⇒ Weak Rigid Comprehension

<p class='cert'>Result — Source: Misc.; produced by Cian Dorr, suggestion of 19 September 2026; recorded by Claude Opus 5 (Anthropic), 19 September 2026.</p>

## Premises

- **Very Weak Rigid Comprehension.** Every relation, including a proposition, is coextensive with a very weakly rigid one, that is, with one that is weakly persistent and weakly inextensible.

## Conclusion

- **Weak Rigid Comprehension.** Every relation, including a proposition, is coextensive with a weakly rigid one, that is, with one that is persistent and weakly inextensible.

## Proof

Let $Y$ be very weakly rigid and coextensive with $X$, and put $Y':=\lambda\bar z\, .\,\Box Y[\bar z]$.

Coextensiveness. $\Box Y[\bar u]\to Y[\bar u]$ by T, and $Y[\bar u]\to\Box Y[\bar u]$ is $\operatorname{WeaklyPersistent}(Y)$. So $Y'$ is coextensive with $Y$, hence with $X$.

Persistence. $Y'\le\lambda\bar z\, .\,\Box Y'[\bar z]$ is $\Box\forall\bar z\, .\,\Box Y[\bar z]\to\Box\Box Y[\bar z]$, the necessitation of the 4 axiom, which is a theorem of C.

Weak inextensibility. Suppose $\forall\bar z\, .\,Y'[\bar z]\to\Box Z[\bar z]$. Weak persistence gives $\forall\bar z\, .\,Y[\bar z]\to Y'[\bar z]$, so $\forall\bar z\, .\,Y[\bar z]\to\Box Z[\bar z]$, and $\operatorname{WeaklyInextensible}(Y)$ gives $Y\le Z$. Also $Y'\le Y$, since that is the necessitation of T. So $Y'\le Z$ by transitivity.

Hence $Y'$ is weakly rigid and coextensive with $X$.

## Notes

With the converse this makes the two principles equivalent, although very weak rigidity is strictly weaker than weak rigidity as a condition on a given relation, since nothing stops a very weakly rigid relation from being only contingently so.

## Sources

- **Dorr 19 Sep** — Cian Dorr, suggestion of 19 September 2026.

<p class='cert'>Record: <code>topics/classicism/results/very-weak-rigid-comprehension-r-implies-weak-rigid-comprehension-r.yaml</code></p>

## Paper references

- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §1.5, pp. 16–19. T and 4 for the fixed background modality; both are recorded as background consequences.
