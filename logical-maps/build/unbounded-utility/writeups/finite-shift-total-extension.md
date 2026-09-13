# Stochastic dominance: finite-shift total extension

There is a model of **DTU and Shift Invariance** in which **Shift Transfer
fails**. For $U$ uniform on $[0,1]$, the model makes

$$A=M_{1/2}(U+1,0)\succ B=M_{1/2}(U,1).$$

Shift Transfer requires indifference, with $p=1/2$ and transfer parameter
$b=1/2$. Both gambles are bounded and have expectation $3/4$.

**Source and work accounting.** Zachary Goodsell proposed the finite-shift
conclosure and separating total extension in the project conversation of
13 September 2026. Conclosure and the total-extension strategy are
Goodsell's methods, already recorded in the
[CDF-area total-extension write-up](conjectured-total-independent-sum-extension.html)
from *Unbounded Utility and Background Risk* (unpublished), 5 June 2026,
sections 3–4, pp. 7–14. That manuscript is marked “do not cite” and erroneous
in its symmetric-extension claim; the withdrawn claim is not used here.
GPT-6 (Codex) supplied the canonical-cone adaptation, finite-kernel witness,
and extension proof below, using its
[finite-support-compensation model and witness](finite-support-compensated-dominance.html)
of 9 September 2026. The new separating result is recorded under Misc.,
not attributed to the manuscript. No literature priority, independent
checker, or Lean proof is claimed.

## The canonical DU cone

Take all measurable real-valued random variables on the standing atomless
standard probability space, with real outcomes and identity utility. Let
$V$ be the real vector space of survival profiles of finite signed Borel
measures of total mass zero, identified almost everywhere. In particular,

$$d_{X,Y}(t)=S_X(t)-S_Y(t)=F_Y(t)-F_X(t)\in V.$$

Define

$$P=\{v\in V:v\geq0\text{ almost everywhere}\},$$

$$N=\{n\in V:n\text{ is compactly supported and finite-step},\ \int n=0\},
\qquad C=P+N.$$

Here “finite-step” means only finitely many steps. For any cone $H$, write
$L_H=H\cap(-H)$ for its indifferent subspace and
$H^{\mathrm{str}}=H\setminus(-H)$ for its strictly positive part.

The cone $C$ has

$$L_C=N. \tag{1}$$

Indeed, if $p+n=-(q+m)$ with $p,q\in P$ and $n,m\in N$, then
$p+q=-(n+m)$ is nonnegative with integral zero. Hence $p=q=0$ almost
everywhere. Conversely, $N$ is a subspace contained in $C$. The same
argument gives the useful criterion

$$v\in L^1,\quad\int v=0
\quad\Longrightarrow\quad(v\in C\iff v\in N). \tag{2}$$

The ordering $X\succeq_CY$ iff $d_{X,Y}\in C$ satisfies DU. Cone addition
gives transitivity, and law dependence gives Stochastic Equivalence.
Mixing both laws with a common law multiplies their difference by $p>0$,
so positive scalar cancellation proves Mixture Independence in both
directions. Nonnegative profiles are in $P$; a nonzero one cannot lie in
$N$, so strict Stochastic Dominance remains strict. A strict threshold
inequality gives a nonzero profile almost everywhere by right continuity.

For finite-valued $X,Y$, the profile $d$ is compact finite-step, with
$m=\int d=E[X]-E[Y]$. Writing $h=\mathbf1_{[0,1)}$ gives
$d=mh+(d-mh)$, where $d-mh\in N$. Thus $m\geq0$ implies $d\in C$.
Conversely, if $d=p+n\in C$, then $p=d-n$ is integrable and
$m=\int p\geq0$. This proves Simple EU, including strictness for unequal
means. Sure outcomes consequently have the ordinary real order and
identity chart. All real outcomes are available, and for $a>b>c$ the
mixture of $a,c$ with weight $(b-c)/(a-c)$ on $a$ is indifferent to $b$.
Thus Rich Outcomes and Archimedean Outcomes hold.

The earlier finite-support-compensation write-up also proves that this is
the least DU preorder on real utility laws. The extension below needs
only the directly verified properties above.

## Finite-shift conclosure

Let $\mathcal F$ be the probability laws with finite support. For
$\mu=\sum_{i=1}^k a_i\delta_{b_i}$, with $a_i>0$ and $\sum_i a_i=1$, set

$$T_\mu v(t)=\sum_{i=1}^k a_i v(t-b_i).$$

These operators map $V$ to $V$, commute, include the identity, and satisfy
$T_\mu T_\nu=T_{\mu*\nu}$. Also, for $a,b\geq0$ with $a+b>0$,

$$aT_\mu+bT_\nu=(a+b)T_{(a\mu+b\nu)/(a+b)}. \tag{3}$$

Every kernel on the right still has finite support. Point masses supply
all real shifts and their inverses. No countable averaging or topological
closure is used.

