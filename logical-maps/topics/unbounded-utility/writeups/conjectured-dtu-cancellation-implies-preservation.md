# DTU turns cancellation into full independent-sum invariance

**Proved:** DTU + Independent Sum Cancellation implies Independent Sum
Preservation. The geometric-noise argument below closes the indifference
gap without a continuity axiom.

The recorded premises are unchanged: Rich Outcomes, Totality, Stochastic
Equivalence, Simple EU, Stochastic Dominance, Mixture Independence and
Independent Sum Cancellation. Rich Outcomes and the total measurable
normalized chart identify the outcome domain with the real utility
levels, so the auxiliary real-valued laws below are available.

**Source and work accounting.** GPT-6 (Codex) recorded the conjecture and
partial analysis on 9 September 2026. Zachary Goodsell asked for its
resolution and gave the strict-comparison contraposition argument on
13 September. GPT-6 (Codex) supplied the geometric-noise construction and
finite-mixture proof on 13 September. Goodsell's *Unbounded Utility and
Background Risk* (unpublished), Lemma 1, pp. 7–8, supplies the separated
sum principles, not this connecting theorem. The record retains its
original ID and conjecture history. No independent checker, literature
priority or Lean verification is claimed.

## Strict comparisons are preserved

If $X\succ Y$ but $Y+Z\succeq X+Z$, Cancellation would give
$Y\succeq X$, a contradiction. Totality of the sums therefore gives

$$X\succ Y\quad\Longrightarrow\quad X+Z\succ Y+Z. \tag{1}$$

This works for every independent noise law, including the auxiliary law
constructed below. Thus Preservation could fail only by breaking a tie.
Suppose $X\sim Y$ and, after exchanging their names if necessary,

$$X+Z\succ Y+Z. \tag{2}$$

## Geometric noise

Let $\nu=\mathcal L(Z)$. Choose an independent geometric count $N$ and
independent copies $Z_1,Z_2,\ldots$ of $Z$, with

$$P(N=n)=2^{-(n+1)}\quad(n=0,1,\ldots),\qquad
W=\sum_{i=1}^{N}Z_i.$$

The empty sum is zero. Since $N$ is finite almost surely, $W$ is a
real-valued gamble; no moment assumption is required. Its probability
law $\rho$ satisfies the exact renewal identity

$$\rho=\tfrac12\delta_0+\tfrac12\nu*\rho,\qquad
2\rho-\nu*\rho=\delta_0. \tag{3}$$

Indeed, conditional on $N\geq1$, the remaining number of summands again
has the law of $N$. Equivalently,
$\rho=\sum_{n\geq0}2^{-(n+1)}\nu^{*n}$. This is an identity of probability
measures, with no limiting inference about preferences.

Stochastic Equivalence allows fresh realizations of the relevant laws,
with $W$ independent of $X,Y,Z$ and the mixture randomizers. The standing
atomless standard space realizes the required countable product of real
laws. We do not need to adjoin independent noise to a previously fixed
variable that already generates the entire sigma-algebra: independent
sums have convolution laws, and the rankings depend only on those laws.

## Two finite mixtures give a contradiction

Set

$$A=M_{2/3}(X,Y+Z),\qquad B=M_{2/3}(Y,X+Z).$$

Since $X\sim Y$, Mixture Independence makes
$A\sim M_{2/3}(Y,Y+Z)$. By (2), Mixture Independence on the other branch
makes $B\succ M_{2/3}(Y,Y+Z)$; exchanging mixture branches is licensed by
Stochastic Equivalence. Hence $B\succ A$. Applying (1) with $W$ gives

$$B+W\succ A+W. \tag{4}$$

Write $\alpha=\mathcal L(X)$ and $\beta=\mathcal L(Y)$, and let $H$
have the probability law

$$\eta=\tfrac12\alpha*\nu*\rho+\tfrac12\beta*\nu*\rho.$$

Using (3),

$$\begin{aligned}
\mathcal L(A+W)
 &=\tfrac23\alpha*\rho+\tfrac13\beta*\nu*\rho\\
 &=\tfrac13\alpha+\tfrac13\alpha*\nu*\rho
                       +\tfrac13\beta*\nu*\rho\\
 &=\tfrac13\alpha+\tfrac23\eta.
\end{aligned}$$

Similarly,

$$\mathcal L(B+W)=\tfrac13\beta+\tfrac23\eta.$$

Thus $A+W$ and $B+W$ have the laws of $M_{1/3}(X,H)$ and
$M_{1/3}(Y,H)$ respectively. Since $X\sim Y$, Mixture Independence and
Stochastic Equivalence give $A+W\sim B+W$, contradicting (4).

No tie can be broken. Every weak comparison is either strict or an
indifference, so this and (1) prove both clauses of Independent Sum
Preservation.

## Scope and consequences

All preference substitutions use **binary mixtures**. The construction
requires neither Countable Sure-Thing nor countable mixture independence,
and uses no continuity or integrability assumption.

Together with the recorded
[Totality + Preservation ⇒ Cancellation](total-preservation-implies-independent-cancellation.html)
and the defining combination of both directions, this makes Cancellation,
Preservation and Independent Sum Invariance equivalent under DTU.

The earlier
[proof with L¹ Continuity](continuous-total-cancellation-implies-preservation.html)
remains valid. Its limiting step is unnecessary for the present theorem.

The auxiliary $W$ generally has infinite support even for finite-valued
$Z$. Cancellation must therefore cover arbitrary independent noise.
This argument does not establish full independent-sum invariance for the
[finite-shift total extension](finite-shift-total-extension.html), whose
verified noise properties concern finite-valued summands.

In cone notation, the same calculation is $R(2I-T)=I$, where $T$ and $R$
are convolution by $\nu$ and $\rho$. If an indifferent vector $v$ were
sent to a strictly positive $Tv$, then $2v-Tv$ would be strictly negative.
Strict preservation by $R$ would make $v$ strictly negative, a
contradiction. The finite-mixture proof above proves this directly
without needing a separate cone representation theorem.
