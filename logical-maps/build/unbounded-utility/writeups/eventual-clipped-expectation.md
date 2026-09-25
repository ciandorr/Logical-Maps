# Clipped expectation: eventual dominance

Source: Goodsell, *Decision theory unbound*, Theorem 2, pp. 683–685;
Theorems 7 and 9, p. 693. Human model: Zachary Goodsell.
Recorded and translated by GPT-6 (Codex); no transcription checker asserted.

Take $O=\mathbb{R}$, all measurable random variables, and

$$c_t(x)=\max(-t,\min(x,t)),\qquad v_X(t)=\mathbb E[c_t(X)].$$

Define $X\succeq Y$ iff there is s such that $v_X(t)\ge v_Y(t)$ for every $t>s$.

Reflexivity is immediate; transitivity follows by taking the larger of the
two thresholds. Equal-law variables have identical v-functions. Constants
have $v_x(t)=x$ for all sufficiently large t. Hence Rich Outcomes holds,
and finite mixtures of constants have their usual expected utilities.
In particular Simple EU and Archimedean Outcomes hold.

For a randomized mixture, $v_M(t)=p v_X(t)+(1-p)v_Z(t)$. Since $p>0$, comparison
with a common Z cancels, proving Independence. The recorded implication using
Stochastic Equivalence gives Sure-Thing.

For first-order dominance, use the tail-integral identity for clipped
expectations. The difference $v_X(t)-v_Y(t)$ is the integral of the difference
of the upper-tail functions on [-t,t]. It is nonnegative. If one tail
inequality is strict, right continuity supplies an interval with positive
integral; all sufficiently large truncations therefore have a positive gap.
The preference is strictly better. This proves the weak and strict dominance
clauses, and the topic's Statewise Dominance consequence follows. Thus this
is a DU model. It is not a DTU model, since Totality fails as shown below.

Reflection gives $v_{-X}(t)=-v_X(t)$. Positive rescaling gives
$v_{aX}(t)=a v_X(t/a)$; eventual comparisons are unchanged by this
reparametrization. Thus reflection and scale invariance hold. No Shift
Invariance flag is needed or claimed here.

If X has symmetric law, every clipped expectation is zero by the oddness of
$c_t$. Thus $X\sim 0$ in this model, verifying Symmetric Gambles Are Neutral even
though Totality fails.

## Failure of Totality

Let A take $(-2)^n$ with probability $2^{-n}, n\ge 1$. At $t=2^k$,

$$v_A(2^k)=\sum_{n=1}^k(-1)^n+
              2^k\sum_{n>k}(-1)^n2^{-n}
          =\begin{cases}-2/3&k\text{ odd},\\-1/3&k\text{ even}.\end{cases}$$

Consequently neither $A\succeq -1/2$ nor $-1/2\succeq A$ holds: each comparison fails at
arbitrarily large truncation levels. This is an explicit incomparability,
not a conclusion drawn from failing to find a comparison.
It also directly violates the node Alternating St Petersburg $= - 1/2$.

## Failure of Expected Utility and L¹ Continuity

Let N take n with probability $2^{-n}, n\ge 1$. Then $E[N]=2$ but, for integer $k\ge 1$,

$$v_N(k)=\mathbb E[\min(N,k)]=2-2^{1-k}<2.$$

The same strict bound holds at every finite truncation level above 2.
Thus $2\succ N$ and EU is false. For the continuity witness, put

$$N_k=\min(N,k)+2^{1-k}.$$

Each $N_k$ is simple and has expectation 2, so $N_k\sim 2$. Yet
$E|N_k-N|\le 2\cdot 2^{1-k}\to 0$ and N is not at least as good as 2. This violates
exactly the recorded upper-section $L^{1}$ Continuity clause.

## Failure of the two gamble-level principles

