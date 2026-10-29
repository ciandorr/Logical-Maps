# Symmetric ideally-full model: recurrent finite colour approximations

Construction and proofs by GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, research note of
26 October 2026. Checked and rewritten for the map by Claude Opus 5.5 (Anthropic), prompted
by Cian Dorr, 28 October 2026.

At $W_1$ this model satisfies:

- □BF, □Rigid Power, □Boolean Completeness;
- Tame Rigidity and Atomlessness.

It fails:

- Weakly Rigid Power and □Tame Rigidity, both at type $et$;
- Weak Rigid Comprehension at $et$.

So BF, Tame Rigidity and Rigid Power, even with BF and RP boxed and with □BC, do not give Weakly
Rigid Power.

The earlier separation of Tame Rigidity and Rigid Power from Weakly Rigid Power,
symmetric-finite-compression-entrance, used a one-way collapse of labels. Here every object can
return to a finite-colour object, and that is what makes BF hold everywhere.

## The model

**Objects and colours.** There is an object $W_m$ for each positive integer $m$, and an object
$W_\infty$. Each has as base a copy of $\mathbb N$, in which a set $E_V$ of *coloured* points is
fixed: $|E_{W_m}|=m$, and $E_{W_\infty}$ is infinite and coinfinite. Every uncoloured complement
is infinite.

**Arrows and symmetries.** For every pair of objects, the arrows $V\to W$ are the surjections $f$
of the bases with $f[E_V]\subseteq E_W$. The symmetry group at $V$ is the permutations
preserving $E_V$ setwise. Every object carries the ideal of finite sets.

**Domains and evaluation.** The domains are the symmetric ideally-full ones (Dorr, Definitions
15–18). The individuals are the base points, and an entity of relational type is a symmetric
intension pinned down by a finite set. The constants of Σ denote top elements. Evaluation point:
$1_{W_1}$.

**Finite prescriptions.** A finite partial map $V\to W$ that sends coloured points to coloured
points extends to an arrow. Send the remaining coloured points to some point of $E_W$, and use
the infinitely many uncoloured points to cover the rest of $W$. This is used throughout.

## 1. □BF

Every arrow is surjective. So the group's argument barcan-surjective applies at each object: an
entity pinned down by $M$ at the target of $h$ is the transport along $h$ of the entity built
from a finite section of $h$ over $M$. Transport is therefore onto at every type and every
object, and BF holds necessarily. In particular, every universal relation is rigid.

## 2. Exact images and Tame Rigidity at the finite-colour objects

For a set $D$ of tuples, let $H_D$ be the profile $h\mapsto h[D]$.

**Lemma.** Fix $A=W_m$ and a finite $S\supseteq E_A$. If $D$ is closed under the endomorphisms
of $A$ that fix $S$ pointwise, then $H_D$ is pinned down by $S$ and symmetric. So it is in the
domain, and it is rigid.

*Proof.* Let $h,h^{\prime}:A\to V$ agree on $S$, and let $a\in D$ be pinned down by $M$. Choose
$u:A\to A$ fixing $S$ with $hu=h^{\prime}$ on $M$, using $h$-preimages on $M\setminus S$. This $u$
is an arrow, because every coloured point is in $S$, which $u$ fixes. Then $u\cdot a\in D$ and
$h^{\prime}\cdot a=h\cdot(u\cdot a)$. So $h^{\prime}[D]\subseteq h[D]$, and by symmetry the two
are equal. Symmetry of $H_D$ follows from $(gh)[D]=g\cdot h[D]$. An exact image is rigid. $\square$

**Tame Rigidity at $A$.** Let $F$ be weakly rigid at $A$, and let $S$ contain a pin of $F$ and
$E_A$. An endomorphism fixing $S$ fixes $F$, so by weak persistence $D:=F_{1_A}$ is closed under
it. By the lemma, $H_D$ is in the domain and rigid. Coextensive weakly rigid relations are
identical, so $F=H_D$. Hence Tame Rigidity holds at every $W_m$, at every type, and every rigid
relation there is an exact image.

## 3. At $W_\infty$, a weakly rigid relation that is not rigid

At $B:=W_\infty$, let $U$ have extension $E_V$ at every arrow $h:B\to V$. It is pinned down by
$\varnothing$ and symmetric, and it is weakly persistent because arrows preserve colour.

**$U$ is weakly inextensible.** Let a test $Z$, pinned down by a finite $N$, hold necessarily of
every coloured point of $B$, and take $h:B\to V$ and $y\in E_V$. Choose a coloured $x\notin N$,
and extend $h|_N$ together with $x\mapsto y$ to an arrow $j$. Then $y=j\cdot x\in Z_j=Z_h$. So
$U\le Z$.

**$U$ is not rigid.** Take an arrow $c:B\to W_1$, so that $c\cdot U$ has extension $E_{W_1}=\{a\}$.
The haecceity of $a$ is rigid and coextensive with $c\cdot U$. Along any arrow back to $B$,
though, the haecceity has one instance and $c\cdot U$ infinitely many. So $c\cdot U$ is not
weakly inextensible at $W_1$, and $U$ is not rigid.

So Tame Rigidity fails at $W_\infty$, and □Tame Rigidity at $et$ fails at $W_1$. Tame Rigidity
holds at $W_1$ and is a closed pure principle, so No Pure Contingency fails as well.

