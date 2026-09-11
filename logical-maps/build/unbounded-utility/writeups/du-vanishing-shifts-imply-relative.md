# DU and continuity under vanishing shifts imply Relative Expectation

**Proved implication:** Rich Outcomes + Archimedean Outcomes + Stochastic
Equivalence + Stochastic Dominance + Mixture Independence + Continuity under
Vanishing Shifts imply Relative Expectation.

Here the continuity assumption is only

\[
\bigl[\forall\varepsilon>0,\ X+\varepsilon\succeq Y\bigr]
\quad\Longrightarrow\quad X\succeq Y.
\tag{VSC}
\]

The proof uses no Totality, Shift Invariance, symmetry or lower-section
continuity. In particular, it proves a stronger implication than the proposed
route through Shift Invariance and Shift Transfer.

**Source and work accounting.** GPT-6 (Codex), Logical Maps project discussion,
9 September 2026. This is a substantial connecting proof using an auxiliary
common-mixture law. Goodsell's unpublished *Unbounded Utility and Background
Risk*, §3, supplies the area-comparison method; *Decision theory unbound*,
§3.2–3.3, supplies the DU framework and finite expected-utility formulation.
The separate project representation proof derives Simple EU from the
current DU preset. The
continuity theorem and auxiliary density construction below are recorded
under Misc., and are not attributed to either paper. This accounts for work
performed for the project, without asserting literature priority or an
independent checker or Lean certificate.

## 1. Framework and the integrable-difference identity

The recorded [finite-lottery representation](rich-archimedean-dominance-independence-imply-simple-eu.html)
derives Simple Expected Utility from the displayed DU premises. Work in
the resulting real utility chart, writing its numerical variables as $X,Y$.
Rich Outcomes supplies every real utility level; the standing realization
conventions supply the laws and shifted variables used below.

For any actually coupled pair with $E|X-Y|<\infty$, put

\[
d(t)=S_X(t)-S_Y(t),\qquad S_X(t)=P(X>t).
\]

The pointwise indicator identity and Fubini give

\[
\int_{\mathbb R}|d(t)|\,dt\le E|X-Y|,
\qquad
\int_{\mathbb R}d(t)\,dt=E(X-Y).
\tag{1}
\]

Indeed, for each pair of finite values $x,y$, the integral of
$\mathbf1_{\{x>t\}}-\mathbf1_{\{y>t\}}$ is $x-y$, and its absolute integral
is $|x-y|$. Thus (1) never subtracts two undefined expectations.

A survival difference is right-continuous and has total variation at most 2.
Both its integrability and its bounded variation will be needed.

## 2. A comparison whose negative part lies in a compact interval

We first establish a finite-mixture lemma using only Simple EU, Stochastic
Dominance and Mixture Independence, with law replacements licensed by
Stochastic Equivalence.

**Lemma.** Suppose the survival difference

\[
g=S_F-S_G
\]

is integrable, nonnegative outside a compact interval, and has
$\int g>0$. Then $F\succ G$.

Choose $R$ large enough that $g\ge0$ outside a smaller interval contained in
$(-R,R)$ and

\[
\int_{-R}^{R}g>0.
\]

On a sufficiently fine finite partition of $[-R,R)$, replace $g$ by its
infimum on each half-open interval, and set the resulting function $n$ to
zero outside $[-R,R)$. This makes $n$ a right-continuous finite-step function
with

\[
n\le g\quad\hbox{everywhere},\qquad \int n>0.
\tag{2}
\]

To justify the last inequality, bounded variation bounds the integral error
of this lower approximation by the partition mesh times the total variation
on the interval. That error tends to zero. At $R$ and outside the partition
the comparison $0\le g$ holds by the choice of $R$.

The signed finite measure given by the negative jumps of $n$ has total mass
zero and survival function $n$. Write its positive and negative parts as
$q\mu$ and $q\nu$, where $q>0$ and $\mu,\nu$ are finitely supported
probability laws. Consequently

\[
n=q(S_\mu-S_\nu),\qquad
E_\mu-E_\nu=\frac1q\int n>0.
\tag{3}
\]

