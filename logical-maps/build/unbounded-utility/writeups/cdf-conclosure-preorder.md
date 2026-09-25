# CDF-area conclosure

This model satisfies **DU**, together with
CDF-Area Extension, Independent Sum Invariance, Positive Affine Invariance,
and Reflection Anti-Invariance. It fails Totality and Symmetric Gambles Are
Neutral. Since DTU is DU plus Totality, this is a DU model but not a DTU
model. Thus reflection anti-invariance remains compatible with independent
sums when completeness is dropped.

**Original work: construction-stage extraction and model adaptation/property
audit.** The CDF-area seed and conclosure construction belong to Zachary
Goodsell, *Unbounded Utility and Background Risk* **(unpublished)**,
5 June 2026, sections 3–4, pp. 7–14. The supplied manuscript is marked
“do not cite” and erroneous in its symmetric total-extension claim; this
record does not reinstate that claim. This intermediate stage already appears
in the [recorded total-extension proof](conjectured-total-independent-sum-extension.html).
GPT-6 (Codex), 9 September 2026, supplied the separate model record,
the conjugation checks for its affine/reflection symmetries, and the deduction
of incompleteness from the completed Goodsell stable-law obstruction.
Conclosure is not presented as an independently invented AI construction,
and no literature-novelty claim is made. No independent checker or Lean
verification is claimed.

## Construction and area preservation

Use real outcomes and identity utility. Let $V$ be the vector space of
survival functions of finite signed Borel measures of total mass zero,
identified almost everywhere. Each $S_X-S_Y$ belongs to $V$. Define

$$C=\left\{v\in V:\int v_-<\infty,\quad
                     \int v_+\geq\int v_-\right\},$$

and, for probability laws $\xi$,

$$T_\xi v(t)=\int v(t-z)\,d\xi(z),\qquad
 D=\operatorname{Sat}(C)=\{v:\exists\xi,\ T_\xi v\in C\}.$$

Then set $X\succeq_DY$ precisely when $S_X-S_Y\in D$. This is Goodsell's
conclosure of the area relation before taking any maximal total extension.

Here are the closure details, also recorded in sections 1–3 of the
[total-extension construction](conjectured-total-independent-sum-extension.html).

1. $C$ is a cone, and forward convolution preserves all of its weak and
   strict comparisons. Indeed $(T_\xi v)_-\leq T_\xi(v_-)$; Tonelli
   preserves the integrals of the separately convolved positive and negative
   parts. When the negative part is integrable, the signed integral is
   preserved, including a possible positive-infinite value.
2. If $T_\xi v,T_\eta w\in C$, then
   $T_{\xi*\eta}(v+w)=T_\eta T_\xi v+T_\xi T_\eta w\in C$.
   Together with positive scalar closure, this makes $D$ a cone containing
   $C$; hence it induces a reflexive transitive relation.
3. For every $\rho$, $v\in D$ iff $T_\rho v\in D$. In the forward
   direction, convolve an existing witness by $\rho$ and use commutation.
   In the reverse direction, compose $\rho$ with a witnessing convolution.
4. If $v\in C\setminus(-C)$ but $-v\in D$, some $\xi$ would give
   $-T_\xi v\in C$. Forward strict preservation simultaneously gives
   $T_\xi v\in C\setminus(-C)$, a contradiction. Thus $D$ preserves
   every strict area comparison, as well as every weak one.

Consequently the model satisfies CDF-Area Extension. Expected Utility,
Simple EU, Relative Expectation, and Stochastic Dominance follow by the
recorded area arguments. Its sure-outcome chart is the identity, so Rich
Outcomes and Archimedean Outcomes hold. Preferences depend only on laws,
so Stochastic Equivalence holds.

Mixtures with a common law multiply the survival difference by $p>0$.
Cone membership is equivalent under positive scalar multiplication, proving
Mixture Independence. Independent common summands apply $T_\xi$ to the
survival difference. Property 3 proves Independent Sum Invariance, including
cancellation and hence both weak and strict forward preservation.

## The inherited outcome symmetries

For reflection and reversal of the compared pair, the new survival difference
is $Rv(t)=v(-t)$ almost everywhere. Both areas of $v$ are unchanged under
$R$, so $RC=C$. If $\check\xi$ is the reflected law, then

$$R T_\xi = T_{\check\xi}R.$$

Reflecting a witness for $v\in D$ therefore supplies a witness for $Rv\in D$.
Applying reflection twice gives the converse. As $Rv$ is the survival
difference for $-Y$ versus $-X$ when $v=S_X-S_Y$, this is exactly
Reflection Anti-Invariance:

$$X\succeq_DY\quad\Longleftrightarrow\quad -Y\succeq_D-X.$$

For $a>0$ and $b\in\mathbb R$, put $A_{a,b}v(t)=v((t-b)/a)$.
The two areas are each multiplied by $a$, so $A_{a,b}C=C$. If $a\xi$
denotes the pushforward of $\xi$ by $z\mapsto az$, then

$$A_{a,b}T_\xi=T_{a\xi}A_{a,b}.$$

Thus a witness for $v\in D$ supplies one for $A_{a,b}v\in D$.
Using the inverse affine transformation proves the converse, establishing
Positive Affine Invariance. The kernel is scaled by $a$; it is not also
translated by $b$, since $b$ already translates the compared gambles.

## Why the model is incomplete

