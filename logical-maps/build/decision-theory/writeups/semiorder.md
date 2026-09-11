# Semiorder

<p class='cert'>Model — Source: Misc.; produced by Claude Fable 5.1 (Cowork session).</p>

## Package

- **Completeness.** For all p, q ∈ Δ(X): p ≽ q or q ≽ p.
- **Quasi-transitivity.** Strict preference is transitive: if p ≻ q and q ≻ r then p ≻ r.
- **Closed-graph continuity.** The set {(p, q) ∈ Δ(X) × Δ(X) : p ≽ q} is closed in the product topology.
- **¬ Transitivity.** For all p, q, r ∈ Δ(X): if p ≽ q and q ≽ r then p ≽ r.
- **¬ Independence.** For all p, q, r ∈ Δ(X) and λ ∈ (0,1]: p ≽ q if and only if λp + (1−λ)r ≽ λq + (1−λ)r.

## Construction

A semiorder with a just-noticeable difference. Fix u : X → ℝ non-constant
and ε > 0, and let p ≽ q iff EU_u(p) ≥ EU_u(q) − ε. Completeness: one of
the two differences is ≥ 0 > −ε. Quasi-transitivity: p ≻ q iff
EU_u(p) > EU_u(q) + ε, and this is transitive. Closed graph: the graph is
the preimage of [−ε, ∞) under a continuous map. Transitivity fails: pick
p, q, r with EU_u equal to 0, −0.8ε, −1.6ε; then p ≽ q ≽ r but not p ≽ r.

## Notes

Sanity-checked numerically in checks/countermodels.py. The relation is Luce's semiorder; the verification that it fits this framework is AI-produced and unchecked.

## Sources

- Luce (1956), Semiorders and a theory of utility discrimination, Econometrica 24

<p class='cert'>Record: <code>topics/decision-theory/models/semiorder.yaml</code></p>
