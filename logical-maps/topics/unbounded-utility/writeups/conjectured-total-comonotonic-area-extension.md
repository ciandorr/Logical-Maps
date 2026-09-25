# CDF-area: total comonotonic extension

**Conjectured model, not constructed:** a preorder satisfying DTU,
CDF-Area Extension, and Comonotonic Sum Invariance.

The precise proposed package is Rich Outcomes, Totality, Stochastic
Equivalence, Simple Expected Utility, Stochastic Dominance, Mixture
Independence, CDF-Area Extension, and Comonotonic Sum Invariance. The proposed
outcome space is $\mathbb R$ with identity utility. No reflection, neutral
symmetry, independent-sum, or continuity requirement is imposed.

## The starting model is already known

Goodsell's exact CDF-area preorder declares $X\succeq_RY$ when

$$\int(S_X-S_Y)_-<\infty,
\qquad \int(S_X-S_Y)_+\ge\int(S_X-S_Y)_-.$$

It satisfies DU and the proposed additional principles, but fails the
Totality axiom needed for DTU. In particular,
comonotonic invariance follows from the separate area identities

$$\int(S_X-S_Y)_\pm
  =\int_0^1(Q_X-Q_Y)_\pm,$$

and from adding the same increasing quantile $Q_Z$ to $Q_X,Q_Y$.
Both identities allow infinite areas. See the
[existing construction and verification](cdf-area-preorder.html).

The need for totality is real: pairs with both signed areas infinite remain
incomparable in this exact model, including a standard symmetric Cauchy
variable versus zero.

The discussion immediately before Theorem 7, p. 19, already identifies a
broader comonotonic consistency question as unsettled in the manuscript.
Theorem 7's partial answer uses the incomplete area relation. The present
entry specifies a total CDF-area extension as the target; it does not
attribute a proof or proposal of that exact package to the source.

## Why the existing total-extension proof does not answer this

The [total independent-sum extension](conjectured-total-independent-sum-extension.html)
uses linear convolution operators on differences of survival functions.
Positive sums of those operators are positive multiples of another
convolution operator. That property makes its orientation and saturation
argument work.

Comonotonic addition is instead translation in quantile coordinates:

$$(Q_X,Q_Y)\longmapsto(Q_X+Q_Z,Q_Y+Q_Z).$$

Its preservation for the seed area relation does not show preservation for
newly adjoined comparisons. Meanwhile Mixture Independence is conveniently
linear in survival coordinates and is not generally linear in quantiles.
Thus simply repeating the convolution proof with a different word for its
operators does not prove this candidate.

## What would settle the entry

A positive solution must complete the order while preserving every weak
and strict area comparison, full Mixture Independence, and both directions
of the comonotonic-sum comparison. A negative solution must give an explicit
incompatibility from the displayed package. Requiring only an arbitrary
total extension would not answer the question.

This candidate asks for a model of the comonotonic instance specifically.
The existing total independent-sum model already supplies a model of
Existential Copula Sum Invariance using the product copula, so the weaker
existential-copula consistency question is not being reopened here.

**Original work: precise candidate formulation and obstacle analysis.**
Goodsell's *Unbounded Utility and Background Risk* (unpublished), §3,
pp. 7–8, and the discussion before Theorem 7 and Theorem 7, pp. 19–20,
supply the area construction, comonotonic claim, and broader consistency
question. GPT-6 (Codex), 9 September 2026, formulated this precise
total-extension entry and recorded the gap. The candidate's direct source
is Misc.; the underlying construction remains attributed to Goodsell.
No new completed construction, literature novelty, independent check,
or Lean verification is claimed.

## A necessary condition: forced comparisons of both-infinite pairs

**Addition: Claude (Fable 5.1), 23 September 2026.** The conjecture is
unchanged; this section records constraints that any solution must meet,
the ideas tried, and the directions that remain. Statements are labelled
*proved*, *verified numerically* or *heuristic*. `checks/comonotonic_witnesses.py`
verifies the explicit example below.

### Coordinates

