# Vicinity, Boolean Completeness at $t$ and Relational Choice imply Actuality

The theorem is due to GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, in research notes of 25–26
October 2026 in Daniel Kodsi's pull request #18. Astra proves it for C5, and transfers it to C with
Vicinity by interpreting C5 there. Cian Dorr suggested running the C5 argument directly, with
5-necessity in place of necessity. The proof below does that, and was written by Claude Opus 5.5
(Anthropic), prompted by Cian Dorr, 28 October 2026.

**Claim.** C, together with Vicinity, Boolean Completeness at $t$ and Relational Choice with inputs and
outputs of type $t$, proves Actuality. Every premise is unboxed.

**The idea.** Vicinity gives a true proposition $s$, the strongest 5-necessary truth. Below $s$ every
identity statement is settled, and quantification over settled families of propositions is computed
by meets and joins. So below $s$ the situation is as in C5, with "settled" in place of C5's "crisp".
Astra's C5 argument then goes through.

- If there is no true atom, follow the true parts of a system of partitions down a chain of truths.
  Its glb is false.
- Code the chain by a single proposition, so that a settled chain follows it.
- The glb of a settled family of truths is true, which is a contradiction.

The chain arguments are the Bourbaki–Witt lemma and its admissible variant (Background, *Relations,
orders and fixed points*). They replace the chain lemmas of Astra's proof.

## 0. What Vicinity provides

Let $v$ witness Vicinity and put $s:=v\land\forall r\, .\,r\to v\le\Diamond r$, which is true. As in the
proof that Vicinity and Relational Choice imply Transversal Choice, call $p$ *settled* if $s\le p$ or
$s\le\neg p$, and a property *settled* if each of its instances is. A settled $p$ is true iff $s\le p$.
That proof gives three lemmas:

- **Lemma 1.** Every identity statement is settled.
- **Lemma 2 (collection, Sun).** If $s\le Fx$ for every $x$, then $s\le\forall x\, .\,Fx$.
- **Lemma 3.** A formula built by connectives and quantifiers from identities $a=b$, and from atoms $Yb$
  where each $Y$ is a settled property or is bound by a quantifier restricted to settled properties, is
  settled.

One more is needed.

**Lemma 4 (settled families).** Let $A$ be a settled property of propositions. Then:

1. $s\land\forall p\, .\,(Ap\to p)\le p$ for every $p$ with $Ap$;
2. $s\land p\le\exists q\, .\,(Aq\land q)$ for every $p$ with $Ap$;
3. $s\land\exists q\, .\,(Aq\land q)\le w$ whenever $w$ is an upper bound of the $p$ with $Ap$.

*Proof.* If $Ap$ then $s\le Ap$, which gives (1) and (2). For (3), $s\le(Aq\land q\to w)$ for every
$q$: if $Aq$, because $q\le w$; if not, because $s\le\neg Aq$. Lemma 2 gives
$s\le\forall q\, .\,(Aq\land q\to w)$. $\square$

We work below $s$ throughout. For $p,q\le s$, an identity $s\land p=s\land q$ is an identity $p=q$.

## 1. Reduction to an atomless truth below $s$

"$p$ is an atom" is built from identities, so it is settled by Lemma 3. Let
$z:=\exists p\, .\,(\operatorname{Atom}(p)\land p)$. If $z$ is true, some atom is true, and a true atom
witnesses Actuality.

Suppose $z$ is false, and put $h:=s\land\neg z$, which is true. Then nothing below $h$ is an atom. For
let $q\le h$ be an atom. Then $s\le\operatorname{Atom}(q)$, so $q=s\land q\le z$ by Lemma 4. Also
$q\le\neg z$, so $q=\bot$, which is impossible for an atom.

So assume that $h\le s$ is true and that every nonzero $p\le h$ has some $q$ with $\bot<q<p$. We derive
a contradiction.

## 2. Partitions, by Relational Choice

Let

$$
R(p,q):=\bigl[\bot<p\le h\land\bot<q<p\bigr]\lor\bigl[\neg(\bot<p\le h)\land q=\bot\bigr].
$$

$R$ is serial and settled. Relational Choice gives a functional $K$ with $K\subseteq R$. Following
Astra, put

$$
c_p(q):=K(p,q)\land R(p,q)\land\forall z\, .\,(K(p,z)\land R(p,z))\to z=q,\qquad
d_p:=\exists q\, .\,c_p(q),
$$

$$
a:=h\land\forall p\, .\,d_p,\qquad u_0(p,q):=p\land c_p(q)\land q,\qquad u_1(p,q):=p\land c_p(q)\land\neg q .
$$

