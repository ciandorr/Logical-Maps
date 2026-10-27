# Rigidity

::: definition {#rigidity-predicates}
title: persistence, inextensibility and rigidity
---
For a relation $Y$ with a finite argument tuple, including the empty tuple,
the comprehension predicates are:

$$
\begin{aligned}
\operatorname{Persistent}(Y)&:=Y\le\lambda\bar x\, .\,\Box Y[\bar x],\\
\operatorname{Inextensible}(Y)&:=\Box\forall X\, .\,
  (\forall\bar x\, .\,Y[\bar x]\to\Box X[\bar x])\to Y\le X,\\
\operatorname{Rigid}(Y)&:=\operatorname{Persistent}(Y)\land
  \operatorname{Inextensible}(Y).
\end{aligned}
$$
:::

This is the rigidity convention of §2.3, p. 28. Gallin's alternative
convention has its own principle.

::: definition {#weak-rigidity-predicates}
title: the weak variants
---
Since $Y\le Z$ is itself the necessary universal closure of the pointwise
implication, $\operatorname{Persistent}(Y)$ unpacks as
$\Box\forall\bar x\, .\,Y[\bar x]\to\Box Y[\bar x]$, and both
conjuncts of $\operatorname{Rigid}$ carry a leading $\Box$. Dropping it
gives the weak variants:

$$
\begin{aligned}
\operatorname{WeaklyPersistent}(Y)&:=\forall\bar x\, .\,
  Y[\bar x]\to\Box Y[\bar x],\\
\operatorname{WeaklyInextensible}(Y)&:=\forall X\, .\,
  (\forall\bar x\, .\,Y[\bar x]\to\Box X[\bar x])\to Y\le X,\\
\operatorname{WeaklyRigid}(Y)&:=\operatorname{WeaklyPersistent}(Y)\land
  \operatorname{WeaklyInextensible}(Y).
\end{aligned}
$$
:::

$\operatorname{Rigid}$ is thus necessary weak rigidity. These are the
conventions of Dorr, *Boolean Completeness does not imply Rigid
Comprehension*, pp. 2 and 12.

::: lemma {#weakly-rigid-persistent}
title: weakly rigid relations are persistent
lean: Classicism.persistent_of_weaklyRigid
sources: Dorr, Boolean Completeness does not imply Rigid Comprehension, draft of 30 July 2026
---
A weakly rigid relation is persistent: weak
inextensibility applied to $\lambda\bar x\, .\,\Box Y[\bar x]$, whose
hypothesis $Y[\bar x]\to\Box\Box Y[\bar x]$ holds by weak persistence and 4,
gives $Y\le\lambda\bar x\, .\,\Box Y[\bar x]$. So weak rigidity is equivalently
persistence together with weak inextensibility, the combination used in the
draft's Proposition 1.
:::

::: lemma {#coextensive-weakly-rigid-identical}
title: coextensive weakly rigid relations are identical
lean: Classicism.Proofs.eq_of_weaklyRigid_coext
---
If $F$ and $G$ are weakly rigid and coextensive, then $F=G$.

*Proof.* Each is below the other: $F\le G$ by weak inextensibility of $F$, since each
instance of $F$ is an instance of $G$ and so, by weak persistence of $G$, necessarily one;
and $G\le F$ likewise. Since $\le$ is antisymmetric, $F=G$. $\square$
:::
