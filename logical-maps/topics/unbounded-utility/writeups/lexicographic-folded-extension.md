# Folded-tail cone: lexicographic extension

**Result.** There exists a model of DTU + Folded Expectation + Relative Expectation
+ CDF-Area Extension + Reflection Anti-Invariance + Shift Invariance which fails
$L^{1}$ Continuity. Scale Invariance, the alternating St Petersburg evaluation and
Uniqueness of Negative Self-Similarity fail too.

The construction assigns the alternating gamble a value *infinitesimally above*
$-1/2$: it is strictly better than $-1/2$ but strictly worse than $-1/2+\varepsilon$
for every real $\varepsilon>0$. The word "infinitesimal" describes comparisons
in an ordered vector space; no hyperreal field is assumed.

## 1. Folded profiles and the base cone

Use all real-valued random variables on the standing sample space, with identity
utility. For each $X$ define its folded-tail profile on $(0,\infty)$ by

$$h_X(t)=\Pr(X>t)-\Pr(X<-t).$$

Let $W$ be the real vector space spanned by these profiles, identifying functions
that agree Lebesgue-almost everywhere. Define the linear subspace

$$N=\left\{g\in W\cap L^1(0,\infty):\int_0^\infty g(t)\,dt=0\right\},
\qquad V=W/N.$$

This quotient is part of the model's construction, not a change to the topic's
standing random-variable objects. Preferences will still be defined on every
actual random variable.

In $W$ put

$$C=\left\{g:\int g_-<\infty,\quad \int g_+\ge\int g_-\right\}.$$

Here either sign area may initially be infinite; membership requires a finite
negative area. Thus the signed integral is well-defined and nonnegative, with
$+\infty$ allowed. Addition and nonnegative scalar multiplication make $C$ a
convex cone. The inequality $(g+k)_-\le g_-+k_-$ and additivity of the
one-sided signed integral prove addition closure. Moreover

$$C\cap(-C)=N,\qquad C+N=C.$$

Indeed membership in both signs makes both areas finite and equal; adding an
integrable zero-integral profile preserves integrability of the negative part
and the integral. Consequently the image $K=C/N$ is a **pointed** convex cone
in $V$: $K\cap(-K)=\{0\}$.

Write $e=[h_1]$. Since $h_1=\mathbf1_{(0,1)}$ a.e., its integral is one and
$e\ne0$. Every integrable profile $g$ has

$$[g]=\left(\int g\right)e. \tag{1}$$

This identity will enforce both ordinary and folded expected-value comparisons
in every pointed cone extending $K$.

## 2. An oscillating profile and a compatible lexicographic plane

Let $A$ be the alternating St Petersburg gamble

$$\Pr(A=(-2)^j)=2^{-j},\qquad j\ge1,$$

and let $q=-1/2$ be a sure outcome. Define $f=[h_A-h_q]$.
For every integer $k\ge1$ and every $t\in(2^k,2^{k+1})$, direct summation of
the geometric tail gives

$$h_A(t)=\sum_{j=k+1}^\infty(-1)^j2^{-j}
=\frac{(-1)^{k+1}}{3\,2^k}. \tag{2}$$

As $h_q(t)=0$ for $t>1/2$, each interval $(2^k,2^{k+1})$ contributes exactly
$1/3$ to the absolute area of $h_A-h_q$, with sign alternating between
positive and negative intervals. Thus **both sign areas are infinite**.
Adding any integrable function cannot change that fact, for either nonzero
scalar multiple of this profile.

It follows that $e,f$ are linearly independent in $V$, and that

$$K\cap\operatorname{span}\{e,f\}=\{a e:a\ge0\}. \tag{3}$$

To check (3), a representative of $ae+bf$ is
$a h_1+b(h_A-h_q)+n$ with $n\in N$. If $b\ne0$, both sign areas remain
infinite, so it is not in $C$. If $b=0$, the profile is integrable with integral
$a$, so membership is equivalent to $a\ge0$.