Simple EU gives $\mu\succ\nu$. Set $p=1/(1+q)\in(0,1)$.
By (2)–(3), the survival difference of
$M_p(F,\nu)$ and $M_p(G,\mu)$ is

\[
\frac{g-q(S_\mu-S_\nu)}{1+q}\ge0.
\]

Stochastic Dominance and then Mixture Independence give

\[
M_p(F,\nu)\succeq M_p(G,\mu)\succ M_p(G,\nu).
\]

The strict comparison in the last step follows from $\mu\succ\nu$ by
putting the common $G$ branch first or last as appropriate. Transitivity
and cancellation of the common $\nu$ branch yield $F\succ G$.
This proves the lemma without extending the preference to a total order.

## 3. One auxiliary law for every positive shift

Now suppose $E|X-Y|<\infty$ and $m=E(X-Y)\ge0$. The difference
$d=S_X-S_Y$ satisfies (1).

If $d$ is identically zero, $X,Y$ have the same law and Stochastic
Equivalence gives their indifference. Hence assume $d\not\equiv0$.

Define its local envelope

\[
h(t)=\sup_{|s-t|<2}|d(s)|.
\tag{4}
\]

Right-continuity permits the same supremum to be taken over rational $s$
in the indicated open interval, so $h$ is measurable. If $|Dd|$ denotes
the finite total-variation measure of $d$, then

\[
h(t)\le |d(t)|+|Dd|((t-2,t+2)).
\]

Tonelli therefore gives

\[
\int h\le \int |d|+4|Dd|(\mathbb R)<\infty.
\tag{5}
\]

The right-continuous nonzero function $d$ makes this integral positive.
Choose numbers $R_n\uparrow\infty$, with $R_n\ge n$, such that

\[
\int_{\{|t|>R_n\}}h(t)\,dt\le2^{-n},
\]

and put

\[
r(t)=1+\sum_{n=1}^{\infty}\mathbf1_{\{|t|>R_n\}},
\qquad
K=\int_{\mathbb R}r(t)h(t)\,dt.
\tag{6}
\]

The sum is finite at every finite $t$, $r(t)\to\infty$ as $|t|\to\infty$,
and

\[
0<K\le\int h+\sum_{n=1}^{\infty}2^{-n}<\infty.
\]

Let $Z$ have probability density

\[
f_Z(t)=\frac{r(t)h(t)}K.
\tag{7}
\]

This is a single fixed law, chosen independently of the positive shift.
It need not have a finite expectation.

Fix $0<\varepsilon\le1$. Sufficiently far in either tail,
$r(u)\ge K/\varepsilon$ for every $u\in[t-\varepsilon,t]$.
For all those $u$, the interval in (4) contains $t$, so
$h(u)\ge|d(t)|$. Consequently

\[
\begin{aligned}
S_{Z+\varepsilon}(t)-S_Z(t)
&=P(t-\varepsilon<Z\le t)\\
&=\int_{t-\varepsilon}^{t}f_Z(u)\,du
\ge |d(t)|.
\end{aligned}
\tag{8}
\]

The compact interval outside which (8) holds can depend on $\varepsilon$.
That is sufficient for the finite-mixture lemma.

## 4. Shift, compare, close, and cancel

Use the same fixed mixture lift to form

\[
A=M_{1/2}(X,Z),\qquad B=M_{1/2}(Y,Z).
\]

For $0<\varepsilon\le1$, their shifted survival difference is

\[
g_\varepsilon(t)
=S_{A+\varepsilon}(t)-S_B(t)
=\frac12\bigl(S_{X+\varepsilon}(t)-S_Y(t)\bigr)
 +\frac12\bigl(S_{Z+\varepsilon}(t)-S_Z(t)\bigr).
\tag{9}
\]

Since $S_{X+\varepsilon}\ge S_X$, equation (8) makes (9) nonnegative outside
a compact interval:

\[
g_\varepsilon(t)\ge \frac12\bigl(d(t)+|d(t)|\bigr)\ge0.
\]

Under the actual common mixture lift, $A-B$ is $X-Y$ on the first branch
and zero on the second. Thus

\[
E|A-B|=\frac12E|X-Y|,\qquad E(A-B)=\frac m2.
\]

The pair $A+\varepsilon,B$ also has integrable actual difference, so (1)
applies to give

