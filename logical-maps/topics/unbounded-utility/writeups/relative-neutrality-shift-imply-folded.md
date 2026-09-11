# Relative Expectation, Neutrality and Shift Invariance imply Folded Expectation

**Claim.** Rich Outcomes + Stochastic Equivalence + Relative Expectation + Symmetric Neutrality + Shift Invariance imply Folded Expectation.

Write the real utility variable of a gamble as $X$. Put

$$h_X(t)=\mathbb P(X>t)-\mathbb P(X<-t),\qquad
F(X)=\int_0^\infty h_X(t)\,dt,$$

and suppose $\int_0^\infty|h_X(t)|\,dt<\infty$. Let $S_X(t)=\mathbb P(X>t)$, and set $d(t)=S_X(t)-S_{-X}(t)$.

For positive $t$, $d(t)=h_X(t)$. For negative $t$, $d(t)=h_X(-t)$ except possibly when $t$ or $-t$ is an atom threshold. There are at most countably many such thresholds, so

$$\int_{\mathbb R}|d(t)|\,dt=2\int_0^\infty|h_X(t)|\,dt<\infty,
\qquad \int_{\mathbb R}d(t)\,dt=2F(X). \tag{1}$$

Let $U$ be uniform and $Q_X$ an increasing quantile for $X$. Define

$$A=Q_X(U),\qquad B=-Q_X(1-U).$$

Arbitrary finite values may be assigned at the null quantile endpoints. These have the laws of $X$ and $-X$, and both are nondecreasing functions of $U$. Their upper-threshold events are therefore nested for every threshold, up to null sets. Tonelli's theorem and the elementary interval-length identity give

$$\begin{aligned}
\mathbb E|A-B|
&=\int_{\mathbb R}\mathbb E\left|\mathbf1_{\{A>t\}}-\mathbf1_{\{B>t\}}\right|\,dt\\
&=\int_{\mathbb R}|S_X(t)-S_{-X}(t)|\,dt<\infty.
\end{aligned}$$

Since this integral is finite, Fubini also gives $\mathbb E(A-B)=\int d=2F(X)$.

Now set

$$Z=\frac{A+B}{2}=\frac{Q_X(U)-Q_X(1-U)}2.$$

Replacing $U$ by $1-U$ negates $Z$ without changing its law. Thus Symmetric Neutrality gives $Z\sim0$. Moreover, $A-Z=(A-B)/2$ is integrable with mean $F(X)$. Relative Expectation applied in both directions gives

$$A\sim Z+F(X),$$

because their actual difference has mean zero. Shift Invariance transports $Z\sim0$ to $Z+F(X)\sim F(X)$, and Stochastic Equivalence gives $X\sim A$. Consequently

$$X\sim F(X).$$

The same argument applies to any other foldable $Y$. The standing linear sure-outcome order then yields $X\succeq Y$ exactly when $F(X)\geq F(Y)$.

Rich Outcomes supplies the midpoint, shifted variables and sure folded values. All are finite-chart variables, even when their individual ordinary expectations are undefined. No conditional improper integral is used: the absolute integrability in (1) is what justifies both Tonelli/Fubini steps. Totality, Mixture Independence and full affine symmetry are absent from the proof.

**Original work: proof adaptation.** The source's folded-expectation argument uses a comparison with a symmetric prospect. The present contribution expands that comparison as an explicit quantile coupling and audits which assumptions it needs. This is a reduced-premise connection for the database, not a literature-novelty claim.

**Attribution.** Source construction: Zachary Goodsell, *Symmetries of value*, Theorem 6, pp. 27–29. Explicit coupling proof and premise audit: GPT-6 (Codex), 9 September 2026. No independent checker or Lean proof is claimed.
