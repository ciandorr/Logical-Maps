# A smaller sufficient package for Negative Self-Similarity

**Claim.** Totality + Mixture Independence + Negative Affine Anti-Invariance imply Uniqueness of Negative Self-Similarity.

Fix an eligible instance of the principle, with $0<p<1$, $a>0$, $b\in\mathbb R$ and common gamble $Z$. Define, for the variables under consideration,

$$T(V)=-aV+b,\qquad F(V)=M_p(T(V),Z).$$

Negative Affine Anti-Invariance supplies

$$V\succ W\ \Longrightarrow\ T(W)\succ T(V).$$

Indeed, it supplies the weak comparison in this direction, while the opposite weak comparison would imply $W\succeq V$, contradicting strictness. Mixture Independence likewise preserves strictness between first arguments with the same second argument: apply its biconditional to both weak comparison directions. Thus

$$V\succ W\ \Longrightarrow\ F(W)\succ F(V).$$

Suppose now that $X\sim F(X)$ and $Y\sim F(Y)$. If $X\succ Y$, the last implication and the fixed-point indifferences give $Y\succ X$, contradicting the strict part of a preorder. The case $Y\succ X$ is identical. Under Totality, two variables which are not indifferent must be strictly ranked in one of these two directions. Therefore $X\sim Y$.

Only the affine transformations already required by the two fixed-point hypotheses are used. There is no replacement by a same-law variable, no need to construct any additional utility level, and no invocation of expected utility or dominance.

**Original work: proof adaptation.** The mathematical argument is Goodsell's Theorem 10 argument. The new database work is its premise audit: four assumptions from the full source package are unnecessary here. This is not a claim that the uniqueness argument is original to the AI or new in the literature.

**Attribution.** Original uniqueness argument: Zachary Goodsell, *Symmetries of value*, Theorem 10, pp. 30–31. Reduced-premise statement and audit: GPT-6 (Codex), 9 September 2026. No independent checker or Lean proof is claimed.
