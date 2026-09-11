# Quasi-transitivity ⇒ Acyclicity

<p class='cert'>Result — Source: Misc.; produced by Claude Fable 5.1 (Cowork session).</p>

## Premises

- **Quasi-transitivity.** Strict preference is transitive: if p ≻ q and q ≻ r then p ≻ r.

## Conclusion

- **Acyclicity.** There is no finite cycle of strict preferences p₁ ≻ p₂ ≻ … ≻ pₙ ≻ p₁.

## Proof

If p₁ ≻ p₂ ≻ … ≻ pₙ ≻ p₁ then by induction on n, transitivity of ≻ gives
p₁ ≻ pₙ, and with pₙ ≻ p₁ this contradicts asymmetry of ≻.

<p class='cert'>Record: <code>topics/decision-theory/results/quasi-transitivity-implies-acyclicity.yaml</code></p>
