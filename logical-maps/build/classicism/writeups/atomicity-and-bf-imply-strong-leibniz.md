# Atomicity ∧ BF ⇒ Strong Leibniz Biconditionals

<p class='cert'>Result — Source: Philosophical Introduction to HOL (2024); produced by Andrew Bacon; set as Exercise 8.12, solution written out by Claude Fable 5.1 (Anthropic), 22 September 2026; recorded by Claude Fable 5.1 (Anthropic), 22 September 2026.</p>

## Premises

- **Atomicity.** Every non-bottom entity of each relational type has an atom below it.
- **BF.** The Barcan Formula at every type. The predicate formulation closes the formula schema using lambda abstraction.

## Conclusion

- **Strong Leibniz Biconditionals.** At each relational type, every possible entity (one distinct from bottom) is entailed by a strong world: a possible entity that necessarily entails every entity of the type or its negation. The right-to-left direction is a theorem of C; the principle records the substantive direction.

## Proof

Let $W$ be a weak world of relational type $\sigma$: $W\ne\bot$ and $\forall Y\, .\,W\le Y\lor W\le\neg Y$. We show $\Box\forall Y\, .\,W\le Y\lor W\le\neg Y$. Each instance is necessary once true, since $W\le Y$ is $\Box$ of a closed formula and 4 holds; so $\forall Y\, .\,\Box(W\le Y\lor W\le\neg Y)$. BF at type $\sigma$ (the instance for the property $\lambda Y\, .\,W\le Y\lor W\le\neg Y$) turns this into $\Box\forall Y\, .\,W\le Y\lor W\le\neg Y$. Thus every weak world is a strong world, and Atomicity supplies a weak world below each possible $X$.

## Notes

Bacon states this for relational types other than e, which is the map’s type range for both worlds principles; BF is used only at those types.

## Sources

- **Philosophical Introduction to HOL** — Andrew Bacon, A Philosophical Introduction to Higher-Order Logics, Routledge, 2024, §8.2, Exercise 8.12, p. 166.

<p class='cert'>Record: <code>topics/classicism/results/atomicity-and-bf-imply-strong-leibniz.yaml</code></p>

## Paper references

- **Proof: A Philosophical Introduction to Higher-Order Logics.** Bacon, Andrew (2024). A Philosophical Introduction to Higher-Order Logics. Routledge. DOI 10.4324/9781003039181. Chapter 8, Application: Consequences and strengthenings of Classicism, pp. 155–182, and Chapter 18, The model theory of classicism, pp. 389–413, were read directly on 22 September 2026; locators give the book's own page numbers. The book works in the full simple type hierarchy with Modalized Functionality at all types; its results are taken in the map's relational type system, of which its models are models. — §8.2, Exercise 8.12, p. 166
