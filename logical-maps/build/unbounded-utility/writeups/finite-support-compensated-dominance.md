# Stochastic dominance: finite-support compensation

This is a model of **DU and Shift Invariance** in which **Shift Transfer
fails**. It also preserves Positive Affine Invariance and Reflection
Anti-Invariance. Totality and the continuity principles fail. Thus the
construction separates the question for DU from the stronger question
for DTU, which includes Totality.

**Source and work accounting.** GPT-6 (Codex), 9 September 2026, constructed
this ordering and supplied the proofs below in response to Zachary Goodsell's
question about CDF-area dominance, shifts and continuity. This is an original
construction recorded under Misc.; the use of cones alone does not make a
paper the source of this proof. The work is an elementary cone construction
with a full axiom audit and explicit separating examples. No claim of
literature priority, independent checking or Lean verification is made.

## The ordering

Take all measurable real-valued random variables on the standing atomless
space. The outcome order and normalized utility chart will both be the
ordinary identity on the real line, as verified below.

For a finite signed Borel measure $\sigma$ of total mass zero, write

$$S_\sigma(t)=\sigma((t,\infty)).$$

Let $V$ be the real vector space of these profiles, with functions identified
when they agree Lebesgue-almost everywhere. In particular,
$S_X-S_Y=S_{\mathcal L(X)-\mathcal L(Y)}$ belongs to $V$ for every pair of
gambles. Define

$$P=\{v\in V:v\ge0\ \text{almost everywhere}\},$$

$$N=\left\{n\in V:n\text{ is a compactly supported finite-step function},
                       \ \int_{\mathbb R}n=0\right\},
\qquad C=P+N.$$

Here a finite-step function has only finitely many steps. Such compact
profiles correspond to finitely supported signed measures of mass zero;
their integrals are the signed measures' first moments. Endpoints of the
steps do not affect the equivalence class or integrals. Thus $N$ allows
exactly finite-support zero-mean compensations, including real scalar
multiples of them.

Set

$$X\succeq_C Y\quad\Longleftrightarrow\quad S_X-S_Y\in C. \tag{1}$$

The set $P$ is an additive cone and $N$ is a linear subspace. Consequently
$C$ contains zero, is closed under addition, and satisfies
$v\in C\Longleftrightarrow av\in C$ for every $a>0$. Equation (1) is
therefore reflexive and transitive. It depends only on laws, proving
Stochastic Equivalence.

## Indifference and zero-integral profiles

The indifferent part of this cone is exactly

$$C\cap(-C)=N. \tag{2}$$

For if $v=p+n$ and $-v=q+m$, with $p,q\in P$ and $n,m\in N$, then

$$p+q=-(n+m)\ge0.$$

The right side is integrable with integral zero. Nonnegativity therefore
forces $p=q=0$ almost everywhere, so $v=n\in N$. The converse follows
because $N$ is a subspace contained in $C$.

A useful stronger observation for the examples is

$$v\in L^1,\quad \int v=0
\quad\Longrightarrow\quad
\bigl(v\in C\Longleftrightarrow v\in N\bigr). \tag{3}$$

Indeed, if $v=p+n$, then $p=v-n$ is integrable, nonnegative, and has integral
zero; hence $p=0$. Applying the same observation to $-v$ shows that an
integrable zero-integral profile outside $N$ is incomparable with zero
in the cone ordering, rather than merely non-indifferent.

## Finite expected utility and the DU axioms

Let $X,Y$ have finite support and put $d=S_X-S_Y$. This is a compact finite-step
profile with

$$m=\int d=E[X]-E[Y].$$

Let $h=S_1-S_0=\mathbf1_{[0,1)}$ almost everywhere. If $m\ge0$, then

$$d=mh+(d-mh),\qquad mh\in P,\quad d-mh\in N,$$

so $X\succeq_CY$. Conversely, if $d=p+n\in C$, then $p=d-n$ is compactly
supported and integrable. Thus $m=\int p\ge0$. This proves **Simple
Expected Utility**, in both directions.

