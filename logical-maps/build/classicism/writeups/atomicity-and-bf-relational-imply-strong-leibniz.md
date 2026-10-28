# Atomicity ∧ BF (relational types) ⇒ Strong Leibniz Biconditionals

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.atomicity_and_bf_relational_imply_strong_leibniz`; produced by Claude Opus 5.5 (Anthropic), 11 October 2026, from a suggestion of Cian Dorr; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 11 October 2026.</p>

## Premises

- **Atomicity.** Every non-bottom entity of each relational type has an atom below it.
- **BF (relational types).** The Barcan Formula at every relational type, that is, at every type other than e.

## Conclusion

- **Strong Leibniz Biconditionals.** At each relational type, every possible entity (one distinct from bottom) is entailed by a strong world: a possible entity that necessarily entails every entity of the type or its negation. The right-to-left direction is a theorem of C; the principle records the substantive direction.

## Proof

The argument of atomicity-and-bf-imply-strong-leibniz uses BF only at the relational type $\sigma$ of the worlds, for the property $\lambda Y\, .\,W\le Y\lor W\le\neg Y$: every weak world of type $\sigma$ is then a strong world, and Atomicity supplies a weak world below each possible $X$.

## Notes

Now derived: BF at relational types gives Atoms are strong worlds ([[barcan-relational-implies-atoms-are-strong-worlds-r]]), which with Atomicity gives the Strong Leibniz Biconditionals ([[atomicity-r-and-atoms-are-strong-worlds-r-imply-strong-leibniz-r]]).

## Revisions

- **2026-10-25** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026) — (minor) Cross-reference to the Self-Atomicity and bridge-principle records added; the record is unchanged.

## Sources

- **Dorr 11 Oct** — Cian Dorr, suggestion of 11 October 2026.

<p class='cert'>Record: <code>topics/classicism/results/atomicity-and-bf-relational-imply-strong-leibniz.yaml</code></p>

## Paper references

- **Proof: A Philosophical Introduction to Higher-Order Logics.** Bacon, Andrew (2024). A Philosophical Introduction to Higher-Order Logics. Routledge. DOI 10.4324/9781003039181. Chapter 8, Application: Consequences and strengthenings of Classicism, pp. 155–182, and Chapter 18, The model theory of classicism, pp. 389–413, were read directly on 22 September 2026; locators give the book's own page numbers. The book works in the full simple type hierarchy with Modalized Functionality at all types; its results are taken in the map's relational type system, of which its models are models. — §8.2, Exercise 8.12, p. 166
