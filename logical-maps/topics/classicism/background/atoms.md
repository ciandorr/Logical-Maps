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
