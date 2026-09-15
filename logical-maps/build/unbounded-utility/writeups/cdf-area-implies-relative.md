# CDF-Area Extension ⇒ Relative Expectation

<p class='cert'>Result — Source: Misc.; produced by GPT-6 (Codex); recorded by GPT-6 (Codex), 2026-09-09; extraction and random-variable translation.</p>

## Premises

- **CDF-Area Extension.** The normalized utility chart is total and measurable. Write $S_X(t)=P(u(X)>t), d=S_X- S_Y, A_{+}=\int \max (d,0)dt$ and $A_{-}=\int \max (- d,0)dt$ over $\mathbb{R}$. Whenever at least one of $A_{+},A_{-}$ is finite, $X \succeq Y$ iff $A_{+}\ge A_{-}$. If both are infinite, this axiom imposes no comparison.

## Conclusion

- **Relative Expectation.** For real-utility variables X,Y on the same probability space, if $E|u(X)- u(Y)|<\infty$, then $X \succeq Y$ iff $E[u(X)- u(Y)] \ge 0$. Their individual expectations may both be undefined.

## Proof

For the actual coupling, $\int |S_X- S_Y|dt \le E|u(X)- u(Y)|$. If the latter is finite, Fubini applied to $1_{u(X)>t}- 1_{u(Y)>t}$ gives $\int (S_X- S_Y)dt=E[u(X)- u(Y)]$. Both areas are finite, so the CDF-area comparison is exactly the comparison of this expectation with zero.

## Sources

- **GPT-6 generated 9 Sep** — GPT-6 (Codex), original connecting proof recorded 9 September 2026 in this project
- **Unbounded Utility and Background Risk (unpublished)** — Zachary Goodsell, Unbounded Utility and Background Risk, 5 June 2026, unpublished manuscript marked “do not cite” and erroneous; §3, pp. 7–8

<p class='cert'>Record: <code>topics/unbounded-utility/results/cdf-area-implies-relative.yaml</code></p>

## Paper references

- **Background: Unbounded Utility and Background Risk.** Zachary Goodsell (5 June 2026). Unbounded Utility and Background Risk. Unpublished working manuscript. — §3, pp. 7–8
