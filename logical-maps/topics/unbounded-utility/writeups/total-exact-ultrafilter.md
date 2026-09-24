# Clipped expectation: exact ultrafilter dominance

Source: Goodsell, *Decision theory unbound*, Appendix B, Theorems 1, 3,
and 10. Human model: Zachary Goodsell.
Recorded and translated by GPT-6 (Codex); no transcription checker asserted.

Take all real-valued random variables. Let U be an ultrafilter on positive
truncation levels containing every tail $(s,\infty )$. Define $v_X(t)=E[c_t(X)]$
as in the eventual-clipping write-up and set

$$X\succeq Y\quad\Longleftrightarrow\quad
\{t:v_X(t)\ge v_Y(t)\}\in\mathcal U.$$

Reflexivity holds because the entire domain is in U; finite intersections
prove transitivity; the ultrafilter dichotomy proves Totality. The ordering
extends eventual weak comparisons and eventual strictly positive gaps.
Thus its law invariance, Simple EU, richness, and stochastic dominance follow
from the calculations for clipped expectations. Common mixture components
cancel pointwise before taking the ultrafilter, giving Independence.
Reflection negates $v_X$ exactly, giving reflection anti-invariance. These
properties give the DTU package in the topic's random-variable language.

The geometric N from the accompanying eventual model has expectation 2, but
$v_N(t)$<2 for every finite t>2. Therefore N is strictly worse than 2 on this
total ordering as well. This establishes failure of EU, exactly as the source's
Theorem 3 notes. The Countable Sure-Thing and Archimedean Gambles violations
follow from the recorded St Petersburg arguments.

**Scale failure is a source theorem application.** Goodsell's Theorem 10
(pp. 693–695) states that every total ordering constructed in this way fails
Scale Invariance. Its argument uses a pair of attainable clipped-expectation
curves whose difference oscillates in log scale, reverses sign on a doubling
of the truncation parameter, and cannot be neutralized simultaneously in both
phases by an ultrafilter. Apply that theorem to the U just chosen. This does
not assert that all total DTU models fail scale: the 2026 paper constructs
models that satisfy it.

The printed analytic witness has the notation/endpoint issues documented in
`extraction.md`. This model record accepts the published theorem for the scale
flag; it does not claim an independently checked correction of that entire
witness. The explicit EU counterexample and elementary satisfied-axiom
calculations above do not depend on those issues.

## Failure of Comonotonic Sum Invariance

**Addition: Claude (Fable 5.1), 23 September 2026.** This is a property of
the recorded model, not a claim made in the source paper.

Realize a standard Cauchy variable as $C=Q_C(U)=\tan(\pi(U-\tfrac12))$ and
put $X=0$, $Y=C$, $Z=C_+=\max(C,0)$. All three are nondecreasing functions of
$U$, so $(X,Z)$ and $(Y,Z)$ are comonotonic pairs. Oddness of $c_t$ and the
symmetry of $C$ give $v_C(t)=0=v_0(t)$ for every $t$, hence $X\sim Y$.

**Doubling-defect identity.** For any nonnegative random variable $V$ and
any $F>0$,

$$2\,\mathbb E[\min(V,F)]-\mathbb E[\min(2V,F)]
 =2\int_{F/2}^{F}P(V>x)\,dx,$$

since $\mathbb E[\min(V,F)]=\int_0^F P(V>x)\,dx$ and
$\mathbb E[\min(2V,F)]=2\int_0^{F/2}P(V>x)\,dx$. For $V=C_+=\max(C,0)$ with
$C$ standard Cauchy the right-hand side is
$\frac2\pi\int_{F/2}^{F}\arctan(1/x)\,dx$, which is positive for every $F$
and increases to $\frac{2\ln2}{\pi}$ as $F\to\infty$.

Now $X+Z=C_+$ and $Y+Z=2C_+ + C_-$ with $C_-=\min(C,0)$. Since
$c_t(2C_++C_-)=\min(2C_+,t)$ on $\{C\ge0\}$ and $=\max(C_-,-t)$ on
$\{C<0\}$, and $\mathbb E[\max(C_-,-t)]=-\mathbb E[\min(C_+,t)]$ by symmetry,

$$v_{X+Z}(t)-v_{Y+Z}(t)
 =2\,\mathbb E[\min(C_+,t)]-\mathbb E[\min(2C_+,t)]
 =2\int_{t/2}^{t}P(C>x)\,dx>0\qquad\text{for every }t>0.$$

So $\{t:v_{X+Z}(t)\ge v_{Y+Z}(t)\}$ is the whole domain and its reverse is
empty: $X+Z\succ Y+Z$ while $X\sim Y$. Comonotonic Sum Invariance fails.
The gap tends to $(2\ln2)/\pi$. `checks/comonotonic_witnesses.py` verifies
the closed forms, the identity on an exact finite law, and the limit.

## Rational factors

**Addition: Claude (Fable 5.1), 24 September 2026.** The source's Theorem 10
(pp. 693–695) refutes Scale Invariance by comparing $\mu$ with $\mu_2$, the
law of $2X$: the truncated expectations satisfy $E_t\mu_2=E_{2t}\mu$, and the
witness laws are chosen so that the two comparisons reverse under this
doubling. The recorded scale failure is therefore at the rational factor $2$,
and the model also fails Rational Scale Invariance, with the same source
attribution and audit caveats as the Scale Invariance flag.
The same doubling refutes Integer Affine Preservation: $\mu\succ\nu$ is not
carried to $2\mu\succeq2\nu$, since the second set in the theorem's proof
ranks $2\nu$ strictly above $2\mu$.

## Failure of Shift Invariance

**Addition: Zachary Goodsell (argument) and Claude (Fable 5.1)
(verification), 24 September 2026.** A property of the recorded exact
ordering; the source's Theorem 8 claims Shift Invariance only for the
continuous quotients.

Let $C$ be the standard Cauchy variable above, so $v_C(t)=0=v_0(t)$ for
every $t$ and $C\sim0$. Compare $C+1$ with sure $1$. For $t\ge1$,
$c_t(C+1)=1+\operatorname{clip}(C,[-t-1,t-1])$, and removing the upper part
of the symmetric window gives

$$v_{C+1}(t)=1+\mathbb E\bigl[\operatorname{clip}(C,[-t-1,t+1])\bigr]
 -\int_{t-1}^{t+1}P(C>x)\,dx
 =1-\int_{t-1}^{t+1}P(C>x)\,dx<1=v_1(t),$$

the middle expectation vanishing by symmetry. For $0<t<1$, $v_1(t)=t$ while
$v_{C+1}(t)\le t$ with equality only if $C+1\ge t$ almost surely, which is
false. So $\{t:v_{C+1}(t)\ge v_1(t)\}$ is empty and its complement is the
whole domain: $1\succ C+1$ for every choice of the ultrafilter, although
$C\sim0$. Shift Invariance fails at $X=C$, $Y=0$, $b=1$.

The deficit $\int_{t-1}^{t+1}P(C>x)\,dx=\frac1\pi\int_{t-1}^{t+1}\arctan(1/x)\,dx$
tends to $0$, so in the continuous quotient, which allows an $\varepsilon$
of slack at every level, $C+1\sim1$ and Shift Invariance survives, as the
source's Theorem 8 states. The exact ordering has no slack: any balanced
prospect with an unbounded upper tail, shifted by $b>0$, stays strictly
behind sure $b$ at every truncation level. Since this model satisfies DTU,
DTU does not imply Shift Invariance. `checks/exact_shift_witness.py`
verifies the closed forms.
