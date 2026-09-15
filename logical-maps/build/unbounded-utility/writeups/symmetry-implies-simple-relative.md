# Rich Outcomes ∧ Totality ∧ Stochastic Equivalence ∧ Simple Expected Utility ∧ Stochastic Dominance ∧ Mixture Independence ∧ Negative Affine Anti-Invariance ⇒ Simple Relative Expectation

<p class='cert'>Result — Source: Symmetries of Value; produced by Zachary Goodsell (cited paper); recorded by GPT-6 (Codex), 2026-09-08; transcription and random-variable formulation.</p>

## Premises

- **Rich Outcomes.** Every real number r occurs as a utility level of a sure outcome: for each $r \in \mathbb{R}$ there is an outcome $o_r$ with $u(o_r)=r$, with u defined by the normalized binary-mixture comparisons in the background. This does not assert that every outcome has a finite real level.
- **Totality.** For all gambles X,Y, either $X \succeq Y$ or $Y \succeq X$.
- **Stochastic Equivalence.** If X and Y have the same probability law over outcomes, then $X \sim Y$. The variables remain distinct objects; indifference is an additional axiom.
- **Simple Expected Utility.** The normalized real utility chart u is defined on every outcome, is measurable, and ranks every pair of simple random variables exactly by finite expected utility: $X \succeq Y$ iff $E[u(X)] \ge E[u(Y)]$. Surjectivity of u is not included here.
- **Stochastic Dominance.** If $P(X>o) \ge P(Y>o)$ for every outcome threshold o, then $X \succeq Y$; if one threshold inequality is strict, $X \succ Y$. Thresholds use the sure-outcome order.
- **Mixture Independence.** For all X,Y,Z and $0<p<1, X \succeq Y$ iff $M_p(X,Z) \succeq M_p(Y,Z)$, where M is the fixed randomized-selection construction described in the background.
- **Negative Affine Anti-Invariance.** For all real $a>0$ and $b, X \succeq Y$ iff $- aY+b \succeq - aX+b$.

## Conclusion

- **Simple Relative Expectation.** For real-utility variables X,Y on the same probability space, if $u(X)- u(Y)$ takes finitely many values, $X \succeq Y$ iff $E[u(X)- u(Y)] \ge 0$. X and Y themselves need not be simple or integrable.

## Proof

Theorem 4. If $D=u(X)- u(Y)$ has finite range, work with the diluted variables $M_{1/2}(X,0), M_{1/2}(Y,0)$. Partition into the finitely many values of D. Transfer each constant difference to the zero branch by Theorem 3. Finite mixture substitution leaves $M_{1/2}(Y,D)$ in place of $M_{1/2}(X,0)$. Independence and Simple EU reduce the comparison to $E[D]\ge 0$. Law invariance permits each rearrangement of branches.

## Notes

Source-based result or immediate restriction/composition. Premises are sufficient; minimality is not claimed. The direct source is recorded separately from the transcription; no translation checker is asserted.

## Sources

- **Symmetries of Value** — Goodsell, Symmetries of value, Noûs 60 (2026), 16–37; DOI 10.1111/nous.12549, Theorem 4, pp. 26–27

<p class='cert'>Record: <code>topics/unbounded-utility/results/symmetry-implies-simple-relative.yaml</code></p>

## Paper references

- **Proof: [Symmetries of value](https://doi.org/10.1111/nous.12549).** Zachary Goodsell (2026). Symmetries of value. Noûs, 60, 16–37. — Theorem 4, pp. 26–27
