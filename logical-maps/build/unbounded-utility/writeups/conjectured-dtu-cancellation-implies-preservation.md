# Does DTU alone turn cancellation into full independent-sum invariance?

**Conjectured implication, not proved:** DTU + Independent Sum Cancellation
implies Independent Sum Preservation.

Here DTU is the complete displayed package: Rich Outcomes, Totality,
Stochastic Equivalence, Simple Expected Utility, Stochastic Dominance,
and Mixture Independence. No continuity axiom is included.

## What is already established

Cancellation and Totality preserve strict comparisons. If $X\succ Y$ but
$Y+Z\succeq X+Z$, cancellation would give $Y\succeq X$, a contradiction.
Totality of the sums therefore gives $X+Z\succ Y+Z$.

Under these assumptions, weak preservation can fail only by breaking an
existing indifference. Thus the exact remaining question is:

$$X\sim Y,\quad Z\perp(X,Y)
\quad\stackrel{?}{\Longrightarrow}\quad X+Z\sim Y+Z.$$

Adding L¹ Continuity settles this affirmatively by
[the new constant-shift proof](continuous-total-cancellation-implies-preservation.html).
For every $n$, dominance gives $X+1/n\succ Y$, and strict preservation gives
$(X+Z)+1/n\succ Y+Z$. Upper-section L¹ closure yields the required weak
comparison, and exchanging $X,Y$ supplies the other one.

## The obstruction to removing continuity

The last limiting inference is not a consequence of preorder totality.
The framework intentionally allows non-Archimedean comparisons of
unbounded gambles. Having all the positively shifted approximants above a
fixed gamble does not, by itself, put their limit above it.

It would therefore be insufficient to repeat that proof and silently take
the limit. A positive solution must use further structure from DTU, for
example Mixture Independence, to show that independent noise cannot split
an indifferent pair. A negative solution must construct a DTU preorder
satisfying Cancellation and give a tied pair whose independent sums become
strictly ranked. The proved continuity result guarantees that any such
countermodel violates L¹ Continuity.

The existing total CDF-area conclosure extension satisfies full Independent
Sum Invariance; it cannot distinguish Cancellation from Preservation.
The incomplete exact area model cannot do so either without additional
work: it lacks Totality, and its cancellation property is not established.

**Original work: conjecture formulation and partial analysis.**
GPT-6 (Codex), 9 September 2026. The sum principles come from Goodsell's
*Unbounded Utility and Background Risk* (unpublished), Lemma 1, pp. 7–8.
The proposed implication is recorded under Misc. and is not attributed to
that manuscript. This is an unresolved entry in this project, not a claim
of literature novelty. No independent checker or Lean verification is claimed.

## Paper references

- **Background: Unbounded Utility and Background Risk.** Zachary Goodsell (5 June 2026). Unbounded Utility and Background Risk. Unpublished working manuscript. — Lemma 1, pp. 7–8: source for the separated sum principles, not this conjecture
- **Background: [Flummoxing expectations](https://doi.org/10.1111/nous.12530).** Hayden Wilkinson (2025). Flummoxing expectations. Noûs, 59(3), 700–728. First published online in 2024. — §6.1. Source of Independent Sum Consistency; see the principle reference for the changed independence condition. The proof or conjecture recorded here retains its separate attribution.
