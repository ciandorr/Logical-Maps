# Boolean structure and the algebraic order

At a relational type $\tau$, Boolean operations are defined pointwise.
The order is algebraic entailment,
$X\le_\tau Y$ iff $Y=X\lor_\tau Y$, rather than material implication.
At $t$ this is equivalent to $\Box(X\to Y)$; at a relation type it is
equivalent to the necessary universal closure of the pointwise implication
{lean: Classicism.le_iff_prop, Classicism.le_iff_arrow}. So $\le_\tau$ is a partial
order: reflexive and transitive because necessary pointwise implication is, and
antisymmetric by [[intensionality-r|Intensionality]]
{lean: Classicism.le_refl_rel, Classicism.le_trans_rel, Classicism.le_antisymm_rel}.
At $t$, $\bot\le p\le\top$, and $p\land q$ and $p\lor q$ are the greatest lower and least
upper bounds of $p$ and $q$
{lean: Classicism.bot_le_prop, Classicism.le_top_prop, Classicism.and_le_left_prop, Classicism.and_le_right_prop, Classicism.le_and_prop, Classicism.le_or_left_prop, Classicism.le_or_right_prop};
at every relational type $\bot_\tau\le X$, and $X\le\neg_\tau X$ only when $X=\bot_\tau$
{lean: Classicism.bot_le_rel, Classicism.eq_bot_of_le_neg_rel}. An entailment, if true, is
necessary: $X\le Y\to\Box(X\le Y)$, since $\le$ is boxed inclusion, by [[modal-four|4]]
{lean: Classicism.box_le_rel}.

::: definition {#lattice-predicates}
title: lattice predicates
---
The lattice predicates used in the principles are:

$$
\begin{aligned}
\operatorname{LB}_\tau(y,X)&:=\forall z^\tau\, .\,Xz\to y\le_\tau z,\\
\operatorname{GLB}_\tau(y,X)&:=\forall z^\tau\, .\,
  \operatorname{LB}_\tau(z,X)\leftrightarrow z\le_\tau y,\\
\operatorname{UB}_\tau(y,X)&:=\forall z^\tau\, .\,Xz\to z\le_\tau y,\\
\operatorname{LUB}_\tau(y,X)&:=\forall z^\tau\, .\,
  \operatorname{UB}_\tau(z,X)\leftrightarrow y\le_\tau z,\\
\operatorname{Atom}_\tau(y)&:=\forall z^\tau\, .\,
  (z\le_\tau y\land z\ne y)\leftrightarrow z\le_\tau\neg_\tau z.
\end{aligned}
$$

Thus an atom is non-bottom {lean: Classicism.not_le_neg_of_atom, Classicism.atom_ne_false} and has no
non-bottom strict lower bound.
$\operatorname{LB}$, $\operatorname{GLB}$ and $\operatorname{Atom}$ are the definitions of
*Classicism*, §2.2, pp. 23–24; $\operatorname{UB}$ and $\operatorname{LUB}$ are their duals.
:::

So $y$ is a lower (upper) bound of $X$ when it entails (is entailed by) every member of $X$,
and a greatest lower (least upper) bound when the lower (upper) bounds of $X$ are exactly what
entails it (what it entails).

::: lemma {#glb-neg-lub}
title: greatest lower bounds and least upper bounds
lean: [Classicism.glb_neg_iff_lub, Classicism.lb_neg_iff_ub_neg]
---
At a relational type $\tau$, the negation of a least upper bound of $X$ is a greatest lower
bound of the negations of the members of $X$, and conversely:
$\operatorname{GLB}_\tau(\neg_\tau y,\lambda w\, .\,X(\neg_\tau w))\leftrightarrow
\operatorname{LUB}_\tau(y,X)$.

*Proof.* Negation reverses $\le_\tau$, since necessary pointwise implication contraposes, and
$\neg_\tau\neg_\tau z=z$ by [[intensionality-r|Intensionality]]
{lean: Classicism.neg_le_neg_rel, Classicism.neg_neg_rel}. Hence $z\le_\tau\neg_\tau y$ iff
$y\le_\tau\neg_\tau z$, and $z$ is a lower bound of the negations of the members of $X$ iff
$\neg_\tau z$ is an upper bound of $X$. So the lower bounds of $\lambda w\, .\,X(\neg_\tau w)$
are exactly the entities below $\neg_\tau y$ iff the upper bounds of $X$ are exactly the
entities above $y$. $\square$
:::

The greatest lower bound of a property's upper bounds is also its least upper bound, and dually
{lean: Classicism.lub_of_glb_ubs, Classicism.glb_of_lub_lbs}.

Classicism does not entail that any relational type $\tau$ forms a *complete* or an *atomic*
Boolean algebra, though these claims can consistently be added: see
[[boolean-completeness-r|Boolean Completeness]] and [[atomicity-r|Atomicity]].
