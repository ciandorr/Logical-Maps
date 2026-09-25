# Possible Infinity (type t) and BF (type t) imply Axiom of Infinity (type t)

The proof is schematic in a type $\sigma$ and uses only the instance of BF
at $\sigma$,
$\forall X^{\sigma t}\, .\,(\forall x^\sigma\, .\,\Box Xx)\to\Box\forall x^\sigma\, .\,Xx$.
It is applied here with $\sigma=t$; the type-$e$ record reads it with
$\sigma=e$, taking the type-$e$ instance of BF. Cardinalities have type
$(\sigma t)t$ and their arguments type $\sigma t$. Write $X\equiv X'$ for
$\forall u\, .\,Xu\leftrightarrow X'u$, $X\subseteq X'$ for
$\forall u\, .\,Xu\to X'u$, and $X-y$ for $\lambda u\, .\,Xu\land u\ne y$.
"Finite" means "falls under $\operatorname{FiniteCardinality}_\sigma$".
Persistence of being a finite cardinality is Lemma 1 of the write-up for
Possibility Maximalism (pure) ⇒ Axiom of Infinity (type t), and the modal bookkeeping
there (K, necessitation of theorems of C) is used throughout.

**Lemma A (finite cardinalities respect coextension).** If $Z$ is finite,
$ZX$ and $X\equiv X'$, then $ZX'$.

*Proof.* By induction on $Z$ with
$W:=\lambda Z\, .\,\forall X\,X'\, .\,ZX\land X\equiv X'\to ZX'$. For
$\mathbf{0}$: $\mathbf{0}X$ says that $X$ has no instance, and then neither
has $X'$. Step: assume $WZ$ and $(\operatorname{Suc}Z)X$ with witness $y$,
so $Xy$ and $Z(X-y)$, and $X\equiv X'$. Then $X'y$ and $X-y\equiv X'-y$, so
$WZ$ gives $Z(X'-y)$, and $(\operatorname{Suc}Z)X'$ with witness $y$.
$\square$

**Lemma B (a finite count is necessary, under BF).** Assume BF at $\sigma$.
Call $X$ *closed off* when $\forall u\, .\,\neg Xu\to\Box\neg Xu$. If $Z$
is finite, $ZX$ and $X$ is closed off, then

$$
\Box\exists Z'\, .\,\operatorname{FiniteCardinality}(Z')\land\exists X'\, .\,Z'X'\land X\subseteq X'.
$$

*Proof.* By induction on $Z$ with
$W:=\lambda Z\, .\,\operatorname{FiniteCardinality}(Z)\land\forall X\, .\,
(ZX\land X\text{ closed off})\to\Box\exists Z'\, .\,
\operatorname{FiniteCardinality}(Z')\land\exists X'\, .\,Z'X'\land X\subseteq X'$.

Base, $Z=\mathbf{0}$: $\mathbf{0}X$ is $\forall u\, .\,\neg Xu$, and $X$
closed off then gives $\forall u\, .\,\Box\neg Xu$; BF at $\sigma$ turns
this into $\Box\forall u\, .\,\neg Xu$, that is $\Box\,\mathbf{0}X$. With
$\Box\operatorname{FiniteCardinality}(\mathbf{0})$ and $X\subseteq X$, K
assembles the boxed conclusion with $Z':=\mathbf{0}$ and $X':=X$.

Step: assume $WZ$; finiteness of $\operatorname{Suc}Z$ is immediate. Let
$(\operatorname{Suc}Z)X$ with witness $y$, so $Xy$ and $Z(X-y)$, and let
$X$ be closed off. Then $X-y$ is closed off: $\neg(X-y)u$ unfolds to
$\neg Xu\lor u=y$; the first disjunct gives $\Box\neg Xu$ by hypothesis and
the second gives $\Box(u=y)$ by NI; either way $\Box\neg(X-y)u$, by K and
Logical Equivalence for the unfolding. So $WZ$ applied to $X-y$ gives

$$
\Box\exists Z'\, .\,\operatorname{FiniteCardinality}(Z')\land\exists X'\, .\,Z'X'\land X-y\subseteq X'.
$$

The following is a theorem of C, so by necessitation and K the boxed
conclusion for $X$ follows from the display:

$$
\operatorname{FiniteCardinality}(Z')\land Z'X'\land X-y\subseteq X'
\;\to\;\exists Z''\, .\,\operatorname{FiniteCardinality}(Z'')\land\exists X''\, .\,Z''X''\land X\subseteq X''.
$$

To prove it, distinguish two cases. If $X'y$, then $X\subseteq X'$, since
an instance of $X$ is $y$ or an instance of $X-y$; take $Z'':=Z'$ and
$X'':=X'$. If $\neg X'y$, let $X'':=\lambda u\, .\,X'u\lor u=y$. Then
$X''y$, and $X''-y\equiv X'$ because $\neg X'y$, so Lemma A gives
$Z'(X''-y)$ and hence $(\operatorname{Suc}Z')X''$ with witness $y$; take
$Z'':=\operatorname{Suc}Z'$, which is finite, and $X\subseteq X''$ as
before. $\square$

Only BF itself is used, in the base case at the world of evaluation; the
step reasons inside the box with theorems of C alone, so the boxed form of
BF is not needed.

**The theorem.** Assume BF at $\sigma$ and Possible Infinity at $\sigma$,
and suppose for contradiction that some finite $Z$ holds of
$\lambda u\, .\,\top$. That property is closed off, since
$\neg(\lambda u\, .\,\top)u$ is $\bot$. Lemma B gives
$\Box\exists Z'\, .\,\operatorname{FiniteCardinality}(Z')\land\exists X'\, .\,
Z'X'\land\lambda u\, .\,\top\subseteq X'$. Inside the box, such an $X'$
satisfies $X'\equiv\lambda u\, .\,\top$, so Lemma A gives
$Z'(\lambda u\, .\,\top)$; hence, by necessitation and K,
$\Box\exists Z'\, .\,\operatorname{FiniteCardinality}(Z')\land Z'(\lambda u\, .\,\top)$,
which is the box of the negation of the Axiom of Infinity at $\sigma$. That
contradicts Possible Infinity at $\sigma$, the Axiom's diamond. So no finite
cardinality holds of $\lambda u\, .\,\top$. $\blacksquare$

## Notes

ND is not needed. Without it, the actual individuals may collapse together
at an accessible world, which is why Lemma B concludes only that *some*
finite cardinality holds there, of a property including the original one,
rather than that the same cardinality does. Lemma A is where Classicism's
lack of Extensionality would bite if the induction were run on coextensive
properties directly; it is instead proved as a property of finite
cardinalities, using only that $\mathbf{0}$ and $\operatorname{Suc}$ are
defined by quantification over instances.
