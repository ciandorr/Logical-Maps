# Strong Atomicity ⇒ Atomicity

<p class='cert'>Result — Source: Philosophical Introduction to HOL (2024), Lean `Classicism.Map.strong_atomicity_r_implies_atomicity_r`; produced by Andrew Bacon; recorded by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 22 September 2026.</p>

## Premises

- **Strong Atomicity.** At each relational type, every possible entity (one distinct from bottom) is entailed by a strong atom: a possible entity that necessarily entails every entity of the type or its negation. The right-to-left direction is a theorem of C; the principle records the substantive direction.

## Conclusion

- **Atomicity.** Every non-bottom entity of each relational type has an atom below it.

## Proof

A strong atom is an atom: $\operatorname{SAtom}_\sigma(W)$ has the conjunct $\Box\forall Y\, .\,W\le Y\lor W\le\neg Y$, and T gives $\forall Y\, .\,W\le Y\lor W\le\neg Y$. So a strong atom below a possible $X$ is an atom below it; and a non-bottom $X$ is possible in the sense $X\ne\bot_\sigma$, which is how Atomicity’s antecedent reads.

## Notes

The map’s Atomicity is stated with the predicate Atom, which coincides with Bacon’s weak worlds: a non-bottom entity every non-bottom part of which is itself, equivalently one that settles every entity of the type.

Strong Atomicity is equivalent to Atomicity together with [[atoms-are-strong-atoms-r]]; see [[strong-atomicity-r-implies-atoms-are-strong-atoms-r]].

## Revisions

- **2026-10-25** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026) — (minor) Cross-reference to the Self-Atomicity and bridge-principle records added; the record is unchanged.

## Sources

- **Philosophical Introduction to HOL** — Andrew Bacon, A Philosophical Introduction to Higher-Order Logics, Routledge, 2024, §8.2, p. 170 (proof of Theorem 8.2).

<p class='cert'>Record: <code>topics/classicism/results/strong-atomicity-r-implies-atomicity-r.yaml</code></p>

## Paper references

- **Proof: A Philosophical Introduction to Higher-Order Logics.** Bacon, Andrew (2024). A Philosophical Introduction to Higher-Order Logics. Routledge. DOI 10.4324/9781003039181. Chapter 8, Application: Consequences and strengthenings of Classicism, pp. 155–182, and Chapter 18, The model theory of classicism, pp. 389–413, were read directly on 22 September 2026; locators give the book's own page numbers. The book works in the full simple type hierarchy with Modalized Functionality at all types; its results are taken in the map's relational type system, of which its models are models. — §8.2, p. 170 (proof of Theorem 8.2)
