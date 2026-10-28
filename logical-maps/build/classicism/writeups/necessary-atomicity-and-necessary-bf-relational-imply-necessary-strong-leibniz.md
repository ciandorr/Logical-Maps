# □Atomicity ∧ □BF (relational types) ⇒ □Strong Leibniz Biconditionals

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.necessary_atomicity_and_necessary_bf_relational_imply_necessary_strong_leibniz`; produced by Claude Opus 5.5 (Anthropic), 11 October 2026, from a suggestion of Cian Dorr; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 11 October 2026.</p>

## Premises

- **□Atomicity.** Necessarily, every non-bottom entity of each relational type has an atom below it.
- **□BF (relational types).** Necessarily, BF holds at every relational type.

## Conclusion

- **□Strong Leibniz Biconditionals.** Necessarily, at each relational type, every possible entity (one distinct from bottom) is entailed by a strong world: a possible entity that necessarily entails every entity of the type or its negation.

## Proof

Necessitate [[atomicity-and-bf-relational-imply-strong-leibniz]], a theorem of C, and distribute the box over the conjunction of premises with K.

## Notes

With necessary-strong-leibniz-and-rigid-comprehension-imply-necessary-bf-relational, this is Theorem 8.2: given Rigid Comprehension and □Atomicity, □Strong Leibniz is equivalent to □BF (relational types).

Now derived through the boxed bridge results [[necessary-barcan-relational-implies-necessary-atoms-are-strong-worlds-r]] and [[necessary-atomicity-r-and-necessary-atoms-are-strong-worlds-r-imply-necessary-strong-leibniz-r]].

## Revisions

- **2026-10-25** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026) — (minor) Cross-reference to the Self-Atomicity and bridge-principle records added; the record is unchanged.

## Sources

- **Dorr 11 Oct** — Cian Dorr, suggestion of 11 October 2026.

<p class='cert'>Record: <code>topics/classicism/results/necessary-atomicity-and-necessary-bf-relational-imply-necessary-strong-leibniz.yaml</code></p>

## Paper references

- **Proof: A Philosophical Introduction to Higher-Order Logics.** Bacon, Andrew (2024). A Philosophical Introduction to Higher-Order Logics. Routledge. DOI 10.4324/9781003039181. Chapter 8, Application: Consequences and strengthenings of Classicism, pp. 155–182, and Chapter 18, The model theory of classicism, pp. 389–413, were read directly on 22 September 2026; locators give the book's own page numbers. The book works in the full simple type hierarchy with Modalized Functionality at all types; its results are taken in the map's relational type system, of which its models are models. — §8.2, Exercise 8.12 and Theorem 8.2, pp. 166, 169–170
