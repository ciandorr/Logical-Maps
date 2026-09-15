# DU and upper-section L¹ Continuity imply Relative Expectation

**Proved implication:** Rich Outcomes + Archimedean Outcomes + Stochastic
Equivalence + Stochastic Dominance + Mixture Independence $+ L^{1}$ Continuity
imply Relative Expectation. These are **DU + L¹ Continuity**; Totality is
not included.

The argument first derives expected-utility comparisons for bounded gambles.
It then compares bounded conditional pieces of arbitrary gambles and takes
an upper-section limit. Full Expected Utility, lower-section continuity,
Shift Invariance and symmetry are not assumed.

## Utility coordinates and finite gambles

The existing
[finite-lottery representation proof](rich-archimedean-dominance-independence-imply-simple-eu.html)
derives Simple EU from Rich Outcomes, Archimedean Outcomes, Stochastic
Dominance and Mixture Independence, without Totality. It supplies a total,
measurable normalized utility chart that strictly preserves the outcome
order. Rich Outcomes supplies a sure outcome at every real utility level.

Below, write $X,Y,V$ for utility coordinates and write a real number $c$
for a sure outcome at level $c$. All finite-valued replacements are available:
choose their finitely many sure outcomes and paste them along the stated
measurable events. This suffices for the main proof, so it does not require
an arbitrary translated outcome-valued variable to be measurable.

## Bounded EU from two upper-section limits

Let $V$ have a bounded law, and put $v=\mathbb E V$. Null exceptional values
can first be replaced using Stochastic Equivalence. Define upward finite
quantizations

\[
Q_n=\frac{\lceil nV\rceil}{n},\qquad v_n=\mathbb E Q_n.
\]

They obey $0\le Q_n-V\le1/n$ almost surely and
$v\le v_n\le v+1/n$. Each $Q_n$ has a finite range. Simple EU gives
$Q_n\sim v_n$, and Stochastic Dominance gives $Q_n\succeq V$.
Comparison of sure outcomes therefore yields

\[
Q_n\succeq v,\qquad v_n\succeq V.
\tag{1}
\]

In the first comparison the left side converges in actual $L^1$ distance to
$V$. In the second, the left side is a sequence of sure outcomes converging
to the sure $v$. Applying the recorded upper-section continuity clause to
each sequence gives

\[
V\succeq v,\qquad v\succeq V.
\]

Consequently

\[
V\sim\mathbb E V
\quad\text{for every bounded-law gamble }V.
\tag{2}
\]

Together with the standing order on sure outcomes, (2) ranks any two
bounded-law gambles exactly by their expectations, including strict
comparisons. Both limits used upper sections; no closure of lower sections
was inferred. This lemma itself does not use Mixture Independence once
Simple EU is available.

**Observation about weaker continuity.** On real-valued gambles, this
bounded lemma already follows from the weaker-looking closure clause

\[
\bigl(\forall\varepsilon>0,\ V+\varepsilon\succeq W\bigr)
\ \Longrightarrow\ V\succeq W.
\tag{3}
\]

For each $\varepsilon>0$, take $n$ with $1/n<\varepsilon$.
Dominance and (1) give
$V+\varepsilon\succeq Q_n\succeq v$ and
$v+\varepsilon\succeq v_n\succeq V$. Applying (3) twice proves
(2). This is an observation about the bounded lemma only: the proof below
still uses the recorded $L^{1}$ Continuity axiom for its conditional limits.
Constructing and comparing a shifted variable here does not assume Shift
Invariance of preferences.

## Integrable differences with nonnegative mean

Suppose

\[
D=X-Y\in L^1,\qquad m=\mathbb E D\ge0.
\]

There is no assumption that $X$ or $Y$ separately has an expectation. Set

\[
E_n=\{|X|\le n,\ |Y|\le n\},\qquad p_n=\Pr(E_n).
\]

The events increase to the whole sample space, so $p_n\to1$. Discard
initial indices with $p_n=0$. On $E_n$, quantize $X$ upward to

\[
q_n=\frac{\lceil nX\rceil}{n}.
\]

Only finitely many values occur on $E_n$, and
$0\le q_n-X\le1/n$ there. Define

\[
c_n=\frac{\mathbb E[(q_n-Y)\mathbf1_{E_n}]-m}{p_n},
\qquad
Z_n=\begin{cases}
q_n-c_n&\text{on }E_n,\\
Y&\text{off }E_n.
\end{cases}
\tag{4}
\]

The expectation in $c_n$ is finite because both variables in it are bounded
on $E_n$. The new branch $q_n-c_n$ remains finite-valued, with its sure
outcomes supplied by Rich Outcomes. For the expectation notation, extend
$q_n$ arbitrarily by zero off $E_n$; this has no effect on (4).

The two conditional laws on $E_n$ are bounded and satisfy

\[
\mathbb E[Z_n\mid E_n]-\mathbb E[Y\mid E_n]=\frac{m}{p_n}\ge0.
\tag{5}
\]

