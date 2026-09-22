# □ND ∧ Boolean Completeness ⇒ Plenitude

<p class='cert'>Result — Source: Classicism (2024); produced by Andrew Bacon and Cian Dorr; recorded by OpenAI Codex (GPT-6), 17 September 2026.</p>

## Premises

- **□ND.** Every closed instance of ND is necessary. Box the entire object-variable closure; retain the same type range and other schema side conditions.
- **Boolean Completeness.** Every property of entities of a relational type has a greatest lower bound in that type.

## Conclusion

- **Plenitude.** Every total single-valued binary relation is represented by an operation. Its output type is relational, as required by the type system.

## Proof

For functional U with propositional output, take the least upper bound G of all operations X such that Xy entails the unique U-output at y. Fix a and its output p. The operation $\lambda x\, .\,x=a\land p$ lies below G, by ND, so p entails Ga. The operation $\lambda x\, .\,x\ne a\lor p$ is an upper bound of the same family: ND gives the pointwise comparison and BF promotes it to entailment. Therefore Ga entails p. Antisymmetry gives Ga=p. For relational outputs the argument is applied to their finite argument tuples as in the source; all output types are relational.

## Sources

- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, Proposition 2.14, pp. 32–33 and n. 48.

<p class='cert'>Record: <code>topics/classicism/results/c5-and-completeness-imply-plenitude.yaml</code></p>

## Paper references

- **Proof: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — Proposition 2.14, pp. 32–33 and n. 48
