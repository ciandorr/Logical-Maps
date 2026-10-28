# Symmetric ideally-full model: finite-compression labels at an entrance

Construction and verification by GPT-6 Astra (OpenAI), prompted by Daniel Kodsi,
23 October 2026; checked and rewritten for the map by Claude Opus 5.5 (Anthropic),
prompted by Cian Dorr, 25 October 2026.

At its evaluation point the model satisfies Tame Rigidity and Rigid Power, at every
relational type, and fails Weakly Rigid Power at type $et$. So Tame Rigidity and Rigid
Power do not imply Weakly Rigid Power. It also fails □Tame Rigidity and BF at type $e$.

## The model

It is a symmetric ideally-full model in the sense of Dorr, *Boolean Completeness does not
imply Rigid Comprehension*, Definitions 15–18, p. 8, and so a model of C by its
Proposition 20.

Let $N$ be countably infinite, partitioned into infinitely many infinite blocks $B_i$. Let
$Q$ be a set of labels, all distinct:

- $q_i$ for each block $B_i$, with fibre $R(q_i)=B_i$;
- $q_D$ for each finite $D\subseteq N$, the empty set included, with fibre $R(q_D)=D$;
- $q_\top$, with fibre $R(q_\top)=N$.

There are two objects, the root $A$ with base $N$ and the tail $B$ with base $N\sqcup Q$.

- The arrows $A\to A$ are the surjections $N\to N$.
- The arrows $A\to B$ are the surjections of $N$ onto the summand $N$ of $B$'s base.
- There are no arrows $B\to A$.
- An arrow $B\to B$ is a pair $(f,g)$ of a surjection $f:N\to N$ and a map $g:Q\to Q$ with
  $g(q_\top)=q_\top$ such that
  $$
  f[R(q)]\subseteq R(g(q))\qquad\text{for every label }q.
  \tag{1}
  $$

