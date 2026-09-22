# Boolean Completeness ∧ Actuality ⇒ Weak Rigid Comprehension

<p class='cert'>Result — Source: BC does not imply RC (draft); produced by Cian Dorr; recorded by Claude Opus 5 (Anthropic), 19 September 2026.</p>

## Premises

- **Boolean Completeness.** Every property of entities of a relational type has a greatest lower bound in that type.
- **Actuality.** There is a true proposition that entails every true proposition.

## Conclusion

- **Weak Rigid Comprehension.** Every relation, including a proposition, is coextensive with a weakly rigid one, that is, with one that is persistent and weakly inextensible.

## Proof

Fix a relational type $\tau=\bar\sigma t$ and $X^\tau$. Write $\operatorname{Haec}_{\bar u}:=\lambda\bar z\, .\,\bigwedge_i z_i=u_i$ and put $H:=\lambda Z^\tau\, .\,\exists\bar y\, .\,X[\bar y]\land Z=\operatorname{Haec}_{\bar y}$, the property of being the haecceity of some $X$ things. By Boolean Completeness in its least-upper-bound form, let $Y$ be a least upper bound of $H$. Two observations do the work. (i) If $X[\bar u]$ then $\operatorname{Haec}_{\bar u}\le_\tau Y$, and instantiating at $\bar u$ with $\bar u=\bar u$ gives $\Box Y[\bar u]$. (ii) If $\Box Z[\bar u]$ whenever $X[\bar u]$, then $\operatorname{Haec}_{\bar u}\le_\tau Z$ for each such $\bar u$, so $Z$ is an upper bound of $H$ and $Y\le_\tau Z$.

Coextensiveness. $X[\bar u]\to Y[\bar u]$ by (i). Conversely, let $w$ witness Actuality and put $P:=\lambda\bar z\, .\,(w\le X[\bar z])$. If $X[\bar u]$ then $X[\bar u]$ is true, so $w\le X[\bar u]$; a true entailment is necessary, so $\Box P[\bar u]$. By (ii), $Y\le_\tau P$, so $Y[\bar u]\to w\le X[\bar u]$; and $w$ is true, so $Y[\bar u]\to X[\bar u]$.

Persistence. Take $Z:=\lambda\bar z\, .\,\Box Y[\bar z]$ in (ii). If $X[\bar u]$ then $\Box Y[\bar u]$ by (i), hence $\Box Z[\bar u]$ by 4. So $Y\le_\tau\lambda\bar z\, .\,\Box Y[\bar z]$, which is $\operatorname{Persistent}(Y)$.

Weak inextensibility. Suppose $\forall\bar z\, .\,Y[\bar z]\to\Box Z[\bar z]$. If $X[\bar u]$ then $Y[\bar u]$ by coextensiveness, so $\Box Z[\bar u]$; hence $Y\le_\tau Z$ by (ii).

## Notes

The argument stops short of Rigid Comprehension exactly at the leading box of Inextensible. It delivers a $Y$ that is inextensible at the actual world, while Rigid demands the biconditional at every world. The models recorded from the same draft show that the gap is real.

## Sources

- **BC does not imply RC** — Cian Dorr, Boolean Completeness does not imply Rigid Comprehension, draft of 30 July 2026, Proposition 1, p. 2.

<p class='cert'>Record: <code>topics/classicism/results/completeness-and-actuality-imply-weak-rigid-comprehension.yaml</code></p>

## Paper references

- **Proof: Boolean Completeness does not imply Rigid Comprehension.** Dorr, Cian. Boolean Completeness does not imply Rigid Comprehension. Unpublished draft in progress, 30 July 2026, 27 pages. All page, proposition and lemma locators for this source refer to that draft. Parts of the draft were drafted with AI assistance; its mathematical claims are attributed to the author. — Proposition 1, p. 2
- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §2.2, pp. 23–25. Boolean Completeness and Actuality; the least-upper-bound form of Boolean Completeness is equivalent to the stated greatest-lower-bound form in C.
