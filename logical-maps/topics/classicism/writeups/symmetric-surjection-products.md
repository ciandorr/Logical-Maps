# Symmetric surjection products with free-word gluing

Construction and proofs by GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, in the research
note *Symmetric surjection model with free-word gluing* of 22 October 2026. Checked and
rewritten for the map by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 28 October
2026.

These models extend Dorr's symmetric all-surjections model (symmetric-all-surjections) in two
ways, each needed to add **Logical Necessity** to that model's package:

1. pinning sets may have any size up to $\kappa$, inside a base of size $\kappa^+$;
2. the arrows carry an extra *monoid coordinate*, which provides the sites for gluing the
   interpretations of Σ.

Finite pinning would not do, because the gluing has to absorb the pinning sets of infinitely
many witnesses. Nor would the surjections alone, because a later collapse merges any gluing
sites among the points. The arguments are the $\kappa$-pinned forms of the arguments recorded
for the finite model, with the monoid coordinate held fixed. They are checked again here.

The verdicts for all four models:

- **Hold:** Logical Necessity, □Boolean Completeness, □Tame Rigidity, □Weakly Rigid Power and
  Atomlessness.
- **Fail:** Actuality, Vicinity and Relational Choice.
- **BF** holds necessarily when the monoid factor is right cancellative, and fails at type $t$
  when it has an idempotent.
- **Individuals:** with the members of $U$ as individuals, the Axioms of Infinity at $e$ and $t$
  hold too.

## The models

Fix an infinite cardinal $\kappa\ge|\Sigma|$, a set $U$ with $|U|=\kappa^+$, the monoid $S$ of
surjections $U\to U$, and a monoid $K$. The two choices of $K$ are:

- **Free words.** $K=W$, the free monoid of words on an alphabet of size $\kappa$, with empty
  word $\varepsilon$.
- **Free words with an idempotent.** $K=W\times\{1,d\}$, where $d^2=d\ne1$.

There is one object, with arrows

$$
(k,s)\in K\times S,\qquad (k,s)(k',s'):=(kk',\,s\circ s'),
$$

evaluation point $1:=(1_K,\mathrm{id})$, and symmetry group $\{1_K\}\times\operatorname{Sym}(U)$.
For a permutation $\pi$, write $\pi$ also for the arrow $(1_K,\pi)$.

**Individuals.** Either there is a single individual, fixed by every arrow, or the individuals
are the members of $U$, with $(k,s)\cdot a:=s(a)$, and $a$ is pinned down by $\{a\}$.

**Domains.** At a relational type, the domain is the set of profiles $F$, assigning to each
arrow a set of argument tuples, such that:

- $F$ is *pinned down* by some $N\subseteq U$ of size at most $\kappa$: $F_{(k,s)}$ depends only
  on $k$ and $s|_N$;
- $F$ is *symmetric*: $F_{(k,\pi s)}=\pi\cdot F_{(k,s)}$ for every permutation $\pi$.

Transport is $(h\cdot F)_j:=F_{jh}$. The semantics is that of one-object intensional action
models: a formula holds at $h$ iff it holds at $1$ with its parameters transported along $h$.

## 1. A model of C

Transport along $h=(k_h,s_h)$ takes a profile pinned down by $N$ to one pinned down by $s_h(N)$,
and keeps symmetry: $(h\cdot F)_{(k,\pi s)}=F_{(kk_h,\pi ss_h)}=\pi\cdot(h\cdot F)_{(k,s)}$.

Every permutation $\pi$ acts as an automorphism of the structure at $1$. Symmetry gives
$F_\pi=\pi\cdot F_1$, so $\bar b\in F_1$ iff $\pi\cdot\bar b\in(\pi\cdot F)_1$. So whatever a
formula says of parameters $\bar a$ and arguments $\bar b$, it says of $\pi\cdot\bar a$ and
$\pi\cdot\bar b$.

