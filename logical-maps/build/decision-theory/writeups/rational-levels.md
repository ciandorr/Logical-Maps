# Rational levels

<p class='cert'>Model — Source: Misc.; produced by Claude Fable 5.1 (Cowork session).</p>

## Package

- **Completeness.** For all p, q ∈ Δ(X): p ≽ q or q ≽ p.
- **Transitivity.** For all p, q, r ∈ Δ(X): if p ≽ q and q ≽ r then p ≽ r.
- **Archimedean.** For all p, q, r ∈ Δ(X): if p ≻ q ≻ r then there are α, β ∈ (0,1) with αp + (1−α)r ≻ q and q ≻ βp + (1−β)r.
- **¬ Mixture continuity.** For all p, q, r ∈ Δ(X) the sets {λ ∈ [0,1] : λp + (1−λ)q ≽ r} and {λ ∈ [0,1] : r ≽ λp + (1−λ)q} are closed.

## Construction

Let X = {a, b, c} and define a three-valued function V on Δ(X):
V(p) = 2 if p(a) ∈ ℚ; V(p) = 1 if p(a) ∉ ℚ and p(b) ∈ ℚ; V(p) = 0
otherwise. Let p ≽ q iff V(p) ≥ V(q). This is a weak order.

Mixture continuity fails: along the line from δ_a to δ_b the mixture
λδ_a + (1−λ)δ_b has V = 2 exactly when λ ∈ ℚ, so
{λ : λδ_a + (1−λ)δ_b ≽ δ_c} = ℚ ∩ [0,1] is not closed.

Archimedean holds: a chain p ≻ q ≻ r forces V(p) = 2, V(q) = 1, V(r) = 0,
so p(a) ∈ ℚ and r(a) ∉ ℚ, in particular p(a) ≠ r(a). Along
m(α) = αp + (1−α)r the coordinate m(α)(a) = r(a) + α(p(a) − r(a)) is
rational for a dense set of α, so some α ∈ (0,1) close to 1 has
V(m(α)) = 2 > V(q). For the other half, m(β)(a) is irrational for all but
countably many β; and m(β)(b) = r(b) + β(p(b) − r(b)) is irrational for
all but countably many β when p(b) ≠ r(b), and equals r(b) ∉ ℚ when
p(b) = r(b) (because V(r) = 0). So some β ∈ (0,1) close to 0 has
V(m(β)) = 0 < V(q).

## Notes

The construction is deliberately artificial: it shows that the Archimedean axiom cannot replace mixture continuity even for weak orders, unless something like independence is added. Not yet checked by a human.

<p class='cert'>Record: <code>topics/decision-theory/models/rational-levels.yaml</code></p>
