# Framework and conventions

## Classicism

The fixed background is **Classicism (C)** of Andrew Bacon and Cian Dorr,
using the paper's **relational type system**. Its base types are $e$ and $t$.
Form $\sigma\tau$ from admitted types only when $\tau\ne e$: every
function type ends in $t$. Thus $et$, $tt$ and $(et)t$ are admitted,
while $ee$ and $(ee)t$ are not. Individuals of type $e$ remain available
as arguments and quantified objects.

Use the definition in *Classicism*, §1.3: C is the smallest H-theory containing
Logical Equivalence. This schema identifies $\lambda$-abstractions of formulas
equivalent in H. Its theoremhood side condition must be preserved when
reasoning from additional assumptions.

This is the type system called R in *Classicism*, §1.1. It is fixed
throughout the map, so principle names omit a type-system suffix.

## Notation

Types associate to the right: $\sigma\tau\rho$ means
$\sigma\to(\tau\to\rho)$. Application also associates to the right:
$fgx=f(gx)$. Write $(fx)y$ for curried application. A dot separates a
binder from its scope. The abbreviation $X[\bar x]$ means explicitly
left-nested application to the displayed tuple; it is $X$ for an empty tuple.
For a finite, possibly empty, tuple of types $\bar\sigma=\sigma_1\ldots\sigma_n$,
$\bar\sigma\rho$ is the type $\sigma_1\cdots\sigma_n\rho$ (so $\bar\sigma t$ is
$\sigma_1\cdots\sigma_n t$), and $\bar x^{\bar\sigma}$ gives $x_i$ the type $\sigma_i$.
A tuple quantifier $\forall\bar x$ or $\exists\bar x$ binds $x_1,\ldots,x_n$ one at a
time; $\bar x=\bar y$ is the conjunction of the identities $x_i=y_i$ (true for the empty
tuple), and $\bar x\ne\bar y$ is its negation. With tuples in place of single
arguments, the definitions below are read in the evident way; for instance
$\operatorname{Serial}(U):=\forall\bar x^{\bar\sigma}\, .\,\exists y^\tau\, .\,(U[\bar x])y$
for $U^{\bar\sigma\tau t}$, and $\operatorname{Equiv}(R)$ for $R^{\bar\sigma\bar\sigma t}$
uses $(R[\bar x])[\bar y]$.

::: definition {#shorthands}
title: common shorthands
---
For relations $X,Y$ of a type $\bar\sigma t$, and the evaluation point unless a box is
written:

- $X\subseteq Y$ (*$X$ is included in $Y$*, a *subrelation* of $Y$) abbreviates
  $\forall\bar z\, .\,X[\bar z]\to Y[\bar z]$; this is actual inclusion, and
  $X\le Y$ is $\Box(X\subseteq Y)$ ([[order]]).
- $X\equiv Y$ (*$X$ and $Y$ are coextensive*) abbreviates
  $\forall\bar z\, .\,X[\bar z]\leftrightarrow Y[\bar z]$. In C coextensive relations are
  identical only when necessarily coextensive ([[intensionality-r|Intensionality]]).
- For the empty tuple, at type $t$, $p\subseteq q$ is $p\to q$ and $p\equiv q$ is
  $p\leftrightarrow q$. In Lean these are the notations `X ⊆ Y` and `X ≡ Y`, defined
  pointwise at every relational type.
- $\top_\tau$ and $\bot_\tau$, at a relational type $\tau=\bar\sigma t$, are
  $\lambda\bar x\, .\,\top$ and $\lambda\bar x\, .\,\bot$, the top and bottom of $\le_\tau$.
- $H_{\bar x}:=\lambda\bar y\, .\,\bar y=\bar x$ is the *haecceity* of $\bar x$, the
  property of being $\bar x$.
- $X-y:=\lambda u\, .\,Xu\land u\ne y$ is $X$ without $y$.
- $\exists!x\, .\,\varphi$ abbreviates
  $\exists x\, .\,\varphi\land\forall x'\, .\,\varphi[x'/x]\to x'=x$.
- For a relation $R^{\sigma\sigma t}$ given as an order, $x\preccurlyeq y$ is $(Rx)y$, and
  $x\prec y$ is $x\preccurlyeq y\land x\ne y$.
- $\bigwedge_{i<j\le n}x_i\ne x_j$ is the finite conjunction of the displayed
  distinctness claims, saying that $x_1,\ldots,x_n$ are pairwise distinct.
:::

**Polyadic forms.** A principle with a type variable that may take the value
$e$ has a *polyadic form*, listed among its equivalent forms. The polyadic form
replaces that variable $\sigma$ by a tuple $\bar\sigma$, and its variables of type
$\sigma$ by tuples. (Relational Choice has two such variables; only the input one
is made a tuple.) The original form is the case of a one-element tuple. The converse
is proved in one of two ways.
- *One argument at a time*: by induction on the length of the tuple, currying the
  first argument.
