# Clipped expectation: continuous ultrafilter dominance [−4ⁿ, 4²ⁿ]

**Source and work accounting.** This uses Zachary Goodsell's asymmetric
continuous clipping construction from *Decision theory unbound*, Appendix B,
Definition 3, Lemma 6, Remark 3 and Corollary 3, pp. 691–693. Its compatibility
with DTU, Relative Expectation and $L^{1}$ Continuity while failing reflection is
already recorded in *Symmetries of value*, Theorem 1, p. 24. The work supplied
by GPT-6 (Codex), 9 September 2026, is the cutoff choice and the explicit
Pasadena/Arroyo evaluations below, with verification of inherited properties.
This is a model specialization, not a new invention of asymmetric clipping
or a claim of priority in the literature. No independent checker or Lean
certification is asserted.

## 1. The source construction with upper cutoff equal to the square of the lower

Use all real-valued random variables on the standing sample space. Let

\[
L_n=4^n,\quad U_n=4^{2n},\quad
q_n(x)=\max(-L_n,\min(x,U_n)),\quad v_X(n)=E[q_n(X)].
\]

Choose a free ultrafilter \(\mathcal U\) on the positive integers and set

\[
X\succeq Y\quad\Longleftrightarrow\quad
\forall\varepsilon>0\ \{n:v_X(n)-v_Y(n)\ge-\varepsilon\}\in\mathcal U.
\tag{1}
\]

A comparison difference converging to a finite number is ranked by its sign,
with indifference at zero. If \(v_X(n)\to+\infty\), then \(X\) is strictly
better than every sure real outcome; this does not assign a real certainty
equivalent to \(X\).

Reflexivity follows directly from (1). To prove transitivity, intersect the
two ultrafilter-large comparison sets for tolerance \(\varepsilon/2\).
If \(X\not\succeq Y\), some positive tolerance is violated on an
ultrafilter-large set, making \(Y\succ X\). Thus the relation is total.
Changing any comparison sequence by an ordinary sequence tending to zero
does not affect it.

The clipped expectations depend only on laws. Bounded, in particular simple,
variables are eventually unchanged by clipping, so the utility chart is the
identity and simple gambles have ordinary expected utility comparisons.
All real sure outcomes are available. Moreover,

\[
v_{M_p(X,Z)}=p v_X+(1-p)v_Z,
\]

so cancellation and rescaling tolerances prove both directions of Mixture
Independence. These facts establish all DTU clauses except dominance.

For survival functions \(S_X\), bounded layer integration gives

\[
v_X(n)-v_Y(n)=\int_{-L_n}^{U_n}(S_X(t)-S_Y(t))\,dt. \tag{2}
\]

Dominance makes this integrand nonnegative. If it is positive at one threshold,
right-continuity makes its integral positive on some bounded interval. Once
that interval is inside the cutoffs, there is a fixed positive comparison gap.
This establishes weak and strict Stochastic Dominance and completes DTU.

## 2. The stronger expectation, continuity and shift properties

The intervals in (2) increase to all of \(\mathbb R\). If at least one
of the positive and negative areas of \(S_X-S_Y\) is finite, monotone
convergence of the two nonnegative areas makes the clipped differences tend
to their well-defined extended difference. Equation (1) therefore gives
exactly **CDF-Area Extension**, including strict infinite-area cases and
the zero case.

For any actually coupled \(X,Y\), clipping is 1-Lipschitz and tends
pointwise to the identity. If \(E|X-Y|<\infty\), then

\[
|q_n(X)-q_n(Y)|\le|X-Y|,
\qquad v_X(n)-v_Y(n)\longrightarrow E[X-Y].
\]

Dominated convergence and (1) prove **Relative Expectation** directly.
Likewise, if \(E|X_k-X|\to0\), then for every cutoff

\[
|v_{X_k}(n)-v_X(n)|\le E|X_k-X|.
\]

If every \(X_k\succeq Y\), choose one \(k\) with this error below
\(\varepsilon/2\), and use its ultrafilter-large comparison set with
tolerance \(\varepsilon/2\). This proves \(X\succeq Y\) and hence
the recorded upper-section **L¹ Continuity**.

For any constant \(b\), dominated convergence applied to
\(q_n(X+b)-q_n(X)\) gives limit \(b\), since this difference is bounded
in absolute value by \(|b|\). The two shifts cancel in a comparison,
proving **Shift Invariance**. The fixed-lift variables in **Shift Transfer**
have integrable difference \(b/p\) on a set of probability \(p\) and
\(-b/(1-p)\) on its complement; its mean is zero. Relative Expectation
proves their indifference.