The recorded Countable Sure-Thing counterargument uses only Rich Outcomes,
Simple EU, and Sure-Thing, all verified above. It therefore applies to this
model. For Archimedean Gambles, S with $P(S=2^n)=2^{-n}$ is better than every
constant: its truncations at $2^k$ have expectation $k+1$. For $p>0$,
$M_p(S,0)$ likewise has unbounded truncated expectations. Hence $S\succ 1\succ 0$
but no such mixture is indifferent to 1.

`checks/countermodels.py` verifies representative exact witness calculations.
The universal statements above are analytic proofs, not conclusions from
finite sampling.

## Failure of Shift Invariance

**Addition: Claude (Fable 5.1), 15 September 2026.** This is a property of
the recorded model, not a claim made in the source paper.

Let X have a symmetric Laplace law, or any symmetric integrable law with
unbounded support. Oddness of $c_t$ gives $v_X(t)=0=v_0(t)$, so $X\sim 0$. For $b>0$,

$$v_{X+b}(t)-v_b(t)
 =\mathbb E\bigl[\max(-t-b,\min(X,t-b))\bigr]
 =-\mathbb E[(X-(t-b))_+]+\mathbb E[(-X-(t+b))_+]
 =-\bigl(\mathbb E[(X-(t-b))_+]-\mathbb E[(X-(t+b))_+]\bigr),$$

using the symmetry of X for the last step. Unbounded support makes
$E[(X-s)_+]$ strictly decreasing in s, so the bracket is positive for every t
and $X+b\prec b$ for all sufficiently large t, indeed for all t. Since $X\sim 0$ but
$X+b\prec 0+b$, Shift Invariance fails; consequently Positive Affine Invariance
fails, and by the recorded implications so do Transfer of a Shift Across a
Mixture and Simple Relative Expectation. Expected Utility already fails in
this model; the same pair, being integrable with equal means, is a second
witness.

## Failure of Comonotonic Sum Invariance

**Addition: Claude (Fable 5.1), 23 September 2026.** The flag was already
derived from the shift failure above; this is an explicit witness, not a
claim made in the source paper.

Realize a standard Cauchy variable as $C=Q_C(U)=\tan(\pi(U-\tfrac12))$ and
put $X=0$, $Y=C$, $Z=C_+=\max(C,0)$, all nondecreasing in $U$, so both pairs
$(X,Z)$, $(Y,Z)$ are comonotonic. Oddness of $c_t$ gives $v_C(t)=0=v_0(t)$
for every $t$, hence $X\sim Y$.

**Doubling-defect identity.** For any nonnegative random variable $V$ and
any $F>0$,

$$2\,\mathbb E[\min(V,F)]-\mathbb E[\min(2V,F)]
 =2\int_{F/2}^{F}P(V>x)\,dx,$$

since $\mathbb E[\min(V,F)]=\int_0^F P(V>x)\,dx$ and
$\mathbb E[\min(2V,F)]=2\int_0^{F/2}P(V>x)\,dx$. For $V=C_+=\max(C,0)$ with
$C$ standard Cauchy the right-hand side is
$\frac2\pi\int_{F/2}^{F}\arctan(1/x)\,dx$, which is positive for every $F$
and increases to $\frac{2\ln2}{\pi}$ as $F\to\infty$.

With $X+Z=C_+$, $Y+Z=2C_++C_-$ ($C_-=\min(C,0)$) and
$\mathbb E[\max(C_-,-t)]=-\mathbb E[\min(C_+,t)]$,

$$v_{X+Z}(t)-v_{Y+Z}(t)=2\int_{t/2}^{t}P(C>x)\,dx>0\qquad(t>0),$$

so $X+Z\succeq Y+Z$ holds for all $t$ and $Y+Z\succeq X+Z$ fails for all $t$:
$X+Z\succ Y+Z$ while $X\sim Y$. `checks/comonotonic_witnesses.py` verifies
the calculation.

## Paper references

- **Proof: [Decision theory unbound](https://doi.org/10.1111/nous.12473).** Zachary Goodsell (2024). Decision theory unbound. Noûs, 58, 669–695. First published online in 2023. — Theorem 2, pp. 683–685; Theorems 7 and 9, p. 693