Under Stochastic Equivalence, Comonotonic Sum Invariance is the statement
that the order on laws is invariant under quantile addition: with
$X^\dagger=Q_X(U)$ for the standing uniform $U$ and $Z^\dagger=Q_Z(U)$,
$X\succeq Y$ iff $X^\dagger+Z^\dagger\succeq Y^\dagger+Z^\dagger$ for every $Z$.
*Proved (structural reduction):* with this invariance and transitivity,
$X\succeq Y$ depends only on $h=Q_X-Q_Y$; if $Q_X-Q_Y=Q_{X'}-Q_{Y'}$, add
$Q_{X'}$ to the first pair and $Q_X$ to the second, and the two right-hand
sides coincide. So the order is an additive cone $K$ in the vector space
$H$ of differences of nondecreasing functions on $(0,1)$, the *width*
function of the region between the two quantile graphs. In these
coordinates: dominance says $h\ge0$ gives $h\in K$, strictly when $h\ne0$;
Simple EU fixes $K$ on step functions by the sign of $\int h$; under
Totality $K$ is closed under positive rational scaling. Mixture Independence
is linear in the other coordinate, the survival difference $d=S_X-S_Y$
(mixing both sides with $Z$ replaces $d$ by $pd$), and under DU the order
also depends only on $d$. The two coordinate systems are related by the
nonlinear inverse-function map, and the area is the only functional
invariant in both: $\int_0^1 h_\pm\,du=\int_{\mathbb R}d_\pm\,dt$. A
comonotonic shear moves the slice of the region at level $u$ horizontally
by $Q_Z(u)$, nondecreasing in $u$, so it preserves the order of slices and
can only widen gaps between blocks; a mixture is $d\mapsto pd$ and
preserves the sign structure in $t$ exactly. The sign of the lowest slice of
the region is invariant under both operations.

### The killing lemma (proved)

Write $d=S_X-S_Y$ and, for a nondecreasing $Q_Z$ on $(0,1)$,
$d^{Z}=S_{X^\dagger+Z^\dagger}-S_{Y^\dagger+Z^\dagger}$.

**Lemma.** Assume Stochastic Equivalence, Stochastic Dominance, Mixture
Independence, and only the preservation half of Comonotonic Sum Invariance
($X\succeq Y\Rightarrow X+Z\succeq Y+Z$ for comonotonic pairs). If there are
nondecreasing $Q_{Z_1},\dots,Q_{Z_m}$ and weights $q_i>0$ with

$$d+\sum_i q_i\,d^{Z_i}\le0\ \text{everywhere and}\ \ne0,$$

then $X\succeq Y$ is false. Under Totality, $Y\succ X$.

*Proof.* Suppose $X\succeq Y$. Stochastic Equivalence gives
$X^\dagger\succeq Y^\dagger$, and preservation gives
$X^\dagger+Z_i^\dagger\succeq Y^\dagger+Z_i^\dagger$ for each $i$. Let
$W_X$ be the randomized mixture of $X^\dagger$ and the $X^\dagger+Z_i^\dagger$
with weights proportional to $(1,q_1,\dots,q_m)$, built from binary
mixtures, and $W_Y$ likewise. Replacing one component at a time, Mixture
Independence (with Stochastic Equivalence to swap the two arguments of a
binary mixture, which does not change the law) and transitivity give
$W_X\succeq W_Y$. But $S_{W_X}-S_{W_Y}$ is a positive multiple of
$d+\sum_i q_i d^{Z_i}$, which is $\le0$ and nonzero, so $W_Y$ strictly
stochastically dominates $W_X$ and $W_Y\succ W_X$. Contradiction. $\square$

A pair to which the lemma applies is called *killed*. Killing refutes one
orientation in every model of DU with comonotonic preservation; "not
killed" is not a consistency claim.

### An explicit killed pair with both areas infinite (verified numerically)

Let $c=1/3$. Partition $(0,1)$ into consecutive level intervals: $N_0$ of
length $c$, then for $k\ge1$ the pairs $P_k$, $N_k$, each of length
$c\,2^{-k}$ (total $3c=1$). Choose positions $a_j$ increasing along this
order with gaps growing geometrically (the check uses $100\cdot4^{j}$
between consecutive blocks) and widths $w=2/c$ on $N_0$ and $w=2^k/c$ on
$P_k$ and $N_k$. On a level interval labelled $P$ set $Q_Y=a_j$,
$Q_X=a_j+w$; on one labelled $N$ set $Q_X=a_j$, $Q_Y=a_j+w$. Both quantile
functions are nondecreasing step functions, and

$$d=+c2^{-k}\ \text{on the $t$-range of }P_k,\qquad
d=-c2^{-k}\ \text{on that of }N_k,\qquad d=-c\ \text{on that of }N_0,$$

and $0$ elsewhere. Every block has area $1$ except $N_0$ (area $2$), so
$\int d_+=\int d_-=\infty$: CDF-Area Extension imposes nothing on $(X,Y)$.

Take two step functions $Q_{Z_1},Q_{Z_2}$ constant on the same level
intervals: on $N_0$, $P_k$, $N_k$ the shift of $Q_{Z_1}$ moves $N_0$ onto
$P_1$, moves $P_k$ onto $N_k$, and moves $N_k$ onto the left half of
$P_{k+1}$; $Q_{Z_2}$ is the same except that $N_0$ moves to the empty space
just right of $P_1$ and $N_k$ moves onto the right half of $P_{k+1}$. Because
the gaps grow, both shift sequences are nondecreasing in level, so
$Q_{Z_1},Q_{Z_2}$ are nondecreasing and the sheared blocks stay disjoint.
The sheared profile $d^{Z_i}$ is the profile of the moved blocks with their
heights. Adding up,

$$d+\tfrac12\bigl(d^{Z_1}+d^{Z_2}\bigr)=
\begin{cases}-c&\text{on the range of }N_0,\\ -c/2&\text{where }Q_{Z_2}\text{ puts }N_0,\\ 0&\text{elsewhere:}\end{cases}$$

on $N_k$ the two moved copies of $P_k$ contribute $2\cdot\tfrac12 c2^{-k}$
against $-c2^{-k}$, and on each half of $P_{k+1}$ one moved copy of $N_k$
contributes $-\tfrac12 c2^{-k}=-c2^{-(k+1)}$ against $+c2^{-(k+1)}$. By the
lemma, no model of DU with comonotonic preservation has $X\succeq Y$, and
the total extension sought here must rank $Y\succ X$.

### Certificates that a pair is not killed (proved)

Call a region *top-infinite* when its positions are bounded below and its
infinite areas sit at levels $u\to1$, so that the prefix integrals
$B(v)=\int_0^v h\,du$ are finite for $v<1$.

1. *Prefix positivity.* If $B(v)\ge0$ for every $v<1$, the pair is not
   killed. For $\psi=1_{(-\infty,T]}$, $\int_{-\infty}^{T}d^{Z}\,dt=
   \int_0^1 h(u)\,\varphi_Z(u)\,du$ where $\varphi_Z(u)\in[0,1]$ is the
   fraction of the sheared slice at level $u$ lying left of $T$. Both
   endpoints of a slice are nondecreasing in $u$ and $(T-a)/(b-a)$ decreases
   in $a$ and in $b$, so $\varphi_Z$ is nonincreasing, and it vanishes near
   $u=1$ for finite $T$. The second mean value theorem gives
   $\int_{-\infty}^{T}d^{Z}\ge0$ for every $Z$ and $T$, whereas a killing
   sum is negative on some interval and so has a negative integral up to a
   large $T$. The mirrored pair $(Y,X)$ of the example above (prefix sums
   $2,1,2,1,\dots$) is therefore not killed; the lemma forces one
   orientation of that pair and leaves the other open.
2. *Lowest block positive.* If the region has a first block and it is
   positive (more generally $h\ge0$, $h\not\equiv0$ on an initial level
   interval, with a first block), the pair is not killed: the leftmost
   positive block among the original and all sheared copies can only be
   covered by a negative block that is preceded, within its own copy, by
   negative blocks alone, and every copy begins with a positive block.
3. *Divergent prefix sums.* If $B(v)\to+\infty$, then $\psi\equiv1$ is a
   certificate: $\int d^{Z}=+\infty$ for every $Z$, since the sheared blocks
   keep their level order.

### Worked block regions (verified numerically for the first two)

All blocks below have area $1$ unless bracketed; $P$ is positive, $N$
negative; regions are top-infinite unless stated.

- $R=(N_0[2],P_1,N_1,P_2,\dots)$: killed (above). $-R$: not killed (1).
- $R_2=(N_0,P_1[2],N_1[2],P_2[2],\dots)$, prefix sums $-1,+1,-1,+1,\dots$:
  killed with four copies of weight $\tfrac12$. The four copies of $N_0$
  cover $P_1$ (four slots); copies $A$ and $C$ put $P_k$ on the original
  $N_{k+1}$ ("roots"), copies $B$ and $D$ park $P_k$ on empty spots that
  $A$'s and $C$'s $N_{k+1}$ absorb, and $B$'s and $D$'s $N_{k+1}$ cover
  $P_{k+2}$. The sum vanishes except on the original $N_0$. $-R_2$ is not
  killed by (2). So for prefix-oscillating regions with a first block the
  sign of the lowest block decides, and the lemma forces it: the lowest
  block positive gives $X\succ Y$ under Totality.
- $R_3=(N_0,\text{ then positives only})$: not killed by (3); $-R_3$ not
  killed by (2). Neither orientation is forced by the lemma (the area rule
  would say $X\succ Y$).
- Doubly infinite alternating region $R_\infty$ (blocks accumulating at both
  ends, positions unbounded on both sides): the alternating shears give a
  sum that is identically $0$ in both orientations, so neither is killed.
  $R_\infty$ with one extra negative block at index $0$ is killed (the
  surplus block is left over). $R_\infty$ with one extra positive block: the
  same scheme balances to $0$ and the extra positive copies find no
  absorber; *heuristically* not killed.

### An accounting heuristic and what it suggests (heuristic)

Per index, with all blocks of area $1$ and copies of total weight $W$,
the sheared negative blocks (weight $W$) must cover the original positive
block (weight $1$) and absorb the copies' positive blocks (weight $W$),
minus what the original negative block absorbs (weight $1$): $W=1+W-1$,
tight at every index. Blocks moved to a different index cost a factor
$2^{|\delta|}$ in width or height, so index drift cannot pay a deficit.
A region therefore appears killable exactly when it carries a "negative
surplus" that this tight steady state can spend (the initial $N_0$ in $R$
and $R_2$, the extra negative block in $R_\infty$), and the surplus looks
like a well-defined invariant with a sign. If so, no pair is killed in both
orientations and the lemma alone cannot refute DTU + Comonotonic Sum
Invariance. This is a heuristic; a proof would need to define the surplus
for general regions and show it is invariant under both operations.

