# Weighted utility

<p class='cert'>Model — Source: Misc.; produced by literature.</p>

## Package

- **Completeness.** For all p, q ∈ Δ(X): p ≽ q or q ≽ p.
- **Transitivity.** For all p, q, r ∈ Δ(X): if p ≽ q and q ≽ r then p ≽ r.
- **Closed-graph continuity.** The set {(p, q) ∈ Δ(X) × Δ(X) : p ≽ q} is closed in the product topology.
- **Betweenness.** For all p, q ∈ Δ(X) and λ ∈ (0,1): if p ≻ q then p ≻ λp + (1−λ)q ≻ q, and if p ~ q then p ~ λp + (1−λ)q.
- **¬ Independence.** For all p, q, r ∈ Δ(X) and λ ∈ (0,1]: p ≽ q if and only if λp + (1−λ)r ≽ λq + (1−λ)r.

## Construction

Weighted utility. Fix u : X → ℝ and a weight w : X → (0,∞) that is not
constant, and let V(p) = Σ p(x)w(x)u(x) / Σ p(x)w(x); put p ≽ q iff
V(p) ≥ V(q). V is continuous on Δ(X), so ≽ is a weak order with closed
graph. Its indifference sets are the intersections of Δ(X) with
hyperplanes {p : Σ p(x)w(x)(u(x) − v) = 0}, which are straight, so
betweenness holds. Since w is not constant these hyperplanes are not
parallel, so ≽ is not an expected-utility order and (being a continuous
weak order) must violate independence.

## Sources

- Chew (1983), A generalization of the quasilinear mean with applications to the measurement of income inequality and decision theory resolving the Allais paradox, Econometrica 51
- Dekel (1986), An axiomatic characterization of preferences under uncertainty: weakening the independence axiom, JET 40

<p class='cert'>Record: <code>topics/decision-theory/models/weighted-utility.yaml</code></p>
