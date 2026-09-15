# Transitivity ∧ Independence ∧ Closed-graph continuity ⇒ Expected multi-utility representation

<p class='cert'>Result — Source: Misc.; produced by literature.</p>

## Premises

- **Transitivity.** For all $p, q, r \in \Delta (X)$: if $p \succeq q$ and $q \succeq r$ then $p \succeq r$.
- **Independence.** For all $p, q, r \in \Delta (X)$ and $\lambda \in (0,1]: p \succeq q$ if and only if $\lambda p + (1- \lambda )r \succeq \lambda q + (1- \lambda )r$.
- **Closed-graph continuity.** The set $\{(p, q) \in \Delta (X) \times \Delta (X) : p \succeq q\}$ is closed in the product topology.

## Conclusion

- **Expected multi-utility representation.** There is a set U of functions $u : X \to \mathbb{R}$ such that for all $p, q \in \Delta (X): p \succeq q$ if and only if $\operatorname{EU}_u(p) \ge \operatorname{EU}_u(q)$ for every $u \in U$.

## Proof

Dubra–Maccheroni–Ok, Theorem 1, for compact metric X (finite X is a
special case): a reflexive transitive relation on $\Delta (X)$ satisfying
independence and closed-graph continuity has an expected multi-utility
representation. The proof identifies $\succeq$ with a closed convex cone of
signed measures and takes U to be the dual cone.

## Notes

Reflexivity is a standing assumption of the framework.

## Sources

- Dubra, Maccheroni & Ok (2004), Expected utility theory without the completeness axiom, JET 115, Theorem 1

<p class='cert'>Record: <code>topics/decision-theory/results/dmo-theorem.yaml</code></p>
