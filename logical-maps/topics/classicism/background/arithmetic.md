# Cardinality, arithmetic and analysis

The Axiom of Infinity is stated with Frege's cardinality apparatus. At a type
$\sigma$, a *cardinality* is an entity of type $(\sigma t)t$, and:

$$
\begin{aligned}
\mathbf{0}_\sigma&:=\lambda X^{\sigma t}\, .\,\forall u^\sigma\, .\,\neg Xu,\\
\operatorname{Suc}_\sigma(Z)&:=\lambda X^{\sigma t}\, .\,\exists y^\sigma\, .\,
  Xy\land Z(\lambda u^\sigma\, .\,Xu\land u\ne y),\\
\operatorname{FiniteCardinality}_\sigma(Z)&:=\forall W^{((\sigma t)t)t}\, .\,
  \bigl(W\mathbf{0}_\sigma\land\forall Y\, .\,WY\to W(\operatorname{Suc}_\sigma Y)\bigr)\to WZ.
\end{aligned}
$$

So $\mathbf{0}_\sigma$ is the cardinality of the empty property,
$\operatorname{Suc}_\sigma$ adds one to a cardinality, and
$\operatorname{FiniteCardinality}_\sigma$ collects the cardinalities reached from
$\mathbf{0}_\sigma$ by finitely many successors, in the impredicative sense
that they fall under every property of cardinalities that holds of
$\mathbf{0}_\sigma$ and of a successor whenever it holds of the cardinality
succeeded. In C, $\mathbf{0}_\sigma$ and the successor of a finite cardinality are
finite cardinalities, and a finite cardinality that holds of a property holds of every
property coextensive with it
{lean: Classicism.finiteCardinality_zero, Classicism.finiteCardinality_suc, Classicism.finiteCardinality_coext}.
Every type used here ends
in $t$, so all of them are admitted, and no type $\sigma\sigma$ is needed;
that is why the axiom is not put in the Dedekind form, which would ask for an
injective non-surjective operation from $\sigma$ to $\sigma$.

Countable Boolean Completeness and the Necessity of Arithmetic follow
Goodsell, *Arithmetic is Necessary*, which leaves the type $\nu$ of numbers,
zero and successor as parameters. The map takes them, at each type $\sigma$,
to be $\nu_\sigma:=(\sigma t)t$, $\mathbf{0}_\sigma$ and
$\operatorname{Suc}_\sigma$, and states both principles as schemata in
$\sigma$; the paper displays the instance $\sigma=e$ in its eqs. (24)–(25)
without assuming it. Natural numberhood $\mathbb N_\sigma$ is then
$\operatorname{FiniteCardinality}_\sigma$. Write
$\forall n\in\mathbb N_\sigma\, .\,A$ for
$\forall n^{\nu_\sigma}\, .\,\mathbb N_\sigma n\to A$, and likewise for
$\exists$. With these, for a type $\sigma$ and a relational type $\tau$:

$$
\begin{aligned}
\operatorname{Ctbl}_{\sigma,\tau}(X)&:=\exists R^{\tau\nu_\sigma t}\, .\,\forall y^\tau z^\tau\, .\,
  Xy\land Xz\to\bigl((\exists n\in\mathbb N_\sigma\, .\,Ryn\land Rzn)\leftrightarrow y=z\bigr),\\
I^*_\sigma&:=\forall m\,n\in\mathbb N_\sigma\, .\,\mathbf{0}_\sigma\ne\operatorname{Suc}_\sigma m\land
  (\operatorname{Suc}_\sigma m=\operatorname{Suc}_\sigma n\to m=n),\qquad I_\sigma:=\Diamond I^*_\sigma,\\
\operatorname{Sum}_\sigma(m,n,o)&:=\forall R^{\nu_\sigma\nu_\sigma t}\, .\,R\mathbf{0}_\sigma m\to
  (\forall i\,j\in\mathbb N_\sigma\, .\,Rij\to R(\operatorname{Suc}_\sigma i)(\operatorname{Suc}_\sigma j))\to Rno,\\
