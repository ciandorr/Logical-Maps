# Transitivity ⇒ Quasi-transitivity

<p class='cert'>Result — Source: Misc.; produced by Claude Fable 5.1 (Cowork session).</p>

## Premises

- **Transitivity.** For all p, q, r ∈ Δ(X): if p ≽ q and q ≽ r then p ≽ r.

## Conclusion

- **Quasi-transitivity.** Strict preference is transitive: if p ≻ q and q ≻ r then p ≻ r.

## Proof

Let p ≻ q ≻ r. Then p ≽ q ≽ r, so p ≽ r. If also r ≽ p then r ≽ p ≽ q
gives r ≽ q, contradicting q ≻ r. So p ≻ r.

<p class='cert'>Record: <code>topics/decision-theory/results/transitivity-implies-quasi-transitivity.yaml</code></p>
