# Expected multi-utility representation ⇒ Independence

<p class='cert'>Result — Source: Misc.; produced by Claude Fable 5.1 (Cowork session).</p>

## Premises

- **Expected multi-utility representation.** There is a set U of functions u : X → ℝ such that for all p, q ∈ Δ(X): p ≽ q if and only if EU_u(p) ≥ EU_u(q) for every u ∈ U.

## Conclusion

- **Independence.** For all p, q, r ∈ Δ(X) and λ ∈ (0,1]: p ≽ q if and only if λp + (1−λ)r ≽ λq + (1−λ)r.

## Proof

EU_u is affine in mixtures, so for λ ∈ (0,1]:
EU_u(λp+(1−λ)r) − EU_u(λq+(1−λ)r) = λ(EU_u(p) − EU_u(q)),
which is ≥ 0 iff EU_u(p) ≥ EU_u(q). Quantify over u ∈ U.

<p class='cert'>Record: <code>topics/decision-theory/results/multi-utility-implies-independence.yaml</code></p>
