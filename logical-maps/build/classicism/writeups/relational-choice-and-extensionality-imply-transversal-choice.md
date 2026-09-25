# Relational Choice ∧ Extensionality ⇒ Transversal Choice

<p class='cert'>Result — Source: Misc.; produced by Claude Fable 5.1 (Anthropic), 25 September 2026, on a question of Zachary Goodsell after an observation of Christopher Sun; the usual quotient argument; recorded by Claude Fable 5.1 (Anthropic), 25 September 2026.</p>

## Premises

- **Relational Choice.** Every serial binary relation has a functional subrelation.
- **Extensionality.** At each relational type, coextensive relations are identical; include the nullary propositional case.

## Conclusion

- **Transversal Choice.** Every equivalence relation, at any type including e, has a transversal, that is, a property with exactly one instance in each of its cells.

## Proof

Let $R^{\sigma\sigma t}$ be an equivalence relation and write $[x]$ for the cell $\lambda z\, .\,(Rx)z$. The relation $U^{(\sigma t)\sigma t}$ with $(UC)y:=Cy\lor\neg\exists z\, .\,Cz$ is serial, so Relational Choice gives a functional $S$ with $(SC)y\to(UC)y$. Put $Fy:=\exists x\, .\,(S[x])y$. Existence: given $x$, functionality gives $y$ with $(S[x])y$; the cell $[x]$ has the instance $x$, so $(U[x])y$ gives $(Rx)y$, and $Fy$ holds. Uniqueness: suppose $(Rx)y$, $Fy$, $(Rx)y'$ and $Fy'$, with witnesses $x_1$ and $x_2$, so that $(S[x_1])y$ and $(S[x_2])y'$. As before $(Rx_1)y$ and $(Rx_2)y'$, so $x_1$, $y$, $x$, $y'$ and $x_2$ lie in one cell and $\forall z\, .\,(Rx_1)z\leftrightarrow(Rx_2)z$. Extensionality at type $\sigma t$ gives $[x_1]=[x_2]$, and functionality of $S$ gives $y=y'$.

## Notes

The only use of Extensionality is to identify the coextensive cells $[x_1]$ and $[x_2]$. In C alone properties are identical only when necessarily coextensive, which the hypothesis does not supply; see the recorded question relational-choice-r-implies-transversal-choice-r. The arrow is also derivable through Extensionality implies Rigid Comprehension and the arrow from Relational Choice with Very Weak Rigid Comprehension; it is recorded directly because it is the argument usually given.

## Sources

- **Sun via Goodsell 25 Sep** — Zachary Goodsell, question of 25 September 2026, after Christopher Sun's observation; the quotient argument as recorded.

<p class='cert'>Record: <code>topics/classicism/results/relational-choice-and-extensionality-imply-transversal-choice.yaml</code></p>
