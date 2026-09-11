# Rich Outcomes ∧ Stochastic Dominance ∧ Full Sum Invariance ⇒ False (⊥)

<p class='cert'>Result — Source: Seidenfeld, Schervish & Kadane (2009) — Preference for equivalent random variables: A price for unbounded utilities; produced by Teddy Seidenfeld, Mark J. Schervish and Joseph B. Kadane (impossibility result); Zachary Goodsell (sum-invariance presentation); recorded by GPT-6 (Codex), 2026-09-09; extraction and random-variable translation.</p>

## Premises

- **Rich Outcomes.** Every real number r occurs as a utility level of a sure outcome: for each r ∈ ℝ there is an outcome o_r with u(o_r)=r, with u defined by the normalized binary-mixture comparisons in the background. This does not assert that every outcome has a finite real level.
- **Stochastic Dominance.** If P(X>o) ≥ P(Y>o) for every outcome threshold o, then X ≽ Y; if one threshold inequality is strict, X ≻ Y. Thresholds use the sure-outcome order.
- **Full Sum Invariance.** For all X,Y,Z, with arbitrary dependence, X ≽ Y iff X+Z ≽ Y+Z.

## Conclusion

- **False (⊥).** These premises cannot all hold together.

## Proof

Let P,Q each have St Petersburg law P(P=2ⁿ)=2⁻ⁿ, n≥1, coupled antitonically so exactly one equals 2. Dominance supplies Stochastic Equivalence, hence P~Q. Full Sum Invariance with common summand P would give 2P~P+Q. But P+Q has the law of 2P+2: for n≥2 it takes 2ⁿ+2 with probability 2^(1−n). This strictly stochastically dominates the law of 2P, contradicting the asserted indifference. Rich Outcomes and standing prospect richness supply the variables and sums.

## Notes

The impossibility is due to Seidenfeld, Schervish and Kadane. In their Example 3.1, X1, X2 and W have the St Petersburg law and X1+X2=2W+2. The recorded proof uses this construction in common-addend form. Goodsell’s manuscript is a later presentation, not the origin of the result. The premises, proof and verification status are unchanged.

## Sources

- **Seidenfeld, Schervish & Kadane (2009)** — Seidenfeld, T., Schervish, M., & Kadane, J. (2009). Preference for equivalent random variables: A price for unbounded utilities. Journal of Mathematical Economics, 45, 329–340. §3.1, Example 3.1 and Table 1, p. 333; Theorem 1, p. 332. https://doi.org/10.1016/j.jmateco.2008.12.002
- **Unbounded Utility and Background Risk (unpublished)** — Zachary Goodsell, Unbounded Utility and Background Risk, 5 June 2026, unpublished manuscript marked “do not cite” and erroneous; §6.1, p. 17

<p class='cert'>Record: <code>topics/unbounded-utility/results/dominance-refutes-full-sum.yaml</code></p>

## Paper references

- **Proof: [Preference for equivalent random variables: A price for unbounded utilities](https://doi.org/10.1016/j.jmateco.2008.12.002).** Seidenfeld, T., Schervish, M., & Kadane, J. (2009). Preference for equivalent random variables: A price for unbounded utilities. Journal of Mathematical Economics, 45, 329–340. — §3.1, Example 3.1 and Table 1, p. 333; Theorem 1, p. 332. The recorded antitonic St Petersburg pair is SSK’s X1,X2 construction, expressed as a contradiction with common-addend invariance.
- **Formulation: Unbounded Utility and Background Risk.** Zachary Goodsell (5 June 2026). Unbounded Utility and Background Risk. Unpublished working manuscript. — §6.1, p. 17. Later presentation of the SSK impossibility, used when the map was first transcribed.
