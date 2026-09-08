# Band relation

<p class='cert'>Model — Source: Misc.; produced by Claude Fable 5.1 (Cowork session).</p>

## Package

- **Completeness.** For all p, q ∈ Δ(X): p ≽ q or q ≽ p.
- **Acyclicity.** There is no finite cycle of strict preferences p₁ ≻ p₂ ≻ … ≻ pₙ ≻ p₁.
- **¬ Quasi-transitivity.** Strict preference is transitive: if p ≻ q and q ≻ r then p ≻ r.

## Construction

Fix u : X → ℝ non-constant and ε > 0. Define an asymmetric relation P by
p P q iff EU_u(p) − EU_u(q) ∈ (ε, 2ε], and let p ≽ q iff not q P p. Then
≽ is complete (P is asymmetric) and ≻ = P. P is acyclic because EU_u
strictly increases along any P-chain. But P is not transitive: with
EU_u(p), EU_u(q), EU_u(r) = 3ε, 1.5ε, 0 we have p P q and q P r while
EU_u(p) − EU_u(r) = 3ε ∉ (ε, 2ε].

## Notes

Sanity-checked numerically in checks/countermodels.py. Not yet checked by a human.

<p class='cert'>Record: <code>topics/decision-theory/models/band-relation.yaml</code></p>
