# Symmetric ideally-full model: a one-point entrance to the qualitative-links tail

Construction and verification by GPT-6 Astra (OpenAI), prompted by Daniel Kodsi,
22 October 2026; checked and rewritten for the map by Claude Opus 5.5
(Anthropic), prompted by Cian Dorr, 24 October 2026.

The model is a member of the group of symmetric ideally-full models, recorded with one
individual at each object, as Astra built it. (The group's variant with the base as
individuals is not generated: the base at the evaluation object is the single point $*$.)

At its evaluation point this model satisfies Atomicity, Rigid Comprehension (hence
Boolean Completeness and Tame Rigidity), Relational Choice, Weakly Rigid Power (hence
Rigid Power) and □Strong Actuality, and fails □Tame Rigidity, BF (at $t$, and at every
relational type), ND (at $t$) and Strong Atomicity (at $t$, and at
every relational type). So Rigid Comprehension and Weakly Rigid Power, even with the
rest, do not make Tame Rigidity necessary.

## The model

It is a symmetric ideally-full model in the sense of Dorr, *Boolean Completeness does
not imply Rigid Comprehension*, Definitions 15–18, p. 8, a model of C by its
Proposition 20.

**The tail $B$.** Take the pinning base, monoid $M$ of arrows and symmetry group $G$ of
[the qualitative-links model with one individual](symmetric-qualitative-links-individuals-singleton.html),
and add one point $d$, fixed by every arrow and every symmetry and in the image of no
other point. Agreement on $d$ is automatic, so pinning and symmetry, and hence every
domain at $B$, are as in that model.

**The entrance $A$.** An object with pinning base $\{*\}$, trivial symmetry group, and
one arrow $i:A\to B$, sending $*$ to $d$. Then $m\circ i=i$ for every $m\in M$, there are
no arrows from $B$ to $A$, and the only arrow from $A$ to itself is its identity.

There is one individual at each object, and $d$ is a pinning point only. Every relational
constant of Σ denotes the top element of its type. Evaluation point: $1_A$.

## 1. The entities at $A$

The arrows out of $A$ are $1_A$ and $i$ (as $m\circ i=i$). So an intension at $A$ of a
relational type is determined by two sets: $E$, its extension at $1_A$, a set of tuples
from $A$'s domains, and $S$, its extension at $i$, a set of tuples from $B$'s. Symmetry
at $i$ says $S=gS$ for every $g\in G$, as $g\circ i=i$; and the empty set pins it. So

$$
\text{the entities at }A\text{ are exactly the pairs }(E,S)\text{ with }S\ G\text{-invariant.}
\tag{1}
$$

Transport along $i$ sends $(E,S)$ to the intension at $B$ that is $S$ at every arrow, a
*constant* intension, fixed by every arrow out of $B$.

Write $i\cdot E$ for the set of transports along $i$ of the tuples in $E$, and
$T_A(E):=(E,\,i\cdot E)$; it is an entity by (1), its tuples being fixed by $G$.
Similarly, at $B$, for a set $D$ of tuples fixed by every arrow, $T_B(D)$ is the constant
intension $D$.

## 2. Rigid Comprehension

**Lemma 1.** $T_A(E)$ is rigid, and so is $T_B(D)$.

*Proof.* At every arrow the extension of $T_A(E)$ is the image of $E$, so it is
persistent. Suppose $Z$ necessarily holds of every tuple in $E$: then $E\subseteq Z_{1_A}$
and $i\cdot E\subseteq Z_i$, so $T_A(E)\le Z$. At $B$, a test necessarily holding of the
current tuples of the constant $i\cdot E$ holds of them at every arrow, these tuples
being fixed by every arrow; so $i\cdot T_A(E)$ is weakly inextensible there too. The
same argument applies to $T_B(D)$. $\square$

So every relation at $A$, with extension $E$, has the rigid coextension $T_A(E)$.

## 3. Atomicity and Relational Choice

By (1), at each relational type the entities at $A$ form the algebra

$$
\mathcal P(\text{tuples at }A)\times\{\text{unions of }G\text{-orbits of tuples at }B\},
$$

ordered componentwise: a complete atomic Boolean algebra, whose atoms are the
$(\{\bar x\},\varnothing)$ and the $(\varnothing,O)$ for $O$ a $G$-orbit. So Atomicity
holds at $A$.

