# Actuality ∧ Truth implies ND-necessity ⇒ Strong Actuality

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.actuality_and_distinctness_preserving_collapse_imply_strong_actuality`; produced by Cian Dorr, 6 October 2026; written out by Claude Opus 5.5 (Anthropic); recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 6 October 2026.</p>

## Premises

- **Actuality.** There is a true proposition that entails every true proposition.
- **Truth implies ND-necessity.** Every truth is ND-necessary, that is, necessary under the distinctness-preserving modality.

## Conclusion

- **Strong Actuality.** There is a true strong atom: a true proposition that necessarily entails every proposition or its negation.

## Proof

Let $a$ witness Actuality and write $L(a)$ for $a\land\forall q\, .\,q\to a\le q$. As in the recorded derivation of Inextensible Comprehension from the same premises, Distinctness-preserving collapse applied to the truth $L(a)$ gives a true $q^*$ with $\Box(\Diamond q^*\to L(a))$, and since $a\le q^*$, 4 and K give $\Box(\Diamond a\to L(a))$. Two theorems of C: (i) $L(a)\to\forall q\, .\,a\le q\lor a\le\neg q$, since one of $q$ and $\neg q$ is true and $a$ entails it; (ii) $\neg\Diamond a\to\forall q\, .\,a\le q\lor a\le\neg q$, since then $a=\bot\le q$. So $(\Diamond a\to L(a))\to\forall q\, .\,a\le q\lor a\le\neg q$ is a theorem; necessitating it and applying K gives $\Box\forall q\, .\,a\le q\lor a\le\neg q$. With $a$ true, $a$ witnesses Strong Actuality.

## Notes

Given the collapse principle, the Actuality witness is necessarily either the least truth or impossible, and either way necessarily settles every proposition (Cian Dorr's observation). Every action model whose actual world is isolated satisfies the collapse principle, so this settles Strong Actuality in all of them.

## Sources

- **Dorr 6 Oct** — Cian Dorr, suggestion of 6 October 2026.
- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, §2.6, p. 42; Appendix E, p. 83.

<p class='cert'>Record: <code>topics/classicism/results/actuality-and-distinctness-preserving-collapse-imply-strong-actuality.yaml</code></p>

## Paper references

- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §2.6, p. 42; Appendix E, p. 83. The distinctness-preserving modality and the collapse principle.
