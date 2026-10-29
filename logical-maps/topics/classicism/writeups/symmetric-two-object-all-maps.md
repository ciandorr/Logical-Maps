# Symmetric ideally-full model: ℕ and a point, all maps

Cian Dorr's symmetric version (29 October 2026) of the two-object model of *Classicism*, Appendix D, p. 79,
which is recorded as finite-support-two-object-all-maps. Verification by Claude Opus 5.5 (Anthropic), prompted
by Cian Dorr, 29 October 2026.

At $W_0$ the model satisfies:

- Boolean Completeness at every relational type;
- □Boolean Completeness (type $t$);
- BF.

It does not satisfy:

- □BF (type $t$);
- Atomicity (type $t$);
- Actuality;
- Relational Choice.

It witnesses the separation BC (type $t$) + BF ⇏ □BF (type $t$) of GPT-6 Astra's Ω-valued cofinite-interior
model (Daniel Kodsi's pull request #18, item 20), within the symmetric ideally-full framework.

## The model

- **Objects and arrows.** There are two objects, $W_0$ with base $\mathbb N$ and $W_1$ with base $\{0\}$, and the arrows are all maps between the bases. Write $!$ for the arrow $W_0\to W_1$ and $c_n$ for the arrow $W_1\to W_0$ with value $n$.
- **Symmetry groups.** The symmetry group is $\operatorname{Sym}(\mathbb N)$ at $W_0$ and trivial at $W_1$.
- **Pinning.** Both objects carry the ideal of finite sets.
- **Evaluation point.** $1_{W_0}$.

## The propositions

**At $W_0$.**

- A proposition $p$ is symmetric, so it is closed under left composition by permutations. It is pinned down by a finite $S$, so membership of a map $f:\mathbb N\to\mathbb N$ depends only on $f|_S$.
- Together, membership depends only on which points of $S$ the map $f$ identifies. So $p$ is a set of partitions of $S$, together with a bit for $!$.
- The part over $W_0$ is atomless: a nonempty set of patterns on $S$ splits by patterns on $S\cup\{a\}$ for a fresh $a$, which can join any block or start a new one.
- $\{!\}$ is an atom, but it is false.
- So Atomicity (type $t$) and Actuality fail at $W_0$.

**At $W_1$.** Symmetry forces $c_n\in p\iff c_{gn}\in p$. So there are four propositions: whether $1_{W_1}$ is in $p$, and whether all the $c_n$ or none of them are.

## Boolean Completeness

Dorr's hull conditions hold with $M_0=\varnothing$, so the group's argument boolean-completeness applies at
$W_0$, at every relational type.

- **(B1).** Every map $\mathbb N\to\mathbb N$ is an arrow, so prescriptions that agree on $P\cap Q$ splice. There is only one arrow into $W_1$.
- **(B2).** A permutation fixing $N$ pointwise moves the finitely many points of $P$ outside $N$ off $Q$.

So BC holds at $W_0$. At $W_1$, BC (type $t$) holds because there are four propositions, so it holds at every
world: □BC (type $t$).

## BF at $W_0$

Suppose $\forall x\,\Box Fx$ at $W_0$, with $F$ pinned down by a finite $S$. Let $h$ be an arrow out of $W_0$
and $y$ an entity at its target, pinned down by $M$.

- Choose an arrow $h'$ agreeing with $h$ on $S$ that is surjective. The target's base is $\mathbb N$ or $\{0\}$, and a map can be changed off a finite set.
- By the section construction of the group's argument barcan-surjective, $y=h'\cdot x$ for some symmetric, finitely pinned $x$ at $W_0$.
- So $y$ is in $F_{h'}$, which is $F_h$ by pinning.

## BF fails at type $t$ at $W_1$

- Along any $c_n$, the four propositions at $W_1$ transport to $\varnothing$, $\{!\}$, $\operatorname{Hom}(W_0,W_0)$, and $\operatorname{Hom}(W_0,W_0)\cup\{!\}$.
- Let $F$ have, at $1_{W_1}$, all four propositions, and at each $c_n$, those four transports.
- $F$ is pinned down by $\varnothing$, and it is symmetric, since a permutation fixes the four transports. So every proposition at $W_1$ necessarily has $F$.
- But at $c_0$, the proposition $\{f:f(0)=f(1)\}$ at $W_0$ doesn't.
- So BF (type $t$) fails at $W_1$, which $W_0$ sees, and □BF (type $t$) fails at $W_0$.
