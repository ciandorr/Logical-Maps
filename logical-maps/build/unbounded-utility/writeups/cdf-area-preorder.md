# CDF-area dominance

This is a model of **DU**, but not **DTU**, because Totality fails.

It is also the **least DU preorder with L¹ Continuity**, equivalently with
Continuity under Vanishing Shifts. The continuity verification below and
the new [DU continuity theorem](du-vanishing-shifts-imply-relative.html)
establish this: every such ordering preserves all of this model's weak
and strict comparisons. Extensions can add comparisons for pairs with
both signed areas infinite.

**Source:** Zachary Goodsell, *Unbounded Utility and Background Risk*, 5 June
2026, §3 (pp. 7–8) and Theorem 7 (pp. 19–20). The supplied manuscript is
**unpublished, marked “do not cite”, and erroneous**. This local provenance
record does not endorse its withdrawn consistency theorem. The construction
is Goodsell’s; the explicit area, Tonelli, and counterexample details below
were recorded by GPT-6 (Codex), 9 September 2026. No separate checker or Lean
verification is claimed.

## Construction

Take all real-valued random variables, with real outcomes and identity utility.
Let $S_X(t)=\Pr(X>t)$ and put

$$d=S_X-S_Y,\qquad A_+=\int_{\mathbb R}d_+(t)\,dt,
\qquad A_-=\int_{\mathbb R}d_-(t)\,dt.$$

Define

$$X\succeq_R Y\quad\Longleftrightarrow\quad
A_-<\infty\ \text{and}\ A_+\ge A_-.$$

Thus both finite equal areas give indifference; one infinite area gives a
strict comparison in the appropriate direction; two infinite areas give
incomparability. Never evaluate $\infty-\infty$. The draft uses survival CDFs
with a different endpoint convention, which has no effect on the integrals.

## Preorder, expectation, and symmetry

Reflexivity is immediate. For transitivity write
$d_{XZ}=d_{XY}+d_{YZ}$. If the two component comparisons hold, their negative
parts are integrable. So is the negative part of their sum, since
$(a+b)_-\le a_-+b_-$. Signed integration is additive when negative parts are
integrable, including a possible positive infinity. Both component integrals
are nonnegative, so the sum comparison holds.

The relation depends only on laws. For integrable $X,Y$, both areas are finite
and $A_+-A_-=E[X]-E[Y]$. This verifies Expected Utility, hence the identity
chart, Simple EU, and Archimedean Outcomes; Rich Outcomes is explicit in the
model. More generally, if $E|X-Y|<\infty$ in the actual coupling, then

$$\int|S_X-S_Y|\le E|X-Y|,\qquad
\int(S_X-S_Y)=E[X-Y],$$

by the indicator formula and Fubini. This verifies Relative Expectation even
when the individual expectations are undefined.

Stochastic dominance gives $d\ge0$. Strict dominance gives a positive area:
strict inequality at a threshold persists on an interval by one-sided
continuity. Hence the relation preserves both weak and strict dominance.

Mixing both gambles with a common third law multiplies $d$ by the positive
mixture weight. It multiplies both areas by that weight, proving the full
Mixture Independence biconditional, including cases with infinite areas.

For $a>0$, replacing $X,Y$ by $aX+b,aY+b$ multiplies both areas by $a$.
Thus Positive Affine Invariance holds. Reflection and reversal give
$d_{-Y,-X}(t)=d_{X,Y}(-t)$ almost everywhere, leaving each area unchanged.
Thus Reflection Anti-Invariance holds as well. The minus sign in the draft’s
equation (16) is a substitution error; Lebesgue integration under $t\mapsto-t$
does not negate the integral.

## Comonotonic Sum Invariance

Let $Q_X,Q_Y$ be increasing quantiles. Tonelli applied to the regions between
the two graphs gives the *separate*, nonnegative area identities

$$A_+=\int_0^1(Q_X(u)-Q_Y(u))_+\,du,\qquad
A_-=\int_0^1(Q_Y(u)-Q_X(u))_+\,du.$$

These identities include infinite areas. For example, the first counts the
region where $Q_Y(u)\le t<Q_X(u)$, either by horizontal or vertical sections.
Monotonicity makes the length of its section at $t$ equal to
$(S_X(t)-S_Y(t))_+$, up to irrelevant endpoint conventions.

A comonotonic sum has quantile $Q_X+Q_Z$ almost everywhere. Adding $Q_Z$ to
both quantiles leaves their difference, and therefore **both** areas,
unchanged. This proves the biconditional on the entire domain. It supplies
the missing infinite-area justification in the manuscript’s informal
“rotate the CDF” argument in Theorem 7.

## Independent sums: the forward result

