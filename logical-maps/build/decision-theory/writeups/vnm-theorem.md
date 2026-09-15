# Completeness ∧ Transitivity ∧ Independence ∧ Mixture continuity ⇒ Expected-utility representation

<p class='cert'>Result — Source: Misc.; produced by literature.</p>

## Premises

- **Completeness.** For all $p, q \in \Delta (X): p \succeq q$ or $q \succeq p$.
- **Transitivity.** For all $p, q, r \in \Delta (X)$: if $p \succeq q$ and $q \succeq r$ then $p \succeq r$.
- **Independence.** For all $p, q, r \in \Delta (X)$ and $\lambda \in (0,1]: p \succeq q$ if and only if $\lambda p + (1- \lambda )r \succeq \lambda q + (1- \lambda )r$.
- **Mixture continuity.** For all $p, q, r \in \Delta (X)$ the sets $\{\lambda \in [0,1] : \lambda p + (1- \lambda )q \succeq r\}$ and $\{\lambda \in [0,1] : r \succeq \lambda p + (1- \lambda )q\}$ are closed.

## Conclusion

- **Expected-utility representation.** There is a function $u : X \to \mathbb{R}$ such that for all $p, q \in \Delta (X): p \succeq q$ if and only if $\operatorname{EU}_u(p) \ge \operatorname{EU}_u(q)$.

## Proof

The von Neumann–Morgenstern theorem in the Herstein–Milnor mixture-set form.
Continuity plus weak order give, for any $p \succeq q \succeq r$ with $p \succ r, a$ unique
$\lambda$ with $q \sim \lambda p + (1- \lambda )r$ (connectedness of [0,1] and closedness of both
sections). Fix a best and a worst lottery (exist since X is finite and $\succeq$
is a weak order respecting mixtures), define $U(q)$ as that $\lambda$, and use
independence to show U is affine in mixtures; then $u(x) = U(\delta _x)$
represents $\succeq$ by expected utility.

## Sources

- von Neumann & Morgenstern (1944), Theory of Games and Economic Behavior, appendix
- Herstein & Milnor (1953), An axiomatic approach to measurable utility, Econometrica 21, Theorem 8
- Kreps (1988), Notes on the Theory of Choice, Theorem 5.15

<p class='cert'>Record: <code>topics/decision-theory/results/vnm-theorem.yaml</code></p>
