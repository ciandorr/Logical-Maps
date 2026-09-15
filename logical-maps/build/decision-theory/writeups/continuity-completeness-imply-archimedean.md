# Mixture continuity ∧ Completeness ⇒ Archimedean

<p class='cert'>Result — Source: Misc.; produced by Claude Fable 5.1 (Cowork session).</p>

## Premises

- **Mixture continuity.** For all $p, q, r \in \Delta (X)$ the sets $\{\lambda \in [0,1] : \lambda p + (1- \lambda )q \succeq r\}$ and $\{\lambda \in [0,1] : r \succeq \lambda p + (1- \lambda )q\}$ are closed.
- **Completeness.** For all $p, q \in \Delta (X): p \succeq q$ or $q \succeq p$.

## Conclusion

- **Archimedean.** For all $p, q, r \in \Delta (X)$: if $p \succ q \succ r$ then there are $\alpha , \beta \in (0,1)$ with $\alpha p + (1- \alpha )r \succ q$ and $q \succ \beta p + (1- \beta )r$.

## Proof

Let $p \succ q \succ r$ and set $A = \{\lambda : \lambda p+(1- \lambda )r \succeq q\}, B = \{\lambda : q \succeq \lambda p+(1- \lambda )r\}$.
Both are closed by continuity and $A \cup B = [0,1]$ by completeness. Since
$1 \notin B$ (as $p \succ q$) and $[0,1]\setminus B$ is open, some interval $(1- \epsilon , 1]$ lies in
$[0,1]\setminus B \subseteq A$; any $\alpha$ in it with $\alpha < 1$ gives $\alpha p+(1- \alpha )r \succ q$. Symmetrically,
$0 \notin A$ (as $q \succ r$) yields $[0, \epsilon ) \subseteq B\setminus A$ and any $\beta$ in it with $\beta > 0$ gives
$q \succ \beta p+(1- \beta )r$.

## Notes

Completeness is used to conclude $\lambda \in A$ from $\lambda \notin B$; whether continuity alone suffices is left open here.

<p class='cert'>Record: <code>topics/decision-theory/results/continuity-completeness-imply-archimedean.yaml</code></p>
