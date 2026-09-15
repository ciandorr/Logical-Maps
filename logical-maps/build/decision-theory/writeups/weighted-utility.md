# Weighted utility

<p class='cert'>Model — Source: Misc.; produced by literature.</p>

## Package

- **Completeness.** For all $p, q \in \Delta (X): p \succeq q$ or $q \succeq p$.
- **Transitivity.** For all $p, q, r \in \Delta (X)$: if $p \succeq q$ and $q \succeq r$ then $p \succeq r$.
- **Closed-graph continuity.** The set $\{(p, q) \in \Delta (X) \times \Delta (X) : p \succeq q\}$ is closed in the product topology.
- **Betweenness.** For all $p, q \in \Delta (X)$ and $\lambda \in (0,1)$: if $p \succ q$ then $p \succ \lambda p + (1- \lambda )q \succ q$, and if $p \sim q$ then $p \sim \lambda p + (1- \lambda )q$.
- **¬ Independence.** For all $p, q, r \in \Delta (X)$ and $\lambda \in (0,1]: p \succeq q$ if and only if $\lambda p + (1- \lambda )r \succeq \lambda q + (1- \lambda )r$.

## Construction

Weighted utility. Fix $u : X \to \mathbb{R}$ and a weight $w : X \to (0,\infty )$ that is not
constant, and let $V(p) = \sum p(x)w(x)u(x) / \sum p(x)w(x)$; put $p \succeq q$ iff
$V(p) \ge V(q)$. V is continuous on $\Delta (X)$, so $\succeq$ is a weak order with closed
graph. Its indifference sets are the intersections of $\Delta (X)$ with
hyperplanes $\{p : \sum p(x)w(x)(u(x) - v) = 0\}$, which are straight, so
betweenness holds. Since w is not constant these hyperplanes are not
parallel, so $\succeq$ is not an expected-utility order and (being a continuous
weak order) must violate independence.

## Sources

- Chew (1983), A generalization of the quasilinear mean with applications to the measurement of income inequality and decision theory resolving the Allais paradox, Econometrica 51
- Dekel (1986), An axiomatic characterization of preferences under uncertainty: weakening the independence axiom, JET 40

<p class='cert'>Record: <code>topics/decision-theory/models/weighted-utility.yaml</code></p>
