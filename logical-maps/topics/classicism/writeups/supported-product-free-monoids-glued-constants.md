# Supported-product action model: κ⁺ free-monoid coordinates, glued constants

Construction and verification by GPT-6 Astra (OpenAI), prompted by Daniel Kodsi,
22 October 2026; checked and rewritten for the map by Claude Opus 5.5
(Anthropic), prompted by Cian Dorr, 24 October 2026.

At its evaluation point this model satisfies Logical Necessity, □BF, □Relational
Choice, □Countable Boolean Completeness and Atomlessness, and fails Actuality,
Vicinity, Weakly Inextensible Comprehension (at $tt$) and Rigid Power (at
$(tt)t$). So Logical Necessity, even with □BF and □Relational Choice, gives none of
the comprehension or actuality principles, and Countable Boolean Completeness does
not give Boolean Completeness. §9 adds the choice principles in their boxed and modalized
forms, Truths are ND-necessary, □Tame Rigidity, Arithmetic and Second-Order
Analytic Necessitism, and the failure of Forcing Possibilism.

## The model

Fix an infinite cardinal $\kappa\ge|\Sigma|$. Let $I$ be a set of size $\kappa^+$,
and $L$ the free monoid of finite words on an alphabet of size $\kappa$, with empty
word $\varepsilon$. The arrows are the elements of

$$
M:=L^I,\qquad (mh)_i:=m_ih_i\ \ (\text{concatenation}),\qquad 1:=(\varepsilon)_{i\in I},
$$

forming a one-object category. For $m,m'\in M$ and $S\subseteq I$ write
$m\equiv_Sm'$ for $m|_S=m'|_S$.

**Domains.** $D_e:=\{*\}$. For a relational type $\tau=\sigma_1\cdots\sigma_nt$,
$D_\tau$ is the set of *profiles*
$F:M\to\mathcal P(D_{\sigma_1}\times\cdots\times D_{\sigma_n})$ that have a
*support*: a set $S\subseteq I$ with $|S|\le\kappa$ such that

$$
m\equiv_Sm'\ \Rightarrow\ F_m=F_{m'} .
$$

For $n=0$ a profile is a subset of $M$, a proposition, true at $m$ iff $m\in p$.

**Transport.** $(h\cdot F)_k:=F_{kh}$, and $h\cdot *=*$. Then
$(g\cdot(h\cdot F))_k=F_{kgh}$, so $g\cdot(h\cdot F)=(gh)\cdot F$, and $h\cdot F$ has the
support of $F$.

**Interpretation.** The usual one-object action-model semantics (*Classicism*,
§§3.4–3.5): a formula with parameters $\bar a$ holds at $m$ iff it holds at $1$ with
parameters $m\cdot\bar a$, quantifiers range over the domains, and

$$
(\lambda\bar x\, .\,\varphi(\bar x;\bar a))_m:=\{\bar b:\ \varphi(\bar b;m\cdot\bar a)\text{ holds at }1\}.
$$

**Σ.** Each individual constant denotes $*$; the relational constants are interpreted
by gluing (§7).

Evaluation point: $1$.

## 1. A model of C

**Lemma 1.** If $F$ has support $S$ and $m\equiv_Sm'$, then $m\cdot F=m'\cdot F$.

*Proof.* $(m\cdot F)_k=F_{km}$ and $(km)_i=k_im_i=k_im'_i=(km')_i$ for $i\in S$. $\square$

So the profile of $\lambda\bar x\, .\,\varphi(\bar x;\bar a)$ at $m$ depends only on
$m\cdot\bar a$, hence only on $m$ restricted to the union of the parameters' supports,
a set of size $\le\kappa$: the domains are closed under the denotations of terms. Each
$h\cdot F$ is again supported, so transport maps domains to domains. An H-valid
equivalence holds at every arrow under every assignment, so the corresponding
abstractions have equal profiles: Logical Equivalence holds, and this is a model of C.

As there is one object, a closed pure sentence has the same truth value at every
arrow; in particular every such sentence true at $1$ is necessary there.

## 2. Transport is surjective; □BF

**Lemma 2.** For every $h\in M$ and $F\in D_\tau$ there is $G\in D_\tau$ with $h\cdot G=F$.

