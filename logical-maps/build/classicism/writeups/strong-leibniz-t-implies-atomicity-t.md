# Strong Leibniz Biconditionals (type t) ⇒ Atomicity (type t)

<p class='cert'>Result — Source: Philosophical Introduction to HOL (2024); produced by Andrew Bacon; type-t instance recorded by Claude Fable 5.1 (Anthropic), 22 September 2026; recorded by Claude Fable 5.1 (Anthropic), 22 September 2026.</p>

## Premises

- **Strong Leibniz Biconditionals (type t).** The type-t instance of the Strong Leibniz Biconditionals: every possible proposition is entailed by a strong world proposition, one that is possible and necessarily entails every proposition or its negation.

## Conclusion

- **Atomicity (type t).** Atomicity (type t) in the displayed closed propositional formulation.

## Proof

A strong world proposition is an atom: from $\Box\forall q\, .\,w\le q\lor w\le\neg q$, T gives $\forall q\, .\,w\le q\lor w\le\neg q$, and with $w\ne\bot$ this is $\operatorname{Atom}_t(w)$. A possible $p$ is a non-bottom $p$. So the strong world below $p$ is an atom below it.

## Sources

- **Philosophical Introduction to HOL** — Andrew Bacon, A Philosophical Introduction to Higher-Order Logics, Routledge, 2024, §8.2, p. 170.

<p class='cert'>Record: <code>topics/classicism/results/strong-leibniz-t-implies-atomicity-t.yaml</code></p>

## Paper references

- **Proof: A Philosophical Introduction to Higher-Order Logics.** Bacon, Andrew (2024). A Philosophical Introduction to Higher-Order Logics. Routledge. DOI 10.4324/9781003039181. Chapter 8, Application: Consequences and strengthenings of Classicism, pp. 155–182, and Chapter 18, The model theory of classicism, pp. 389–413, were read directly on 22 September 2026; locators give the book's own page numbers. The book works in the full simple type hierarchy with Modalized Functionality at all types; its results are taken in the map's relational type system, of which its models are models. — §8.2, p. 170
