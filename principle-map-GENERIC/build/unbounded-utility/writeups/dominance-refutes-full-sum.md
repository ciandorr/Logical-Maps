# Rich Outcomes ∧ Stochastic Dominance ∧ Full Sum Invariance ⇒ False (⊥)

<p class='cert'>Result — Source: Unbounded Utility and Background Risk (unpublished); produced by Zachary Goodsell (unpublished manuscript); recorded by GPT-6 (Codex), 2026-09-09; extraction and random-variable translation.</p>

## Premises

- **Rich Outcomes.** Every real number r occurs as a utility level of a sure outcome: for each r ∈ ℝ there is an outcome o_r with u(o_r)=r, with u defined by the normalized binary-mixture comparisons in the background. This does not assert that every outcome has a finite real level.
- **Stochastic Dominance.** If P(X>o) ≥ P(Y>o) for every outcome threshold o, then X ≽ Y; if one threshold inequality is strict, X ≻ Y. Thresholds use the sure-outcome order.
- **Full Sum Invariance.** For all X,Y,Z, with arbitrary dependence, X ≽ Y iff X+Z ≽ Y+Z.

## Conclusion

- **False (⊥).** These premises cannot all hold together.

## Proof

Let P,Q each have St Petersburg law P(P=2ⁿ)=2⁻ⁿ, n≥1, coupled antitonically so exactly one equals 2. Dominance supplies Stochastic Equivalence, hence P~Q. Full Sum Invariance with common summand P would give 2P~P+Q. But P+Q has the law of 2P+2: for n≥2 it takes 2ⁿ+2 with probability 2^(1−n). This strictly stochastically dominates the law of 2P, contradicting the asserted indifference. Rich Outcomes and standing prospect richness supply the variables and sums.

## Notes

The draft credits the earlier full-sum impossibility to Seidenfeld, Schervish and Kadane. This record uses the explicit witness in the supplied manuscript; it is not a new attribution of their exact theorem.

Representation update: the former negative conclusion is expressed by adding full-sum-consistency to the premises and concluding False. The mathematical claim, source, and proof are unchanged.

## Sources

- **Unbounded Utility and Background Risk (unpublished)** — Zachary Goodsell, Unbounded Utility and Background Risk, 5 June 2026, unpublished manuscript marked “do not cite” and erroneous; §6.1, p. 17

<p class='cert'>Record: <code>topics/unbounded-utility/results/dominance-refutes-full-sum.yaml</code></p>