Now consider the profile of a $\lambda$-abstract with parameters $\bar a$. At $(k,s)$ it depends
only on $(k,s)\cdot\bar a$, so it is pinned down by the union of the parameters' pinning sets. By
the automorphism property it is symmetric.

So the domains are closed under the denotations of terms. This is the argument of Dorr's
Lemma 19 with sets of size at most $\kappa$ in place of finite sets, the monoid coordinate
passing through unchanged. Each entity $a$ has its *haecceity* $h\mapsto\{h\cdot a\}$ in the
domain, pinned down by a pinning set of $a$. As there is one object, a closed pure sentence has
the same truth value at every arrow.

**Lifting along surjections.** Let $F$ be pinned down by $N$, and $s\in S$. Choose distinct
$s$-preimages of the members of $N$, and extend $n\mapsto$ (its preimage) to a permutation $\pi$.
This is possible because the sets involved have size at most $\kappa$ and their complements size
$\kappa^+$. Then $s\pi$ is the identity on $N$, and $(1_K,s)\cdot(\pi\cdot F)=(1_K,s\pi)\cdot F=F$.
So transport along $(1_K,s)$ is onto every relational domain. It is onto the individuals because
$s$ is a surjection.

## 2. Logical Necessity

There are at most $\kappa$ sentences of $\mathcal L(\Sigma)$. For each sentence $\varphi_\alpha$
true at $1$ under some interpretation of Σ over these domains, choose such an interpretation
$J_\alpha$ and a letter $f_\alpha$, distinct letters for distinct sentences. Then:

1. Let the individual constants $c$ denote distinct members $a_c$ of $U$, or the only individual.
   Let $s_\alpha$ be a surjection with $s_\alpha(a_c)=J_\alpha(c)$ for each of them. There are at
   most $\kappa$ prescriptions and $\kappa^+$ other points. With one individual, take
   $s_\alpha:=\mathrm{id}$.
2. For each relational constant $c$, choose $B_{\alpha,c}$ with
   $(1_K,s_\alpha)\cdot B_{\alpha,c}=J_\alpha(c)$, by the lifting of §1.
3. Interpret $c$ by the profile $G_c$ defined below.

With $K=W$, write an arrow as $(w,s)$; with $K=W\times\{1,d\}$, as $(w,j,s)$, the coordinate $j$
being carried along unchanged. Put

$$
(G_c)_{(w,s)}:=\begin{cases}(B_{\alpha,c})_{(u,s)}&w=uf_\alpha,\\ \varnothing&w=\varepsilon.\end{cases}
$$

$G_c$ is pinned down by the union of the pinning sets of the $B_{\alpha,c}$. That is at most
$\kappa$ sets of size at most $\kappa$. It is symmetric, since the permutations touch only the
surjection coordinate.

At $h_\alpha:=(f_\alpha,s_\alpha)$, for every arrow $(u,r)$:

$$
(h_\alpha\cdot G_c)_{(u,r)}=(G_c)_{(uf_\alpha,\,rs_\alpha)}=(B_{\alpha,c})_{(u,\,rs_\alpha)}
=\bigl((1_K,s_\alpha)\cdot B_{\alpha,c}\bigr)_{(u,r)}=J_\alpha(c)_{(u,r)} .
$$

Also $h_\alpha\cdot a_c=s_\alpha(a_c)=J_\alpha(c)$. So at $h_\alpha$ every constant takes its
$J_\alpha$-value simultaneously, and $\varphi_\alpha$ holds there. Conversely, a sentence true at
an arrow $h$ is true at $1$ under the interpretation $c\mapsto h\cdot c$. Hence

$$
\Diamond\varphi\ \text{at }1\iff\varphi\text{ is true at }1\text{ under some interpretation of }\Sigma .
$$

