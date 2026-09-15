# Completeness ∧ Closed-graph continuity ∧ Betweenness ⇒ Transitivity

<p class='cert'>Conjecture — Source: Misc.; produced by ZG.</p>

## Premises

- **Completeness.** For all $p, q \in \Delta (X): p \succeq q$ or $q \succeq p$.
- **Closed-graph continuity.** The set $\{(p, q) \in \Delta (X) \times \Delta (X) : p \succeq q\}$ is closed in the product topology.
- **Betweenness.** For all $p, q \in \Delta (X)$ and $\lambda \in (0,1)$: if $p \succ q$ then $p \succ \lambda p + (1- \lambda )q \succ q$, and if $p \sim q$ then $p \sim \lambda p + (1- \lambda )q$.

## Conclusion

- **Transitivity.** For all $p, q, r \in \Delta (X)$: if $p \succeq q$ and $q \succeq r$ then $p \succeq r$.

## Notes

Sample conjecture.

<p class='cert'>Record: <code>topics/decision-theory/results/betweenness-continuity-imply-transitivity.yaml</code></p>
