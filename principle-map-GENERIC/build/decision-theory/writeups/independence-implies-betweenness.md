# Independence ⇒ Betweenness

<p class='cert'>Result — Source: Misc.; produced by Claude Fable 5.1 (Cowork session).</p>

## Premises

- **Independence.** For all p, q, r ∈ Δ(X) and λ ∈ (0,1]: p ≽ q if and only if λp + (1−λ)r ≽ λq + (1−λ)r.

## Conclusion

- **Betweenness.** For all p, q ∈ Δ(X) and λ ∈ (0,1): if p ≻ q then p ≻ λp + (1−λ)q ≻ q, and if p ~ q then p ~ λp + (1−λ)q.

## Proof

Fix λ ∈ (0,1) and write m = λp + (1−λ)q. Independence with r = p and
mixing weight 1−λ gives p ≽ q ⟺ (1−λ)p+λp ≽ (1−λ)q+λp, i.e. p ≽ q ⟺ p ≽ m,
and likewise q ≽ p ⟺ m ≽ p. Hence p ≻ q ⟺ p ≻ m and p ~ q ⟺ p ~ m.
Independence with r = q and weight λ gives p ≽ q ⟺ m ≽ q and
q ≽ p ⟺ q ≽ m, so p ≻ q ⟺ m ≻ q. Together: p ≻ q ⟹ p ≻ m ≻ q and
p ~ q ⟹ p ~ m.

## Notes

No ordering assumptions are needed because independence is taken in the biconditional form.

<p class='cert'>Record: <code>topics/decision-theory/results/independence-implies-betweenness.yaml</code></p>