For an independent common summand with law $\xi$, the new survival difference
is $h=d*\xi$. Suppose $X\succeq_R Y$, so $g=d_-$ is integrable. Set $f=d_+$.
Then $h=f*\xi-g*\xi$ and

$$h_-\le g*\xi,\qquad \int(g*\xi)=\int g<\infty.$$

Tonelli gives $\int(f*\xi)=\int f$, possibly infinite. Since the negative
term is integrable, the signed integral of $h$ equals the original signed
integral of $d$, with the same finite or positive-infinite value. Therefore
weak **and strict** comparisons are preserved.

This does **not** establish the reverse implication. The printed proof
identifies $f*\xi,g*\xi$ with $h_+,h_-$, which is unjustified: the two
convolutions can overlap and cancel. For a simple example, let $X$ be equally
likely $-1$ or $1$, let $Y=0$, and let $\xi$ be equally likely $0$ or $1$.
Originally both areas are $1/2$; after convolution both are $1/4$. Tonelli
still preserves the integrals of the separately convolved $f$ and $g$.
This demonstrates the false identification; it is **not** a counterexample
to convolution invariance itself. Independent Sum Cancellation, and hence
full Independent Sum Invariance, remain unasserted for this exact model.
A [total extension satisfying Independent Sum Invariance](conjectured-total-independent-sum-extension.html)
is now proved separately: saturating the area cone first supplies
cancellation while preserving its strict comparisons, after which an
invariant maximal-cone argument supplies totality.

## L¹ Continuity

**Additional proof: GPT-6 (Codex), 9 September 2026.** The exact area preorder
satisfies the recorded upper-section L¹ Continuity axiom. This is an elementary
closure argument for Goodsell's construction, not a claim that the manuscript
states or proves this additional property.

Suppose $X_n\succeq_R Y$ for every $n$ and
$\delta_n=E|X_n-X|\to0$. Write

$$d=S_X-S_Y,\qquad d_n=S_{X_n}-S_Y=d+e_n,
\qquad e_n=S_{X_n}-S_X.$$

For all sufficiently large $n$, $\delta_n$ is finite. The pointwise indicator
identity and Tonelli give

$$\int_{\mathbb R}|e_n(t)|\,dt
\le E\int_{\mathbb R}
 |\mathbf1_{\{X_n>t\}}-\mathbf1_{\{X>t\}}|\,dt
=E|X_n-X|=\delta_n. \tag{1}$$

The assumed comparison gives $\int(d_n)_-<\infty$ and a nonnegative
signed integral of $d_n$. Choose one sufficiently large index. Since

$$d_-\le(d_n)_-+|e_n|,$$

we obtain $\int d_-<\infty$. If $\int d_+=\infty$, the area rule already
gives $X\succeq_RY$. Otherwise $d$ is integrable. Equation (1) then makes
every sufficiently late $d_n$ integrable too, and

$$\int d=\int d_n-\int e_n\ge-\|e_n\|_1\ge-\delta_n.$$

Taking $n\to\infty$ gives $\int d\ge0$, again proving $X\succeq_RY$.
No subtraction of infinite areas occurs: the case of infinite positive area
was settled separately after negative-area integrability was established.

The same argument applies when $Y_n\to Y$ in L¹ with $X$ fixed, and even
when both arguments converge in L¹, since the change in survival difference
has L¹ norm at most $E|X_n-X|+E|Y_n-Y|$. Only the upper-section property is
recorded as a principle in this model. No Totality or symmetry assumption is
used in this closure proof. Original work consists of this short verification;
the CDF-area construction remains attributed to Goodsell.

## Verified failures

For a standard symmetric Cauchy variable $C$, comparison with zero has two
infinite areas: on each side the absolute area is the corresponding infinite
first tail moment. Thus $C$ and $0$ are incomparable. This witnesses failure
of Totality and Symmetric Neutrality (the draft’s “Reflection Symmetry”).
Folded Expectation also fails: the symmetric tail difference is identically
zero, so that principle would demand $C\sim0$.

Full and Antitonic Sum Invariance fail by the recorded St Petersburg
arguments, which require only Rich Outcomes and Stochastic Dominance.
See [the full-sum witness](dominance-refutes-full-sum.html) and
[the antitonic witness](dominance-refutes-antitonic-sum.html).

The executable check `checks/background_risk.py` tests finite-law area and
quantile identities, mixture behavior, the convolution-overlap example, and
exact St Petersburg tail identities. It is a sanity check, not a numerical
proof about all distributions or any transfinite extension.

See also the [source inventory and failed-claim audit](symmetric-dtu-refutes-independent-sum-candidate.html).

## Paper references

- **Proof: Unbounded Utility and Background Risk.** Zachary Goodsell (5 June 2026). Unbounded Utility and Background Risk. Unpublished working manuscript. — §3, pp. 7–8; Theorems 6–7, pp. 19–20