The [completed Lévy obstruction](levy-refutes-neutral-independent-preservation.html)
shows that Rich Outcomes, Stochastic Dominance, Mixture Independence, and
Independent Sum Preservation cannot coexist with Symmetric Gambles Are
Neutral. The model has all four antecedent properties, so it fails the
neutrality principle.

The obstruction gives concrete candidate witnesses: for independent positive
Lévy variables $L_1,L_2$ and an independent fair sign $\varepsilon$, at
least one of

$$W=\varepsilon L_1\qquad\text{and}\qquad D_0=L_2-L_1$$

is not indifferent to zero in this model. Both have symmetric laws. We do
not claim to determine which candidate the existential convolution test
leaves undecided.

For any symmetric-law variable $X$, Stochastic Equivalence gives $X\sim-X$.
If $X\succeq_D0$, reflection gives $0\succeq_D-X$, hence $0\succeq_DX$.
If $0\succeq_DX$, the reversed argument gives $X\succeq_D0$. Thus a
symmetric variable comparable with zero must be indifferent to zero.
The nonneutral candidate above is therefore **incomparable** with zero,
proving failure of Totality. This also explains why the symmetry inherited
by this incomplete model does not contradict the new impossibility result.

The construction quantifies over arbitrary probability laws, so this is an
existence model rather than an executable ranking algorithm. Its listed
check, `checks/levy_obstruction.py`, only verifies finite numerical
diagnostics for the analytic witness used to establish these failures.
Comonotonic Sum Invariance and other unproved properties are left open;
they are not inherited automatically merely because they hold in the
unsaturated area preorder.

## Partial self-similarity analysis

**Added 25 September 2026; the self-similarity verdict remains open.**
DeepSeek (`deepseek-flash`) proposed this line of analysis in the theorem
trawl. GPT-6 (Codex) checked the following restricted claims, supplied the
explicit lower-tail bound, and removed the draft's unsupported universal
conclusion. This review concerns the addition, not a new audit of the
original construction, and supplies no Lean verification.

Let $A$ be alternating St Petersburg and $c=-1/2$. As verified for the
[exact area model](cdf-area-preorder.html), both satisfy
$V\sim F(V)$ with $F(V)=M_{1/2}(-2V,-2)$; those comparisons also hold in
this conclosure. Negative Affine Anti-Invariance (from the two inherited
symmetries) and Mixture Independence imply

$$X\succ Y\quad\Longrightarrow\quad F(Y)\succ F(X).$$

If two fixed points were strictly ordered, substituting their indifferences
would give the opposite strict order, contradicting transitivity. Thus two
fixed points are either indifferent or incomparable. In particular, with
$E=S_A-S_c$,

$$A\sim_Dc\quad\Longleftrightarrow\quad
 E\in D\cap(-D)\quad\Longleftrightarrow\quad E\in D.$$

The last equivalence uses the impossibility of a strict comparison for
this pair. By the definition of conclosure, deciding it amounts to deciding
whether some probability law $\xi$ satisfies $T_\xi E\in C$. If $Z$ has
law $\xi$ and is independent of $A$, then

$$T_\xi E=S_{A+Z}-S_{Z-1/2}.$$

Both requirements of the cone remain necessary: the negative part must
have finite integral, and its integral must not exceed the positive area.

### Kernels with a light lower tail cannot work

Suppose $\Pr(Z\le-t)=o(1/t)$ as $t\to\infty$. Choose $M\ge0$ with
$q=\Pr(Z\le M)>0$. For $t\ge2$, choose the smallest negative-atom
magnitude $b=2^{2k+1}\ge t$. It satisfies $b<4t$, so

$$\Pr(A\le-t)\ge\Pr(A=-b)=1/b\ge1/(4t).$$

Independence therefore gives, for sufficiently large $u\ge M$,

$$\Pr(A+Z\le-u)\ge q\Pr(A\le-u-M)
  \ge\frac{q}{4(u+M)}\ge\frac{q}{8u}.$$

Writing $h=T_\xi E$, we have

$$-h(-u)=\Pr(A+Z\le-u)-\Pr(Z\le-u+1/2)
  \ge\frac{q}{16u}$$

for all sufficiently large $u$, because the second probability is
$o(1/u)$. Hence $\int h_-=\infty$ and this kernel cannot witness
$E\in D$. This includes constants, kernels bounded below, and kernels
with finite expected negative part. It does not exhaust arbitrary
probability laws or impose a power-law form on the remaining kernels.

Finding a successful kernel would settle **this pair's** indifference
and, by Stochastic Equivalence, the alternating St Petersburg evaluation
in this model. It would not prove either universal self-similarity axiom
or the Pasadena evaluation. Conversely, excluding every kernel would make
this pair a counterexample to both self-similarity axioms. Neither of those
global conclusions has been established; no model-property flag is added.

The original proposal and its unfinished long response remain in quarantine,
under `checkpoint-4efdb29afea94da583b8df9975e053e4` and
`unfinished/trawl-8b97ab5120b042c4811b0d9f70fe0695.md`. They are not proofs
of the remaining question. The YAML certificate retains the actual
DeepSeek discovery metadata and the separately dated, scoped GPT-6 review
and local admission record.

## Paper references

- **Proof: Unbounded Utility and Background Risk.** Zachary Goodsell (5 June 2026). Unbounded Utility and Background Risk. Unpublished working manuscript. — sections 3-4, pages 7-14: CDF-area construction and conclosure. Supplied manuscript marked do not cite and erroneous in its symmetric total-extension claim