Now take $P$ pure and $\bar c$ distinct constants. $P[\bar c/\bar x]$ is true under some
interpretation iff $\exists\bar x\,.\,P$ holds at $1$. So $\Diamond P[\bar c/\bar x]\leftrightarrow
\exists\bar x\,.\,P$. Applied to $\neg P$, this is Logical Necessity. It is claimed at the
evaluation point only.

## 3. BF and the monoid factor

**When $K$ is right cancellative**, every arrow acts onto every domain. For $(v,s)=(v,1)(1_K,s)$,
compose the surjection lift of §1 with the lift along $(v,1)$:

$$
L_v(F)_{(k,s)}:=\begin{cases}F_{(u,s)}&k=uv,\\ \varnothing&k\notin Kv.\end{cases}
$$

$L_v(F)$ is well defined because $u$ is unique, by right cancellation. It keeps $F$'s pinning set
and symmetry, and $(v,1)\cdot L_v(F)=F$. So whenever $\Box Ra$ holds for every $a$, any entity at
any arrow $h$ is $h\cdot a$ for some $a$, and so lies in $R$ there. That is BF at every type.
Being closed and pure, it holds necessarily.

**When $K$ has an idempotent** $d_0\ne1_K$, with $1_Kd_0=d_0=d_0d_0$, BF fails at type $t$.

- Let $p$ be the proposition that the monoid coordinate is $1_K$.
- Let $R$, of type $tt$, hold of $p$ alone at the arrows with monoid coordinate $d_0$, and of
  nothing elsewhere.

Both are pinned down by $\varnothing$ and symmetric. Then $\Diamond\exists q\,.\,Rq$, witnessed at
$(d_0,\mathrm{id})$.

Suppose $\Diamond Rq$ for some $q$. Then $k\cdot q=p$ for an arrow $k$ with monoid coordinate
$d_0$. But $(k\cdot q)_{(1_K,s)}=q_{(d_0,ss_k)}=(k\cdot q)_{(d_0,s)}$, since $1_Kd_0=d_0d_0$,
whereas $p$ is true at $(1_K,s)$ and false at $(d_0,s)$. So BF fails at $t$.

## 4. Atomlessness; Actuality, Vicinity and Relational Choice fail

For distinct $a,b\in U$ let $q_{a,b}:=\{(k,s):s(a)\ne s(b)\}$. It is pinned down by $\{a,b\}$ and
symmetric.

**Atomlessness.** Let $p\ne\bot$ be pinned down by $N$, with $(k,s)\in p$, and let $a,b\notin N$.
$s|_N$ has at most $\kappa$ values, so it extends to a surjection that separates $a$ and $b$, and
to one that identifies them. Both lie in $p$. So $p\land q_{a,b}$ and $p\land\neg q_{a,b}$ are
nonzero. Hence there is no atom, and Actuality fails.

**Vicinity.** Let $p$ be true, pinned down by $N$, and $a,b\notin N$. Let $s$ fix $N$ pointwise
and identify $a$ and $b$. Then $p$ holds at $(1_K,s)$. But $q_{a,b}$, which is true, is impossible
there: every arrow $j(1_K,s)$ has surjection $s_js$, which identifies $a$ and $b$. So no truth
entails the possibility of every truth.

**Relational Choice**, at input type $tt$ and output type $t$.

- Let $U$ relate each property of propositions with exactly two actual instances to each of
  them, and every other property to every proposition. It is a closed term, and serial.
- Let $R\le U$ be functional, pinned down by $N$. For a permutation $\pi$ fixing $N$, pinning gives
  $R_\pi=R_1$ and symmetry gives $R_\pi=\pi\cdot R_1$. So $R_1$ is invariant under $\pi$.
- Take distinct $a,b,c\notin N$. The propositions $q_{c,a}$ and $q_{c,b}$ are distinct: a
  surjection identifying $c$ with $a$ but not with $b$ separates them.
- Let $A$ be the union of their haecceities. It is in the domain, with exactly these two actual
  instances.
