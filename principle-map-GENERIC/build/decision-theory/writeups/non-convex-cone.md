# Non-convex cone

<p class='cert'>Model — Source: Misc.; produced by Claude Fable 5.1 (Cowork session).</p>

## Package

- **Completeness.** For all p, q ∈ Δ(X): p ≽ q or q ≽ p.
- **Independence.** For all p, q, r ∈ Δ(X) and λ ∈ (0,1]: p ≽ q if and only if λp + (1−λ)r ≽ λq + (1−λ)r.
- **Closed-graph continuity.** The set {(p, q) ∈ Δ(X) × Δ(X) : p ≽ q} is closed in the product topology.
- **¬ Transitivity.** For all p, q, r ∈ Δ(X): if p ≽ q and q ≽ r then p ≽ r.

## Construction

Let X = {a, b, c} and identify a difference q − p of lotteries with the
point (q(a) − p(a), q(b) − p(b)) ∈ ℝ². Let C ⊆ ℝ² be the closed upper
half-plane together with the closed sector of directions [225°, 270°],
and define q ≽ p iff q − p ∈ C.

Completeness: C ∪ (−C) = ℝ² since −C contains the closed lower
half-plane. Independence: mixing both sides with r multiplies the
difference by λ > 0, and C is a cone. Closed graph: (p, q) ↦ q − p is
continuous and C is closed. Reflexivity: 0 ∈ C.

Transitivity fails: take x at direction 240° and y at direction 170°,
both in C and small enough that p, q = p + x… are lotteries; x + y has
direction ≈ 205°, which is not in C. So with q − p = x and r − q = y we
have q ≽ p and r ≽ q but not r ≽ p.

## Notes

Sanity-checked numerically in checks/countermodels.py (completeness and independence hold, transitivity fails on random samples). Not yet checked by a human. Any non-convex closed cone C with C ∪ −C = ℝ² works.

<p class='cert'>Record: <code>topics/decision-theory/models/non-convex-cone.yaml</code></p>
