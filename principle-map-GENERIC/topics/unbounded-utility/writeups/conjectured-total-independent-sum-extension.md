# CDF-area conclosure: total extension

**Status: proved by the argument below.** This is a nonconstructive existence
model, using Zorn’s lemma. The mathematical proposal and base construction
come from Zachary Goodsell, *Unbounded Utility and Background Risk*
**(unpublished)**, 5 June 2026, §§3–4, pp. 7–14, and Goodsell’s project
requests of 9 September 2026. The supplied manuscript is marked “do not cite”
and erroneous in its symmetry-extension claim.

**Attribution:** the CDF-area construction, conclosure operation, and
strategy of extending the ordering to totality are Zachary Goodsell’s. The
model’s direct source is *Unbounded Utility and Background Risk (unpublished)*.
GPT-6 (Codex), 9 September 2026, supplied the cone-language exposition and
additional details for strictness preservation and the extension step below.
“Convolution saturation” here is an explicit description of Goodsell’s
conclosure, not a separately originated construction. These additional proof
details are not claimed to appear verbatim in the manuscript. The erroneous
symmetry-extension argument is not used.

No independent checker or Lean verification is claimed. The stable record ID
retains its original `conjectured-` prefix; the status and displayed name have
been updated.

## Existence claim

There exists a total preorder on all real-valued random variables that:

- extends the CDF-area preorder, preserving every weak and strict comparison;
- satisfies Stochastic Equivalence, Expected Utility, Relative Expectation,
  and Stochastic Dominance;
- satisfies Mixture Independence and Independent Sum Invariance, including
  cancellation of an arbitrary independent common summand.

Real outcomes with identity utility supply Rich Outcomes, Archimedean
Outcomes, and the normalized chart. Neither Symmetric Neutrality nor
Reflection Anti-Invariance is required by this construction. Their failure
is not inferred merely from their omission.

## 1. Linear space and convolution operators

Let $V$ be the real vector space of survival functions of finite signed Borel
measures on $\mathbb R$ of total mass zero, identified almost everywhere.
In particular $S_X-S_Y\in V$ for all real-valued random variables. Every
nonzero signed measure of total mass zero is a positive scalar multiple of a
difference of probability measures, by its Jordan decomposition.

For each probability law $\xi$, write

$$T_\xi v(t)=\int v(t-z)\,d\xi(z).$$

These linear operators map $V$ into $V$. They commute,
$T_\xi T_\eta=T_{\xi*\eta}$, include the identity $T_{\delta_0}$, and obey

$$aT_\xi+bT_\eta=(a+b)T_{(a\xi+b\eta)/(a+b)}\quad(a,b\ge0,\ a+b>0).$$

This last identity says that a positive combination of convolution operators
is a positive scalar times another convolution operator. It is essential to
the orientation argument. No reflection operator is included.

For an additive cone $A\subseteq V$, closed under multiplication by
nonnegative real scalars, write

$$L_A=A\cap(-A),\qquad A^{\mathrm{str}}=A\setminus(-A).$$

These are its indifferent and strictly positive parts. An extension preserves
strict comparisons when it does not acquire the negative of an old strictly
positive vector.

## 2. The area cone preserves strictness under forward convolution

Define

$$C=\{v\in V:\ \int v_-<\infty,\quad \int v_+\ge\int v_-\}.$$

This is an additive cone: negative parts satisfy
$(v+w)_-\le v_-+w_-$, and integration is additive for signed functions with
integrable negative part, allowing a positive-infinite result. Its lineality
space is $L_C=\{v\in L^1:\int v=0\}$.

For every $\xi$, both $T_\xi C\subseteq C$ and
$T_\xi C^{\mathrm{str}}\subseteq C^{\mathrm{str}}$. Indeed, if $v\in C$,
then $(T_\xi v)_-\le T_\xi(v_-)$ has finite integral. Tonelli preserves the
integrals of the separately convolved positive and negative terms. Since the
negative term is integrable, the signed integral of $T_\xi v$ equals that of
$v$, whether finite or positive infinite. A positive integral stays positive;
a zero integral stays zero. See also the
[base-model proof](cdf-area-preorder.html).

This establishes only forward preservation for $C$. We do not assume that
$T_\xi v\in C$ implies $v\in C$.

## 3. Conclosure supplies cancellation safely

For any cone $A$ preserved forward, weakly and strictly, by every $T_\xi$,
express its conclosure (convolution saturation) by

$$\operatorname{Sat}(A)=\{v:\text{for some probability law }\xi,
\ T_\xi v\in A\}.$$

This is a cone containing $A$. If $T_\xi v\in A$ and $T_\eta w\in A$,
then

$$T_{\xi*\eta}(v+w)=T_\eta(T_\xi v)+T_\xi(T_\eta w)\in A,$$

which proves closure under addition; scalar closure is immediate. Moreover,
for every probability law $\rho$,

$$v\in\operatorname{Sat}(A)\quad\Longleftrightarrow\quad
T_\rho v\in\operatorname{Sat}(A).$$

For the forward direction convolve an existing witness by $\rho$. For the
reverse direction compose $\rho$ with the witness for $T_\rho v$.

