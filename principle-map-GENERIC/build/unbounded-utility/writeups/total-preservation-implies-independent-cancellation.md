# Under Totality, strict sum preservation supplies cancellation

**Proved implication:** Totality + Independent Sum Preservation implies
Independent Sum Cancellation.

Let $Z$ be independent of $(X,Y)$, and suppose $X+Z\succeq Y+Z$.
If $X\not\succeq Y$, Totality gives $Y\succ X$. The strict clause of
Independent Sum Preservation then gives $Y+Z\succ X+Z$, which includes
$X+Z\not\succeq Y+Z$. This contradicts the assumption. Therefore
$X\succeq Y$.

Consequently, under DTU, **Independent Sum Preservation is equivalent to
Independent Sum Invariance**: cancellation follows by this argument,
and the existing preservation/cancellation decomposition supplies the
biconditional. In an incomplete preorder, lack of $X\succeq Y$ need not
give $Y\succ X$, so the same reasoning does not apply to the incomplete
CDF-area model.

The current Preservation node demands both weak and strict preservation.
Keeping that strict clause visible is essential to this deduction.

**Original work: elementary connecting deduction.** GPT-6 (Codex),
9 September 2026. The definitions were extracted from Zachary Goodsell,
*Unbounded Utility and Background Risk* (unpublished), Lemma 1, pp. 7–8;
the connecting proof above is recorded under Misc., not attributed to the
manuscript. No independent checker or Lean verification is claimed.
