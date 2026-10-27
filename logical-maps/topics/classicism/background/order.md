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
\operatorname{Atom}_\tau(y)&:=\forall z^\tau\, .\,
  (z\le_\tau y\land z\ne y)\leftrightarrow z\le_\tau\neg_\tau z.
\end{aligned}
$$

Thus an atom is non-bottom and has no non-bottom strict lower bound.
These are the definitions of *Classicism*, §2.2, pp. 23–24.
:::

Boolean Completeness is stated with $\operatorname{GLB}$. The dual form,
with $\operatorname{LUB}_\tau(y,X):=\forall z^\tau\, .\,
(\forall w^\tau\, .\,Xw\to w\le_\tau z)\leftrightarrow y\le_\tau z$,
is equivalent to it in C, and some proofs in the map use that form: the greatest lower
bound of a property's upper bounds is its least upper bound, and dually
{lean: Classicism.lub_of_glb_ubs, Classicism.glb_of_lub_lbs}.