\operatorname{Prod}_\sigma(m,n,o)&:=\forall R^{\nu_\sigma\nu_\sigma t}\, .\,R\mathbf{0}_\sigma\mathbf{0}_\sigma\to
  (\forall i\,j\,k\in\mathbb N_\sigma\, .\,Rij\to\operatorname{Sum}_\sigma(m,j,k)\to R(\operatorname{Suc}_\sigma i)k)\to Rno.
\end{aligned}
$$

So $X$ is countable (relative to $\sigma$) when it injects into the natural
numbers counted at $\sigma$, and $I_\sigma$ says that possibly zero is not a
successor and successor is injective on numbers. In C the first conjunct of
$I^*_\sigma$ is a theorem, since $\mathbf{0}_\sigma$ and a successor differ at
$\lambda x^\sigma\, .\,\bot$, and $I_\sigma$ and $I^*_\sigma$ are equivalent to each
other and to Potential Infinity at $\sigma$ ([[potential-infinity-forms]]). An *arithmetical sentence* at $\sigma$ is a
closed formula built from atomic formulas $\mathbb N_\sigma\mathbf n$,
$\operatorname{Sum}_\sigma(\mathbf m,\mathbf n,\mathbf o)$,
$\operatorname{Prod}_\sigma(\mathbf m,\mathbf n,\mathbf o)$ and $\mathbf m=\mathbf n$,
whose terms are variables of type $\nu_\sigma$, $\mathbf{0}_\sigma$ and
successors of terms, by $\neg$, $\lor$, $\land$ and quantifiers
$\forall v\in\mathbb N_\sigma$. These are Definitions 3–8 of Goodsell's
draft. Where the type is fixed by context the subscript $\sigma$ is dropped.

**Analysis.** A *real number structure* at a type $\sigma$ is a tuple
$\mathfrak R=(X^{\sigma t},\le^{\sigma\sigma t},+^{\sigma\sigma\sigma t},
\times^{\sigma\sigma\sigma t},0^\sigma,1^\sigma,N^{\sigma t})$ such that
$\le$, $+$ and $\times$ hold only of instances of $X$, $X$ with them and
with $0$ and $1$ is a complete ordered field, $+$ and $\times$ being
functional on $X$ and every nonempty subproperty of $X$ with an upper bound in $X$
having a least upper bound in $X$, and $N$ is the least subproperty of $X$
containing $0$ and closed under adding $1$; write
$\operatorname{Real}_\sigma(\mathfrak R)$. Any two real number structures,
at one type or at two, are isomorphic (Huntington), a theorem of the
non-modal fragment. A *first-order analytical sentence* is a closed formula
in the variables of a real number structure built from the atomic formulas
$x\le y$, $+(x,y,z)$, $\times(x,y,z)$, $Nx$ and $x=y$, whose terms are
variables of type $\sigma$, $0$ and $1$, by $\neg$, $\lor$, $\land$ and
quantifiers $\forall v\in X$; a *second-order analytical sentence* may also
use variables $R$ for relations of any finite arity among entities of type
$\sigma$, in atomic formulas $R\bar x$ and unrestricted quantifiers
$\forall R$. For a sentence $A$, $A(\mathfrak R)$ is its reading in
$\mathfrak R$. These follow Barton and Goodsell, *Continuum Contingency*,
§5.7, with the structure's elements in place of their rigid properties of
numbers, and Bacon's second-order analysis (*Could the truths of mathematics
have been different?*, Appendix C.2) without his restriction of the
second-order quantifiers to rigid properties, which makes no difference
under Rigid Comprehension (his Proposition C.3). The *continuum hypothesis*
$\operatorname{CH}(\mathfrak R)$ is the second-order analytical sentence
$\forall Y^{\sigma t}\, .\,(\forall x\, .\,Yx\to Xx)\to
(Y\precsim N\lor Y\approx X)$, where $Y\precsim Z$ says that some relation
is an injection from the $Y$s into the $Z$s and $Y\approx Z$ that some
relation is a bijection between them. A real number structure is *rigid*,
$\operatorname{RigidStr}(\mathfrak R)$, when $X$, $\le$, $+$, $\times$ and
$N$ are rigid and the instances of $X$ are necessarily distinct,
$\forall x\,y\in X\, .\,x\ne y\to\Box\,x\ne y$. A *represented power* of
arity $k$ for $X$, $\operatorname{RepPower}_k(\mathcal P,X)$, is a rigid
property $\mathcal P$ of rigid $k$-ary relations holding only of tuples of
instances of $X$, such that necessarily every $k$-ary relation agrees on
such tuples with an instance of $\mathcal P$:
$\operatorname{Rigid}(\mathcal P)\land
(\forall S\, .\,\mathcal PS\to\operatorname{Rigid}(S)\land\forall\bar y\, .\,S\bar y\to\textstyle\bigwedge_iXy_i)\land
\Box\forall R\,\exists S\, .\,\mathcal PS\land\forall\bar x\in X\, .\,(S\bar x\leftrightarrow R\bar x)$.

