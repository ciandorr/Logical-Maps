# CDF-area dominance: simple floors or unit threshold

A model of Rich Outcomes, Archimedean Outcomes, Stochastic Equivalence,
Stochastic Dominance, Simple EU, Comonotonic Sum Invariance and Shift
Invariance in which **iterated comonotonic addition preserves comparisons
but cannot be cancelled**: there is a pair with $2X\succeq2Y$ and
$X\not\succeq Y$. So Totality cannot be dropped from
[comonotonic-sum-totality-imply-rational-scale](comonotonic-sum-totality-imply-rational-scale.html).
Totality, Mixture Independence, Rational Scale Invariance and Scale
Invariance fail.

**Source and work accounting.** Claude (Fable 5.1), 24 September 2026, in
response to Zachary Goodsell's claim that Comonotonic Sum Invariance implies
Positive Affine Invariance. The area rule modified here is Goodsell's exact
CDF-area preorder (*Unbounded Utility and Background Risk*, unpublished, §3);
the floor clause, the threshold and the verification are new. No independent
checker or Lean verification is claimed. `checks/rational_scale_witnesses.py`
verifies the explicit witnesses.

## Construction

Take real outcomes with identity utility and all real-valued random
variables on the standing atomless standard space. For a pair $X,Y$ let

$$h=Q_X-Q_Y\quad\text{on }(0,1),$$

the *width* of the pair, a difference of nondecreasing functions defined up
to almost-everywhere equality. A *step function* is one with finitely many
values, each taken on an interval, so that finitely many intervals partition
$(0,1)$. Define $X\succeq Y$ iff

- (a) there is a step function $s\le h$ a.e. with $\int_0^1 s\ge0$
  (a *simple floor*), or
- (b) $\int_0^1 h_-<\infty$ and $\int_0^1 h\ge1$ (the *unit threshold*).

Write $C$ for the set of widths satisfying (a) or (b). In survival
coordinates $d=S_X-S_Y$, clause (b) reads $A_-<\infty$ and $A_+-A_-\ge1$,
by the identities $\int_0^1h_\pm=\int_{\mathbb R}d_\pm$ of the
[exact CDF-area model](cdf-area-preorder.html). The rule depends only on the
laws of $X$ and $Y$.

## Preorder

Reflexivity: $s=0$. Transitivity: if $h_1,h_2\in C$ then $h_1+h_2\in C$.

- (a)+(a): $s_1+s_2$ is a step function, $s_1+s_2\le h_1+h_2$, and its
  integral is nonnegative.
- (a)+(b): $h_1+h_2\ge s_1+h_2$, so $(h_1+h_2)_-\le(s_1)_-+(h_2)_-$, which
  is integrable because $s_1$ is bounded; and, the negative parts being
  integrable, $\int(h_1+h_2)\ge\int s_1+\int h_2\ge1$.
- (b)+(b): negative parts add to an integrable function and the integral is
  at least $2$.

## Verified principles

**Rich Outcomes, Stochastic Equivalence.** Immediate. Restricted Stochastic
Equivalence follows.

**Sure outcomes and the chart.** The width of two constants is the constant
$x-y$. If $x\ge y$ it is its own floor; if $x<y$ no step function below it
has nonnegative integral and it is below the threshold. So sure outcomes
are ordered as $\mathbb R$, distinct outcomes are never indifferent, and
the normalized chart is the identity: the widths in the calibration
comparisons $b$ against $M_p(1,0)$, and the outer branches, are step
functions, handled by the next item.

**Simple EU.** For simple $X,Y$ the width is a step function. If
$\int h\ge0$ take $s=h$. If $\int h<0$, (a) fails because $s\le h$ forces
$\int h\ge\int s\ge0$, and (b) fails because $\int h<1$. So simple gambles
are ranked exactly by expectation. Hence Restricted Totality, and
Archimedean Outcomes: for $a>b>c$, $b\sim M_p(a,c)$ at $p=(b-c)/(a-c)$,
the two having equal means.

**Stochastic Dominance.** $S_X\ge S_Y$ pointwise iff $h\ge0$ a.e., and then
$s=0$ is a floor. If moreover some tail inequality is strict, the laws
differ, so $h>0$ on a set of positive measure, and $-h\notin C$: a floor
$s\le-h\le0$ with $\int s\ge0$ forces $s=0$ a.e., hence $h\le0$ a.e., a
contradiction; and $\int(-h)\le0<1$. Statewise Dominance follows, since
$X\ge Y$ a.s. gives $S_X\ge S_Y$, and $P(X>Y)>0$ makes the laws differ.

**Comonotonic Sum Invariance.** If $X=f(U)$ and $Z=g(U)$ with $f,g$
nondecreasing, then $Q_X=f$, $Q_Z=g$ and $Q_{X+Z}=f+g$ almost everywhere;
the same holds for $Y$ and $Z$ with their own uniform. So the width of
$(X+Z,Y+Z)$ is $(Q_X+Q_Z)-(Q_Y+Q_Z)=h$, and membership in $C$ is
unchanged.

