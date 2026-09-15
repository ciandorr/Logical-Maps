# Non-convex cone

<p class='cert'>Model — Source: Misc.; produced by Claude Fable 5.1 (Cowork session).</p>

## Package

- **Completeness.** For all $p, q \in \Delta (X): p \succeq q$ or $q \succeq p$.
- **Independence.** For all $p, q, r \in \Delta (X)$ and $\lambda \in (0,1]: p \succeq q$ if and only if $\lambda p + (1- \lambda )r \succeq \lambda q + (1- \lambda )r$.
- **Closed-graph continuity.** The set $\{(p, q) \in \Delta (X) \times \Delta (X) : p \succeq q\}$ is closed in the product topology.
- **¬ Transitivity.** For all $p, q, r \in \Delta (X)$: if $p \succeq q$ and $q \succeq r$ then $p \succeq r$.

## Construction

Let $X = \{a, b, c\}$ and identify a difference q − p of lotteries with the
point $(q(a) - p(a), q(b) - p(b)) \in \mathbb{R} ^{2}$. Let $C \subseteq \mathbb{R} ^{2}$ be the closed upper
half-plane together with the closed sector of directions [225°, 270°],
and define $q \succeq p$ iff $q - p \in C$.

$\operatorname{Completeness}: C \cup (- C) = \mathbb{R} ^{2}$ since −C contains the closed lower
half-plane. Independence: mixing both sides with r multiplies the
difference by $\lambda > 0$, and C is a cone. Closed graph: (p, q) ↦ q − p is
continuous and C is closed. Reflexivity: $0 \in C$.

Transitivity fails: take x at direction 240° and y at direction 170°,
both in C and small enough that $p, q = p + x\ldots$ are lotteries; $x + y$ has
direction $\approx 205$°, which is not in C. So with $q - p = x$ and $r - q = y$ we
have $q \succeq p$ and $r \succeq q$ but not $r \succeq p$.

## Notes

Sanity-checked numerically in checks/countermodels.py (completeness and independence hold, transitivity fails on random samples). Not yet checked by a human. Any non-convex closed cone C with $C \cup - C = \mathbb{R} ^{2}$ works.

<p class='cert'>Record: <code>topics/decision-theory/models/non-convex-cone.yaml</code></p>
