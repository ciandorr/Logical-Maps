# □Atomicity ∧ □BF (type t) ⇒ □Strong Atomicity (type t)

<p class='cert'>Result — Source: Philosophical Introduction to HOL (2024), Lean `Classicism.Map.necessary_atomicity_and_necessary_bf_t_imply_necessary_strong_atomicity_t`; produced by Andrew Bacon; boxed type-t form recorded by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 22 September 2026; recorded by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 22 September 2026.</p>

## Premises

- **□Atomicity.** Necessarily, every non-bottom entity of each relational type has an atom below it.
- **□BF (type t).** Necessarily, if every proposition necessarily has a property, then necessarily every proposition has it.

## Conclusion

- **□Strong Atomicity (type t).** Necessarily, every possible proposition is entailed by a strong atom, one that is possible and necessarily entails every proposition or its negation.

## Proof

Necessitate the recorded implication from Atomicity (type t) and BF (type t) to Strong Atomicity Biconditionals (type t), a theorem of C; □Atomicity supplies the boxed type-t instance of Atomicity, and K distributes.

## Sources

- **Philosophical Introduction to HOL** — Andrew Bacon, A Philosophical Introduction to Higher-Order Logics, Routledge, 2024, §8.2, Exercise 8.12 and Theorem 8.2, pp. 166, 169–170.

<p class='cert'>Record: <code>topics/classicism/results/necessary-atomicity-and-necessary-bf-t-imply-necessary-strong-atomicity-t.yaml</code></p>

## Paper references

- **Proof: A Philosophical Introduction to Higher-Order Logics.** Bacon, Andrew (2024). A Philosophical Introduction to Higher-Order Logics. Routledge. DOI 10.4324/9781003039181. Chapter 8, Application: Consequences and strengthenings of Classicism, pp. 155–182, and Chapter 18, The model theory of classicism, pp. 389–413, were read directly on 22 September 2026; locators give the book's own page numbers. The book works in the full simple type hierarchy with Modalized Functionality at all types; its results are taken in the map's relational type system, of which its models are models. — §8.2, Exercise 8.12 and Theorem 8.2, pp. 166, 169–170
