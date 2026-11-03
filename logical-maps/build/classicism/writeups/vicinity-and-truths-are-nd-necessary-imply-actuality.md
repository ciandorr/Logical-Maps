# Vicinity ∧ Truths are ND-necessary ⇒ Actuality

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.vicinity_and_truths_are_nd_necessary_imply_actuality`; produced by Cian Dorr, 27 September 2026; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 27 September 2026.</p>

## Premises

- **Vicinity.** There is a true proposition that entails the possibility of each true proposition.
- **Truths are ND-necessary.** Every truth is ND-necessary, that is, necessary under the distinctness-preserving modality.

## Conclusion

- **Actuality.** There is a true proposition that entails every true proposition.

## Proof

Let $w$ witness Vicinity; we show that $w$ itself witnesses Actuality. Let $p$ be true. Truths are ND-necessary gives $\Box_{\ne}p$, that is, a true $q$ with $\Box(\Diamond q\to p)$, i.e. $\Diamond q\le p$. Since $q$ is true, Vicinity gives $w\le\Diamond q$. So $w\le p$.

## Notes

The witness is the same proposition. With Actuality ⇒ Vicinity, Actuality is equivalent to Vicinity under Truths are ND-necessary, as it is under Weakly Inextensible Comprehension. With the ND-necessity form of Vicinity (added 14 October 2026) the proof is one line: a witness entails every ND-necessary truth, and under Truths are ND-necessary every truth is ND-necessary.

## Revisions

- **2026-10-30** (Claude Opus 5.5 (Anthropic), at Cian Dorr's direction) — Id renamed from vicinity-and-distinctness-preserving-collapse-imply-actuality, to match the current principle names.

## Sources

- **Dorr 27 Sep** — Cian Dorr, observation of 27 September 2026.
- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, §2.6, p. 42 (the distinctness-preserving modality); Appendix E, p. 83.

<p class='cert'>Record: <code>topics/classicism/results/vicinity-and-truths-are-nd-necessary-imply-actuality.yaml</code></p>

## Paper references

- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §2.6, p. 42; Appendix E, p. 83. Definition of $\Box_{\ne}$ and formulation of Truths are ND-necessary.
