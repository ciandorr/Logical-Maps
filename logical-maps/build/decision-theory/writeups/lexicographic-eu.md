# Lexicographic EU

<p class='cert'>Model — Source: Misc.; produced by literature.</p>

## Package

- **Completeness.** For all $p, q \in \Delta (X): p \succeq q$ or $q \succeq p$.
- **Transitivity.** For all $p, q, r \in \Delta (X)$: if $p \succeq q$ and $q \succeq r$ then $p \succeq r$.
- **Independence.** For all $p, q, r \in \Delta (X)$ and $\lambda \in (0,1]: p \succeq q$ if and only if $\lambda p + (1- \lambda )r \succeq \lambda q + (1- \lambda )r$.
- **¬ Mixture continuity.** For all $p, q, r \in \Delta (X)$ the sets $\{\lambda \in [0,1] : \lambda p + (1- \lambda )q \succeq r\}$ and $\{\lambda \in [0,1] : r \succeq \lambda p + (1- \lambda )q\}$ are closed.
- **¬ Archimedean.** For all $p, q, r \in \Delta (X)$: if $p \succ q \succ r$ then there are $\alpha , \beta \in (0,1)$ with $\alpha p + (1- \alpha )r \succ q$ and $q \succ \beta p + (1- \beta )r$.

## Construction

Lexicographic expected utility. With $X = \{a, b, c\}$ let $p \succeq q$ iff
$p(a) > q(a)$, or $p(a) = q(a)$ and $p(b) \ge q(b)$. This is complete and
transitive (a lexicographic order on $\mathbb{R} ^{2}$), and satisfies independence
because mixing with r multiplies the vector of differences by $\lambda$, which
preserves lexicographic sign. But $\{\lambda : \lambda \delta _a + (1- \lambda )\delta _c \succeq \delta _b\} = (0, 1]$,
which is not closed.

The same lexicographic order $(p \succeq q$ iff $p(a) > q(a)$, or $p(a) = q(a)$ and
$p(b) \ge q(b)$). Here $\delta _a \succ \delta _b \succ \delta _c$, but every mixture $\beta \delta _a + (1- \beta )\delta _c$
with $\beta > 0$ puts positive weight on a and so is strictly preferred to
$\delta _b$; no $\beta$ with $\delta _b \succ \beta \delta _a + (1- \beta )\delta _c$ exists.

## Notes

Derivable from lexicographic-not-archimedean together with continuity-completeness-imply-archimedean (the validator reports it as redundant); kept because it is the form the literature states.

## Sources

- Hausner (1954), Multidimensional utilities, in Decision Processes (Thrall, Coombs & Davis eds.)
- Fishburn (1971), A study of lexicographic expected utility, Management Science 17
- Hausner (1954), Multidimensional utilities
- Fishburn (1971), A study of lexicographic expected utility, Management Science 17

<p class='cert'>Record: <code>topics/decision-theory/models/lexicographic-eu.yaml</code></p>
