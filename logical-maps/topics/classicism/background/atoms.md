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