Each $d_p$ is true, since the $K$-value of $p$ makes some $c_p(q)$ true. So $a$ is true, and
$a\le h\le s$.

Fix $\bot<p\le a$. The values $u_i(p,q)$ have three properties.

- **They are pairwise disjoint.** For $q\ne q'$, $c_p(q)\land c_p(q')\le(q=q')$. That identity is
  false, so $s\le\neg(q=q')$, and since $p\le s$, $u_i(p,q)\land u_j(p,q')=\bot$. And
  $u_0(p,q)\land u_1(p,q)=\bot$.
- **The nonzero ones are proper parts of $p$.** If $u_i(p,q)\ne\bot$ then $s\land R(p,q)\ne\bot$, so
  $R(p,q)$, which is settled, is true. Hence $\bot<q<p$, so $u_0(p,q)\le q<p$ and
  $u_1(p,q)\le p\land\neg q<p$.
- **Their join is $p$.** $\exists q\, .\,(u_0(p,q)\lor u_1(p,q))=p\land d_p=p$. And if $w$ bounds every
  value, then $s\le(u_0(p,q)\lor u_1(p,q)\to w)$ for every $q$. So, by Lemma 2,
  $p=s\land p\le w$.

Let

$$
\operatorname{Child}(p,r):=\bot<p\le a\land r\ne\bot\land\exists q\, .\,(r=u_0(p,q)\lor r=u_1(p,q)),
$$

which is settled by Lemma 3. For $\bot<p\le a$, the $r$ with $\operatorname{Child}(p,r)$, the
*children* of $p$, are pairwise disjoint and strictly below $p$, and their join is $p$. In particular
$p$ has at least two children. By Lemma 4 and $p\le s$,
$p=s\land\exists r\, .\,(\operatorname{Child}(p,r)\land r)$. So if $p$ is true, exactly one child of $p$
is true: at least one by this identity, and at most one by disjointness.

## 3. The chain of true parts

On $X:=\lambda p\, .\,p\le a$, ordered by $\ge$ (so that suprema are glbs), let

$$
F(p,r):=\bigl[\neg p\land r=p\bigr]\lor\bigl[p\land\operatorname{Child}(p,r)\land r\bigr].
$$

$F$ is a functional relation on $X$ with $F(p)\le p$, strictly when $p$ is true. Boolean Completeness at
$t$ gives every chain in $X$ a glb, which lies in $X$ (the empty chain has supremum $a$).

The Bourbaki–Witt lemma, in its case for partial orders, gives a tower $M$, the least property closed
under $F$ and glbs of chains. Its glb $m$ satisfies $Mm$ and $F(m)=m$. Four facts about $M$ follow.

1. **$m$ is false**, because $F$ strictly decreases truths.
2. **Every other member of $M$ is true.** Let $Mq$ with $q$ false, so that $F(q)=q$. The property
   $\lambda x\, .\,Mx\land q\le x$ is closed. For $F$, if $q<x$ this is clause (b) of the lemma, and if
   $x=q$ it holds because $F(q)=q$. For glbs it is immediate. So $m\ge q$, and $q=m$.
3. **$m$ is the glb of $M':=\lambda x\, .\,Mx\land x\ne m$.** That glb $t$ satisfies $Mt$. If $t\ne m$,
   then $t$ is true, so $F(t)<t$, and $F(t)$ is true with $M'F(t)$, which is impossible.
4. **$q\le F(p)$ whenever $q<p$ are members of $M$**, by clause (b).

## 4. The discarded parts, coded by a second choice

Let

$$
\Delta(d):=\exists p\,r\, .\,Mp\land p\land F(p,r)\land\operatorname{Child}(p,d)\land d\ne r,
$$

so that the members of $\Delta$ are the false children of true members of $M$.

- **They are pairwise disjoint.** Two discarded at the same parent are disjoint children. If $d$ is
  discarded at $p$ and $d'$ at $q<p$, then $d'\le q\le F(p)$, while $d$ is a child of $p$ other than
  $F(p)$, so $d\land F(p)=\bot$.
- **Every true member of $M$ has one**, since it has at least two children and only one is true.

Relational Choice, applied to the serial relation
$[\Delta(d)\land\operatorname{Child}(d,r)]\lor[\neg\Delta(d)\land r=\bot]$, gives a functional subrelation,
whose value at $d\in\Delta$ we write $r_d$. So $r_d$ is a child of $d$. By Boolean Completeness, let $b$
be the join of the $r_d$. For every $d\in\Delta$,

$$
b\land d=r_d .
$$

For $r_d\le b\land d$, and $\neg d\lor r_d$ bounds every $r_e$, since $r_e\le e\le\neg d$ for $e\ne d$.
Let

$$
\operatorname{Mixed}(x):=x\land b\ne\bot\land x\land\neg b\ne\bot,\qquad
H(c):=\exists e\, .\,\operatorname{Child}(c,e)\land\operatorname{Mixed}(e),
$$

both settled by Lemma 3.

- **$H$ fails at every $d\in\Delta$.** A child $e$ of $d$ is $r_d$, which is below $b$, or else
  disjoint from $r_d$, in which case $e\land b=e\land d\land b=e\land r_d=\bot$. Either way $e$ is not
  mixed.
- **$H$ holds at every true member $c$ of $M$.** A child $d$ of $c$ discarded there has
  $d\land b=r_d\ne\bot$ and $d\land\neg b=d\land\neg r_d\ne\bot$.

So at a true member $p$ of $M$, exactly one child satisfies $H$, namely $F(p)$. It is a true member of
$M$, while the other children are in $\Delta$.

## 5. The decoded step

Let

$$
g:=\lambda p\, .\,p\land\exists c\, .\,(\operatorname{Child}(p,c)\land H(c)\land c),
$$

a term of type $tt$. Let $p$ be a true member of $M$. The property
$\lambda c\, .\,\operatorname{Child}(p,c)\land H(c)$ is settled, and $F(p)$ is its only instance. So, by
Lemma 4 and $F(p)\le p\le s$,

$$
g(p)=F(p).
$$

This is an identity, not merely an agreement in truth value.

## 6. The settled chain, and the contradiction

Apply the Bourbaki–Witt lemma for admissible chains to $X$, ordered by $\ge$, with the graph of $g$ as
the step and the settled properties as the admissible ones. Its hypotheses hold:

- $g(p)\le p$;
- settled chains have glbs in $X$, by Boolean Completeness;
- the properties its proof forms ($X$, the tower, the pivots and each $N_{c,e}$) are settled.

The last holds by Lemma 3, as in the proof that Vicinity and Relational Choice imply Transversal
Choice: every atom of their definitions is an identity, $g$ being a term, or is applied to a variable
bound to settled properties. So the tower $N$ is closed under $g$ and under glbs of settled chains, and
it is a chain.

**Claim A: $M\subseteq N$.** It suffices that $\lambda p\, .\,Mp\land Np$ is closed under $F$ and under
glbs of chains, since $M$ is the least such property.

- If $p$ is in both and false, then $F(p)=p$.
- If $p$ is in both and true, then $F(p)=g(p)$ is in $N$.
- Let $Z$ be a chain inside both, with glb $t$. Then $Mt$. Moreover $L:=\lambda p\, .\,Np\land t\le p$ is
  a settled chain, by Lemma 3 with $t$ as a parameter, so its glb is in $N$. That glb is $t$:
  $Z\subseteq L$ makes it at most $t$, and $t$ bounds $L$ from below.

**Claim B: every member $p$ of $N$ with $m<p$ is true.** $N$ is a chain containing every true member of
$M$. If $p$ were false, it could not lie above a true member, so it would lie strictly below each of
them. It would then be a lower bound of $M'$, and $p\le m$ by fact 3.

**Claim C: $m$ is true.** Let $I:=\lambda p\, .\,Np\land m<p$, which is settled, and put
$w:=s\land\forall p\, .\,(Ip\to p)$. By Claim B, $w$ is true. By Lemma 4 it lies below every member of $I$.
These include every member of $M'$, by Claim A, so $w\le m$ by fact 3.

This contradicts fact 1 of §3. $\blacksquare$

## Remarks

**Where the premises are used.**

- **Vicinity** is used only through $s$ and Lemmas 1–4.
- **Relational Choice** is used twice, for the partitions and for the code $b$. Neither relation needs to
  be settled.
- **Boolean Completeness at $t$** supplies the glbs of chains for $M$ and for $N$, and the join $b$.

**Comparison with Astra's proof.** Astra's §§3–6, the partitions, the truth-guided chain, the code and
the decoded operation, appear here in §§2–5, with "crisp" read as "settled below $s$". Astra then builds
a crisp chain for $g$ that is wellordered against all subproperties, and compares it with $M$ by initial
segments. Claims A–C replace that comparison: closedness shows $M\subseteq N$, and the chain property of
$N$ shows its members above $m$ are true. The fixed point of $g$ is never needed.

**The boxed form.** The proof is a derivation in C, so its necessitation gives the boxed form.
