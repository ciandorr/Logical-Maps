# Unanimity over two utilities

<p class='cert'>Model — Source: Misc.; produced by literature.</p>

## Package

- **Transitivity.** For all $p, q, r \in \Delta (X)$: if $p \succeq q$ and $q \succeq r$ then $p \succeq r$.
- **Independence.** For all $p, q, r \in \Delta (X)$ and $\lambda \in (0,1]: p \succeq q$ if and only if $\lambda p + (1- \lambda )r \succeq \lambda q + (1- \lambda )r$.
- **Closed-graph continuity.** The set $\{(p, q) \in \Delta (X) \times \Delta (X) : p \succeq q\}$ is closed in the product topology.
- **Expected multi-utility representation.** There is a set U of functions $u : X \to \mathbb{R}$ such that for all $p, q \in \Delta (X): p \succeq q$ if and only if $\operatorname{EU}_u(p) \ge \operatorname{EU}_u(q)$ for every $u \in U$.
- **¬ Completeness.** For all $p, q \in \Delta (X): p \succeq q$ or $q \succeq p$.

## Construction

Unanimity over two utilities. With $X = \{a, b, c\}$ let $p \succeq q$ iff
$p(a) \ge q(a)$ and $p(b) \ge q(b) (U = \{u_{1}, u_{2}\}$ with $u_{1} = 1_a, u_{2} = 1_b$).
This is an expected multi-utility representation, hence transitive,
independent and closed-graph continuous; but $\delta _a$ and $\delta _b$ are
incomparable.

## Sources

- Aumann (1962), Utility theory without the completeness axiom, Econometrica 30
- Dubra, Maccheroni & Ok (2004), JET 115

<p class='cert'>Record: <code>topics/decision-theory/models/unanimity-two-utilities.yaml</code></p>
