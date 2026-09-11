# Folded Expectation and Mixture Independence imply Relative Expectation

**Claim.** Rich Outcomes + Mixture Independence + Folded Expectation imply Relative Expectation.

Write the finite utility coordinates of the given variables as $X,Y$, and suppose
$\mathbb E|X-Y|<\infty$ in their actual coupling. Put

$$S_X(t)=\Pr(X>t),\qquad d(t)=S_X(t)-S_Y(t).$$

The indicator identity for the interval between two real numbers, followed by
Tonelli and Fubini, gives

$$\int_{\mathbb R}|d(t)|\,dt\le\mathbb E|X-Y|<\infty,
\qquad \int_{\mathbb R}d(t)\,dt=\mathbb E(X-Y). \tag{1}$$

Rich Outcomes supplies the reflected variable $-Y$. Form the actual fixed-lift
mixtures

$$A=M_{1/2}(X,-Y),\qquad B=M_{1/2}(Y,-Y).$$

The second mixture has a symmetric law. For positive $t$, put
$h_Z(t)=\Pr(Z>t)-\Pr(Z<-t)$. Probability-mixture linearity gives

$$h_B(t)=0,\qquad h_A(t)=\tfrac12(h_X(t)-h_Y(t))
=\tfrac12(d(t)+d(-t))\quad\text{a.e.} \tag{2}$$

The last equality can fail only when $t$ or $-t$ is an atom threshold of one
of the laws, a countable and hence Lebesgue-null set. Equations (1) and (2)
show that both mixtures are foldable, with

$$\int_0^\infty|h_A(t)|\,dt\le\tfrac12\int_{\mathbb R}|d(t)|\,dt<\infty,
\qquad F(A)=\tfrac12\mathbb E(X-Y),\qquad F(B)=0.$$

Folded Expectation therefore gives

$$A\succeq B\iff\mathbb E(X-Y)\ge0.$$

Mixture Independence, applied to the common $-Y$ branch, gives
$A\succeq B\iff X\succeq Y$. This is exactly Relative Expectation, including
indifference at zero and the failure of the weak comparison for negative mean.

The proof uses identities of mixture laws to compute folded tails, but it does
not replace one random variable with an equal-law variable in a preference.
Folded Expectation itself licenses the two comparisons being used. Thus neither
Stochastic Equivalence nor Totality is an omitted premise. No L¹ Continuity,
reflection axiom or full affine symmetry is needed.

**Original work: small connecting proof.** The two expectation principles and
the source's forward implication are Zachary Goodsell's. The common-reflected-
mixture proof supplies a converse useful to the map, rather than importing a
claim that the paper already proves that converse. The integrability bound is
essential: conditional improper convergence is insufficient. This accounting
is not a claim of literature novelty.

**Sources.** Zachary Goodsell, *Symmetries of value*, pp. 26–29, especially the
definitions and Theorem 6. Connecting proof and premise audit: GPT-6 (Codex),
9 September 2026. No independent checker or Lean proof is claimed.
