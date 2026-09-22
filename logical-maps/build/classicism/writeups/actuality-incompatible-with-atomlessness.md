# Actuality ∧ Atomlessness ⇒ False (⊥)

<p class='cert'>Result — Source: Misc.; produced by Claude Fable 5.1 (Anthropic), 19 September 2026, at the suggestion of Cian Dorr; recorded by Claude Fable 5.1 (Anthropic), 19 September 2026.</p>

## Premises

- **Actuality.** There is a true proposition that entails every true proposition.
- **Atomlessness.** Atomlessness in the displayed closed propositional formulation.

## Conclusion

- **False (⊥).** These premises cannot all hold together.

## Proof

Let $a$ be a strongest truth, as Actuality supplies. Since $a$ is true, $a\ne\bot$, so $\Diamond a$. Atomlessness then gives $q$ with $\Diamond q$, $q\le a$ and $q\ne a$. If $q$ were true, Actuality would give $a\le q$, and with $q\le a$ antisymmetry gives $q=a$, contrary to $q\ne a$. So $q$ is false, and $a\land\neg q$ is true, whence $a\le a\land\neg q\le\neg q$. Combined with $q\le a$ this gives $q\le\neg q$, so $q=q\land\neg q=\bot$, contradicting $\Diamond q$. In short, a strongest truth is an atom.

## Notes

This explains why Atomlessness holds only in Parts 1–3 of Proposition D.5, since Parts 4, 5, 7 and 8 satisfy Actuality and Parts 6–8 satisfy Atomicity. The restriction of Atomlessness to false propositions, which the draft notes holds in Part 4, is not a principle of the map.

## Sources

- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, §2.2, p. 25; Appendix D, p. 78 (Part 4).

<p class='cert'>Record: <code>topics/classicism/results/actuality-incompatible-with-atomlessness.yaml</code></p>

## Paper references

- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §2.2, p. 25; Appendix D, p. 78. The draft does not state the incompatibility, but its discussion of the Part 4 model observes that only the restriction of Atomlessness to false propositions can hold once the strongest truth is available.
