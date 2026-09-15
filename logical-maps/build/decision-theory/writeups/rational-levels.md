# Rational levels

<p class='cert'>Model — Source: Misc.; produced by Claude Fable 5.1 (Cowork session).</p>

## Package

- **Completeness.** For all $p, q \in \Delta (X): p \succeq q$ or $q \succeq p$.
- **Transitivity.** For all $p, q, r \in \Delta (X)$: if $p \succeq q$ and $q \succeq r$ then $p \succeq r$.
- **Archimedean.** For all $p, q, r \in \Delta (X)$: if $p \succ q \succ r$ then there are $\alpha , \beta \in (0,1)$ with $\alpha p + (1- \alpha )r \succ q$ and $q \succ \beta p + (1- \beta )r$.
- **¬ Mixture continuity.** For all $p, q, r \in \Delta (X)$ the sets $\{\lambda \in [0,1] : \lambda p + (1- \lambda )q \succeq r\}$ and $\{\lambda \in [0,1] : r \succeq \lambda p + (1- \lambda )q\}$ are closed.

## Construction

Let $X = \{a, b, c\}$ and define a three-valued function V on $\Delta (X)$:
$V(p) = 2$ if $p(a) \in \mathbb{Q} ; V(p) = 1$ if $p(a) \notin \mathbb{Q}$ and $p(b) \in \mathbb{Q} ; V(p) = 0$
otherwise. Let $p \succeq q$ iff $V(p) \ge V(q)$. This is a weak order.

Mixture continuity fails: along the line from $\delta _a$ to $\delta _b$ the mixture
$\lambda \delta _a + (1- \lambda )\delta _b$ has $V = 2$ exactly when $\lambda \in \mathbb{Q}$, so
$\{\lambda : \lambda \delta _a + (1- \lambda )\delta _b \succeq \delta _c\} = \mathbb{Q} \cap [0,1]$ is not closed.

Archimedean holds: a chain $p \succ q \succ r$ forces $V(p) = 2, V(q) = 1, V(r) = 0$,
so $p(a) \in \mathbb{Q}$ and $r(a) \notin \mathbb{Q}$, in particular $p(a) \ne r(a)$. Along
$m(\alpha ) = \alpha p + (1- \alpha )r$ the coordinate $m(\alpha )(a) = r(a) + \alpha (p(a) - r(a))$ is
rational for a dense set of $\alpha$, so some $\alpha \in (0,1)$ close to 1 has
$V(m(\alpha )) = 2 > V(q)$. For the other half, $m(\beta )(a)$ is irrational for all but
countably many $\beta$; and $m(\beta )(b) = r(b) + \beta (p(b) - r(b))$ is irrational for
all but countably many $\beta$ when $p(b) \ne r(b)$, and equals $r(b) \notin \mathbb{Q}$ when
$p(b) = r(b)$ (because $V(r) = 0$). So some $\beta \in (0,1)$ close to 0 has
$V(m(\beta )) = 0 < V(q)$.

## Notes

The construction is deliberately artificial: it shows that the Archimedean axiom cannot replace mixture continuity even for weak orders, unless something like independence is added. Not yet checked by a human.

<p class='cert'>Record: <code>topics/decision-theory/models/rational-levels.yaml</code></p>
