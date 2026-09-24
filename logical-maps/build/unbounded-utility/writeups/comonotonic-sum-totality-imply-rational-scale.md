# Comonotonic Sum Invariance with Totality implies Rational Scale Invariance

**Proved implication:** Rich Outcomes + Totality + Stochastic Equivalence +
Comonotonic Sum Invariance imply Rational Scale Invariance: for every
rational $a>0$, $X\succeq Y$ iff $aX\succeq aY$.

With the recorded [Shift Invariance](comonotonic-sum-implies-shift.html)
consequence, the same package gives $X\succeq Y$ iff $aX+b\succeq aY+b$ for
rational $a>0$ and real $b$. Real factors are not reached; see §6.

**Source and work accounting.** Zachary Goodsell, Logical Maps session,
24 September 2026, claimed that Comonotonic Sum Invariance implies Positive
Affine Invariance and gave the doubling argument
$2A=A+A\succeq B+A\succeq B+B=2B$ for the scale step. Claude (Fable 5.1),
24 September 2026, supplied the comonotonic-copy reduction, the strict chain,
the cancellation step through Totality, the rational assembly, and the two
models in §6 showing which premises are used. Recorded under Misc. No
independent checker or Lean verification is claimed.

## 1. Setting

Work in the real utility chart and write $X$ for the utility variable of a
finite-level gamble. Rich Outcomes supplies a gamble at every real level, so
pointwise sums and rational multiples of finite-level variables are gambles
under the standing realization conventions; the principles are applied
wherever the displayed variables exist. $Q_X$ is the quantile function of
$X$, nondecreasing on $(0,1)$, and $U$ denotes a uniform variable on the
standing atomless standard space.

Two standard facts are used.

- (F1) For every $X$ there is a uniform $U$ with $X=Q_X(U)$ almost surely.
  On the complement of the atoms of the law of $X$ take $U=F_X(X)$; on each
  atom $\{X=x\}$, an event of positive probability on an atomless space,
  take a variable uniform on $(F_X(x^-),F_X(x)]$.
- (F2) If $f,g$ are nondecreasing on $(0,1)$ then $(f(U),g(U))$ is a
  comonotonic pair in the sense of the principle, $Q_{f(U)}=f$ almost
  everywhere, and $f(U)+g(U)=(f+g)(U)$ with $f+g$ nondecreasing.

## 2. Comonotonic copies

Given $X,Y$, choose $U$ with $X=Q_X(U)$ by (F1) and put
$Y^\dagger=Q_Y(U)$. Then $Y^\dagger$ has the law of $Y$, so Stochastic
Equivalence gives $Y\sim Y^\dagger$, and by transitivity
$X\succeq Y$ iff $X\succeq Y^\dagger$. For rational $a>0$,
$aY^\dagger=Q_{aY}(U)$ has the law of $aY$, so likewise
$aX\succeq aY$ iff $aX\succeq aY^\dagger$. It therefore suffices to prove
the theorem for pairs $X=f(U)$, $Y=g(U)$ with $f,g$ nondecreasing, and
$(aX,aY)=(af(U),ag(U))$ is again such a pair.

## 3. Integer factors: preservation

**Lemma 1.** Let $X=f(U)$, $Y=g(U)$ with $f,g$ nondecreasing, and let
$k\ge1$ be an integer. If $X\succeq Y$ then $kX\succeq kY$; if $X\succ Y$
then $kX\succ kY$. Only Rich Outcomes and Comonotonic Sum Invariance are
used.

*Proof.* For $0\le j\le k$ put $W_j=jX+(k-j)Y=(jf+(k-j)g)(U)$, a gamble by
Rich Outcomes. For $0\le j<k$ put $Z_j=jX+(k-j-1)Y=(jf+(k-j-1)g)(U)$; it is
a nondecreasing function of $U$, so by (F2) both $(X,Z_j)$ and $(Y,Z_j)$
are comonotonic, and $X+Z_j=W_{j+1}$, $Y+Z_j=W_j$. Comonotonic Sum
Invariance, applied to the pair $(X,Y)$ and to the pair $(Y,X)$, gives

$$W_{j+1}\succeq W_j\iff X\succeq Y,\qquad W_j\succeq W_{j+1}\iff Y\succeq X.
\tag{$*$}$$