A duality caveat: single-functional certificates $\psi\ge0$ (with a limit
at $-\infty$ and integrable at $+\infty$) exist only for prefix-nonnegative
regions, because a killer can hide blocks at $+\infty$, where the local
average of $\psi$ tends to $0$, and pin a negative prefix at $-\infty$. But
hiding at $+\infty$ is a limit rather than a finite kill, so the cone of
killing sums is not closed and Farkas-type duality does not transfer:
$R_2$ shows that regions with a negative prefix can be killed, while the
extra-positive $R_\infty$ suggests some are not.

### What a solution must look like

Every both-infinite pair must be oriented, and the lemma already forces the
orientation of many of them, including all shears, mixtures and width-sums
of $R$ and $R_2$. The forced verdicts agree with "the lowest block decides"
for top-infinite regions with a first block, and with the mirror rule
(highest block decides) for bottom-infinite ones. Areas cannot see these
pairs; Banach limits of clipped areas fail, since every clipped-expectation
model in this topic violates Comonotonic Sum Invariance (see the write-ups
of those models, same date); probability-trimmed means
$\int_\varepsilon^{1-\varepsilon}Q$ are comonotonic invariant but not
mixture-linear. A candidate is a lexicographic rule: the area when it is
defined, else a functional of the conditionally summed block areas in
level order (invariant under shears, which preserve level order, and under
mixtures, which preserve the $t$-order of blocks), completed by Zorn's
lemma over cones closed under both additive structures with the killing
lemma as the pointedness test. Regions with no first block (an oscillating
lowest part with bounded positions) are where neither certificate applies
and where a double kill, hence a refutation, would have to be sought.

The same lemma is the tool for the copula questions about prospect
evaluations: under DU with the comonotonic copula, Alternating St Petersburg
$=-\tfrac12$ is the orientation of the both-infinite region of
$(A^\dagger,-\tfrac12)$, so the first test is whether that region, or its
mirror, is killed.
