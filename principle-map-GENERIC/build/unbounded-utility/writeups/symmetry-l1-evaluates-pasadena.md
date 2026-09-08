# Rich Outcomes ∧ Totality ∧ Stochastic Equivalence ∧ Simple Expected Utility ∧ Stochastic Dominance ∧ Mixture Independence ∧ Negative Affine Anti-Invariance ∧ L¹ Continuity (random variables) ⇒ Pasadena = ln 2

<p class='cert'>Result — Source: Symmetries of Value; produced by Zachary Goodsell (cited paper); recorded by GPT-6 (Codex), 2026-09-08; transcription and random-variable formulation.</p>

## Premises

- **Rich Outcomes.** Every real number r occurs as a utility level of a sure outcome: for each r ∈ ℝ there is an outcome o_r with u(o_r)=r, with u defined by the normalized binary-mixture comparisons in the background. This does not assert that every outcome has a finite real level.
- **Totality.** For all gambles X,Y, either X ≽ Y or Y ≽ X.
- **Stochastic Equivalence.** If X and Y have the same probability law over outcomes, then X ~ Y. The variables remain distinct objects; indifference is an additional axiom.
- **Simple Expected Utility.** The normalized real utility chart u is defined on every outcome, is measurable, and ranks every pair of simple random variables exactly by finite expected utility: X ≽ Y iff E[u(X)] ≥ E[u(Y)]. Surjectivity of u is not included here.
- **Stochastic Dominance.** If P(X>o) ≥ P(Y>o) for every outcome threshold o, then X ≽ Y; if one threshold inequality is strict, X ≻ Y. Thresholds use the sure-outcome order.
- **Mixture Independence.** For all X,Y,Z and 0<p<1, X ≽ Y iff M_p(X,Z) ≽ M_p(Y,Z), where M is the fixed randomized-selection construction described in the background.
- **Negative Affine Anti-Invariance.** For all real a>0 and b, X ≽ Y iff −aY+b ≽ −aX+b.
- **L¹ Continuity (random variables).** On variables with real utility levels, if E|u(X_n)−u(X)| → 0 and X_n ≽ Y for every n, then X ≽ Y. Only the upper-section clause is imposed, matching the paper. Distance can be infinite between other pairs.

## Conclusion

- **Pasadena = ln 2.** Every X with P(u(X)=−(−2)^n/n)=2^(−n), n≥1, is indifferent to sure utility ln 2.

## Proof

Theorem 11. Couple Pasadena P with Highland Park H, retaining each outcome probability and replacing each negative denominator 2n by 2n−1. Then E[H−P]=−ln 2 with integrable difference. The paper writes H as M_2/3(Q,−2Q). It proves by Relative Expectation that Q~M_1/4(4Q,0), then Totality and affine invariance give Q~M_1/2(2Q,0). Reflection and Independence yield H~0; Relative Expectation together with shift transfer then gives P~ln 2. These are preference equalities, not ordinary expectations of P or H.

## Notes

Source-based result or immediate restriction/composition. Premises are sufficient; minimality is not claimed. The direct source is recorded separately from the transcription; no translation checker is asserted.

## Sources

- **Symmetries of Value** — Goodsell, Symmetries of value, Noûs 60 (2026), 16–37; DOI 10.1111/nous.12549, Theorem 11, pp. 32–33

<p class='cert'>Record: <code>topics/unbounded-utility/results/symmetry-l1-evaluates-pasadena.yaml</code></p>