In particular, sure outcomes have their ordinary real ordering and every
binary calibration equation gives the identity utility chart. All real
outcomes are available, so **Rich Outcomes** holds. For $a>b>c$, the binary
mixture with probability $(b-c)/(a-c)$ of $a$ and the remaining probability
of $c$ has expectation $b$ and is indifferent to $b$. Thus **Archimedean
Outcomes** holds.

For **Stochastic Dominance**, a dominating pair has $d\ge0$, so $d\in P$.
If dominance is strict at a threshold, right continuity gives an interval
where $d>0$, so $d$ is not zero almost everywhere. The reverse comparison
would imply $-d=p+n$ and hence $d+p=-n$. The same nonnegative-integral-zero
argument used in (2) forces $d=0$, a contradiction. Thus strict dominance
remains strict.

Randomized selection with a common law gives

$$S_{M_p(X,Z)}-S_{M_p(Y,Z)}=p(S_X-S_Y),\qquad 0<p<1.$$

Positive scalar cancellation for $C$ proves the full **Mixture Independence**
biconditional. These facts verify every assumption in the current DU preset,
without assuming Totality.

## The least DU preorder

On the common domain of real utility laws, **every DU preorder preserves all
the weak and strict comparisons of (1)**. Thus this model is a least ordering
for DU itself, before any continuity requirement is added. Simple EU is
available in any DU preorder by the separately recorded
[derivation from the primitive DU assumptions](rich-archimedean-dominance-independence-imply-simple-eu.html).

To prove the claim, suppose $S_X-S_Y=p+n\in C$. A nonzero $p\in P$
is the profile of a nonzero finite signed measure of mass zero. Its positive
and negative Jordan parts have the same finite mass $s>0$. Normalize them
to probability laws $\mu_H,\mu_K$. Then

$$p=s(S_H-S_K),\qquad H\succ K$$

in every DU preorder by strict Stochastic Dominance. Nonnegativity of
the profile almost everywhere gives dominance at every threshold by
right continuity. Nonzero $p$ gives strictness. If $p=0$, put $s=0$
and omit this pair of laws instead.

Likewise, a nonzero $n\in N$ is the profile of a finitely supported signed
measure of mass zero and first moment zero. Normalize its Jordan parts,
of common mass $t>0$, to finite laws $\mu_F,\mu_G$. Then

$$n=t(S_F-S_G),\qquad E[F]=E[G],\qquad F\sim G$$

in every DU preorder by Simple EU. If $n=0$, put $t=0$ and omit these
laws. Equality of survival profiles almost everywhere determines their
signed measures, so the decomposition gives the exact measure identity

$$\mu_X+s\mu_K+t\mu_G=\mu_Y+s\mu_H+t\mu_F. \tag{5}$$

Divide by $w=1+s+t$ to obtain probability laws. Stochastic Equivalence
identifies the two normalized mixtures in (5). Replacing $F$ with the
indifferent $G$, and replacing $H$ with the weakly worse $K$, gives

$$\frac{\mu_X+s\mu_K+t\mu_G}{w}
\succeq
\frac{\mu_Y+s\mu_K+t\mu_G}{w}. \tag{6}$$

These are finite mixtures; Mixture Independence and Stochastic Equivalence
license every branch replacement. When $s>0$, the replacement of $H$ by
$K$ is strict, so (6) is strict too. Terms of zero weight were omitted;
no use of the Independence axiom at a mixture weight of zero is needed.

If $s+t>0$, the common mixture law is
$\lambda=(s\mu_K+t\mu_G)/(s+t)$, and the weight of $X$ or $Y$ in (6)
is $1/w\in(0,1)$. Cancel this common branch by Mixture Independence to
obtain $X\succeq Y$, strictly when $s>0$. If $s=t=0$, (5) just says
$\mu_X=\mu_Y$, so Stochastic Equivalence gives indifference directly.

Every strict comparison of (1) has $p\ne0$: otherwise its profile lies
in $N$ and (2) gives indifference. Thus the argument preserves every
strict comparison as well as every weak one. Since (1) itself satisfies
DU, the least-ordering claim follows. This characterization is part of
the original proof recorded here; it is not attributed to a source theorem.

## Common shifts and other affine transformations

For $a>0$ and real $b$, the survival difference of $aX+b$ and $aY+b$ is

$$d_{a,b}(t)=d((t-b)/a).$$

