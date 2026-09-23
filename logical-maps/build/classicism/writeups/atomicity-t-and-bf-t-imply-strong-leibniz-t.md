# Atomicity (type t) ∧ BF (type t) ⇒ Strong Leibniz Biconditionals (type t)

<p class='cert'>Result — Source: Philosophical Introduction to HOL (2024); produced by Andrew Bacon; set as Exercise 8.12, type-t instance written out by Claude Fable 5.1 (Anthropic), 22 September 2026; recorded by Claude Fable 5.1 (Anthropic), 22 September 2026.</p>

## Premises

- **Atomicity (type t).** Atomicity (type t) in the displayed closed propositional formulation.
- **BF (type t).** BF (type t) in the displayed closed propositional formulation.

## Conclusion

- **Strong Leibniz Biconditionals (type t).** The type-t instance of the Strong Leibniz Biconditionals: every possible proposition is entailed by a strong world proposition, one that is possible and necessarily entails every proposition or its negation.

## Proof

Let $w$ be an atom below the possible $p$. For each $q$, $w\le q\lor w\le\neg q$ is true and, being a disjunction of two necessities, necessary by 4; so $\forall q\, .\,\Box(w\le q\lor w\le\neg q)$. BF (type t), for the property $\lambda q\, .\,w\le q\lor w\le\neg q$, gives $\Box\forall q\, .\,w\le q\lor w\le\neg q$. With $\Diamond w$, which is $w\ne\bot$, $w$ is a strong world.

## Sources

- **Philosophical Introduction to HOL** — Andrew Bacon, A Philosophical Introduction to Higher-Order Logics, Routledge, 2024, §8.2, Exercise 8.12, p. 166.

<p class='cert'>Record: <code>topics/classicism/results/atomicity-t-and-bf-t-imply-strong-leibniz-t.yaml</code></p>

## Paper references

- **Proof: A Philosophical Introduction to Higher-Order Logics.** Bacon, Andrew (2024). A Philosophical Introduction to Higher-Order Logics. Routledge. DOI 10.4324/9781003039181. Chapter 8, Application: Consequences and strengthenings of Classicism, pp. 155–182, and Chapter 18, The model theory of classicism, pp. 389–413, were read directly on 22 September 2026; locators give the book's own page numbers. The book works in the full simple type hierarchy with Modalized Functionality at all types; its results are taken in the map's relational type system, of which its models are models. — §8.2, Exercise 8.12, p. 166