*Proof.* Let $S$ support $F$. For $m\in M$: if for every $i\in S$ the word $m_i$ ends
with $h_i$, say $m_i=w_ih_i$, put $r(m)_i:=w_i$ for $i\in S$ and $\varepsilon$
elsewhere, and $G_m:=F_{r(m)}$; otherwise $G_m:=\varnothing$. Then $G$ has support $S$,
and for every $k$, $r(kh)\equiv_Sk$, so

$$
(h\cdot G)_k=G_{kh}=F_{r(kh)}=F_k .\qquad\square
$$

**BF.** Suppose $\forall a\, .\,\Box Ra$ at $1$, that is, $k\cdot a\in R_k$ for all $a$
and $k$. At an arrow $h$, each $b$ is $h\cdot a$ for some $a$ by Lemma 2, so $b\in R_h$.
Hence $\Box\forall b\, .\,Rb$. This holds at every type, and BF is a closed pure schema,
so □BF holds.

## 3. Atomlessness; Actuality and Vicinity fail

For $i\in I$ let

$$
q_i:=\{m:m_i=\varepsilon\},
$$

a true proposition with support $\{i\}$. Since $(km)_i=\varepsilon$ iff
$k_i=m_i=\varepsilon$,

$$
h\cdot q_i=\begin{cases}q_i&h_i=\varepsilon,\\ \bot&h_i\ne\varepsilon,\end{cases}
\qquad\qquad \Diamond q_i=q_i .
\tag{1}
$$

The second holds as $\Diamond q_i$ is true at $m$ iff $k_im_i=\varepsilon$ for some $k$,
iff $m_i=\varepsilon$.

*Atomlessness.* Let $p\ne\bot$ have support $S$, and take $j\notin S$. Changing the $j$th
coordinate of a member of $p$ to $\varepsilon$, or to a nonempty word, gives members of
$p$ in $q_j$ and outside it. So $\bot\ne p\land q_j<p$.

*Actuality and Vicinity fail.* Let $p$ be true, with support $S$; take $j\notin S$ and
$h$ with a one-letter word at $j$ and $\varepsilon$ elsewhere. Then $h\in p$ (as
$h\equiv_S1$), while $h\notin q_j=\Diamond q_j$. So $p\not\le\Diamond q_j$, although $q_j$
is true. No truth entails the possibility of every truth, and a fortiori none entails
every truth.

## 4. Weakly Inextensible Comprehension fails at $tt$

Let $X\in D_{tt}$ be the constant profile $X_m:=\{q_i:i\in I\}$, with support
$\varnothing$. Suppose $Y\in D_{tt}$ is coextensive with $X$, so
$Y_1=\{q_i:i\in I\}$, and let $S$ support $Y$. Take $j\notin S$ and $h$ with a one-letter
word at $j$ and $\varepsilon$ elsewhere; then $Y_h=Y_1\ni q_j$. Let $Z\in D_{tt}$, with
support $\{j\}$, be

$$
Z_m:=\begin{cases}D_t&m_j=\varepsilon,\\ D_t\setminus\{q_j\}&m_j\ne\varepsilon.\end{cases}
$$

Every instance $q_i$ of $Y$ satisfies $\Box Zq_i$: by (1), $m\cdot q_i$ is $q_i$ or $\bot$,
and if $m_j\ne\varepsilon$ neither is $q_j$ (for $i=j$ it is $\bot$). So

$$
\forall p\, .\,Yp\to\Box Zp,
$$

but $q_j\in Y_h\setminus Z_h$, so $Y\not\le Z$, and $Y$ is not weakly inextensible.
Boolean Completeness, which implies Weakly Inextensible Comprehension, therefore fails
too.

## 5. □Relational Choice

Let $U$ be serial at $1$. By choice in the metatheory pick, for each $x$ in the input
domain, a $y_x$ with $\langle x,y_x\rangle\in U_1$, and let $S$ be the constant profile
$S_m:=\{\langle x,y_x\rangle\}$, with support $\varnothing$. It is functional and included
in $U$ at $1$. Relational Choice is a closed pure schema, so □Relational Choice holds.

## 6. □Countable Boolean Completeness

The order on profiles is pointwise inclusion at every arrow, and the pointwise union of
at most $\kappa$ supported profiles is supported (by the union of the supports), and is
their least upper bound.

