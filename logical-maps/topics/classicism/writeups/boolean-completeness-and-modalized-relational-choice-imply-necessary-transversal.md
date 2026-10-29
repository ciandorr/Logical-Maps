# Boolean Completeness and Modalized Relational Choice imply □Transversal

The theorem and its proof are due to GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, in a
research note of 26 October 2026 in Daniel Kodsi's pull request #18. The presentation
below, keyed to the Bourbaki–Witt lemma of the Background, is by Claude Opus 5.5
(Anthropic), prompted by Cian Dorr, 28 October 2026.

**Claim.** Let $\sigma$ be any type, including $e$, and put $\rho:=\sigma t$. In C, Boolean
Completeness at type $\rho t$ (for properties of properties of type $\rho$) together with
Modalized Relational Choice at $(\rho t,\rho)$ proves □Transversal at $\sigma$. Both
premises are unboxed.

The unboxed Transversal already followed: Modalized Relational Choice implies Relational
Choice, which with Boolean Completeness implies Actuality, which implies Transversal. What
is new is that a single property of properties is a transversal *necessarily*.

**The idea.** Grow a necessarily partial transversal by adding, wherever a coextension
class is missed, one member of it chosen by a necessarily functional selector. Partial
transversals are compared by $\le$, which is antisymmetric, and Boolean Completeness
supplies joins of chains, which are again necessarily partial transversals. The
Bourbaki–Witt lemma then gives a fixed point $m$, and since the growth step is a single
operation, $m$ is *identical* to its own extension. That identity, unlike a coextension
at the actual world, holds at every world, and it is what rules out a missed class
anywhere.

## Set-up

Write $x\equiv y$, for $x,y$ of type $\rho$, when $x$ and $y$ are coextensive. It is a
theorem of C that $\equiv$ is an equivalence relation, so it is necessarily one. For
$B^{\rho t}$ let

$$
(\Gamma B)x:=\forall y\, .\,By\land x\equiv y\to x=y .
$$

Unpacking $\le$ as necessary inclusion,

$$
A\le\Gamma B\quad\text{iff}\quad\Box\forall x\,y\, .\,Ax\land By\land x\equiv y\to x=y. \tag{1}
$$

The right side is symmetric in $A$ and $B$, since $\equiv$ is necessarily symmetric, so
$A\le\Gamma B$ iff $B\le\Gamma A$. Also $\Gamma$ is antitone: if $A\le B$ then
$\Gamma B\le\Gamma A$. Call $Y^{\rho t}$ *separated* if $Y\le\Gamma Y$, that is, if
necessarily no two distinct instances of $Y$ are coextensive.

**The selector.** Modalized Relational Choice at $(\rho t,\rho)$ gives, as in the proof of
Modalized Relational Choice ⇒ □Modalized Relational Choice, an $S^{(\rho t)\rho t}$ such
that necessarily, for every $P^{\rho t}$, exactly one $y$ has $(SP)y$, and it is an instance
of $P$ if $P$ has one. (Apply the principle to $\lambda P\,y\, .\,Py\lor\neg\exists z\,.\,Pz$,
which is necessarily serial.)

**The step.** For $Y^{\rho t}$ let

$$
\mathrm{Miss}_Y:=\lambda y\, .\,\neg\exists x\, .\,Yx\land x\equiv y,\qquad
D_Y:=\lambda y\, .\,\mathrm{Miss}_Yy\land(S\,\mathrm{Miss}_Y)y,\qquad
\Phi Y:=Y\lor D_Y .
$$

So $D_Y$ is necessarily instantiated by at most one thing, and is necessarily instantiated
whenever $\mathrm{Miss}_Y$ is. $\Phi$ is given by a closed term, so it is a single operation
on properties.

## Applying the Bourbaki–Witt lemma

Use the lemma (Background, *Relations, orders and fixed points*) in its special case for
partial orders, at type $\rho t$, with

- $X$: the separated properties;
- $R$: $\le$, restricted to them;
- $F$: the graph of $\Phi$, so that $(FY)Z$ iff $Z=\Phi Y$.

The lemma gives a separated $m$ with $\Phi m=m$. This $m$ witnesses □Transversal. By
$\Phi m=m$, $D_m\le m$. But also $D_m\le\mathrm{Miss}_m$, and necessarily nothing is both an
instance of $m$ and missed by $m$, since $\equiv$ is reflexive. So $D_m=\bot$: necessarily
$D_m$ has no instance. Hence necessarily $\mathrm{Miss}_m$ has no instance, that is,
necessarily every property of type $\rho$ is coextensive with some instance of $m$. With
separation, necessarily every property is coextensive with exactly one instance of $m$, and
so necessarily $m$ witnesses Transversal at $\sigma$.

It remains to check the lemma's hypotheses.

## Hypothesis 1: $\le$ partially orders the separated properties

$\le$ is reflexive, transitive and antisymmetric on all properties of type $\rho t$, by the
Boolean algebra laws of C.

## Hypothesis 2: every chain of separated properties has a supremum among them

Let $Z$ be a property of separated properties totally ordered by $\le$. By Boolean
Completeness at $\rho t$, $Z$ has a least upper bound $J$ under $\le$ (the greatest lower
bound of its upper bounds). It is enough to show that $J$ is separated: it is then a
supremum in $X$.

First, for $A$ and $B$ in $Z$, $A\le\Gamma B$. If $A\le B$, then $A\le B\le\Gamma B$. If
$B\le A$, then $A\le\Gamma A\le\Gamma B$, since $\Gamma$ is antitone. So for each $B$ in $Z$,
$\Gamma B$ is an upper bound of $Z$, and $J\le\Gamma B$. By the symmetry of (1),
$B\le\Gamma J$ for every $B$ in $Z$. So $\Gamma J$ is an upper bound of $Z$, and
$J\le\Gamma J$. (The empty chain has supremum $\bot$, which is separated.)

## Hypothesis 3: $\Phi$ is progressive

$Y\le\Phi Y$ by its form, and $F$ is functional, so it remains to show that $\Phi Y$ is
separated when $Y$ is. By (1), it suffices that necessarily, if $x$ and $y$ are coextensive
instances of $\Phi Y$, then $x=y$. If both are instances of $Y$, this is the separation of
$Y$. If both are instances of $D_Y$, they are identical, since $D_Y$ has at most one
instance. If $x$ is an instance of $Y$ and $y$ of $D_Y$, then $y$ is missed by $Y$, so it is
coextensive with no instance of $Y$, contradicting $x\equiv y$; and symmetrically.

## Remarks

Only the actual world is used in applying the lemma: the separated properties, the chain
and its join are all taken there. The modal strength comes from three places: separation
and $\le$ are boxed by definition, the selector $S$ is necessarily functional, and the
fixed point is an identity of entities.

With the result that Modalized Relational Choice implies its necessitation, Astra derives further
consequences recorded through other results: □Relational Choice and □Transversal give
□Transversal Choice, hence □Well-Ordering, and with Intensional Choice, Modal
Well-Ordering. Astra's note also shows that Modal Well-Ordering at $\sigma$ follows from
Boolean Completeness at $(\sigma t)t$ and Modalized Relational Choice at $((\sigma t)t,\sigma t)$
alone, by a conforming well-order defined uniformly from a necessarily functional choice.
