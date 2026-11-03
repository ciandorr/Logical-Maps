# Supported model over Cantor space with diagonal tail permutations

The construction and its verdicts are due to GPT-6 Astra (OpenAI), prompted by Cian Dorr, on
30 October 2026. Astra was answering a brief by Claude Opus 5.5 (Anthropic) on whether Intensional
Choice implies Transversal. Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, checked it and adapted
this text. No independent checker or Lean verification is recorded.

The model satisfies:

- C5;
- □BF;
- □Boolean Completeness (type $t$);
- □Atomlessness;
- □Intensional Choice;
- Vicinity.

Transversal fails at type $t$, as do Actuality and Relational Choice. So Intensional Choice does not
imply Transversal, even with all those principles together.

The model belongs to the group of supported S5 components, like
[the supported Boolean-complete model's component](transversal-supported-boolean-component.md). There
Transversal holds, because the symmetry group is all of $\operatorname{Aut}(\mathrm{RO}(2^\omega))$. Two
facts about that group give every coextension class a canonical representative:

- supports intersect;
- an entity is determined on a whole cell of its support by its restriction to any nonzero piece.

Here the group is much smaller. It is still rich enough for finite attainment, which closes the domains
under the quantifiers and gives Intensional Choice by compactness. But an entity's support is fixed only
by permutations that act *in the same way* in every cell, and that obstructs canonical representatives.

## The construction

Let $W=2^{\mathbb N}$, with coordinates numbered from $1$, and let $B$ be its algebra of clopen sets. For a
finite binary string $s$, write $[s]$ for its cylinder.

- **The group.** $\Gamma_r$ is the finite group of all permutations of the strings of length $r$, acting
  on the first $r$ coordinates and trivially on the rest. Under the natural inclusions,
  $\Gamma=\bigcup_r\Gamma_r$ is a group of homeomorphisms of $W$.
- **The diagonal tail groups.** For each $n$, $K_n\le\Gamma$ consists of the maps
  $s^\frown z\mapsto s^\frown h(z)$ ($|s|=n$, $h\in\Gamma$): the same transformation $h$ of the tail in
  every cylinder of length $n$. Then
  $$K_{n+1}\subseteq K_n,\qquad [\Gamma_r,K_n]=1\quad(n\ge r).\tag{1}$$
- **The domains.** An entity is *supported at level $n$* if $K_n$ fixes it. Take $D_e=\{*\}$ and
  $D_t=B$, and for a relational type $\bar\sigma t$
  $$D_{\bar\sigma t}=\Bigl\{F:\textstyle\prod_iD_{\sigma_i}\to B\;:\;K_n\text{ fixes }F\text{ for some }n\Bigr\},
  \qquad(g\cdot F)(\bar a)=g\bigl(F(g^{-1}\cdot\bar a)\bigr).$$
  For the empty argument list this gives $B$ itself, since every clopen set depends on finitely many
  coordinates. The domains are $\Gamma$-stable: if $K_m$ fixes $F$ and $g\in\Gamma_r$, then for
  $n\ge m,r$, $K_n$ fixes $g\cdot F$ by (1).
- **The action model.** The objects are the points of $W$, with exactly one arrow between any two. The
  single individual is fixed by every arrow, and transport is the identity on the domains. The intension
  of $F$ has at the arrow ending at $w$ the extension $\{\bar a:w\in F(\bar a)\}$.

In the terms of the group, the support points are $B$ together with the cosets $\Gamma/K_n$. The
stabiliser of the coset $K_n$ is $K_n$ itself. Conversely, the pointwise stabiliser of a finite set of
support points contains some $K_N$: if $g\in\Gamma_r$, then $K_N\subseteq gK_ng^{-1}$ for $N\ge n,r$, by
(1), and a clopen set depending on the first $r$ coordinates is fixed by $K_N$ for $N\ge r$. So being
supported by a finite set of support points is being fixed by some $K_n$. The fibres are clopen, so the
condition stone-worlds holds.

## A model of C

Every $K_n$-orbit is dense in its cylinder of length $n$, because $\Gamma$ acts transitively on the
strings of each length. Hence:

$$\text{every }K_n\text{-invariant open subset of }W\text{ is a union of cylinders of length }n.\tag{2}$$

If such a set meets a cylinder, it contains a point of that cylinder whose orbit is dense in the
cylinder, so by openness and invariance it contains every point of the cylinder.

- **Quantifiers.** Let $F\in D_{\sigma t}$ be fixed by $K_n$. Then $\exists x\,Fx$ has the value
  $\bigcup_{a\in D_\sigma}F(a)$. This set is open, and it is $K_n$-invariant because $K_n$ permutes
  $D_\sigma$ and $F$ is equivariant. By (2) it is a finite union of cylinders, so it is clopen.
  $\forall$ follows by complementation. With further free arguments, fix them and take a common level
  for them and for $F$; the resulting relation is fixed by $K_n$, quantification being equivariant.
- **Term-forming operations.** The Boolean operations preserve support. So do application and
  currying, after passing to a common level, which exists because the $K_n$ are nested. Abstraction
  preserves support because the logical operations are equivariant.
- **Identity** is strict, with values $W$ and $\varnothing$. This agrees with Leibniz identity, because
  the crisp singleton of an entity $a$ is supported wherever $a$ is.

So the domains contain the denotations of all terms, and the structure is an action model of C.
$\Box p$ is $W$ if $p=W$ and $\varnothing$ otherwise. Identity is rigid, and the domains and transport
are constant, so C5 and □BF hold. Atomlessness holds because $B$ is atomless. Actuality fails because no
point has a least clopen neighbourhood. Vicinity holds with $\top$ as witness: every true proposition is
nonempty, so it is necessarily possible.

## Intensional Choice

This is the group's compactness argument. Let $F\in D_{\sigma t}$ be necessarily instantiated, so that
$W=\bigcup_aF(a)$. By compactness, $W=F(a_1)\cup\dots\cup F(a_k)$ for some $a_1,\dots,a_k$. Disjointify,
taking $c_i:=F(a_i)\setminus\bigcup_{j<i}F(a_j)$, and let $G(a):=\bigcup\{c_i:a_i=a\}$. The finitely many
$a_i$ and $c_i$ have a common level, which supports $G$. $G$ lies below $F$ and has exactly one instance
at every world. So □Intensional Choice holds at every type.

## Transversal fails at type $t$

Fix $w=000\cdots$. For $g\in\Gamma$, let $F_g(p):=g^{-1}[p]$. If $g\in\Gamma_r$, then $K_r$ fixes $F_g$,
by (1). Its extension at $w$ is given by $w\in F_g(p)\iff g(w)\in p$.

Suppose $K_n$ fixes $\Phi\in D_{(tt)t}$ and $\Phi$ witnesses Transversal at $w$. Let $g$ flip coordinate
$n+1$, and $v:=g(w)$. Let $Y$ be the unique $\Phi$-selected property coextensive with $F_g$ at $w$, so
that

$$w\in Y(p)\iff v\in p\qquad(p\in B).\tag{3}$$

**Step 1: $Y$ is fixed by the elements of $K_n$ that fix $w$ and $v$.** Let
$L:=\{h\in K_n:h(w)=w,\ h(v)=v\}$. Each $h\in L$ fixes $\Phi$ and $w$, so $h\cdot Y$ is also selected at
$w$. It also satisfies (3), because $h(v)=v$. By uniqueness, $h\cdot Y=Y$.

**Step 2: an element fixing $Y$ and $w$ but moving $v$.** Choose $m\ge n+1$ such that $K_m$ fixes $Y$. Let
$k\in K_m$ flip coordinate $m+1$, and put $w':=k(w)$, $v':=k(v)$. All four points lie in $[0^n]$, and
their tails after coordinate $n$ begin as follows, with $j:=m-n$:

| point | tail prefix |
|---|---|
| $w$ | $0^{j+2}$ |
| $v$ | $10^{j+1}$ |
| $w'$ | $0^j10$ |
| $v'$ | $10^{j-1}10$ |

Let $l\in K_n$ apply, in every cylinder of length $n$, the transposition of the tail prefixes
$10^{j-1}10$ and $10^{j-1}11$. Then $l$ fixes $w$, $v$ and $w'$ and moves $v'$, so $l\in L$. Since $k$ and
$l$ both fix $Y$, so does $s:=k^{-1}lk$. Moreover $s(w)=w$ and $s(v)\ne v$.

**Step 3: the contradiction.** Applying $s\cdot Y=Y$ to (3) gives, for every clopen $p$,
$$v\in p\iff w\in Y(p)\iff w\in Y(s^{-1}p)\iff v\in s^{-1}p\iff s(v)\in p.$$
Clopen sets separate the points of Cantor space, so $s(v)=v$, a contradiction.

So Transversal fails at $w$, at type $t$.

## Boolean Completeness at type $t$, necessarily

Fix a world $u=a^\frown z$ with $|a|=n$, and $X\in D_{tt}$ fixed by $K_n$. The extension of $X$ at $u$ is
$S:=\{b:u\in X(b)\}$, which is invariant under $H:=K_n\cap\operatorname{Stab}(u)$.

**Density.** In each cylinder $[b]$ of length $n$, $H$ fixes $b^\frown z$, and every other point
$b^\frown y$ has an $H$-orbit dense in $[b]$. To see this, take a target cylinder. At a long enough
level $R$, the prefixes of $y$ and $z$ differ, and the target contains a string $t$ of length $R$ other
than $z{\restriction}R$. The transposition of $y{\restriction}R$ and $t$ fixes $z{\restriction}R$.

**The least upper bound.** The union $O:=\bigcup S$ is open and $H$-invariant. If it meets a cylinder of
length $n$, it contains a point there other than the fixed one, so by density its closure contains the
whole cylinder. So $\overline O$ is a finite union of such cylinders, hence clopen, and it is the least
clopen upper bound of $S$. Greatest lower bounds follow by complementation, $\lambda p\,.\,X(\neg p)$
being in the domain. This is Boolean Completeness for the properties in the domain; the clopen algebra
itself is not complete.

## Relational Choice fails

Let $R(p,q):=(p\land q\land q<p)\lor(\neg p\land q=\bot)$, a closed term. It is serial at every world,
because a true clopen proposition has a proper clopen part containing that world. Suppose a functional
$S\le R$ at $u$ is fixed by $K_n$, and let $p$ be the cylinder of length $n$ containing $u$. The unique
$q$ with $S(p,q)$ at $u$ is fixed by $H=K_n\cap\operatorname{Stab}(u)$, since $H$ fixes $S$, $p$ and $u$.
But by density an $H$-invariant clopen part of $p$ is empty or all of $p$, so it cannot be a proper true
part of $p$.

## Paper references

- **Background: Classicism.** Bacon, Andrew, and Cian Dorr (2024). Classicism. In Peter Fritz and Nicholas K. Jones (eds), Higher-Order Metaphysics, Oxford University Press, pp. 109–190. The map was built from the draft dated 16 May 2023, 87 pages, which does not differ materially from the published version; all page, proposition and footnote locators in this map refer to that draft's numbering. — §3.5, pp. 58–61. Action models.
