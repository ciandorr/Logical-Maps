# B for sentences of Σ ∧ Witnessed Possibility ⇒ False (⊥)

<p class='cert'>Result — Source: Misc.; produced by Cian Dorr, suggestion of 22 September 2026; proof written out by Claude Fable 5.1 (Anthropic), 22 September 2026; recorded by Claude Fable 5.1 (Anthropic), 22 September 2026.</p>

## Premises

- **B for sentences of Σ.** The B instance for every closed sentence of the language of the fixed signature Sigma.
- **Witnessed Possibility.** For pure-formulas P with free variables among a finite tuple x, and distinct matching nonlogical constants c, a witness to P entails that P at those constants is possible.

## Conclusion

- **False (⊥).** These premises cannot all hold together.

## Proof

Let $c$ be a constant of $\Sigma$ of relational type $\tau$. Witnessed Possibility gives $\Diamond(c=\top_\tau)$ and $\Diamond(c\ne\top_\tau)$. If $c=\top_\tau$, NI gives $\Box(c=\top_\tau)$, contradicting $\Diamond(c\ne\top_\tau)$. If $c\ne\top_\tau$, B for the closed $\Sigma$-sentence $c\ne\top_\tau$ gives $\Box\Diamond(c\ne\top_\tau)$; but $\Diamond(c=\top_\tau)$ supplies a possibility at which $c=\top_\tau$, hence by NI $\Box(c=\top_\tau)$ there, so $\neg\Diamond(c\ne\top_\tau)$ there, contradicting $\Box\Diamond(c\ne\top_\tau)$.

## Notes

Formalizes Bacon’s n. 32 with the top element in place of his interpretations of F, so that only one constant of relational type is needed. Compare the recorded incompatibility of Witnessed Possibility with ND, which uses B at the level of propositions through Prior’s argument; here only the sentence instances for Σ are used.

## Sources

- **Dorr 22 Sep** — Cian Dorr, suggestion of 22 September 2026; proof as recorded.
- **Logical Combinatorialism** — Andrew Bacon, Logical Combinatorialism, Philosophical Review 129 (2020), §3, n. 32, p. 556.

<p class='cert'>Record: <code>topics/classicism/results/signature-b-and-witnessed-possibility-incompatible.yaml</code></p>

## Paper references

- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §2.2, p. 27; §2.5, n. 57, p. 38
- **Origin: Logical Combinatorialism.** Bacon, Andrew (2020). Logical Combinatorialism. Philosophical Review 129(4), 537–589. As cited in Classicism, §§2.5 and 3.5. Read directly for the import of 22 September 2026; section, footnote and page locators refer to the published pagination. — §3, n. 32, p. 556. Bacon: B is undermined by the analogy with logical truth independently of contingent distinctness, since for a nonlogical predicate F neither ◇∃xFx nor ◇¬∃xFx is a logical truth, while B would make one of them necessary.
