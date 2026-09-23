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
