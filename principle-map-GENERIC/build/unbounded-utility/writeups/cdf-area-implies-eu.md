# CDF-Area Extension ⇒ Expected Utility

<p class='cert'>Result — Source: Unbounded Utility and Background Risk (unpublished); produced by Zachary Goodsell (unpublished manuscript); recorded by GPT-6 (Codex), 2026-09-09; extraction and random-variable translation.</p>

## Premises

- **CDF-Area Extension.** The normalized utility chart is total and measurable. Write S_X(t)=P(u(X)>t), d=S_X−S_Y, A₊=∫max(d,0)dt and A₋=∫max(−d,0)dt over ℝ. Whenever at least one of A₊,A₋ is finite, X ≽ Y iff A₊≥A₋. If both are infinite, this axiom imposes no comparison.

## Conclusion

- **Expected Utility.** The normalized chart u is defined on all outcomes and is measurable. Whenever u(X),u(Y) are integrable, X ≽ Y iff E[u(X)] ≥ E[u(Y)]. Expectations here are finite Lebesgue expectations; this says nothing about two +∞ expectations or conditionally convergent sums.

## Proof

The axiom supplies a total measurable chart. For integrable u(X),u(Y), both areas are finite, and the survival-function identity gives A₊−A₋=E[u(X)]−E[u(Y)]. Apply the defining biconditional.

## Notes

This is a property of every strictness-preserving extension of the base relation, independent of its unproved convolution cancellation claim.

## Sources

- **Unbounded Utility and Background Risk (unpublished)** — Zachary Goodsell, Unbounded Utility and Background Risk, 5 June 2026, unpublished manuscript marked “do not cite” and erroneous; Lemma 1, pp. 7–8

<p class='cert'>Record: <code>topics/unbounded-utility/results/cdf-area-implies-eu.yaml</code></p>
