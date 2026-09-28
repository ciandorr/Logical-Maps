# Finite-support action model: N and N×2, sections and projection

This model shows that Actuality, and even □Actuality, does not imply
Inextensible Comprehension. It was found by Claude Opus 5.5 (Anthropic) on
27 September 2026, in a session with Cian Dorr, and checked informally the
same day by Cian Dorr and Christopher Sun. No Lean verification is claimed.

## The model

It is an ideally full, finitely pinned action model in the sense of
*Classicism*, Appendix D (Definitions D.1–D.3, pp. 73–74). The Appendix D
construction applies to any category of sets and functions, and p. 79 uses
it for a two-object category. The pinning sets are the finite sets of
individuals. The category has two objects:

- $W_0$, with individuals $\mathbb N$;
- $W_1$, with individuals $\mathbb N\times\{0,1\}$.

It has these arrows:

| From | To | Arrows |
| --- | --- | --- |
| $W_0$ | $W_0$ | only the identity |
| $W_0$ | $W_1$ | the sections $f_T(n)=(n,T(n))$, one for each $T:\mathbb N\to\{0,1\}$ |
| $W_1$ | $W_0$ | the projection $\pi(n,i)=n$ |
| $W_1$ | $W_1$ | the identity, and the retractions $e_T:=f_T\circ\pi$, which send $(n,i)$ to $(n,T(n))$ |

The arrows compose as follows:

$$\pi\circ f_T=1_{W_0},\qquad e_T\circ f_U=f_T,\qquad e_T\circ e_U=e_T,\qquad \pi\circ e_T=\pi.$$

So they form a category. The evaluation point is $1_{W_0}$. The worlds
reachable from it are $1_{W_0}$ and the sections $f_T$:
- every $f_T$ returns to $1_{W_0}$ by $\pi$;
- every $f_T$ reaches every $f_U$ by $e_U$.

Write $k\cdot r$ for the transport of an entity $r$ along an arrow $k$. For
a property $Y$, write $Y(k)$ for its extension at the world $k$.
- A formula with parameters $\bar r$ holds at the world $k$ iff it holds at
  the identity of $k$'s target with parameters $k\cdot\bar r$. So
  $(k\cdot Y)(g)=Y(g\circ k)$.
- $Y$ is pinned down by a finite set $S$ iff any two arrows with a common
  target that agree on $S$ transport it alike.
- $Y\le Z$ at the identity of an object means $Y(g)\subseteq Z(g)$ for every
  arrow $g$ out of that object.

## A sufficient condition

The model was found by looking for a failure of the following sufficient
condition. The condition holds in every earlier model with Actuality.

**Lemma.** Consider an ideally full, finitely pinned action model in which
Actuality holds at the evaluation point, witnessed by $w$. Let $X$ be a
relation there with extension $A$. Define an intension by setting
$Y_X(k)=k(A)$ when $\Diamond w$ holds at the world $k$, and $Y_X(k)=\emptyset$
otherwise.

If $Y_X$ is finitely pinned, then it is an inextensible relation
coextensive with $X$.

*Proof.*
- **Coextension.** $Y_X(1)=A$.
- **Composition.** $Y_X(g\circ k)=g(Y_X(k))$ for all $k$ and $g$.
  - If $\Diamond w$ holds at $g\circ k$, it holds at $k$, and both sides are
    images of $A$.
  - Otherwise the left side is empty.
- **Inextensibility at a world $k$.** Suppose $Z$ holds necessarily of every
  instance of $Y_X$ there. Then $Z$ contains the pointwise hull
  $g\mapsto g(Y_X(k))$, which is the transported $Y_X$ itself. So $Y_X\le Z$.
  $\square$

For instance, in the truncated-shift and bicyclic monoids, $Y_\top$ is "at
least the image of $0$", pinned down by $\{0\}$. So a countermodel needs
arrows with three features:
- they can return to $w$;
- they agree on arbitrarily large finite sets;
- they have different images of $A$.

The sections $f_T$ are the simplest such arrows.

## Actuality and □Actuality

**At $W_0$.** Let $w:=\{1_{W_0}\}$, the proposition that the target is
$W_0$.
- It is pinned down by $\emptyset$, since the identity is the only arrow into
  $W_0$ from $W_0$.
- Every true proposition contains the identity, so $w\le q$ for every true
  $q$.

So $w$ witnesses Actuality.

