# Expected multi-utility representation ⇒ Closed-graph continuity

<p class='cert'>Result — Source: Misc.; produced by Claude Fable 5.1 (Cowork session).</p>

## Premises

- **Expected multi-utility representation.** There is a set U of functions $u : X \to \mathbb{R}$ such that for all $p, q \in \Delta (X): p \succeq q$ if and only if $\operatorname{EU}_u(p) \ge \operatorname{EU}_u(q)$ for every $u \in U$.

## Conclusion

- **Closed-graph continuity.** The set $\{(p, q) \in \Delta (X) \times \Delta (X) : p \succeq q\}$ is closed in the product topology.

## Proof

$\{(p,q) : p \succeq q\} =$ ⋂$_{u\in U} \{(p,q) : \operatorname{EU}_u(p) - \operatorname{EU}_u(q) \ge 0\}$, an intersection
of preimages of $[0,\infty )$ under continuous (indeed linear) maps on $\Delta (X)\times \Delta (X)$.

<p class='cert'>Record: <code>topics/decision-theory/results/multi-utility-implies-closed-graph.yaml</code></p>
