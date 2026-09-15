# Rich Outcomes ∧ Archimedean Outcomes ∧ Stochastic Equivalence ∧ Statewise Dominance ⇒ Stochastic Dominance

<p class='cert'>Result — Source: Decision Theory Unbound; produced by Zachary Goodsell (cited paper); recorded by GPT-6 (Codex), 2026-09-08; transcription and random-variable formulation.</p>

## Premises

- **Rich Outcomes.** Every real number r occurs as a utility level of a sure outcome: for each $r \in \mathbb{R}$ there is an outcome $o_r$ with $u(o_r)=r$, with u defined by the normalized binary-mixture comparisons in the background. This does not assert that every outcome has a finite real level.
- **Archimedean Outcomes.** For any three sure outcomes $a \succ b \succ c$, some nontrivial mixture of the outer two is equally good as the intermediate one: $b \sim M_p(a,c)$ for some $p \in (0,1)$. Only the three inputs are sure outcomes. This is the no-infinite-ratios condition, not continuity of preferences over arbitrary gambles.
- **Stochastic Equivalence.** If X and Y have the same probability law over outcomes, then $X \sim Y$. The variables remain distinct objects; indifference is an additional axiom.
- **Statewise Dominance.** If $X \ge Y$ almost surely in the sure-outcome order, then $X \succeq Y$; if also $P(X>Y)>0$, then $X \succ Y$.

## Conclusion

- **Stochastic Dominance.** If $P(X>o) \ge P(Y>o)$ for every outcome threshold o, then $X \succeq Y$; if one threshold inequality is strict, $X \succ Y$. Thresholds use the sure-outcome order.

## Proof

On the full real chart, first-order dominance permits quantile realizations X′,Y′ using the same uniform random variable with X′$\ge Y$′ almost surely. Distinct laws give $P(X$′$>Y$′)$>0$. Statewise Dominance compares these realizations, and Stochastic Equivalence plus transitivity transfers that comparison to X,Y. All realizations exist by standing Prospect Richness.

## Notes

Source-based result or immediate restriction/composition. Premises are sufficient; minimality is not claimed. The direct source is recorded separately from the transcription; no translation checker is asserted.

## Sources

- **Decision Theory Unbound** — Goodsell, Decision theory unbound, Noûs 58 (2024), 669–695; online 2023; DOI 10.1111/nous.12473, §3.2, footnote 19 (RV/quantile translation)

<p class='cert'>Record: <code>topics/unbounded-utility/results/equivalence-and-statewise-imply-dominance.yaml</code></p>

## Paper references

- **Proof: [Decision theory unbound](https://doi.org/10.1111/nous.12473).** Zachary Goodsell (2024). Decision theory unbound. Noûs, 58, 669–695. First published online in 2023. — §3.2, footnote 19 (RV/quantile translation)
