# Rich Outcomes ∧ Stochastic Dominance ∧ Antitonic Sum Invariance ⇒ False (⊥)

<p class='cert'>Result — Source: Unbounded Utility and Background Risk (unpublished); produced by Zachary Goodsell (unpublished manuscript); recorded by GPT-6 (Codex), 2026-09-09; extraction and random-variable translation.</p>

## Premises

- **Rich Outcomes.** Every real number r occurs as a utility level of a sure outcome: for each $r \in \mathbb{R}$ there is an outcome $o_r$ with $u(o_r)=r$, with u defined by the normalized binary-mixture comparisons in the background. This does not assert that every outcome has a finite real level.
- **Stochastic Dominance.** If $P(X>o) \ge P(Y>o)$ for every outcome threshold o, then $X \succeq Y$; if one threshold inequality is strict, $X \succ Y$. Thresholds use the sure-outcome order.
- **Antitonic Sum Invariance.** If X and Z are antitonic, and Y and Z are antitonic, then $X \succeq Y$ iff $X+Z \succeq Y+Z$. A pair is antitonic when one member is nondecreasing and the other nonincreasing in a common uniform random variable.

## Conclusion

- **False (⊥).** These premises cannot all hold together.

## Proof

Let P have St Petersburg law and S have the symmetric mixture $\frac{1}{2} P+\frac{1}{2} (- P)$. Write ⊕Anti for the law of the antitonic sum. Since P has $\operatorname{law} \frac{1}{2} \delta _{2}+\frac{1}{2} (2P)$, pairing opposite quantiles gives S⊕Anti $P = \frac{1}{2} (P+2)+\frac{1}{2} P$, which strictly stochastically dominates $P=0$⊕Anti P. Antitonic Sum Invariance would therefore give $S \succ 0$ (both weak directions allow strict cancellation). Applying it again with common summand of law S gives S⊕Anti $S \succ 0$⊕Anti S. Symmetry of the quantiles makes the left $\operatorname{law} \delta _{0}$ and the right law S, so $0 \succ S, a$ contradiction. Dominance supplies Stochastic Equivalence for every law identity used. This does not assume Symmetric Neutrality or Totality.

## Notes

Representation update: the former negative conclusion is expressed by adding antitonic-sum-consistency to the premises and concluding False. The mathematical claim, source, and proof are unchanged.

## Sources

- **Unbounded Utility and Background Risk (unpublished)** — Zachary Goodsell, Unbounded Utility and Background Risk, 5 June 2026, unpublished manuscript marked “do not cite” and erroneous; Theorem 6, p. 19

<p class='cert'>Record: <code>topics/unbounded-utility/results/dominance-refutes-antitonic-sum.yaml</code></p>

## Paper references

- **Proof: Unbounded Utility and Background Risk.** Zachary Goodsell (5 June 2026). Unbounded Utility and Background Risk. Unpublished working manuscript. — Theorem 6, p. 19
