# Rich Outcomes ∧ Totality ∧ Stochastic Equivalence ∧ Simple Expected Utility ∧ Stochastic Dominance ∧ Mixture Independence ∧ Archimedean Gambles ⇒ False (⊥)

<p class='cert'>Result — Source: Symmetries of Value; produced by Zachary Goodsell (cited paper); recorded by GPT-6 (Codex), 2026-09-08; transcription and random-variable formulation.</p>

## Premises

- **Rich Outcomes.** Every real number r occurs as a utility level of a sure outcome: for each $r \in \mathbb{R}$ there is an outcome $o_r$ with $u(o_r)=r$, with u defined by the normalized binary-mixture comparisons in the background. This does not assert that every outcome has a finite real level.
- **Totality.** For all gambles X,Y, either $X \succeq Y$ or $Y \succeq X$.
- **Stochastic Equivalence.** If X and Y have the same probability law over outcomes, then $X \sim Y$. The variables remain distinct objects; indifference is an additional axiom.
- **Simple Expected Utility.** The normalized real utility chart u is defined on every outcome, is measurable, and ranks every pair of simple random variables exactly by finite expected utility: $X \succeq Y$ iff $E[u(X)] \ge E[u(Y)]$. Surjectivity of u is not included here.
- **Stochastic Dominance.** If $P(X>o) \ge P(Y>o)$ for every outcome threshold o, then $X \succeq Y$; if one threshold inequality is strict, $X \succ Y$. Thresholds use the sure-outcome order.
- **Mixture Independence.** For all X,Y,Z and $0<p<1, X \succeq Y$ iff $M_p(X,Z) \succeq M_p(Y,Z)$, where M is the fixed randomized-selection construction described in the background.
- **Archimedean Gambles.** For any gambles $X \succ Y \succ Z$, there is $p \in (0,1)$ with $Y \sim M_p(X,Z)$. Unlike Archimedean Outcomes, X,Y,Z may themselves be unbounded gambles.

## Conclusion

- **False (⊥).** These premises cannot all hold together.

## Proof

Let S have $P(u(S)=2^n)=2^{- n}$. For any real c choose N with $N>c$. The simple truncation $\min (S,2^N)$ has expectation $N+1$ and is stochastically dominated by S. Thus $S\succ c$. In particular $S\succ 1\succ 0$. Every $M_p(S,0), p>0$, is also better than every sure outcome: its simple truncations have arbitrarily large finite expectations. Hence none is indifferent to 1. This violates Archimedean Gambles while preserving Archimedean Outcomes.

## Notes

Source-based result or immediate restriction/composition. Premises are sufficient; minimality is not claimed. The direct source is recorded separately from the transcription; no translation checker is asserted.

Representation update: the former negative conclusion is expressed by adding archimedean-gambles to the premises and concluding False. The mathematical claim, source, and proof are unchanged.

## Sources

- **Symmetries of Value** — Goodsell, Symmetries of value, Noûs 60 (2026), 16–37; DOI 10.1111/nous.12549, §3, p. 22

<p class='cert'>Record: <code>topics/unbounded-utility/results/dtu-refutes-archimedean-gambles.yaml</code></p>

## Paper references

- **Proof: [Symmetries of value](https://doi.org/10.1111/nous.12549).** Zachary Goodsell (2026). Symmetries of value. Noûs, 60, 16–37. — §3, p. 22