- The transposition $\pi$ of $a$ and $b$ fixes $N$ and $c$. It exchanges $q_{c,a}$ and $q_{c,b}$
  and fixes $A$.
- $R$ relates $A$ to one of the two instances, so by invariance it relates $A$ to the other as
  well, and $R$ is not functional.

## 5. □Boolean Completeness

Let $A$, of type $\tau t$, be pinned down by $N$, with actual instances $E:=A_1$. For a
permutation $\pi$ fixing $N$ pointwise, $\pi\cdot E=E$, by pinning and symmetry as above. Let

$$
J_{(k,s)}:=\bigcup\{a_{(k,t)}:\ a\in E,\ t\in S,\ t|_N=s|_N\}.
$$

$J$ is pinned down by $N$. It is symmetric: replacing $s$ by $\pi s$ replaces each $t$ by $\pi t$,
and $a_{(k,\pi t)}=\pi\cdot a_{(k,t)}$. It is an upper bound of $E$, by taking $t=s$.

**$J$ is below every upper bound.** Let $Z$, pinned down by $T$, be an upper bound of $E$, and
let $\bar b\in a_{(k,t)}$ with $a\in E$ and $t|_N=s|_N$. Let $L$ pin down $a$.

- Choose a permutation $\pi$ fixing $N$ pointwise and moving $L\setminus N$ off $T$. Then
  $\pi\cdot a\in E$.
- Prescribe a surjection $r$ to agree with $s$ on $T$, and to send $\pi(l)$ to $t(l)$ for each
  $l\in L$.
- The prescriptions are compatible. A point of $T\cap\pi(L)$ is $\pi(l)$ with $l\in N$, where
  $\pi(l)=l$ and $t(l)=s(l)$.
- There are at most $\kappa$ of them, so they extend to a surjection.
- Then $r\pi$ agrees with $t$ on $L$, so

$$
\bar b\in a_{(k,t)}=a_{(k,r\pi)}=(\pi\cdot a)_{(k,r)}\subseteq Z_{(k,r)}=Z_{(k,s)} .
$$

So $J\le Z$, and $J$ is the least upper bound of $A$'s actual instances, at every relational type.
The schema is closed and pure, so it holds necessarily. This is the hull argument of Dorr's
Theorem 36, specialised to surjections with pinning sets of size at most $\kappa$.

## 6. Exact images and □Tame Rigidity

For a set $E$ of argument tuples, let $H_E$ be the profile $h\mapsto h\cdot E$.

**Lemma.** A weakly rigid $Y$, pinned down by $N$, with $Y_1=E$, is $H_E$.

*Proof.* Let $B_N(E)_{(k,s)}:=\bigcup\{(k,t)\cdot E:\ t|_N=s|_N\}$. It is pinned down by $N$, and
symmetric by functoriality, and every member of $E$ is necessarily in it. So weak inextensibility
gives $Y\le B_N(E)$, and weak persistence gives $h\cdot E\subseteq Y_h$.

Let $\bar b\in Y_{(k,s)}$, so $\bar b=(k,t)\cdot\bar a$ with $\bar a\in E$ and $t|_N=s|_N$, and let
$L$ pin down the entries of $\bar a$. Let $u$ be a surjection fixing $N$ and sending each
$l\in L\setminus N$ to an $s$-preimage of $t(l)$. Then $Y_{(1_K,u)}=E$, so weak persistence gives
$u\cdot\bar a\in E$. And $(k,su)$ agrees with $(k,t)$ on $L$, so
$\bar b=(k,s)\cdot(u\cdot\bar a)\in(k,s)\cdot E$. $\square$

Conversely, every $H_E$ in the domain is rigid, and so is each of its transports. So weak
rigidity coincides with rigidity at every world, and □Tame Rigidity holds at every type.

## 7. □Rigid Power and □Weakly Rigid Power

