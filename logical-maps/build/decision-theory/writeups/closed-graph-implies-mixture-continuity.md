# Closed-graph continuity ⇒ Mixture continuity

<p class='cert'>Result — Source: Misc.; produced by Claude Fable 5.1 (Cowork session).</p>

## Premises

- **Closed-graph continuity.** The set $\{(p, q) \in \Delta (X) \times \Delta (X) : p \succeq q\}$ is closed in the product topology.

## Conclusion

- **Mixture continuity.** For all $p, q, r \in \Delta (X)$ the sets $\{\lambda \in [0,1] : \lambda p + (1- \lambda )q \succeq r\}$ and $\{\lambda \in [0,1] : r \succeq \lambda p + (1- \lambda )q\}$ are closed.

## Proof

$\lambda$ ↦ $(\lambda p+(1- \lambda )q, r)$ and $\lambda$ ↦ $(r, \lambda p+(1- \lambda )q)$ are continuous maps
$[0,1] \to \Delta (X)\times \Delta (X)$; the two sections are their preimages of the closed
graph of $\succeq$.

<p class='cert'>Record: <code>topics/decision-theory/results/closed-graph-implies-mixture-continuity.yaml</code></p>
