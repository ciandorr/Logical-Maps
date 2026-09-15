# Lexicographic expectation: nonatomic mass

On the full measurable domain, **Countable Sure-Thing and Simple EU do
not imply Expected Utility**, and **Countable Sure-Thing and Archimedean
Outcomes do not imply Archimedean Gambles**. One model refutes both
implications, even with Totality, Stochastic Equivalence, Stochastic
Dominance, Mixture Independence and Sure-Thing.

**Source and work accounting.** Zachary Goodsell proposed the two
implications on 8 September 2026 and requested proofs and a
Russell–Isaacs source check on 13 September. GPT-6 (Codex) supplied the
countermodel and proofs below on 13 September 2026. The source comparison
at the end distinguishes this new countermodel from Russell and Isaacs's
published discrete-lottery theorem. No independent checker, literature
priority or Lean verification is claimed.

## Construction

Take outcomes $O=[0,1]$, with the usual order, Borel structure and reference
outcomes $0,1$. All measurable $O$-valued random variables on the standing
atomless standard probability space are available.

For any finite positive Borel measure $\mu$ on $O$, put

$$D_\mu=\{x:\mu(\{x\})>0\},\qquad c(\mu)=\mu(O\setminus D_\mu).$$

Thus $D_\mu$ is countable and $c(\mu)$ is the total mass of the nonatomic
part, including any singular continuous part. For a gamble $X$, define

$$V(X)=\bigl(E[X],\,c(\mathcal L(X))\bigr),\qquad
X\succeq Y\ \Longleftrightarrow\ V(X)\geq_{\mathrm{lex}}V(Y).$$

The first coordinate decides unless the means agree; in that case, the
larger nonatomic mass is preferred. Both coordinates lie in $[0,1]$.
Lexicographic order is a total order on these vectors, so its pullback is
a reflexive, transitive, total preference on all gambles.

## Countable additivity of the two coordinates

Suppose $\mu=\sum_n\mu_n$ is a finite positive measure. Then

$$D_\mu=\bigcup_nD_{\mu_n},\qquad c(\mu)=\sum_n c(\mu_n). \tag{1}$$

The first identity follows by evaluating singletons. For each $n$,
$D_\mu\setminus D_{\mu_n}$ is countable and has $\mu_n$-measure zero.
Consequently $\mu_n(O\setminus D_\mu)=c(\mu_n)$; summing gives (1).
Also $c(a\mu)=a c(\mu)$ for $a\geq0$. Thus $c$ is additive under arbitrary
countable positive mixtures, not only mixtures with disjoint supports.

Let $(E_n)$ be any countable measurable partition and write
$\mu_n(B)=P(E_n\cap\{X\in B\})$. Its sum is $\mathcal L(X)$, while

$$\mathcal L(X|E_n)=\mu_n+(1-P(E_n))\delta_0.$$

Adding an atom at zero changes neither the first moment nor the
nonatomic mass. Therefore

$$V(X)=\sum_n V(X|E_n). \tag{2}$$

Each coordinate of this series is nonnegative and summable. In particular,
the corresponding difference series for any $X,Y$ is absolutely
convergent. The argument permits arbitrary partitions depending on $X,Y$.

## Countable Sure-Thing and Sure-Thing

Suppose $X|E_n\succeq Y|E_n$ for every $n$. Write
$V(X|E_n)-V(Y|E_n)=(a_n,b_n)$. Lexicographic nonnegativity means
$a_n\geq0$, and $b_n\geq0$ whenever $a_n=0$.

If some $a_n>0$, then $\sum_n a_n>0$, giving $X\succ Y$ by (2).
Otherwise every $a_n=0$, every $b_n\geq0$, and (2) gives $X\succeq Y$.
If one local comparison is strict in this second case, some $b_n>0$,
so the global comparison is strict. This proves both clauses of
Countable Sure-Thing exactly as formulated using masked acts in the map.

For a two-cell partition, (2) gives
$V(X)=V(X|E)+V(X|E^c)$. If $X|E\sim Y|E$, their vectors agree, so
subtracting those equal vectors proves the biconditional in Sure-Thing.

## Simple EU, dominance and mixtures

Every simple law has nonatomic mass zero. Thus simple gambles are
compared exactly by their ordinary means. Sure outcomes have vector
$(x,0)$, and a Bernoulli gamble $M_p(1,0)$ has vector $(p,0)$.
The normalized utility chart is uniquely $u(x)=x$: its middle branch
forces $p=x$; its outer branches cannot calibrate an outcome in $[0,1]$
at a level outside $[0,1]$. The chart is measurable and order-preserving,
and satisfies the standing regularity contract. This proves Simple EU,
Restricted Totality and Restricted Stochastic Equivalence. Rich Outcomes
fails, since level $2$ is absent.

For $a>b>c$ in $[0,1]$, take $p=(b-c)/(a-c)$. Both the sure outcome
$b$ and $M_p(a,c)$ have vector $(b,0)$, proving Archimedean Outcomes.

Dependence only on the law proves Stochastic Equivalence. By (1), for
$0<p<1$,