## 4. Rigid Power

**Lifting into a finite-colour target.** Fix $A=W_1$ and a rigid $F$ at $A$. Let $N$ be finite,
containing $E_A$ and a pin of $F$. Let $h:A\to V$ with $V=W_m$, and let $Y\le h\cdot F$ be rigid
at $V$, with a finite pin $T\supseteq E_V$.

1. Extend $h|_N$ to an arrow $j$ that maps $A\setminus N$ bijectively onto $V\setminus h[N]$.
   Then $j\cdot F=h\cdot F$, and the nonsingleton fibres of $j$ lie inside $N$.
2. Let $P$ be finite, containing $N$ and one $j$-preimage of each member of $T$.
3. Let $D':=\{a\in F_{1_A}:j\cdot a\in Y_{1_V}\}$. Since $F$ and $Y$ are exact images,
   $j[D']=Y_{1_V}$.
4. Let $u$ fix $P$ pointwise. Then $ju=vj$ for a surjection $v$ of $V$ that fixes $T$, so $v$ is
   an endomorphism. Weak persistence of $F$ and $Y$ makes $D'$ closed under $u$.
5. By the lemma of §2, $X:=H_{D'}$ is rigid. Then $X\le F$ and $j\cdot X=Y$, two coextensive
   rigid relations at $V$ being identical.

**Lifting into $W_\infty$, by compression.** Now let the target be $B=W_\infty$, with
$Y\le h\cdot F$ rigid there and pinned down by $T$. Put $L:=T\cup h[N]$.

1. Choose a finite $K\subseteq E_B$ with $L\cap E_B\subseteq K$, and let $V:=W_{|K|}$.
2. Let $k:V\to B$ be a bijective arrow mapping $E_V$ onto $K$.
3. Let $c:B\to V$ be an arrow agreeing with $k^{-1}$ on $L$. Then $kc$ fixes $T$, so
   $k\cdot(c\cdot Y)=Y$.
4. $g:=k^{-1}h$ is an arrow $A\to V$, since the coloured points of $A$ lie in $N$. Moreover
   $c\cdot Y\le g\cdot F$.
5. The finite-colour case gives $v$ agreeing with $g$ on $N$ and a rigid $X\le F$ with
   $v\cdot X=c\cdot Y$.
6. Then $j:=kv$ agrees with $h$ on $N$, and $j\cdot X=Y$.

**Rigid Power at $W_1$.** Let $Z$ hold necessarily of every actual rigid $X\le F$, and let $N$ also
contain a pin of $Z$. At any arrow $h$, a rigid $Y\le h\cdot F$ is $j\cdot X$ for such an $X$ and
some $j$ agreeing with $h$ on $N$, by the two liftings. So $Y\in Z_j=Z_h$. Hence the property of
being rigid and below $F$ is weakly inextensible. It is persistent, so by Tame Rigidity it is
rigid. This holds at every type.

**□Rigid Power.** With □BF the universal relation of each type is rigid. Rigid Power applied to
it makes the property of being rigid itself rigid, which is Rigid Rigidity. Rigid Rigidity and
Rigid Power give □Rigid Power (result
rigid-rigidity-and-rigid-power-imply-necessary-rigid-power, which is Astra's §11).

## 5. Weakly Rigid Power fails at $W_1$

Let $F$ be the universal relation of type $et$, which is weakly rigid. Let $\mathcal W$ be the
property of being a weakly rigid relation that entails $F$. Its actual instances are rigid, by
Tame Rigidity at $W_1$, so they necessarily satisfy the test of being rigid. But along an arrow
$h:W_1\to W_\infty$, the relation $U$ of §3 lies in $\mathcal W$ and is not rigid. So $\mathcal W$
is not weakly inextensible, and Weakly Rigid Power fails at $F$.

## 6. □Boolean Completeness and Atomlessness

**□Boolean Completeness.** Dorr's hull theorem (Theorem 36) applies at every object. Take $M_0$ to
be the colour set at a $W_m$, and $\varnothing$ at $W_\infty$.

- **(B1).** Prescriptions agreeing with one arrow on $P$ and another on $Q$ are consistent on
  $P\cap Q\subseteq M$, and they respect colour, so they extend to an arrow.
- **(B2).** At a $W_m$, the points of $P$ outside $N\supseteq M_0$ are uncoloured and can be moved
  off $Q$ by a symmetry fixing $N$. At $W_\infty$ both colour classes are infinite, so the same
  holds.

So Boolean Completeness holds at every object.

**Atomlessness.** Let $p\ne\bot$ be pinned down by $S$ and true at some arrow $h$. For distinct
uncoloured $a,b\notin S$, there are arrows agreeing with $h$ on $S$ that collapse $a$ and $b$, and
others that keep them apart, and all of them lie in $p$. So the proposition that $a$ and $b$ are
collapsed splits $p$. Actuality fails everywhere.

## 7. Weak Rigid Comprehension fails at $et$

Let $a$ be the coloured point of $W_1$, and suppose $G$ is weakly rigid and coextensive with
$\lambda x\,.\,x\ne a$. Let $G$ be pinned down by a finite $S\ni a$, and take an uncoloured
$x\notin S$, so that $G$ holds of $x$. An endomorphism fixing $S$ and sending $x$ to $a$ fixes $G$,
so weak persistence gives $a$ in $G$'s extension, which is false.
