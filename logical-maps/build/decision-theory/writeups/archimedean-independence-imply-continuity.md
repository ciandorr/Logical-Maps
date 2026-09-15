# Transitivity ∧ Independence ∧ Archimedean ⇒ Mixture continuity

<p class='cert'>Conjecture — Source: Misc.; produced by Claude Fable 5.1 (Cowork session).</p>

## Premises

- **Transitivity.** For all $p, q, r \in \Delta (X)$: if $p \succeq q$ and $q \succeq r$ then $p \succeq r$.
- **Independence.** For all $p, q, r \in \Delta (X)$ and $\lambda \in (0,1]: p \succeq q$ if and only if $\lambda p + (1- \lambda )r \succeq \lambda q + (1- \lambda )r$.
- **Archimedean.** For all $p, q, r \in \Delta (X)$: if $p \succ q \succ r$ then there are $\alpha , \beta \in (0,1)$ with $\alpha p + (1- \alpha )r \succ q$ and $q \succ \beta p + (1- \beta )r$.

## Conclusion

- **Mixture continuity.** For all $p, q, r \in \Delta (X)$ the sets $\{\lambda \in [0,1] : \lambda p + (1- \lambda )q \succeq r\}$ and $\{\lambda \in [0,1] : r \succeq \lambda p + (1- \lambda )q\}$ are closed.

## Notes

Known with completeness added (Jensen 1967). Without it the cone $K = \{q - p : q \succeq p\}$ is convex; the question is whether the Archimedean axiom forces it to be closed.

<p class='cert'>Record: <code>topics/decision-theory/results/archimedean-independence-imply-continuity.yaml</code></p>
