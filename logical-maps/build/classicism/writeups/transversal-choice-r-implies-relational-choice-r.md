# Transversal Choice ⇒ Relational Choice

<p class='cert'>Result — Source: Misc.; produced by Claude Fable 5.1 (Anthropic), 25 September 2026, on a question of Zachary Goodsell after an observation of Christopher Sun; recorded by Claude Fable 5.1 (Anthropic), 25 September 2026.</p>

## Premises

- **Transversal Choice.** Every equivalence relation, at any type including e, has a transversal, that is, a property with exactly one instance in each of its cells.

## Conclusion

- **Relational Choice.** Every serial binary relation has a functional subrelation.

## Proof

Let $U^{\sigma\tau t}$ be serial. For $x^\sigma$ and $y^\tau$ write $\langle x,y\rangle$ for the rigid pair $\lambda u^\sigma v^\tau\, .\,u=x\land v=y$, of the admitted type $\sigma\tau t$; the case $\tau=e$ is included. Pairing is injective: if $\langle x,y\rangle=\langle x',y'\rangle$, apply both sides to $x$ and $y$. The left side is $x=x\land y=y$, a theorem of H, so by Logical Equivalence it is $\top$; hence $x=x'\land y=y'$ is $\top$ and so true. Call $P$ a $U$-pair if $\exists x y\, .\,(Ux)y\land P=\langle x,y\rangle$. Let $E$ relate two $U$-pairs when some $x$ is the first coordinate of both, and relate any two non-$U$-pairs. By injectivity $E$ is an equivalence relation on type $\sigma\tau t$, and the cell of a $U$-pair $\langle x,y_0\rangle$ consists exactly of the pairs $\langle x,y\rangle$ with $(Ux)y$. Transversal Choice gives $F^{(\sigma\tau t)t}$ with exactly one instance in each cell. Put $(Sx)y:=(Ux)y\land F\langle x,y\rangle$; this is a subrelation of $U$. Given $x$, seriality gives $y_0$ with $(Ux)y_0$, so the cell of $\langle x,y_0\rangle$ has a unique $F$-instance $\langle x,y_x\rangle$, and $(Sx)y$ holds iff $\langle x,y\rangle$ is that instance iff $y=y_x$. So $S$ is functional.

## Notes

Transversal Choice is therefore at least as strong as Relational Choice over C. Whether it is strictly stronger is the recorded question relational-choice-r-implies-transversal-choice-r.

## Sources

- **Sun via Goodsell 25 Sep** — Zachary Goodsell, question of 25 September 2026, after Christopher Sun's observation; proof as recorded.

<p class='cert'>Record: <code>topics/classicism/results/transversal-choice-r-implies-relational-choice-r.yaml</code></p>