**Stability lemma.** Let $A$ be a set of tuples closed under every $(1_K,u)$ with $u$ fixing $P$
pointwise, where $|P|\le\kappa$. Then $H_A$ is pinned down by $P$, so it is in the domain and
rigid.

*Proof.* Let $s|_P=t|_P$ and $\bar a\in A$, pinned down by $L$. A surjection $u$ fixing $P$ with
$su=t$ on $L$ gives $(k,t)\cdot\bar a=(k,s)\cdot(u\cdot\bar a)\in(k,s)\cdot A$. By symmetry in $s$
and $t$, the two images are equal. $\square$

**The power property is weakly inextensible.**

- Let $F=H_E$ be rigid, pinned down by $S_F$, with power property $\mathcal P_F$. Let $Z$
  necessarily hold of every actual rigid $Y\le F$. Let $N\supseteq S_F$ also pin down $Z$, let
  $h=(k,s)$, and let $X=H_D\le h\cdot F$ be rigid, pinned down by $T$.
- Let $j_0$ agree with $s$ on $N$ and map $U\setminus N$ bijectively onto $U\setminus s(N)$, and
  put $j:=(k,j_0)$. Then $j\cdot F=h\cdot F$, so $D\subseteq j\cdot E$.
- Every nonsingleton fibre of $j_0$ lies inside $N$. So $P:=N\cup j_0^{-1}(T)$ has size at most
  $\kappa$.
- Let $A:=\{\bar a\in E:j\cdot\bar a\in D\}$. Then $j\cdot A=D$.
- **$A$ is closed under the surjections fixing $P$.**
  - Let $u$ fix $P$. Then $j_0u=vj_0$ for the surjection $v$ with $v(j_0x):=j_0(ux)$.
  - $v$ is well defined because $u$ fixes the nonsingleton fibres, and $v$ fixes $T$.
  - $F$ and $X$ are weakly persistent, $u$ fixes $S_F$ and $v$ fixes $T$. So $u\cdot E\subseteq E$
    and $v\cdot D\subseteq D$.
  - Hence $j\cdot(u\cdot\bar a)=v\cdot(j\cdot\bar a)\in D$ for $\bar a\in A$, and $u\cdot\bar a\in A$.
- By the stability lemma, $Y:=H_A$ is rigid, $Y\le F$, and $j\cdot Y=X$.
- So $X\in Z_j$. And $Z_j=Z_h$, since $j$ and $h$ have the same monoid coordinate and agree on $N$.

So $\mathcal P_F$ is weakly inextensible. It is persistent by C, and rigid by Tame Rigidity. Hence
Rigid Power holds at every type. As weakly rigid and rigid subrelations coincide, the same power
properties give Weakly Rigid Power. Both are closed and pure, so they hold necessarily.

## 8. The Axioms of Infinity

The numerals are closed pure terms, fixed by every arrow. So the constant profile whose
instances are the numerals at a type is symmetric and pinned down by $\varnothing$.

- **The finite cardinalities are the standard ones.** Every inductive property contains the
  numerals, and this constant profile is inductive.
- **The $n$th holds of exactly the properties with $n$ actual instances**, by finite induction.
- **With the members of $U$ as individuals**, the universal property of individuals has $\kappa^+$
  instances. So no finite cardinality holds of it, and the Axiom of Infinity holds at $e$.
- **At $t$, in every case**, the propositions $q_{a,b}$ are infinitely many, so the Axiom of
  Infinity holds at $t$.

## 9. Further verdicts

Added 28 October 2026 by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr. Write
$q_{x,y}:=\{(k,s):s(x)\ne s(y)\}$ for any $x,y\in U$, so that $\pi\cdot q_{x,y}=q_{\pi x,\pi y}$.

**Truths are ND-necessary holds.** Let $p$ be true, pinned down by $N$, and let
$q:=\{(1_K,s):s\text{ injective on }N\}$. It is true, pinned down by $N$, and symmetric.

