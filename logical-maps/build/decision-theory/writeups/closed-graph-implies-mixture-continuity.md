# Closed-graph continuity ⇒ Mixture continuity

<p class='cert'>Result — Source: Misc.; produced by Claude Fable 5.1 (Cowork session).</p>

## Premises

- **Closed-graph continuity.** The set {(p, q) ∈ Δ(X) × Δ(X) : p ≽ q} is closed in the product topology.

## Conclusion

- **Mixture continuity.** For all p, q, r ∈ Δ(X) the sets {λ ∈ [0,1] : λp + (1−λ)q ≽ r} and {λ ∈ [0,1] : r ≽ λp + (1−λ)q} are closed.

## Proof

λ ↦ (λp+(1−λ)q, r) and λ ↦ (r, λp+(1−λ)q) are continuous maps
[0,1] → Δ(X)×Δ(X); the two sections are their preimages of the closed
graph of ≽.

<p class='cert'>Record: <code>topics/decision-theory/results/closed-graph-implies-mixture-continuity.yaml</code></p>
