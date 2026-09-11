# Relative Expectation and Dominance recover CDF-area comparisons

**Proved implication:** Rich Outcomes + Archimedean Outcomes + Stochastic
Dominance + Relative Expectation imply CDF-Area Extension.

**Original work: connecting argument and proof adaptation.** GPT-6 (Codex),
9 September 2026, combines the existing quantile-area identity with a
one-sided truncation of the utility difference. Goodsell's unpublished
*Unbounded Utility and Background Risk*, §3, supplies the area rule;
this converse is a project connecting proof, not attributed as a theorem
from that manuscript. No independent checker, Lean verification or
literature-novelty claim is made.

## Framework and the quantile identity

Archimedean Outcomes makes the utility chart total; its measurability is a
standing chart convention. Rich Outcomes supplies every finite real level
used below. Write numerical utility variables as \(X,Y\), and put

\[
d(t)=S_X(t)-S_Y(t),\qquad A_\pm=\int_{\mathbb R}d_\pm(t)\,dt.
\]

Dominance implies Stochastic Equivalence, so preferences can be transferred
to new realizations once their marginal laws have been checked. Let \(U\)
be uniform on the standing sample space and set
\(A=Q_X(U), B=Q_Y(U)\) using increasing quantiles. These have the original
marginal laws. Assign finite valid outcomes at the null quantile endpoints.

For each threshold, the upper-level events of these two nondecreasing
functions of \(U\) are nested. Thus

\[
P(A>t,B\le t)=(S_X(t)-S_Y(t))_+.
\]

Integrating the elementary identity
\((a-b)_+=\int\mathbf1_{\{b\le t<a\}}\,dt\) and applying Tonelli gives

\[
E[(A-B)_+]=A_+,\qquad E[(A-B)_-]=A_-.
\tag{1}
\]

These equalities allow infinite values and do not subtract two infinities.

## Both areas finite

If \(A_+,A_-<\infty\), equation (1) shows that the actual difference
\(A-B\) is integrable, with mean \(A_+-A_-\). Relative Expectation gives
\(A\succeq B\iff A_+\ge A_-\). Stochastic Equivalence transfers both
directions to \(X,Y\), including indifference when the areas are equal.

## Exactly one infinite area

Suppose \(A_+=\infty\) and \(A_-<\infty\). Put \(D=A-B\), and for a
positive integer \(N\) define

\[
Z_N=B+\min(D_+,N)-D_-.
\]

This is a measurable finite-valued-at-each-state utility variable, so the
full real chart realizes it as a gamble. It need not be a *simple* gamble.
Pointwise, \(Z_N\le A\), and

\[
E|Z_N-B|\le N+A_-<\infty,\qquad
E[Z_N-B]=E[\min(D_+,N)]-A_-\longrightarrow+\infty.
\]

Choose \(N\) with positive mean. Relative Expectation gives
\(Z_N\succ B\), while pointwise domination gives stochastic domination,
hence \(A\succeq Z_N\). In a preorder, a weak comparison followed by a
strict comparison is strict, so \(A\succ B\). Transfer to \(X,Y\) by
Stochastic Equivalence. The case \(A_+<\infty,A_-=\infty\) follows by
exchanging the variables and gives \(Y\succ X\).

These are all cases constrained by CDF-Area Extension. When both areas are
infinite, neither that principle nor this proof demands a comparison.

## Consequence under DU

DU supplies the outcome and dominance premises. Combined with the already
recorded implication from CDF-Area Extension to Relative Expectation,
this establishes their equivalence under DU. No continuity, mixture
independence, totality or affine symmetry is used in this proof.

## Paper references

- **Background: Unbounded Utility and Background Risk.** Zachary Goodsell (5 June 2026). Unbounded Utility and Background Risk. Unpublished working manuscript. — §3, pp. 7–8: source of the CDF-area comparison. The existing project writeups/cdf-area-preorder.md and results/cdf-area-implies-relative.yaml contain related quantile-area and integrable-difference calculations
