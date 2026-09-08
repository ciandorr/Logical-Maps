# Transitivity ∧ Independence ∧ Archimedean ⇒ Mixture continuity

<p class='cert'>Conjecture — Source: Misc.; produced by Claude Fable 5.1 (Cowork session).</p>

## Premises

- **Transitivity.** For all p, q, r ∈ Δ(X): if p ≽ q and q ≽ r then p ≽ r.
- **Independence.** For all p, q, r ∈ Δ(X) and λ ∈ (0,1]: p ≽ q if and only if λp + (1−λ)r ≽ λq + (1−λ)r.
- **Archimedean.** For all p, q, r ∈ Δ(X): if p ≻ q ≻ r then there are α, β ∈ (0,1) with αp + (1−α)r ≻ q and q ≻ βp + (1−β)r.

## Conclusion

- **Mixture continuity.** For all p, q, r ∈ Δ(X) the sets {λ ∈ [0,1] : λp + (1−λ)q ≽ r} and {λ ∈ [0,1] : r ≽ λp + (1−λ)q} are closed.

## Notes

Known with completeness added (Jensen 1967). Without it the cone K = {q − p : q ≽ p} is convex; the question is whether the Archimedean axiom forces it to be closed.

<p class='cert'>Record: <code>topics/decision-theory/results/archimedean-independence-imply-continuity.yaml</code></p>