**Shift Invariance, Reflection Anti-Invariance.** The width of $(X+b,Y+b)$
is $h$. Since $Q_{-X}(u)=-Q_X(1-u)$ a.e., the width of $(-Y,-X)$ is
$u\mapsto h(1-u)$; floors reflect to floors with the same integral, and (b)
is invariant.

## Violations

**The witness.** Let $X^*=3-U^{-1/2}$, so $Q_{X^*}(u)=3-u^{-1/2}$, with
$\int_0^1Q_{X^*}=3-2=1$ and $Q_{X^*}(u)\to-\infty$ as $u\to0$. Its width
against $0$ is $h^*=Q_{X^*}$.

- $X^*\succeq0$ by (b): $h^*$ is integrable and $\int h^*=1$.
- $\tfrac12X^*\not\succeq0$: the width is $\tfrac12h^*$, with integral
  $\tfrac12<1$; no step function lies below it, since a step function is
  bounded below and $\tfrac12h^*$ is not; and it is not nonnegative.

With $X=\tfrac12X^*$ and $Y=0$ this is $2X\succeq2Y$ and $X\not\succeq Y$:
the cancellation direction fails, and Rational Scale Invariance, Scale
Invariance and Positive Affine Invariance fail at $a=\tfrac12$, $b=0$.
Negative Affine Anti-Invariance fails at the same $a,b$: $X^*\succeq0$ but
$0\not\succeq-\tfrac12X^*$, whose width $u\mapsto\tfrac12h^*(1-u)$ is
unbounded below with integral $\tfrac12$.

**Mixture Independence.** $X^*\succeq0$, but
$M=M_{1/2}(X^*,0)\not\succeq M_{1/2}(0,0)\sim0$. The law of $M$ is
$\tfrac12\mathcal L(X^*)+\tfrac12\delta_0$, so $\int Q_M=\tfrac12$; and
since $P(X^*\le0)=P(U\le\tfrac19)=\tfrac19$, $Q_M(u)=Q_{X^*}(2u)$ for
$u<\tfrac1{18}$, unbounded below, so there is no floor; and $Q_M$ is not
nonnegative. The preservation half fails with $Z$ sure $0$ and $p=\tfrac12$.

**Totality, expectation rules, neutrality, continuity.** Let $X=U$ and
$Y=\tfrac12$. The width is $h(u)=u-\tfrac12$, continuous with $\int h=0$.
A floor $s\le h$ with $\int s\ge0=\int h$ would force $s=h$ a.e.,
impossible for a step function; and $\int h<1$. So $U\not\succeq\tfrac12$,
and by the same argument for $\tfrac12-u$, $\tfrac12\not\succeq U$.
Hence Totality fails; Expected Utility and Relative Expectation fail, since
$E[U]=E[\tfrac12]$; CDF-Area Extension fails, since both areas are finite
and equal ($\tfrac18$); Symmetric Gambles Are Neutral fails for the
symmetric $U-\tfrac12$, whose width against $0$ is $h$. For every
$\varepsilon>0$, $U+\varepsilon\succeq\tfrac12$: on $n$ equal intervals the
lower step function of $u-\tfrac12+\varepsilon$ has integral
$\varepsilon-\tfrac1{2n}$, nonnegative once $n\ge1/(2\varepsilon)$. So
Continuity under Vanishing Shifts fails, and L¹ Continuity fails along
$X_n=U+\tfrac1n\to U$.

## What the model shows

Comonotonic Sum Invariance with Stochastic Equivalence and Rich Outcomes
gives $X\succeq Y\Rightarrow kX\succeq kY$ by iterated addition, and here
that holds. The converse needs Totality: without it the order can rank
$2X$ above $0$ by a criterion that $X$ fails. Since Mixture Independence
fails, the model does not decide whether DU with Comonotonic Sum Invariance
gives Rational Scale Invariance.

## Integer and rational preservation

Integer Affine Preservation holds. If $h\in C$ then $kh\in C$ for every
positive integer $k$: a floor $s\le h$ gives the floor $ks\le kh$ with
$\int ks\ge0$, and under (b) $\int(kh)_-<\infty$ with $\int kh\ge k\ge1$.
The strict comparison is preserved too: every $h\in C$ has $\int h\ge0$,
since $\int h\ge\int s\ge0$ under (a) and $\int h\ge1$ under (b); so if
$-h\notin C$, then $-kh\notin C$, because a floor $s\le-kh$ with
$\int s\ge0$ would give the floor $s/k\le-h$, and $\int(-kh)\ge1$ would
give $\int(-h)>0$. Shifts leave $h$ unchanged. Rational Affine Preservation
fails at $a=\tfrac12$, $b=0$: $X^*\succeq0$ but $\tfrac12X^*\not\succeq0$.
So the model separates the integer principle, which iterated comonotonic
addition proves, from the fractional one.

## Paper references

- **Background: Unbounded Utility and Background Risk.** Zachary Goodsell (5 June 2026). Unbounded Utility and Background Risk. Unpublished working manuscript. — §3, pp. 7–8; Theorem 7, pp. 19–20. Source of the CDF-area rule; the floor and threshold clauses are new.
