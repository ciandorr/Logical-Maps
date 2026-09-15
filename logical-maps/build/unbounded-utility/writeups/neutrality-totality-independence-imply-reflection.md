# Rich Outcomes ∧ Totality ∧ Stochastic Equivalence ∧ Mixture Independence ∧ Symmetric Gambles Are Neutral ⇒ Reflection Anti-Invariance

<p class='cert'>Result — Source: Unbounded Utility and Background Risk (unpublished); produced by Zachary Goodsell (unpublished manuscript); recorded by GPT-6 (Codex), 2026-09-09; extraction and random-variable translation.</p>

## Premises

- **Rich Outcomes.** Every real number r occurs as a utility level of a sure outcome: for each $r \in \mathbb{R}$ there is an outcome $o_r$ with $u(o_r)=r$, with u defined by the normalized binary-mixture comparisons in the background. This does not assert that every outcome has a finite real level.
- **Totality.** For all gambles X,Y, either $X \succeq Y$ or $Y \succeq X$.
- **Stochastic Equivalence.** If X and Y have the same probability law over outcomes, then $X \sim Y$. The variables remain distinct objects; indifference is an additional axiom.
- **Mixture Independence.** For all X,Y,Z and $0<p<1, X \succeq Y$ iff $M_p(X,Z) \succeq M_p(Y,Z)$, where M is the fixed randomized-selection construction described in the background.
- **Symmetric Gambles Are Neutral.** If $u(X)$ and $- u(X)$ have the same law, then $X \sim 0$.

## Conclusion

- **Reflection Anti-Invariance.** $X \succeq Y$ iff $- Y \succeq - X$, using the one fixed normalized origin 0.

## Proof

Suppose $X \succeq Y$ but not $- Y \succeq - X$. Totality gives $- X \succ - Y$. Mixture Independence (including its strict consequence), transitivity, and Stochastic Equivalence to interchange mixture branches give $M_{\frac{1}{2} }(X,- X) \succ M_{\frac{1}{2} }(Y,- Y)$. Each mixture has a symmetric law, so Symmetric Neutrality makes both indifferent to 0, a contradiction. Therefore $- Y \succeq - X$. Applying the same implication to −Y,−X proves the converse. Rich Outcomes supplies the reflected variables.

## Notes

The draft calls Symmetric Neutrality “Reflection Symmetry”. This argument does not use the failed extension lemma.

## Sources

- **Unbounded Utility and Background Risk (unpublished)** — Zachary Goodsell, Unbounded Utility and Background Risk, 5 June 2026, unpublished manuscript marked “do not cite” and erroneous; p. 12 n. 1 (continuing on p. 13)

<p class='cert'>Record: <code>topics/unbounded-utility/results/neutrality-totality-independence-imply-reflection.yaml</code></p>

## Paper references

- **Proof: Unbounded Utility and Background Risk.** Zachary Goodsell (5 June 2026). Unbounded Utility and Background Risk. Unpublished working manuscript. — p. 12 n. 1 (continuing on p. 13)
