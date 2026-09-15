# Expected Utility, Independence and L¹ Continuity yield Relative Expectation

**Claim.** Rich Outcomes + Expected Utility + Stochastic Equivalence + Mixture
Independence + Stochastic Dominance $+ L^{1}$ Continuity imply Relative Expectation.

In particular, the map's existing DTU $+ L^{1}$ Continuity implication to Expected
Utility shows that **DTU + L¹ Continuity implies Relative Expectation without
affine symmetry**. Only the recorded upper-section continuity clause is used.

Write the variables' finite utility coordinates as $X,Y$. Rich Outcomes and
Expected Utility supply all real coordinates and the total measurable chart.

## Zero-mean integrable differences

Suppose $D=X-Y$ is integrable and $\mathbb E D=0$. Define

$$E_n=\{|X|\le n,\ |Y|\le n\},\qquad p_n=\Pr(E_n).$$

These measurable events increase to the whole sample space, so $p_n\to1$.
Discard any initial terms with $p_n=0$. Put

$$c_n=\frac{\mathbb E[D\mathbf1_{E_n}]}{p_n},\qquad
X_n=\begin{cases}X-c_n&\text{on }E_n,\\Y&\text{off }E_n.\end{cases} \tag{1}$$

The conditional laws of $X-c_n$ and $Y$ on $E_n$ are bounded and have the
same expectation, since

$$\mathbb E[X-c_n\mid E_n]-\mathbb E[Y\mid E_n]
=\frac{\mathbb E[D\mathbf1_{E_n}]}{p_n}-c_n=0.$$

Realize those conditional laws as variables on the standing atomless space.
Expected Utility makes them indifferent. If $p_n<1$, both $X_n$ and $Y$
have probability-mixture laws with these conditional variables in their
$E_n$ branches and the same conditional law of $Y$ on $E_n^c$ in their other
branches. Mixture Independence and Stochastic Equivalence therefore imply

$$X_n\sim Y. \tag{2}$$

If $p_n=1$, $c_n=\mathbb E D=0$ and both original variables have bounded
laws, hence finite expectations; Expected Utility gives (2) directly. Values
on a null complement cause no integrability problem. This endpoint case
does not apply Mixture Independence with a forbidden weight of one.

The actual coupling in (1) obeys

$$\begin{aligned}
\mathbb E|X_n-X|
&\le \mathbb E[|D|\mathbf1_{E_n^c}]+p_n|c_n|\\
&=\mathbb E[|D|\mathbf1_{E_n^c}]
 +|\mathbb E[D\mathbf1_{E_n}]|\longrightarrow0.
\end{aligned}$$

Dominated convergence and $\mathbb E D=0$ justify the limit. The first weak
comparison in (2), followed by upper-section $L^{1}$ Continuity with fixed $Y$,
gives $X\succeq Y$. Repeat the same construction with $X,Y$ interchanged to
obtain $Y\succeq X$. We have therefore proved

$$\mathbb E|X-Y|<\infty,\quad \mathbb E(X-Y)=0
\quad\Longrightarrow\quad X\sim Y. \tag{3}$$

The second comparison in (3) comes from a second *upper-section* limit. It
does not infer closure of lower sections from the given axiom.

## General means and strict comparison

For an arbitrary integrable difference, put $m=\mathbb E(X-Y)$. Rich Outcomes
supplies $Y+m$. Since $X-(Y+m)$ has zero mean and is integrable, (3) gives

$$X\sim Y+m. \tag{4}$$

If $m>0$, the translated law $Y+m$ stochastically dominates $Y$: its survival
function is $S_Y(t-m)\ge S_Y(t)$. At least one comparison is strict. Indeed
the intervals $(km,(k+1)m]$, $k\in\mathbb Z$, cover the line, so some such
interval has positive probability and its upper endpoint supplies a strict
tail comparison. Rich Outcomes makes that threshold an available outcome.
Thus Stochastic Dominance gives $Y+m\succ Y$. If $m<0$ the reverse argument
gives $Y\succ Y+m$; if $m=0$ the two variables are identical.

Together with (4) and transitivity these cases prove exactly

$$X\succeq Y\iff\mathbb E(X-Y)\ge0.$$

No Totality, symmetry, Shift Transfer or Shift Invariance is used. The shift
in (4) is constructed as a random variable and compared by (3); it is not a
transport of a preference by an unassumed invariance axiom. Stochastic
Equivalence is written explicitly to license the conditional-law mixture
replacements, even though this topic's Stochastic Dominance implies it.

## Attribution and scope

**Original work: moderate connecting argument by truncation adaptation.**
Zachary Goodsell supplies the principles and Corollary 5's implication in
the full DTU+Sym context. The present proof uses bounded conditional pieces,
mean corrections and two upper-section limits to remove the symmetry
assumptions in the stated sufficient package. It is credited as a connecting
proof, not as a theorem already attributed to the paper. This describes work
performed for the map, not literature priority.

Combined with the existing source-based DTU $+ L^{1}$ Continuity implication to
Expected Utility, this yields the claimed DTU consequence. It does not claim
the converse: the separate infinitesimal folded-tail model satisfies DTU,
Relative Expectation and even Folded Expectation while violating $L^{1}$ Continuity.

**Sources.** Zachary Goodsell, *Symmetries of value*, §3, p. 23, and pp. 26–27
(Relative Expectation and Corollary 5). Connecting proof: GPT-6 (Codex),
9 September 2026. No independent checker or Lean proof is claimed.

## Paper references

- **Background: [Symmetries of value](https://doi.org/10.1111/nous.12549).** Zachary Goodsell (2026). Symmetries of value. Noûs, 60, 16–37. — §3, p. 23; Relative Expectation and Corollary 5 in the full DTU+Sym context, pp. 26–27
