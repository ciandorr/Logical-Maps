# Clipped expectation: continuous ultrafilter dominance [−t, 2t]

**Direct source: Symmetries of Value.** Zachary Goodsell’s *Symmetries of
value*, Theorem 1 (p. 24), already states that DTU does not imply the affine
symmetry principles, including when L¹ Continuity and Relative Expectation
are added. Its reflection countermodel explicitly invokes *Decision theory
unbound*, Remark 3. Thus both the asymmetric construction and this stronger
non-implication belong to Goodsell; they are not new AI results.

The underlying continuous quotient appears in *Decision theory unbound*,
Appendix B, Definition 3, Lemma 6 and proof of Theorem 3 (pp. 691–692).
Remark 3 and Corollary 3 (pp. 692–693) supply separate increasing unbounded
cutoffs and symmetric gambles with arbitrary real values, including nonzero
ones.

**Original work: source-model specialization and additional verification.**
GPT-6 (Codex), 9 September 2026, chose the explicit cutoffs f(t)=2t, g(t)=t
and recorded the detailed proofs below. The added work is the displayed
CDF-area and shift-transfer verification, exact Cauchy and alternating-game
values, and negative-self-similarity witness. The L¹/Relative Expectation
non-implication is already stated in the source; its proof here is an explicit
verification, not a newly discovered separation. No literature-novelty claim,
independent checker or Lean verification is asserted.

## Construction and the DTU axioms

Take $O=\mathbb R$ with its usual order, Borel structure and identity utility,
and all measurable real random variables on the topic's fixed probability
space. Put

$$q_t(x)=\max(-t,\min(x,2t)),\qquad
v_X(t)=E[q_t(X)],\qquad t>0.$$

Fix an ultrafilter $\mathcal U$ on $(0,\infty)$ containing every tail
$(s,\infty)$. Define

$$X\succeq Y\quad\Longleftrightarrow\quad
\forall\varepsilon>0,\quad
\{t:v_X(t)-v_Y(t)\ge-\varepsilon\}\in\mathcal U.\tag{1}$$

Existence of this ultrafilter uses the usual ultrafilter lemma, as in the
source construction; this is a mathematical existence model, not an
implemented algorithm for arbitrary comparisons.

Reflexivity is immediate. For transitivity, intersect the two large sets
obtained with $\varepsilon/2$. If $X\not\succeq Y$, there is an
$\varepsilon>0$ such that $v_Y-v_X>\varepsilon$ on a large set.
Consequently $Y\succeq X$, proving **Totality**.

Equal laws have equal $v$-functions, so **Stochastic Equivalence** holds.
Constants and all values of each simple gamble eventually lie inside the
clipping window. Their comparisons are therefore exactly their ordinary
expectation comparisons. The normalized chart is the identity: the binary
calibration equations give the usual real values. This proves **Rich
Outcomes** and **Simple Expected Utility**, including all standing chart
conventions.

For the fixed randomized mixture, equality of its law with the mixture law
gives

$$v_{M_p(X,Z)}=p v_X+(1-p)v_Z.$$

Subtracting the corresponding expression with $Y$ and rescaling
$\varepsilon$ by $p>0$ proves the full **Mixture Independence** biconditional.

Write $S_X(s)=\Pr(X>s)$. The elementary clipped-tail identity gives

$$v_X(t)-v_Y(t)=\int_{-t}^{2t}(S_X(s)-S_Y(s))\,ds.\tag{2}$$

If $S_X\ge S_Y$ pointwise, this is nonnegative. If an inequality is strict
at a threshold, right continuity supplies an interval where the difference
is bounded below by a positive constant. All sufficiently large windows
contain that interval, giving a fixed strictly positive gap in (2). Thus
(1) preserves both weak and strict **Stochastic Dominance**. These
verifications establish the entire DTU package.

Two useful consequences of (1) will be used below. Adding a function tending
to zero to $v_X-v_Y$ does not change the comparison, by an
$\varepsilon/2$ argument. If $v_X-v_Y$ tends to a finite number $r$, the
comparison holds exactly when $r\ge0$; when the limit is zero both directions
hold. A limit of $+\infty$ or $-\infty$ yields the corresponding strict
comparison.

## Expectation, CDF area, and continuity

For integrable $X$, $q_t(X)\to X$ pointwise and $|q_t(X)|\le |X|$.
Dominated convergence gives $v_X(t)\to E[X]$. The preceding limit criterion
proves **Expected Utility**.

Clipping is 1-Lipschitz. Whenever $E|X-Y|<\infty$,

$$q_t(X)-q_t(Y)\longrightarrow X-Y,\qquad
|q_t(X)-q_t(Y)|\le |X-Y|.$$

Hence $v_X-v_Y\to E[X-Y]$, even when the individual expectations do not
exist. The limit criterion proves **Relative Expectation** for the variables'
actual coupling, without replacing that coupling by a more convenient one.

For **CDF-Area Extension**, put $d=S_X-S_Y$ and
$A_\pm=\int_{\mathbb R}d_\pm$. The nested windows $[-t,2t]$ exhaust
$\mathbb R$, so their positive and negative integrals tend monotonically to
$A_+$ and $A_-$. If at least one area is finite, (2) tends to their
well-defined difference in the extended reals. If both are finite and equal,
the limit is zero; if the positive area is larger, including the case of a
single positive infinity, the limit is positive; the reverse cases are
negative. Thus $X\succeq Y$ holds exactly when $A_+\ge A_-$ in every case
specified by the principle. Nothing here specifies the both-infinite pairs.

For **L¹ Continuity**, suppose $\delta_n=E|X_n-X|\to0$ and
$X_n\succeq Y$ for every $n$. The Lipschitz property gives

