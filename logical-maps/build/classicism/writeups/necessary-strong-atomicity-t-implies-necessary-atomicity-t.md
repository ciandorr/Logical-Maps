# □Strong Atomicity (type t) ⇒ □Atomicity (type t)

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.necessary_strong_atomicity_t_implies_necessary_atomicity_t`; produced by Claude Opus 5.5 (Anthropic), 2 October 2026, from a suggestion of Cian Dorr; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2 October 2026.</p>

## Premises

- **□Strong Atomicity (type t).** Necessarily, every possible proposition is entailed by a strong atom, one that is possible and necessarily entails every proposition or its negation.

## Conclusion

- **□Atomicity (type t).** Necessarily, every non-bottom proposition has an atom below it.

## Proof

The proof of [[strong-atomicity-t-implies-atomicity-t]] uses its premises only at finitely many closed instances and nothing beyond C. So for each closed instance of the conclusion, C proves the conditional from the corresponding premise instances to it. Necessitate that theorem and apply K with the boxed premise instances. Generalization over the admitted types is metalinguistic; no type quantifier is placed inside the box.

## Notes

Boxed counterpart of [[strong-atomicity-t-implies-atomicity-t]].

## Sources

- **Dorr 2 Oct** — Cian Dorr, suggestion of 2 October 2026.

<p class='cert'>Record: <code>topics/classicism/results/necessary-strong-atomicity-t-implies-necessary-atomicity-t.yaml</code></p>

## Paper references

- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §1.5, pp. 16–17. Necessitation of theorems, K and 4.
