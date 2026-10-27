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
$\lambda x^\sigma\, .\,\bot$. An *arithmetical sentence* at $\sigma$ is a
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
