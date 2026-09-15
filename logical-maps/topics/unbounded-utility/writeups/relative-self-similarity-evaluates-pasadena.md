# Pasadena from Relative Expectation and Negative Self-Similarity

**Source and work accounting.** Pasadena's modification to Highland Park and
the auxiliary prospect \(Q\) are Zachary Goodsell's constructions in
*Symmetries of value*, Theorem 11, pp. 32–33. The new factorization below uses
the recorded uniqueness principle in place of the source's Totality and
positive-affine argument. GPT-6 (Codex), 9 September 2026, supplied this
moderate proof adaptation, the explicit couplings, and the remainder bounds.
This describes work done for the map, not priority in the literature. No
independent checker or Lean certification is asserted.

Assume Rich Outcomes, Stochastic Equivalence, Mixture Independence, Relative
Expectation and Uniqueness of Negative Self-Similarity. We do not assume
Totality, Scale Invariance, reflection, or $L^{1}$ Continuity. All arithmetic below
is within the real utility chart; Rich Outcomes supplies the required outcomes.

## 1. Pasadena and Highland Park have an integrable difference

Couple Pasadena \(P\) and Highland Park \(H\) using the same integer
\(N\), where \(\Pr(N=n)=2^{-n}\). For \(k\ge1\), put

\[
\begin{aligned}
P(2k-1)=H(2k-1)&=\frac{2^{2k-1}}{2k-1},\\
P(2k)&=-\frac{4^k}{2k},&H(2k)&=-\frac{4^k}{2k-1}.
\end{aligned}
\]

The difference \(P-H\) is nonnegative. Its expectation and absolute
expectation are both

\[
\sum_{k=1}^{\infty}\frac1{2k(2k-1)}=\ln2. \tag{1}
\]

The equality follows by pairing the alternating harmonic series; the series
in (1) itself is nonnegative and absolutely convergent. Relative Expectation
therefore gives \(P\sim H+\ln2\), since the difference between these two
actually coupled variables is integrable with mean zero.

## 2. The auxiliary relative-expectation identity

Let \(Q\) take

\[
a_k=\frac{2^{2k-1}}{2k-1}
\quad\text{with probability}\quad\frac3{4^k},\qquad k\ge1.
\]

The positive and negative masses in the preceding definition of \(H\)
give the identity of laws

\[
H\overset d=M_{2/3}(Q,-2Q). \tag{2}
\]

For an explicit coupling of \(Q\) with a variable \(S\), use the same
index \(k\), put \(S=0\) when \(k=1\), and put \(S=4a_{k-1}\)
when \(k\ge2\). Its law is

\[
S\overset d=M_{1/4}(4Q,0).
\]

At \(k=1\) the expectation contribution from \(Q-S\) is \(3/2\).
For \(k\ge2\), the contribution is

\[
\frac3{4^k}(a_k-4a_{k-1})
=-\frac3{(2k-1)(2k-3)}.
\]

Telescoping yields

\[
\sum_{k=2}^{K}\frac3{(2k-1)(2k-3)}
=\frac32\left(1-\frac1{2K-1}\right).
\]

Consequently \(E[Q-S]=0\) and \(E|Q-S|=3\). Relative Expectation
and Stochastic Equivalence give

\[
Q\sim M_{1/4}(4Q,0). \tag{3}
\]

## 3. Highland Park satisfies a negative fixed-value equation

Substitute (3) into the \(Q\) branch of (2) by Mixture Independence.
Regrouping laws gives

\[
\begin{aligned}
H
&\sim \tfrac16(4Q)+\tfrac12\delta_0+\tfrac13(-2Q)\\
&\overset d=M_{1/2}(-2H,0).
\end{aligned} \tag{4}
\]

In these two lines, scalar coefficients outside parentheses denote
randomized-mixture weights, not pointwise averages of utilities. The last
identity follows directly by pushing the law in (2) through \(x\mapsto-2x\).
No affine transformation has been applied to a preference equality.
Stochastic Equivalence licenses all distributional regrouping.

The sure zero also satisfies

\[
0\sim M_{1/2}(-2\cdot0,0).
\]

Apply Uniqueness of Negative Self-Similarity with
\(p=1/2,a=2,b=0,Z=0\). Equation (4) and the sure-zero equation yield

\[
H\sim0. \tag{5}
\]

This is the central factorization. It avoids extracting a square root of
a positive scaling relation, the point at which the source proof uses
Totality and Positive Affine Invariance.

## 4. Transfer the finite difference to a sure value

For completeness, the limited shift consequence needed here follows from
the listed assumptions. For any \(X\) and real \(c\), the two variables

\[
M_{1/2}(X+c,0),\qquad M_{1/2}(X,c)
\]

under the fixed mixture lift have difference \(c\) on the first half and
\(-c\) on the second half, apart from irrelevant endpoints. Relative
Expectation makes them indifferent. If \(X\sim0\), Mixture Independence
and Stochastic Equivalence also give

\[
M_{1/2}(X,c)\sim M_{1/2}(0,c)\sim M_{1/2}(c,0).
\]

Cancel the common zero branch to obtain \(X+c\sim c\). Apply this with
\(X=H\), \(c=\ln2\), and (5). Together with the comparison from (1),
it proves

\[
P\sim H+\ln2\sim\ln2.
\]

Any variable with Pasadena's law is indifferent to the constructed \(P\)
by Stochastic Equivalence, so the conclusion has the universal form of the
recorded evaluation principle.

`checks/calculation_factorizations.py` verifies the telescoping coupling
identities with exact fractions and explicit remaining-series bounds. Those
diagnostics supplement this proof; they do not certify the preference axioms.
