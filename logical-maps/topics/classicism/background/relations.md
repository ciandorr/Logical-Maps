# Relations, orders and fixed points

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

::: lemma {#modalized-plenitude-r}
title: Modalized Plenitude
lean: [Classicism.modalized_plenitude_t, Classicism.Proofs.classicism_implies_modalized_plenitude_r]
credit: Cian Dorr, 28 September 2026 (the statement, and the witness $\lambda x\, .\,\forall p\, .\,(Ux)p\to p$ for output type $t$); Claude Opus 5.5 (Anthropic), 28 September 2026 (the generalization to all relational output types and the written proof)
sources: Classicism, §1.5, pp. 16–18 (necessitation, T and Intensionality)
---
If necessarily each argument has a value that is necessarily the relation's unique value
for it, then some operation necessarily represents the relation:
$\forall U^{\sigma\tau t}\, .\,\Box\bigl(\forall x^\sigma\, .\,\exists y^\tau\, .\,\Box((Ux)y\land\forall z^\tau\, .\,(Ux)z\to y=z)\bigr)\to\exists X^{\sigma\tau}\, .\,\Box\forall x^\sigma\, .\,\forall y^\tau\, .\,(Ux)y\leftrightarrow y=Xx\qquad(\tau\ne e)$.
Plenitude, which asks only for actual functionality and an actual representation, is not
a theorem of C.

*Proof.* Let $\tau=\bar\rho\to t$, which covers $\tau=t$ with the empty tuple, and fix
$U^{\sigma\tau t}$. Write $\varphi(x,y):=(Ux)y\land\forall z\, .\,(Ux)z\to y=z$ and define
the operation $F:=\lambda x^\sigma\, .\,\lambda\bar u\, .\,\forall y^\tau\, .\,(Ux)y\to y[\bar u]$;
for $\tau=t$ this is $\lambda x\, .\,\forall p\, .\,(Ux)p\to p$. (1) A theorem of C:
$\varphi(x,y_0)\to\forall\bar u\, .\,y_0[\bar u]\leftrightarrow(Fx)[\bar u]$. Assume
$\varphi(x,y_0)$. If $y_0[\bar u]$ and $(Ux)y$, then $y=y_0$ by uniqueness, so $y[\bar u]$;
hence $(Fx)[\bar u]$. Conversely, if $(Fx)[\bar u]$, instantiate $y:=y_0$ and use
$(Ux)y_0$. (2) Necessitate (1) and apply [[modal-k|K]]: $\Box\varphi(x,y_0)$ gives
$\Box\forall\bar u\, .\,y_0[\bar u]\leftrightarrow(Fx)[\bar u]$, and
[[intensionality-r|Intensionality]] gives $y_0=Fx$. (3) Let
$H:=\forall x\, .\,\exists y\, .\,\Box\varphi(x,y)$ and
$G:=\forall x\, .\,\forall y\, .\,(Ux)y\leftrightarrow y=Fx$. Then $H\to G$ is a theorem
of C. Given $x$ and $y$, take $y_0$ with $\Box\varphi(x,y_0)$; by (2) $y_0=Fx$, and by
[[modal-t|T]] $\varphi(x,y_0)$. If $(Ux)y$ then $y=y_0=Fx$ by uniqueness. If $y=Fx$ then
$y=y_0$, and $(Ux)y_0$ gives $(Ux)y$. (4) Necessitate $H\to G$ and apply K:
$\Box H\to\Box G$. Existential generalization on the closed term $F$ (with parameter $U$)
gives $\Box H\to\exists X\, .\,\Box\forall x\, .\,\forall y\, .\,(Ux)y\leftrightarrow y=Xx$.
Only necessitation of theorems of C is used, so the theoremhood side condition is
respected.

The operation is definable from $U$, so no choice is involved. The outer box of the
hypothesis is used only to get the boxed conclusion: the same proof shows, as a theorem
of C, the unboxed variant $H\to\exists X\, .\,\forall x\, .\,\forall y\, .\,(Ux)y\leftrightarrow y=Xx$.
The inner box is essential; it is what licenses the identity $y_0=Fx$ in step (2).

*Polyadic form.* The same for $U^{\bar\sigma\tau t}$, one argument at a time, using each
step's instance under the box.

In Lean the proof is given at output type $t$ and at output type $\sigma'\to t$ for each
type $\sigma'$, the cases of none and of one remaining argument. Lean's shallow layer has
no induction on the shape of a type, so each further number of remaining arguments is a
separate theorem of the same form.
:::

For $R^{\sigma\sigma t}$, at any type $\sigma$ including $e$,

$$
\operatorname{Equiv}(R):=\forall x^\sigma\, .\,(Rx)x\;\land\;
\forall x^\sigma y^\sigma\, .\,(Rx)y\to(Ry)x\;\land\;
\forall x^\sigma y^\sigma z^\sigma\, .\,(Rx)y\land(Ry)z\to(Rx)z.
$$

The cell of $x$ is the property $\lambda z\, .\,(Rx)z$. Transversal Choice
asks for a property with exactly one instance in each cell. The equivalence
conditions and the transversal condition are unboxed, so they concern the
evaluation point only. Two members of one cell have coextensive cells, but
in C properties are identical only when necessarily coextensive.

For $R^{\sigma\sigma t}$ and $X^{\sigma t}$, at any type $\sigma$ including
$e$, the order predicates relativized to $X$ are

$$
\begin{aligned}
\operatorname{Trans}(R,X)&:=\forall x^\sigma y^\sigma z^\sigma\, .\,
  Xx\land Xy\land Xz\land(Rx)y\land(Ry)z\to(Rx)z,\\
\operatorname{Antisymm}(R,X)&:=\forall x^\sigma y^\sigma\, .\,
  Xx\land Xy\land(Rx)y\land(Ry)x\to x=y,\\
\operatorname{Total}(R,X)&:=\forall x^\sigma y^\sigma\, .\,
  Xx\land Xy\to(Rx)y\lor(Ry)x,\\
\operatorname{WellFounded}(R,X)&:=\forall Y^{\sigma t}\, .\,
  (\forall y^\sigma\, .\,Yy\to Xy)\land(\exists y^\sigma\, .\,Yy)\to
  \exists x^\sigma\, .\,Yx\land\forall y^\sigma\, .\,Yy\land(Ry)x\to y=x,\\
\operatorname{TotalOrder}(R,X)&:=\operatorname{Trans}(R,X)\land
  \operatorname{Antisymm}(R,X)\land\operatorname{Total}(R,X),\\
\operatorname{WO}(R,X)&:=\operatorname{TotalOrder}(R,X)\land
  \operatorname{WellFounded}(R,X).
\end{aligned}
$$

$\operatorname{TotalOrder}(R,X)$ says that $R$ totally orders $X$, or that
$X$ is an $R$-chain; $\operatorname{WO}(R,X)$ says that $R$ well-orders $X$.
Omitting $X$ means $X:=\lambda x\, .\,\top$, so that
$\operatorname{WO}(R)$ says that $R$ well-orders the whole type. Further,

$$
\begin{aligned}
\operatorname{Refl}(R)&:=\forall x^\sigma\, .\,(Rx)x,\\
\operatorname{Preorder}(R)&:=\operatorname{Refl}(R)\land\operatorname{Trans}(R).
\end{aligned}
$$

These orders are non-strict: Total includes reflexivity on $X$, and when
$R$ totally orders $X$, an $R$-minimal instance of a property included in
$X$ is its $R$-least instance {lean: Classicism.least_of_minimal}, and an instantiated property has a unique least
instance {lean: Classicism.unique_least}. Like Equiv, all of these are unboxed, so they
concern the evaluation point, and each depends only on the extensions of $R$
and $X$ there: coextensive arguments satisfy them together. A relation can
be a well-order without necessarily being one, because instances that are
distinct here may be identical elsewhere, where antisymmetry then fails.
Orders on properties and relations defined by inclusion are typically only
preorders: coextensive but distinct relations each include the other.

::: lemma {#bourbaki-witt}
title: the Bourbaki–Witt fixed-point lemma
---
Work at any type $\sigma$, including $e$. Let $X^{\sigma t}$ be a property, and
$R^{\sigma\sigma t}$ and $F^{\sigma\sigma t}$ relations; write $x\preccurlyeq y$ for
$(Rx)y$. Since $R$ need only be a preorder, put

$$
x\approx y:=x\preccurlyeq y\land y\preccurlyeq x,\qquad
x\prec y:=x\preccurlyeq y\land\neg\,y\preccurlyeq x .
$$

When $R$ is antisymmetric on $X$, this $\prec$ agrees on $X$ with the shorthand
$x\preccurlyeq y\land x\ne y$. For $Z\subseteq X$ put

$$
\begin{aligned}
\operatorname{UB}(s,Z)&:=Xs\land\forall z\, .\,Zz\to z\preccurlyeq s,\\
\operatorname{Sup}(s,Z)&:=\operatorname{UB}(s,Z)\land\forall u\, .\,\operatorname{UB}(u,Z)\to s\preccurlyeq u.
\end{aligned}
$$

In this lemma a *chain* is a property $Z\subseteq X$ with $\operatorname{Total}(R,Z)$.
Because $R$ is only a preorder, a chain need not be antisymmetric. That is weaker than
being an $R$-chain in the sense above.

Assume, at the evaluation point:

1. $R$ preorders $X$: it is reflexive on $X$, and $\operatorname{Trans}(R,X)$;
2. every chain has a supremum in $X$:
   $\forall Z\, .\,Z\subseteq X\land\operatorname{Total}(R,Z)\to\exists s\, .\,\operatorname{Sup}(s,Z)$;
3. $F$ is progressive and invariant on $X$: for every $x$ with $Xx$, there is some $y$
   with $(Fx)y$, every such $y$ has $Xy$ and $x\preccurlyeq y$ (*progressive*), and if
   moreover $x\approx x'$, $(Fx)y$ and $(Fx')y'$, then $y\approx y'$ (*invariant*).

Taking $x':=x$ in the invariance clause, any two $F$-values of one $x$ are
$\approx$-equivalent; $F$ is functional up to $\approx$.

Call $Y^{\sigma t}$ *closed* if $Y\subseteq X$,
$\forall x\,y\, .\,Yx\land(Fx)y\to Yy$, and
$\forall Z\,s\, .\,Z\subseteq Y\land\operatorname{Total}(R,Z)\land\operatorname{Sup}(s,Z)\to Ys$. Let

$$
M:=\lambda x\, .\,\forall Y\, .\,\operatorname{Closed}(Y)\to Yx
$$

be the least closed property (the *tower*). Then:

- (a) $M$ is closed, and $M\subseteq Y$ for every closed $Y$;
- (b) for all $b,c,d$ with $Mb$, $Mc$ and $(Fb)d$: $c\preccurlyeq b$ or $d\preccurlyeq c$.
  In particular $M$ is a chain, and if $b\prec c$ then $d\preccurlyeq c$;
- (c) $M$ has a supremum, and every supremum $m$ of $M$ satisfies $Mm$, and $n\approx m$
  whenever $(Fm)n$.

Two special cases:

- *Partial orders.* Suppose $R$ partially orders $X$ (Antisymm as well) and $F$ is
  functional on $X$. Then $\approx$ is identity on $X$, a chain is an $R$-chain, invariance
  is automatic, and (c) gives an $m$ in $X$ with $(Fm)m$.
- *Inclusion.* Suppose $\sigma=\bar\tau t$ and $\preccurlyeq$ is $\subseteq$. Then
  $\approx$ is coextension $\equiv$. Invariance says that coextensive arguments have
  coextensive $F$-values.

No choice principle is used, and the lemma holds at the evaluation point
only; it is a theorem schema of C, so it can be necessitated when its
hypotheses hold necessarily.

*Proof.* Throughout, $\preccurlyeq$ is transitive on $X$, and $x\preccurlyeq y\prec z$
and $x\prec y\preccurlyeq z$ each give $x\prec z$.

(a) By hypotheses 2 and 3, $X$ is closed, so $M\subseteq X$. The remaining clauses are
immediate from the definition of $M$.

Call $c$ a *pivot* if $Mc$ and
$\forall b\,d\, .\,Mb\land b\prec c\land(Fb)d\to d\preccurlyeq c$.

*Claim 1.* Let $c$ be a pivot and $(Fc)e$. Then for every $b$ with $Mb$:
$b\preccurlyeq c$ or $e\preccurlyeq b$. Put
$M_{c,e}:=\lambda b\, .\,Mb\land(b\preccurlyeq c\lor e\preccurlyeq b)$. It is closed:

- Let $M_{c,e}b$ and $(Fb)d$. If $b\prec c$, then $d\preccurlyeq c$, as $c$ is a pivot.
  If $b\approx c$, then $d\approx e$ by invariance, so $e\preccurlyeq d$. If
  $e\preccurlyeq b$, then $e\preccurlyeq b\preccurlyeq d$.
- Let $Z\subseteq M_{c,e}$ be a chain with supremum $s$. Either $z\preccurlyeq c$ for
  every $z$ with $Zz$, and then $s\preccurlyeq c$; or $e\preccurlyeq z\preccurlyeq s$ for
  some such $z$.

In each case the new member is in $M$, since $M$ is closed. So $M\subseteq M_{c,e}$ by
(a).

*Claim 2.* Every $c$ with $Mc$ is a pivot. The pivots form a closed property:

- Let $c$ be a pivot and $(Fc)e$. Then $Me$, since $M$ is closed. Let $Mb$, $b\prec e$
  and $(Fb)d$. By Claim 1, $b\preccurlyeq c$, since the alternative $e\preccurlyeq b$
  contradicts $b\prec e$. If $b\prec c$, then $d\preccurlyeq c\preccurlyeq e$. If
  $b\approx c$, then $d\approx e$ by invariance. Either way $d\preccurlyeq e$, so $e$ is
  a pivot.
- Let $Z$ be a chain of pivots with supremum $s$, and let $Mb$, $b\prec s$ and $(Fb)d$.
  Then $Ms$, since $M$ is closed. Some $z$ with $Zz$ has $z\not\preccurlyeq b$; otherwise
  $b$, which is in $X$, would bound $Z$, giving $s\preccurlyeq b$ and contradicting $b\prec s$. Take $e$ with $(Fz)e$.
  By Claim 1 for $z$ and $e$, either $b\preccurlyeq z$ or $e\preccurlyeq b$. The second
  would give $z\preccurlyeq e\preccurlyeq b$. So $b\prec z$, and
  $d\preccurlyeq z\preccurlyeq s$, as $z$ is a pivot.

(b) Let $Mb$, $Mc$ and $(Fb)d$. By Claim 2, $b$ is a pivot. By Claim 1, applied to $b$,
$d$ and $c$, either $c\preccurlyeq b$ or $d\preccurlyeq c$. In the second case
$b\preccurlyeq d\preccurlyeq c$. So any two members of $M$ are comparable. If $b\prec c$,
then $c\not\preccurlyeq b$, and so $d\preccurlyeq c$.

(c) $M$ is a chain included in $X$, so it has a supremum. Let $m$ be one. Then $Mm$,
since $M$ is closed. If $(Fm)n$, then $Mn$, so $n\preccurlyeq m$; and
$m\preccurlyeq n$, as $F$ is progressive. So $n\approx m$. $\square$

The tower also supports induction: to show that every member of $M$ has a
property, show that the members of $M$ having it form a closed property.
:::

::: lemma {#bourbaki-witt-admissible}
title: the Bourbaki–Witt lemma for admissible chains
---
The [[bourbaki-witt|Bourbaki–Witt lemma]] has a variant for the case where only some
chains are known to have suprema. These are the chains singled out by a property
$\mathcal A^{(\sigma t)t}$, the *admissible* properties. Take $X$, $R$ and $F$ as there,
and change it as follows.

- Hypothesis 2 is required only for admissible chains:
  $\forall Z\, .\,\mathcal AZ\land Z\subseteq X\land\operatorname{Total}(R,Z)\to\exists s\, .\,\operatorname{Sup}(s,Z)$.
- In the definition of *closed*, the clause for suprema is likewise restricted to
  admissible $Z$. The tower quantifies only over admissible closed properties:
  $M:=\lambda x\, .\,\forall Y\, .\,\mathcal AY\land\operatorname{Closed}(Y)\to Yx$.
- There is a new hypothesis. Each of the properties that the proof forms must be
  coextensive with an admissible property:
  - $X$;
  - $M$;
  - the property of being a pivot;
  - each $M_{c,e}$ of Claim 1.

Conclusion (a) becomes: $M$ is closed, and $M\subseteq Y$ for every admissible closed
$Y$. Conclusions (b) and (c) are unchanged.

The proof is the same. Two facts let it go through:

- closedness depends only on a property's actual extension;
- the new hypothesis brings each property the proof forms within the scope of (a).

With $\mathcal A:=\lambda Z\, .\,\top$ this is the original lemma.

Only the actual extensions of admissible properties matter, so two predicates with the
same admissible extensions give the same lemma.
:::
