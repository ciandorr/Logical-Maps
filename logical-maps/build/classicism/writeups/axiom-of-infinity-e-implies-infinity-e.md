# Axiom of Infinity (type e) ⇒ Infinity Schema (type e)

<p class='cert'>Result — Source: Misc.; produced by Claude Opus 5 (Anthropic), 19 September 2026, from the formulation suggested by Cian Dorr; recorded by Claude Opus 5 (Anthropic), 19 September 2026.</p>

## Premises

- **Axiom of Infinity (type e).** There are not finitely many individuals. No finite cardinality holds of the universal property, so the domain of the type cannot be exhausted by finitely many steps from the empty property.

## Conclusion

- **Infinity Schema (type e).** There are arbitrarily many pairwise distinct entities of this fixed type; one sentence for each positive integer n.

## Proof

By contraposition. A routine induction shows that $\operatorname{Suc}_e^{\,k}(\mathbf{0}_e)$ holds of a property exactly when that property has $k$ instances, and that $\operatorname{FiniteCardinality}_e$ holds of it, since any $W$ holding of $\mathbf{0}_e$ and closed under $\operatorname{Suc}_e$ reaches it in $k$ steps. Now suppose the schema's $n$-th instance fails, so there are at most $n-1$ individuals. Then for some $k<n$ there are exactly $k$ of them, and $\operatorname{Suc}_e^{\,k}(\mathbf{0}_e)$ is a finite cardinality holding of $\lambda u\, .\,\top$, which the axiom denies.

## Notes

The converse fails, by a compactness argument that a nonstandard model would witness. The map does not yet record such a model, so the schema-to-axiom direction stays open rather than refuted.

## Sources

- **Dorr 19 Sep** — Cian Dorr, suggestion of 19 September 2026.

<p class='cert'>Record: <code>topics/classicism/results/axiom-of-infinity-e-implies-infinity-e.yaml</code></p>

## Paper references

- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §2.3, n. 47, p. 32
