# Quasi-transitivity ⇒ Acyclicity

<p class='cert'>Result — Source: Misc.; produced by Claude Fable 5.1 (Cowork session).</p>

## Premises

- **Quasi-transitivity.** Strict preference is transitive: if $p \succ q$ and $q \succ r$ then $p \succ r$.

## Conclusion

- **Acyclicity.** There is no finite cycle of strict preferences $p_{1} \succ p_{2} \succ \ldots \succ p_{n} \succ p_{1}$.

## Proof

If $p_{1} \succ p_{2} \succ \ldots \succ p_{n} \succ p_{1}$ then by induction on n, transitivity of $\succ$ gives
$p_{1} \succ p_{n}$, and with $p_{n} \succ p_{1}$ this contradicts asymmetry of $\succ$.

<p class='cert'>Record: <code>topics/decision-theory/results/quasi-transitivity-implies-acyclicity.yaml</code></p>