At a type $\sigma$, the actual instances of $\operatorname{FiniteCardinality}_\sigma$ are
exactly the $\operatorname{Suc}^n_\sigma(\mathbf 0_\sigma)$, $n\in\mathbb N$: each is in
every inductive property, and the constant profile with exactly these instances is an
inductive property. So if $\operatorname{Ctbl}_{\sigma,\tau}(A)$ holds at $1$, the actual
instances of $A$ inject into $\mathbb N$, and their pointwise union is their least upper
bound. This holds at every arrow, so □Countable Boolean Completeness holds.

## 7. Logical Necessity

**Gluing lemma.** Let $(F_\alpha)_{\alpha<\kappa}$ (one for each letter) be entities of one relational type and
$j\in I$ outside all their supports. Let $h_\alpha$ have the one-letter word $\alpha$ at
$j$ and $\varepsilon$ elsewhere, and put

$$
G_m:=\begin{cases}(F_\alpha)_m&m_j\text{ ends in the letter }\alpha,\\ \varnothing&m_j=\varepsilon.\end{cases}
$$

$G$ has support $\{j\}\cup\bigcup_\alpha\operatorname{supp}(F_\alpha)$, of size $\le\kappa$,
and since $(kh_\alpha)_j$ ends in $\alpha$ and $kh_\alpha\equiv_{I\setminus\{j\}}k$,

$$
(h_\alpha\cdot G)_k=G_{kh_\alpha}=(F_\alpha)_{kh_\alpha}=(F_\alpha)_k .
$$

**The interpretation of Σ.** There are at most $\kappa$ sentences of
$\mathcal L(\Sigma)$. For each sentence $\varphi_\alpha$ true at $1$ under some
interpretation of Σ over these domains, choose one, $J_\alpha$. Pick $j$ outside the
supports of all the $J_\alpha(c)$, at most $\kappa\cdot\kappa\cdot\kappa$ coordinates, and
interpret each relational constant $c$ by the gluing $G_c$ of $(J_\alpha(c))_\alpha$ at
$j$. Then $h_\alpha\cdot G_c=J_\alpha(c)$ for every $c$ simultaneously, so $\varphi_\alpha$
holds at $h_\alpha$. Conversely, a sentence true at an arrow $h$ is true at $1$ under the
interpretation $c\mapsto h\cdot G_c$. So

$$
\Diamond\varphi\ \text{holds at }1\iff\varphi\text{ is true at }1\text{ under some interpretation of }\Sigma .
$$

For $P$ pure with free variables among $\bar x$, and distinct constants $\bar c$,
$P[\bar c/\bar x]$ is true under some interpretation iff $\exists\bar x\, .\,P$ is true
at $1$. So $\Diamond P[\bar c/\bar x]\leftrightarrow\exists\bar x\, .\,P$, and, applied to
$\neg P$,

$$
\Box P[\bar c/\bar x]\leftrightarrow\forall\bar x\, .\,P ,
$$

which is Logical Necessity at $1$.

## 8. Rigid Power fails at $(tt)t$

For a set $E$ of argument tuples write $H_E$ for the profile $m\mapsto m\cdot E$, which
need not be supported.

**Lemma 3 (exact images).** A supported $Y$ with actual extension $E=Y_1$ is weakly rigid
iff $Y=H_E$. In that case $Y$ is rigid.

*Proof.* If $Y=H_E$: for $\bar a\in E$, $k\cdot\bar a\in Y_k$ for every $k$, so $Y$ is
weakly persistent; and any $Z$ with $\Box Z\bar a$ for every $\bar a\in E$ has
$m\cdot E\subseteq Z_m$, so $Y\le Z$. Since $(h\cdot Y)_k=k\cdot(h\cdot E)$, every
transport of $Y$ is again an exact image, so $Y$ is rigid.

Conversely let $Y$ be weakly rigid with support $S$. Weak persistence gives
$m\cdot E\subseteq Y_m$. For $T\subseteq I$ with $|T|\le\kappa$ let

$$
B_T(E)_k:=\bigcup\{n\cdot E:\ n\equiv_Tk\},
$$

a profile with support $T$. Each $\bar a\in E$ has $\Box B_T(E)\bar a$ (take $n=k$), so
weak inextensibility gives $Y\le B_T(E)$. Now let $\bar b\in Y_m$, and let $T$ contain
$S$ and the supports of the entries of $\bar b$. Then $\bar b=n\cdot\bar a$ for some
$\bar a\in E$ and $n\equiv_Tm$. Define arrows $r,u$ by

