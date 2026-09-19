## Framework

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

Put $\Box p:=(p=\top)$ and $\Diamond p:=(p\ne\bot)$.
At a relational type $\tau$, Boolean operations are defined pointwise.
The order is algebraic entailment,
$X\le_\tau Y$ iff $Y=X\lor_\tau Y$, rather than material implication.
At $t$ this is equivalent to $\Box(X\to Y)$; at a relation type it is
equivalent to the necessary universal closure of the pointwise implication.

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

For a relation $Y$ with a finite argument tuple, including the empty tuple,
the comprehension predicates are:

$$
\begin{aligned}
\operatorname{Persistent}(Y)&:=Y\le\lambda\bar x\, .\,\Box Y[\bar x],\\
\operatorname{Inextensible}(Y)&:=\Box\forall X\, .\,
  (\forall\bar x\, .\,Y[\bar x]\to\Box X[\bar x])\to Y\le X,\\
\operatorname{Rigid}(Y)&:=\operatorname{Persistent}(Y)\land
  \operatorname{Inextensible}(Y).
\end{aligned}
$$

This is the rigidity convention of §2.3, p. 28. Gallin's alternative
convention has its own principle. For $U^{\sigma\tau t}$, set

$$
\begin{aligned}
\operatorname{Serial}(U)&:=\forall x^\sigma\, .\,\exists y^\tau\, .\,(Ux)y,\\
\operatorname{Functional}(U)&:=\forall x^\sigma\, .\,\exists y^\tau\, .\,
  (Ux)y\land\forall z^\tau\, .\,(Ux)z\to y=z.
\end{aligned}
$$

Functional includes totality. Relational Choice selects a functional
subrelation; Functional Choice selects an operation. An operation's output
type must differ from $e$. Relational Choice also covers relations with
individual outputs, since such a relation still ends in $t$.

Strong Possibility uses the distinctness-preserving modality of §2.6, p. 42:

$$
\Box_{\ne}p:=\exists q\, .\,q\land\Box(\Diamond q\to p),
\qquad \Diamond_{\ne}p:=\neg\Box_{\ne}\neg p.
$$

## Conventions

**Type scope.** Type parameters range over the fixed type system above.
A relational type is any admitted type other than $e$, including $t$.
Display restrictions such as $\tau\ne e$ when the schema needs them;
the overall type range is implicit.

**Schema scope.** $\forall^{\mathrm{Ty}}$ is metalinguistic. It ranges over
simple types, outside the object-language sentence, and does not add a
quantifier to C. A principle may have one outer universal or existential
block of type parameters; quantifier alternation requires a separate
extension of the convention. The present import has positive schemata and
selected individual instances. Finite tuples and formula schemata retain
their stated metalinguistic side conditions.

**Modal scope.** A boxed schema means that each admitted, fully closed
object-language instance is necessary. Close its object variables before
boxing it. Type ranges and formula side conditions remain outside the box.
C5 abbreviates C plus boxed ND at all types. It is an optional preset,
not part of the fixed background. A proof under an optional premise cannot
be necessitated unless that premise is discharged or supplied necessarily.

**Negation.** Failure of a type schema means failure of at least one of
its admitted instances, not failure at every type. For example,
$\neg\forall^{\mathrm{Ty}}\sigma\, .\,A_\sigma$ means
$\exists^{\mathrm{Ty}}\sigma\, .\,\neg A_\sigma$.
A necessarily false instance,
$\exists^{\mathrm{Ty}}\sigma\, .\,\Box\neg A_\sigma$, is stronger and
different from failure of the boxed schema. Negated principle nodes are
not added by this positive import. Incompatibilities conclude False;
model `violates` entries record schema failure.

**Pure and signature schemata.** In Distinctness and Possibility,
$C$ denotes the fixed background logic. Its theoremhood and consistency
side conditions are retained literally. “Pure” means free of nonlogical
constants. The principles in the Signature schemata group give a special
role to nonlogical constants: they concern an arbitrary fixed signature
$\Sigma$ of nonlogical constants of admitted types, with
$\mathcal L(\Sigma)$ and $C(\Sigma)$ the language and background theory
over $\Sigma$. Each of these schemata holds trivially when $\Sigma$ is
empty, so $\Sigma$ is assumed to contain at least one constant of some
type $\tau\ne e$. Nothing further is assumed: no nonlogical axioms about
the constants are standing assumptions, and “distinct constants” means
distinct symbols, not an assumed inequality between their denotations.
Where a schema mentions a tuple of distinct constants, its instances are
those the signature supplies.

**Fundamentality signature.** The principles in the Fundamentality group
are about a different, special signature rather than the arbitrary
$\Sigma$. It contains a fundamentality predicate
$\operatorname{Fun}_\sigma$ of type $\sigma t$ for every type $\sigma$,
following *Classicism*, §2.5, p. 39, and *Logical Combinatorialism*, §2.
That paper also uses a purity predicate $\operatorname{Pure}_\sigma$ of
type $\sigma t$; the map does not yet include any principle involving it.
These predicates receive no standing axioms. For Fundamental Possibility,
$\operatorname{Fun}(\bar x)$ conjoins each
$\operatorname{Fun}_{\sigma_i}(x_i)$ and the distinctness of each pair of
same-typed entries; the formula $P$ there is pure, so it contains neither
$\operatorname{Fun}$ nor any constant of $\Sigma$.

**Evidence.** References use the 87-page draft of *Classicism* dated
16 May 2023. Models cite the construction and evaluation point directly.
The source models now use exactly the map's type system. Their listed
properties provide countermodel evidence at the stated evaluation point.
The singleton-root coalesced model still awaits an expansion to the fixed
nonlogical signature; its record explains this separate obligation.
Two results reported without proofs in the draft retain pending verification status.
No record claims an independent human check or Lean verification.
