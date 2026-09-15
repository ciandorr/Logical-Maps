# Rich Outcomes ∧ Totality ∧ Stochastic Equivalence ∧ Simple Expected Utility ∧ Stochastic Dominance ∧ Mixture Independence ∧ L¹ Continuity (random variables) ⇒ Expected Utility

<p class='cert'>Result — Source: Symmetries of Value; produced by Zachary Goodsell (cited paper); recorded by GPT-6 (Codex), 2026-09-08; transcription and random-variable formulation.</p>

## Premises

- **Rich Outcomes.** Every real number r occurs as a utility level of a sure outcome: for each $r \in \mathbb{R}$ there is an outcome $o_r$ with $u(o_r)=r$, with u defined by the normalized binary-mixture comparisons in the background. This does not assert that every outcome has a finite real level.
- **Totality.** For all gambles X,Y, either $X \succeq Y$ or $Y \succeq X$.
- **Stochastic Equivalence.** If X and Y have the same probability law over outcomes, then $X \sim Y$. The variables remain distinct objects; indifference is an additional axiom.
- **Simple Expected Utility.** The normalized real utility chart u is defined on every outcome, is measurable, and ranks every pair of simple random variables exactly by finite expected utility: $X \succeq Y$ iff $E[u(X)] \ge E[u(Y)]$. Surjectivity of u is not included here.
- **Stochastic Dominance.** If $P(X>o) \ge P(Y>o)$ for every outcome threshold o, then $X \succeq Y$; if one threshold inequality is strict, $X \succ Y$. Thresholds use the sure-outcome order.
- **Mixture Independence.** For all X,Y,Z and $0<p<1, X \succeq Y$ iff $M_p(X,Z) \succeq M_p(Y,Z)$, where M is the fixed randomized-selection construction described in the background.
- **L¹ Continuity (random variables).** On variables with real utility levels, if $E|u(X_n)- u(X)| \to 0$ and $X_n \succeq Y$ for every n, then $X \succeq Y$. Only the upper-section clause is imposed, matching the paper. Distance can be infinite between other pairs.

## Conclusion

- **Expected Utility.** The normalized chart u is defined on all outcomes and is measurable. Whenever $u(X),u(Y)$ are integrable, $X \succeq Y$ iff $E[u(X)] \ge E[u(Y)]$. Expectations here are finite Lebesgue expectations; this says nothing about two $+\infty$ expectations or conditionally convergent sums.

## Proof

Source-stated implication, §3, p. 23: adding $L^{1}$ Continuity to DTU yields Expected Utility. Stochastic Equivalence makes the quotient ordering on laws well-defined; the remaining premises give exactly the source’s DTU, with the surjectivity part of its Simple EU supplied separately by Rich Outcomes. The $L^{1}$ translation write-up establishes that the random-variable continuity axiom implies the source’s metric continuity. Apply the stated theorem and pull its expected-utility comparison back to X,Y. The source does not supply an expanded proof of the underlying implication; this is a theorem application and translation, not a new proof of that theorem.

## Notes

Source-based result or immediate restriction/composition. Premises are sufficient; minimality is not claimed. The direct source is recorded separately from the transcription; no translation checker is asserted.

## Sources

- **Symmetries of Value** — Goodsell, Symmetries of value, Noûs 60 (2026), 16–37; DOI 10.1111/nous.12549, §3, p. 23

<p class='cert'>Record: <code>topics/unbounded-utility/results/dtu-l1-implies-eu.yaml</code></p>

## Paper references

- **Proof: [Symmetries of value](https://doi.org/10.1111/nous.12549).** Zachary Goodsell (2026). Symmetries of value. Noûs, 60, 16–37. — §3, p. 23