- **$\Diamond q=q$.** In both monoid factors, $jk=1_K$ only if $k=1_K$, and $ts$ is injective on $N$
  only if $s$ is.
- **$q\le p$.** A member $(1_K,s)$ of $q$ agrees on $N$ with a permutation $\pi$. And $(1_K,\pi)\in p$,
  since $p$ is symmetric and true. So $(1_K,s)\in p$.

Hence $\Box(\Diamond q\to p)$, and every truth is ND-necessary. The verdicts on the varieties of
necessity follow.

**Intensional Choice fails** at type $t$. Fix $c\in U$, and let

$$
F_{(k,s)}:=\{q_{s(c),y}:\ y\ne s(c)\},
$$

which is pinned down by $\{c\}$, symmetric, and necessarily instantiated. Suppose $G\le F$ is
necessarily uniquely instantiated, and pinned down by $N\ni c$. Let $h:=(1_K,s)$ with $s$ sending
$N$ to a single point $p$. Then $G_h=\{q_{p,y}\}$ for some $y\ne p$.

For a permutation $\pi$ fixing $p$, the arrow $\pi h$ agrees with $h$ on $N$. So $G_{\pi h}=G_h$ by
pinning, while symmetry gives $G_{\pi h}=\{q_{p,\pi y}\}$. Hence every such $\pi$ fixes $y$, which
is false. This is intensional-choice-collapse at type $t$.

**Arithmetic Necessitism holds.** The profile whose value at every arrow is the set of numerals is
pinned down by $\varnothing$ and symmetric. So the numbers are the numerals, fixed by every arrow
(as arithmetic-necessitism-finitely-pinned).

**Analytic Necessitism holds**, and so does its second-order form. Revised 29 October 2026: this
section first recorded a failure. Its argument was withdrawn, because it inferred membership in a
rigid carrier from inextensibility, which only bounds a carrier from above.

- **The entities.** For finite $N$, the arrows whose surjection is constant on $N$ form a symmetric
  proposition, pinned down by $N$. Its orbit under the permutations depends only on $|N|$. So the
  unions $S_A$ of the orbits for the sizes in $A\subseteq\mathbb N$ are continuum many invariant sets
  of propositions. The constant intensions $Y_A$ with these values are in the domain and fixed by
  every arrow.
- **The structure.** Every set of tuples of the $Y_A$ is invariant, and so is every set of such
  constant relations, so each is the value of a constant intension in the domain. A real number
  structure on the $Y_A$ by constant relations therefore has fixed parameters, and there is one
  object. So it is one at every world, rigid, with necessarily distinct instances. The constant
  intensions of the sets of its constant relations are represented powers.

## 10. Inextensible Comprehension

GPT-6 Astra (OpenAI), prompted by Cian Dorr, 29 October 2026; checked and recorded by Claude
Opus 5.5 (Anthropic). □Inextensible Comprehension holds in all four variants. The finite-model
argument relabels an arrow fixing the pinning set into one that leaves the entity unchanged, and
the monoid coordinate blocks that step. This argument instead switches the witness off for good
once the monoid coordinate leaves $1_K$.

**The witness.** Let $X$ be pinned down by $N$, with $|N|\le\kappa$, and put

$$
Y_{(k,s)}:=\begin{cases}X_{(k,s)}&k=1_K\text{ and }s|_N\text{ injective},\\ \varnothing&\text{otherwise.}\end{cases}
$$

Injectivity on $N$ depends only on $s|_N$ and is unchanged by composing with a permutation, so $Y$ is
pinned down by $N$ and symmetric. And $Y_1=X_1$, so $Y$ is coextensive with $X$ at $1$.

**The defects are permanent.** In both monoid factors, $jk=1_K$ only if $k=1_K$: in $W$ by length,
and in $W\times\{1,d\}$ because $xy=1$ forces $x=y=1$. And if $s$ collapses two points of $N$, so does
$ts$. So along an arrow $h=(k,s)$ with $k\ne1_K$, or with $s$ not injective on $N$, $(h\cdot
Y)_j=Y_{jh}=\varnothing$ for every $j$: the transport is $\bot$, which is weakly inextensible.

