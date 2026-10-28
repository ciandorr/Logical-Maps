# □Atomicity (type t) ∧ □BF (type t) ⇒ □Strong Atomicity (type t)

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.necessary_atomicity_t_and_necessary_bf_t_imply_necessary_strong_atomicity_t`; produced by Claude Opus 5.5 (Anthropic), 2 October 2026, from a suggestion of Cian Dorr; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 2 October 2026.</p>

## Premises

- **□Atomicity (type t).** Necessarily, every non-bottom proposition has an atom below it.
- **□BF (type t).** Necessarily, if every proposition necessarily has a property, then necessarily every proposition has it.

## Conclusion

- **□Strong Atomicity (type t).** Necessarily, every possible proposition is entailed by a strong atom, one that is possible and necessarily entails every proposition or its negation.

## Proof

The proof of [[atomicity-t-and-bf-t-imply-strong-atomicity-t]] uses its premises only at finitely many closed instances and nothing beyond C. So for each closed instance of the conclusion, C proves the conditional from the corresponding premise instances to it. Necessitate that theorem and apply K with the boxed premise instances. Generalization over the admitted types is metalinguistic; no type quantifier is placed inside the box.

## Notes

Boxed counterpart of [[atomicity-t-and-bf-t-imply-strong-atomicity-t]].

Now derived through the boxed bridge results [[necessary-barcan-t-implies-necessary-atoms-are-strong-atoms-t]] and [[necessary-atomicity-t-and-necessary-atoms-are-strong-atoms-t-imply-necessary-strong-atomicity-t]].

## Revisions

- **2026-10-25** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026) — (minor) Cross-reference to the Self-Atomicity and bridge-principle records added; the record is unchanged.

## Sources

- **Dorr 2 Oct** — Cian Dorr, suggestion of 2 October 2026.

<p class='cert'>Record: <code>topics/classicism/results/necessary-atomicity-t-and-necessary-bf-t-imply-necessary-strong-atomicity-t.yaml</code></p>

## Paper references

- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §1.5, pp. 16–17. Necessitation of theorems, K and 4.
