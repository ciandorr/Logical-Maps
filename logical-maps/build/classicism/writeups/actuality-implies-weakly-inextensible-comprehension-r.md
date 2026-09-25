# Actuality ⇒ Weakly Inextensible Comprehension

<p class='cert'>Result — Source: Classicism (2024); produced by Andrew Bacon and Cian Dorr; recorded by OpenAI Codex (GPT-6), 17 September 2026; conclusion corrected by Claude Fable 5.1 (Anthropic), 25 September 2026.</p>

## Premises

- **Actuality.** There is a true proposition that entails every true proposition.

## Conclusion

- **Weakly Inextensible Comprehension.** Every relation, including a proposition, is coextensive with a weakly inextensible one.

## Proof

Let $w$ witness Actuality and put $Y:=\lambda\bar z\, .\,w\land X[\bar z]$. Since $w$ is true, $Y$ is coextensive with $X$. For weak inextensibility, suppose $\forall\bar z\, .\,Y[\bar z]\to\Box Z[\bar z]$. By T, $\forall\bar z\, .\,w\land X[\bar z]\to Z[\bar z]$ is true, so $w$ entails it: $\Box(w\to\forall\bar z\, .\,w\land X[\bar z]\to Z[\bar z])$. The formula in the box is H-equivalent to $\forall\bar z\, .\,w\land X[\bar z]\to Z[\bar z]$, so by Logical Equivalence they are the same proposition, and $\Box\forall\bar z\, .\,Y[\bar z]\to Z[\bar z]$, which is $Y\le Z$. The box in the antecedent is not used: every relation that actually includes $Y$ is entailed by $Y$.

## Notes

The argument establishes weak inextensibility at the world of evaluation only. It does not give Inextensible Comprehension, whose witness must be weakly inextensible at every world: at a world where $w$ is false but still possible, $\lambda\bar z\, .\,w\land X[\bar z]$ has no instances, so inextensibility there would need it to entail $\bot$, which fails whenever $w\land\exists\bar z\, .\,X[\bar z]$ is possible there. Under C5 the gap closes by Proposition 2.10, and it also closes under Distinctness-preserving collapse; see the recorded results. Whether Actuality alone implies Inextensible Comprehension is open.

## Revisions

- **2026-09-25** (Claude Fable 5.1 (Anthropic), at Cian Dorr's direction) — Corrected the conclusion from Inextensible Comprehension to Weakly Inextensible Comprehension, which is what the recorded argument proves; the record was previously filed as actuality-implies-inextensible-comprehension-r. Rewrote the proof to make the single step explicit and noted why the boxed principle does not follow from it.

## Sources

- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, §2.3, n. 38, p. 29.

<p class='cert'>Record: <code>topics/classicism/results/actuality-implies-weakly-inextensible-comprehension-r.yaml</code></p>

## Paper references

- **Proof: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §2.3, n. 38, p. 29
