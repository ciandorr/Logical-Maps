# Paired-individuals two-object models: Barcan, rigidity and comprehension

Proofs by GPT-6 Astra (OpenAI), prompted by Cian Dorr, research note of 29 October 2026.
Checked and rewritten for the map by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr,
29 October 2026. No Lean verification is claimed.

The three records paired-individuals-two-object, paired-individuals-two-object-surjective and
paired-individuals-two-object-surjective-at-v share their objects and differ in their arrows
(all block-respecting maps, or the surjective ones) and in the evaluation object. Everything
below is proved at both objects and in both categories. Since a closed sentence holds at an
arrow iff it holds at the identity of the arrow's codomain, and each object reaches the other,
a closed sentence holding at both identities is necessary at either. So every verdict below
holds necessarily in all three records:

- BF at every type (needed only in the first record; the surjective ones have it by
  Classicism, Proposition D.6);
- Tame Rigidity and Rigid Power, at every type;
- Weakly Inextensible Comprehension fails at type $(t)t$, and with it Inextensible
  Comprehension and both boxed forms.

The rest (Rigid Rigidity, Weakly Rigid Power, Weakly Rigid Weak Rigidity, Functionality,
Tractarianism and the BF variants) follows by recorded results.

## Setting

Write $W$ for $\mathbb N$ partitioned into the pairs $\{2k,2k+1\}$ and $V$ for $W$ with the
extra one-point block $\{\star\}$. An arrow sends each block into a block, a pair either
bijectively or onto a point. Relations at an object $A$ are given by their extensions: $F_h$
is the extension of $F$ at the arrow $h\colon A\to B$, a set of tuples from the domains at $B$,
and transport is $(h\cdot F)_k=F_{kh}$. $F$ is pinned down by a finite $S\subseteq A$ when
$F_h=F_{h'}$ for arrows $h,h'$ with the same codomain that agree on $S$. The domains hold
exactly the intensions pinned down by finite sets, and every tuple of entities is pinned down
by the union of its entries' pins (an individual by its singleton). If $a$ is pinned down by $M$
and $f,g$ agree on $M$, then $f\cdot a=g\cdot a$.

At the identity of $A$: $F$ is weakly persistent iff $k\cdot a\in F_k$ for every $a\in F_1$
and every arrow $k$ out of $A$; $F$ is weakly inextensible iff $F_k\subseteq Z_k$ for every
$k$ whenever $Z$ satisfies $k\cdot a\in Z_k$ for every $a\in F_1$ and every $k$.

**Finite prescriptions.** Call a finite set *saturated* if it is a union of blocks and
contains $\star$ when its object is $V$. Every finite set lies in a saturated one, and outside a
saturated set every block is a pair. A block-respecting prescription on finitely many source
blocks extends to an arrow, and to a surjective one: infinitely many source pairs are left;
match them bijectively with the target pairs still to be covered, and, if the target is $V$
and $\star$ is not yet hit, collapse one further source pair onto $\star$.

## 1. The hull criterion

For a set $E$ of tuples at $A$ and finite $N\subseteq A$ let
$$B_N(E)_h:=\{f\cdot a:a\in E,\ f\colon A\to\operatorname{cod}(h),\ f|_N=h|_N\}.$$
It is pinned down by $N$, so it is in the domain, and $k\cdot a\in B_N(E)_k$ for $a\in E$
(take $f=k$).

*Criterion.* If $F$, pinned down by $S$ with $F_1=E$, is weakly rigid, then $F=B_N(E)$ for
every finite $N\supseteq S$: weak persistence gives $f\cdot a\in F_f=F_h$ when $f$ agrees with
$h$ on $N$, and weak inextensibility applied to $Z=B_N(E)$ gives $F\le B_N(E)$. Conversely, if
$F_1=E$ and $F=B_N(E)$ for every finite $N$ containing a pin of $F$, then $F$ is weakly rigid:
weak persistence is $f=k$; and if $Z$, pinned down by $T$, satisfies $k\cdot a\in Z_k$ for all
$a\in E$, then $B_N(E)\le Z$ for $N\supseteq T$ (as $f\cdot a\in Z_f=Z_h$), so $F\le Z$.

## 2. Tame Rigidity

*Factorization.* Let $h\colon A\to B$, $k\colon B\to C$, $S\subseteq A$ finite saturated,
$N\subseteq B$ finite, $f\colon A\to C$ agreeing with $kh$ on $S$, and $M\subseteq A$ finite.
Then there are arrows $r\colon A\to B$ and $j\colon B\to C$ with $r|_S=h|_S$, $j|_N=k|_N$ and
$(jr)|_M=f|_M$. Enlarge $M$ to a saturated set containing $S$, so that $M\setminus S$ is a
union of pairs. Let $K$ be the union of the blocks of $B$ meeting $N\cup h[S]$. Put $r=h$ on
$S$, and send the pairs of $M\setminus S$ bijectively onto distinct pairs of $B$ outside $K$.
Put $j=k$ on $K$ and, on the image $r[P]$ of each pair $P\subseteq M\setminus S$, let $j$ be
$f\circ(r|_P)^{-1}$; this respects blocks because $f$ does, and does not clash with $j=k$ on
$K$. Complete $r$ and $j$ to arrows (surjective ones in the surjective category). On $S$,
$jr=kh=f$; on $M\setminus S$, $jr=f$ by construction.

*Proof of Tame Rigidity at $A$.* Let $F$ be weakly rigid with $F_1=E$ and saturated pin $S$,
and $h\colon A\to B$. $F$ is persistent (C proves that weak rigidity implies persistence), so
$h\cdot F$ is weakly persistent. For weak inextensibility, let $Z$ at $B$, pinned down by $N$,
satisfy $k\cdot b\in Z_k$ for every $b\in F_h$ and every $k$. Let $b\in F_{kh}$. By the
criterion $b=f\cdot a$ with $a\in E$ pinned down by $M$ and $f$ agreeing with $kh$ on $S$. Take
$r,j$ from the factorization. Since $r$ agrees with $h$ on $S$, $r\cdot a\in F_r=F_h$, so
$j\cdot(r\cdot a)\in Z_j=Z_k$; and $j\cdot(r\cdot a)=(jr)\cdot a=f\cdot a=b$. So
$F_{kh}\subseteq Z_k$, $h\cdot F$ is weakly inextensible at every $h$, and $F$ is rigid. This
holds at both objects, so □Tame Rigidity.

## 3. Weakly Inextensible Comprehension fails

Fix the evaluation object $A$. For even $n$ let $p_n$ be the set of arrows $f\colon A\to A$
with $f(n)=n$, pinned down by $\{n\}$, and $E:=\{p_n:n\text{ even}\}$. The relation $X$ of type
$(t)t$ with $X_h=E$ for $h$ into $A$ and $X_h=\varnothing$ otherwise is pinned down by
$\varnothing$, so in the domain, with extension $E$.

*Claim.* For an arrow $f\colon A\to A$, $f\cdot p_m=p_n$ iff $m=n$ and $f(n)=n$. Here
$f\cdot p_m=\{g\colon A\to A: g(f(m))=m\}$. If $m\neq n$, an endomorphism $v$ sending both $n$
and $f(m)$ to $n$ (collapsing their block if they share one) is in $p_n$ but not in
$f\cdot p_m$. If $m=n$ and $f(n)\ne n$, an endomorphism $v$ with $v(n)=n$ and $v(f(n))\ne n$
(the identity on the pair of $n$ if $f(n)=\pi n$) separates them. The converse is immediate.

Now let $Y$ be weakly inextensible with $Y_1=E$, pinned down by $S$. Take an even $n$ whose
pair misses $S$ and a block permutation $g$ of $A$ fixing $S$ (and $\star$) with $g(n)$ in
another pair. Then $Y_g=Y_1=E\ni p_n$. Every member of $E$ necessarily satisfies
$Z:=B_{\{n\}}(E)$, so $Y\le Z$ and $p_n\in Z_g$: $p_n=f\cdot p_m$ for some $f\colon A\to A$
with $f(n)=g(n)\ne n$, against the claim. So no weakly inextensible relation is coextensive
with $X$. Inextensible Comprehension, and the boxed forms by T, fail too.

## 4. Special surjections, exact images, stable hulls

*Special surjections.* Given $h\colon A\to B$ and finite saturated $N\subseteq A$ there is a
surjective arrow $j$ agreeing with $h$ on $N$ such that (i) every pair of $B$ is the bijective
$j$-image of a pair of $A$, and (ii) every fibre of $j$ is finite and only finitely many have
more than one point. Keep $h$ on $N$; for each pair of $B$ meeting $h[N]$ send a fresh pair of
$A$ bijectively onto it; if $\star\in B$ is not yet hit, collapse a fresh pair onto it; match
the remaining pairs of $A$ and $B$ bijectively ($\star\in N$ if $A=V$).

*Exact images.* If $F$ is weakly rigid at $A$ with $F_1=E$, then $F_j=j\cdot E$ for every
special surjection $j$. Let $S$ be a saturated pin of $F$. A member of $F_j=B_S(E)_j$ is
$f\cdot a$ with $f|_S=j|_S$, $a\in E$ pinned down by a saturated $M\supseteq S$. Define an
endomorphism $u$ of $A$: the identity on $S$; on a pair $P$ of $M\setminus S$ that $f$ maps
bijectively onto a pair $Q$, $(j|_{P'})^{-1}\circ f|_P$ for a pair $P'$ mapped bijectively onto
$Q$ by $j$; on a pair that $f$ collapses to $y$, constantly a $j$-preimage of $y$; extended to
an arrow (surjective if required). Then $ju=f$ on $M$, and $u\cdot a\in F_u=F_1=E$ by weak
persistence, so $f\cdot a=j\cdot(u\cdot a)\in j\cdot E$. The other inclusion is weak
persistence.

*Stable hulls.* If $P\subseteq A$ is finite saturated and $D$ is a set of tuples at $A$ with
$u\cdot D\subseteq D$ for every endomorphism $u$ fixing $P$ pointwise, then $Y:=B_P(D)$ has
extension $D$ and is rigid. Its extension is $D$ by the closure (and $u=1$). For saturated
$Q\supseteq P$ and $f\cdot a\in B_P(D)_h$, with $a$ pinned down by a saturated $M\supseteq P$,
take a block permutation $u$ fixing $P$ and moving the pairs of $M\setminus P$ outside $Q$, and
an arrow $r$ equal to $h$ on $Q$ and to $f\circ u^{-1}$ on $u[M\setminus P]$ (compatible, since
$f=h$ on $P$). Then $u\cdot a\in D$ and $f\cdot a=r\cdot(u\cdot a)\in B_Q(D)_h$. So
$B_P(D)=B_Q(D)$, hence $=B_N(D)$ for every finite $N\supseteq P$; $Y$ is weakly rigid by the
criterion, and rigid by Tame Rigidity.

## 5. Rigid Power

Let $F$ be rigid at $A$ with $F_1=E$, and let $R_F:=\lambda X\,.\,\operatorname{Rigid}(X)\land
X\le F$, persistent in C. Fix $h\colon A\to B$, a finite saturated $N$ containing a pin of $F$,
and a rigid $X\le h\cdot F$ at $B$ with extension $D$ and pin $T$.

Take a special surjection $j$ agreeing with $h$ on $N$. Then $j\cdot F=h\cdot F$ and
$D\subseteq F_h=F_j=j\cdot E$. Let $P\subseteq A$ be finite saturated, containing $N$, every
fibre of $j$ with more than one point, and $j^{-1}[T]$, and put $D_0:=\{a\in E:j\cdot a\in D\}$.
Let $u$ be an endomorphism fixing $P$. Then $ju$ is constant on each fibre of $j$, so $ju=vj$
for a unique map $v\colon B\to B$. It respects blocks: a pair $C$ of $B$ is $j[C']$ for a pair
$C'$ of $A$, and $v[C]=j[u[C']]$ lies in a block. It is surjective if $u$ is, and fixes $T$
because $j^{-1}[T]\subseteq P$. By weak persistence and pinning, $u\cdot E\subseteq E$ and
$v\cdot D\subseteq D$, so for $a\in D_0$, $j\cdot(u\cdot a)=v\cdot(j\cdot a)\in D$, and
$u\cdot a\in D_0$. By the stable-hull lemma $Y:=B_P(D_0)$ is rigid; $Y\le F$ since
$D_0\subseteq E$ and $P$ contains a pin of $F$; and by exact images
$(j\cdot Y)_1=Y_j=j\cdot D_0=D$. Coextensive weakly rigid relations are identical, so
$X=j\cdot Y$.

So if $Z$, pinned down by $N'$, necessarily holds of every actual instance of $R_F$, choose $N$
above to contain $N'$: each $X\in(R_F)_h$ is $j\cdot Y$ for an actual instance $Y$ and a $j$
agreeing with $h$ on $N$, so $X\in Z_j=Z_h$. Thus $R_F$ is weakly rigid, and rigid by Tame
Rigidity. This holds at both objects, so □Rigid Power, and with □Tame Rigidity the recorded
result gives □Weakly Rigid Power.

## 6. Local sections and BF

Given $h\colon A\to B$ and finite $N\subseteq A$, $T\subseteq B$, there are arrows
$j\colon A\to B$ with $j|_N=h|_N$ and $\sigma\colon B\to A$ with $j\sigma$ the identity on
$T$. Enlarge $N$ and $T$ to saturated sets and keep $h$ on $N$. For each pair $C$ in $T$ send a
fresh pair of $A$ bijectively onto $C$ under $j$, with $\sigma$ the inverse on $C$; if
$\star\in T$, collapse a further fresh pair of $A$ onto $\star$ under $j$ and let $\sigma$ send
$\star$ to one of its points. Complete both (surjectively if required).

*BF.* Let $R$ at $A$, pinned down by $N$, be necessarily true of each actual entity: $k\cdot
a\in R_k$ for all $a$ and $k$. For $h\colon A\to B$ and $b$ at $B$ pinned down by $T$, take $j$
and $\sigma$ as above. Then $b=(j\sigma)\cdot b=j\cdot(\sigma\cdot b)\in R_j=R_h$. So
$\Box\forall x\,Rx$ holds, at every type and at both objects; hence □BF. With □BF, □Rigid
Power gives □Rigid Rigidity by a recorded result (directly: a rigid $X$ at $B$ pinned down by
$T$ is $j\cdot(\sigma\cdot X)$ with $\sigma\cdot X$ rigid), and the recorded results then give
□Weakly Rigid Weak Rigidity.

## 7. The withdrawn argument barcan-t-fails

The argument recorded on 14 October for the failure of BF at type $t$ in the all-maps record
used the property $Y$ from the argument for 5-necessity, at $V$ the propositions pinned down by
old individuals, and claimed that $\Box(Yz)$ holds for every proposition $z$ at $W$, because
$k\cdot z$ is pinned down by $k[S]$ when $z$ is pinned down by $S$. But $k[S]$ need not consist
of old individuals: an arrow $i\colon W\to V$ may collapse the pair of $a\in S$ onto $\star$.
For $z:=\{f\colon W\to V: f(a)=\star\}$, pinned down by $\{a\}$,
$i\cdot z=\{k\colon V\to V:k(\star)=\star\}$, which is pinned down by no finite set of old
individuals (the identity and an endomorphism sending $\star$ into $\mathbb N$ off that set
agree on it). So $\Box(Yz)$ fails at $i$. Read literally instead (pinned down by individuals in
the range of some arrow from $W$), $Y$ holds of every proposition at $V$, and $\forall z\,Yz$
is $\top$. Either way the counterexample fails, and §6 shows that BF holds. The argument for
5-necessity uses $Y$ only along arrows injective on $S\cup\pi S$, which cannot collapse a pair
of $S$ onto $\star$, and is unaffected.
