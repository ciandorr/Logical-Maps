# Lexicographic expectation: Hamel tie-break

A total, law-based model of Rich Outcomes, Archimedean Outcomes,
Stochastic Equivalence, Stochastic Dominance, Simple EU, Comonotonic Sum
Invariance, Shift Invariance and **Rational Scale Invariance that is not
Scale Invariant**: $X_1\succ0$ and $\sqrt2X_1\not\succeq0$ for a uniform
$X_1$. It shows that the proof of
[Rational Scale Invariance from Comonotonic Sum Invariance and Totality](comonotonic-sum-totality-imply-rational-scale.html)
cannot be pushed to real factors from those premises, even with dominance
and Simple EU added. Mixture Independence is the DTU principle it fails.

The construction is non-constructive: it uses a Hamel basis and Zorn's
lemma, as the continuous-ultrafilter models in this topic do.

**Source and work accounting.** Claude (Fable 5.1), 24 September 2026, in
response to Zachary Goodsell's session on whether Comonotonic Sum Invariance
gives Positive Affine Invariance. The area rule on integrable widths is
Goodsell's (*Unbounded Utility and Background Risk*, unpublished, §3); the
rational-linear tie-break, the cone completion and the verification are new.
No independent checker or Lean verification is claimed.
`checks/rational_scale_witnesses.py` verifies the named widths.

## Construction

Take real outcomes with identity utility and all real-valued random
variables on the standing atomless standard space. The *width* of a pair is
$h=Q_X-Q_Y$ on $(0,1)$, up to a.e. equality. Let $H$ be the real vector
space of differences of nondecreasing functions on $(0,1)$; every element of
$H$ is a width, since a nondecreasing $f$ is $Q_{f(U)}$ (Rich Outcomes), and
every width lies in $H$. Put

$$H_{\mathrm{fin}}=\{h\in H:\textstyle\int_0^1|h|<\infty\},\qquad
H_0=\{h\in H_{\mathrm{fin}}:\textstyle\int_0^1h=0\},$$

and let $S_0\subset H_0$ be the step functions of integral $0$ (finitely
many values on finitely many intervals). These are $\mathbb Q$-subspaces.

**Three named widths.** Let $X_1$ be uniform on $[-\tfrac12,\tfrac12]$ and
$M=M_{1/2}(X_1,0)$ its half-mixture with sure $0$. Against $0$ their widths
are

$$h_1(u)=u-\tfrac12,\qquad
h_2(u)=Q_M(u)=\begin{cases}2u-\tfrac12&0<u<\tfrac14\\ 0&\tfrac14\le u\le\tfrac34\\ 2u-\tfrac32&\tfrac34<u<1,\end{cases}$$

since $F_M=\tfrac12F_{X_1}+\tfrac12\mathbf 1_{[0,\infty)}$. Both have
integral $0$: $\int_0^{1/4}(2u-\tfrac12)=-\tfrac1{16}$ and
$\int_{3/4}^1(2u-\tfrac32)=\tfrac1{16}$. The widths $h_1,\sqrt2h_1,h_2$
are $\mathbb Q$-linearly independent modulo $S_0$: if
$q_1h_1+q_2\sqrt2h_1+q_3h_2$ is a step function, its derivative vanishes
a.e.; on $(\tfrac14,\tfrac34)$ the slope is $q_1+\sqrt2q_2$, so
$q_1=q_2=0$ because $\sqrt2$ is irrational, and then on $(0,\tfrac14)$ the
slope $2q_3$ gives $q_3=0$.

**The tie-break.** Extend $\{h_1,\sqrt2h_1,h_2\}$ together with a
$\mathbb Q$-basis of $S_0$ to a Hamel basis of the $\mathbb Q$-vector space
$H_0$, and let $\psi:H_0\to\mathbb R$ be the $\mathbb Q$-linear map with

$$\psi(h_1)=1,\qquad\psi(\sqrt2h_1)=-1,\qquad\psi(h_2)=-1,$$

and $\psi=0$ on every other basis element, in particular on $S_0$.