$$V(M_p(X,Z))=pV(X)+(1-p)V(Z).$$

The difference between two mixtures with a common branch is therefore
$p(V(X)-V(Y))$. Positive multiplication preserves and reflects
lexicographic order, proving Mixture Independence.

Finally, weak stochastic dominance on $[0,1]$ gives $E[X]\geq E[Y]$
by the bounded tail-integral formula. If a tail inequality is strict at
one threshold, right continuity makes the mean inequality strict.
If no tail inequality is strict, the laws agree, so both coordinates
agree. Hence Stochastic Dominance, including its strict clause, holds.
It also yields Statewise Dominance.

## The two counterexamples

Let $U$ be uniform on $[0,1]$. Then

$$V(U)=(1/2,1),\qquad V(1/2)=(1/2,0).$$

Thus $U\succ1/2$ despite equal finite expectations. The unique normalized
chart is the identity, so choosing another chart cannot restore Expected
Utility. This refutes
[Countable Sure-Thing + Simple EU ⇒ Expected Utility](countable-sure-thing-simple-to-full-eu.html).

Also $1\succ U\succ0$. For every $p\in(0,1)$,

$$V(M_p(1,0))=(p,0)\ne(1/2,1)=V(U).$$

No such mixture is indifferent to $U$. This refutes
[Countable Sure-Thing + Archimedean Outcomes ⇒ Archimedean Gambles](countable-sure-thing-outcomes-to-gambles.html).

The bounded outcome space is permitted because neither proposed arrow
assumes Rich Outcomes. This is not a model of DU, which does require Rich
Outcomes. Under DU or DTU, the recorded St Petersburg obstruction makes
Countable Sure-Thing incompatible with the background; that is distinct
from a countermodel to either implication with empty background.

## Affine maps, transfer and simple differences

Write $c_X=c(\mathcal L(X))$. Any injective affine map preserves atoms
and their masses, so, whenever the transformed gamble stays in $[0,1]$,

$$V(aX+b)=(aE[X]+b,c_X)\qquad(a\ne0).$$

For $a>0$, this preserves and reflects lexicographic comparisons.
Thus **Positive Affine Invariance, Shift Invariance and Scale Invariance**
hold. **Shift Transfer** also holds: both of its mixtures have vector

$$\bigl(pE[X]+(1-p)E[Y]+b,\;pc_X+(1-p)c_Y\bigr).$$

For **Simple Relative Expectation**, suppose $X-Y$ has finite range.
Partition the space by its values $d$. On each cell, the subprobability
laws of $X$ and $Y$ are translates by $d$, so their nonatomic masses
agree. Summing over these cells using (1) gives $c_X=c_Y$.
Consequently $X\succeq Y$ iff $E[X-Y]\geq0$, as required.

**Negative Affine Anti-Invariance fails.** Take $X=U$, $Y=1/2$ and
the eligible map $x\mapsto1-x$. Both before and after transformation,
the uniform law strictly exceeds the sure half. In particular,
$X\succeq Y$ but $1-Y\not\succeq1-X$.

## Expectation rules and continuity

The same equal-mean pair $U\succ1/2$ refutes **Relative Expectation**,
**CDF-Area Extension** and **Folded Expectation**. Everything is bounded:
the relative difference is integrable; both CDF areas are finite and
equal; and the folded values are their ordinary means, both $1/2$.
In each case the axiom would require indifference.

**L¹ Continuity fails.** Let $X_n$ be sure $1/2+1/(n+3)$, let $X$ be
sure $1/2$, and put $Y=U$. Then

$$X_n\succ Y\quad\text{for all }n,\qquad
E|X_n-X|=\frac1{n+3}\longrightarrow0,$$

but $X\not\succeq Y$. Every gamble in this example is available.

## Uniqueness of negative self-similarity

Suppose $X\sim M_p(-aX+b,Z)$, with the transformed gamble available.
Equality of the two coordinates gives

$$E[X]=\frac{pb+(1-p)E[Z]}{1+pa},\qquad c_X=c_Z.$$

Here $a>0$ and $0<p<1$, so both divisions used to solve the equations
are valid. The same equations fix $V(Y)$ whenever
$Y\sim M_p(-aY+b,Z)$. Thus $X\sim Y$, proving
**Uniqueness of Negative Self-Similarity**. Existence of a solution is
not part of this principle.

## Sum principles

Let $U$ be uniform on $[0,1]$, and put $X=U/4$ and $Y=1/8$.
Then $X\succ Y$, since their vectors are $(1/8,1)$ and $(1/8,0)$.
The following choices of $Z$ give explicit failures. Every sum has
mean $1/4$ and lies in $[0,1/2]$.

| Dependence | Common summand $Z$ | $c_{X+Z}$ | $c_{Y+Z}$ | Comparison of sums |
| --- | --- | --- | --- | --- |
| Independent | $W/4$, with $W$ uniform and independent of $U$ | $1$ | $1$ | $X+Z\sim Y+Z$ |
| Comonotonic | $U/4$ | $1$ | $1$ | $X+Z\sim Y+Z$ |
| Antitonic | $(1-U)/4$ | $0$ | $1$ | $Y+Z\succ X+Z$ |