This invertible transformation preserves $P$. It takes a compact finite-step
function to another one and multiplies its integral by $a$, so it also
preserves $N$ in both directions. It therefore preserves membership in $C$,
proving **Positive Affine Invariance**, including **Shift Invariance**.

Reflection together with comparison reversal sends the profile to
$d(-t)$ almost everywhere: endpoint differences at atoms affect only a
countable null set. This map also preserves $P$, $N$, and $C$ in both
directions, proving **Reflection Anti-Invariance**. These are transformations
of the fixed identity utility chart.

## Incompleteness and failure of full expected utility

Let $U$ be uniform on $[0,1]$ and compare it with the sure outcome $1/2$.
Their survival difference is, almost everywhere,

$$d(t)=\begin{cases}
-t,&0<t<1/2,\\
1-t,&1/2<t<1,\\
0,&\text{otherwise}.
\end{cases}$$

This profile is integrable with integral zero, but is not a finite-step
function, so (3) gives

$$U\not\succeq_C1/2,\qquad 1/2\not\succeq_CU. \tag{4}$$

Thus **Totality** fails. Both gambles have finite expectation $1/2$, so
**Expected Utility** and **Relative Expectation** fail. The two signed areas
are finite and equal, so **CDF-Area Extension** fails too.

By Shift Invariance, $U-1/2$ is likewise incomparable with zero. Its law is
symmetric, giving an explicit failure of **Symmetric Gambles Are Neutral**.
Reflection Anti-Invariance does not force neutrality in this incomplete
ordering.

## A direct Shift Transfer counterexample

Take $p=1/2$, transfer parameter $b=1/2$, $X=U$, and $Y=0$. The two gambles
required to be indifferent by Shift Transfer are

$$A=M_{1/2}(U+1,0),\qquad B=M_{1/2}(U,1).$$

Their common expectation is $3/4$. Their survival difference is

$$S_A(t)-S_B(t)=\begin{cases}
(t-1)/2,&0<t<1,\\
(2-t)/2,&1<t<2,\\
0,&\text{otherwise},
\end{cases}$$

almost everywhere. Its negative and positive integrals are each $1/4$.
It is not a finite-step function, so (3) shows that $A$ and $B$ are
**incomparable**. In particular **Shift Transfer fails**, although common
Shift Invariance holds.

The same example directly refutes **Simple Relative Expectation**. Realize
$U$ and an independent fair coin on the standing space, and use that same
coin to define both gambles: on its first branch set $A=U+1$, $B=U$; on
its second branch set $A=0$, $B=1$. Then the actual difference $A-B$
takes only the values $+1$ and $-1$, with equal probabilities. Its mean is
zero, while the law-based ordering still leaves $A,B$ incomparable.

## Continuity under Vanishing Shifts and L¹ Continuity fail

For every $\varepsilon>0$, choose a positive integer $n$ with
$1/(2n)\le\varepsilon$, and define the simple gamble

$$Q_n=\frac{\lfloor nU\rfloor}{n}+\varepsilon.$$

It satisfies $Q_n\le U+\varepsilon$ pointwise and

$$E[Q_n]=\frac12-\frac1{2n}+\varepsilon\ge\frac12.$$

The probability-zero endpoint $U=1$ does not change this expectation or
finite support. Stochastic Dominance and the already verified Simple EU give

$$U+\varepsilon\succeq_C Q_n\succeq_C1/2
\qquad\text{for every }\varepsilon>0.$$

But (4) says $U\not\succeq_C1/2$. This is exactly a failure of
**Continuity under Vanishing Shifts**. Taking $X_k=U+1/k$ also gives
$E|X_k-U|=1/k\to0$ and $X_k\succeq_C1/2$ for every $k$, while the limit
comparison fails. Thus the recorded upper-section **L¹ Continuity** fails.

The countermodel establishes that DU plus Shift Invariance alone is
insufficient for Shift Transfer. This seed fails Totality. Its separately
recorded [finite-shift total extension](finite-shift-total-extension.html),
added on 13 September 2026, preserves a strict ranking of the transfer pair
and supplies the separation with **DTU** as antecedent. The original seed
and its properties remain unchanged. Its examples also identify the
continuity condition that it lacks.
