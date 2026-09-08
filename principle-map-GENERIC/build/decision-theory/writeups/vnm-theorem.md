# Completeness ∧ Transitivity ∧ Independence ∧ Mixture continuity ⇒ Expected-utility representation

<p class='cert'>Result — Source: Misc.; produced by literature.</p>

## Premises

- **Completeness.** For all p, q ∈ Δ(X): p ≽ q or q ≽ p.
- **Transitivity.** For all p, q, r ∈ Δ(X): if p ≽ q and q ≽ r then p ≽ r.
- **Independence.** For all p, q, r ∈ Δ(X) and λ ∈ (0,1]: p ≽ q if and only if λp + (1−λ)r ≽ λq + (1−λ)r.
- **Mixture continuity.** For all p, q, r ∈ Δ(X) the sets {λ ∈ [0,1] : λp + (1−λ)q ≽ r} and {λ ∈ [0,1] : r ≽ λp + (1−λ)q} are closed.

## Conclusion

- **Expected-utility representation.** There is a function u : X → ℝ such that for all p, q ∈ Δ(X): p ≽ q if and only if EU_u(p) ≥ EU_u(q).

## Proof

The von Neumann–Morgenstern theorem in the Herstein–Milnor mixture-set form.
Continuity plus weak order give, for any p ≽ q ≽ r with p ≻ r, a unique
λ with q ~ λp + (1−λ)r (connectedness of [0,1] and closedness of both
sections). Fix a best and a worst lottery (exist since X is finite and ≽
is a weak order respecting mixtures), define U(q) as that λ, and use
independence to show U is affine in mixtures; then u(x) = U(δ_x)
represents ≽ by expected utility.

## Sources

- von Neumann & Morgenstern (1944), Theory of Games and Economic Behavior, appendix
- Herstein & Milnor (1953), An axiomatic approach to measurable utility, Econometrica 21, Theorem 8
- Kreps (1988), Notes on the Theory of Choice, Theorem 5.15

<p class='cert'>Record: <code>topics/decision-theory/results/vnm-theorem.yaml</code></p>