$$
r_i=u_i:=\varepsilon\ (i\in T),\qquad r_i:=n_i,\ u_i:=m_i\ (i\notin T).
$$

Then $mr=un$: on $T$ both sides are $m_i=n_i$, off $T$ both are $m_in_i$. As $r\equiv_S1$,
$Y_r=E$, and weak persistence gives $r\cdot\bar a\in E$. As $u$ is $\varepsilon$ on the
supports of the entries of $\bar b$, $u\cdot\bar b=\bar b$. So

$$
\bar b=u\cdot(n\cdot\bar a)=(un)\cdot\bar a=(mr)\cdot\bar a=m\cdot(r\cdot\bar a)\in m\cdot E .\qquad\square
$$

**The counterexample.** Fix $o\in I$ and let $J:=I\setminus\{o\}$. For $j\in J$ let
$y_j\in D_{tt}$ be the constant profile $\{q_j\}$; every arrow fixes it. Let
$\chi(n):=1$ if $n\ge0$ is a perfect square and $0$ otherwise, so that the sequences
$(\chi(n+z))_{n\ge0}$ for $z\in\mathbb Z$ are pairwise distinct and each contains a $1$.
For $z\in\mathbb Z$ and $j\in J$ let $e_{z,j}\in D_{tt}$ have support $\{o,j\}$ and, with
$r:=|m_o|$ and $n:=|m_j|$,

$$
(e_{z,j})_m:=\begin{cases}
\{q_j\}\cup\{\bot:\chi(n+z)=1\}&r=0,\\
\{q_j\}\text{ if }n+z\ge0,\ \varnothing\text{ otherwise}&r=1,\\
\{q_j\}&r\ge2 .
\end{cases}
$$

These are pairwise distinct. Let $a$ have a one-letter word at $o$, and $b_j$ one at $j$,
$\varepsilon$ elsewhere. Directly from the definition:

$$
b_j\cdot e_{z,j}=e_{z+1,j},\qquad b_j\cdot e_{z,k}=e_{z,k}\ (k\ne j),\qquad
a\cdot e_{z,j}=y_j\iff z\ge0,\qquad a\cdot a\cdot e_{z,j}=y_j ,
$$

and for $z<0$, $a\cdot e_{z,j}$ has empty extension at $1$, so is no $y_k$.

Let $E:=\{e_{z,j}:z\in\mathbb Z,\ j\in J\}$ and $B:=\{y_j:j\in J\}$. An arrow $m$ shifts
$z$ by $|m_j|$ within the $j$th family, so $m\cdot E$ depends only on $|m_o|$: it is $E$,
$a\cdot E$ or $B$ according as $|m_o|$ is $0$, $1$ or at least $2$. So $F:=H_E$ is
supported (by $\{o\}$), and $X:=H_B$ is the constant profile $B$. Both are rigid by
Lemma 3, and $X\le a\cdot F$: at every $m$, $(a\cdot F)_m=(ma)\cdot E$ is $a\cdot E$ or
$B$, and both contain $B$.

Suppose some rigid $Y\le F$ had $a\cdot Y=X$. By Lemma 3, $Y=H_A$ with $A:=Y_1\subseteq E$,
and $a\cdot A=B$. Let $S$ support $Y$ and take $j\in J\setminus S$. As $b_j\equiv_S1$,
$b_j\cdot A=A$, so $A_j:=\{z:e_{z,j}\in A\}$ is invariant under $z\mapsto z+1$, hence
empty or $\mathbb Z$. It is not empty, since $y_j\in a\cdot A$ and the only $e$'s that $a$
sends to $y_j$ are the $e_{z,j}$ with $z\ge0$. So $e_{-1,j}\in A$, and
$a\cdot e_{-1,j}\in B$, a contradiction.

So $\mathcal P:=\lambda Y\, .\,\operatorname{Rigid}(Y)\land Y\le F$ has $X$ in its
extension at $a$, while $X$ is not $a\cdot Y$ for any $Y$ in its actual extension. By
Lemma 3 applied to $\mathcal P$, it is not weakly rigid. Rigid Power fails for the rigid
$F$, of type $(tt)t$.

## 9. Further verdicts

Added 25 October 2026 by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr. As there is
one object, a closed pure principle holds at $1$ iff it holds necessarily, so each verdict
below holds in its boxed form too.

