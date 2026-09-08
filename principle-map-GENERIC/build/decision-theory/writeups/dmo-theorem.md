# Transitivity ∧ Independence ∧ Closed-graph continuity ⇒ Expected multi-utility representation

<p class='cert'>Result — Source: Misc.; produced by literature.</p>

## Premises

- **Transitivity.** For all p, q, r ∈ Δ(X): if p ≽ q and q ≽ r then p ≽ r.
- **Independence.** For all p, q, r ∈ Δ(X) and λ ∈ (0,1]: p ≽ q if and only if λp + (1−λ)r ≽ λq + (1−λ)r.
- **Closed-graph continuity.** The set {(p, q) ∈ Δ(X) × Δ(X) : p ≽ q} is closed in the product topology.

## Conclusion

- **Expected multi-utility representation.** There is a set U of functions u : X → ℝ such that for all p, q ∈ Δ(X): p ≽ q if and only if EU_u(p) ≥ EU_u(q) for every u ∈ U.

## Proof

Dubra–Maccheroni–Ok, Theorem 1, for compact metric X (finite X is a
special case): a reflexive transitive relation on Δ(X) satisfying
independence and closed-graph continuity has an expected multi-utility
representation. The proof identifies ≽ with a closed convex cone of
signed measures and takes U to be the dual cone.

## Notes

Reflexivity is a standing assumption of the framework.

## Sources

- Dubra, Maccheroni & Ok (2004), Expected utility theory without the completeness axiom, JET 115, Theorem 1

<p class='cert'>Record: <code>topics/decision-theory/results/dmo-theorem.yaml</code></p>