For the independent row, the sum of the two independent uniforms has
no atoms: condition on either summand to see that the probability of
each singleton is zero. The other nonatomic sums in the table are
nonconstant affine functions of a uniform variable. In the last row,
$X+Z$ is sure $1/4$.

The independent row violates the strict clause of **Independent Sum
Preservation**. It also violates **Independent Sum Cancellation**:
$Y+Z\succeq X+Z$ but $Y\not\succeq X$. Hence **Independent Sum
Invariance** fails. The other rows refute **Comonotonic** and
**Antitonic Sum Invariance**; a constant is eligible for either
dependence condition. These examples also refute **Full Sum Invariance**.

## No fixed copula works

In fact **Existential Copula Sum Invariance fails**, as does its
**Universal** counterpart. The same parameters work for every copula.

Fix any copula $C$ and realize $(U,W)$ with joint law $C$ on the standing
sample space. Take

$$X=U/4,\qquad Y=1/8,\qquad Z=W/4.$$

The pair $(X,Z)$ admits $C$ by positive rescaling. The pair $(Y,Z)$
also admits $C$: the CDF of the constant $Y$ is either zero or one,
and every copula satisfies $H_C(0,v)=0$ and $H_C(1,v)=v$.

As before $X\succ Y$, and both sums have mean $1/4$. But $Y+Z$ is
uniform on $[1/8,3/8]$, so

$$c_{Y+Z}=1\geq c_{X+Z}.$$

Therefore $Y+Z\succeq X+Z$ while $Y\not\succeq X$, contradicting
$\mathrm{SC}(C)$. This uses the comparison in the reversed order
$(Y,X)$, which the universal quantifier permits. Since $C$ was arbitrary,
no copula satisfies $\mathrm{SC}(C)$. No assumption about atoms of
$X+Z$, and no choice of parameters depending on $C$, is needed.

## Principles with trivial or empty scope here

The outcome chart is $[0,1]$. Numerical axioms concern only their stated
eligible gambles and transformations. This matters for the following
satisfactions.

- **Reflection Anti-Invariance** holds because $X$ and $-X$ can both
  take values in $[0,1]$ only if $X=0$. Every eligible comparison is
  between zero gambles. This does not imply negative affine
  anti-invariance: reflection about $1/2$ is available and fails as shown
  above, whereas the recorded reflection principle fixes the origin $0$.
- **Symmetric Gambles Are Neutral** holds because a nonnegative law
  symmetric about zero is concentrated at zero. Stochastic Equivalence
  then gives indifference to sure zero.
- **Alternating St Petersburg = −1/2**, **Pasadena = ln 2** and
  **Arroyo = ln 2** hold vacuously. Their prescribed distributions put
  positive mass outside $[0,1]$: already their first values are $-2$,
  $2$ and $2$, respectively. None is an available gamble. The first
  axiom's target outcome $-1/2$ is absent as well.
- **Continuity under Vanishing Shifts**, as currently defined in the
  map, holds vacuously. Its antecedent requires an available
  $X+\varepsilon\succeq Y$ for **every** $\varepsilon>0$.
  Taking $\varepsilon=2$ makes availability impossible. Requiring
  comparisons only for sufficiently small available shifts would be
  a different axiom and would fail here, as the $L^{1}$ example shows.
  The recorded principle and its quantifiers have not been changed.

Together with the earlier sections, this assigns every one of the map's
39 principles: **23 satisfied and 16 violated**, with none left unknown.
The full classification was supplied by GPT-6 (Codex) on 13 September
2026 following Goodsell's request to check the remaining relations.
The exact examples supplement the written proofs; no independent checker
or Lean proof is claimed.


## Relation to Russell and Isaacs

Russell and Isaacs, *Infinite Prospects* (2021), pass to discrete
lotteries in §4 and state their Equivalence Theorem in §5. Appendix A
defines lotteries as probability mass functions and preferences as total
preorders. The bridge from acts to lotteries uses conditional-law
dependence; see the author's April 2020 manuscript, pp. 15–16 and
footnotes 18–20, p. 22 and footnote 29, and Appendix A, pp. 25–26:
[author's manuscript](https://www.yoaavisaacs.com/uploads/6/9/2/0/69204575/infinite-prospects-final.pdf).

In this model, $c(\mathcal L(X))=0$ for **every countably supported**
lottery. Its restriction to that domain is ordinary bounded expected
utility and satisfies Archimedean Gambles. Only nonatomic laws introduce
the extra coordinate. Thus the countermodel does not contradict the
published discrete-lottery theorem; that theorem does not establish
these two arrows on the map's larger domain.

## Paper references

- **Related: [Infinite prospects](https://doi.org/10.1111/phpr.12704).** Russell, J. S., & Isaacs, Y. (2021). Infinite prospects. Philosophy and Phenomenological Research, 103(1), 178–198. — §§4–5, author manuscript pp. 15–16 and 22; Appendix A, pp. 25–26. Published theorem for countably supported lotteries. The new countermodel uses nonatomic laws, outside that domain.