**Constant profiles.** For any set $E$ of tuples, the constant profile $m\mapsto E$ has
support $\varnothing$ and is fixed by every arrow.

*Transversal Choice and Modal Well-Ordering.* A transversal of an actual equivalence
relation, chosen in the metatheory, is the extension of its constant profile. If $W$ is a
well-order of $D_\sigma$, chosen in the metatheory, its constant profile is $W$ at every
arrow, and every property's extension at an arrow is a subset of $D_\sigma$, so

$$
\Box\operatorname{WO}(W).
$$

*Intensional Choice.* Let $\Box\exists x\, .\,Fx$, and let $S$ support $F$. Then
$F_m\ne\varnothing$ for every $m$, and $F_m$ depends only on $m|_S$; choose $g(m)\in F_m$ depending
only on $m|_S$. Then $G_m:=\{g(m)\}$ has support $S$, and

$$
G\le F,\qquad \Box\exists x\, .\,(Gx\land\forall y\, .\,Gy\to y=x).
$$

*Modalized Relational Choice.* The same, choosing for each $m|_S$ a functional graph inside
$R_m$.

**Truths are ND-necessary.** Let $p$ be true, with support $S$, and

$$
q_S:=\{m:m_i=\varepsilon\text{ for all }i\in S\}.
$$

$q_S$ is true and $\Diamond q_S=q_S$, since $(km)_i=\varepsilon$ iff $k_i=m_i=\varepsilon$. Each
$m\in q_S$ agrees with $1$ on $S$, so $m\in p$. Hence $q_S\land\Box(\Diamond q_S\to p)$, so
$\Box_{\ne}p$.

**Tame Rigidity.** By Lemma 3, every weakly rigid relation is an exact image, and exact
images are rigid.

**Arithmetic Necessitism.** $\mathbb N_\sigma$ is a closed pure term, so its profile is
constant, with the numerals as instances; they are closed pure terms, so fixed by every
arrow. So $\mathbb N_\sigma$ is the exact image of its extension, hence rigid, and distinct
numerals are necessarily distinct.

**Second-Order Analytic Necessitism.** At a type $\sigma$:

- *If $\sigma$ has a relational argument*, there are continuum many distinct fixed entities
  of type $\sigma$ (constant profiles). Put a real structure on them with constant relations,
  and take as represented power of arity $k$ the constant profile of all constant $k$-ary
  relations on them. Every set of these entities, and of tuples of them, is the extension of
  a constant profile, so the structure is real, and the powers represent every relation, at
  every arrow.
