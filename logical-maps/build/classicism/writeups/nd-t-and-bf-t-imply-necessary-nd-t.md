# ND (type t) ∧ BF (type t) ⇒ □ND (type t)

<p class='cert'>Result — Source: Classicism (2024), Lean `Classicism.Map.nd_t_and_bf_t_imply_necessary_nd_t`; produced by Andrew Bacon and Cian Dorr; recorded by Claude Opus 5.5 (Anthropic), 16 October 2026, at Cian Dorr's direction.</p>

## Premises

- **ND (type t).** Distinct propositions are necessarily distinct.
- **BF (type t).** If every proposition necessarily has a property, then necessarily every proposition has it.

## Conclusion

- **□ND (type t).** Necessarily, distinct propositions are necessarily distinct.

## Proof

The proof of Proposition 2.4 at type $t$. For propositions $p,q$, the classical identity cases, NI and ND (type t) give $\Box(p=q)\lor\Box(p\ne q)$. Using 4, strengthen the second disjunct to $\Box\Box(p\ne q)$; normal modal reasoning yields $\Box(p=q\lor\Box(p\ne q))$, equivalently $\Box(p\ne q\to\Box(p\ne q))$. Generalize over $q$ and apply BF (type t) with $X:=\lambda q\, .\,(p\ne q\to\Box(p\ne q))$, then generalize over $p$ and apply it again with $X:=\lambda p\, .\,\forall q\, .\,(p\ne q\to\Box(p\ne q))$, both of type $t\to t$. The result is the boxed closed instance of ND (type t).

## Notes

The type-$t$ counterpart of nd-and-bf-imply-necessary-nd, which the engine cannot instantiate on its own.

## Sources

- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, Proposition 2.4, p. 23.

<p class='cert'>Record: <code>topics/classicism/results/nd-t-and-bf-t-imply-necessary-nd-t.yaml</code></p>

## Paper references

- **Proof: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — Proposition 2.4, p. 23. The source states and proves the result across the relational types; this is its type-$t$ instance, whose proof uses BF and ND at type $t$ only.
