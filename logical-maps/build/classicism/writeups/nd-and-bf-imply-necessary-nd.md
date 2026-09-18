# ND ∧ BF ⇒ □ND

<p class='cert'>Result — Source: Classicism (2023 draft); produced by Andrew Bacon and Cian Dorr; recorded by OpenAI Codex (GPT-6), 17 September 2026.</p>

## Premises

- **ND.** Distinct things of any type are necessarily distinct.
- **BF.** The Barcan Formula at every type. The predicate formulation closes the formula schema using lambda abstraction.

## Conclusion

- **□ND.** Every closed instance of ND is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.

## Proof

For arbitrary x,y, classical identity cases, NI and ND give $\Box(x=y)\lor\Box(x\ne y)$. Using 4, strengthen the second disjunct to $\Box\Box(x\ne y)$. Normal modal reasoning yields $\Box(x=y\lor\Box(x\ne y))$, equivalently $\Box(x\ne y\to\Box(x\ne y))$. Generalize over x,y and apply BF twice to box the entire universal closure. Repeat at each type.

## Sources

- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, Proposition 2.4, p. 23.

<p class='cert'>Record: <code>topics/classicism/results/nd-and-bf-imply-necessary-nd.yaml</code></p>

## Paper references

- **Proof: Classicism.** Bacon, Andrew, and Cian Dorr. Classicism. Draft dated 16 May 2023, 87 pages. All page, proposition and footnote locators in this map refer to this draft. — Proposition 2.4, p. 23