- *If $\sigma$ has only individual arguments* (as $t$), use, for $x\subseteq\mathbb Z$,
  $$
  p_x:=\{m:\ \#_a(m_o)-\#_b(m_o)\in x\},
  $$
  where $a,b$ are two letters and $o\in I$ is fixed. Then $k\cdot p_x=p_{x-c}$ with
  $c:=\#_a(k_o)-\#_b(k_o)$, so each arrow acts injectively on these propositions. Put a real
  structure on continuum many of them, and let $\mathfrak R$ consist of the exact images of
  its carrier and relations, and the represented powers of the exact images of the sets of
  exact images $H_D$, $D$ a set of $k$-tuples of the carrier. All are supported by $\{o\}$, hence
  rigid by Lemma 3; at each arrow $k$, $k\cdot\mathfrak R$ is the image of the structure under
  the injection $k\cdot{}$, so a real structure, and any relation agrees on its carrier with
  some $H_{k\cdot D}$.

So Second-Order Analytic Necessitism, and with it Analytic Necessitism, holds.

**Forcing Possibilism fails**, as in every atomless model (Atomlessness is incompatible
with it). Directly: four distinct constant profiles of type $tt$ with the constant
order of the four-element Boolean algebra form a complete, Dedekind-finite Boolean algebra.
Forcing Possibilism would give a proposition with exactly four propositions below it; but a
nonzero proposition has infinitely many below it (Atomlessness), and $\bot$ one.

**Boolean Completeness at $t$ fails.** Lower bounds of a property $X$ of propositions are the
supported subsets of $\bigcap X$ (its actual instances), so a greatest lower bound exists iff
the union $U$ of all supported subsets of $\bigcap X$ is itself supported, and is then $U$. Fix
$C\subseteq I$ with $|C|=\kappa$, a set $P$ of $\kappa^+$ maps $x:C\to L$ (there are
$\kappa^\kappa>\kappa$), and distinct $j_x\in I\setminus C$, and put

$$
p_x:=\{n:\ n|_C\ne x\}\cup\{n:\ n_{j_x}=\varepsilon\},
$$

with support $C\cup\{j_x\}$. Let $X$ be the constant profile $\{p_x:x\in P\}$. For $m$ and
$T\supseteq C$, the class $[m]_T:=\{n:n|_T=m|_T\}$ lies in every $p_x$ iff either $m|_C\notin P$, or
$m|_C=x\in P$, $j_x\in T$ and $m_{j_x}=\varepsilon$; and if $m|_C=x\in P$ with $m_{j_x}\ne\varepsilon$ no
class of $m$ lies in $p_x$. So

$$
U=\{m:\ m|_C\notin P\}\cup\{m:\ m|_C=x\in P,\ m_{j_x}=\varepsilon\}.
$$

Given $S$ of size $\le\kappa$, take $x\in P$ with $j_x\notin S$, $m$ with $m|_C=x$ and
$m_{j_x}=\varepsilon$, and $m'$ differing from $m$ only at $j_x$: they agree on $S$, and $m\in U$,
$m'\notin U$. So $U$ has no support, and $X$ has no greatest lower bound.

**Rigid Rigidity.** *Lifting lemma: for every rigid $Y$ and arrow $k$ there is a rigid $X$ with
$k\cdot X=Y$.* By Lemma 3, $Y=H_D$ for $D:=Y_1$; let $S$ support $Y$. For an entity $q$ let

$$
L(q)_n:=\begin{cases}q_{n^\flat}&\text{if }n_i\text{ ends with }k_i\text{ for every }i\in S,\\ \varnothing&\text{otherwise,}\end{cases}
$$

where $n^\flat$ strips the suffix $k_i$ from $n_i$ for $i\in S$; $L(q)$ has support
$S\cup\operatorname{supp}(q)$, and $k\cdot L(q)=k''\cdot q$, where $k''$ is $k$ off $S$ and
$\varepsilon$ on $S$. Write $m=m_S\,m_{\bar S}$ for the factorization into the parts on and off
$S$. Unwinding the definition, $m\cdot L(q)=\Phi_{m|_S}(m_{\bar S}\cdot q)$ for an operation
$\Phi_{m|_S}$ depending only on $m|_S$. As $Y$ has support $S$, $m_{\bar S}\cdot D=D$, so for
$C:=\{L(\bar q):\bar q\in D\}$ (applied to each entry)

$$
m\cdot C=\Phi_{m|_S}[D],\qquad k\cdot C=k''\cdot D=D .
$$

So $H_C$ has support $S$, is admitted, rigid by Lemma 3, and $k\cdot H_C=H_D=Y$.

Now let $R$ be $\lambda X\, .\,\operatorname{Rigid}(X)$, whose profile is constant, with the rigid
relations as instances. It is weakly persistent, transports of rigid relations being rigid. If
$Z$ necessarily holds of every rigid $X$, then $k\cdot X\in Z_k$ for all rigid $X$ and arrows $k$;
by the lifting lemma every rigid relation is such a $k\cdot X$, so $R\le Z$. So $R$ is weakly
rigid, and since the principle is closed and pure, □Rigid Rigidity holds. With □Tame Rigidity,
Weakly Rigid Weak Rigidity and its boxed form follow. The lemma does not conflict with §8: Rigid
Power asks for a lift below a given rigid $F$.

## Remarks

1. **Tame Rigidity.** Lemma 3 also shows that every weakly rigid relation is rigid, at
   every arrow, so □Tame Rigidity holds (§9).
2. **Choice.** §§5 and 7, and the choice principles of §9, use choice in the metatheory;
   the other arguments do not.
3. **Infinitely many individuals.** Astra also gives a variant in which the arrows carry
   an extra coordinate, a surjection of a set of size $\kappa^+$ acting on the individuals.
   It adds the Axioms of Infinity at $e$ and $t$ and keeps these verdicts, except the
   principle Truths are ND-necessary and, at type $e$, Analytic Necessitism, which fail
   there. It is recorded separately, with surjections of the individuals in its name.
4. **Lean.** Astra's Lean development certifies, for one predicate constant, that
   Logical Necessity, □BF and □Relational Choice are consistent and imply neither
   Actuality nor Vicinity, using this construction. It is not yet connected to this
   record.