**The infinite-width cone.** Let $W=H/H_{\mathrm{fin}}$, a $\mathbb Q$-vector
space, and $\bar P=\{[h]:h\in H,\ h\ge0\text{ a.e.}\}$. Then $\bar P$ is
closed under addition and positive rational scaling, and it is pointed: if
$[h]=-[h']$ with $h,h'\ge0$ then $h+h'\in H_{\mathrm{fin}}$, and
$0\le h\le h+h'$ gives $h\in H_{\mathrm{fin}}$, so $[h]=0$. By Zorn's lemma
choose a $\mathbb Q$-cone $K\subseteq W$ containing $\bar P$, with
$K\cap-K=\{0\}$, maximal among such cones. $K$ is total: if
$w\notin K\cup-K$, then $K'=K+\mathbb Q_{\ge0}w$ is a strictly larger
$\mathbb Q$-cone, and it is pointed, since $k+qw=-(k'+q'w)$ with $q+q'>0$
would give $w=-(k+k')/(q+q')\in-K$, while $q=q'=0$ gives
$k=-k'\in K\cap-K=\{0\}$; this contradicts maximality.

**The order.** With $h=Q_X-Q_Y$, let $X\succeq Y$ iff

- (i) $h\notin H_{\mathrm{fin}}$ and $[h]\in K$; or
- (ii) $h\in H_{\mathrm{fin}}$ and $\int h>0$; or
- (iii) $h\in H_{\mathrm{fin}}$, $\int h=0$ and $\psi(h)\ge0$.

Write $C$ for the set of such widths. The rule depends only on the laws.
On integrable widths it is the area rule of the
[exact CDF-area model](cdf-area-preorder.html) with $\psi$ breaking exact
ties; $K$ orients every pair with both areas infinite.

## Preorder and Totality

Reflexivity: $0\in H_0$ and $\psi(0)=0$. Transitivity: let $h,h'\in C$.
If neither is in $H_{\mathrm{fin}}$, then $[h+h']=[h]+[h']\in K$, and
$h+h'\notin H_{\mathrm{fin}}$, for otherwise $[h]=-[h']\in K\cap-K=\{0\}$,
contradicting $h\notin H_{\mathrm{fin}}$. If exactly one is in
$H_{\mathrm{fin}}$, say $h'$, then $[h+h']=[h]\in K$ and
$h+h'\notin H_{\mathrm{fin}}$. If both are in $H_{\mathrm{fin}}$, integrals
add, and when both vanish $\psi$ adds. Totality: for
$h\notin H_{\mathrm{fin}}$, $[h]\in K$ or $[-h]\in K$; for
$h\in H_{\mathrm{fin}}$, one of $\int h>0$, $\int(-h)>0$, or $\int h=0$ with
$\psi(h)\ge0$ or $\psi(-h)=-\psi(h)\ge0$.

## Verified principles

**Rich Outcomes, Stochastic Equivalence, the chart.** Immediate. The width
of two constants is $x-y$, so sure outcomes are ordered as $\mathbb R$ and
the normalized chart is the identity (the calibration widths are step
functions, ranked by the next item).

**Simple EU.** For simple $X,Y$ the width is a step function, in
$H_{\mathrm{fin}}$. If $\int h>0$, (ii). If $\int h<0$, then $-h$
satisfies (ii) and $h$ satisfies none of (i)–(iii). If $\int h=0$, then
$h\in S_0$ and $\psi(h)=\psi(-h)=0$, so $X\sim Y$. Simple gambles are ranked
exactly by expectation; Restricted Totality, Restricted Stochastic
Equivalence and Archimedean Outcomes ($b\sim M_p(a,c)$ at
$p=(b-c)/(a-c)$) follow.

