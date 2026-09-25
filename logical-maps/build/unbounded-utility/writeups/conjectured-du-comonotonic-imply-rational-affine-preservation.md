# Rich Outcomes ∧ Archimedean Outcomes ∧ Stochastic Equivalence ∧ Stochastic Dominance ∧ Mixture Independence ∧ Comonotonic Sum Invariance ⇒ Rational Affine Preservation

<p class='cert'>Conjecture — Source: Misc.; produced by Zachary Goodsell (claim) and Claude (Fable 5.1) (reduction to cancellation and obstruction analysis), 2026-09-24; recorded by Claude (Fable 5.1), 2026-09-24.</p>

## Premises

- **Rich Outcomes.** Every real number r occurs as a utility level of a sure outcome: for each $r \in \mathbb{R}$ there is an outcome $o_r$ with $u(o_r)=r$, with u defined by the normalized binary-mixture comparisons in the background. This does not assert that every outcome has a finite real level.
- **Archimedean Outcomes.** For any three sure outcomes $a \succ b \succ c$, some nontrivial mixture of the outer two is equally good as the intermediate one: $b \sim M_p(a,c)$ for some $p \in (0,1)$. Only the three inputs are sure outcomes. This is the no-infinite-ratios condition, not continuity of preferences over arbitrary gambles.
- **Stochastic Equivalence.** If X and Y have the same probability law over outcomes, then $X \sim Y$. The variables remain distinct objects; indifference is an additional axiom.
- **Stochastic Dominance.** If $P(X>o) \ge P(Y>o)$ for every outcome threshold o, then $X \succeq Y$; if one threshold inequality is strict, $X \succ Y$. Thresholds use the sure-outcome order.
- **Mixture Independence.** For all X,Y,Z and $0<p<1, X \succeq Y$ iff $M_p(X,Z) \succeq M_p(Y,Z)$, where M is the fixed randomized-selection construction described in the background.
- **Comonotonic Sum Invariance.** If X and Z are comonotonic, and Y and Z are comonotonic, then $X \succeq Y$ iff $X+Z \succeq Y+Z$. A pair is comonotonic when its members admit nondecreasing representations in one common uniform random variable.

## Conclusion

- **Rational Affine Preservation.** For every rational $a>0$ and real $b$: if $X \succeq Y$ then $aX+b \succeq aY+b$, and if $X \succ Y$ then $aX+b \succ aY+b$.

## Notes

Does DU with Comonotonic Sum Invariance preserve weak and strict comparisons under every map aX + b with rational a > 0? The integer factors are proved from Rich Outcomes, Stochastic Equivalence and Comonotonic Sum Invariance alone (comonotonic-sum-implies-integer-affine-preservation), so what is open is the factor 1/n, and X ≽ Y ⇒ X/n ≽ Y/n is the cancellation nX′ ≽ nY′ ⇒ X′ ≽ Y′. Cancellation holds with Totality (comonotonic-sum-totality-imply-rational-scale) and fails without Mixture Independence: cdf-area-unit-threshold satisfies Rich Outcomes, Archimedean Outcomes, Stochastic Equivalence, Stochastic Dominance, Simple EU and Comonotonic Sum Invariance, has X* ≽ 0 with X*/2 ⋡ 0, and satisfies Integer Affine Preservation. What would settle it: a proof, which must use Mixture Independence; or a DU model with Comonotonic Sum Invariance in which some nX ≽ nY holds with X ⋡ Y. Under DU with Stochastic Equivalence the order is determined by the width h = Q_X − Q_Y, every pair whose width is bounded below with positive integral is strictly ranked (a step function below the width with positive integral is the width of a simple comonotonic pair, and the shear is comonotonic), and every pair with a step-function width is ranked by its integral; a refuting pair must therefore have equal finite areas, a width unbounded below, or both areas infinite, and its closure under mixtures and comonotonic shears must stay consistent with strict dominance. Proposed tier: none; a human may set one.

## Sources

- **Goodsell claim 24 Sep** — Zachary Goodsell, Logical Maps session, 24 September 2026: claim that under DU Comonotonic Sum Invariance preserves weak and strict order under positive rational affine maps.
- **Claude reduction 24 Sep** — Claude (Fable 5.1), Logical Maps, 24 September 2026: the integer case comonotonic-sum-implies-integer-affine-preservation and the reduction of the remainder to integer cancellation; the unit-threshold model shows Mixture Independence is needed.

<p class='cert'>Record: <code>topics/unbounded-utility/results/conjectured-du-comonotonic-imply-rational-affine-preservation.yaml</code></p>