## 3. Pasadena has value \((3/2)\ln2\)

For Pasadena \(P\), separate its odd and even indices:

\[
\begin{array}{c|c|c}
 &\text{payoff}&\text{probability}\\\hline
\text{positive branch }k&4^k/[2(2k-1)]&2/4^k\\
\text{negative branch }k&-4^k/(2k)&1/4^k
\end{array}
\]

Let \(K_+(n)\) be the largest positive index whose payoff does not exceed
\(U_n\), and \(K_-(n)\) the largest negative index whose magnitude does
not exceed \(L_n\). The defining inequalities show

\[
K_+(n)=2n+O(\log n),\qquad K_-(n)=n+O(\log n).
\tag{3}
\]

For example, take logarithms of
\(4^{K_+}/[2(2K_+-1)]\le4^{2n}<4^{K_++1}/[2(2K_++1)]\);
the corresponding negative-branch inequalities work identically.

Summing the clipped geometric tails exactly yields

\[
v_P(n)=
\sum_{k=1}^{K_+(n)}\frac1{2k-1}
-\sum_{k=1}^{K_-(n)}\frac1{2k}
+\frac{2U_n}{3\,4^{K_+(n)}}
-\frac{L_n}{3\,4^{K_-(n)}}. \tag{4}
\]

The two clipped-tail terms tend to zero: the next positive-payoff inequality
bounds the positive term by \(4/[3(2K_++1)]\), and the next negative-payoff
inequality bounds the negative term's magnitude by \(2/[3(K_-+1)]\).
Writing \(H_j=\sum_{k=1}^j1/k=\log j+\gamma+o(1)\), the finite part
of (4) is

\[
H_{2K_+}-\tfrac12H_{K_+}-\tfrac12H_{K_-}
=\ln2+\tfrac12\log(K_+/K_-)+o(1).
\]

By (3), the ratio tends to two. Thus

\[
v_P(n)\longrightarrow\frac32\ln2,
\qquad P\sim\frac32\ln2\succ\ln2.
\]

This disproves the recorded Pasadena evaluation in this model. The argument
uses convergent clipped expectations, not an ordinary expectation of Pasadena.

## 4. Arroyo lies strictly above every sure outcome

For Arroyo \(A\), the positive branch indexed by \(k\) has payoff
\(2k\) and probability \(1/[(2k-1)2k]\). The negative branch has payoff
\(-(2k+1)\) and probability \(1/[2k(2k+1)]\).
The last unclipped indices are

\[
J_+=U_n/2,\qquad J_-=L_n/2-1.
\]

Its clipped expectation is exactly

\[
\sum_{k=1}^{J_+}\frac1{2k-1}
-\sum_{k=1}^{J_-}\frac1{2k}
+U_n\sum_{k>J_+}\frac1{(2k-1)2k}
-L_n\sum_{k>J_-}\frac1{2k(2k+1)}. \tag{5}
\]

Each probability-tail summand is asymptotic to \(1/(4k^2)\), and the
corresponding tail sum is asymptotic to \(1/(4J)\), by comparison with
the integral of \(k^{-2}\). Each of the last two magnitudes in (5)
therefore tends to \(1/2\), so their difference tends to zero. The harmonic
prefix has asymptotic value

\[
\ln2+\tfrac12\log(J_+/J_-)+o(1)
=\ln2+\tfrac12\log(U_n/L_n)+o(1)
=(n+1)\ln2+o(1).
\]

Consequently \(v_A(n)\to+\infty\). In (1), this yields
\(A\succ c\) for every real sure outcome \(c\), and in particular
\(A\not\sim\ln2\). Although Arroyo's folded expectation is \(\ln2\),
this model does not obey Folded Expectation.

## 5. A symmetric-neutrality witness

Let \(C\) have the standard symmetric Cauchy law. Symmetry cancels its
clipped tails up to \(L_n\), leaving

\[
v_C(n)=\int_{L_n}^{U_n}\left(\frac12-\frac{\arctan t}{\pi}\right)dt
=\frac1\pi\log(U_n/L_n)+o(1)
=\frac{n\log4}{\pi}+o(1).
\]

The asymptotic follows from the integrand
\(1/(\pi t)+O(t^{-3})\); its integrated error tends to zero. Thus the
symmetric gamble \(C\) is strictly above every sure outcome, and Symmetric
Neutrality fails. This mechanism belongs to Goodsell's general asymmetric
construction; only these chosen cutoff rates and calculations are additions here.

