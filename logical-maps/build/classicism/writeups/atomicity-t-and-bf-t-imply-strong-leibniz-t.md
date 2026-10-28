# Atomicity (type t) ∧ BF (type t) ⇒ Strong Leibniz Biconditionals (type t)

<p class='cert'>Result — Source: Philosophical Introduction to HOL (2024), Lean `Classicism.Map.atomicity_t_and_bf_t_imply_strong_leibniz_t`; produced by Andrew Bacon; set as Exercise 8.12, type-t instance written out by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 22 September 2026; recorded by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 22 September 2026.</p>

## Premises

- **Atomicity (type t).** Every non-bottom proposition has an atom below it.
- **BF (type t).** If every proposition necessarily has a property, then necessarily every proposition has it.

## Conclusion

- **Strong Leibniz Biconditionals (type t).** Every possible proposition is entailed by a strong world proposition, one that is possible and necessarily entails every proposition or its negation.

## Proof

Let $w$ be an atom below the possible $p$. For each $q$, $w\le q\lor w\le\neg q$ is true and, being a disjunction of two necessities, necessary by 4; so $\forall q\, .\,\Box(w\le q\lor w\le\neg q)$. BF (type t), for the property $\lambda q\, .\,w\le q\lor w\le\neg q$, gives $\Box\forall q\, .\,w\le q\lor w\le\neg q$. With $\Diamond w$, which is $w\ne\bot$, $w$ is a strong world.

## Notes

Now derived: BF (type t) gives Atoms are strong worlds (type t) ([[barcan-t-implies-atoms-are-strong-worlds-t]]), which with Atomicity (type t) gives the Strong Leibniz Biconditionals (type t) ([[atomicity-t-and-atoms-are-strong-worlds-t-imply-strong-leibniz-t]]).

## Revisions

- **2026-10-25** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026) — (minor) Cross-reference to the Self-Atomicity and bridge-principle records added; the record is unchanged.

## Sources

- **Philosophical Introduction to HOL** — Andrew Bacon, A Philosophical Introduction to Higher-Order Logics, Routledge, 2024, §8.2, Exercise 8.12, p. 166.

<p class='cert'>Record: <code>topics/classicism/results/atomicity-t-and-bf-t-imply-strong-leibniz-t.yaml</code></p>

## Paper references

- **Proof: A Philosophical Introduction to Higher-Order Logics.** Bacon, Andrew (2024). A Philosophical Introduction to Higher-Order Logics. Routledge. DOI 10.4324/9781003039181. Chapter 8, Application: Consequences and strengthenings of Classicism, pp. 155–182, and Chapter 18, The model theory of classicism, pp. 389–413, were read directly on 22 September 2026; locators give the book's own page numbers. The book works in the full simple type hierarchy with Modalized Functionality at all types; its results are taken in the map's relational type system, of which its models are models. — §8.2, Exercise 8.12, p. 166
