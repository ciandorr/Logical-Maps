# Semiorder

<p class='cert'>Model — Source: Misc.; produced by Claude Fable 5.1 (Cowork session).</p>

## Package

- **Completeness.** For all $p, q \in \Delta (X): p \succeq q$ or $q \succeq p$.
- **Quasi-transitivity.** Strict preference is transitive: if $p \succ q$ and $q \succ r$ then $p \succ r$.
- **Closed-graph continuity.** The set $\{(p, q) \in \Delta (X) \times \Delta (X) : p \succeq q\}$ is closed in the product topology.
- **¬ Transitivity.** For all $p, q, r \in \Delta (X)$: if $p \succeq q$ and $q \succeq r$ then $p \succeq r$.
- **¬ Independence.** For all $p, q, r \in \Delta (X)$ and $\lambda \in (0,1]: p \succeq q$ if and only if $\lambda p + (1- \lambda )r \succeq \lambda q + (1- \lambda )r$.

## Construction

A semiorder with a just-noticeable difference. Fix $u : X \to \mathbb{R}$ non-constant
and $\epsilon > 0$, and let $p \succeq q$ iff $\operatorname{EU}_u(p) \ge \operatorname{EU}_u(q) - \epsilon . \operatorname{Completeness}$: one of
the two differences is $\ge 0 > - \epsilon$. Quasi-transitivity: $p \succ q$ iff
$\operatorname{EU}_u(p) > \operatorname{EU}_u(q) + \epsilon$, and this is transitive. Closed graph: the graph is
the preimage of $[- \epsilon , \infty )$ under a continuous map. Transitivity fails: pick
p, q, r with $\operatorname{EU}_u$ equal to $0, - 0.8\epsilon , - 1.6\epsilon$; then $p \succeq q \succeq r$ but not $p \succeq r$.

## Notes

Sanity-checked numerically in checks/countermodels.py. The relation is Luce's semiorder; the verification that it fits this framework is AI-produced and unchecked.

## Sources

- Luce (1956), Semiorders and a theory of utility discrimination, Econometrica 24

<p class='cert'>Record: <code>topics/decision-theory/models/semiorder.yaml</code></p>