Along $h=(1_K,s)$ with $s|_N$ injective, $h\cdot X$ is pinned down by $s[N]$. Since $ts|_N$ is
injective iff $t|_{s[N]}$ is, $h\cdot Y$ is the same construction applied to $h\cdot X$ with pinning
set $s[N]$. So it suffices to show that $Y$ is weakly inextensible at $1$, for every $X$ and $N$.

**Lifting.** Put $E:=X_1$. A permutation $\tau$ fixing $N$ has $X_{(1_K,\tau)}=X_1$ by pinning
and $=\tau\cdot X_1$ by symmetry, so $\tau\cdot E=E$. Let $g$ be a surjection fixing $N$ pointwise
and $\bar a\in E$, its entries pinned down by $T$, $|T|\le\kappa$. For $t\in T\setminus N$ choose a
$g$-preimage $p_t$. These are distinct and lie outside $N$, since $g$ fixes $N$. So the identity on
$N$ together with $t\mapsto p_t$ is injective, with domain and range of size at most $\kappa$, whose
complements have size $\kappa^+$, and it extends to a permutation $\tau$. Then $g\tau$ is the identity
on $T$, so $(g\tau)\cdot\bar a=\bar a$: for an entity $F$ pinned down by $T$,
$F_{(k,t\circ g\tau)}=F_{(k,t)}$, and an individual $a$ is pinned down by $\{a\}$. Thus
$\tau\cdot\bar a\in E$ and $g\cdot(\tau\cdot\bar a)=\bar a$: every member of $E$ is the $g$-image of
a member of $E$.

**Weak inextensibility at $1$.** Suppose $Z$ necessarily holds of every member of $E$. Take $\bar b\in
Y_{(k,s)}$, so that $k=1_K$ and $s|_N$ is injective. Extend $s|_N$ to a permutation $\pi$ and put
$g:=\pi^{-1}s$, which fixes $N$. By pinning and symmetry, $Y_{(1_K,s)}=X_{(1_K,\pi)}=\pi\cdot E$; write
$\bar b=\pi\cdot\bar a$ with $\bar a\in E$, and lift $\bar a$ to $\bar a'\in E$ with $g\cdot\bar
a'=\bar a$. Transport is a left action, so $(1_K,s)\cdot\bar a'=(1_K,\pi)\cdot((1_K,g)\cdot\bar
a')=\bar b$. Since $Z$ holds necessarily of $\bar a'$, $\bar b\in Z_{(1_K,s)}$. At every other arrow
$Y$ is empty. So $Y\le Z$.

**Conclusion.** Every $X$ is coextensive at $1$ with an inextensible $Y$, so Inextensible
Comprehension holds at $1$. It is a closed pure sentence and the models have one object, so it holds
at every arrow: □Inextensible Comprehension holds. Nothing depends on whether the individuals are
$U$ or a single point. The argument uses choice, for the preimages $p_t$ and the extending
permutations.

## Remarks

1. **Choice.** Logical Necessity uses choice in the metatheory, in choosing the witnesses
   $J_\alpha$, and so do the lifts in BF and Rigid Power.
2. **What is left open.** Transversal holds in the finite model and is open here. The finite
   argument breaks in two places:
   - It takes least supports, which need not exist for pinning sets of size $\kappa$.
   - It relabels an arrow fixing the pinning set into one that leaves the entity unchanged. The
     monoid coordinate blocks that step. For Inextensible Comprehension, which had the same
     obstacle, §10 avoids it by making the witness empty once the monoid coordinate leaves $1_K$.
3. **Source.** Astra's note also gives the general criterion: with any monoid factor $K$, BF holds
   iff $K$ is right cancellative. The map records the two instances above.
