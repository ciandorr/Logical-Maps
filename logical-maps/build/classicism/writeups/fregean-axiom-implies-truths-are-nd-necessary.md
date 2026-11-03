# Fregean Axiom ⇒ Truths are ND-necessary

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.fregean_axiom_implies_truths_are_nd_necessary`; produced by Cian Dorr, suggestion of 23 September 2026; proof written out by Claude Fable 5.1 (Anthropic), 23 September 2026; recorded by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 23 September 2026.</p>

## Premises

- **Fregean Axiom.** Materially equivalent propositions are identical.

## Conclusion

- **Truths are ND-necessary.** Every truth is ND-necessary, that is, necessary under the distinctness-preserving modality.

## Proof

Under the Fregean Axiom a true $p$ is materially equivalent to $\top$, hence identical to it, so $\Box p$. And $\Box p$ gives $\Box_{\ne}p$: take $q:=\top$, which is true, and $\Box(\Diamond\top\to p)$ is $\Box p$.

## Notes

With the converse record, the collapse is equivalent to the Fregean Axiom in the presence of ND, while without ND it is weaker: the coalesced-sum roots satisfy it with infinitely many propositions.

## Revisions

- **2026-10-30** (Claude Opus 5.5 (Anthropic), at Cian Dorr's direction) — Id renamed from fregean-axiom-implies-distinctness-preserving-collapse, to match the current principle names.

## Sources

- **Dorr 23 Sep** — Cian Dorr, suggestion of 23 September 2026; proof as recorded.
- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, §2.6, p. 42 (the distinctness-preserving modality); §1.4, pp. 15–16 (the Fregean Axiom).

<p class='cert'>Record: <code>topics/classicism/results/fregean-axiom-implies-truths-are-nd-necessary.yaml</code></p>

## Paper references

- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §2.6, p. 42; §1.4, pp. 15–16
