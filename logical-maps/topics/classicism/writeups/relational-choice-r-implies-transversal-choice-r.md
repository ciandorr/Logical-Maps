# Does Relational Choice imply Transversal Choice?

Christopher Sun observed that this implication is claimed in the literature
without proof. Zachary Goodsell passed the observation on and raised the
question here on 25 September 2026. The analysis below is by Claude Fable 5.1
(Anthropic) and has not been independently checked.

**Transversal Choice.** For every type $\sigma$ and every $R^{\sigma\sigma t}$
that is an equivalence relation,
$\exists F^{\sigma t}\, .\,\forall x\, .\,\exists y\, .\,(Rx)y\land Fy\land
\forall z\, .\,((Rx)z\land Fz)\to y=z$. Write $[x]$ for the cell
$\lambda z\, .\,(Rx)z$. Everything is unboxed and concerns the evaluation
point.

## The quotient argument and its gap

Apply Relational Choice at types $(\sigma t,\sigma)$ to the serial relation
$(UC)y:=Cy\lor\neg\exists z\, .\,Cz$, obtaining a functional $S$ below $U$, and
put $Fy:=\exists x\, .\,(S[x])y$.

Existence holds: the $y$ with $(S[x])y$ satisfies $[x]y$, because $[x]$ has
the instance $x$.

Uniqueness needs more. If $y$ and $y'$ are $F$-instances in the cell of $x$,
their witnesses $x_1,x_2$ lie in that cell, so $[x_1]$ and $[x_2]$ are
coextensive. Functionality of $S$ gives $y=y'$ only if $[x_1]=[x_2]$ as
properties. In C, identity of properties is necessary coextension
(Intensionality, *Classicism* §1.5), and the hypothesis supplies actual
coextension only. $R$ may be an equivalence relation contingently, and even a
necessary equivalence relation may relate $x_1$ and $x_2$ contingently. Then
$[x_1]\ne[x_2]$ and $S$ may choose differently from them.

No definable replacement for $[x]$ closes the gap. Any operation built by
$\lambda$-abstraction from $R$ and $x$ sends $x$ and $x'$ to the same value
only when the defining condition is necessarily equivalent for them, whereas
the hypothesis is actual indiscernibility with respect to $R$. The same
obstruction defeats a Zermelo-style well-ordering argument: the least family
closed under $A\mapsto A\setminus\{f(A)\}$ and under intersections contains
coextensive but distinct stages, which receive different chosen elements, so
the stages are not linearly ordered by inclusion.

## What does suffice

- **Extensionality** identifies $[x_1]$ with $[x_2]$ directly
  (`relational-choice-and-extensionality-imply-transversal-choice`).
- **Very Weak Rigid Comprehension** gives, for each cell, a very weakly rigid
  coextensive property. Two very weakly rigid coextensive properties are
  identical: weak inextensibility of one against weak persistence of the other
  gives necessary coextension, and Intensionality gives identity. Choosing from
  those canonical properties gives the transversal
  (`relational-choice-and-very-weak-rigid-comprehension-imply-transversal-choice`).
- Through recorded arrows, therefore also Gallin comprehension with BF, C5
  with Actuality, boxed Atomicity with Boolean Completeness and BF, and boxed
  Functional Choice.

Conversely Transversal Choice implies Relational Choice over C, by rigid
pairs $\lambda uv\, .\,u=x\land v=y$
(`transversal-choice-r-implies-relational-choice-r`). So the question is
whether Transversal Choice is strictly stronger.

## Models

Every recorded model of Relational Choice is extensionally full at its
evaluation point: each set of tuples from the domains there is the extension
of a rigid element (full models, ideally full action models, full Henkin
models, and the free root components of the coalesced sums). That is how
Relational Choice is verified in them, by choice in the metatheory, and the
same choice of a transversal set verifies Transversal Choice. None separates
the two principles.

Symmetric Henkin models in the Fraenkel–Mostowski style cannot separate them
either. Let a group $G$ act on a set $W$ of worlds and on $D_e$, let
$\mathcal F$ be a normal filter of subgroups, and form the hereditarily
symmetric hierarchy: $D_t$ the symmetric subsets of $W$, and $D_{\sigma\tau}$
the symmetric functions $D_\sigma\to D_\tau$, where $(gf)(x)=g\,f(g^{-1}x)$
and symmetric means fixed by some member of $\mathcal F$. The value of a term
with symmetric parameters is symmetric, so this is a Henkin model of C.
Evaluate at $w_0$ with stabilizer $G_0$, and write $H_0:=H\cap G_0$.

Suppose Relational Choice holds at $w_0$, and let $S$, fixed by $K\in\mathcal
F$, be a functional subrelation of the relation $U$ above at types
$(\sigma t,\sigma)$. Take $H\in\mathcal F$ with $H\subseteq K$ and
$z_0\in D_\sigma$. Let $p$ be the orbit of $w_0$ under $H\cap\mathrm{Stab}(z_0)$,
a symmetric proposition, and let $f(z)$ be $gp$ for any $g\in H$ with
$gz_0=z$, and empty if there is none. This is well defined, $f$ is fixed by
$H$, each $f(z)$ is fixed by $H\cap\mathrm{Stab}(z)$, so $f\in D_{\sigma t}$,
and a short computation shows that the extension of $f$ at $w_0$ is the orbit
$H_0z_0$. The element $y$ chosen by $S$ from $f$ lies in that orbit and is
fixed by $K\cap\mathrm{Stab}(f)\cap G_0\supseteq H_0$. Hence
$H_0z_0=H_0y=\{y\}$, and $z_0$ is fixed by $H_0$. So $K_0$ acts trivially on
every domain. Then for an equivalence relation at $w_0$ take a transversal
$T$ of its extension there and put $F(z):=\{gw_0: g\in K,\ g^{-1}z\in T\}$:
$F$ is $K$-symmetric, each $F(z)$ is $(K\cap\mathrm{Stab}(z))$-symmetric, and
the extension of $F$ at $w_0$ is $K_0T=T$. Transversal Choice holds.

## What would settle the question

A proof must use the chosen relation $S$ itself to break the symmetry between
coextensive cells, not a canonical property definable from $R$. A countermodel
must be a model of C with Relational Choice that is not extensionally full at
its evaluation point and that escapes the symmetric-model argument above, for
example a Henkin model whose domains are the definable closure of a seed
relation, with definable choice for every definable serial relation but no
definable transversal. No construction of that kind is available in the
sources of the map. The expectation recorded here is that the implication
fails.
