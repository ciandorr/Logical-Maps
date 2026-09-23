# Clipped expectation: continuous ultrafilter dominance [−4ⁿ, 4ⁿ]

Source: **Misc.** Construction by Zachary Goodsell; specialization and the additional
proofs below by GPT-6 (Codex), 9 September 2026. No independent checker or Lean
verification is asserted.

**Original work: model adaptation and direct verification.** We reuse the continuous
ultrafilter construction from *Decision theory unbound*, Appendix B, Definition 3,
Lemma 6 and Theorem 3. Choosing geometric cutoffs supplies an explicit alternating-game
evaluation and scaling reversal. The CDF-area, $L^{1}$ and folded-expectation verifications
below establish extra properties of this construction. This is an account of work
done for the map, not a claim that these observations are new in the literature.

## Construction and DTU

Outcomes are real utilities; all measurable random variables on the standing sample
space are available. Choose a free ultrafilter \(\mathcal U\) on the positive integers.
Put \(t_n=4^n\), \(c_t(x)=\max(-t,\min(x,t))\), and

\[
v_X(n)=E[c_{t_n}(X)],\qquad
X\succeq Y\iff
\forall\varepsilon>0\quad
\{n:v_X(n)-v_Y(n)\ge-\varepsilon\}\in\mathcal U.
\]

Changing a comparison sequence by a sequence tending to zero leaves this relation
unchanged. A positive lower bound on an ultrafilter-large set gives strict preference.
If a difference converges to a finite number, its comparison is exactly the sign of
that number, including indifference at zero.

Reflexivity is immediate. For transitivity, intersect the two sets corresponding
to tolerance \(\varepsilon/2\). If \(X\not\succeq Y\), ultrafilter dichotomy gives
an \(\varepsilon>0\) and an ultrafilter-large set where
\(v_Y-v_X>\varepsilon\). Thus \(Y\succ X\), establishing totality.
These statements use addition and positive scalar multiplication of comparison
sequences; no multiplication of arbitrary unbounded quotient classes is needed.

Equal laws have identical clipped expectations. For bounded, hence simple, variables
clipping eventually disappears; their comparisons are ordinary expectations. In
particular the normalized chart is the identity and every real utility is realized.
Randomized mixtures satisfy
\(v_{M_p(X,Z)}=p v_X+(1-p)v_Z\), so cancelling the common term and rescaling
\(\varepsilon\) proves both directions of Mixture Independence.

For survival functions \(S_X\), bounded layer integration gives

\[
v_X(n)-v_Y(n)=\int_{-t_n}^{t_n}(S_X(s)-S_Y(s))\,ds.
\]

Stochastic dominance makes the integrand nonnegative. If it is strictly positive
at one threshold, right-continuity gives a positive integral over some bounded
interval. Every sufficiently large cutoff therefore has a fixed positive gap.
This proves strict as well as weak Stochastic Dominance, and finishes DTU.

## Additional expectation and continuity properties

Write \(d=S_X-S_Y\) and \(A_\pm=\int d_\pm\). If at least one of these areas is
finite, monotone convergence of the positive and negative parts over
\([-t_n,t_n]\) shows that the clipped difference tends to the well-defined extended
difference \(A_+-A_-\). The preceding sign criterion proves **CDF-Area Extension**,
including the equality case and both possible infinite signs. Consequently the
recorded CDF-area implications give Relative Expectation and Expected Utility.

For **L¹ Continuity**, clipping is 1-Lipschitz, so for every cutoff

\[
|v_{X_k}(n)-v_X(n)|\le E|X_k-X|.
\]

If this last quantity tends to zero and every \(X_k\succeq Y\), fix
\(\varepsilon>0\) and choose one \(k\) with error below \(\varepsilon/2\).
On the ultrafilter-large set where \(v_{X_k}-v_Y\ge-\varepsilon/2\), we have
\(v_X-v_Y\ge-\varepsilon\). This is exactly the required upper-section closure.
It also applies when other distances in the domain are infinite.

For **Folded Expectation**, put
\(h_X(s)=P(X>s)-P(X<-s)\). Layer integration gives
\(v_X(n)=\int_0^{t_n}h_X(s)\,ds\); boundary atoms change no integral.
If \(h_X,h_Y\) are absolutely integrable, these converge to their folded
expectations. Their finite difference is therefore compared by its sign.

Reflection negates every clipped expectation, proving **Reflection Anti-Invariance**.
For a real constant \(b\),
\(c_t(X+b)-c_t(X)\to b\) pointwise with absolute value at most \(|b|\).
Dominated convergence shows that shifting both compared variables changes the
clipped difference by a sequence tending to zero. This proves **Shift Invariance**.
No individual integrability of the variables is required.

## Explicit failures of scale, alternating evaluation and uniqueness

