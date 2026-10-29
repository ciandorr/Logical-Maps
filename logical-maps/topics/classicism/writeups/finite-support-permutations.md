# Second-Order Analytic Necessitism in the finite-support permutation model

Construction and verification by Claude Fable 5.1 (Anthropic), prompted by Zachary Goodsell,
23 October 2026, for the model finite-support-permutations: the one-object ideally full action
model of *Classicism*, Proposition D.5, part 1, whose arrows are the permutations of $\mathbb N$,
with the ideal of finite sets, and its generated variants (one individual; Σ true atom). It shows
that Second-Order Analytic Necessitism, and so Analytic Necessitism, hold there, although Rigid
Comprehension fails: a rigid real number structure need not be made of rigid properties of
numbers.

## Setting

Write $G$ for the arrows, the permutations of $\mathbb N$. An entity of a relational type at the
one object is an intension $Y$, assigning to each arrow $j$ a set $Y_j$ of tuples of entities of
its argument types; $Y$ holds of a tuple $\bar a$ at the arrow $k$ iff $k\cdot\bar a\in Y_k$, and
transport along $k$ is $(k\cdot Y)_j:=Y_{j\circ k}$. The intension $Y$ is *pinned down by* a
finite $N\subseteq\mathbb N$ when $Y_j=Y_{j'}$ whenever $j$ and $j'$ agree on $N$, and the
domain of each relational type consists of the intensions pinned down by some finite set
(finitely-pinned-domains). The individuals are $\mathbb N$, acted on by the arrows, or in the
variant a single individual fixed by every arrow; in either case $k\cdot$ is a bijection of every
domain, with inverse $k^{-1}\cdot$, since $k^{-1}\cdot(k\cdot Y)=Y$.

Rigidity is as in the Background: $\operatorname{Rigid}(X)$ is
$\Box\forall x\,.\,(Xx\to\Box Xx)\land(\neg Xx\to\Box\neg Xx)$, which at the evaluation point
says that for all arrows $k,j$ and all $x$, $k\cdot x\in X_k$ iff $(j\circ k)\cdot x\in
X_{j\circ k}$.

**Lemma 1.** An intension $X$ is rigid iff $X_j=j\cdot X_1$ for every arrow $j$, where
$j\cdot X_1=\{j\cdot x:x\in X_1\}$; a rigid $X$ then has necessarily distinct instances, and at
every arrow $k$ it holds of exactly the members of $X_1$.

*Proof.* If $X$ is rigid, the clause at $k=1$ gives $x\in X_1$ iff $j\cdot x\in X_j$, so
$X_j\supseteq j\cdot X_1$, and for $z\in X_j$, $z=j\cdot(j^{-1}\cdot z)$ with $j^{-1}\cdot z\in
X_1$, so $X_j\subseteq j\cdot X_1$. Conversely if $X_j=j\cdot X_1$ for all $j$, then $k\cdot
x\in X_k$ iff $x\in X_1$ iff $(j\circ k)\cdot x\in X_{j\circ k}$, transport being injective.
Necessary distinctness is the injectivity of transport, and at $k$, $X$ holds of $x$ iff $k\cdot
x\in k\cdot X_1$ iff $x\in X_1$. $\blacksquare$

The same holds for relations, with tuples in place of $x$.

## The structure

Fix a relational type $\sigma=\bar\tau t$ and a tuple $\bar u$ of entities of types $\bar\tau$.
For $A\subseteq\mathbb N$ let $Y^A$ be the intension of type $\sigma$ with $Y^A_j:=\{\bar u\}$ if
$j0\in A$ and $Y^A_j:=\emptyset$ otherwise. It is pinned down by $\{0\}$, so in the domain, the
$Y^A$ are pairwise distinct, and $(k\cdot Y^A)_j=Y^A_{j\circ k}$ is $\{\bar u\}$ iff $j(k0)\in A$,
so $k\cdot Y^A$ is pinned down by $\{k0\}$, its value at $j$ depending only on $j(k0)$.
Let $P:=\{Y^A:A\subseteq\mathbb N\}$ and fix a bijection $\beta\colon P\to\mathbb R$, through the
bijection of the sets of natural numbers with the reals (a theorem of ZF).

Define the intensions
$$X_j:=j\cdot P,\qquad
{\le}_j:=\{(j\cdot x,j\cdot y):x,y\in P,\ \beta x\le\beta y\},\qquad
{+}_j:=\{(j\cdot x,j\cdot y,j\cdot z):\beta x+\beta y=\beta z\},$$
$\times_j$ likewise, $N_j:=\{j\cdot x:\beta x\in\mathbb N\}$, and the entities
$0:=\beta^{-1}(0)$ and $1:=\beta^{-1}(1)$ of $P$.

**Lemma 2.** These intensions are in the domain, pinned down by $\{0\}$.

*Proof.* $j\cdot Y^A$ depends on $j$ only through $j0$, so each of $X_j$, $\le_j$, $+_j$,
$\times_j$ and $N_j$ depends only on $j0$. $\blacksquare$

**Lemma 3.** $\mathfrak R:=(X,\le,+,\times,0,1,N)$ is a rigid real number structure, necessarily
a real number structure: $\operatorname{RigidStr}(\mathfrak R)\land\Box\operatorname{Real}_\sigma
(\mathfrak R)$ holds at the evaluation point.

*Proof.* By construction $X_j=j\cdot X_1$ and likewise for the relations, so by Lemma 1 all are
rigid with necessarily distinct instances, and at every arrow $k$ the instances of $X$ are the
members of $P$, while $x\le y$ holds at $k$ iff $(k\cdot x,k\cdot y)\in{\le}_k$ iff $\beta x\le
\beta y$, and similarly for $+$, $\times$ and $N$. So at every arrow the structure is the
$\beta$-preimage of the real numbers on $P$: an ordered field with $+$ and $\times$ functional,
in which $N$ is the set of natural numbers. Completeness at $k$: a subproperty $Y$ of $X$ bounded
at $k$ has as instances there a set $\{x:k\cdot x\in Y_k\}\subseteq P$ bounded in the
$\beta$-order, whose least upper bound in the reals pulls back to a least upper bound in $P$. And
$N$ is the least inductive subproperty at $k$: its instances contain $0$ and are closed under
adding $1$, and any subproperty inductive at $k$ contains them, the natural numbers being the
least inductive subset of the reals. $\blacksquare$

## Represented powers

For $m\ge1$ and $E\subseteq P^m$ let $\rho(E)$ be the relation of type $\sigma^m t$ with
$\rho(E)_j:=j\cdot E=\{(j\cdot x_1,\ldots,j\cdot x_m):\bar x\in E\}$. It is pinned down by
$\{0\}$ (Lemma 2), rigid by Lemma 1 with $\rho(E)_j=j\cdot\rho(E)_1$, holds at every arrow of
exactly the tuples in $E$, which are tuples of instances of $X$, and $k\cdot\rho(E)=\rho(k\cdot
E)$, since $(k\cdot\rho(E))_j=(j\circ k)\cdot E=j\cdot(k\cdot E)$.

Let $\mathcal P^0:=\{\rho(E):E\subseteq P^m\}$ and define $\mathcal P_m$ of type $(\sigma^m t)t$
by $(\mathcal P_m)_k:=k\cdot\mathcal P^0$. Then $(\mathcal P_m)_k=\{\rho(E'):E'\subseteq(k\cdot
P)^m\}$ depends on $k$ only through $k0$, so $\mathcal P_m$ is in the domain; it is rigid by
Lemma 1, and at every arrow it holds of exactly the members of $\mathcal P^0$, rigid relations
holding only of tuples of instances of $X$. Representation: at an arrow $k$ and for any relation
$R$ of type $\sigma^m t$, let $E:=\{\bar x\in P^m:k\cdot\bar x\in R_k\}$. Then $\rho(E)\in\mathcal
P^0$, so $\mathcal P_m$ holds of it at $k$, and for $\bar x\in P^m$, $\rho(E)$ holds of $\bar x$
at $k$ iff $\bar x\in E$ iff $R$ holds of $\bar x$ at $k$. So
$\operatorname{RepPower}_m(\mathcal P_m,X)$ holds for every $m$, and with Lemma 3 the consequent
of Second-Order Analytic Necessitism holds at $\sigma$ for every $n$.

## Type $e$

At type $e$ the antecedent fails: a real number structure of individuals would need continuum
many individuals at some world, and the individuals are the natural numbers, or one, at the only
object. So every instance of Second-Order Analytic Necessitism holds, and with it Analytic
Necessitism. The interpretation of Σ plays no part.

## Remark

The construction uses only that the arrows form a group acting on the pinning points and that
every finitely pinned intension is present; it does not use the full strength of the
permutation group. The other finite-support models were once recorded as failing Analytic
Necessitism, because some arrow identifies two points and no entity of type $tt$ is determined by
its transport along it. That argument was withdrawn on 29 October 2026. A rigid carrier only needs
to be transported injectively, and the constant intensions, fixed by every arrow, give one in each
of them (the general argument analytic-necessitism-codomain-fixed). So Analytic Necessitism holds
there as well.
