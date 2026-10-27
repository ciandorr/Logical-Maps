# Boolean structure and the algebraic order

At a relational type $\tau$, Boolean operations are defined pointwise.
The order is algebraic entailment,
$X\le_\tau Y$ iff $Y=X\lor_\tau Y$, rather than material implication.
At $t$ this is equivalent to $\Box(X\to Y)$; at a relation type it is
equivalent to the necessary universal closure of the pointwise implication.

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
is equivalent to it in C, and some proofs in the map use that form.
