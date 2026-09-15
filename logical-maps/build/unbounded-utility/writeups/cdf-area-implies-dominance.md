# CDF-Area Extension ⇒ Stochastic Dominance

<p class='cert'>Result — Source: Unbounded Utility and Background Risk (unpublished); produced by Zachary Goodsell (unpublished manuscript); recorded by GPT-6 (Codex), 2026-09-09; extraction and random-variable translation.</p>

## Premises

- **CDF-Area Extension.** The normalized utility chart is total and measurable. Write $S_X(t)=P(u(X)>t), d=S_X- S_Y, A_{+}=\int \max (d,0)dt$ and $A_{-}=\int \max (- d,0)dt$ over $\mathbb{R}$. Whenever at least one of $A_{+},A_{-}$ is finite, $X \succeq Y$ iff $A_{+}\ge A_{-}$. If both are infinite, this axiom imposes no comparison.

## Conclusion

- **Stochastic Dominance.** If $P(X>o) \ge P(Y>o)$ for every outcome threshold o, then $X \succeq Y$; if one threshold inequality is strict, $X \succ Y$. Thresholds use the sure-outcome order.

## Proof

Under stochastic dominance, $S_X\ge S_Y$ pointwise, so $A_{-}=0$ and $A_{+}\ge 0$. This forces $X \succeq Y$. If some threshold is strictly improved, one-sided continuity makes d positive on an interval, giving $A_{+}>0$, possibly infinite; then $Y \succeq X$ is false. Equality of laws gives two zero areas.

## Sources

- **Unbounded Utility and Background Risk (unpublished)** — Zachary Goodsell, Unbounded Utility and Background Risk, 5 June 2026, unpublished manuscript marked “do not cite” and erroneous; Lemma 1, p. 8

<p class='cert'>Record: <code>topics/unbounded-utility/results/cdf-area-implies-dominance.yaml</code></p>

## Paper references

- **Proof: Unbounded Utility and Background Risk.** Zachary Goodsell (5 June 2026). Unbounded Utility and Background Risk. Unpublished working manuscript. — Lemma 1, p. 8
