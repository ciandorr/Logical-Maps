# Rich Outcomes ∧ Totality ∧ Stochastic Equivalence ∧ Simple Expected Utility ∧ Stochastic Dominance ∧ Mixture Independence ∧ Negative Affine Anti-Invariance ∧ Relative Expectation ⇒ L¹ Continuity (random variables)

<p class='cert'>Result — Source: Symmetries of Value; produced by Zachary Goodsell (cited paper); recorded by GPT-6 (Codex), 2026-09-08; transcription and random-variable formulation.</p>

## Premises

- **Rich Outcomes.** Every real number r occurs as a utility level of a sure outcome: for each r ∈ ℝ there is an outcome o_r with u(o_r)=r, with u defined by the normalized binary-mixture comparisons in the background. This does not assert that every outcome has a finite real level.
- **Totality.** For all gambles X,Y, either X ≽ Y or Y ≽ X.
- **Stochastic Equivalence.** If X and Y have the same probability law over outcomes, then X ~ Y. The variables remain distinct objects; indifference is an additional axiom.
- **Simple Expected Utility.** The normalized real utility chart u is defined on every outcome, is measurable, and ranks every pair of simple random variables exactly by finite expected utility: X ≽ Y iff E[u(X)] ≥ E[u(Y)]. Surjectivity of u is not included here.
- **Stochastic Dominance.** If P(X>o) ≥ P(Y>o) for every outcome threshold o, then X ≽ Y; if one threshold inequality is strict, X ≻ Y. Thresholds use the sure-outcome order.
- **Mixture Independence.** For all X,Y,Z and 0<p<1, X ≽ Y iff M_p(X,Z) ≽ M_p(Y,Z), where M is the fixed randomized-selection construction described in the background.
- **Negative Affine Anti-Invariance.** For all real a>0 and b, X ≽ Y iff −aY+b ≽ −aX+b.
- **Relative Expectation.** For real-utility variables X,Y on the same probability space, if E|u(X)−u(Y)|<∞, then X ≽ Y iff E[u(X)−u(Y)] ≥ 0. Their individual expectations may both be undefined.

## Conclusion

- **L¹ Continuity (random variables).** On variables with real utility levels, if E|u(X_n)−u(X)| → 0 and X_n ≽ Y for every n, then X ≽ Y. Only the upper-section clause is imposed, matching the paper. Distance can be infinite between other pairs.

## Proof

This is the reverse direction of Corollary 5 in its full DTU+Sym context. Pull preferences down to probability laws using Stochastic Equivalence and apply the source equivalence between Relative Expectation Theory and the extended L¹ metric continuity. Actual-coupling convergence implies convergence in that infimum metric, giving the random-variable clause. The source states this as a corollary without an expanded reverse-direction proof; no claim of an independent proof audit is made.

## Notes

Source-based result or immediate restriction/composition. Premises are sufficient; minimality is not claimed. The direct source is recorded separately from the transcription; no translation checker is asserted.

## Sources

- **Symmetries of Value** — Goodsell, Symmetries of value, Noûs 60 (2026), 16–37; DOI 10.1111/nous.12549, Corollary 5, p. 27

<p class='cert'>Record: <code>topics/unbounded-utility/results/symmetry-relative-implies-l1.yaml</code></p>