For a relation $U$ serial at $A$, choose (in the metatheory) a value $y_x$ for each input
$x$; the pair $(\{\langle x,y_x\rangle\},\varnothing)$ is an entity by (1), and it is a
functional subrelation of $U$ at $A$. So Relational Choice holds at $A$.

## 4. Weakly Rigid Power

Let $F$ be weakly rigid at $A$. By Rigid Comprehension and Sun's lemma (coextensive
weakly rigid relations are identical), $F=T_A(E)$ for its extension $E$. Let

$$
P_F:=\lambda Y\, .\,\operatorname{WeaklyRigid}(Y)\land Y\le F .
$$

*At $A$*, by the same argument, its instances are the $T_A(E')$ with $E'\subseteq E$.

*At $B$*, after $i$: if $Y$ is weakly rigid there and $Y\le i\cdot F$, the constant
$i\cdot E$, then its extension $D$ is a subset of $i\cdot E$, so of tuples fixed by every
arrow; $T_B(D)$ is rigid (Lemma 1) and coextensive with $Y$, so $Y=T_B(D)$. And
$T_B(D)=i\cdot T_A(E_D)$ for $E_D:=\{\bar x\in E:i\cdot\bar x\in D\}$.

So the extension of $P_F$ at $i$ is the image of its extension at $1_A$: $P_F$ is
$T_A$ of its extension, rigid by Lemma 1, and so weakly rigid.

## 5. □Tame Rigidity fails

The tail fails Tame Rigidity at type $(t\to t)\to t$, by the argument recorded for the
qualitative-links model with one individual. The domains at $B$ are those of that model,
$d$ being a pinning point only, and the entrance adds no arrow out of $B$, so the same relation refutes Tame Rigidity at
$B$. As $B$ is reachable from $A$, □Tame Rigidity fails at $A$.

## 6. Strong Actuality; BF, ND and Strong Atomicity fails

The propositions at $A$ are the four pairs $(a,b)$ of truth values, and their
transports to $B$ are $\bot$ or $\top$. Let $r:=(\top,\bot)$, the proposition true at $A$
only.

*□Strong Actuality.* $r$ is a true atom at $A$, and its transport $\bot$ decides every
proposition at $B$, so $r$ is a strong atom at $A$ entailing every truth. At $B$, the
tail's strong true atom does the same (the tail satisfies □Strong Actuality). So
Strong Actuality holds at both objects.

*BF at $t$ fails.* Let $Q(p):=r\lor p=\top\lor p=\bot$. Every proposition $p$ at $A$ has
$\Box Q(p)$: $Q(p)$ is true at $A$ by $r$, and at $B$ since $i\cdot p\in\{\bot,\top\}$. But
$\Box\forall p\, .\,Q(p)$ fails, since at $B$, where $r$ is false, the tail has a
contingent proposition.

*ND at $t$ fails.* $r\ne\bot$ at $A$, while $i\cdot r=\bot=i\cdot\bot$.

*Strong Atomicity at $t$ fails.* $\neg r=(\bot,\top)$ is an atom at $A$ with transport $\top$
at $B$, which a contingent proposition of the tail splits; so it is not a strong atom,
and no strong atom lies below it.

The relational forms fail too: through $p\mapsto\lambda\bar x\, .\,p$ and back by
universal quantification, BF or Strong Atomicity at a relational type would give it at
$t$.

## Remark

Nothing in §§1–4 or §6 uses the particular tail: a one-point entrance to any one-object
symmetric ideally-full model with one individual has Atomicity, Rigid Comprehension,
Relational Choice and Weakly Rigid Power, and fails the necessitation of every closed
principle that fails in the tail.

## Paper references

- **Background: Boolean Completeness does not imply Rigid Comprehension.** Dorr, Cian. Boolean Completeness does not imply Rigid Comprehension. Unpublished draft in progress, 30 July 2026, 27 pages. All page, proposition and lemma locators for this source refer to that draft. Parts of the draft were drafted with AI assistance; its mathematical claims are attributed to the author. — Definitions 15–18, p. 8; Proposition 20. Symmetric ideally-full models, of which this is one.
