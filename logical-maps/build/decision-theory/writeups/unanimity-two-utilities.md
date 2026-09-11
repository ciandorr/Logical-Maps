# Unanimity over two utilities

<p class='cert'>Model — Source: Misc.; produced by literature.</p>

## Package

- **Transitivity.** For all p, q, r ∈ Δ(X): if p ≽ q and q ≽ r then p ≽ r.
- **Independence.** For all p, q, r ∈ Δ(X) and λ ∈ (0,1]: p ≽ q if and only if λp + (1−λ)r ≽ λq + (1−λ)r.
- **Closed-graph continuity.** The set {(p, q) ∈ Δ(X) × Δ(X) : p ≽ q} is closed in the product topology.
- **Expected multi-utility representation.** There is a set U of functions u : X → ℝ such that for all p, q ∈ Δ(X): p ≽ q if and only if EU_u(p) ≥ EU_u(q) for every u ∈ U.
- **¬ Completeness.** For all p, q ∈ Δ(X): p ≽ q or q ≽ p.

## Construction

Unanimity over two utilities. With X = {a, b, c} let p ≽ q iff
p(a) ≥ q(a) and p(b) ≥ q(b) (U = {u₁, u₂} with u₁ = 1_a, u₂ = 1_b).
This is an expected multi-utility representation, hence transitive,
independent and closed-graph continuous; but δ_a and δ_b are
incomparable.

## Sources

- Aumann (1962), Utility theory without the completeness axiom, Econometrica 30
- Dubra, Maccheroni & Ok (2004), JET 115

<p class='cert'>Record: <code>topics/decision-theory/models/unanimity-two-utilities.yaml</code></p>
