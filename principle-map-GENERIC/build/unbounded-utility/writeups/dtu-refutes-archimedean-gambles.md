# Rich Outcomes ∧ Totality ∧ Stochastic Equivalence ∧ Simple Expected Utility ∧ Stochastic Dominance ∧ Mixture Independence ⇒ Failure of Archimedean Gambles

<p class='cert'>Result — Source: Symmetries of Value; produced by Zachary Goodsell (cited paper); recorded by GPT-6 (Codex), 2026-09-08; transcription and random-variable formulation.</p>

## Premises

- **Rich Outcomes.** Every real number r occurs as a utility level of a sure outcome: for each r ∈ ℝ there is an outcome o_r with u(o_r)=r, with u defined by the normalized binary-mixture comparisons in the background. This does not assert that every outcome has a finite real level.
- **Totality.** For all gambles X,Y, either X ≽ Y or Y ≽ X.
- **Stochastic Equivalence.** If X and Y have the same probability law over outcomes, then X ~ Y. The variables remain distinct objects; indifference is an additional axiom.
- **Simple Expected Utility.** The normalized real utility chart u is defined on every outcome, is measurable, and ranks every pair of simple random variables exactly by finite expected utility: X ≽ Y iff E[u(X)] ≥ E[u(Y)]. Surjectivity of u is not included here.
- **Stochastic Dominance.** If P(X>o) ≥ P(Y>o) for every outcome threshold o, then X ≽ Y; if one threshold inequality is strict, X ≻ Y. Thresholds use the sure-outcome order.
- **Mixture Independence.** For all X,Y,Z and 0<p<1, X ≽ Y iff M_p(X,Z) ≽ M_p(Y,Z), where M is the fixed randomized-selection construction described in the background.

## Conclusion

- **Failure of Archimedean Gambles.** There exist X ≻ Y ≻ Z such that no p ∈ (0,1) satisfies Y ~ M_p(X,Z).

## Proof

Let S have P(u(S)=2^n)=2^(−n). For any real c choose N with N>c. The simple truncation min(S,2^N) has expectation N+1 and is stochastically dominated by S. Thus S≻c. In particular S≻1≻0. Every M_p(S,0), p>0, is also better than every sure outcome: its simple truncations have arbitrarily large finite expectations. Hence none is indifferent to 1. This violates Archimedean Gambles while preserving Archimedean Outcomes.

## Notes

Source-based result or immediate restriction/composition. Premises are sufficient; minimality is not claimed. The direct source is recorded separately from the transcription; no translation checker is asserted.

## Sources

- **Symmetries of Value** — Goodsell, Symmetries of value, Noûs 60 (2026), 16–37; DOI 10.1111/nous.12549, §3, p. 22

<p class='cert'>Record: <code>topics/unbounded-utility/results/dtu-refutes-archimedean-gambles.yaml</code></p>
