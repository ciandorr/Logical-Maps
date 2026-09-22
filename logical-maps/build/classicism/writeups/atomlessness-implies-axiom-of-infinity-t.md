# Atomlessness ⇒ Axiom of Infinity (type t)

<p class='cert'>Result — Source: Misc.; produced by Cian Dorr, 19 September 2026; recorded by Claude Opus 5 (Anthropic), 19 September 2026.</p>

## Premises

- **Atomlessness.** Atomlessness in the displayed closed propositional formulation.

## Conclusion

- **Axiom of Infinity (type t).** There are not finitely many propositions. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.

## Proof

Call $q$ a floor of $X^{tt}$ when $Xq$, $\Diamond q$, and no possible instance of $X$ lies strictly below $q$. Let $W$ be the property of cardinalities holding of $Z$ when every instance of $Z$ that has a possible instance has a floor.

$W$ holds of $\mathbf{0}_t$, since its only instance has no instances at all, so the condition is vacuous.

$W$ is closed under $\operatorname{Suc}_t$. Let $WY$ and $(\operatorname{Suc}_t Y)X$, and take the witness $y$ with $Xy$ and $Y(\lambda u\, .\,Xu\land u\ne y)$; write $X^-$ for that abstract, whose instances are exactly the instances of $X$ other than $y$. Suppose $X$ has a possible instance. If $X^-$ has none then $y$ is the only one, and is a floor. Otherwise the hypothesis on $Y$, applied to $X^-$ as $\operatorname{Suc}_t$ presents it, gives a floor $q$ of $X^-$. If $y$ is not possible, or is not strictly below $q$, then $q$ is a floor of $X$, since a possible instance of $X$ strictly below $q$ is either an instance of $X^-$, against the choice of $q$, or is $y$, which this case excludes. If instead $y$ is possible and strictly below $q$, then $y$ is a floor of $X$. For a possible instance $r$ of $X$ strictly below $y$ is not $y$, hence is an instance of $X^-$, and $r\le y\le q$. If $r=q$ then $q\le y\le q$ makes $y=q$, against $y\ne q$; so $r$ is an instance of $X^-$ strictly below $q$, again against the choice of $q$.

So every finite cardinality has the property. Now suppose some finite $Z$ held of $\lambda p\, .\,\top$. That property has the possible instance $\top$, since $\top\ne\bot$ in C, so it would have a floor $q$. Atomlessness applied to $q$ supplies a possible $q'$ with $q'\le q$ and $q'\ne q$, and $q'$ is an instance of $\lambda p\, .\,\top$, contradicting the floor. Hence no finite cardinality holds of $\lambda p\, .\,\top$.

## Notes

The induction stays inside the presentation that $\operatorname{Suc}_t$ supplies, applying the hypothesis to the abstract $\lambda u\, .\,Xu\land u\ne y$ itself rather than to a coextensive property. That is what makes it go through without Extensionality. The recorded implication to the Infinity schema is a consequence of this one and is left in place as the shorter argument.

## Sources

- **Dorr 19 Sep** — Cian Dorr, proof sketch of 19 September 2026.
- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, Appendix D, p. 76 (Atomlessness).

<p class='cert'>Record: <code>topics/classicism/results/atomlessness-implies-axiom-of-infinity-t.yaml</code></p>

## Paper references

- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — Appendix D, p. 76. Formulation of Atomlessness. The draft does not draw the connection.
