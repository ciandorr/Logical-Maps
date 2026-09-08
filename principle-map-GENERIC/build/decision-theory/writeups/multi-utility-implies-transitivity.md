# Expected multi-utility representation ⇒ Transitivity

<p class='cert'>Result — Source: Misc.; produced by Claude Fable 5.1 (Cowork session).</p>

## Premises

- **Expected multi-utility representation.** There is a set U of functions u : X → ℝ such that for all p, q ∈ Δ(X): p ≽ q if and only if EU_u(p) ≥ EU_u(q) for every u ∈ U.

## Conclusion

- **Transitivity.** For all p, q, r ∈ Δ(X): if p ≽ q and q ≽ r then p ≽ r.

## Proof

If EU_u(p) ≥ EU_u(q) and EU_u(q) ≥ EU_u(r) for every u ∈ U then
EU_u(p) ≥ EU_u(r) for every u ∈ U.

<p class='cert'>Record: <code>topics/decision-theory/results/multi-utility-implies-transitivity.yaml</code></p>
