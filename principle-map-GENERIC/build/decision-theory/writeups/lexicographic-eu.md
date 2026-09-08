# Lexicographic EU

<p class='cert'>Model — Source: Misc.; produced by literature.</p>

## Package

- **Completeness.** For all p, q ∈ Δ(X): p ≽ q or q ≽ p.
- **Transitivity.** For all p, q, r ∈ Δ(X): if p ≽ q and q ≽ r then p ≽ r.
- **Independence.** For all p, q, r ∈ Δ(X) and λ ∈ (0,1]: p ≽ q if and only if λp + (1−λ)r ≽ λq + (1−λ)r.
- **¬ Mixture continuity.** For all p, q, r ∈ Δ(X) the sets {λ ∈ [0,1] : λp + (1−λ)q ≽ r} and {λ ∈ [0,1] : r ≽ λp + (1−λ)q} are closed.
- **¬ Archimedean.** For all p, q, r ∈ Δ(X): if p ≻ q ≻ r then there are α, β ∈ (0,1) with αp + (1−α)r ≻ q and q ≻ βp + (1−β)r.

## Construction

Lexicographic expected utility. With X = {a, b, c} let p ≽ q iff
p(a) > q(a), or p(a) = q(a) and p(b) ≥ q(b). This is complete and
transitive (a lexicographic order on ℝ²), and satisfies independence
because mixing with r multiplies the vector of differences by λ, which
preserves lexicographic sign. But {λ : λδ_a + (1−λ)δ_c ≽ δ_b} = (0, 1],
which is not closed.

The same lexicographic order (p ≽ q iff p(a) > q(a), or p(a) = q(a) and
p(b) ≥ q(b)). Here δ_a ≻ δ_b ≻ δ_c, but every mixture βδ_a + (1−β)δ_c
with β > 0 puts positive weight on a and so is strictly preferred to
δ_b; no β with δ_b ≻ βδ_a + (1−β)δ_c exists.

## Notes

Derivable from lexicographic-not-archimedean together with continuity-completeness-imply-archimedean (the validator reports it as redundant); kept because it is the form the literature states.

## Sources

- Hausner (1954), Multidimensional utilities, in Decision Processes (Thrall, Coombs & Davis eds.)
- Fishburn (1971), A study of lexicographic expected utility, Management Science 17
- Hausner (1954), Multidimensional utilities
- Fishburn (1971), A study of lexicographic expected utility, Management Science 17

<p class='cert'>Record: <code>topics/decision-theory/models/lexicographic-eu.yaml</code></p>
