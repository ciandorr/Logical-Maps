# CDF-area dominance

This is a model of **DU**, but not **DTU**, because Totality fails.

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
