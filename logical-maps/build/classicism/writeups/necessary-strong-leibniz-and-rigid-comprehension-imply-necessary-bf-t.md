# □Strong Leibniz Biconditionals ∧ Rigid Comprehension ⇒ □BF (type t)

<p class='cert'>Result — Source: Philosophical Introduction to HOL (2024); produced by Andrew Bacon; recorded by Claude Fable 5.1 (Anthropic), 22 September 2026.</p>

## Premises

- **□Strong Leibniz Biconditionals.** Every closed instance of the Strong Leibniz Biconditionals is necessary. Box the entire object-variable closure; retain the type range.
- **Rigid Comprehension.** Every relation, including a proposition, is coextensive with a rigid one.

## Conclusion

- **□BF (type t).** Every closed instance of BF (type t) is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.

## Proof

Theorem 8.2 of the book: given Rigid Comprehension, $\Box\mathrm{SL}_\sigma$ at all relational types implies $\Box\mathrm{BF}_\sigma$ for every relational $\sigma\ne e$. Its proof for $\sigma=t$ (pp. 170–171): from $\Diamond\exists p\, .\,Xp$, $X$ is a possible property, so by $\mathrm{SL}_{tt}$ it is entailed by a strong world property $W$; let $H$ be the rigid collection, supplied by Rigid Comprehension, of world properties accessible to $W$, and let $r:=\exists V\, .\,\exists p\, .\,HV\land Vp\land p$. Bacon shows $\Box\forall p\, .\,Wp\to p=r$, using $\Box\mathrm{SL}_t$ for the step that every world proposition entails $\exists V\, .\,HV\land Vp$ and the rigidity of $H$ for the converse; since $W$ entails $X$, $\Diamond Xr$, which gives $\exists p\, .\,\Diamond Xp$, the contrapositive of $\mathrm{BF}_t$. The argument is carried out under necessary assumptions, so it yields $\Box\mathrm{BF}_t$. The map records the type-$t$ instance; the book proves the same for every relational type other than $e$.

## Notes

The map has no node for BF restricted to relational types, so the conclusion is recorded at type t, the case the book proves in full. The right-to-left half of Theorem 8.2 is the recorded implication from □Atomicity and □BF to □SL, which needs no Rigid Comprehension.

## Sources

- **Philosophical Introduction to HOL** — Andrew Bacon, A Philosophical Introduction to Higher-Order Logics, Routledge, 2024, §8.2, Theorem 8.2, pp. 169–171.

<p class='cert'>Record: <code>topics/classicism/results/necessary-strong-leibniz-and-rigid-comprehension-imply-necessary-bf-t.yaml</code></p>

## Paper references

- **Proof: A Philosophical Introduction to Higher-Order Logics.** Bacon, Andrew (2024). A Philosophical Introduction to Higher-Order Logics. Routledge. DOI 10.4324/9781003039181. Chapter 8, Application: Consequences and strengthenings of Classicism, pp. 155–182, and Chapter 18, The model theory of classicism, pp. 389–413, were read directly on 22 September 2026; locators give the book's own page numbers. The book works in the full simple type hierarchy with Modalized Functionality at all types; its results are taken in the map's relational type system, of which its models are models. — §8.2, Theorem 8.2, pp. 169–171
