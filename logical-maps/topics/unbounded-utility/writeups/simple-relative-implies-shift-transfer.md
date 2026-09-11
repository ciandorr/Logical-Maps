# Simple Relative Expectation implies Shift Transfer

**Claim.** Simple Relative Expectation implies Transfer of a Shift Across a Mixture, without additional preference axioms.

Fix an eligible pair of real-utility variables $X,Y$, a real number $b$, and $0<p<1$. Here and below arithmetic acts on their normalized utility levels. Set

$$A=M_p(X+b/p,Y),\qquad B=M_p(X,Y+b/(1-p)).$$

The fixed mixture lift uses the same branch event and the same rescaled sample in both variables. Consequently

$$u(A)-u(B)=\begin{cases}b/p,&0\leq w<p,\\-b/(1-p),&p\leq w\leq1.\end{cases}$$

Thus the difference is simple and its expectation is

$$p\frac bp-(1-p)\frac b{1-p}=0.$$

Simple Relative Expectation gives both $A\succeq B$ and $B\succeq A$, as required. Any exceptional fixed endpoint convention affects only finitely many null sample points, so it neither destroys finiteness of the difference's range nor changes its mean.

The argument concerns the actual random variables. It does not replace them by equal-law copies, and it uses only the transformed outcomes already required to state Shift Transfer. In particular, neither Stochastic Equivalence nor Rich Outcomes is a hidden premise.

**Original work: direct consequence.** The work is identifying the two-valued difference and checking that the fixed random-variable mixture convention licenses its use. This is a database connection, with no claim of literature novelty.

**Attribution.** Connecting argument: GPT-6 (Codex), 9 September 2026. The principles themselves were extracted from Zachary Goodsell, *Symmetries of value*, Theorems 3–4. No independent checker or Lean proof is claimed.
