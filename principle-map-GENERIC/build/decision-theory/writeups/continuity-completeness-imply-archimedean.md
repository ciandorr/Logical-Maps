# Mixture continuity ∧ Completeness ⇒ Archimedean

<p class='cert'>Result — Source: Misc.; produced by Claude Fable 5.1 (Cowork session).</p>

## Premises

- **Mixture continuity.** For all p, q, r ∈ Δ(X) the sets {λ ∈ [0,1] : λp + (1−λ)q ≽ r} and {λ ∈ [0,1] : r ≽ λp + (1−λ)q} are closed.
- **Completeness.** For all p, q ∈ Δ(X): p ≽ q or q ≽ p.

## Conclusion

- **Archimedean.** For all p, q, r ∈ Δ(X): if p ≻ q ≻ r then there are α, β ∈ (0,1) with αp + (1−α)r ≻ q and q ≻ βp + (1−β)r.

## Proof

Let p ≻ q ≻ r and set A = {λ : λp+(1−λ)r ≽ q}, B = {λ : q ≽ λp+(1−λ)r}.
Both are closed by continuity and A ∪ B = [0,1] by completeness. Since
1 ∉ B (as p ≻ q) and [0,1]∖B is open, some interval (1−ε, 1] lies in
[0,1]∖B ⊆ A; any α in it with α < 1 gives αp+(1−α)r ≻ q. Symmetrically,
0 ∉ A (as q ≻ r) yields [0, ε) ⊆ B∖A and any β in it with β > 0 gives
q ≻ βp+(1−β)r.

## Notes

Completeness is used to conclude λ ∈ A from λ ∉ B; whether continuity alone suffices is left open here.

<p class='cert'>Record: <code>topics/decision-theory/results/continuity-completeness-imply-archimedean.yaml</code></p>