The schematic $\sigma$ is what lets the principles say what they intend
whatever the size of a given type. Where $\sigma$ necessarily has only
finitely many members, $\mathbb N_\sigma$ is finite, a property countable
relative to $\sigma$ is finite and so has a least upper bound in C, and
$I_\sigma$ is necessarily false; those instances are trivial.

::: lemma {#necessary-infinity-injective-successor}
title: necessary infinity makes successor injective
credit: Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 30 October 2026
---
At each type $\sigma$, $\Box\operatorname{AxInf}_\sigma\to\Box I^*_\sigma$, where
$\operatorname{AxInf}_\sigma$ is the Axiom of Infinity at $\sigma$: no finite cardinality holds
of $\lambda u^\sigma\, .\,\top$. So the boxed Axiom of Infinity at $\sigma$ is Barton and
Goodsell's Infinity, eq. (22), at $\sigma$, and discharges the antecedent of Arithmetic
Necessitism at $\sigma$.

*Proof.* The first conjunct of $I^*_\sigma$ is a theorem of C. By 4 it is enough to derive
injectivity at a world from $\Box\operatorname{AxInf}_\sigma$ there. Three facts about finite
cardinalities $Z$ are proved by induction along $\operatorname{FiniteCardinality}_\sigma$,
quantifying over the other variables:

1. $Z$ is $\mathbf 0_\sigma$ or $\operatorname{Suc}_\sigma Z'$ for a finite cardinality $Z'$.
2. $Z$ respects exchange: if $Xz$, $\neg Xy$ and $ZX$, then $Z$ holds of $X$ with $z$ replaced
   by $y$.
3. Hence, if $\neg Xy$, then $\operatorname{Suc}_\sigma Z$ holds of $X$ with $y$ added iff $ZX$.
   For the left-to-right direction, a witness $z\ne y$ is exchanged for $y$ by fact 2.

Finite cardinalities are necessarily finite cardinalities, and the three facts are theorems, so
they hold at every world. Now show, by induction on $m$, that $\operatorname{Suc}m=\operatorname{Suc}n$
gives $m=n$ for every finite cardinality $n$, using fact 1 for each of $m$ and $n$.

- *A zero and a successor of a successor.* $\operatorname{Suc}\mathbf 0$ holds of a singleton
  $\lambda x\, .\,x=a$ (Existence), and $\operatorname{Suc}\operatorname{Suc}n'$ does not.
- *Two successors of successors.* Suppose $\operatorname{Suc}\operatorname{Suc}m'=\operatorname{Suc}\operatorname{Suc}n'$.
  At any world and for any $X$:
  - if some $y$ has $\neg Xy$, fact 3 applied twice gives
    $\operatorname{Suc}m'X\leftrightarrow\operatorname{Suc}\operatorname{Suc}m'(X+y)\leftrightarrow
    \operatorname{Suc}\operatorname{Suc}n'(X+y)\leftrightarrow\operatorname{Suc}n'X$;
  - otherwise $X$ is coextensive with $\lambda u\, .\,\top$, and by $\operatorname{AxInf}_\sigma$
    at that world neither $\operatorname{Suc}m'$ nor $\operatorname{Suc}n'$ holds of it.

  So $\operatorname{Suc}m'$ and $\operatorname{Suc}n'$ are necessarily coextensive, hence identical
  by Intensionality, and the induction hypothesis gives $m'=n'$.

The box on the Axiom is used in the last case, at every world. $\square$
:::

**Potential infinity.** *Potential Infinity* at a type $\sigma$ says that every number counted at
$\sigma$ could be the number of some property's instances, so that for each number there could be at
least that many entities of type $\sigma$:

$$
\operatorname{PotInf}_\sigma:=\forall n\in\mathbb N_\sigma\, .\,\Diamond\exists X^{\sigma t}\, .\,nX.
$$

It is equivalent in C to $I^*_\sigma$ and to $I_\sigma$ ([[potential-infinity-forms]]), and its
necessitation is Barton and Goodsell's axiom of Infinity. The Axiom of Infinity at $\sigma$ implies
it, since then every number holds of some property outright. It is weaker: it holds wherever there
could be ever more entities of the type, whether or not any one possibility has infinitely many.

The *at-least numbers* at $\sigma$ are counted from
$\mathbf 0^{\ge}_\sigma:=\lambda X^{\sigma t}\, .\,\top$ by the same successor:
$\operatorname{LowerNat}_\sigma(Z):=\forall W^{((\sigma t)t)t}\, .\,
\bigl(W\mathbf 0^{\ge}_\sigma\land\forall Y\, .\,WY\to W(\operatorname{Suc}_\sigma Y)\bigr)\to WZ$.
Where $\mathbf 0_\sigma$ holds of the properties with no instance,
$\mathbf 0^{\ge}_\sigma$ holds of every property, and the $n$th at-least number holds of the
properties with at least $n$ instances. The at-least numbers are Bacon's: his formalization of the
cardinal continuum hypothesis counts with them, and its infinity premise is the Peano conditions on
them, his lower-Peano conditions, which are a form of Potential Infinity ([[at-least-numbers]]).

::: lemma {#finite-cardinality-arithmetic}
title: exchange, removal, addition and subproperties
lean: [Classicism.finiteCardinality_exchange, Classicism.finiteCardinality_remove, Classicism.finiteCardinality_add, Classicism.finiteCardinality_subset]
credit: Claude Fable 5.2 (Anthropic), prompted by Zachary Goodsell, 24 November 2026
---
In C, for a finite cardinality $Z$ at $\sigma$, properties $X,X^\prime$ and entities $a,b,y$ of
type $\sigma$:

1. *Exchange.* If $Xa$, $\neg Xb$ and $ZX$, then $Z$ holds of $X$ with $a$ replaced by $b$,
   $\lambda u\, .\,(Xu\land u\ne a)\lor u=b$.
2. *Removal.* If $\operatorname{Suc}_\sigma Z$ holds of $X$ and $Xy$, then $Z(X-y)$.
3. *Addition.* If $ZX$ and $\neg Xy$, then $\operatorname{Suc}_\sigma Z$ holds of $X$ with $y$ added,
   $\lambda u\, .\,Xu\lor u=y$.
4. *No proper subproperty has the same cardinality.* If $ZX$, $ZX^\prime$ and $X^\prime\subseteq X$,
   then $X\subseteq X^\prime$.

Part 1 is the second fact, and parts 2 and 3 the third, in the proof of
[[necessary-infinity-injective-successor]].

*Proof.* Throughout, a finite cardinality that holds of a property holds of every property
coextensive with it.

1. By induction on $Z$. For $\mathbf 0_\sigma$ there is nothing to show, $X$ having the instance
   $a$. Let $Z=\operatorname{Suc}Y$ with $Y$ finite and satisfying exchange, and let $Xy$ and $Y(X-y)$.
   If $y=a$, then $b$ is an instance of the new property, which less $b$ is coextensive with
   $X-a$, as $\neg Xb$. If $y\ne a$, then $a$ is an instance of $X-y$ and $b$ is not, so $Y$ holds of
   $X-y$ with $a$ replaced by $b$; and that is coextensive with the new property less $y$, since
   $b\ne y$. Either way $\operatorname{Suc}Y$ holds of the new property.
2. Let $Xz$ and $Z(X-z)$. If $z=y$ we are done. Otherwise $y$ is an instance of $X-z$ and $z$ is
   not, and $X-z$ with $y$ replaced by $z$ is coextensive with $X-y$; apply part 1.
3. The witness is $y$: the new property less $y$ is coextensive with $X$.
4. By induction on $Z$. For $\mathbf 0_\sigma$, $X$ has no instance. Let $Z=\operatorname{Suc}Y$, and
   let $X^\prime y$ and $Y(X^\prime-y)$. Then $Xy$, so $Y(X-y)$ by part 2, and
   $X^\prime-y\subseteq X-y$; by the induction hypothesis $X-y\subseteq X^\prime-y$. So an instance
   of $X$ is $y$ or an instance of $X^\prime-y$, and in either case an instance of $X^\prime$. $\square$
:::

::: lemma {#numbers-with-a-common-instance}
title: numbers that could hold of one property are identical
lean: [Classicism.finiteCardinality_eq_of_dia_common]
credit: Claude Fable 5.2 (Anthropic), prompted by Zachary Goodsell, 24 November 2026
---
In C, for $m,n\in\mathbb N_\sigma$: if $\Diamond\exists X^{\sigma t}\, .\,mX\land nX$, then $m=n$.

So numbers are identical whenever they could be the number of one and the same property, with no
assumption of infinity; that distinct numbers are necessarily distinct needs $\Box I^*_\sigma$.

*Proof.* By induction on $m$, for every number $n$; a number is $\mathbf 0_\sigma$ or the successor
of a number.

- $m=\mathbf 0$. If $n=\operatorname{Suc}k$, then no property has both cardinalities: the first
  allows it no instance and the second requires one. That is a theorem, so necessary, against the
  hypothesis. So $n=\mathbf 0$.
- $m=\operatorname{Suc}m^\prime$. Likewise $n$ is not $\mathbf 0$; let $n=\operatorname{Suc}k$, with $k$
  a number, necessarily so. Necessarily, if $\operatorname{Suc}m^\prime$ and $\operatorname{Suc}k$ both
  hold of $X$, then, for $y$ with $Xy$ and $m^\prime(X-y)$, also $k(X-y)$, by removal
  ([[finite-cardinality-arithmetic]]). So $\Diamond\exists X\, .\,m^\prime X\land kX$, and the
  induction hypothesis gives $m^\prime=k$, whence $m=n$. $\square$
:::

::: lemma {#potential-infinity-forms}
title: the forms of Potential Infinity
lean: [Classicism.iStar_of_potentialInfinity, Classicism.potentialInfinity_of_iStar, Classicism.potentialInfinity_of_dia, Classicism.potentialInfinity_of_axiomOfInfinity]
credit: Zachary Goodsell (that Potential Infinity is $I^*$, 24 November 2026); proofs by Claude Fable 5.2 (Anthropic), prompted by Zachary Goodsell
---
In C, at each type $\sigma$:

1. $\operatorname{PotInf}_\sigma\leftrightarrow I^*_\sigma$.
2. $\Diamond\operatorname{PotInf}_\sigma\to\operatorname{PotInf}_\sigma$. Hence $I_\sigma$, which is
   $\Diamond I^*_\sigma$, is equivalent to both, and none of the three is possible without being
   true.
3. $\operatorname{AxInf}_\sigma\to\operatorname{PotInf}_\sigma$, where $\operatorname{AxInf}_\sigma$
   is the Axiom of Infinity at $\sigma$.

Their necessitations are theorems too, so $\Box\operatorname{PotInf}_\sigma$ is equivalent to
$\Box I^*_\sigma$ and follows from $\Box\operatorname{AxInf}_\sigma$
(compare [[necessary-infinity-injective-successor]]), and $\Diamond\operatorname{AxInf}_\sigma$
gives $\operatorname{PotInf}_\sigma$.

*Proof.* 1, left to right. The first conjunct of $I^*_\sigma$ is a theorem. Let $m,n$ be numbers
with $\operatorname{Suc}m=\operatorname{Suc}n$. By $\operatorname{PotInf}_\sigma$ at
$\operatorname{Suc}m$, possibly $\operatorname{Suc}m$ holds of some $X$. Necessarily
$\operatorname{Suc}m=\operatorname{Suc}n$ and $n$ is a number, so there $\operatorname{Suc}n$ holds of
$X$ too, and for $y$ with $Xy$ and $m(X-y)$ we have $n(X-y)$ by removal. So
$\Diamond\exists X\, .\,mX\land nX$, and $m=n$ ([[numbers-with-a-common-instance]]).

1, right to left. By induction, every number $n$ has $\Diamond\exists X\, .\,nX$. The empty property
has cardinality $\mathbf 0$. Suppose $\Diamond\exists X\, .\,kX$ but not
$\Diamond\exists X\, .\,\operatorname{Suc}kX$, for a number $k$. Then necessarily no property has
cardinality $\operatorname{Suc}k$, and so necessarily none has cardinality
$\operatorname{Suc}\operatorname{Suc}k$, since such a property less a suitable instance has
cardinality $\operatorname{Suc}k$. So $\operatorname{Suc}k$ and $\operatorname{Suc}\operatorname{Suc}k$
are necessarily coextensive, hence identical (Intensionality), and $k=\operatorname{Suc}k$ by
$I^*_\sigma$. But $k$ possibly holds of some property, and $\operatorname{Suc}k$ cannot.

2. If $n$ is a number and $\neg\Diamond\exists X\, .\,nX$, then necessarily $n$ is a number, and
necessarily $\neg\Diamond\exists X\, .\,nX$ by 4. So necessarily $\operatorname{PotInf}_\sigma$
fails. For $I_\sigma$: $\Diamond I^*_\sigma$ gives $\Diamond\operatorname{PotInf}_\sigma$ by the
necessitation of part 1, so $\operatorname{PotInf}_\sigma$, so $I^*_\sigma$, which gives
$\Diamond I^*_\sigma$ by T.

3. By induction every number holds of some property. The empty property has cardinality
$\mathbf 0$. If $kX$, then $X$ is not coextensive with $\lambda u\, .\,\top$, of which no number holds;
so $\neg Xy$ for some $y$, and $\operatorname{Suc}k$ holds of $X$ with $y$ added, by addition
([[finite-cardinality-arithmetic]]). $\square$
:::

::: lemma {#at-least-numbers}
title: the Peano conditions on the at-least numbers
lean: [Classicism.lowerPeano_of_iStar, Classicism.iStar_of_lowerPeano]
credit: Andrew Bacon with GPT-6 Astra Pro (OpenAI), 28 October 2026 (that the conditions on the at-least numbers imply $I^*_\sigma$, and the correspondence between the numbers and the at-least numbers; Lean-verified as exactPeano_of_lowerPeano and exactLowerBijection_of_lowerPeano in pull request 19 of the map's repository); the converse, and the proof given here, by Claude Fable 5.2 (Anthropic), prompted by Zachary Goodsell, who suggested that the lower-Peano conditions are Potential Infinity (24 November 2026)
---
In C, at each type $\sigma$, $I^*_\sigma$ is equivalent to the same conditions on the at-least
numbers,

$$
\forall m\,n\in\operatorname{LowerNat}_\sigma\, .\,\mathbf 0^{\ge}_\sigma\ne\operatorname{Suc}_\sigma m\land
(\operatorname{Suc}_\sigma m=\operatorname{Suc}_\sigma n\to m=n),
$$

so these are a form of Potential Infinity ([[potential-infinity-forms]]), and their necessitation,
Bacon's necessary lower-Peano, of its necessitation.

*Proof.* For a cardinality $n$ let $n^{\ge}:=\lambda X\, .\,\exists X^\prime\subseteq X\, .\,nX^\prime$,
at least $n$. Each identity below holds by Intensionality, the two sides being necessarily
coextensive.

- $\mathbf 0^{\ge}=\mathbf 0^{\ge}_\sigma$: every property includes the empty property.
- $(\operatorname{Suc}n)^{\ge}=\operatorname{Suc}(n^{\ge})$ for a number $n$. If $X^\prime\subseteq X$,
  $X^\prime y$ and $n(X^\prime-y)$, then $Xy$ and $X^\prime-y\subseteq X-y$. If $Xy$,
  $X^\prime\subseteq X-y$ and $nX^\prime$, then $X^\prime$ with $y$ added is included in $X$ and has
  cardinality $\operatorname{Suc}n$, by addition ([[finite-cardinality-arithmetic]]).
- So $n^{\ge}$ is an at-least number for every number $n$, and every at-least number is $n^{\ge}$ for
  some number $n$, by the two inductions.
- $n=\lambda X\, .\,n^{\ge}X\land\neg\operatorname{Suc}(n^{\ge})X$ for a number $n$: exactly $n$ is at
  least $n$ and not at least its successor. If $nX$, then $X$ includes itself, and no $X^\prime\subseteq
  X-y$ with $Xy$ has $nX^\prime$, by part 4 of [[finite-cardinality-arithmetic]]. Conversely let
  $X^\prime\subseteq X$ with $nX^\prime$: either $X\subseteq X^\prime$, and $nX$, or some instance $y$
  of $X$ is not one of $X^\prime$, and then $X^\prime\subseteq X-y$ and $\operatorname{Suc}(n^{\ge})X$.
  Hence $m^{\ge}=n^{\ge}$ implies $m=n$, for numbers $m,n$.

Now $\mathbf 0^{\ge}_\sigma$ differs from every successor at the empty property. Given $I^*_\sigma$
and at-least numbers $m^{\ge},n^{\ge}$ with the same successor,
$(\operatorname{Suc}m)^{\ge}=(\operatorname{Suc}n)^{\ge}$, so
$\operatorname{Suc}m=\operatorname{Suc}n$, so $m=n$ and $m^{\ge}=n^{\ge}$. Conversely, given the conditions on the at-least
numbers and numbers $m,n$ with $\operatorname{Suc}m=\operatorname{Suc}n$,
$\operatorname{Suc}(m^{\ge})=\operatorname{Suc}(n^{\ge})$, so $m^{\ge}=n^{\ge}$, so $m=n$. $\square$
:::

**Weakly inextensible numbers.** The numbers at $\sigma$ are persistent in C: a number is
necessarily a number {lean: Classicism.finiteCardinality_box}. They need not be inextensible. A
possible world may have numbers that are not ours, and then what is necessarily true of each
of our numbers need not be true of every number there. $\mathbb N_\sigma$ is *weakly
inextensible* ([[weak-rigidity-predicates]]) when
$\forall X\, .\,(\forall n\in\mathbb N_\sigma\, .\,\Box Xn)\to\Box\forall n\in\mathbb N_\sigma\, .\,Xn$.
Equivalently, a number that could have some feature is one of our numbers that could have it:
$\Diamond\exists n\in\mathbb N_\sigma\, .\,Xn\to\exists n\in\mathbb N_\sigma\, .\,\Diamond Xn$.
Arithmetic Necessitism at $\sigma$ says that $\Box I^*_\sigma$ makes the numbers rigid, which
includes this at every world.

::: lemma {#weakly-inextensible-numbers}
title: Countable Boolean Completeness makes the numbers weakly inextensible
lean: [Classicism.Proofs.finiteCardinality_weaklyInextensible_of_cbc, Classicism.Proofs.finiteCardinality_weaklyInextensible_of_rc]
credit: Claude Fable 5.2 (Anthropic), prompted by Zachary Goodsell, 25 November 2026; from Rigid Comprehension, Barton and Goodsell's Theorem 3 as proved for the map by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr
---
In C, Countable Boolean Completeness at $\sigma$ and $\tau=((\sigma t)t)t$ gives
$\operatorname{WeaklyInextensible}(\mathbb N_\sigma)$. So do Boolean Completeness, Weak Rigid
Comprehension and Rigid Comprehension, which imply it; Rigid Comprehension also does so directly.

*Proof.* Write $H_n:=\lambda x^{(\sigma t)t}\, .\,x=n$ for the haecceity of a cardinality. The
haecceities of the numbers, $\lambda Y\, .\,\exists n\in\mathbb N_\sigma\, .\,Y=H_n$, are
countable relative to $\sigma$: the relation $Y=H_n$ between $Y$ and $n$ witnesses it. Let $Z$ be
their least upper bound.

- For each number $n$, $H_n\le Z$, that is, $\Box Zn$. In particular $\Box Z\mathbf 0_\sigma$.
- $\lambda x\, .\,Z(\operatorname{Suc}_\sigma x)$ is an upper bound of the haecceities too, since
  $\Box Z(\operatorname{Suc}n)$ for each number $n$. So $Z$ lies below it: necessarily, $Z$ is
  closed under successor.
- So necessarily every number is $Z$, by the induction the numbers provide: $\mathbb N_\sigma\le Z$.
- If $\Box Xn$ for each number $n$, then $X$ is an upper bound of the haecceities, so $Z\le X$,
  and $\mathbb N_\sigma\le X$. $\square$
:::

::: lemma {#potential-infinity-and-possible-infinity}
title: weakly inextensible numbers carry Potential Infinity to Possible Infinity at type t
lean: [Classicism.possibleInfinity_of_weaklyInextensible, Classicism.counts_bounded, Classicism.reach_comparable]
credit: Zachary Goodsell (the argument, 24–25 November 2026); the role of weak inextensibility, and the proof as written out, by Claude Fable 5.2 (Anthropic), prompted by Zachary Goodsell
---
In C: if $\mathbb N_t$ is weakly inextensible, then
$\operatorname{PotInf}_t\to\Diamond\operatorname{AxInf}_t$.

*Proof.* Write $U$ for $\lambda p^t\, .\,\top$, so that $nU$ says that there are exactly $n$
propositions, and say that $b$ is *reached from* $a$ when $b$ has every property of cardinalities
that $a$ has and that passes to successors. Suppose $\operatorname{PotInf}_t$ and, for a
contradiction, that necessarily some number holds of $U$.

1. *Every possible count is one of our numbers.* For a number $b$, Potential Infinity gives
   $\Diamond\exists X\, .\,bX$; there some number holds of $U$; so by weak inextensibility some
   number $n$ of ours has $\Diamond(nU\land\exists X\, .\,bX)$.
2. *The possible counts are bounded.* Claim: for a property $Y$ of propositions with a finite
   cardinality, some number $b$ is reached from $\operatorname{Suc}n$ for every number $n$ with
   $\Diamond nU$ and $Y(nU)$. By induction on the cardinality. If $Y$ has no instance, any $b$ will
   do. Otherwise remove an instance $p$ and take a bound $b^\prime$ for the rest. If $p$ is
   $sU$ for a number $s$ with $\Diamond sU$, then $s$ is the only such number, numbers that could
   hold of one property being identical ([[numbers-with-a-common-instance]]); of two numbers one
   is reached from the other, so take whichever of $b^\prime$ and $\operatorname{Suc}s$ is reached
   from the other. If $p$ is no such proposition, keep $b^\prime$. Now apply the claim to $U$
   itself, which some number holds of: some $b$ is reached from $\operatorname{Suc}n$ for every
   number $n$ with $\Diamond nU$.
3. *Contradiction.* By step 1 at that $b$, some number $n$ has $\Diamond(nU\land\exists X\, .\,bX)$,
   and $b$ is reached from $\operatorname{Suc}n$, necessarily so. At such a world a property with
   cardinality $b$ has a subproperty with cardinality $\operatorname{Suc}n$, though $U$, which
   includes it, has cardinality $n$: impossible, since no proper subproperty has the same finite
   cardinality ([[finite-cardinality-arithmetic]]). $\square$

Weak inextensibility is used in step 1 only, and the argument does not go through without it:
that every possible world has finitely many propositions gives each a count that is a number
there, and the propositions $nU$ of step 2 are indexed by our numbers. At type $e$ nothing
of the kind holds, the propositions that there are exactly $n$ individuals being no obstacle
to there being finitely many individuals.
:::