On this plane define the lexicographic cone

$$D=\{ae+bf:a>0\}\;\cup\;\{bf:b\ge0\}.$$

This is a pointed convex cone, and

$$0<_D f<_D\varepsilon e\qquad\text{for every }\varepsilon>0. \tag{4}$$

The sum $K+D$ is also pointed. If $k_1+d_1=-(k_2+d_2)$ with $k_i\in K$
and $d_i\in D$, then

$$k_1+k_2=-(d_1+d_2)\in K\cap\operatorname{span}\{e,f\}.$$

By (3) the left side is $ae$ for $a\ge0$, while $-ae\in D$ forces $a=0$.
Pointedness of the two original cones now gives $k_1=k_2=d_1=d_2=0$.
Thus adjoining (4) does not collapse any strictly positive comparison in $K$.

## 3. Total extension

Partially order by inclusion the pointed convex cones containing $K+D$.
The union of a chain is still pointed and convex: each forbidden pair or
finite closure operation would already occur in one member of the chain.
Zorn's lemma therefore gives a maximal such cone $T$.

It is total: $T\cup(-T)=V$. Otherwise choose $v$ with neither $v$ nor $-v$
in $T$. Then $T+\mathbb R_{\ge0}v$ remains pointed. Indeed a vector and its
negative in this new cone would give

$$0=t_1+t_2+(a+b)v,\qquad t_1,t_2\in T,\quad a,b\ge0.$$

If $a+b>0$, this puts $-v$ in $T$, a contradiction; if $a+b=0$, pointedness
of $T$ forces both terms to be zero. This would properly enlarge $T$, also
a contradiction. Every nonzero element of $K+D$ stays strictly positive
because a pointed extension cannot also contain its negative.

Define preferences by

$$X\succeq Y\quad\Longleftrightarrow\quad[h_X-h_Y]\in T. \tag{5}$$

The total cone is an existence construction; no comparison algorithm for
arbitrary profiles is claimed.

## 4. Verification of the satisfied principles

**Preordering, Totality and Stochastic Equivalence.** Cone addition gives
transitivity, zero gives reflexivity, and totality of $T$ compares every pair.
Equal laws give identical profiles, so they are indifferent.

**Rich Outcomes and Simple EU.** All reals are outcomes. Simple variables have
integrable folded profiles whose integrals are their ordinary expectations.
Equation (1) compares them exactly by those expectations, including sure
outcomes and all calibrating binary lotteries. Hence the normalized utility
chart is the identity, and every real utility level is realized.

**Mixture Independence.** Probability-mixture linearity gives

$$h_{M_p(X,Z)}-h_{M_p(Y,Z)}=p(h_X-h_Y).$$

For $p>0$, cone membership is unchanged by this multiplication in either
direction, proving the full biconditional.

**Weak and strict Stochastic Dominance.** Put $d=S_X-S_Y$. Except at atom
thresholds,

$$h_X(t)-h_Y(t)=d(t)+d(-t)\qquad(t>0). \tag{6}$$

If $d\ge0$, the profile in (6) is nonnegative and belongs to $C$. If dominance
is strict at some threshold, right-continuity of survival functions supplies
a bounded interval of positive area. Thus (6) has strictly positive finite
or infinite integral. Its class is a nonzero member of $K$, so the comparison
is strict in $T$ too.

**CDF-Area Extension.** Suppose first that $\int_{\mathbb R}d_-<\infty$.
By (6),

$$\int_0^\infty(h_X-h_Y)_-
\le\int_{\mathbb R}d_-<\infty.$$

Change of variables in the well-defined one-sided integral gives

$$\int_0^\infty(h_X-h_Y)=\int_{\mathbb R}d,$$

including $+\infty$. If the latter is positive the class is strictly positive
in $K$; if zero it vanishes in $V$; if negative it is strictly negative.
When only $\int d_+$ is finite, apply the same reasoning to $-d$. These
are exactly all comparisons required by CDF-Area Extension, with strictness
and equality preserved. Both-infinite pairs remain unrestricted by that axiom.

