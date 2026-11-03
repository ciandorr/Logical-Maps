# Strong Possibility (pure) ∧ Two-hat necessities are ND-necessary ⇒ ⊥

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.strong_possibility_and_two_hat_implies_nd_incompatible`; produced by Cian Dorr, 16 October 2026; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 16 October 2026.</p>

## Premises

- **Strong Possibility (pure).** Each closed pure sentence consistent with Maximalist Classicism is possible under the distinctness-preserving modality.
- **Two-hat necessities are ND-necessary.** Whatever is two-hat necessary is ND-necessary: the distinctness-preserving modality agrees with its hat.

## Conclusion

- **⊥.** These premises cannot all hold together.

## Proof

Let $E_1:=\forall x^e y^e\, .\,x=y$ and $T_2:=\exists x^e y^e\, .\,x\ne y$. As in strong-possibility-and-infinity-e-incompatible, $\Diamond_{\ne}E_1\to E_1$ is a theorem of C, and Strong Possibility (pure) gives $E_1$. $T_2$ is also consistent with Maximalist Classicism, being true at the root of coalesced-maximalist-root, where Maximalism (pure) holds; so Strong Possibility gives $\Diamond_{\ne}T_2$. Two-hat necessity implying ND-necessity is, contraposed, $\Diamond_{\ne}p\to \hat{\hat\Diamond}p$, so $\hat{\hat\Diamond}T_2$. Unfolding the hat, $\hat{\hat\Diamond}p$ is $\forall q\, .\,q\to\Diamond(\Diamond_{\ne}q\land p)$; at the truth $q:=E_1$ this gives $\Diamond(\Diamond_{\ne}E_1\land T_2)$. By the necessitated lemma, $\Diamond(E_1\land T_2)$, which is $\Diamond\bot$.

## Notes

The hat and two-hat necessity are as in Background, Hats, two-hat necessity and 5-necessity.

## Sources

- **Dorr 16 Oct** — Cian Dorr, suggestion of 16 October 2026.

<p class='cert'>Record: <code>topics/classicism/results/strong-possibility-and-two-hat-implies-nd-incompatible.yaml</code></p>

## Paper references

- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §2.6, p. 42. Strong Possibility and the distinctness-preserving modality.
