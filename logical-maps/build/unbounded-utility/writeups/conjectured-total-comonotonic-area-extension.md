# CDF-area: total comonotonic extension

**Conjectured model, not constructed:** a preorder satisfying DTU,
CDF-Area Extension, and Comonotonic Sum Invariance.

The precise proposed package is Rich Outcomes, Totality, Stochastic
Equivalence, Simple Expected Utility, Stochastic Dominance, Mixture
Independence, CDF-Area Extension, and Comonotonic Sum Invariance. The proposed
outcome space is $\mathbb R$ with identity utility. No reflection, neutral
symmetry, independent-sum, or continuity requirement is imposed.

## The starting model is already known

Goodsell's exact CDF-area preorder declares $X\succeq_RY$ when

$$\int(S_X-S_Y)_-<\infty,
\qquad \int(S_X-S_Y)_+\ge\int(S_X-S_Y)_-.$$

It satisfies DU and the proposed additional principles, but fails the
Totality axiom needed for DTU. In particular,
comonotonic invariance follows from the separate area identities

$$\int(S_X-S_Y)_\pm
  =\int_0^1(Q_X-Q_Y)_\pm,$$

and from adding the same increasing quantile $Q_Z$ to $Q_X,Q_Y$.
Both identities allow infinite areas. See the
[existing construction and verification](cdf-area-preorder.html).

The need for totality is real: pairs with both signed areas infinite remain
incomparable in this exact model, including a standard symmetric Cauchy
variable versus zero.

The discussion immediately before Theorem 7, p. 19, already identifies a
broader comonotonic consistency question as unsettled in the manuscript.
Theorem 7's partial answer uses the incomplete area relation. The present
entry specifies a total CDF-area extension as the target; it does not
attribute a proof or proposal of that exact package to the source.

## Why the existing total-extension proof does not answer this

The [total independent-sum extension](conjectured-total-independent-sum-extension.html)
uses linear convolution operators on differences of survival functions.
Positive sums of those operators are positive multiples of another
convolution operator. That property makes its orientation and saturation
argument work.

Comonotonic addition is instead translation in quantile coordinates:

$$(Q_X,Q_Y)\longmapsto(Q_X+Q_Z,Q_Y+Q_Z).$$

Its preservation for the seed area relation does not show preservation for
newly adjoined comparisons. Meanwhile Mixture Independence is conveniently
linear in survival coordinates and is not generally linear in quantiles.
Thus simply repeating the convolution proof with a different word for its
operators does not prove this candidate.

## What would settle the entry

A positive solution must complete the order while preserving every weak
and strict area comparison, full Mixture Independence, and both directions
of the comonotonic-sum comparison. A negative solution must give an explicit
incompatibility from the displayed package. Requiring only an arbitrary
total extension would not answer the question.

This candidate asks for a model of the comonotonic instance specifically.
The existing total independent-sum model already supplies a model of
Existential Copula Sum Invariance using the product copula, so the weaker
existential-copula consistency question is not being reopened here.

**Original work: precise candidate formulation and obstacle analysis.**
Goodsell's *Unbounded Utility and Background Risk* (unpublished), §3,
pp. 7–8, and the discussion before Theorem 7 and Theorem 7, pp. 19–20,
supply the area construction, comonotonic claim, and broader consistency
question. GPT-6 (Codex), 9 September 2026, formulated this precise
total-extension entry and recorded the gap. The candidate's direct source
is Misc.; the underlying construction remains attributed to Goodsell.
No new completed construction, literature novelty, independent check,
or Lean verification is claimed.

## Paper references

- **Background: Unbounded Utility and Background Risk.** Zachary Goodsell (5 June 2026). Unbounded Utility and Background Risk. Unpublished working manuscript. — §3, pp. 7–8, and discussion before Theorem 7 and Theorem 7, pp. 19–20: CDF-area construction, its comonotonic invariance, and the broader unresolved consistency question
