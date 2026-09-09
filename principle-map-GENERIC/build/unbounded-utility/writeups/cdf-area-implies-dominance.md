# CDF-Area Extension ⇒ Stochastic Dominance

<p class='cert'>Result — Source: Unbounded Utility and Background Risk (unpublished); produced by Zachary Goodsell (unpublished manuscript); recorded by GPT-6 (Codex), 2026-09-09; extraction and random-variable translation.</p>

## Premises

- **CDF-Area Extension.** The normalized utility chart is total and measurable. Write S_X(t)=P(u(X)>t), d=S_X−S_Y, A₊=∫max(d,0)dt and A₋=∫max(−d,0)dt over ℝ. Whenever at least one of A₊,A₋ is finite, X ≽ Y iff A₊≥A₋. If both are infinite, this axiom imposes no comparison.

## Conclusion

- **Stochastic Dominance.** If P(X>o) ≥ P(Y>o) for every outcome threshold o, then X ≽ Y; if one threshold inequality is strict, X ≻ Y. Thresholds use the sure-outcome order.

## Proof

Under stochastic dominance, S_X≥S_Y pointwise, so A₋=0 and A₊≥0. This forces X ≽ Y. If some threshold is strictly improved, one-sided continuity makes d positive on an interval, giving A₊>0, possibly infinite; then Y ≽ X is false. Equality of laws gives two zero areas.

## Sources

- **Unbounded Utility and Background Risk (unpublished)** — Zachary Goodsell, Unbounded Utility and Background Risk, 5 June 2026, unpublished manuscript marked “do not cite” and erroneous; Lemma 1, p. 8

<p class='cert'>Record: <code>topics/unbounded-utility/results/cdf-area-implies-dominance.yaml</code></p>
