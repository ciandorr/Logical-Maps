# □ND ∧ Atomicity (type t) ⇒ No Pure Contingency

<p class='cert'>Result — Source: Goodsell / Yli-Vakkuri (unpublished), Lean `Classicism.Map.c5_and_atomicity_t_imply_no_pure_contingency`; produced by Zachary Goodsell and Juhani Yli-Vakkuri (theorem); proof by Cian Dorr, 23 September 2026, with permission from Zachary Goodsell, written out by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr; recorded by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 23 September 2026.</p>

## Premises

- **□ND.** Necessarily, distinct things of any type are necessarily distinct.
- **Atomicity (type t).** Every non-bottom proposition has an atom below it.

## Conclusion

- **No Pure Contingency.** Each closed sentence of the pure language, if true, is necessary. This is a sentence schema, not a quantifier over propositions.

## Proof

The proof written up for c5-and-atomicity-imply-no-pure-contingency uses Atomicity only at type $t$, to find an atom below $P$ and one below $\neg P$ for a true closed pure $P\ne\top$; every other step uses $\Box$ND, through ND and BF at the types occurring in $P$. So the same write-up proves this sharper statement.

## Notes

The sharpening of the reported theorem to the type-t instance of Atomicity, which is all the argument needs. Recorded separately so that the reported statement keeps its own record.

## Revisions

- **2026-10-25** (Claude Opus 5.5 (Anthropic), prompted by Cian Dorr) — (minor) Lean proof connected: GPT-6 Astra's formalization (prompted by Daniel Kodsi, 23 October 2026), ported from Daniel Kodsi's submission.

## Sources

- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, §2.2, p. 27.
- **Dorr 23 Sep** — Cian Dorr, proof sketch of 23 September 2026, with permission from Zachary Goodsell; written out in the write-up.

<p class='cert'>Record: <code>topics/classicism/results/c5-and-atomicity-t-imply-no-pure-contingency.yaml</code></p>

## Paper references

- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §2.2, p. 27; Proposition 2.3, p. 22; Proposition 2.4, p. 23. The report of the theorem, and the derivation of BF from □ND used for the quantifier step.
- **Origin: Logical Foundations of Philosophy.** Goodsell, Zachary, and Juhani Yli-Vakkuri. Logical Foundations of Philosophy. Unpublished work cited in Classicism, p. 27; no proof from that work is imported here. — Logical Foundations of Philosophy, as cited in Classicism p. 27
