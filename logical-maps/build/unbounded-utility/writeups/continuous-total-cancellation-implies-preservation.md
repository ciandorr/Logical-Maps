# L¹ continuity turns independent-sum cancellation into preservation

**Proved implication:** Rich Outcomes + Totality + Stochastic Dominance +
$L^{1}$ Continuity + Independent Sum Cancellation implies Independent Sum
Preservation.

The proof concerns numerical gambles in the finite real chart. Rich Outcomes
makes every real translation below available. Additional outcomes outside
that chart are not used.

## 1. Cancellation already preserves strict comparisons

Suppose $X\succ Y$ and $Z$ is independent of $(X,Y)$. If
$X+Z\not\succ Y+Z$, Totality of the two sums implies
$Y+Z\succeq X+Z$. Cancellation, with the two compared variables exchanged,
would give $Y\succeq X$, contradicting $X\succ Y$. Hence

$$X\succ Y\quad\Longrightarrow\quad X+Z\succ Y+Z.$$

This argument does not establish preservation of indifference. Cancellation
can, as an abstract order property, prevent reversal of a strict order while
allowing a map to break a tie. The next step closes precisely that gap.

## 2. Constant shifts supply strict approximations

For every real-valued random variable $X$ and every $\delta>0$, the variable
$X+\delta$ strictly stochastically dominates $X$. All weak tail inequalities
follow from $X+\delta>X$ pointwise. To see that at least one is strict,
partition $\mathbb R$ into the intervals
$(k\delta,(k+1)\delta]$, $k\in\mathbb Z$. At least one has positive
$X$-probability, and at its upper endpoint $t$ we have

$$\Pr(X+\delta>t)-\Pr(X>t)
  =\Pr(t-\delta<X\le t)>0.$$

Stochastic Dominance therefore gives $X+\delta\succ X$. For any outcomes
outside the finite chart the weak comparison also follows pointwise from
the outcome order; the displayed strict threshold lies in the chart.

If $X\succeq Y$, transitivity of the preorder gives
$X+\delta\succ Y$: the contrary comparison $Y\succeq X+\delta$ would
contradict $X+\delta\succ X$.

Independence of $Z$ from $(X,Y)$ implies independence from
$(X+\delta,Y)$, since translation is a measurable transformation of the
pair. Applying the first step now yields

$$(X+Z)+\delta\succ Y+Z.$$

## 3. Only upper-section continuity is needed

Take $\delta_n=1/n$. The actual, pointwise-coupled variables satisfy

$$E\bigl|((X+Z)+\delta_n)-(X+Z)\bigr|=\delta_n\longrightarrow0.$$

The upper-section clause in the project$'s L^{1}$ Continuity principle applies
to $(X+Z)+\delta_n\succeq Y+Z$ and gives
$X+Z\succeq Y+Z$. It does not require $X$, $Y$, $Z$, or their sums to
have finite expectations. Along with step 1, this proves both clauses of
Independent Sum Preservation.

No comparison of same-law copies, Mixture Independence, or lower-section
continuity has been used.

## Consequences under DTU

Together with the already recorded decomposition, the result makes
**Cancellation, Preservation, and full Independent Sum Invariance
equivalent under DTU + L¹ Continuity**. Thus the existing Lévy obstruction
also rules out Cancellation under DTU $+ L^{1}$ Continuity + Symmetric Neutrality.
These consequences are left to the inference engine, rather than stored as
duplicate arrows.

Without $L^{1}$ Continuity, the argument stops at strict preservation. The map
separately records the conjecture that DTU alone might close that gap.

**Original work: connecting proof using a shift approximation.**
GPT-6 (Codex), 9 September 2026. Goodsell's *Symmetries of value*, §3, p. 23,
supplies the upper-section continuity definition; his *Unbounded Utility
and Background Risk* (unpublished), Lemma 1, pp. 7–8, supplies the sum
principles. Neither paper is being credited with this additional proof.
Direct source: Misc. No independent checker or Lean verification is claimed.

## Paper references

- **Background: [Symmetries of value](https://doi.org/10.1111/nous.12549).** Zachary Goodsell (2026). Symmetries of value. Noûs, 60, 16–37. — §3, p. 23: source for the upper-section L1 Continuity axiom only
- **Background: Unbounded Utility and Background Risk.** Zachary Goodsell (5 June 2026). Unbounded Utility and Background Risk. Unpublished working manuscript. — Lemma 1, pp. 7–8: source for the independent-sum principles only
- **Background: [Flummoxing expectations](https://doi.org/10.1111/nous.12530).** Hayden Wilkinson (2025). Flummoxing expectations. Noûs, 59(3), 700–728. First published online in 2024. — §6.1. Source of Independent Sum Consistency; see the principle reference for the changed independence condition. The proof or conjecture recorded here retains its separate attribution.
