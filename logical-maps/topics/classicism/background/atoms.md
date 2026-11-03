# Atoms

Atoms are defined with the other [[lattice-predicates|lattice predicates]]. An entity of a
relational type is an atom just when it is non-bottom and entails every entity of its type
or that entity's negation
{lean: Classicism.atom_le_or_le_neg_rel, Classicism.atom_of_decides, Classicism.atom_of_decides_arrow}.

::: definition {#strong-atoms}
title: strong atoms
---
At a relational type $\sigma$, with $\Diamond_\sigma X:=X\ne\bot_\sigma$, a *strong atom* is a
possible entity that necessarily entails every entity of its type or its negation:

$$
\operatorname{SAtom}_\sigma(W):=\Diamond_\sigma W\land\Box\forall Y^\sigma\, .\,
  W\le_\sigma Y\lor W\le_\sigma\neg_\sigma Y.
$$

Bacon, *A Philosophical Introduction to Higher-Order Logics*, §8.2, pp. 165–166, calls these
*strong worlds*; dropping the box gives his *weak worlds*, which are just the atoms. The map
avoids the word "world" for them, since at types other than $t$ they are not world-like.
:::

By [[modal-t|T]], a strong atom is an atom. Unlike an atom, it necessarily settles every
entity of its type, including entities that do not actually exist. [[atomicity-r|Atomicity]]
says that every possible entity is entailed by an atom; [[strong-atomicity-r|Strong
Atomicity]] requires a strong atom. Each is one direction of a biconditional that Bacon
calls the Weak and the Strong Leibniz Biconditionals; the other direction is a theorem of C.
The type-$t$ instance of each is recorded separately.

## Self-atoms

::: definition {#self-atoms}
title: self-atoms
lean: Classicism.P.SelfAtom
credit: Cian Dorr, 25 October 2026
---
A *self-atom* is a possible entity that is necessarily an atom whenever it is instantiated:

$$
\operatorname{SelfAtom}_\sigma(X):=\Diamond_\sigma X\land
  \Box\bigl(\exists\bar x\, .\,X\bar x\to\operatorname{Atom}_\sigma(X)\bigr),
\qquad
\operatorname{SelfAtom}_t(p):=\Diamond p\land\Box\bigl(p\to\operatorname{Atom}_t(p)\bigr).
$$
:::

At type $t$, since $p\land\operatorname{Atom}_t(p)$ is equivalent in C to
$p\land\forall q\, .\,q\to p\le q$, a self-atom is a possible proposition that
entails that it is the actual world. A strong atom is an atom at every world,
a self-atom an atom at every world where it holds, an atom an atom at the
evaluation point; a strong atom is a self-atom and a true atom is a
self-atom, but a self-atom need not be an atom. [[self-atomicity-r|Self-Atomicity]] replaces
$\operatorname{SAtom}$ in Strong Atomicity by $\operatorname{SelfAtom}$, and the four
*bridge principles* say that [[atoms-are-self-atoms-r|atoms are self-atoms]],
that [[self-atoms-are-atoms-r|self-atoms are atoms]], that
[[self-atoms-are-strong-atoms-r|self-atoms are strong atoms]], and that
[[atoms-are-strong-atoms-r|atoms are strong atoms]]; the last is what Strong Atomicity
adds to Atomicity.

## Atoms and their instance propositions

For $X$ of a relational type $\bar\sigma t$, write $\exists X$ for the proposition
$\exists\bar x\, .\,X\bar x$. By [[intensionality-r|Intensionality]], $X\ne\bot$ iff
$\Diamond\exists X$.

::: lemma {#atom-instance-proposition}
title: the instance proposition of an atom
credit: Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 30 October 2026
---
If $X$ is an atom, a strong atom or a self-atom, then so is $\exists X$.

*Proof.* Atoms. $\exists X\ne\bot$ as $X\ne\bot$. Let $q\le\exists X$, and put
$Z:=\lambda\bar x\, .\,q\land X\bar x\le X$. If $Z=X$, then $\Box\forall\bar x\, .\,X\bar x\to q$,
so $\exists X\le q$ and $q=\exists X$. If $Z=\bot$, then $\Box(q\to\neg\exists X)$, and with
$q\le\exists X$, $q=\bot$. This is a theorem of C, so it holds necessarily. Self-atoms: the
possibility clause transfers as for atoms, and necessarily, if $\exists X$ is true then $X$ is
instantiated, hence an atom, hence $\exists X$ is an atom. Strong atoms: a strong atom $W$
satisfies $\Box(W=\bot\lor\operatorname{Atom}(W))$, and conversely: if $W$ is an atom, then
for each $Y$, $W\land Y\le W$ is $W$ or $\bot$, that is, $W\le Y$ or $W\le\neg Y$. So
$\operatorname{SAtom}(W)$ iff $\Diamond W\land\Box(W=\bot\lor\operatorname{Atom}(W))$, and
$X=\bot$ iff $\exists X=\bot$.
:::

::: lemma {#unique-instance-copies}
title: copies of propositions along a uniquely instantiated property
credit: Cian Dorr (the atom case, 30 October 2026); generalized by Claude Opus 5.5 (Anthropic),
  prompted by Cian Dorr, the same day
---
Let $G^{\bar\sigma t}$ be necessarily uniquely instantiated, and for a proposition $w$ put
$A_w:=\lambda\bar x\, .\,w\land G\bar x$. Then:

1. $\Box(\exists A_w\leftrightarrow w)$, so $\exists A_w=w$;
2. every $Z\le A_w$ is $A_{\exists Z}$, and $\exists Z\le w$;
3. $w$ is an atom, a strong atom or a self-atom iff $A_w$ is.

*Proof.* (1) $G$ is instantiated at every world. (2) Necessarily, if $Z\bar x$ then $A_w\bar x$,
so $G\bar x$ and $\exists Z$; conversely, if $\exists Z$ and $G\bar x$, then some $\bar y$ has
$Z\bar y$, so $G\bar y$, so $\bar y=\bar x$ by uniqueness, and $Z\bar x$. Intensionality gives
$Z=A_{\exists Z}$. (3) By (1) and (2), $q\mapsto A_q$ and $Z\mapsto\exists Z$ are inverse
monotone maps between the propositions below $w$ and the entities below $A_w$, with
$A_\bot=\bot$. So $w$ is an atom iff $A_w$ is. Since $G$'s unique instantiation is necessary,
by 4 the whole argument holds at every world, which gives the strong and self forms through
the characterization of strong atoms in [[atom-instance-proposition]] and clause (1).

Given [[intensional-choice-r|Intensional Choice]] at $\bar\sigma$ (polyadic form), such
copies exist below any $X^{\bar\sigma t}$ and any $w\le\exists X$: apply it to
$\lambda\bar x\, .\,w\to X\bar x$, which is necessarily instantiated, using
[[existence-r|Existence]] where $w$ is false, to get $G$ with $A_w\le X$. Taking $X$ an atom
and $w:=\exists X$, $A_w$ is non-bottom, so $X=A_{\exists X}$: under Intensional Choice
every atom is a copy of its instance proposition.
:::
