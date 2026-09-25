# Relational Choice ∧ Very Weak Rigid Comprehension ⇒ Transversal Choice

<p class='cert'>Result — Source: Misc.; produced by Claude Fable 5.1 (Anthropic), 25 September 2026, on a question of Zachary Goodsell after an observation of Christopher Sun; recorded by Claude Fable 5.1 (Anthropic), 25 September 2026.</p>

## Premises

- **Relational Choice.** Every serial binary relation has a functional subrelation.
- **Very Weak Rigid Comprehension.** Every relation, including a proposition, is coextensive with a very weakly rigid one, that is, with one that is weakly persistent and weakly inextensible.

## Conclusion

- **Transversal Choice.** Every equivalence relation, at any type including e, has a transversal, that is, a property with exactly one instance in each of its cells.

## Proof

First, two very weakly rigid properties $C$ and $C'$ of type $\sigma t$ that are coextensive are identical. If $Cz$ then $C'z$, and weak persistence of $C'$ gives $\Box C'z$; so $\forall z\, .\,Cz\to\Box C'z$, and weak inextensibility of $C$ with $X:=C'$ gives $C\le C'$, that is $\Box\forall z\, .\,Cz\to C'z$. By symmetry $C'\le C$, so $\Box\forall z\, .\,Cz\leftrightarrow C'z$, and Intensionality (necessarily coextensive relations are identical, a theorem of C, Classicism §1.5) gives $C=C'$. Now let $R^{\sigma\sigma t}$ be an equivalence relation. Relational Choice at types $(\sigma t,\sigma)$ gives a functional subrelation $S$ of the serial $(UC)y:=Cy\lor\neg\exists z\, .\,Cz$. Put $Fy:=\exists C\, .\,\operatorname{VeryWeaklyRigid}(C)\land(\forall z\, .\,Cz\leftrightarrow(Ry)z)\land(SC)y$. Existence: given $x$, Very Weak Rigid Comprehension gives a very weakly rigid $C$ coextensive with $\lambda z\, .\,(Rx)z$; $C$ has the instance $x$, so the $y$ with $(SC)y$ satisfies $Cy$, hence $(Rx)y$; then $\lambda z\, .\,(Ry)z$ is coextensive with $\lambda z\, .\,(Rx)z$ and so with $C$, which gives $Fy$. Uniqueness: if $(Rx)y$, $(Rx)y'$, $Fy$ through $C$ and $Fy'$ through $C'$, then $C$ and $C'$ are both coextensive with the cell of $x$, hence with each other, so $C=C'$ by the first paragraph, and $(SC)y\land(SC)y'$ gives $y=y'$ by functionality.

## Notes

Very weak rigidity is the weakest rigidity condition on the map, so the same proof runs from Weak or full Rigid Comprehension, and through the recorded arrows from Extensionality, Gallin comprehension with BF, C5 with Actuality, boxed Atomicity with Boolean Completeness and BF, and boxed Functional Choice, which gives boxed Plenitude and so C5 and Actuality. Only the type-$\sigma t$ instance of the comprehension principle is used.

## Sources

- **Sun via Goodsell 25 Sep** — Zachary Goodsell, question of 25 September 2026, after Christopher Sun's observation; proof as recorded.

<p class='cert'>Record: <code>topics/classicism/results/relational-choice-and-very-weak-rigid-comprehension-imply-transversal-choice.yaml</code></p>