- *Coding a tuple by its haecceity*: $H_{\bar x}:=\lambda\bar y^{\bar\sigma}\,
  .\,\bar y=\bar x$, of type $\bar\sigma t$. C proves $H_{\bar x}=H_{\bar y}\leftrightarrow
  \bar x=\bar y$, so the original form at the single type $\bar\sigma t$, applied to
  a relation on codes, yields the polyadic form at $\bar\sigma$. For the empty tuple the
  code type is $t$ and the only code is $\top$.

The equivalence of the boxed forms follows by necessitating these derivations.
Several of the equivalences have been checked in a Lean formalization of C.

## Two theorems of H

::: lemma {#existence-r}
title: Existence
lean: [Classicism.existence_rel, Classicism.existence_e]
credit: Andrew Bacon and Cian Dorr
sources: Classicism, §1.1, p. 7
---
Every type is inhabited: $\exists x^\sigma\, .\,x=x$.

*Proof.* Reflexivity gives $y=y$, and existential introduction yields
$\exists x\, .\,x=x$ at each admitted type; equivalently, use the β and EG derivation
on p. 7.

*Polyadic form.* $\exists\bar x^{\bar\sigma}\, .\,\bar x=\bar x$, the conjunction of the
original at each $\sigma_i$; for the empty tuple it is $\top$.
:::

::: lemma {#ordinary-comprehension-r}
title: Ordinary Comprehension
lean: [Classicism.ordinary_comprehension_nullary, Classicism.ordinary_comprehension, Classicism.ordinary_comprehension₂]
credit: Andrew Bacon and Cian Dorr
sources: Classicism
---
Every well-typed formula $P$ with distinguished variables $\bar y$ defines a coextensive
relation:
$\exists X\, .\,\forall\bar y\, .\,X[\bar y]\leftrightarrow P$, for $X$ not free in $P$, any
other free object variables being universally closed.

*Proof.* The λ-term $\lambda\bar y\, .\,P$ is a witness: β-conversion makes its
application equivalent to $P$ at each tuple, and existential introduction supplies the
instance.

The schema is in a formula, which no Lean statement with type parameters can quantify
over. The Lean theorems state, for zero, one and two distinguished variables, that every
relation $P$ is coextensive with some $X$; each instance of the schema is the theorem at
the λ-term $\lambda\bar y\, .\,P$, which is how the object language proves it.
:::

## Conventions

**Type scope.** A formula containing type variables ($\sigma$, $\tau$, $\bar\sigma$)
is a schema. The principle is the set of its instances, one for each admissible
assignment of types to the variables. Type variables range over the fixed type system
above; $\bar\sigma$ ranges over finite tuples, including the empty one. A relational
type is any admitted type other than $e$, including $t$. A restriction is written as
a parenthesized proviso after the formula, as in $\ldots\qquad(\tau\ne e)$; a formula
without a proviso admits every assignment. The type variables are metalinguistic: there
is no quantification over types in C, and a type variable never falls within the scope
of an object-language operator except as a fixed parameter. Finite tuples and formula
schemata retain their stated metalinguistic side conditions.

**Modal scope.** A boxed schema means that each admitted, fully closed
object-language instance is necessary. Close its object variables before
boxing it. Type ranges and formula side conditions remain outside the box.
C5 abbreviates C plus boxed ND at all types. It is an optional preset,
not part of the fixed background. A proof under an optional premise cannot
be necessitated unless that premise is discharged or supplied necessarily.

**Negation.** Failure of a type schema means failure of at least one of its
admitted instances, not failure at every type: the negation of a principle $A_\sigma$
says that $\neg A_\sigma$ for some $\sigma$. A necessarily false instance,
$\Box\neg A_\sigma$ for some $\sigma$, is stronger and different from failure of the
boxed schema. Negated principle nodes are not added by this positive import.
Incompatibilities conclude False; model `violates` entries record schema failure.

**Infinite sets in model descriptions.** A model described with "an infinite set"
works for any infinite set; where a construction needs a particular one, its
description says so. "Infinite" means not finite, that is, in bijection with no
natural number. This is the notion the Axioms of Infinity express, the finite
cardinalities being defined inductively. Without the axiom of choice it is weaker than
Dedekind-infinity, but it is all that the arguments for the Infinity principles use, so
they hold in the choiceless variants of a model too. Those variants say which
hypothesis replaces choice.

## Evidence

**Evidence.** *Classicism* is Bacon and Dorr (2024), in Fritz and Jones
(eds), *Higher-Order Metaphysics*, Oxford University Press, pp. 109–190.
References use the numbering of the 87-page draft dated 16 May 2023, from
which the map was built and which does not differ materially from the
published version, and, for the symmetric ideally-full models and the weak
rigidity principles, the 27-page draft of Dorr, *Boolean Completeness does
not imply Rigid Comprehension*, dated 30 July 2026. That second source is
a work in progress and is not distributed with the map; its records say so.
Models cite the construction and evaluation point directly.
The source models now use exactly the map's type system. Their listed
properties provide countermodel evidence at the stated evaluation point.
The singleton-root coalesced model still awaits an expansion to the fixed
nonlogical signature; its record explains this separate obligation.
Two results reported without proofs in the draft retain pending verification status.
No record claims an independent human check or Lean verification.
