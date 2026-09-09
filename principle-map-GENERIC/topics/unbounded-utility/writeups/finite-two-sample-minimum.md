# Two-sample minimum: zero extension

This model satisfies **Rich Outcomes, Archimedean Outcomes, Totality and
Stochastic Equivalence**, while violating Simple Expected Utility and Mixture
Independence. The distinction between the **raw outcome coordinate** and the
**normalized utility chart** is essential to the construction.

**Source and work accounting.** GPT-6 (Codex), Logical Maps project discussion,
9 September 2026. This is an elementary countermodel construction with an
explicit calibration audit and finite witnesses, recorded under Misc. The
work accounting concerns this project and makes no claim of literature
novelty. No independent checker or Lean verification is asserted.

## The preference on the full domain

Take outcomes to be the real line with its usual Borel structure and order,
and take all measurable real-valued random variables on the standing atomless
probability space. Reference outcomes are the raw numbers 0 and 1.

For a finitely supported law

\[
\mu=\sum_{i=1}^n p_i\delta_{x_i},
\]

put

\[
V(\mu)=\sum_{i,j=1}^n p_i p_j\min(x_i,x_j).
\tag{1}
\]

This is the expected minimum of two independent draws from that law. For
every law that does **not** have finite support, put $V(\mu)=0$. Define

\[
X\succeq Y\quad\Longleftrightarrow\quad
V(\mathcal L(X))\ge V(\mathcal L(Y)).
\tag{2}
\]

Every score is a finite real number. Consequently (2) is reflexive,
transitive and total. It depends only on laws, proving Stochastic Equivalence.
It also proves Restricted Totality and Restricted Stochastic Equivalence.
Finite support is a property of the law: a variable with infinitely many
exceptional values on a null set receives the same score as its almost-sure
finite-valued representative.

A sure raw outcome $x$ has score $x$, so the sure preference order agrees
exactly with the ordinary order on the outcome space, as the framework requires.

## Binary mixtures and Archimedean Outcomes

For raw outcomes $a>c$, a mixture with probability $p$ of $a$ has minimum

\[
\min(X_1,X_2)=a
\]

only when both independent draws give $a$, an event of probability $p^2$.
Thus

\[
V(M_p(a,c))=c+(a-c)p^2.
\tag{3}
\]

For any $a>b>c$, choose

\[
p=\sqrt{\frac{b-c}{a-c}}\in(0,1).
\]

Equation (3) gives $M_p(a,c)\sim b$, proving Archimedean Outcomes.

## The actual normalized chart

The framework defines a chart level $r$ by binary comparisons with reference
outcomes 0 and 1. It does not identify that level with an arbitrary numerical
label on outcomes. In this model the raw outcome at chart level $r$ is

\[
f(r)=
\begin{cases}
r^2,&r\ge0,\\
-\dfrac{r^2}{1-2r},&r<0.
\end{cases}
\tag{4}
\]

All three branches of the chart definition can be checked directly:

- For $0\le r\le1$, equation (3) gives $V(M_r(1,0))=r^2=f(r)$.
- For $r>1$, it gives $V(M_{1/r}(f(r),0))=f(r)/r^2=1$.
- For $r<0$, put $p=-r/(1-r)\in(0,1)$. Then
  $V(M_p(1,f(r)))=f(r)+(1-f(r))p^2=0$.

These equations also determine the raw outcome uniquely. The first branch
requires a raw outcome between 0 and 1, the second one strictly above 1,
and the last one strictly below 0: a nontrivial binary-mixture score is
strictly between the scores of its distinct endpoints. Solving in the
respective ranges gives exactly (4).

The function $f$ is a continuous strictly increasing bijection of the real
line. On the negative half-line,

\[
f'(r)=\frac{2r(r-1)}{(1-2r)^2}>0;
\]

its limits at the ends of the real line are $-\infty$ and $+\infty$,
and its two formulas meet at zero. The normalized utility chart is therefore
the continuous inverse

\[
u(x)=f^{-1}(x)=
\begin{cases}
\sqrt{x},&x\ge0,\\
x-\sqrt{x^2-x},&x<0.
\end{cases}
\tag{5}
\]

The chart is single-valued, defined on every outcome, measurable and onto
the real line. In particular, **Rich Outcomes holds with precisely the
framework's calibration-based meaning**, including every negative level.

## Simple Expected Utility fails

Let $X=M_{1/2}(4,1)$, with 4 and 1 still denoting raw outcomes, and let

\[
Y=\text{sure }9/4.
\]

Their normalized chart utilities satisfy

\[
E[u(X)]=\frac12\cdot2+\frac12\cdot1=\frac32
=u(9/4)=E[u(Y)].
\]

But their scores are

\[
V(X)=1+(4-1)\left(\frac12\right)^2=\frac74,
\qquad V(Y)=\frac94.
\]

Thus $Y\succ X$, contradicting the indifference required by Simple Expected
Utility. Another normalized chart cannot repair this discrepancy, because
the calibration computation established that (5) is the unique chart.

## Mixture Independence fails

Put $L=M_{1/2}(4,0)$. Equation (3) gives $V(L)=1$, so $L\sim1$.
The law of $M_{1/2}(L,1)$ gives raw outcomes 0, 1 and 4 probabilities

\[
\frac14,\quad\frac12,\quad\frac14.
\]

For two independent draws from this law, the minimum is at least 1 with
probability $9/16$, and is 4 with probability $1/16$. Hence

\[
V(M_{1/2}(L,1))=\frac9{16}+3\frac1{16}=\frac34<1
=V(M_{1/2}(1,1)).
\]

The true comparison $L\succeq1$ becomes false after mixing both sides
equally with sure 1, violating Mixture Independence.

## The explicit dominance failures

Let $U(\omega)=2+\omega$ on $[0,1]$ with Lebesgue measure. Its law is
uniform on $[2,3]$, so the second clause of the construction assigns

\[
V(U)=0<1=V(\text{sure }1).
\]

Nevertheless $U>1$ at every state. This disproves Statewise Dominance.
It also disproves Stochastic Dominance: the survival probability for $U$
is at least that of sure 1 at every threshold, and is strictly greater at
threshold 1. The preference ranks sure 1 strictly above $U$.

The model therefore witnesses that even Rich Outcomes, Archimedean Outcomes,
Totality and Stochastic Equivalence together do not imply Simple EU.
The separate DU representation argument must use its additional premises.

The accompanying exact-arithmetic diagnostic checks the displayed finite
scores and representative calibrations in all three chart ranges. The
analytic arguments above establish the universal claims.