$$|v_{X_n}(t)-v_X(t)|\le\delta_n\quad\text{for every }t.$$

Fix $\varepsilon>0$, and choose $n$ with $\delta_n<\varepsilon/2$.
On a large set, $v_{X_n}-v_Y\ge-\varepsilon/2$, hence
$v_X-v_Y\ge-\varepsilon$. This is precisely (1) for $X\succeq Y$.
The proof verifies the topic's upper-section clause on the full domain,
including nonintegrable $X$ and $Y$.

## Shifts

For each fixed real $b$ and arbitrary $X$,

$$q_t(X+b)-q_t(X)\longrightarrow b,\qquad
|q_t(X+b)-q_t(X)|\le |b|.$$

Dominated convergence gives $v_{X+b}-v_X\to b$. Simultaneously shifting
$X,Y$ therefore changes their comparison function by a function tending to
zero. This proves **Shift Invariance**, in both directions.

For $0<p<1$, subtract the values of the two mixtures in **Transfer of a
Shift Across a Mixture**:

$$\begin{aligned}
&v_{M_p(X+b/p,Y)}-v_{M_p(X,Y+b/(1-p))}\\
&\qquad=p(v_{X+b/p}-v_X)
 -(1-p)(v_{Y+b/(1-p)}-v_Y)\longrightarrow b-b=0.
\end{aligned}$$

The mixtures are therefore indifferent. Neither shift conclusion has used
reflection symmetry or finite individual expectations.

## A symmetric Cauchy has positive value

Let $C_\sigma$ have the symmetric Cauchy density
$\sigma/[\pi(\sigma^2+x^2)]$, where $\sigma>0$. Such a variable is available
on the fixed atomless probability space. Direct integration over the window
and its two clipped tails gives

$$v_{C_\sigma}(t)=
\frac{\sigma}{2\pi}\log\frac{\sigma^2+4t^2}{\sigma^2+t^2}
+\frac{2t}{\pi}\arctan\frac{\sigma}{2t}
-\frac{t}{\pi}\arctan\frac{\sigma}{t}
\longrightarrow \frac{\sigma\log2}{\pi}.\tag{3}$$

Indeed the logarithmic term tends to $\sigma\log2/\pi$, while the last
two terms each tend in magnitude to $\sigma/\pi$ and cancel. Put
$k=\log2/\pi>0$. Equation (3) yields $C_1\sim k\succ0$.

This one comparison proves three failures:

- **Symmetric Gambles Are Neutral** fails: $C_1$ and $-C_1$ have the same
  law but $C_1\not\sim0$.
- **Reflection Anti-Invariance** fails: $C_1\succeq0$, whereas
  $0\not\succeq-C_1$. Its special case $a=1,b=0$ also directly refutes
  **Negative Affine Anti-Invariance**.
- **Folded Expectation** fails: both $C_1$ and zero have identically zero
  combined symmetric tail difference, so that principle would require
  them to be indifferent.

For **Uniqueness of Negative Self-Similarity**, take
$p=1/2$, $a=2$, $b=0$, and $Z=0$. The variables $-2C_1$ and $C_2$ have
the same law. By (3) and mixture linearity,

$$v_{M_{1/2}(-2C_1,0)}\longrightarrow\tfrac12(2k)=k,
\qquad C_1\sim M_{1/2}(-2C_1,0).$$

Zero also satisfies $0\sim M_{1/2}(-2\cdot0,0)$. The two fixed values
are distinct because $C_1\succ0$. This refutes precisely the recorded
uniqueness principle.

## Alternating St Petersburg is zero

Let $A$ take $(-2)^n$ with probability $2^{-n}$, $n\ge1$. Group consecutive
odd and even indices. Each pair has a negative outcome $-a$ of probability
$2r$ and positive outcome $2a$ of probability $r$, where $a,r>0$.
For every $t>0$,

$$q_t(-a)=-\min(a,t),\qquad q_t(2a)=2\min(a,t),$$

so the pair contributes exactly zero. Clipping makes the expectation
absolutely integrable, which licenses grouping the countably many pairs.
Thus $v_A(t)=0$ for every $t$, and $A\sim0$. In particular
**Alternating St Petersburg = −1/2** fails.

## Scope of the verification

This model establishes, among other separations, that DTU together with
CDF-Area Extension, Relative Expectation, L¹ Continuity, and both shift
principles still does not force symmetric neutrality or reflection. No
scale or sum-invariance verdict has been inferred from this construction.
The map can derive further failures from its separately proved
incompatibility records.

`checks/asymmetric_continuous_ultrafilter.py` checks the paired-atom
cancellations with exact rational arithmetic, finite-law clipped-tail and
mixture identities, the Lipschitz bound, and the explicit Cauchy limits.
Those checks are sanity checks of concrete calculations; the universal
properties and ultrafilter comparisons are proved analytically above.

## Paper references

- **Proof: [Symmetries of value](https://doi.org/10.1111/nous.12549).** Zachary Goodsell (2026). Symmetries of value. Noûs, 60, 16–37. — Theorem 1, p. 24. Already states the failure of affine-symmetry implications under DTU, including with L¹ Continuity and Relative Expectation, and cites Decision theory unbound, Remark 3, for the reflection countermodel
- **Background: [Decision theory unbound](https://doi.org/10.1111/nous.12473).** Zachary Goodsell (2024). Decision theory unbound. Noûs, 58, 669–695. First published online in 2023. — Appendix B, Definition 3, Lemma 6 and proof of Theorem 3, pp. 691–692; Remark 3 and Corollary 3, pp. 692–693. Source of the clipped-expectation ultrafilter, continuous quotient, and asymmetric-cutoff strategy, including the possibility of assigning nonzero values to symmetric gambles
