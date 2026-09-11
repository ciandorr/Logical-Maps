# Expected multi-utility representation ⇒ Closed-graph continuity

<p class='cert'>Result — Source: Misc.; produced by Claude Fable 5.1 (Cowork session).</p>

## Premises

- **Expected multi-utility representation.** There is a set U of functions u : X → ℝ such that for all p, q ∈ Δ(X): p ≽ q if and only if EU_u(p) ≥ EU_u(q) for every u ∈ U.

## Conclusion

- **Closed-graph continuity.** The set {(p, q) ∈ Δ(X) × Δ(X) : p ≽ q} is closed in the product topology.

## Proof

{(p,q) : p ≽ q} = ⋂_{u∈U} {(p,q) : EU_u(p) − EU_u(q) ≥ 0}, an intersection
of preimages of [0,∞) under continuous (indeed linear) maps on Δ(X)×Δ(X).

<p class='cert'>Record: <code>topics/decision-theory/results/multi-utility-implies-closed-graph.yaml</code></p>
