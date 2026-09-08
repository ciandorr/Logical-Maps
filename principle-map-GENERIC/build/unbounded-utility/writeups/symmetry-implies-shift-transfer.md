# Rich Outcomes ∧ Totality ∧ Stochastic Equivalence ∧ Simple Expected Utility ∧ Stochastic Dominance ∧ Mixture Independence ∧ Negative Affine Anti-Invariance ⇒ Transfer of a Shift Across a Mixture

<p class='cert'>Result — Source: Symmetries of Value; produced by Zachary Goodsell (cited paper); recorded by GPT-6 (Codex), 2026-09-08; transcription and random-variable formulation.</p>

## Premises

- **Rich Outcomes.** Every real number r occurs as a utility level of a sure outcome: for each r ∈ ℝ there is an outcome o_r with u(o_r)=r, with u defined by the normalized binary-mixture comparisons in the background. This does not assert that every outcome has a finite real level.
- **Totality.** For all gambles X,Y, either X ≽ Y or Y ≽ X.
- **Stochastic Equivalence.** If X and Y have the same probability law over outcomes, then X ~ Y. The variables remain distinct objects; indifference is an additional axiom.
- **Simple Expected Utility.** The normalized real utility chart u is defined on every outcome, is measurable, and ranks every pair of simple random variables exactly by finite expected utility: X ≽ Y iff E[u(X)] ≥ E[u(Y)]. Surjectivity of u is not included here.
- **Stochastic Dominance.** If P(X>o) ≥ P(Y>o) for every outcome threshold o, then X ≽ Y; if one threshold inequality is strict, X ≻ Y. Thresholds use the sure-outcome order.
- **Mixture Independence.** For all X,Y,Z and 0<p<1, X ≽ Y iff M_p(X,Z) ≽ M_p(Y,Z), where M is the fixed randomized-selection construction described in the background.
- **Negative Affine Anti-Invariance.** For all real a>0 and b, X ≽ Y iff −aY+b ≽ −aX+b.

## Conclusion

- **Transfer of a Shift Across a Mixture.** For all real b and 0<p<1, M_p(X+b/p,Y) ~ M_p(X,Y+b/(1−p)). Variables and transformed outcomes are in the real utility chart.

## Proof

This is Theorem 3 transported from laws to random variables using Stochastic Equivalence. Reflection, Totality and Independence first make a half-mixture of V and −V indifferent to 0. Shift invariance then gives M_1/2(V+c,−V)~c/2. Pair the terms on the two sides of the proposed transfer with their negatives; both reduce to the same simple constant mixture. Independence cancels the common terms.

## Notes

Source-based result or immediate restriction/composition. Premises are sufficient; minimality is not claimed. The direct source is recorded separately from the transcription; no translation checker is asserted.

## Sources

- **Symmetries of Value** — Goodsell, Symmetries of value, Noûs 60 (2026), 16–37; DOI 10.1111/nous.12549, Theorem 3, pp. 25–26

<p class='cert'>Record: <code>topics/unbounded-utility/results/symmetry-implies-shift-transfer.yaml</code></p>
