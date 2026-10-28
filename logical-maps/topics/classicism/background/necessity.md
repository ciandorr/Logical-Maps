# Necessity

::: definition {#box-and-diamond}
title: necessity and possibility
---
Put $\Box p:=(p=\top)$ and $\Diamond p:=(p\ne\bot)$.
:::

The facts below are theorems of C, schemata in their type variables. Each was
formerly recorded as a result with no premises.

## The propositional modal logic of $\Box$

::: lemma {#modal-k}
title: K
lean: Classicism.modal_K
credit: Andrew Bacon (Classicism credits the S4 result to Bacon 2018)
sources: Classicism, §1.5, p. 16
---
Necessity distributes over implication:
$\forall p q\, .\,\Box(p\to q)\to(\Box p\to\Box q)$.

*Proof.* In the Boolean algebra of propositions, $\Box(p\to q)$ says that the
implication is $\top$. Together with $p=\top$, substitution and the Boolean identities
identify $q$ with $\top$.

*Dual form.* $\forall p q\, .\,\Box(p\to q)\to(\Diamond p\to\Diamond q)$. Instantiate
either form at $\neg q,\neg p$ and contrapose the inner conditional, using
$\Box(\neg q\to\neg p)\leftrightarrow\Box(p\to q)$ and $\Diamond=\neg\Box\neg$.
:::

::: lemma {#modal-t}
title: T
lean: Classicism.modal_T
credit: Andrew Bacon (Classicism credits the S4 result to Bacon 2018)
sources: Classicism, §1.5, p. 16
---
Necessary propositions are true: $\forall p\, .\,\Box p\to p$.

*Proof.* If $p=\top$, identity elimination and the truth of $\top$ give $p$.

*Dual form.* Every truth is possible: $\forall p\, .\,p\to\Diamond p$, by contraposition
and $\Diamond=\neg\Box\neg$.
:::

::: lemma {#modal-four}
title: 4
lean: Classicism.modal_four
credit: Andrew Bacon (Classicism credits the S4 result to Bacon 2018)
sources: Classicism, §1.5, p. 17
---
Necessary propositions are necessarily necessary: $\forall p\, .\,\Box p\to\Box\Box p$.

*Proof.* Apply [[identity-necessary-r|NI]] to the identity $p=\top$. Its conclusion is
$\Box(p=\top)$, which is $\Box\Box p$.

*Dual form.* Whatever is possibly possible is possible:
$\forall p\, .\,\Diamond\Diamond p\to\Diamond p$, by contraposition and
$\Diamond=\neg\Box\neg$.
:::

**Further laws.** $\Box$ and $\Diamond$ are duals: $\Diamond p=\neg\Box\neg p$ and $\Box\neg p=\neg\Diamond p$,
and $\Box\neg p$ is $p=\bot$
{lean: Classicism.dia_eq_not_box_not, Classicism.box_not_eq_not_dia, Classicism.box_not_eq}.
$\Box$ distributes over conjunction, $\Box(p\land q)=(\Box p\land\Box q)$
{lean: Classicism.box_and_eq}; $\Diamond(p\lor q)\to\Diamond p\lor\Diamond q$
{lean: Classicism.dia_or}; and $\Diamond p\land\Box q\to\Diamond(p\land q)$
{lean: Classicism.dia_and_of_dia_box}.

By a result of Andrew Bacon (*The Broadest Necessity*, 2018), the propositional modal logic of $\Box$
in C is exactly S4, the smallest normal modal logic containing T and 4. The [[modal-five|5]] and [[modal-b|B]] axioms are not theorems of C, though they can consistently
be added.

## Quantifiers and identity

::: lemma {#identity-necessary-r}
title: Necessity of Identity (NI)
lean: Classicism.necessity_of_identity
credit: W. V. Quine (historical attribution in Classicism, p. 22)
sources: Classicism, §2.1, p. 22
---
Identity is necessary at every type: $\forall x y^\sigma\, .\,x=y\to\Box(x=y)$.

*Proof.* Reflexivity is a theorem, so its necessitation gives $\Box(x=x)$. Leibniz's
Law substitutes $y$ for the second $x$ under the premise $x=y$, giving $\Box(x=y)$.

*Polyadic form.* $\forall\bar x\,\bar y^{\bar\sigma}\, .\,\bar x=\bar y\to\Box(\bar x=\bar y)$:
$\bar x=\bar y$ is a conjunction of identities, each necessary, and a conjunction of
necessities is necessary.
:::

::: lemma {#converse-barcan-r}
title: Converse Barcan Formula (CBF)
lean: Classicism.converse_barcan
credit: Andrew Bacon and Cian Dorr
sources: Classicism, §1.5, p. 19
---
$\forall X^{\sigma t}\, .\,\Box(\forall x^\sigma\, .\,Xx)\to(\forall x^\sigma\, .\,\Box Xx)$.

*Proof.* Necessitate universal instantiation and use [[modal-k|K]] to obtain
$\Box(\forall x\, .\,Xx)\to\Box Xx$. Generalize $x$, preserving the side condition.

*Other forms.* The polyadic form,
$\forall X^{\bar\sigma t}\, .\,\Box(\forall\bar x\, .\,X[\bar x])\to(\forall\bar x\, .\,\Box X[\bar x])$,
follows by instantiating one variable at a time. The dual form says that if something
possibly has a property, then possibly something has it:
$\forall X^{\sigma t}\, .\,(\exists x\, .\,\Diamond Xx)\to\Diamond(\exists x\, .\,Xx)$,
and likewise for tuples; each comes from the corresponding form by contraposition and
$\Diamond=\neg\Box\neg$.
:::

::: lemma {#broad-necessitism-r}
title: Broad Necessitism
lean: Classicism.Proofs.classicism_implies_broad_necessitism_r
credit: Andrew Bacon and Cian Dorr
sources: Classicism, §1.5
---
Every entity of a type is necessarily identical to something:
$\forall x^\sigma\, .\,\Box(\exists y^\sigma\, .\,y=x)$.

*Proof.* The theorem $\forall x\, .\,\exists y\, .\,y=x$ can be necessitated, and
[[converse-barcan-r|CBF]] gives $\forall x\, .\,\Box\exists y\, .\,y=x$.

*Polyadic form.* $\forall\bar x^{\bar\sigma}\, .\,\Box(\exists\bar y^{\bar\sigma}\, .\,\bar y=\bar x)$,
taking $\bar y:=\bar x$ coordinatewise.
:::

The [[barcan-r|Barcan Formula]] and the [[distinctness-necessary-r|Necessity of Distinctness]] are not
theorems of C, though they can consistently be added.

## Intensionality

::: lemma {#intensionality-r}
title: Intensionality
lean: Classicism.intensionality
credit: Andrew Bacon and Cian Dorr
sources: Classicism, §1.5, pp. 17–18
---
Necessarily coextensive relations are identical:
$\forall X Y^{\bar\sigma t}\, .\,\Box(X\equiv Y)\to X=Y$.

*Proof.* Logical Equivalence identifies the λ-abstractions of
$X[\bar z]\land(X\equiv Y)$ and of the analogous
expression with $Y$ in the first conjunct. If the biconditional is necessary,
substitute its identity with $\top$ into the abstraction identity. Boolean identities
and β-η conversion leave $X=Y$, as on p. 17.
:::

::: lemma {#modalized-fregean}
title: Modalized Fregean Axiom
lean: Classicism.modalized_fregean
credit: Andrew Bacon and Cian Dorr
sources: Classicism, §1.5, p. 18
---
Necessarily equivalent propositions are identical:
$\forall p q\, .\,\Box(p\leftrightarrow q)\to p=q$.

*Proof.* The nullary instance of [[intensionality-r|Intensionality]]: necessary
equivalence identifies $p\leftrightarrow q$ with $\top$, and the Boolean identities then
identify $p$ and $q$.
:::

::: lemma {#modalized-functionality-r}
title: Modalized Functionality
lean: Classicism.modalized_functionality
credit: Andrew Bacon and Cian Dorr
sources: Classicism, §1.5, n. 22
---
Necessarily co-functional operations are identical:
$\forall X Y^{\sigma\tau}\, .\,\Box(\forall z^\sigma\, .\,Xz=Yz)\to X=Y\qquad(\tau\ne e)$.

*Proof.* From boxed pointwise identity, identity elimination gives boxed agreement after
applying every remaining argument of the relational output type; quantification over
those arguments is inside the necessary implication. [[intensionality-r|Intensionality]]
and η-conversion identify the operations. This relies on the output type's ending in $t$.

*Polyadic form.* $\forall X Y^{\bar\sigma\tau}\, .\,\Box(\forall\bar z\, .\,X[\bar z]=Y[\bar z])\to X=Y$
$(\tau\ne e)$, one argument at a time, with the box carried through.
:::