This is the **least** fully convolution-invariant cone containing $A$:
if $D$ is any such cone and $T_\xi v\in A$, then $T_\xi v\in D$, so
cancellation in $D$ forces $v\in D$. Thus $\operatorname{Sat}(A)\subseteq D$.
Mixture closure is already encoded by the cone structure. This identifies
the operation with Goodsell’s conclosure in these coordinates.

Crucially, saturation preserves every strict comparison of $A$. If
$v\in A^{\mathrm{str}}$ but $-v\in\operatorname{Sat}(A)$, some $\xi$
would give $-T_\xi v\in A$. Forward strict preservation gives
$T_\xi v\in A^{\mathrm{str}}$, a contradiction.

Thus $D_0=\operatorname{Sat}(C)$ extends the area cone without losing
strictness and satisfies full convolution cancellation. The resulting
membership equivalence also makes every convolution preserve its strict
comparisons: apply it to both $v$ and $-v$.

## 4. Orienting an incomparable vector

Let $D$ be any cone satisfying
$v\in D\iff T_\xi v\in D$ for every $\xi$. Suppose that neither $v$ nor
$-v$ belongs to $D$. Then no $T_\xi v$ belongs to $D$ or $-D$ either.

Adjoin $v$ and all its forward transforms by setting

$$K=\{d+aT_\xi v:\ d\in D,\ a\ge0,\ \xi\text{ a probability law}\}.$$

The positive-combination identity from §1 proves that $K$ is a cone;
commutation and forward invariance of $D$ prove forward invariance of $K$.

**No old strict comparison collapses.** In fact $K\cap(-K)=L_D$. To see
this, if $k=d_1+aT_\xi v$ and $-k=d_2+bT_\eta v$, then

$$0=d_1+d_2+(a+b)T_\theta v$$

for a probability law $\theta$ when $a+b>0$. This would imply
$-T_\theta v\in D$, hence $-v\in D$, contrary to incomparability.
Consequently $a=b=0$ and $k\in L_D$. The reverse inclusion is immediate.

**Forward convolution preserves strictness in $K$.** Suppose
$x=d+aT_\xi v\in K$ and $T_\rho x\in L_D$. If $a>0$, then

$$-aT_{\rho*\xi}v=T_\rho d-T_\rho x\in D,$$

which again implies $-v\in D$, impossible. If $a=0$, the two memberships
$T_\rho d\in D$ and $-T_\rho d\in D$, together with cancellation in $D$,
imply $d\in L_D$. Thus a strictly positive element of $K$ cannot become
indifferent after convolution, since the indifferent part of $K$ is exactly
$L_D$.

We can therefore apply §3 to $K$. The cone
$D'=\operatorname{Sat}(K)$ is fully convolution invariant, contains $D$ and
$v$, and preserves all strict comparisons of $D$. It is a proper extension
of $D$. This establishes the orientation step for the genuine closure,
rather than for a chain description that omits cancellation.

## 5. Maximal extension and totality

Consider the set of cones $D$ containing $D_0$, fully convolution invariant,
and satisfying

$$D\cap(-C^{\mathrm{str}})=\varnothing.$$

It is nonempty by §3. The union of any increasing chain is again such a cone:
closure and convolution membership equivalence involve only finitely many
memberships, and none of its members can contain a forbidden vector. Zorn’s
lemma therefore supplies a maximal member $D_*$.

If some $v$ belonged to neither $D_*$ nor $-D_*$, §4 would give a proper
extension preserving all its strict comparisons, hence still avoiding
$-C^{\mathrm{str}}$. That contradicts maximality. Therefore

$$D_*\cup(-D_*)=V.$$

Define preferences on the original random variables by

$$X\succeq_*Y\quad\Longleftrightarrow\quad S_X-S_Y\in D_*.$$

Cone closure gives reflexivity and transitivity; the displayed coverage gives
totality. Membership depends only on laws, so Stochastic Equivalence holds.
Containment of $C$ and avoidance of $-C^{\mathrm{str}}$ preserve every weak
and strict area comparison, exactly as required by CDF-Area Extension.

Mixing both laws with a common law multiplies their survival difference by
$p>0$. Cone membership is equivalent under positive scalar multiplication,
proving Mixture Independence in both directions. Adding a common independent
summand applies $T_\xi$ to that difference. The defining invariance of $D_*$
proves Independent Sum Invariance in both directions.

Expected Utility, Relative Expectation, and Stochastic Dominance follow from
CDF-Area Extension by the recorded implications. All required comparisons
of sure outcomes and finite gambles therefore agree with the identity chart.

## Scope and known failures

This proves the previously proposed existence package, including convolution
invariance, without either reflection requirement. It does not establish
convolution cancellation for the **exact incomplete area preorder** itself:
its saturation can add comparisons. Nor does it show that arbitrary total
extensions inherit any invariance automatically.

Full Sum Invariance and Antitonic Sum Invariance fail by the recorded
Rich-Outcomes-plus-Dominance witnesses. Countable Sure-Thing and Archimedean
Gambles fail by the existing DU consequences. These explain the model’s
`violates` entries. No further symmetry or comonotonic-sum properties are
asserted for the chosen maximal cone.

The author’s withdrawn **symmetric** consistency claim remains withdrawn.
The separate [stable-law incompatibility candidate and source audit](symmetric-dtu-refutes-independent-sum-candidate.html)
still lack an exact verified stable-law witness; that is not needed for this
positive existence construction.
