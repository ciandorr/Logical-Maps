# Strong Possibility (pure) ∧ Infinity Schema (type e) ⇒ ⊥

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.strong_possibility_and_infinity_e_incompatible`; produced by Cian Dorr, 16 October 2026; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 16 October 2026.</p>

## Premises

- **Strong Possibility (pure).** Each closed pure sentence consistent with Maximalist Classicism is possible under the distinctness-preserving modality.
- **Infinity Schema (type e).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.

## Conclusion

- **⊥.** These premises cannot all hold together.

## Proof

Let $E_1:=\forall x^e y^e\, .\,x=y$, that there is exactly one individual. Lemma (a theorem of C): $\Diamond_{\ne}E_1\to E_1$. If $a\ne b$, the true proposition $r:=(a\ne b)$ has $\Box(\Diamond r\to \neg E_1)$, since by NI $\Diamond(a\ne b)$ implies $a\ne b$; so $\Box_{\ne}\neg E_1$, which is $\neg\Diamond_{\ne}E_1$. Now $E_1$ is a closed pure sentence consistent with Maximalist Classicism: at the root of coalesced-single-individual-root, Maximalism (pure) holds and there is one individual. So Strong Possibility (pure) gives $\Diamond_{\ne}E_1$, hence $E_1$, which contradicts the instance $\exists x_1x_2\, .\,x_1\ne x_2$ of the Infinity Schema (type e).

## Notes

Strong Possibility (pure) thus implies that there is exactly one individual, though no principle of the map says so; with it, it is incompatible with every principle implying the Infinity Schema at type e.

## Sources

- **Dorr 16 Oct** — Cian Dorr, suggestion of 16 October 2026.

<p class='cert'>Record: <code>topics/classicism/results/strong-possibility-and-infinity-e-incompatible.yaml</code></p>

## Paper references

- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §2.6, p. 42. Strong Possibility and the distinctness-preserving modality.