\[
g_\varepsilon\in L^1,\qquad
\int g_\varepsilon=\frac m2+\varepsilon>0.
\tag{10}
\]

The lemma of section 2 now yields $A+\varepsilon\succ B$. For
$\varepsilon>1$, weak Stochastic Dominance gives
$A+\varepsilon\succeq A+1\succ B$, so in fact

\[
\forall\varepsilon>0,\quad A+\varepsilon\succeq B.
\]

Apply the single upper-section clause (VSC):

\[
A\succeq B.
\]

Mixture Independence cancels the common $Z$ branch, giving $X\succeq Y$.
We have proved

\[
E|X-Y|<\infty,\quad E(X-Y)\ge0
\quad\Longrightarrow\quad X\succeq Y.
\tag{11}
\]

## 5. Strict comparisons and the full biconditional

If $m>0$, apply (11) to $X$ and $Y+m/2$. Their actual difference is
integrable with positive mean $m/2$, so

\[
X\succeq Y+m/2.
\]

Every positive shift of a real-valued variable strictly stochastically
dominates it. For completeness, if $c>0$, some interval $(kc,(k+1)c]$
has positive $Y$-probability, and its upper endpoint supplies a strict
survival comparison for $Y+c$ and $Y$. Thus

\[
X\succeq Y+m/2\succ Y.
\]

If $m<0$, swap the variables to obtain $Y\succ X$, which excludes
$X\succeq Y$. If $m=0$, apply (11) in both directions to get indifference.
Altogether,

\[
\boxed{
E|X-Y|<\infty
\quad\Longrightarrow\quad
\bigl(X\succeq Y\iff E(X-Y)\ge0\bigr).
}
\]

This is Relative Expectation. Both comparisons in the zero-mean case arise
from separate applications of the same upper-section argument.

## Consequences and scope

Relative Expectation implies Simple Relative Expectation and hence the
recorded Shift Transfer principle. Under DU it is also equivalent to
CDF-Area Extension by the existing quantile-area implications. The theorem
therefore supplies the proposed area and transfer consequences without
assuming Shift Invariance first.

Combined with [Relative Expectation plus vanishing-shift continuity](relative-vanishing-shifts-imply-l1.html),
the theorem also gives L¹ Continuity under DU. Conversely, L¹ Continuity
immediately implies (VSC). Thus these two continuity principles are
equivalent under DU, even though (VSC) mentions only constant positive
perturbations of one variable.

There is a precise minimality conclusion. The
[exact CDF-area preorder](cdf-area-preorder.html) itself satisfies DU and
L¹ Continuity, as established in its continuity section. Every DU + (VSC)
model extends that preorder and preserves its strict comparisons, by the
CDF-Area Extension consequence above. On the common real-utility domain,
the exact CDF-area preorder is therefore the **least** such model under
inclusion of weak preference comparisons; it is also the least DU +
L¹ Continuity model. This does not assert that all these models coincide:
an extension can supply further comparisons when both CDF areas are infinite.

The proof applies directly to Rich Outcomes + Simple EU + Stochastic
Dominance + Mixture Independence + (VSC); Stochastic Equivalence follows
from Dominance. The recorded statement uses the more basic DU premises
and its separately proved finite-lottery representation.

No comparison of two undefined individual expectations occurs: the only
unbounded integrations are of actual differences, survival differences,
and the nonnegative envelope defining a probability density. The auxiliary
law is used in a randomized mixture, so no independent-sum principle is
assumed.

## Paper references

- **Background: Unbounded Utility and Background Risk.** Zachary Goodsell (5 June 2026). Unbounded Utility and Background Risk. Unpublished working manuscript. — §3, pp. 7–8: source of the CDF-area comparison method; the new continuity theorem and auxiliary density construction are not attributed to the manuscript
- **Background: [Decision theory unbound](https://doi.org/10.1111/nous.12473).** Zachary Goodsell (2024). Decision theory unbound. Noûs, 58, 669–695. First published online in 2023. — §3.2–3.3, pp. 678–682: source framework and finite expected-utility formulation. The representation from the current DU preset uses the separate project proof rich-archimedean-dominance-independence-imply-simple-eu