These compose: $f'f[R(q)]\subseteq f'[R(g(q))]\subseteq R(g'g(q))$. The symmetry group at $A$
is the group of all permutations of $N$. At $B$ it is the group of permutations $\pi$ of $N$
that permute the blocks, acting on labels by $q_i\mapsto q_{\pi i}$ (where
$\pi[B_i]=B_{\pi i}$), $q_D\mapsto q_{\pi[D]}$ and $q_\top\mapsto q_\top$. These preserve
fibres exactly, so they are arrows. Both objects carry the ideal of finite sets. The
individuals are the bases, and every constant of Σ denotes the top element of its type.
Evaluation point: $1_A$.

Write $i:A\to B$ for the entrance that is the identity on $N$. Every arrow $h:A\to B$ is
$i\circ f$ for a surjection $f$ of $N$, and $(f,g)\circ i=i\circ f$. For an entity $X$ and an
arrow $h$ out of its object, $X_h$ is its extension at $h$, and $(h\cdot X)_k=X_{kh}$.

Two facts about rigidity are used throughout.

- **(R1)** Coextensive weakly rigid relations are identical: each is weakly inextensible
  with respect to the other, so each necessarily entails the other.
- **(R2)** An admitted relation $X$ with an *exact-image* profile, $X_h=h[D]$ for every
  arrow $h$ out of its object, where $D=X_1$, is rigid. Its extension at every later arrow
  is the image of its current one, which gives persistence. A test $Z$ that necessarily
  holds of each member of $h[D]$ holds at $k$ of each member of $k[h[D]]$, which gives weak
  inextensibility at $h$.

## 1. Tame Rigidity at the root

**Stable-set lemma.** Let $D$ be a set of root tuples closed under every surjection of $N$
fixing a finite $S\subseteq N$ pointwise. Then $E_h:=h[D]$ defines an admitted relation
pinned by $S$, and it is rigid.

*Proof.* Let $h,h':A\to V$ agree on $S$, and let $a\in D$ have the finite pin $M$. Define
$u$ to fix $S$ and, for $x\in M\setminus S$, to send $x$ to a point $u(x)$ with
$h(u(x))=h'(x)$, which exists because $h$ is onto $N$. Extend $u$ to a surjection of $N$
using the infinitely many remaining points. Then $hu$ agrees with $h'$ on $M$, so
$$
h'\cdot a=(hu)\cdot a=h\cdot(u\cdot a)\in h[D],
$$
since $u\cdot a\in D$. By symmetry $h[D]=h'[D]$. The profile respects symmetries, since
$s[h[D]]=(sh)[D]$, so it is admitted, and it is rigid by (R2). $\square$

Now let $F$ be a weakly rigid root relation, pinned by $S$, with $D=F_{1_A}$. A surjection
$u$ fixing $S$ has $u\cdot F=F$, so weak persistence gives $u[D]\subseteq F_u=D$. The
lemma's exact image of $D$ is rigid and coextensive with $F$, so by (R1)
$$
F_h=h[F_{1_A}]\qquad\text{for every arrow }h\text{ out of }A,
\tag{2}
$$
and $F$ is rigid. This holds at every relational type: Tame Rigidity holds at $A$.

In particular, let $F$ be the exact image of $N$ at type $et$. It is rigid, its extension
at every arrow $h:A\to B$ is $N$, and it is not the universal property: after an entrance,
the labels are individuals outside it. So BF fails at type $e$: every individual at $A$
necessarily satisfies $F$, but it is not necessary that every individual does.

## 2. A weakly rigid fibre relation that is not rigid

For a label $q$, let $U_q$ be the property of individuals at $B$ with
$$
(U_q)_{(f,g)}=R(g(q)).
$$
It is pinned by $\{q\}$ and respects the symmetries at $B$, so it is admitted, and
$(f,g)\cdot U_q=U_{g(q)}$. All its extensions lie in $N$.

**$U_{q_i}$ is weakly rigid.** Weak persistence is (1). For weak inextensibility, let $Z$
be a test with $f(n)\in Z_{(f,g)}$ for every $n\in B_i$ and every arrow $(f,g)$, and let $P$
be a finite pin of $Z$. Enlarge $P$ to contain $q_i$ and every point of each finite fibre
$R(q_D)$ with $q_D\in P$. Fix an arrow $h=(f,g)$ and $y\in R(g(q_i))$; we show $y\in Z_h$.
Choose $n\in B_i\setminus P$. Define $j=(f',g')$:

- $g'=g$ on the labels in $P$, and $g'(q)=q_\top$ for every other label;
- $f'=f$ on $P\cap N$ and on every block whose label is in $P$, except that $f'(n)=y$;
- on an infinite block whose label is not in $P$, $f'$ takes the values needed for
  surjectivity; elsewhere its values are arbitrary.

Condition (1) holds for the labels in $P$: for $q_i$ because $y\in R(g(q_i))$, and for the
other pinned labels because $f'=f$ on their fibres ($n$ lies in no pinned finite fibre).
For the remaining labels it holds trivially, since their fibre $R(q_\top)=N$. Then
$j\cdot n=y\in Z_j$, and $Z_j=Z_h$ because $j$ and $h$ agree on $P$. As $h$ and $y$ were
arbitrary, $U_{q_i}\le Z$.

**$U_{q_i}$ is not rigid.** Fix distinct $a,b\in N$. An arrow $k$ with $g(q_i)=q_{\{a,b\}}$,
$f[B_i]\subseteq\{a,b\}$, $f$ onto $N$ by way of another block, and all other labels sent to
$q_\top$, satisfies (1), and
$$
k\cdot U_{q_i}=U_{q_{\{a,b\}}},\qquad (U_{q_{\{a,b\}}})_{1_B}=\{a,b\}.
$$
The haecceity union $H:=\delta_a\lor\delta_b$ necessarily holds of $a$ and of $b$. Let $m$
fix the label $q_{\{a,b\}}$, send $a$ and $b$ to $a$, be onto $N$, and send every other label
to $q_\top$. It satisfies (1), since $\{a\}\subseteq\{a,b\}$. Then
$$
(U_{q_{\{a,b\}}})_m=\{a,b\}\not\subseteq\{a\}=H_m,
$$
so $U_{q_{\{a,b\}}}$ is not weakly inextensible at $B$, and $U_{q_i}$ is not rigid. In
particular **□Tame Rigidity fails**, $B$ being reachable from $A$.

## 3. Weakly Rigid Power fails at $et$

Let $F$ be the rigid root property of §1, and
$$
W_F:=\lambda X^{et}\, .\,\operatorname{WeaklyRigid}(X)\land X\le F .
$$
By Tame Rigidity at $A$, every current instance of $W_F$ is rigid, and so necessarily
satisfies $\operatorname{Rigid}$. At the entrance $i$, $U_{q_i}$ is weakly rigid and
entails $i\cdot F$, whose extension at every arrow out of $B$ is $N$. So
$U_{q_i}\in(W_F)_i$, but $U_{q_i}\notin\operatorname{Rigid}_i$. Hence $W_F$ is not weakly
inextensible, and Weakly Rigid Power fails for the rigid $F$.

## 4. Rigid Power

### Finite-fibre lemma

Let $T$ be weakly rigid at $B$ with a finite pin $P$, every label in which is a $q_D$ or
$q_\top$, and suppose every current member of $T$ has a finite pin inside $N$. Then $T$ is
the exact image $h\mapsto h[T_{1_B}]$, which is pinned by a finite subset of $N$.

*Proof.* Let $D=T_{1_B}$, and let $S\subseteq N$ contain $P\cap N$ and every point of each
fibre $R(q_D)$ with $q_D\in P$. Let $h=(f,g)$ and $h'=(f',g')$ agree on $S$; their label maps
may differ. For $a\in D$ with a pin $M\subseteq N$, choose a surjection $u_N$ fixing $S$ with
$fu_N=f'$ on $M$, as in §1. Let $u_Q$ fix the labels in $P$ and $q_\top$ and send every
other label to $q_\top$. Then $u=(u_N,u_Q)$ satisfies (1), since it fixes each pinned
finite fibre pointwise. It fixes $P$, so $u\cdot T=T$, and weak persistence gives
$u\cdot a\in D$. Then $h'\cdot a=h\cdot(u\cdot a)\in h[D]$, so $h[D]=h'[D]$. The exact image
is admitted and rigid by (R2), and by (R1) it is $T$. $\square$

### Descent lemma

Let $F$ be rigid at $A$, $h:A\to B$, and $Y\le h\cdot F$ rigid at $B$. Then $Y$ is an exact
image, pinned by a finite subset of $N$.

*Proof.* By (2), every member of $h\cdot F$ or of a transport of it is the transport of a
root tuple, so it has a finite pin inside $N$; and so does every member of $Y$ and of its
transports. Let $P$ be a finite pin of $Y$, and $N_0\subseteq N$ a finite set containing
$P\cap N$ and every point of each fibre $R(q_D)$ with $q_D\in P$. For each block label
$q_i\in P$, choose $z_i\in B_i\setminus N_0$ and put
$$
D_i:=(B_i\cap N_0)\cup\{z_i\}.
$$
The $D_i$ are distinct from one another and from every pinned finite fibre, which lies
inside $N_0$.

- The **compression** $c=(f_c,g_c)$: $f_c$ fixes $N_0$, sends $B_i\setminus N_0$ to $z_i$
  for each pinned block, and is onto $N$ by way of an unpinned block. $g_c$ sends each
  pinned $q_i$ to $q_{D_i}$, fixes the pinned $q_D$ and $q_\top$, and sends every other
  label to $q_\top$. Condition (1) holds, since $f_c[B_i]=D_i$.
- The **return** $r=(\mathrm{id}_N,g_r)$: $g_r$ sends each $q_{D_i}$ to $q_i$, fixes the
  pinned $q_D$ and $q_\top$, and sends every other label to $q_\top$. Condition (1) holds,
  since $D_i\subseteq B_i$.

Then $rc$ agrees with $1_B$ on $P$, so $r\cdot(c\cdot Y)=Y$. Now $T:=c\cdot Y$ is rigid,
with the pin $c[P]$, whose labels are all $q_D$'s or $q_\top$, and its members have pins
inside $N$. By the finite-fibre lemma $T$ is an exact image pinned inside $N$. As $r$ is the
identity on $N$, $r\cdot T=T$, so $Y=T$. $\square$

The rigidity of $Y$ is what makes $c\cdot Y$ weakly rigid. The fibre relation $U_{q_i}$ of
§2 is weakly rigid but not rigid, and compression destroys its weak rigidity.

### Approximate lifting

Let $F$ be rigid at $A$, with extension $E$ and pin $S$. Given an arrow $h:A\to V$, a finite
$N_1\supseteq S$, and a rigid $Y\le h\cdot F$ at $V$, there are an arrow $j:A\to V$ agreeing
with $h$ on $N_1$ and a rigid root $X\le F$ with $j\cdot X=Y$.

*Proof.* Let $T\subseteq N$ be a finite pin of $Y$: any finite pin if $V=A$, and the pin of
the descent lemma if $V=B$. Let $j$ agree with $h$ on $N_1$ and send $N\setminus N_1$
bijectively onto $N\setminus h[N_1]$. It is onto $N$, its fibres with more than one
point all lie in $N_1$, and $j\cdot F=h\cdot F$. Let $P\supseteq N_1$ be finite and contain
a $j$-preimage of each point of $T$, and put
$$
D:=\{a\in E: j\cdot a\in Y_{1_V}\}.
$$
By (2), $(j\cdot F)_{1_V}=j[E]$; since $Y\le j\cdot F$, $j[D]=Y_{1_V}$.

$D$ is closed under the surjections $u$ fixing $P$. Such a $u$ fixes each fibre of $j$ with
more than one point pointwise, so $ju$ is constant on the fibres of $j$, and $ju=vj$ for a
surjection $v$ of $N$. (If $V=B$, extend $v$ to an arrow of $B$ by sending every label to
$q_\top$.) $v$ fixes $T$, since each $t\in T$ is $j(p)$ for some $p\in P$ and
$v(t)=ju(p)=j(p)$. So $v\cdot Y=Y$, and persistence gives $v[Y_{1_V}]\subseteq Y_{1_V}$.
Likewise $u\cdot F=F$ gives $u[E]\subseteq E$. So for $a\in D$,
$j\cdot(u\cdot a)=v\cdot(j\cdot a)\in Y_{1_V}$, and $u\cdot a\in D$.

By the stable-set lemma, the exact image $X$ of $D$ is a rigid root relation. $X\le F$,
since $h[D]\subseteq h[E]$ for every $h$. And $j\cdot X$ is coextensive with $Y$, so by (R1)
$j\cdot X=Y$. $\square$

### Rigid Power holds

Let $F$ be rigid at $A$ and
$$
R_F:=\lambda X\, .\,\operatorname{Rigid}(X)\land X\le F,
$$
which is persistent in C. For weak inextensibility, let $Z$ be a test necessarily holding of
every current instance of $R_F$, and $N_1$ a finite set containing pins of $F$ and $Z$. Fix
an arrow $h$ out of $A$ and $Y\in(R_F)_h$, that is, $Y$ rigid with $Y\le h\cdot F$. Lifting
gives $j$ agreeing with $h$ on $N_1$ and a rigid root $X\le F$ with $j\cdot X=Y$. Since $X$ is
a current instance of $R_F$, $Y=j\cdot X\in Z_j$, and $Z_j=Z_h$ as $j$ and $h$ agree on the
pin of $Z$. So $R_F\le Z$: $R_F$ is weakly rigid, and by Tame Rigidity it is rigid. This
holds at every relational type.

## Remark

The source (§9) explains why higher Rigid Power survives the fibre witness of §2. That
witness is a new relation entity at $B$, though all its members are old individuals.
Every root rigid family of relations is an exact image, so its later members are
transports of root relations. Such a family never acquires $U_{q_i}$, whose
non-rigidity a compression detects.

## Paper references

- **Background: Boolean Completeness does not imply Rigid Comprehension.** Dorr, Cian. Boolean Completeness does not imply Rigid Comprehension. Unpublished draft in progress, 30 July 2026, 27 pages. All page, proposition and lemma locators for this source refer to that draft. Parts of the draft were drafted with AI assistance; its mathematical claims are attributed to the author. — Definitions 15–18, p. 8; Proposition 20. Symmetric ideally-full models, of which this is one.