**At $W_1$.** The proposition $\{1_{W_1}\}$ is pinned down by
$\{(0,0),(0,1)\}$: no retraction $e_T$ fixes both points, and $\pi$ has a
different target. By the same argument, it witnesses Actuality at the
identity of $W_1$.

So Actuality is true at every world reachable from the evaluation point,
and □Actuality holds there.

## Failure of BF

For each $T$, let $F$ be the intension given by:
- $F(1_{W_0})=\mathbb N$;
- $F(f_T)=(\mathbb N\times\{0,1\})\setminus\{(0,1-T(0))\}$.

It is pinned down by $\{0\}$. Every individual $n$ necessarily has $F$,
since $f_T(n)=(n,T(n))$. But $\forall x\, .\,Fx$ fails at $f_T$. So BF fails
at type $e$, as it must: BF and Actuality together imply Inextensible
Comprehension.

## Failure of Inextensible Comprehension

Take $X=\top_e$ at $W_0$, the universal property. Suppose, for
contradiction, that $Y$ is an inextensible property with $Y(1)=\mathbb N$,
pinned down by a finite $S\subseteq\mathbb N$. The sections agreeing on $S$
are the $f_T$ with $T$ fixed on $S$. So pinning gives:

$$T|_S=T'|_S\ \Longrightarrow\ Y(f_T)=Y(f_{T'}).\tag{P}$$

**Step 1: $Y(f_T)\subseteq\operatorname{graph}(T)$.** For each finite $S'$,
define $Z_{S'}$ by:
- $Z_{S'}(1)=\mathbb N$;
- $Z_{S'}(f_T)=\bigcup\{\operatorname{graph}(T'):T'|_{S'}=T|_{S'}\}$.

This $Z_{S'}$ is pinned down by $S'$, and every individual $n$ necessarily
has it, since $f_T(n)\in\operatorname{graph}(T)$. Weak inextensibility at
the evaluation point then gives $Y\le Z_{S'}$, so
$Y(f_T)\subseteq Z_{S'}(f_T)$ for every $S'$.

If $i\ne T(n)$, any $S'$ containing $n$ excludes $(n,i)$. So the
intersection of these sets is $\operatorname{graph}(T)$.

**Step 2: $\mathbb N\subseteq\pi(Y(f_T))$.** At the world $f_T$ the
transported property $f_T\cdot Y$ has extension $Y(f_T)$. Take $Z$ at $W_1$
with:
- $Z(1_{W_1})=Z(e_U)=\mathbb N\times\{0,1\}$ for every $U$;
- $Z(\pi)=\pi(Y(f_T))$.

This $Z$ is pinned down by $\emptyset$:
- the arrows into $W_1$ agree on $\emptyset$, and $Z$ is constant on them
  after any further arrow;
- the only arrow into $W_0$ is $\pi$.

$Z$ holds necessarily of every instance of $f_T\cdot Y$. By the leading box
of inextensibility, $f_T\cdot Y\le Z$. At $\pi$ this reads:

$$Y(\pi\circ f_T)=Y(1)=\mathbb N\subseteq\pi(Y(f_T)).$$

**Step 3.** Step 2 says $Y(f_T)$ meets every fibre $\{n\}\times\{0,1\}$.
Step 1 says it meets each fibre at most at $(n,T(n))$. So
$Y(f_T)=\operatorname{graph}(T)$ for every $T$.

Now take $T\ne T'$ that agree on $S$. Then (P) gives
$Y(f_T)=Y(f_{T'})$, while Step 3 gives
$\operatorname{graph}(T)\ne\operatorname{graph}(T')$. This is a
contradiction, so Inextensible Comprehension fails.

Weak inextensibility at the evaluation point holds, as Actuality requires.
The witness is $\lambda z\, .\,w\land z=z$, whose extension is empty at
every section. The failure comes only through the leading box, at the worlds
$f_T$.

## Remarks

- **What goes wrong.** The property "old", holding at $f_T$ of the range of
  $f_T$, is exactly what an inextensible $Y$ would have to track. No finite
  set of individuals pins it down.
- **Principles that fail by derivation.** Since Actuality holds and
  Inextensible Comprehension fails, the recorded results make these fail:
  BF, C5, Distinctness-preserving collapse and Rigid Comprehension.
- **□ND.** It fails directly as well, since $\pi$ collapses $(n,0)$ and
  $(n,1)$.
