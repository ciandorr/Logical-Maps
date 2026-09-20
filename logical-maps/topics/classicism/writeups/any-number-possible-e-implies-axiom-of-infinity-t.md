# Any Number Possible (type e) ⇒ Axiom of Infinity (type t)

Assume Any Number Possible (type $e$),

$$
\Pi\;:=\;\forall Z^{(et)t}\, .\,\operatorname{FiniteCardinality}_e(Z)\to\Diamond g(Z),
\qquad g(Z):=(\operatorname{Suc}_e Z)(\lambda x^e\, .\,\top).
$$

The conclusion is the Axiom of Infinity at type $t$,
$\neg\exists Z^{(tt)t}\, .\,\operatorname{FiniteCardinality}_t(Z)\land Z(\lambda p^t\, .\,\top)$.
This is a theorem of C about $\Pi$; no consistency side condition is
involved. The argument is Cian Dorr's (20 September 2026); the lemmas, the
boxed form of exclusivity and the Dedekind step are supplied here.

See Background for $\mathbf{0}_\sigma$, $\operatorname{Suc}_\sigma$ and
$\operatorname{FiniteCardinality}_\sigma$. Throughout, $X-y$ abbreviates
$\lambda u\, .\,Xu\land u\ne y$, so that $(\operatorname{Suc}_\sigma Z)X$
unfolds to $\exists y\, .\,Xy\land Z(X-y)$. "Finite" means "falls under
$\operatorname{FiniteCardinality}$", and a *finite cardinality* of type
$(\sigma t)t$ is one that does.

**Modal bookkeeping.** C proves K, T and 4 for the defined necessity,
recorded as results of the background, and C is closed under
necessitation: a theorem of H is H-equivalent to $\top$, so Logical
Equivalence identifies it with $\top$, which is its box; an instance of
Logical Equivalence is an identity, whose box follows by NI; K carries
boxes through modus ponens; and for generalisation, $A=\top$ with $x$ free
gives $\lambda x\, .\,A=\lambda x\, .\,\top$ by the $\xi$ rule, whence
$\forall x\, .\,A=\forall x\, .\,\top=\top$. Combined with K this gives:
whenever $A_1\land\cdots\land A_k\to B$ is a theorem of C,
$\Box A_1\land\cdots\land\Box A_k\to\Box B$ and
$\Box A_1\land\cdots\land\Box A_{k-1}\land\Diamond A_k\to\Diamond B$.

## 1. Lemmas about finite cardinalities, provable in C

The lemmas are schematic in $\sigma$; cardinalities have type $(\sigma t)t$
and their arguments type $\sigma t$. Each is proved by instantiating the
$\forall W$ of $\operatorname{FiniteCardinality}_\sigma$ with a displayed
abstract, and the induction hypothesis is always applied to the abstract
$X-y$ exactly as $\operatorname{Suc}_\sigma$ presents it, never to a merely
coextensive property. The one identification of properties used is between
abstracts of H-equivalent formulas, which Logical Equivalence licenses.

**Lemma 1 (Persistence).**
$\operatorname{FiniteCardinality}(Z)\to\Box\operatorname{FiniteCardinality}(Z)$.

*Proof.* Let $W:=\lambda Z\, .\,\Box\operatorname{FiniteCardinality}(Z)$.
$\operatorname{FiniteCardinality}(\mathbf{0})$ is a theorem, so its box
holds. Also
$\operatorname{FiniteCardinality}(Y)\to\operatorname{FiniteCardinality}(\operatorname{Suc}Y)$
is a theorem, since a property holding of $\mathbf{0}$ and closed under
$\operatorname{Suc}$ that holds of $Y$ holds of $\operatorname{Suc}Y$;
necessitation and K give $WY\to W(\operatorname{Suc}Y)$. So
$\operatorname{FiniteCardinality}(Z)$ gives $WZ$. $\square$

**Lemma 2 (Cases).** If $Z$ is finite then $Z=\mathbf{0}$ or
$Z=\operatorname{Suc}Y$ for some finite $Y$.

*Proof.* Let $W:=\lambda Z\, .\,Z=\mathbf{0}\lor\exists Y\, .\,
\operatorname{FiniteCardinality}(Y)\land Z=\operatorname{Suc}Y$. It holds of
$\mathbf{0}$. If $WY$ then $Y$ is finite, being $\mathbf{0}$ or the
successor of a finite cardinality, so $W(\operatorname{Suc}Y)$ with witness
$Y$. $\square$