Realize these conditional laws on the standing atomless space. By bounded
EU they compare in the direction displayed in (5). If $p_n<1$, both full
laws have these as their $E_n$ branches, with the same conditional law of
$Y$ on $E_n^c$ as their other branch. Mixture Independence and Stochastic
Equivalence give

\[
Z_n\succeq Y.
\tag{6}
\]

If $p_n=1$, both full laws are bounded and their means differ by $m$;
bounded EU gives (6) directly. Values on a null complement can be replaced
using Stochastic Equivalence. There is no application of Independence with
a forbidden weight of one.

For convergence, use $\mathbb E D=m$ to obtain

\[
\begin{aligned}
p_n|c_n|
&=\left|\mathbb E[(q_n-Y)\mathbf1_{E_n}]-m\right|\\
&\le \frac{p_n}{n}+\mathbb E[|D|\mathbf1_{E_n^c}].
\end{aligned}
\]

Consequently the actual coupling in (4) satisfies

\[
\begin{aligned}
\mathbb E|Z_n-X|
&\le \frac{p_n}{n}+p_n|c_n|
       +\mathbb E[|D|\mathbf1_{E_n^c}]\\
&\le \frac{2}{n}+2\mathbb E[|D|\mathbf1_{E_n^c}]
\longrightarrow0.
\end{aligned}
\tag{7}
\]

Integrability of $D$ and dominated convergence justify the last limit.
Apply upper-section $L^{1}$ Continuity to (6), with fixed right side $Y$:

\[
X\succeq Y
\quad\text{whenever }X-Y\in L^1
\text{ and }\mathbb E(X-Y)\ge0.
\tag{8}
\]

## Strictness and the full biconditional

Suppose $m>0$. Choose $K\ge1$ so
$F=\{|Y|\le K\}$ has positive probability. Atomlessness permits a
measurable $G\subseteq F$ with

\[
0<\Pr(G)<\frac{m}{2K+1}.
\]

Replace $Y$ on $G$ by the sure outcome $K+1$, leaving it unchanged
elsewhere; call the result $Y'$. The replacement has an integrable positive
difference and

\[
0<\delta:=\mathbb E(Y'-Y)
\le(2K+1)\Pr(G)<m.
\]

It weakly increases every upper tail and strictly increases the tail at
threshold $K$ by $\Pr(G)$. Stochastic Dominance therefore gives
$Y'\succ Y$. Meanwhile $X-Y'$ is integrable with mean $m-\delta>0$.
The already proved weak result (8) gives $X\succeq Y'$, hence
$X\succ Y$ by transitivity.

If $m=0$, apply (8) to both $(X,Y)$ and $(Y,X)$, obtaining $X\sim Y$.
If $m<0$, the positive-mean argument with the variables interchanged gives
$Y\succ X$. These three cases establish precisely

\[
X-Y\in L^1
\quad\Longrightarrow\quad
\bigl(X\succeq Y\iff\mathbb E(X-Y)\ge0\bigr).
\]

This is Relative Expectation. All additional variables in this main proof
use finite-valued replacements on measurable events. No Shift Invariance
or comparison of every arbitrary pair of gambles enters the argument.

## Consequences and attribution

Combining this theorem with the existing
[Relative-to-CDF proof](relative-dominance-imply-cdf-area.html) gives
**DU + L¹ Continuity ⇒ CDF-Area Extension**. Relative Expectation also
restricts to Simple Relative Expectation, whose
[two-branch calculation](simple-relative-implies-shift-transfer.html)
gives **Shift Transfer**. Neither consequence requires Totality or Shift
Invariance as an additional assumption. Thus the previous DTU consequences
extend to DU.

**Original work: moderate connecting proof and premise reduction.** The
bounded quantization lemma is short. The conditional construction adapts the
earlier [Expected-Utility-based proof](eu-independence-l1-imply-relative.html)
by deriving the bounded comparison it needs and using finite quantizations
with mean corrections. The bounded-event argument supplies strictness
without an invariance axiom or a general outcome-space translation map.
This describes the work performed here, not a claim of literature priority.

Zachary Goodsell supplies the principles, utility framework and the source
results: *Decision theory unbound*, §3.2, pp. 678–681, and §3.3,
pp. 681–682; *Symmetries of value*, §3, p. 23, and pp. 26–27. The present
connecting proof and earlier project proofs are credited to GPT-6 (Codex),
9 September 2026, following the user's request to audit the DU premises.
The original source-attributed theorems and the earlier sufficient-premise
proof remain intact. No independent checker or Lean verification is claimed.

## Paper references

- **Background: [Symmetries of value](https://doi.org/10.1111/nous.12549).** Zachary Goodsell (2026). Symmetries of value. Noûs, 60, 16–37. — §3 p. 23 (upper-section L1 Continuity and the DTU consequence for Expected Utility), pp. 26–27 (Relative Expectation and Corollary 5 in the symmetry setting)
- **Background: [Decision theory unbound](https://doi.org/10.1111/nous.12473).** Zachary Goodsell (2024). Decision theory unbound. Noûs, 58, 669–695. First published online in 2023. — §3.2 pp. 678–681 and §3.3 pp. 681–682 (finite expected utility and the DU/DTU distinction)
