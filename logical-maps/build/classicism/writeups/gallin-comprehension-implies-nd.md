# Gallin Extensional Comprehension ⇒ ND

<p class='cert'>Result — Source: Misc.; produced by Cian Dorr, 20 September 2026; recorded by Claude Opus 5 (Anthropic), 20 September 2026.</p>

## Premises

- **Gallin Extensional Comprehension.** Every relation is coextensive with one that is persistent and has a persistent pointwise negation. This is the source’s comparison with Gallin’s different rigidity convention.

## Conclusion

- **ND.** Distinct things of any type are necessarily distinct.

## Proof

Fix a type $\sigma$ and $a,b^\sigma$ with $a\ne b$, and apply Gallin Extensional Comprehension to $\lambda x^\sigma\, .\,x=a$, whose type $\sigma t$ is admitted at every $\sigma$. Let $Y$ be the coextension supplied, with $Y$ and $\neg Y$ both persistent. Since $a=a$, coextensiveness gives $Ya$, and persistence of $Y$ gives $\Box Ya$. Since $b\ne a$, coextensiveness gives $\neg Yb$, and persistence of $\neg Y$ gives $\Box\neg Yb$. So $\Box(Ya\land\neg Yb)$. By Leibniz's law $a=b$ would make $Ya$ and $Yb$ agree, so $Ya\land\neg Yb$ entails $a\ne b$; that entailment is a theorem, so it necessitates and $\Box(a\ne b)$ follows. The type $\sigma$ was arbitrary, which is the whole schema.

## Notes

Only persistence of the coextension and of its pointwise negation is used, and only at the actual world, so no modal axiom beyond the background is needed. Persistence alone would not do. What forces the necessary distinctness is that the negation is persistent too, which pins the non-instances down as firmly as the instances.

## Sources

- **Dorr 20 Sep** — Cian Dorr, proof of 20 September 2026.
- **Classicism** — Andrew Bacon and Cian Dorr, Classicism, draft of 16 May 2023, §2.3, n. 37, p. 28.

<p class='cert'>Record: <code>topics/classicism/results/gallin-comprehension-implies-nd.yaml</code></p>

## Paper references

- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §2.3, n. 37, p. 28. Formulation of the Gallin convention. The draft compares the two rigidity conventions but does not draw this consequence.