**Lemma 3 (Swap).** If $Y$ is finite, $Y(X-y')$, $Xy$, $Xy'$ and $y\ne y'$,
then $Y(X-y)$.

*Proof.* By induction on $Y$ with
$W:=\lambda Y\, .\,\forall X\,y\,y'\, .\,(Y(X-y')\land Xy\land Xy'\land y\ne y')\to Y(X-y)$.
For $Y=\mathbf{0}$ the antecedent is contradictory: $\mathbf{0}(X-y')$ says
that nothing other than $y'$ is an instance of $X$, but $y$ is. For the
step, assume $WY_0$, and suppose $(\operatorname{Suc}Y_0)(X-y')$, $Xy$,
$Xy'$, $y\ne y'$. Unfolding, there is $z$ with $Xz$, $z\ne y'$ and
$Y_0((X-y')-z)$. We show $(\operatorname{Suc}Y_0)(X-y)$ with witness $y'$:
$(X-y)y'$ holds since $Xy'$ and $y'\ne y$, so it remains to show
$Y_0((X-y)-y')$. If $z=y$ we have $Y_0((X-y')-y)$, and
$(X-y')-y=(X-y)-y'$ by Logical Equivalence, the two abstracts binding
H-equivalent formulas. If $z\ne y$, apply $WY_0$ to the property
$X':=X-y'$ and the pair $y,z$: we have $Y_0(X'-z)$, $X'y$ (as $Xy$ and
$y\ne y'$), $X'z$ (as $Xz$ and $z\ne y'$) and $y\ne z$, so $Y_0(X'-y)$,
that is $Y_0((X-y')-y)$, which is $Y_0((X-y)-y')$ as before. $\square$

**Lemma 4 (Exclusivity).** If $Z$ and $Z'$ are finite then
$Z=Z'\lor\Box\forall X\, .\,\neg(ZX\land Z'X)$.

The point of the boxed disjunct is that, without ND, a merely possible
common instance of two finite cardinalities would give only
$\Diamond(Z=Z')$. Two preliminary theorems of H: for any $Y'$,
$\forall X\, .\,\neg(\mathbf{0}X\land(\operatorname{Suc}Y')X)$, since
$\mathbf{0}X$ denies the instance that $(\operatorname{Suc}Y')X$ supplies;
and likewise with the conjuncts exchanged. Their boxes therefore hold.

*Proof.* By induction on $Z$ with
$W:=\lambda Z\, .\,\operatorname{FiniteCardinality}(Z)\land\forall Z'\, .\,
\operatorname{FiniteCardinality}(Z')\to(Z=Z'\lor\Box\forall X\, .\,\neg(ZX\land Z'X))$.

Base, $Z=\mathbf{0}$: given finite $Z'$, Lemma 2 makes $Z'=\mathbf{0}$,
giving the first disjunct, or $Z'=\operatorname{Suc}Y'$, where the boxed
preliminary theorem gives the second.

Step: assume $WY$; we show $W(\operatorname{Suc}Y)$. Finiteness is
immediate. Given finite $Z'$, by Lemma 2 either $Z'=\mathbf{0}$, and the
boxed preliminary theorem applies, or $Z'=\operatorname{Suc}Y'$ with $Y'$
finite. Apply $WY$ to $Y'$. If $Y=Y'$ then
$\operatorname{Suc}Y=\operatorname{Suc}Y'=Z'$. Otherwise
$\Box\forall X\, .\,\neg(YX\land Y'X)$, and by Lemma 1
$\Box\operatorname{FiniteCardinality}(Y')$. The following is a theorem of
C, so by necessitation and K its boxed conclusion follows from the two
boxed premises:

$$
\operatorname{FiniteCardinality}(Y')\land\forall X\, .\,\neg(YX\land Y'X)
\;\to\;\forall X\, .\,\neg\bigl((\operatorname{Suc}Y)X\land(\operatorname{Suc}Y')X\bigr).
$$

To prove it, suppose $(\operatorname{Suc}Y)X$ with witness $y$, so $Xy$
and $Y(X-y)$, and $(\operatorname{Suc}Y')X$ with witness $y'$, so $Xy'$ and
$Y'(X-y')$. If $y=y'$ then $X-y$ is a common instance of $Y$ and $Y'$. If
$y\ne y'$, Lemma 3 turns $Y'(X-y')$, $Xy$, $Xy'$ into $Y'(X-y)$, and again
$X-y$ is a common instance. Either way $\forall X\, .\,\neg(YX\land Y'X)$
is contradicted. $\square$

**Lemma 5 (Dedekind).** Call $Q^{\sigma t}$ *Dedekind-infinite* when there
are $R^{\sigma\sigma t}$ and $q_0$ such that

- (i) $\forall x\, .\,Qx\to\exists z\, .\,Qz\land Rxz$;
- (ii) $\forall x\,x'\,z\, .\,Qx\land Qx'\land Rxz\land Rx'z\to x=x'$;
- (iii) $Qq_0\land\forall x\, .\,Qx\to\neg Rxq_0$.

Then no finite cardinality holds of a Dedekind-infinite property.

*Proof.* By induction on the cardinality with
$W:=\lambda Z\, .\,\forall Q\, .\,ZQ\to Q\text{ is not Dedekind-infinite}$.
For $\mathbf{0}$: $q_0$ is an instance of $Q$, against $\mathbf{0}Q$.

Step: assume $WY$, and suppose $(\operatorname{Suc}Y)Q$ with witness $q$, so
$Qq$ and $Y(Q-q)$, while $Q$ is Dedekind-infinite through $R$ and $q_0$. We
show that $Q-q$ is Dedekind-infinite, which contradicts $WY$ applied to
$Q-q$.

*Case A: no instance of $Q$ bears $R$ to $q$.* Then $R$ itself serves for
$Q-q$. For (i), an instance $x$ of $Q-q$ has some $z$ with $Qz$ and $Rxz$,
and $z\ne q$ by the case hypothesis. (ii) is inherited. For (iii), if
$q_0\ne q$ then $q_0$ serves. If $q_0=q$, take $z_0$ with $Qz_0$ and
$Rq_0z_0$; then $z_0\ne q_0$, since otherwise $q_0$ would bear $R$ to
$q_0$, so $z_0$ is an instance of $Q-q$, and an instance $x$ of $Q-q$ with
$Rxz_0$ would equal $q_0=q$ by (ii), which it does not.

*Case B: some $p$ has $Qp$ and $Rpq$.* Then $q\ne q_0$. Let
$R':=\lambda x\,z\, .\,(x\ne p\land Rxz)\lor(x=p\land Rqz)$. For (i), let
$x$ be an instance of $Q-q$. If $x\ne p$, take $z$ with $Qz$ and $Rxz$;
then $z\ne q$, since otherwise (ii) would make $x=p$. If $x=p$, take $z$
with $Qz$ and $Rqz$; then $z\ne q$, since $Rqq$ and $Rpq$ would make $q=p$
by (ii), while $p=x\ne q$. In both cases $z$ is an instance of $Q-q$ with
$R'xz$. For (ii), let $x,x'$ be instances of $Q-q$ with $R'xz$ and
$R'x'z$. If neither is $p$, then $Rxz$ and $Rx'z$ give $x=x'$. If $x=p\ne x'$,
then $Rqz$ and $Rx'z$ give $x'=q$, which is impossible; symmetrically for
$x'=p\ne x$. For (iii), $q_0$ is an instance of $Q-q$, and $R'xq_0$ would
require $Rxq_0$ for an instance $x$ of $Q$, or $Rqq_0$, both excluded by
(iii) for $R$. $\square$

## 2. Injectivity under $\Pi$

**Lemma 6.** Assume $\Pi$. If $Y,Y'$ are finite and $g(Y)=g(Y')$ then
$Y=Y'$. Consequently, if $Y,Y'$ are finite and
$\operatorname{Suc}_eY=\operatorname{Suc}_eY'$ then $Y=Y'$.

*Proof.* By Lemma 4, $Y=Y'$ or $\Box\forall X\, .\,\neg(YX\land Y'X)$.
Suppose the latter. By $\Pi$, $\Diamond g(Y)$; since $g(Y)=g(Y')$ and
$g(Y)\land g(Y)=g(Y)$ by Logical Equivalence,
$\Diamond(g(Y)\land g(Y'))$. By Lemma 1,
$\Box\operatorname{FiniteCardinality}_e(Y')$. The following is a theorem
of C:

$$
\operatorname{FiniteCardinality}_e(Y')\land\forall X\, .\,\neg(YX\land Y'X)\land g(Y)\land g(Y')\to\bot.
$$

For $g(Y)$ unfolds to a $y$ with $Y((\lambda x\, .\,\top)-y)$ and $g(Y')$
to a $y'$ with $Y'((\lambda x\, .\,\top)-y')$; both $y$ and $y'$ are
instances of $\lambda x\, .\,\top$, so if $y\ne y'$ Lemma 3 gives
$Y'((\lambda x\, .\,\top)-y)$, and in either case $Y$ and $Y'$ share an
instance, against the second conjunct. By necessitation and K, the two
boxed premises and the possible conjunction give $\Diamond\bot$, which is
$\bot\ne\bot$, refutable. So $Y=Y'$. The consequence follows since
$\operatorname{Suc}_eY=\operatorname{Suc}_eY'$ gives $g(Y)=g(Y')$. $\square$

## 3. The theorem

Assume $\Pi$. Let $S:=\lambda p^t\, .\,\exists Z\, .\,
\operatorname{FiniteCardinality}_e(Z)\land p=g(Z)$, the propositions that
say exactly how many individuals there are, for a positive finite number,
and define

$$
R:=\lambda p\,q\, .\,\bigl(\exists Z\, .\,\operatorname{FiniteCardinality}_e(Z)\land p=g(Z)\land q=g(\operatorname{Suc}_eZ)\bigr)
\lor(\neg Sp\land q=p),\qquad q_0:=g(\mathbf{0}_e).
$$

We check that $\lambda p\, .\,\top$ is Dedekind-infinite through $R$ and
$q_0$.

(i) Every $p$ has an $R$-successor: if $Sp$, pick a finite $Z$ with
$p=g(Z)$ and take $q:=g(\operatorname{Suc}_eZ)$; otherwise take $q:=p$.

(ii) Suppose $Rpq$ and $Rp'q$. If both hold through the first disjunct, with
finite $Z,Z'$, $p=g(Z)$, $p'=g(Z')$ and
$q=g(\operatorname{Suc}_eZ)=g(\operatorname{Suc}_eZ')$, then Lemma 6 applied
to the finite cardinalities $\operatorname{Suc}_eZ$ and
$\operatorname{Suc}_eZ'$ gives $\operatorname{Suc}_eZ=\operatorname{Suc}_eZ'$,
its consequence gives $Z=Z'$, and so $p=p'$. If both hold through the second
disjunct then $p=q=p'$. If $Rpq$ holds through the first and $Rp'q$ through
the second, then $q=g(\operatorname{Suc}_eZ)$ satisfies $Sq$ while $q=p'$
does not, which is impossible.

(iii) $Sq_0$ holds with witness $\mathbf{0}_e$. If $Rpq_0$ held through the
second disjunct then $q_0=p$ would fail $S$. If it held through the first,
$g(\mathbf{0}_e)=g(\operatorname{Suc}_eZ)$ for a finite $Z$, so
$\mathbf{0}_e=\operatorname{Suc}_eZ$ by Lemma 6. But
$\mathbf{0}_e(\lambda x\, .\,\bot)=\top$ and
$(\operatorname{Suc}_eZ)(\lambda x\, .\,\bot)=\bot$ by Logical Equivalence,
and $\top\ne\bot$.

By Lemma 5 at $\sigma=t$, no finite cardinality of type $(tt)t$ holds of
$\lambda p\, .\,\top$. $\blacksquare$

## Notes

ND is never used. The natural first thought, that the incompatible possible
propositions $g(Z)$ and $g(Z')$ must be distinct, yields without ND only
$\Diamond(Z=Z')$ from a shared possible instance. Lemma 4 supplies the
boxed alternative that makes the contradiction outright.

The argument does not transfer to a type-$t$ premise of the same shape.
"There could be any positive number of propositions" is refuted by C:
$\top\ne\bot$ excludes exactly one, and the Boolean structure of
propositions under Logical Equivalence excludes exactly three, since a third
proposition $s$ would have $\neg s$ equal to $\top$, to $\bot$ or to $s$,
each of which forces $s$ to be $\bot$ or $\top$.
