# Atoms and worlds

Atoms are defined with the other [[lattice-predicates|lattice predicates]].

::: definition {#strong-and-weak-worlds}
title: strong and weak worlds
---
Strong and weak worlds follow Bacon, *A Philosophical Introduction to
Higher-Order Logics*, §8.2, pp. 165–166. At a relational type $\sigma$, with
$\Diamond_\sigma X:=X\ne\bot_\sigma$,

$$
\begin{aligned}
\operatorname{SWorld}_\sigma(W)&:=\Diamond_\sigma W\land\Box\forall Y^\sigma\, .\,
  W\le_\sigma Y\lor W\le_\sigma\neg_\sigma Y,\\
\operatorname{WWorld}_\sigma(W)&:=\Diamond_\sigma W\land\forall Y^\sigma\, .\,
  W\le_\sigma Y\lor W\le_\sigma\neg_\sigma Y.
\end{aligned}
$$
:::

A weak world is an atom in the sense above; a strong world necessarily settles
every entity of its type, including ones that do not actually exist. The
Weak Leibniz Biconditionals, $\forall X\, .\,\Diamond_\sigma X\to\exists W\, .\,
\operatorname{WWorld}_\sigma(W)\land W\le X$, are the map's Atomicity; the
Strong Leibniz Biconditionals replace $\operatorname{WWorld}$ by
$\operatorname{SWorld}$. In both, the right-to-left direction is a theorem of C. The type-$t$ instance
of the strong form is recorded separately, as is done for Atomicity.
