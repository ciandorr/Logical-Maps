# A Lévy obstruction to neutral symmetric gambles and independent sums

**Proved implication:** Rich Outcomes + Stochastic Dominance + Mixture
Independence + Symmetric Gambles Are Neutral + Independent Sum Preservation
implies **False**.

**Original work: proof adaptation and completion.** Zachary Goodsell proposed
the stable-law obstruction: neutral symmetric gambles can cease to be
indifferent after adding independent background risk. GPT-6 (Codex),
9 September 2026, supplied the exact positive index-$1/2$ law below, the
intermediate symmetric difference, the complete dominance comparison, and
the reduced sufficient premises. This completes that proposed mechanism;
it does not claim a new construction independent of Goodsell's suggestion,
or priority over the literature. The direct source for this completion is
**Misc.**, with the proposal and analytic reference credited separately.
No independent checker or Lean verification is claimed.

## 1. The positive stable variable

Use the finite utility chart supplied by Rich Outcomes and let $L$ have density

$$
f(t)=\frac{1}{2\sqrt{\pi}}t^{-3/2}e^{-1/(4t)},\qquad t>0.
$$

Its survival function is

$$
S_L(t)=
\begin{cases}
1,&t\leq0,\\
\operatorname{erf}\!\left(\dfrac{1}{2\sqrt t}\right),&t>0,
\end{cases}
\qquad
\operatorname{erf}(x)=\frac{2}{\sqrt\pi}\int_0^x e^{-u^2}\,du.
$$

Substitution $u=1/(2\sqrt t)$ gives normalization and this survival formula.
The same substitution gives, for $s>0$,

$$
E[e^{-sL}]
=\frac{2}{\sqrt\pi}\int_0^\infty
 e^{-u^2-s/(4u^2)}\,du
=e^{-\sqrt s}.
$$

For completeness, write $I(a)=\int_0^\infty e^{-u^2-a^2/u^2}\,du$.
For $a>0$, differentiation under the integral and substitution $v=a/u$
give $I'(a)=-2I(a)$. Dominated convergence gives $I(0)=\sqrt\pi/2$,
so $I(a)=(\sqrt\pi/2)e^{-2a}$. The integral identity is also recorded in
[NIST DLMF, equation 7.7.8](https://dlmf.nist.gov/7.7.E8).

Consequently independent copies $L_1,L_2$ satisfy

$$L_1+L_2\overset d=4L,$$

because both sides have Laplace transform $e^{-2\sqrt s}$, and Laplace
transforms determine probability laws on $[0,\infty)$. Thus the stability
index is explicitly $1/2$; no ambiguous scale convention is needed.

## 2. What the preference principles force

Realize $L_1,L_2$ and a fair sign $\varepsilon\in\{-1,1\}$ independently
on the standing atomless probability space. Set

$$W=\varepsilon L_1,\qquad D=L_2-L_1.$$

The laws of $W$ and $D$ are symmetric about zero: for $D$, exchange the two
independent identically distributed inputs. Symmetric Gambles Are Neutral
therefore gives $W\sim0$ and $D\sim0$.

The variable $L_2$ is independent of $(W,0)$. Applying the weak part of
Independent Sum Preservation to each direction of $W\sim0$ yields

$$W+L_2\sim L_2.$$

Conditioning on the independent fair sign shows

$$
W+L_2\overset d=M_{1/2}(L_1+L_2,D)
\overset d=M_{1/2}(4L,D).
$$

These are identities of laws, not identities of the fixed random-variable
mixture lift. Stochastic Dominance entails Stochastic Equivalence by applying
its weak clause in both directions when all tails agree, so these law
replacements are licensed. Mixture Independence applied to $D\sim0$ gives

$$M_{1/2}(4L,D)\sim M_{1/2}(4L,0).$$

To use the displayed form of Mixture Independence, first place $D$ and $0$
in the first mixture branch, with common second branch $4L$, and then exchange
the equal-weight branches by Stochastic Equivalence. Finally $L_2\sim L$
by that same principle. Transitivity now forces

$$\boxed{L\sim M_{1/2}(4L,0).}$$

## 3. Strict stochastic dominance contradicts that indifference

Put $B=M_{1/2}(4L,0)$. For $t>0$, setting $x=1/(2\sqrt t)>0$ gives

$$S_L(t)=\operatorname{erf}(x),\qquad
S_B(t)=\tfrac12\operatorname{erf}(2x).$$

The function $\operatorname{erf}$ vanishes at zero and is strictly concave
on the positive half-line, because

$$\operatorname{erf}''(x)=-\frac{4x}{\sqrt\pi}e^{-x^2}<0\quad(x>0).$$

Hence $\operatorname{erf}(x)>\tfrac12\operatorname{erf}(2x)$ for every
$x>0$. At $t<0$ both survival functions are one; at $t=0$, they are
respectively one and one half. Thus $L$ weakly dominates $B$ at every
threshold and strictly dominates at some threshold. Stochastic Dominance
requires $L\succ B$, contradicting $L\sim B$.

All variables used take finite utility levels. The ordered chart embeds all
real levels by Rich Outcomes. If there are additional outcomes outside the
chart, their thresholds cut the realized real levels into upper rays; the
same real-threshold inequalities and their one-sided limits prove dominance
at those thresholds as well. No claim about utility arithmetic outside the
chart is used.

## Consequences and limits

The result rules out Independent Sum Preservation under DU plus Symmetric
Gambles Are Neutral, and therefore rules out Independent Sum Invariance
under that package. It settles the
[earlier symmetric-DTU incompatibility candidate](symmetric-dtu-refutes-independent-sum-candidate.html)
through a new proof record, preserving the candidate's original attribution.

The proof needs no Totality, Simple Expected Utility, reflection principle,
or independent-sum cancellation. Only weak forward sum preservation is used
to preserve an indifference; the current preservation node also requires
strict preservation, so it supplies more than is needed.

The check `checks/levy_obstruction.py` verifies the chosen transform and tail
formulas numerically at finitely many points. The analytic argument above,
not those samples, establishes the universal dominance statement.

## Paper references

- **Background: [Flummoxing expectations](https://doi.org/10.1111/nous.12530).** Hayden Wilkinson (2025). Flummoxing expectations. Noûs, 59(3), 700–728. First published online in 2024. — §6.1. Source of Independent Sum Consistency; see the principle reference for the changed independence condition. The proof or conjecture recorded here retains its separate attribution.
