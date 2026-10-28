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

$\operatorname{Rigid}$ is thus necessary weak rigidity {lean: Classicism.rigid_iff_box_weaklyRigid}. These are the
conventions of Dorr, *Boolean Completeness does not imply Rigid
Comprehension*, pp. 2 and 12. By T, rigidity implies weak rigidity, persistence weak
persistence, and inextensibility weak inextensibility
{lean: Classicism.weaklyRigid_of_rigid, Classicism.weaklyPersistent_of_persistent, Classicism.weaklyInextensible_of_inextensible}.

::: lemma {#rigid-necessary}
title: rigidity, if true, is necessary
lean: Classicism.rigid_necessary
---
If $X$ is rigid, then $\Box\operatorname{Rigid}(X)$.

*Proof.* $\operatorname{Rigid}(X)$ is $\Box\operatorname{WeaklyRigid}(X)$, and
[[modal-four|4]] gives $\Box\Box\operatorname{WeaklyRigid}(X)$, which is
$\Box\operatorname{Rigid}(X)$. $\square$
:::

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
lean: Classicism.eq_of_weaklyRigid_coext
---
If $F$ and $G$ are weakly rigid and coextensive, then $F=G$.

*Proof.* Each is below the other: $F\le G$ by weak inextensibility of $F$, since each
instance of $F$ is an instance of $G$ and so, by weak persistence of $G$, necessarily one;
and $G\le F$ likewise. Since $\le$ is antisymmetric, $F=G$. $\square$
:::

## Closure properties

The lemmas below use no BF, choice, ND or comprehension. That BF at $\sigma$ makes
$\lambda z^\sigma\, .\,\top$ weakly rigid, and □BF makes it rigid, are forms of
[[barcan-r|BF]] and [[necessary-barcan-r|□BF]].

::: lemma {#haecceities-rigid}
title: haecceities are rigid
lean: Classicism.Rigidity.singleton_rigid
credit: GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 22 October 2026
---
For every $x^\sigma$, the haecceity $H_x=\lambda y\, .\,y=x$ is rigid.

*Proof.* It is persistent by [[identity-necessary-r|NI]]. For inextensibility, suppose,
at any world, that $\forall y\, .\,y=x\to\Box Zy$. Then $\Box Zx$, and so
$\Box\forall y\, .\,y=x\to Zy$, which is $H_x\le Z$. $\square$
:::

::: lemma {#rigid-indexed-union}
title: rigid unions of rigid families
lean: Classicism.Rigidity.indexed_union_rigid
credit: GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 22 October 2026
---
If $R^{\sigma t}$ is rigid and $F^{\sigma\tau t}$ is such that $Fx$ is rigid for every $x$
with $Rx$, then the union $U:=\lambda y\, .\,\exists x\, .\,Rx\land(Fx)y$ is rigid.

*Proof.* First, necessarily every instance of $R$ has a rigid fiber. For each $x$ with
$Rx$, $Fx$ is rigid and so, by [[rigid-necessary]], necessarily rigid; so by the
inextensibility of $R$, $R\le\lambda x\, .\,\operatorname{Rigid}(Fx)$. Now argue at an
arbitrary world, where $R$ is weakly rigid and each instance of $R$ has a rigid fiber.
*Weak persistence:* if $Uy$, take $x$ with $Rx$ and $(Fx)y$; then $\Box Rx$ and
$\Box(Fx)y$, so $\Box Uy$. *Weak inextensibility:* suppose $\forall y\, .\,Uy\to\Box Zy$.
For each $x$ with $Rx$, $\forall y\, .\,(Fx)y\to\Box Zy$, so $Fx\le Z$ by the
inextensibility of $Fx$; that is, $\Box(\forall y\, .\,(Fx)y\to Zy)$. By the weak
inextensibility of $R$, $R\le\lambda x\, .\,\forall y\, .\,(Fx)y\to Zy$, which gives
$U\le Z$. Both hold at every world, so $U$ is rigid. $\square$
:::

::: lemma {#rigid-direct-image}
title: rigidity is preserved by direct images
lean: Classicism.Rigidity.direct_image_rigid
credit: GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 22 October 2026
---
If $R^{\sigma t}$ is rigid and $f^{\sigma\tau}$ is an operation ($\tau\ne e$), then
$\lambda y\, .\,\exists x\, .\,Rx\land y=fx$ is rigid.

*Proof.* It is the union of the haecceities $H_{fx}$ over the instances of $R$, rigid by
[[haecceities-rigid]] and [[rigid-indexed-union]]. $\square$
:::

::: lemma {#rigid-inverse-image}
title: rigidity is preserved by inverse images under necessarily injective operations
lean: Classicism.Rigidity.inverse_image_rigid
credit: GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 22 October 2026
---
If $P^{\tau t}$ is rigid, every instance of $P$ is a value of $f^{\sigma\tau}$
($\tau\ne e$), and $f$ is necessarily injective, then $\lambda x\, .\,P(fx)$ is rigid.

*Proof.* Persistence is inherited from $P$. Being a value of $f$ is necessary if true, by
[[identity-necessary-r|NI]], so the inextensibility of $P$ makes every instance of $P$
necessarily a value of $f$. For inextensibility, suppose, at a world,
that $\forall x\, .\,P(fx)\to\Box Zx$, and put $Z':=\lambda y\, .\,\forall x\, .\,y=fx\to Zx$.
If $Py$, then $y=fx_0$ for some $x_0$, so $\Box Zx_0$; since $f$ is necessarily injective,
necessarily every $x$ with $fx=fx_0$ is $x_0$, so $\Box Z'y$. By the inextensibility of
$P$, $P\le Z'$, and so $\Box\forall x\, .\,P(fx)\to Zx$. Both the range condition and
injectivity keep their modal scopes. $\square$
:::
