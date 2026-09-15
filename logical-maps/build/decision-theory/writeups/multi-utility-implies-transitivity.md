# Expected multi-utility representation ⇒ Transitivity

<p class='cert'>Result — Source: Misc.; produced by Claude Fable 5.1 (Cowork session).</p>

## Premises

- **Expected multi-utility representation.** There is a set U of functions $u : X \to \mathbb{R}$ such that for all $p, q \in \Delta (X): p \succeq q$ if and only if $\operatorname{EU}_u(p) \ge \operatorname{EU}_u(q)$ for every $u \in U$.

## Conclusion

- **Transitivity.** For all $p, q, r \in \Delta (X)$: if $p \succeq q$ and $q \succeq r$ then $p \succeq r$.

## Proof

If $\operatorname{EU}_u(p) \ge \operatorname{EU}_u(q)$ and $\operatorname{EU}_u(q) \ge \operatorname{EU}_u(r)$ for every $u \in U$ then
$\operatorname{EU}_u(p) \ge \operatorname{EU}_u(r)$ for every $u \in U$.

<p class='cert'>Record: <code>topics/decision-theory/results/multi-utility-implies-transitivity.yaml</code></p>
