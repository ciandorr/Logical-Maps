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
succeeded. Every type used here ends
in $t$, so all of them are admitted, and no type $\sigma\sigma$ is needed;
that is why the axiom is not put in the Dedekind form, which would ask for an
injective non-surjective operation from $\sigma$ to $\sigma$.

Countable Boolean Completeness and the Necessity of Arithmetic follow
Goodsell, *Arithmetic is Necessary*, with the type $\nu$ of numbers taken to be
$(et)t$, zero to be $\mathbf{0}_e$ and successor to be $\operatorname{Suc}_e$,
the identification that paper displays in its eqs. (24)–(25) without assuming
it; Goodsell leaves $\nu$, $0$ and successor as parameters. Natural numberhood
$\mathbb N$ is then $\operatorname{FiniteCardinality}_e$. Write
$\forall n\in\mathbb N\, .\,A$ for $\forall n^\nu\, .\,\mathbb N n\to A$, and
likewise for $\exists$. With these, for a relational type $\tau$:

$$
\begin{aligned}
\operatorname{Ctbl}_\tau(X)&:=\exists R^{\tau\nu t}\, .\,\forall y^\tau z^\tau\, .\,
  Xy\land Xz\to\bigl((\exists n\in\mathbb N\, .\,Ryn\land Rzn)\leftrightarrow y=z\bigr),\\
I^*&:=\forall m\,n\in\mathbb N\, .\,\mathbf{0}_e\ne\operatorname{Suc}_e m\land
  (\operatorname{Suc}_e m=\operatorname{Suc}_e n\to m=n),\qquad I:=\Diamond I^*,\\
\operatorname{Sum}(m,n,o)&:=\forall R^{\nu\nu t}\, .\,R\mathbf{0}_e m\to
  (\forall i\,j\in\mathbb N\, .\,Rij\to R(\operatorname{Suc}_e i)(\operatorname{Suc}_e j))\to Rno,\\
\operatorname{Prod}(m,n,o)&:=\forall R^{\nu\nu t}\, .\,R\mathbf{0}_e\mathbf{0}_e\to
  (\forall i\,j\,k\in\mathbb N\, .\,Rij\to\operatorname{Sum}(m,j,k)\to R(\operatorname{Suc}_e i)k)\to Rno.
\end{aligned}
$$

So $X$ is countable when it injects into the natural numbers, and $I$ says
that possibly zero is not a successor and successor is injective on numbers.
In C the first conjunct of $I^*$ is a theorem, since $\mathbf{0}_e$ and a
successor differ at $\lambda x\, .\,\bot$. An *arithmetical sentence* is a
closed formula built from atomic formulas $\mathbb N\mathbf n$,
$\operatorname{Sum}(\mathbf m,\mathbf n,\mathbf o)$,
$\operatorname{Prod}(\mathbf m,\mathbf n,\mathbf o)$ and $\mathbf m=\mathbf n$,
whose terms are variables of type $\nu$, $\mathbf{0}_e$ and successors of
terms, by $\neg$, $\lor$, $\land$ and quantifiers $\forall v\in\mathbb N$.
These are Definitions 3–8 of Goodsell's draft.

Boolean Completeness is stated with $\operatorname{GLB}$. The dual form,
with $\operatorname{LUB}_\tau(y,X):=\forall z^\tau\, .\,
(\forall w^\tau\, .\,Xw\to w\le_\tau z)\leftrightarrow y\le_\tau z$,
is equivalent to it in C, and some proofs in the map use that form.

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
convention has its own principle.

Since $Y\le Z$ is itself the necessary universal closure of the pointwise
implication, $\operatorname{Persistent}(Y)$ unpacks as
$\Box\forall\bar x\, .\,Y[\bar x]\to\Box Y[\bar x]$, and both
conjuncts of $\operatorname{Rigid}$ carry a leading $\Box$. Dropping it
gives the weak variants:

$$
\begin{aligned}
\operatorname{WeaklyPersistent}(Y)&:=\forall\bar x\, .\,
  Y[\bar x]\to\Box Y[\bar x],\\
\operatorname{WeaklyInextensible}(Y)&:=\forall X\, .\,
  (\forall\bar x\, .\,Y[\bar x]\to\Box X[\bar x])\to Y\le X,\\
\operatorname{WeaklyRigid}(Y)&:=\operatorname{Persistent}(Y)\land
  \operatorname{WeaklyInextensible}(Y),\\
\operatorname{VeryWeaklyRigid}(Y)&:=\operatorname{WeaklyPersistent}(Y)\land
  \operatorname{WeaklyInextensible}(Y).
\end{aligned}
$$

$\operatorname{Rigid}$ is thus necessary very weak rigidity. These are the
conventions of Dorr, *Boolean Completeness does not imply Rigid
Comprehension*, pp. 2 and 12; that draft's unqualified “weakly rigid” is
$\operatorname{VeryWeaklyRigid}$ here, and the map reserves “weakly rigid”
for the stronger combination used in its Proposition 1.

For $U^{\sigma\tau t}$, set

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

Strong and weak worlds follow Bacon, *A Philosophical Introduction to
Higher-Order Logics*, §8.2, pp. 165–166. At a relational type $\sigma$, with
$\Diamond_\sigma X:=X\ne\bot_\sigma$,

$$
\begin{aligned}
\operatorname{SWorld}_\sigma(W)&:=\Diamond_\sigma W\land\Box\forall Y^\sigma\, .\,
  W\le_\sigma Y\lor W\le_\sigma\neg_\sigma Y,\\
\operatorname{WWorld}_\sigma(W)&:=\Diamond_\sigma W\land\forall Y^\sigma\, .\,
  W\le_\sigma Y\lor W\le_\sigma\neg_\sigma Y.
\end{aligned}
$$

A weak world is an atom in the sense above; a strong world necessarily settles
every entity of its type, including ones that do not actually exist. The
Weak Leibniz Biconditionals, $\forall X\, .\,\Diamond_\sigma X\to\exists W\, .\,
\operatorname{WWorld}_\sigma(W)\land W\le X$, are the map's Atomicity; the
Strong Leibniz Biconditionals replace $\operatorname{WWorld}$ by
$\operatorname{SWorld}$. In both, the right-to-left direction is a theorem of C.

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
