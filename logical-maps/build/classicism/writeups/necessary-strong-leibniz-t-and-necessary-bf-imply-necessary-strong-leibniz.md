# □Strong Leibniz Biconditionals (type t) ∧ □BF ⇒ □Strong Leibniz Biconditionals

<p class='cert'>Result — Source: Misc.; produced by Cian Dorr, question of 23 September 2026; proof written out by Claude Fable 5.1 (Anthropic); recorded by Claude Fable 5.1 (Anthropic), 23 September 2026.</p>

## Premises

- **□Strong Leibniz Biconditionals (type t).** Every closed instance of Strong Leibniz Biconditionals (type t) is necessary.
- **□BF.** Every closed instance of BF is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.

## Conclusion

- **□Strong Leibniz Biconditionals.** Every closed instance of the Strong Leibniz Biconditionals is necessary. Box the entire object-variable closure; retain the type range.

## Proof

First the unboxed statement, for a relational type $\tau=\bar\sigma t$. Let $X^\tau\ne\bot$. Intensionality’s contrapositive gives $\Diamond\exists\bar y\, .\,X\bar y$, and BF at the argument types gives $\bar x$ with $\Diamond X\bar x$. The type-t Strong Leibniz Biconditionals give a strong world $w\le X\bar x$: $w\ne\bot$ and $\Box\forall q\, .\,(w\le q\lor w\le\neg q)$. Put $W:=\lambda\bar y\, .\,w\land\bar y=\bar x$. Then $W\ne\bot$, since $W\bar x=w$, and $W\le X$, since $\Box(w\to X\bar x)$ and Leibniz’s law give $\Box\forall\bar y\, .\,W\bar y\to X\bar y$ by K. $W$ is a strong world at $\tau$: under the box, for any $Y^\tau$, instantiate the strong-world clause of $w$ at $q:=Y\bar x$; if $w\le Y\bar x$ then $\Box\forall\bar y\, .\,W\bar y\to Y\bar y$, that is $W\le Y$, by the same K step, and if $w\le\neg Y\bar x$ then $W\le\neg Y$ likewise; so $\Box\forall Y\, .\,(W\le Y\lor W\le\neg Y)$, the passage under the outer box being by necessitation and K since each step is a theorem of C. For each $\tau$ this derives the closed instance $\mathrm{SL}_\tau$ from $\mathrm{SL}_t$ and finitely many BF instances in C; necessitating that conditional and applying K gives $\Box\mathrm{SL}_\tau$ from $\Box\mathrm{SL}_t$ and $\Box$BF.

## Notes

The unboxed form, Strong Leibniz Biconditionals (type t) + BF ⇒ Strong Leibniz Biconditionals, is already derivable on the map through Atomicity: SL (t) gives Atomicity (t), Atomicity (t) + BF gives Atomicity, and Atomicity + BF gives SL. The direct construction above proves it in one step and is what is necessitated here; the boxed form was not derivable, since no record boxes the type-t instance of Atomicity. Only BF at the argument types of the target type is used, as in atomicity-t-and-bf-imply-atomicity.

## Sources

- **Dorr 23 Sep** — Cian Dorr, question of 23 September 2026, whether the Strong Leibniz Biconditionals follow from their type-t instance given BF; proof as recorded.

<p class='cert'>Record: <code>topics/classicism/results/necessary-strong-leibniz-t-and-necessary-bf-imply-necessary-strong-leibniz.yaml</code></p>

## Paper references

- **Background: A Philosophical Introduction to Higher-Order Logics.** Bacon, Andrew (2024). A Philosophical Introduction to Higher-Order Logics. Routledge. DOI 10.4324/9781003039181. Chapter 8, Application: Consequences and strengthenings of Classicism, pp. 155–182, and Chapter 18, The model theory of classicism, pp. 389–413, were read directly on 22 September 2026; locators give the book's own page numbers. The book works in the full simple type hierarchy with Modalized Functionality at all types; its results are taken in the map's relational type system, of which its models are models. — Chapter 8, pp. 155–182. Strong worlds and the Strong Leibniz Biconditionals.