## Scope and diagnostics

The model satisfies DTU, Relative Expectation, $L^{1}$ Continuity, CDF-Area Extension,
and the shift properties, yet fails both named game evaluations. Its failure
of Negative Self-Similarity follows from the new Pasadena implication; further
exclusions are left to the map's inference engine rather than separately
asserted without evidence. No Scale Invariance or sum-invariance verdict is
claimed here.

`checks/calculation_factorizations.py` verifies the exact Pasadena clipping
formula against direct finite atom sums with bounded remainders, tests the
displayed cutoff asymptotic, and checks finite Arroyo sums. It also verifies
the exact coupling identities in the accompanying Pasadena proof. These are
diagnostics supporting quantified arguments, not simulations of a free
ultrafilter or proofs of all universal axioms.

## 6. Failure of Comonotonic Sum Invariance

**Addition: Claude (Fable 5.1), 23 September 2026.** A property of the
recorded model; not a claim of the source paper.

Realize a standard Cauchy variable as \(C=Q_C(U)=\tan(\pi(U-\tfrac12))\), let
\(C_+=\max(C,0)\), \(C_-=\min(C,0)\), and put
\(X=0\), \(Y=C_++2C_--v\) with \(v=(2\ln2-1)/\pi\), and \(Z=C_+\). All are
nondecreasing in \(U\), so both pairs are comonotonic. With
\(m(F)=\mathbb E[\min(C_+,F)]=\frac1{2\pi}\ln(1+F^2)+\frac F\pi\arctan(1/F)
=\frac1\pi\ln F+\frac1\pi+o(1)\) and the window \([-4^n,4^{2n}]\),

\[
\mathbb E[q_n(C_++2C_-)]=m(4^{2n})-2m(4^n/2)\longrightarrow
\frac{2\ln2-1}{\pi}=v,
\]

and \(q_n(Y)-q_n(C_++2C_-)\to-v\) boundedly, so \(\mathbb E[q_n(Y)]\to0\) and
\(X\sim Y\).

**Doubling-defect identity.** For any nonnegative random variable $V$ and
any $F>0$,

\[2\,\mathbb E[\min(V,F)]-\mathbb E[\min(2V,F)]
 =2\int_{F/2}^{F}P(V>x)\,dx,\]

since $\mathbb E[\min(V,F)]=\int_0^F P(V>x)\,dx$ and
$\mathbb E[\min(2V,F)]=2\int_0^{F/2}P(V>x)\,dx$. For $V=C_+=\max(C,0)$ with
$C$ standard Cauchy the right-hand side is
$\frac2\pi\int_{F/2}^{F}\arctan(1/x)\,dx$, which is positive for every $F$
and increases to $\frac{2\ln2}{\pi}$ as $F\to\infty$.

Now \(X+Z=C_+\) and \(Y+Z=2C_++2C_--v\), so

\[
v_{X+Z}(n)-v_{Y+Z}(n)
 =m(4^{2n})-2m(4^{2n}/2)+2m(4^n/2)+v+o(1)
 =2\bigl(m(4^{2n})-m(4^{2n}/2)\bigr)+o(1)\longrightarrow\frac{2\ln2}{\pi},
\]

the lower-cutoff terms cancelling against \(v\). With
\(\varepsilon=(\ln2)/\pi\) the set \(\{n:v_{Y+Z}(n)\ge v_{X+Z}(n)-\varepsilon\}\)
is finite, so \(X+Z\succ Y+Z\) although \(X\sim Y\): Comonotonic Sum
Invariance fails, while Shift Invariance and Transfer of a Shift hold.
`checks/comonotonic_witnesses.py` verifies the closed forms, the neutral
constant and the limit.

## Paper references

- **Background: [Decision theory unbound](https://doi.org/10.1111/nous.12473).** Zachary Goodsell (2024). Decision theory unbound. Noûs, 58, 669–695. First published online in 2023. — Appendix B, Definition 3, Lemma 6, Remark 3 and Corollary 3, pp. 691–693: continuous clipped-expectation quotient and separate cutoff functions
- **Background: [Symmetries of value](https://doi.org/10.1111/nous.12549).** Zachary Goodsell (2026). Symmetries of value. Noûs, 60, 16–37. — Theorem 1, p. 24: asymmetric source model and failure of reflection even with DTU, L1 Continuity and Relative Expectation; pp. 28–33 for the named prospects
