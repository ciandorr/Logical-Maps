# Independence ⇒ Betweenness

<p class='cert'>Result — Source: Misc.; produced by Claude Fable 5.1 (Cowork session).</p>

## Premises

- **Independence.** For all $p, q, r \in \Delta (X)$ and $\lambda \in (0,1]: p \succeq q$ if and only if $\lambda p + (1- \lambda )r \succeq \lambda q + (1- \lambda )r$.

## Conclusion

- **Betweenness.** For all $p, q \in \Delta (X)$ and $\lambda \in (0,1)$: if $p \succ q$ then $p \succ \lambda p + (1- \lambda )q \succ q$, and if $p \sim q$ then $p \sim \lambda p + (1- \lambda )q$.

## Proof

Fix $\lambda \in (0,1)$ and write $m = \lambda p + (1- \lambda )q$. Independence with $r = p$ and
mixing weight $1- \lambda$ gives $p \succeq q \Longleftrightarrow (1- \lambda )p+\lambda p \succeq (1- \lambda )q+\lambda p, i.e. p \succeq q \Longleftrightarrow p \succeq m$,
and likewise $q \succeq p \Longleftrightarrow m \succeq p$. Hence $p \succ q \Longleftrightarrow p \succ m$ and $p \sim q \Longleftrightarrow p \sim m$.
Independence with $r = q$ and weight $\lambda$ gives $p \succeq q \Longleftrightarrow m \succeq q$ and
$q \succeq p \Longleftrightarrow q \succeq m$, so $p \succ q \Longleftrightarrow m \succ q$. Together: $p \succ q \Longrightarrow p \succ m \succ q$ and
$p \sim q \Longrightarrow p \sim m$.

## Notes

No ordering assumptions are needed because independence is taken in the biconditional form.

<p class='cert'>Record: <code>topics/decision-theory/results/independence-implies-betweenness.yaml</code></p>