**Relative Expectation.** If the actual difference $X-Y$ is integrable,
the indicator and Fubini formulas give $d\in L^1(\mathbb R)$ and
$\int d=\mathbb E(X-Y)$. Equations (1) and (6) therefore give exactly the
required sign comparison.

**Folded Expectation.** If $h_X,h_Y$ are both integrable, equation (1) gives
$[h_X-h_Y]=(F(X)-F(Y))e$. Definition (5) compares them exactly by their
folded expectations.

**Reflection Anti-Invariance.** The exact identity $h_{-X}=-h_X$ gives
$h_{-Y}-h_{-X}=h_X-h_Y$. Thus reversing and reflecting a comparison leaves
its class unchanged.

**Shift Invariance.** For every real $b$, the pointwise difference
$(X+b)-X=b$ is integrable. The Relative Expectation computation above gives

$$[h_{X+b}-h_X]=be.$$

Consequently shifting both compared variables leaves their difference class
unchanged. This argument requires no individual integrability of $X$ or $Y$.

## 5. Explicit failures

By (1), $[h_q]=qe$, and by definition $[h_A]=qe+f$. Equations (4) and (5)
therefore give

$$q\prec A\prec q+\varepsilon\qquad(\varepsilon>0). \tag{7}$$

For **failure of the recorded upper-section L¹ Continuity**, take
$X_n=q+1/n$, $X=q$, and $Y=A$. Their actual-coupling distances satisfy
$\mathbb E|X_n-X|=1/n\to0$, and every $X_n\succeq Y$, but $X\not\succeq Y$.
No lower-section continuity is assumed or needed for this witness.

For the **scaling reversal**, use the law identity

$$A\overset d=M_{1/2}(-2A,-2).$$

It gives $[h_A]=-[h_{2A}]/2-e$, hence

$$[h_{2A}]=-e-2f.$$

Thus $A\succ-1/2$, while $2A\prec-1$. Scale Invariance fails at scale two.
The first of these inequalities also directly refutes the specified alternating
St Petersburg value.

For **failure of Uniqueness of Negative Self-Similarity**, both $A$ and sure
$q=-1/2$ satisfy $X\sim M_{1/2}(-2X,-2)$. For $A$ this follows from the
law recursion and Stochastic Equivalence; for $q$ it is Simple EU. Yet (7)
says $A\not\sim q$.

## Attribution, original work and limits

**Original work: substantial model adaptation and separation.** Zachary
Goodsell supplies the base area-preorder idea, the folded-tail evaluation
principle, the alternating-gamble recursion and the use of total cone
extensions. The present model changes the ordered space to folded profiles
modulo all zero-integral $L^{1}$ profiles, adds the compatible infinitesimal plane,
and proves the explicit continuity separation. Its direct source is **Misc.**,
with GPT-6 (Codex) credited for that adaptation. This is an account of work
performed for the map, not a claim of literature priority.

The construction does **not** contradict *Symmetries of value*, Corollary 5:
that result assumes full affine symmetry, including Scale Invariance, which
fails here. The source's unpublished erroneous symmetric-extension theorem
is not invoked. The extension step in §3 is proved directly and imposes no
additional convolution or scaling invariance.

The diagnostic `checks/lexicographic_folded_extension.py` checks the exact
dyadic tail formula, the repeated positive/negative area contributions,
lexicographic witness inequalities and the distributional recursion. It does
not simulate Zorn's lemma or certify arbitrary infinite-dimensional claims.
No independent checker or Lean proof is claimed.

**References.** Zachary Goodsell, *Symmetries of value*, pp. 27–31 and §5,
pp. 33–37; *Unbounded Utility and Background Risk*, unpublished manuscript,
§3, pp. 7–8 (the base area preorder only). Model adaptation and proofs:
GPT-6 (Codex), 9 September 2026.