Every $T_\mu$ preserves $C$ weakly and strictly: it maps $P$ to $P$ and
$N$ to $N$. If $p\in P$ is nonzero, then $T_\mu p$ is nonnegative and
nonzero. Thus $T_\mu(p+n)$ cannot be in $N$, since that would put the
nonzero nonnegative profile $T_\mu p$ in $N$.

For any forward-invariant cone $H$, define

$$\operatorname{Sat}_f(H)=\{v\in V:\exists\mu\in\mathcal F,\ T_\mu v\in H\}.$$

It is a cone. If $T_\mu v,T_\nu w\in H$, then

$$T_{\mu*\nu}(v+w)=T_\nu(T_\mu v)+T_\mu(T_\nu w)\in H.$$

Positive scalar closure is immediate. For every $\rho\in\mathcal F$,

$$v\in\operatorname{Sat}_f(H)
\quad\Longleftrightarrow\quad
T_\rho v\in\operatorname{Sat}_f(H). \tag{4}$$

For the forward implication, commute $T_\rho$ past a witnessing operator
and use forward invariance of $H$. For the reverse implication, compose
$\rho$ with the witnessing kernel. Call a cone satisfying (4)
**saturated**.

If the operators also preserve strictness in $H$, saturation preserves
every strict comparison of $H$. For $v\in H^{\mathrm{str}}$, membership
of $-v$ in the saturation would give $-T_\mu v\in H$, contradicting
$T_\mu v\in H^{\mathrm{str}}$.

Therefore $D_0=\operatorname{Sat}_f(C)$ is saturated and preserves all weak
and strict comparisons of $C$. Its indifferent subspace may be larger
than $N$; the proof does not identify the two.

## A transfer pair that stays incomparable

For the displayed $A,B$, direct calculation gives

$$v(t)=S_A(t)-S_B(t)=
\begin{cases}
(t-1)/2,&0<t<1,\\
(2-t)/2,&1<t<2,\\
0,&\text{otherwise},
\end{cases} \tag{5}$$

almost everywhere. Its positive and negative integrals are each $1/4$.

For every $\mu\in\mathcal F$, $T_\mu v$ is compactly supported and has
integral zero. It is not finite-step. Merge repeated atoms and let $b_0$
be the smallest atom of $\mu$, with weight $a_0>0$. Choose $\delta>0$
smaller than $1$ and smaller than the gap to the next atom, if there is
one. On $(b_0,b_0+\delta)$, only the translate at $b_0$ contributes:

$$T_\mu v(t)=\frac{a_0}{2}(t-b_0-1).$$

Its slope is $a_0/2>0$ on a nonempty interval, so it cannot agree almost
everywhere with a finite-step function. Criterion (2) consequently excludes
both $T_\mu v$ and $-T_\mu v$ from $C$. Thus

$$v\notin D_0,\qquad -v\notin D_0. \tag{6}$$

The finiteness of the kernel is used in the existence of the smallest atom
and the positive gap.

## Orienting a comparison without adding indifferences

Let $D$ be any saturated cone and suppose $w\notin D\cup(-D)$. Adjoin
$w$ and all its finite shift averages:

$$K=\{d+aT_\mu w:d\in D,\ a\geq0,\ \mu\in\mathcal F\}.$$

Identity (3) makes $K$ a cone. Commutation and forward invariance of $D$
make it forward invariant. We will prove

$$L_K=L_D,\qquad L_{\operatorname{Sat}_f(K)}=L_D. \tag{7}$$

First suppose $k=d_1+aT_\mu w$ and $-k=d_2+bT_\nu w$ belong to $K$.
If $a+b>0$, adding gives

$$0=d_1+d_2+(a+b)T_\theta w$$

for a finite probability law $\theta$, by (3). Hence $-T_\theta w\in D$;
saturation would force $-w\in D$, a contradiction. Thus $a=b=0$, and
$k\in L_D$. The reverse inclusion follows from $D\subseteq K$.

Now suppose $x,-x\in\operatorname{Sat}_f(K)$. Choose witnesses with
$T_\mu x\in K$ and $-T_\nu x\in K$. Forward invariance and commutation
give both $T_{\mu*\nu}x$ and its negative in $K$. By the first equality
in (7), $T_{\mu*\nu}x\in L_D$. Applying saturation of $D$ to both signs
gives $x\in L_D$. The reverse inclusion is again immediate.

