# Rich Outcomes ∧ Archimedean Outcomes ∧ Totality ∧ Stochastic Equivalence ∧ Stochastic Dominance ∧ Mixture Independence ∧ Comonotonic Sum Invariance ⇒ Scale Invariance

<p class='cert'>Conjecture — Source: Misc.; produced by Zachary Goodsell (question) and Claude (Fable 5.1) (formulation and obstruction analysis), 2026-09-24; recorded by Claude (Fable 5.1), 2026-09-24.</p>

## Premises

- **Rich Outcomes.** Every real number r occurs as a utility level of a sure outcome: for each $r \in \mathbb{R}$ there is an outcome $o_r$ with $u(o_r)=r$, with u defined by the normalized binary-mixture comparisons in the background. This does not assert that every outcome has a finite real level.
- **Archimedean Outcomes.** For any three sure outcomes $a \succ b \succ c$, some nontrivial mixture of the outer two is equally good as the intermediate one: $b \sim M_p(a,c)$ for some $p \in (0,1)$. Only the three inputs are sure outcomes. This is the no-infinite-ratios condition, not continuity of preferences over arbitrary gambles.
- **Totality.** For all gambles X,Y, either $X \succeq Y$ or $Y \succeq X$.
- **Stochastic Equivalence.** If X and Y have the same probability law over outcomes, then $X \sim Y$. The variables remain distinct objects; indifference is an additional axiom.
- **Stochastic Dominance.** If $P(X>o) \ge P(Y>o)$ for every outcome threshold o, then $X \succeq Y$; if one threshold inequality is strict, $X \succ Y$. Thresholds use the sure-outcome order.
- **Mixture Independence.** For all X,Y,Z and $0<p<1, X \succeq Y$ iff $M_p(X,Z) \succeq M_p(Y,Z)$, where M is the fixed randomized-selection construction described in the background.
- **Comonotonic Sum Invariance.** If X and Z are comonotonic, and Y and Z are comonotonic, then $X \succeq Y$ iff $X+Z \succeq Y+Z$. A pair is comonotonic when its members admit nondecreasing representations in one common uniform random variable.

## Conclusion

- **Scale Invariance.** For every real $a>0, X \succeq Y$ iff $aX \succeq aY$.

## Notes

Does DTU with Comonotonic Sum Invariance give Scale Invariance for every real factor? Under these premises Shift Invariance (comonotonic-sum-implies-shift) and Rational Scale Invariance (comonotonic-sum-totality-imply-rational-scale) are proved, so the conclusion is equivalent to Positive Affine Invariance (shift-scale-imply-positive-affine) and only irrational factors are at issue. In quantile coordinates the order is a ℚ-cone of width functions Q_X − Q_Y and dilation by a is multiplication by a; in survival coordinates Mixture Independence makes it a convex ℝ-cone and dilation is the substitution t ↦ t/a. Rational dilations preserve the cone; an irrational one is a limit of rational ones, and the question is whether the cone is closed enough for the limit to pass. What would settle it: a proof, which must use Mixture Independence, because lexicographic-hamel-tie-break satisfies every other premise, Simple EU included, and violates the conclusion; or a model of DTU with Comonotonic Sum Invariance that fails Scale Invariance, which would also show that package consistent, something no recorded model does (conjectured-total-comonotonic-area-extension). A continuity assumption closes the gap on bounded gambles only: for |X|, |Y| ≤ M and rational q within ε/M of a, Stochastic Dominance gives aX ≽ qX − ε and qY ≽ aY − ε, so aX + 2ε ≽ aY whenever X ≽ Y, and Continuity under Vanishing Shifts removes the shift; unbounded gambles do not admit this sandwich. Proposed tier: none; a human may set one.

## Sources

- **Goodsell question 24 Sep** — Zachary Goodsell, Logical Maps session, 24 September 2026: claim that Comonotonic Sum Invariance implies Positive Affine Invariance, with the passage from rational to real factors left open.
- **Claude formulation 24 Sep** — Claude (Fable 5.1), Logical Maps, 24 September 2026: precise DTU formulation, and the two models showing which premises the rational-factor proof cannot spare; see writeups/lexicographic-hamel-tie-break.md.

<p class='cert'>Record: <code>topics/unbounded-utility/results/conjectured-dtu-comonotonic-imply-scale.yaml</code></p>
