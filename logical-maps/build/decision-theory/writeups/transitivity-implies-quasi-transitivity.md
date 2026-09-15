# Transitivity ⇒ Quasi-transitivity

<p class='cert'>Result — Source: Misc.; produced by Claude Fable 5.1 (Cowork session).</p>

## Premises

- **Transitivity.** For all $p, q, r \in \Delta (X)$: if $p \succeq q$ and $q \succeq r$ then $p \succeq r$.

## Conclusion

- **Quasi-transitivity.** Strict preference is transitive: if $p \succ q$ and $q \succ r$ then $p \succ r$.

## Proof

Let $p \succ q \succ r$. Then $p \succeq q \succeq r$, so $p \succeq r$. If also $r \succeq p$ then $r \succeq p \succeq q$
gives $r \succeq q$, contradicting $q \succ r$. So $p \succ r$.

<p class='cert'>Record: <code>topics/decision-theory/results/transitivity-implies-quasi-transitivity.yaml</code></p>