Let \(A\) have \(P(A=(-2)^j)=2^{-j}\), \(j\ge1\). For
\(2^k\le t\le2^{k+1}\), summing the finite prefix and the geometric tail gives

\[
E[c_t(A)]
=\sum_{j=1}^k(-1)^j+
  \frac{(-1)^{k+1}t}{3\,2^k}.
\]

At \(t_n=4^n\), this equals \(-1/3\), whereas
\(E[c_{t_n}(2A)]=2E[c_{t_n/2}(A)]=-4/3\). Hence

\[
A\sim-1/3\succ-1/2,
\qquad 2A\sim-4/3\prec-1.
\]

This is a concrete scaling reversal in every free-ultrafilter choice used here.
It also directly violates the recorded Alternating St Petersburg Value principle.

The law of \(A\) is the half-mixture of \(-2A\) and sure \(-2\): the sure
branch supplies the first atom and the other branch supplies all subsequent atoms.
Stochastic Equivalence gives
\(A\sim M_{1/2}(-2A,-2)\). The sure gamble \(q=-1/2\) satisfies the same
fixed-value equation by Simple EU, since
\(\frac12(-2q)+\frac12(-2)=q\). Nevertheless \(A\not\sim q\).
With \(p=1/2,a=2,b=0,Z=-2\), these are two witnesses refuting **Uniqueness of
Negative Self-Similarity**.

## Scope and validation

The model satisfies DTU together with CDF-Area Extension, $L^{1}$ Continuity, Folded
Expectation, reflection and shift, yet fails scale and the two calculation/evaluation
principles just exhibited. Further exclusions are derived by the map's implication
records, not asserted without evidence. The free ultrafilter remains nonconstructive.

`checks/geometric_clipping.py` checks the geometric-tail calculation against a
separate finite-sum calculation with a rigorous residual bound, the scaling reversal,
and the finite Lipschitz estimate. Those checks are diagnostics; the quantified
claims rely on the proofs above.

## References

- Zachary Goodsell, *Decision theory unbound*, Noûs 58 (2024), 669–695,
  DOI 10.1111/nous.12473, Appendix B, pp. 691–695. Original construction and
  scale-failure strategy; the explicit witness above is a separate verification.
- GPT-6 (Codex), project research on 9 September 2026: this specialization,
  additional property proofs and explicit witnesses.

## Failure of Comonotonic Sum Invariance

**Addition: Claude (Fable 5.1), 23 September 2026.** A property of the
recorded model; not a claim of the source paper.

Realize a standard Cauchy variable as \(C=Q_C(U)=\tan(\pi(U-\tfrac12))\) and
put \(X=0\), \(Y=C\), \(Z=C_+=\max(C,0)\), all nondecreasing in \(U\), so both
pairs are comonotonic. The clipping \(\max(-4^n,\min(x,4^n))\) is odd and
\(C\) is symmetric, so \(v_C(n)=0=v_0(n)\) and \(X\sim Y\).

**Doubling-defect identity.** For any nonnegative random variable $V$ and
any $F>0$,

\[2\,\mathbb E[\min(V,F)]-\mathbb E[\min(2V,F)]
 =2\int_{F/2}^{F}P(V>x)\,dx,\]

since $\mathbb E[\min(V,F)]=\int_0^F P(V>x)\,dx$ and
$\mathbb E[\min(2V,F)]=2\int_0^{F/2}P(V>x)\,dx$. For $V=C_+=\max(C,0)$ with
$C$ standard Cauchy the right-hand side is
$\frac2\pi\int_{F/2}^{F}\arctan(1/x)\,dx$, which is positive for every $F$
and increases to $\frac{2\ln2}{\pi}$ as $F\to\infty$.

With \(X+Z=C_+\), \(Y+Z=2C_++C_-\), \(C_-=\min(C,0)\), and
\(\mathbb E[\max(C_-,-4^n)]=-\mathbb E[\min(C_+,4^n)]\),

\[
v_{X+Z}(n)-v_{Y+Z}(n)=2\int_{4^n/2}^{4^n}P(C>x)\,dx\longrightarrow\frac{2\ln2}{\pi}>0.
\]

With \(\varepsilon=(\ln2)/\pi\), the set \(\{n:v_{Y+Z}(n)\ge v_{X+Z}(n)-\varepsilon\}\)
is finite, hence outside the free ultrafilter, while \(v_{X+Z}\ge v_{Y+Z}\)
for every \(n\). So \(X+Z\succ Y+Z\) although \(X\sim Y\): Comonotonic Sum
Invariance fails, even though Shift Invariance, CDF-Area Extension, \(L^1\)
Continuity and Folded Expectation hold. `checks/comonotonic_witnesses.py`
verifies the calculation.
