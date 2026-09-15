# Rich Outcomes ∧ Totality ∧ Stochastic Equivalence ∧ Simple Expected Utility ∧ Mixture Independence ∧ Reflection Anti-Invariance ⇒ Symmetric Gambles Are Neutral

<p class='cert'>Result — Source: Symmetries of Value; produced by Zachary Goodsell (cited paper); recorded by GPT-6 (Codex), 2026-09-08; transcription and random-variable formulation.</p>

## Premises

- **Rich Outcomes.** Every real number r occurs as a utility level of a sure outcome: for each $r \in \mathbb{R}$ there is an outcome $o_r$ with $u(o_r)=r$, with u defined by the normalized binary-mixture comparisons in the background. This does not assert that every outcome has a finite real level.
- **Totality.** For all gambles X,Y, either $X \succeq Y$ or $Y \succeq X$.
- **Stochastic Equivalence.** If X and Y have the same probability law over outcomes, then $X \sim Y$. The variables remain distinct objects; indifference is an additional axiom.
- **Simple Expected Utility.** The normalized real utility chart u is defined on every outcome, is measurable, and ranks every pair of simple random variables exactly by finite expected utility: $X \succeq Y$ iff $E[u(X)] \ge E[u(Y)]$. Surjectivity of u is not included here.
- **Mixture Independence.** For all X,Y,Z and $0<p<1, X \succeq Y$ iff $M_p(X,Z) \succeq M_p(Y,Z)$, where M is the fixed randomized-selection construction described in the background.
- **Reflection Anti-Invariance.** $X \succeq Y$ iff $- Y \succeq - X$, using the one fixed normalized origin 0.

## Conclusion

- **Symmetric Gambles Are Neutral.** If $u(X)$ and $- u(X)$ have the same law, then $X \sim 0$.

## Proof

Let $H=M_{1/2}(X,- X)$. Its reflected law equals its own law, so $H\sim - H$. If $H\succ 0$, reflection gives $- H\prec 0$, contradiction; likewise if $H\prec 0$. Totality gives $H\sim 0$. If X itself has symmetric law, Stochastic Equivalence gives $- X\sim X$ and $H\sim X$, since the mixture then has X’s law. Thus $X\sim 0$.

## Notes

Source-based result or immediate restriction/composition. Premises are sufficient; minimality is not claimed. The direct source is recorded separately from the transcription; no translation checker is asserted.

## Sources

- **Symmetries of Value** — Goodsell, Symmetries of value, Noûs 60 (2026), 16–37; DOI 10.1111/nous.12549, §4, pp. 25, 27

<p class='cert'>Record: <code>topics/unbounded-utility/results/reflection-implies-symmetric-neutrality.yaml</code></p>

## Paper references

- **Proof: [Symmetries of value](https://doi.org/10.1111/nous.12549).** Zachary Goodsell (2026). Symmetries of value. Noûs, 60, 16–37. — §4, pp. 25, 27
