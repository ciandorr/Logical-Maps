# Band relation

<p class='cert'>Model — Source: Misc.; produced by Claude Fable 5.1 (Cowork session).</p>

## Package

- **Completeness.** For all $p, q \in \Delta (X): p \succeq q$ or $q \succeq p$.
- **Acyclicity.** There is no finite cycle of strict preferences $p_{1} \succ p_{2} \succ \ldots \succ p_{n} \succ p_{1}$.
- **¬ Quasi-transitivity.** Strict preference is transitive: if $p \succ q$ and $q \succ r$ then $p \succ r$.

## Construction

Fix $u : X \to \mathbb{R}$ non-constant and $\epsilon > 0$. Define an asymmetric relation P by
p P q iff $\operatorname{EU}_u(p) - \operatorname{EU}_u(q) \in (\epsilon , 2\epsilon ]$, and let $p \succeq q$ iff not q P p. Then
$\succeq$ is complete (P is asymmetric) and $\succ = P$. P is acyclic because $\operatorname{EU}_u$
strictly increases along any P-chain. But P is not transitive: with
$\operatorname{EU}_u(p), \operatorname{EU}_u(q), \operatorname{EU}_u(r) = 3\epsilon , 1.5\epsilon , 0$ we have p P q and q P r while
$\operatorname{EU}_u(p) - \operatorname{EU}_u(r) = 3\epsilon \notin (\epsilon , 2\epsilon ]$.

## Notes

Sanity-checked numerically in checks/countermodels.py. Not yet checked by a human.

<p class='cert'>Record: <code>topics/decision-theory/models/band-relation.yaml</code></p>