**Stochastic Dominance.** Let $h\ge0$ a.e. If $h\in H_{\mathrm{fin}}$ then
$\int h\ge0$, with equality only for $h=0$ a.e., covered by (iii). If
$h\notin H_{\mathrm{fin}}$ then $[h]\in\bar P\subseteq K$. For the strict
clause let $h\ge0$ and not a.e. zero. If $h\in H_{\mathrm{fin}}$, then
$\int(-h)<0$, so $-h\notin C$. If $h\notin H_{\mathrm{fin}}$, then
$[h]\in\bar P\setminus\{0\}$, so $[-h]\notin K$ by pointedness, and
$-h\notin H_{\mathrm{fin}}$, so $-h\notin C$. Statewise Dominance follows.

**Comonotonic Sum Invariance, Shift Invariance.** If $X=f(U)$ and
$Z=g(U)$ with $f,g$ nondecreasing, then $Q_X=f$, $Q_Z=g$ and $Q_{X+Z}=f+g$
a.e., and likewise for $Y$ and $Z$; so the width of $(X+Z,Y+Z)$ is $h$.
The width of $(X+b,Y+b)$ is $h$.

**Rational Scale Invariance.** The width of $(aX,aY)$ is $ah$. For
rational $a>0$: $ah\in H_{\mathrm{fin}}$ iff $h\in H_{\mathrm{fin}}$;
$[ah]=a[h]\in K$ iff $[h]\in K$, as $K$ is a $\mathbb Q$-cone (apply $1/a$
for the converse); $\int ah=a\int h$; and $\psi(ah)=a\psi(h)$. Each clause
is invariant, so $X\succeq Y$ iff $aX\succeq aY$.

## Violations

- **Scale Invariance.** $X_1\succ0$: the width $h_1$ is in $H_0$ with
  $\psi(h_1)=1>0$, and $\psi(-h_1)=-1<0$. But $\sqrt2X_1\not\succeq0$: the
  width is $\sqrt2h_1\in H_0$ with $\psi(\sqrt2h_1)=-1$. Positive Affine
  Invariance fails at $a=\sqrt2$, $b=0$.
- **Mixture Independence.** $X_1\succ0$, but
  $M_{1/2}(X_1,0)\not\succeq M_{1/2}(0,0)\sim0$: the width is $h_2$ with
  $\psi(h_2)=-1$.
- **Expected Utility, Relative Expectation, CDF-Area Extension.** $X_1$ and
  $0$ have equal means and equal finite areas, but $X_1\succ0$.
- **Symmetric Gambles Are Neutral, Reflection Anti-Invariance, Negative
  Affine Anti-Invariance.** $X_1$ has the law of $-X_1$ and $X_1\succ0$.
  Reflection anti-invariance would turn $X_1\succeq0$ into $0\succeq-X_1$,
  which by Stochastic Equivalence is $0\succeq X_1$, false. The same pair
  refutes Negative Affine Anti-Invariance at $a=1$, $b=0$.
- **Continuity.** For every $\varepsilon>0$, $\sqrt2X_1+\varepsilon\succeq0$
  by (ii), the width $\sqrt2h_1+\varepsilon$ having integral $\varepsilon$;
  but $\sqrt2X_1\not\succeq0$. So Continuity under Vanishing Shifts fails,
  and L¹ Continuity fails along $\sqrt2X_1+\tfrac1n$.

## What the model shows

Iterated comonotonic addition reaches every rational multiple of a
comparison and no other. A set of widths closed under addition and
rational scaling need not be closed under real scaling, and Totality,
dominance and Simple EU do not force it: on simple gambles the order is
expectation, which is scale invariant, and the tie-break acts only on
non-simple pairs with equal means. What the model lacks is Mixture
Independence, whose linearity acts in survival coordinates, where dilation
by a real factor is the substitution $t\mapsto t/a$. Whether that structure
forces real scale invariance is
[conjectured-dtu-comonotonic-imply-scale](conjectured-dtu-comonotonic-imply-scale.html).
The model also breaks Continuity under Vanishing Shifts; on bounded gambles
that continuity closes the gap by a sandwich between nearby rational
factors, as noted in the conjecture's record, but unbounded gambles admit
no such sandwich.

## Preservation principles

Rational Scale Invariance with Shift Invariance gives Rational Affine
Preservation, hence Integer Affine Preservation: the weak comparison passes
through both biconditionals, and the strict one through their reverses.