Consequently $D'=\operatorname{Sat}_f(K)$ is saturated, extends $D$, and
has exactly the same indifferent subspace. Every old strictly positive
element stays strict: acquiring its negative would put it in $L_{D'}=L_D$.
Also $w\in D'$ and $w\notin L_D$, so $w$ is strictly positive in $D'$.
This proves strictness after saturation, not merely before it.

Apply this lemma to $D_0$ and the profile $v$ from (5). Write $D_1$ for
the resulting saturated cone and $L=L_{D_0}=L_{D_1}$. Then $v$ is strict
in $D_1$ and all original strict comparisons of $C$ remain strict.

## Total extension

Consider the family of saturated cones $E$ containing $D_1$ and satisfying
$E\cap(-E)=L$, ordered by inclusion. It is nonempty, since it contains
$D_1$. The union of any nonempty chain is a saturated cone: each cone
operation involves finitely many memberships, and each direction of (4)
holds in the chain member containing the relevant vector. Its indifferent
subspace is exactly $L$. Indeed, if both $x$ and $-x$ enter the union,
they occur together in one chain member, so $x\in L$. The empty chain
has upper bound $D_1$.

Zorn's lemma therefore supplies a maximal member $E_*$. If some
$w\notin E_*\cup(-E_*)$, the orientation lemma would supply a strictly
larger saturated cone with the same indifferent subspace $L$, still
containing $D_1$. This contradicts maximality. Hence

$$E_*\cup(-E_*)=V.$$

Define preferences on the original random variables by

$$X\succeq_*Y\quad\Longleftrightarrow\quad S_X-S_Y\in E_*.$$

The cone gives reflexivity and transitivity, and the displayed coverage
gives Totality. Law dependence and positive scalar cancellation give
Stochastic Equivalence and the full Mixture Independence biconditional.
The extension preserves every weak and strict comparison of $C$, so
Stochastic Dominance, Simple EU, Rich Outcomes, and Archimedean Outcomes
remain valid. These are DTU.

For every real $b$, equation (4) applied to $\delta_b$ gives

$$X\succeq_*Y\quad\Longleftrightarrow\quad X+b\succeq_*Y+b,$$

which is Shift Invariance. The fixed indifferent subspace protects the
strict comparison $v\in D_1\setminus L$, so $A\succ_*B$. Shift Transfer
therefore fails. Starting the orientation lemma with $-v$ instead gives
another such model with $B\succ_*A$.

This is a total preorder on gambles; distinct same-law variables remain
indifferent. Equivalence classes, rather than individual random variables,
carry the associated total order.

## Other verified properties and failures

Equation (4) also gives invariance under addition of an independent
finite-valued summand. This is already forced by the target axioms: Shift
Invariance transfers a weak or strict comparison to every shifted pair,
and finite mixture replacement combines the comparisons. Totality supplies
the converse by ruling out the reverse strict comparison. No claim of
Independent Sum Invariance for arbitrary summands follows from this argument.

Use the same fair coin and $U$ to couple $A,B$. On its first branch,
$A=U+1$ and $B=U$; on the other, $A=0$ and $B=1$. Thus $A-B$ takes
just $1,-1$ with equal probabilities. Its mean is zero, while $A\succ_*B$.
This refutes **Simple Relative Expectation** and **Relative Expectation**.
The bounded equal-mean pair also refutes **Expected Utility**; its equal
finite signed areas refute **CDF-Area Extension**. Simple EU is unaffected,
since these mixture laws are not finite-valued.

For every $\varepsilon>0$, the profile
$d=S_{B+\varepsilon}-S_A$ is compactly supported, piecewise affine, and
has integral $\varepsilon$. Choose a compact finite-step lower
approximation $q\leq d$ with integral $m>0$; a sufficiently fine partition
including the finitely many breakpoints supplies one. With
$n=q-m\mathbf1_{[0,1)}$, we have $n\in N$ and $d-n\geq0$. Thus
$B+\varepsilon\succeq_*A$ for every positive $\varepsilon$, but
$B\not\succeq_*A$. This refutes **Continuity under Vanishing Shifts**.
Taking $B_n=B+1/n$ gives $E|B_n-B|=1/n$, directly refuting the recorded
upper-section **L¹ Continuity** as well.

**Symmetric Neutrality** fails: together with the verified assumptions it
would imply Shift Transfer by the recorded
[neutrality-and-shift argument](neutrality-shift-imply-shift-transfer.html).
**Reflection Anti-Invariance** also fails, since with Totality and law
invariance it makes every symmetric gamble neutral, contradicting that
failure. These are deductions from proved implications, not from the
omission of symmetry conditions in the construction. Positive affine
invariance is left unasserted.

The construction is nonconstructive and covers all real laws, including
those without defined expectations. The accompanying exact-rational check
verifies the witness, its areas, simple coupling, finite-kernel examples,
and positive-shift margins. It does not compute the maximal ordering or
prove the universal extension lemma. The latter is the analytic argument
above; no independent checker or Lean verification is claimed.

## Paper references

- **Background: Unbounded Utility and Background Risk.** Zachary Goodsell (5 June 2026). Unbounded Utility and Background Risk. Unpublished working manuscript. — sections 3–4, pp. 7–14: conclosure and total-extension method. The new finite-shift separating extension is proved separately; the withdrawn symmetric-extension claim is not used.
- **Formulation: [Symmetries of value](https://doi.org/10.1111/nous.12549).** Zachary Goodsell (2026). Symmetries of value. Noûs, 60, 16–37. — Theorems 3–4, pp. 25–27: Shift Transfer and Simple Relative Expectation