If $X\succeq Y$, then $W_k\succeq W_{k-1}\succeq\cdots\succeq W_0$ and
transitivity gives $kX=W_k\succeq W_0=kY$.

If $X\succ Y$, then also $Y\not\succeq X$. Suppose $kY\succeq kX$, that is
$W_0\succeq W_k$. For $k=1$ this is $Y\succeq X$, excluded. For $k\ge2$ the
chain $W_k\succeq W_{k-1}\succeq\cdots\succeq W_1$ gives $W_k\succeq W_1$,
hence $W_0\succeq W_1$ by transitivity, which by $(*)$ with $j=0$ is
$Y\succeq X$, excluded. So $kX\succ kY$. $\square$

Lemma 1, together with the shift step $X\succeq Y$ iff $X+b\succeq Y+b$ from
the constant summand, is the recorded result
[comonotonic-sum-implies-integer-affine-preservation](comonotonic-sum-implies-integer-affine-preservation.html).

## 4. Integer factors: cancellation

**Lemma 2.** Under Totality, for $X,Y$ as in Lemma 1: if $kX\succeq kY$ then
$X\succeq Y$.

*Proof.* Suppose $X\not\succeq Y$. Totality gives $Y\succeq X$, so
$Y\succ X$, and Lemma 1 gives $kY\succ kX$, contradicting $kX\succeq kY$.
$\square$

Totality enters only here. Without it the cancellation direction fails;
see §6.

## 5. Rational factors

**Theorem.** Under the four premises, for every rational $a>0$ and all
finite-level $X,Y$ for which $aX,aY$ exist: $X\succeq Y$ iff
$aX\succeq aY$.

*Proof.* By §2 assume $X=f(U)$, $Y=g(U)$ with $f,g$ nondecreasing. Write
$a=m/n$ with positive integers $m,n$. Lemmas 1 and 2 with $k=m$ give
$X\succeq Y$ iff $mX\succeq mY$. The variables $mX$ and $n(aX)$ have the
same utility function $m\,u(X)$, so they are the same numeric variable,
or indifferent by Stochastic Equivalence if realized by different gambles;
likewise for $Y$. Lemmas 1 and 2 with $k=n$, applied to the comonotonic
pair $(aX,aY)$, give $n(aX)\succeq n(aY)$ iff $aX\succeq aY$. Chaining the
three equivalences proves the claim. $\square$

## 6. The premises are used

- *Rich Outcomes* supplies the mixed sums $jX+(k-j)Y$; on a sparse chart
  they need not exist.
- *Stochastic Equivalence* is needed for non-comonotonic pairs. For
  $X=U$ and $Y=1-U$, no nonconstant $Z$ is comonotonic with both: a common
  uniform $U'$ with $X=f(U')$ and $1-X=g(U')$, both nondecreasing, forces
  $X$ to be almost surely constant. Comonotonic Sum Invariance alone says
  nothing about $(2X,2Y)$, and the copies of §2 are what the doubling
  argument adds to $A$ on both sides.
- *Totality* is used only in Lemma 2. The model
  [CDF-area dominance: simple floors or unit threshold](cdf-area-unit-threshold.html)
  satisfies Rich Outcomes, Stochastic Equivalence and Comonotonic Sum
  Invariance, together with Simple EU and Stochastic Dominance, and has a
  pair with $2X\succeq 2Y$ and $X\not\succeq Y$.
- *Real factors* are not reached. The model
  [Lexicographic expectation: Hamel tie-break](lexicographic-hamel-tie-break.html)
  satisfies all four premises, Archimedean Outcomes, Stochastic Dominance and
  Simple EU, is invariant under every rational factor, and has $X\succ 0$
  with $\sqrt2X\not\succeq0$. Iterated addition sees only rational
  multiples. Whether Mixture Independence closes the gap is
  [conjectured-dtu-comonotonic-imply-scale](conjectured-dtu-comonotonic-imply-scale.html).

## Paper references

- **Background: Unbounded Utility and Background Risk.** Zachary Goodsell (5 June 2026). Unbounded Utility and Background Risk. Unpublished working manuscript. — §6.2, p. 18; definitions on pp. 3–4
