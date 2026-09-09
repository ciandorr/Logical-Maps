# Simple Relative Expectation and L¹ Continuity imply Relative Expectation

**Claim.** Rich Outcomes + Simple Relative Expectation + L¹ Continuity imply Relative Expectation.

All variables in this proof are in the real utility chart; write their utilities as $X,Y$ to simplify notation. Fix $D=X-Y$ with $\mathbb E|D|<\infty$, and write $m=\mathbb E D$. Simple functions are dense in $L^1$, so choose simple $q_n$ with $\mathbb E|q_n-D|\to0$. Define

$$d_n=q_n+m-\mathbb E q_n.$$

These are still simple, satisfy $\mathbb E d_n=m$, and obey

$$\mathbb E|d_n-D|\leq \mathbb E|q_n-D|+|m-\mathbb E q_n|
\leq 2\mathbb E|q_n-D|\longrightarrow0.$$

Rich Outcomes supplies every finite level needed to form the measurable gambles $X_n=Y+d_n$.

First suppose $m\geq0$. Because $X_n-Y=d_n$ is simple with mean $m$, Simple Relative Expectation gives $X_n\succeq Y$ for every $n$. The actual coupling satisfies $\mathbb E|X_n-X|\to0$. The upper-section clause of L¹ Continuity therefore gives $X\succeq Y$.

This proves the nonnegative-mean direction for every integrable-difference pair. For the converse, suppose $m<0$ and put $c=-m/2>0$. We have

$$\mathbb E[Y-(X+c)]=-m-c=-m/2>0.$$

The direction just proved gives $Y\succeq X+c$. Simple Relative Expectation, applied to the constant difference $c$, gives $X+c\succ X$: its forward weak comparison holds and its reverse weak comparison fails. If $X\succeq Y$, transitivity would give $X\succeq X+c$, a contradiction. Hence $X\not\succeq Y$ whenever $m<0$.

Together these establish exactly $X\succeq Y\iff\mathbb E(X-Y)\geq0$.

The mean correction is essential for obtaining approximants on the required side when $m=0$. The positive perturbation handles strictness without assuming lower-section closure. No Totality, Stochastic Equivalence, Mixture Independence, reflection or affine symmetry is used. Rich Outcomes supplies intermediate real utility levels; it is not silently used to exclude outcomes outside the chart.

**Original work: proof adaptation.** Goodsell's Corollary 5 supplies the approximation idea in the full DTU+Sym context. The present work removes unused assumptions and spells out the mean correction and one-sided-continuity strictness argument. This describes the work for this entry, not literature novelty.

**Attribution.** Source idea: Zachary Goodsell, *Symmetries of value*, Corollary 5, p. 27. Reduced-premise proof: GPT-6 (Codex), 9 September 2026. No independent checker or Lean proof is claimed.
