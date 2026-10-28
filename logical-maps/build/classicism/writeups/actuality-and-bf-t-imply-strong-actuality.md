# Actuality ∧ BF (type t) ⇒ Strong Actuality

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.actuality_and_bf_t_imply_strong_actuality`; produced by Cian Dorr, 6 October 2026 (statement); proof written out by Claude Opus 5.5 (Anthropic); recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 6 October 2026.</p>

## Premises

- **Actuality.** There is a true proposition that entails every true proposition.
- **BF (type t).** If every proposition necessarily has a property, then necessarily every proposition has it.

## Conclusion

- **Strong Actuality.** There is a true strong atom: a true proposition that necessarily entails every proposition or its negation.

## Proof

Let $a$ witness Actuality. For each $q$, $a\le q\lor a\le\neg q$: if $q$ is true, $a\le q$; if not, $\neg q$ is true and $a\le\neg q$. Each disjunct is necessary by 4, so the disjunction is necessary: $\forall q\, .\,\Box(a\le q\lor a\le\neg q)$. BF (type t), for the property $\lambda q\, .\,a\le q\lor a\le\neg q$, gives $\Box\forall q\, .\,a\le q\lor a\le\neg q$. With $a$ true, $a$ witnesses Strong Actuality. (The argument of Bacon's Exercise 8.12 for Strong Atomicity, applied to the actual-world proposition.)

## Sources

- **Dorr 6 Oct** — Cian Dorr, suggestion of 6 October 2026, introducing Strong Actuality.
- **Philosophical Introduction to HOL** — Andrew Bacon, A Philosophical Introduction to Higher-Order Logics, Routledge, 2024, §8.2, Exercise 8.12, p. 166.

<p class='cert'>Record: <code>topics/classicism/results/actuality-and-bf-t-imply-strong-actuality.yaml</code></p>

## Paper references

- **Proof: A Philosophical Introduction to Higher-Order Logics.** Bacon, Andrew (2024). A Philosophical Introduction to Higher-Order Logics. Routledge. DOI 10.4324/9781003039181. Chapter 8, Application: Consequences and strengthenings of Classicism, pp. 155–182, and Chapter 18, The model theory of classicism, pp. 389–413, were read directly on 22 September 2026; locators give the book's own page numbers. The book works in the full simple type hierarchy with Modalized Functionality at all types; its results are taken in the map's relational type system, of which its models are models. — §8.2, Exercise 8.12, p. 166. The same argument, for an atom below a possible proposition.
