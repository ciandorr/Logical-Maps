# Expected multi-utility representation ⇒ Independence

<p class='cert'>Result — Source: Misc.; produced by Claude Fable 5.1 (Cowork session).</p>

## Premises

- **Expected multi-utility representation.** There is a set U of functions $u : X \to \mathbb{R}$ such that for all $p, q \in \Delta (X): p \succeq q$ if and only if $\operatorname{EU}_u(p) \ge \operatorname{EU}_u(q)$ for every $u \in U$.

## Conclusion

- **Independence.** For all $p, q, r \in \Delta (X)$ and $\lambda \in (0,1]: p \succeq q$ if and only if $\lambda p + (1- \lambda )r \succeq \lambda q + (1- \lambda )r$.

## Proof

$\operatorname{EU}_u$ is affine in mixtures, so for $\lambda \in (0,1]$:
$\operatorname{EU}_u(\lambda p+(1- \lambda )r) - \operatorname{EU}_u(\lambda q+(1- \lambda )r) = \lambda (\operatorname{EU}_u(p) - \operatorname{EU}_u(q))$,
which is $\ge 0$ iff $\operatorname{EU}_u(p) \ge \operatorname{EU}_u(q)$. Quantify over $u \in U$.

<p class='cert'>Record: <code>topics/decision-theory/results/multi-utility-implies-independence.yaml</code></p>
