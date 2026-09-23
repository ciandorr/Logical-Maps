# Clipped expectation: continuous ultrafilter dominance

Source: Goodsell, *Decision theory unbound*, Appendix B, Lemma 6 and proof
of Theorem 3 (p. 691), Theorems 7, 8, and 10 (pp. 693–695).
Human model: Zachary Goodsell. Recorded and translated by GPT-6 (Codex);
no transcription checker asserted.

With U and $v_X$ as in the exact-ultrafilter model, define

$$X\succeq Y\quad\Longleftrightarrow\quad
\text{for every }\varepsilon>0,
\{t:v_X(t)\ge v_Y(t)-\varepsilon\}\in\mathcal U.$$

This quotients out infinitesimal errors in the ultrafilter comparison.
Reflexivity and transitivity follow using $\epsilon /2$ in each premise and intersecting
sets. If X is not at least as good as Y, some positive $\epsilon$ gives a U-large
set where Y exceeds X by $\epsilon$, which implies $Y\succ X$. This proves Totality.
The affine mixture formula for $v_X$ gives Independence after rescaling $\epsilon$.
Equal laws give equality. Constants and simple variables stabilize, giving
Rich Outcomes and Simple EU. A strict stochastic dominance comparison gives
a fixed positive gap for all sufficiently large t, and so remains strict
after taking this quotient. Thus the model satisfies DTU.

For integrable $X, v_X(t)\to E[X]$ by dominated convergence. Hence two integrable
variables are compared exactly by their finite expectations, including
indifference when those expectations agree. This proves EU, the purpose of
the continuous quotient in the source's Theorem 3.

Reflection negates clipped expectation exactly. For any fixed b,

$$c_t(X+b)-c_t(X)\longrightarrow b,\qquad
|c_t(X+b)-c_t(X)|\le |b|.$$

Dominated convergence gives $v_{X+b}(t)-v_X(t)\to b$, even for nonintegrable X.
Simultaneously shifting X and Y therefore changes their truncated comparison
by a function tending to zero, which the quotient ignores. This proves Shift
Invariance. Reflection and shift do **not** establish scale invariance.

The failed scale flag applies the source's Theorem 10 to this continuous
ultrafilter construction. Its witness and proof-audit limitation are described
in the exact-ultrafilter write-up and `extraction.md`. Thus this is a
source-attributed witness that DTU $+ \operatorname{EU} +$ shift + reflection does not entail
positive affine invariance. The two St Petersburg arguments establish failure
of Countable Sure-Thing and Archimedean Gambles here as well.

No $L^{1}$ Continuity or Relative Expectation flag is inferred from the name
"continuous": the quotient construction and the topic's closure axiom are
different mathematical claims.

## Failure of Comonotonic Sum Invariance

**Addition: Claude (Fable 5.1), 23 September 2026.** This is a property of
the recorded model, not a claim made in the source paper.

Realize a standard Cauchy variable as $C=Q_C(U)=\tan(\pi(U-\tfrac12))$ and
put $X=0$, $Y=C$, $Z=C_+=\max(C,0)$; all are nondecreasing in $U$, so both
pairs $(X,Z)$ and $(Y,Z)$ are comonotonic. Oddness of $c_t$ gives
$v_C(t)=0=v_0(t)$ for every $t$, so $X\sim Y$.

**Doubling-defect identity.** For any nonnegative random variable $V$ and
any $F>0$,

$$2\,\mathbb E[\min(V,F)]-\mathbb E[\min(2V,F)]
 =2\int_{F/2}^{F}P(V>x)\,dx,$$

since $\mathbb E[\min(V,F)]=\int_0^F P(V>x)\,dx$ and
$\mathbb E[\min(2V,F)]=2\int_0^{F/2}P(V>x)\,dx$. For $V=C_+=\max(C,0)$ with
$C$ standard Cauchy the right-hand side is
$\frac2\pi\int_{F/2}^{F}\arctan(1/x)\,dx$, which is positive for every $F$
and increases to $\frac{2\ln2}{\pi}$ as $F\to\infty$.

With $X+Z=C_+$ and $Y+Z=2C_++C_-$, $C_-=\min(C,0)$, symmetry gives
$\mathbb E[\max(C_-,-t)]=-\mathbb E[\min(C_+,t)]$ and therefore

$$v_{X+Z}(t)-v_{Y+Z}(t)=2\int_{t/2}^{t}P(C>x)\,dx
 \longrightarrow\frac{2\ln2}{\pi}>0.$$

Take $\varepsilon=(\ln2)/\pi$. The set $\{t:v_{Y+Z}(t)\ge v_{X+Z}(t)-\varepsilon\}$
is bounded, hence not in the cobounded ultrafilter, while
$v_{X+Z}\ge v_{Y+Z}$ everywhere. Thus $X+Z\succ Y+Z$ although $X\sim Y$:
Comonotonic Sum Invariance fails. Shift Invariance holds in this model, so
this is a genuinely new failure and not a consequence of the recorded
implication from comonotonic invariance to shifts.
`checks/comonotonic_witnesses.py` verifies the closed forms and the limit.
