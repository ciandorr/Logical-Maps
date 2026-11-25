# Strong Possibility (signature Σ) ⇒ ⊥ (conjecture)

Cian Dorr conjectured this on 22 November 2026, with the mechanism of the
partial proof: Classicism forces a Russell–Myhill collision, and different
maximalist models can place its witness differently. Claude Fable 5.2
(Anthropic), prompted by Cian Dorr, found the sentences and the models and
wrote the proofs below, 21–22 November 2026. Cian Dorr has read the argument
of the Appendix for a constant of type $(t\to t)\to t$. The general proof
in the main text has had no second reader. No Lean verification is claimed.

**Status.** Proved when $\Sigma$ has a constant with an argument of a type
other than $e$. Open when every constant of $\Sigma$ is an individual
constant, a propositional constant or a predicate of individuals; see the
last section.

## The theorem

**Theorem.** Suppose $\Sigma$ has a constant $c$ of type
$\beta_1\cdots\beta_n t$ with some $\beta_i\ne e$. Then there are closed
sentences $E_1$, $E_2$ of $\mathcal L(\Sigma)$, each an existential closure
of a conjunction of identities and distinctnesses, such that

1. C($\Sigma$) proves $E_1\lor E_2$;
2. Maximalism (signature Σ) is consistent with $\neg E_1$, and with
   $\neg E_2$;
3. C proves $E_i\to\Box_{\ne}E_i$ for $i=1,2$.

Hence Strong Possibility (signature Σ) is inconsistent for such $\Sigma$:
by 2 it gives $\Diamond_{\ne}\neg E_1$ and $\Diamond_{\ne}\neg E_2$, by 3 it
gives $\neg E_1$ and $\neg E_2$, contradicting 1.

The models are members of coalesced-definable-root-signature, and the
notation is that of its write-up: a root entity is $(E,u)$, with root
extension $E$ and descriptor $u$, a closed term determined up to provable
identity. Write $u\equiv u'$ for provable identity in C($\Sigma^{+}$), and
$[u]$ for the class of $u$. A root proposition is a pair $(b,[v])$ of a
truth value at the identity and a class of closed sentences. A *root
operator* is a root entity $F=(E',u)$ of type $t\to t$; $E'$ is a set of
root propositions, and $Fp$ is the root proposition
$([p\in E'],[uv])$ for $p=(b,[v])$.

## A free operator on propositions

Write $\beta_i=\bar\zeta\,t$ and define the closed term

$$r:=\lambda x^t\,.\,\exists\bar w\,\bar w'\,.\,c[\bar w,\ \lambda\bar
z^{\bar\zeta}\,.\,x,\ \bar w'],$$

of type $t\to t$, where $\bar w$, $\bar w'$ have the types of the arguments
of $c$ before and after the $i$th. The map $x\mapsto\lambda\bar z\,.\,x$ is
injective on root propositions: $(b,[v])$ goes to the root entity with
descriptor $\lambda\bar z\,.\,v$ whose root extension is everything if $b$
is true and empty if not, the root domains being nonempty. So for **any**
set $R$ of root propositions there is a choice of the root extension of
$c$, namely the tuples whose $i$th member is the image of a member of $R$,
for which

$$r\,p\ \text{ is the root proposition }\ ([p\in R],\,[rv])\qquad
\text{for every root proposition }p=(b,[v]).\tag{1}$$

Call this member of the family *the model with $R$*. Each is a model of
Maximalism (signature Σ). A closed sentence $v$ denotes a root proposition
with descriptor $v$ in all of them; only its truth value depends on $R$.

To show that two closed sentences are not provably identical it suffices to
find an $R$ for which they differ in truth value at the identity. Below,
"descriptors $D$" as a choice of $R$ means: all root propositions, of
either truth value, whose descriptor is in $D$.

## Pairing, and the term $Q$

$$\langle x,y\rangle:=r(rx)\land r(\neg ry),\qquad
Q:=\lambda f^{t\to t}\,.\,\forall p\,.\,r(rp)\to r\langle p,fp\rangle,\qquad
\rho:=\lambda x^t\,.\,\exists F^{t\to t}\,.\,x=QF\land\neg Fx.$$

Let $\mathcal P$, $\mathcal N$, $\Pi$ be the sets of classes of closed
sentences of the forms $rv$, $\neg rw$ and $\langle x,y\rangle$.

**Lemma 1.** (i) $rv\equiv rv'$ only if $v\equiv v'$. (ii) $\mathcal P$,
$\mathcal N$, $\Pi$ are pairwise disjoint. (iii) $\langle
x,y\rangle\equiv\langle x',y'\rangle$ only if $x\equiv x'$ and $y\equiv y'$.

*Proof.* (i) $R$ := descriptors $\{[v]\}$: $rv$ is true, and $rv'$ is true
only if $v'\equiv v$. (ii) $R$ := everything: $rv$ and $\langle
x,y\rangle$ are true and $\neg rw$ is false. $R$ := descriptors $\{[v]\}$:
$rv$ is true, while $\langle x,y\rangle$ would need both $rx\equiv v$ and
$\neg ry\equiv v$, impossible by the first part. (iii) $R$ := descriptors
$\{[rx]\}\cup\mathcal N$: $\langle x,y\rangle$ is true, and $\langle
x',y'\rangle$ is true only if $rx'\equiv rx$, so $x'\equiv x$ by (i). $R$ :=
descriptors $\mathcal P\cup\{[\neg ry]\}$: likewise $\neg ry'\equiv\neg ry$,
so $y'\equiv y$. $\square$

**Lemma 2.** For closed $u$ of type $t\to t$: $[Qu]$ is not in
$\mathcal P\cup\mathcal N\cup\Pi$ and is not $[\top]$. $[\top]$ is not in
$\mathcal P\cup\mathcal N\cup\Pi$.

*Proof.* $R$ := nothing: $Qu$ and $\top$ are true, $rv$ and $\langle
x,y\rangle$ false. $R$ := everything: $Qu$ and $\top$ are true, $\neg rw$
false. $R$ := descriptors $\mathcal P$: every $r(rp)$ is true and every
$r\langle p,up\rangle$ false, its argument having a descriptor in $\Pi$; so
$Qu$ is false. $\square$

**Lemma 3.** $\rho\top$ is false at the identity in every model with $R$.
$[\rho\top]$ is not in $\mathcal P\cup\mathcal N\cup\Pi$, is not $[\top]$,
and is not $[Qu]$ for any closed $u$. And $\rho(Q\rho)\equiv\top$.

*Proof.* $\rho\top$ says that some $F$ has $\top=QF$ and $\neg F\top$. No
root operator $(E',u)$ has $QF=\top$, the descriptors $[Qu]$ and $[\top]$
being different by Lemma 2. With $R$ := everything, $rv$ and $\langle
x,y\rangle$ are true; with $R$ := nothing, $\neg rw$ and $Qu$ are true. The
last claim is the Russell–Myhill argument: if $\neg\rho(Q\rho)$,
instantiating $F:=\rho$ gives $\rho(Q\rho)$; so C proves $\rho(Q\rho)$.
$\square$

**Lemma 4 (agreement).** If $Qu\equiv Qu'$ then $uv\equiv u'v$ for every
closed sentence $v$.

*Proof.* $R$ := descriptors $\mathcal P\cup\{[\langle w,uw\rangle]:w$
closed$\}$. Every $r(rp)$ is true, and for $p=(b,[w])$ the argument of
$r\langle p,up\rangle$ has descriptor $\langle w,uw\rangle$; so $Qu$ is
true. Then $Qu'$ is true, so for the $p$ denoted by $v$ the descriptor
$\langle v,u'v\rangle$ is in $R$. It is not in $\mathcal P$, so it is
$[\langle w,uw\rangle]$ for some $w$, and Lemma 1 gives $w\equiv v$ and
$u'v\equiv uw\equiv uv$. $\square$

## The sentences

$$E_1:=\exists F\,.\,QF=Q\rho\land F(Q\rho)\ne\rho(Q\rho)\land F\top=\rho\top,$$

$$E_2:=\exists F\,.\,QF=Q\rho\land F(Q\rho)\ne\rho(Q\rho)\land F\top\ne\rho\top.$$

**C($\Sigma$) proves $E_1\lor E_2$.** By Lemma 3, $\rho(Q\rho)$: there is
$F$ with $Q\rho=QF$ and $\neg F(Q\rho)$. So $F(Q\rho)$ and $\rho(Q\rho)$
differ in truth value and are distinct. And $F\top=\rho\top$ or not.

**C proves $E_i\to\Box_{\ne}E_i$.** Recall
$\Box_{\ne}p:=\exists q\,.\,q\land\Box(\Diamond q\to p)$. Given a witness
$F$ for $E_i$, let $q$ be the conjunction of its distinctnesses. It is
true. At any world where $q$ is possible each distinctness holds, identity
being necessary; and the identities of $E_i$ hold there, being true at the
starting world. So $E_i$ holds there, with the same witness.

## The two models

Call a class *free* if it is outside $\mathcal P\cup\mathcal N\cup\Pi$. By
Lemmas 2 and 3, $[\top]$, $[Q\rho]$ and $[\rho\top]$ are three different
free classes. For a set $\mathcal V$ of classes and a set $R_0$ of root
propositions with free descriptors, let $R(\mathcal V,R_0)$ consist of

- $(\text{true},d)$ for every $d\in\mathcal P\cup\mathcal N\cup\Pi$;
- $(\text{false},[\langle x,y\rangle])$ whenever $[x]\notin\mathcal V$;
- the members of $R_0$.

This is well defined by Lemma 1.

**Lemma 5.** In the model with $R=R(\mathcal V,R_0)$, for every root
operator $F$:

$$QF\text{ is true at the identity}\iff Fp\notin R\text{ for every }p\in
R\text{ whose descriptor is in }\mathcal V.$$

*Proof.* Let $p=(b,[v])$ and $F=(E',u)$. By (1), $rp=([p\in R],[rv])$,
which is in $R$ iff $p\in R$, a class in $\mathcal P$ being in $R$ only
with the value true. So $r(rp)$ is true iff $p\in R$. Suppose $p\in R$ and
let $z:=Fp$. Then $\neg rz=([z\notin R],[\neg r(uv)])$, in $R$ iff
$z\notin R$. So $\langle p,z\rangle$ is the root proposition with
descriptor $\langle v,uv\rangle$ that is true iff $z\notin R$, and it is in
$R$ iff $z\notin R$ or $[v]\notin\mathcal V$. $\square$

Let $c_\top:=(\text{true},[\top])$ and $e:=(\text{true},[\rho\top])$.

- **Model A:** $\mathcal V:=\{[\top]\}$, $R_0:=\{c_\top,\ e\}$.
- **Model B:** $\mathcal V:=\{[\top],[Q\rho]\}$,
  $R_0:=\{c_\top,\ e,\ a\}$ with $a:=(\text{false},[Q\rho])$.

Let $P$ be the root extension of $\rho$. A root proposition is in $P$ iff
it is $QF$ for some root operator $F=(E',u)$ whose $E'$ omits it; its
descriptor is then $[Qu]$. So $c_\top\notin P$, and $\rho\top$ denotes
$(\text{false},[\rho\top])$.

Call a root operator $(E',u)$ *$\rho$-like* if $Qu\equiv Q\rho$. By Lemmas
3 and 4, a $\rho$-like $F$ has $F c_\top=([c_\top\in E'],[\rho\top])$ and
$Fp=([p\in E'],[\top])$ for any $p$ with descriptor $Q\rho$. And $QF=Q\rho$
iff $F$ is $\rho$-like and $QF$, $Q\rho$ have the same truth value.

**Model A.** The only member of $R$ with descriptor in $\mathcal V$ is
$c_\top$. For $\rho$-like $F$, $Fc_\top\in R$ iff $c_\top\in E'$, since $e$
is in $R$ and $(\text{false},[\rho\top])$ is not. So by Lemma 5

$$QF\text{ is true}\iff c_\top\notin E'\qquad(F\ \rho\text{-like}).$$

- $Q\rho$ is true, since $c_\top\notin P$; it denotes
  $a':=(\text{true},[Q\rho])$.
- $a'\in P$: take $F:=(\emptyset,\rho)$.
- If $QF=Q\rho$, then $F$ is $\rho$-like and $c_\top\notin E'$, so
  $F\top=(\text{false},[\rho\top])=\rho\top$.

So no $F$ witnesses $E_2$: **$E_2$ fails and $E_1$ holds.**

**Model B.** The members of $R$ with descriptor in $\mathcal V$ are
$c_\top$ and $a$. For $\rho$-like $F$, $Fc_\top\in R$ iff $c_\top\in E'$ as
before, and $Fa=([a\in E'],[\top])$ is in $R$ iff $a\in E'$, since $c_\top$
is in $R$ and $(\text{false},[\top])$ is not. So

$$QF\text{ is true}\iff c_\top\notin E'\text{ and }a\notin E'\qquad(F\
\rho\text{-like}).$$

- $a\in P$: take $F:=(\{c_\top\},\rho)$. Then $QF$ is false, so it is the
  proposition $a$, and $a\notin\{c_\top\}$.
- Hence $Q\rho$ is false and denotes $a$. Nothing is circular: $a$ was
  defined as a pair before $R$ was chosen.
- $\rho a=(\text{true},[\top])$, since $a\in P$.
- Let $QF=Q\rho$ and $F(Q\rho)\ne\rho(Q\rho)$. Then $F$ is $\rho$-like and
  $QF$ is false, so $c_\top\in E'$ or $a\in E'$. And
  $Fa=([a\in E'],[\top])$ differs from $\rho a$, so $a\notin E'$. Hence
  $c_\top\in E'$, and $F\top=(\text{true},[\rho\top])\ne\rho\top$.

So no $F$ witnesses $E_1$: **$E_1$ fails and $E_2$ holds.**

This proves the Theorem.

## Remarks

- In a model of Maximalism (signature Σ) where $E_i$ holds with witness
  $F$, the conjunction of the distinctnesses of $E_i$ is a true proposition
  that no closed sentence denotes: it necessitates $E_i$ in the sense
  above, and if it were named, Maximalism would prove $E_i$. So for these
  signatures every model of Maximalism has a proposition, and an entity of
  type $t\to t$, that no closed term denotes.
- No model of C($\Sigma$) embeds, by an injective homomorphism for all term
  operations, into elementary extensions of both Model A and Model B: such
  an embedding preserves $E_1$ and $E_2$, and one of them holds in the
  source.
- When the constant has an argument whose type itself takes a relational
  argument, the root extension of the constant controls $Q$ on whole
  operators and not only one argument at a time, and a shorter argument
  with a unique twin is available. It is in the Appendix.

## What is open

The signatures all of whose constants are individual constants,
propositional constants or predicates of individuals. No closed term then
has a freely choosable root extension on relational arguments, and nothing
is known. The question includes Strong Possibility (pure), left open in
*Classicism*.

## Appendix: constants with a higher-order argument

This was the first case proved. It uses a different term $Q$, with $\rho$,
$E_1$ and $E_2$ defined from it as in the main text.

### A closed term of type $(t\to t)\to t$

Suppose the constant $c$ has type $\beta_1\cdots\beta_n t$ and one argument
type $\beta_i$ is $\alpha_1\cdots\alpha_m t$ with some $\alpha_j\ne e$. Write
$\alpha_j=\gamma_1\cdots\gamma_l t$ and define closed terms of
$\mathcal L(\Sigma)$:

$$h:=\lambda y^{\alpha_j}\,.\,\exists\bar z^{\bar\gamma}\,.\,y[\bar z],\qquad
G:=\lambda F^{t\to t}\,.\,\lambda\bar x^{\bar\alpha}\,.\,F(h\,x_j),\qquad
Q:=\lambda F^{t\to t}\,.\,\exists\bar w\,\bar w'\,.\,c[\bar w,\,GF,\,\bar w'],$$

where $\bar w$ and $\bar w'$ have the types of the arguments of $c$ before
and after the $i$th. (If $l=0$, $h$ is $\lambda y\,.\,y$.) So $G$ has type
$(t\to t)\to\beta_i$ and $Q$ has type $(t\to t)\to t$. When $c$ itself has
type $(t\to t)\to t$, $Q$ is provably $c$.

Work in coalesced-definable-root-signature, with the notation of its
write-up: a root entity is $(E,u)$, with root extension $E$ and descriptor
$u$. Let the root extension of $c$ be

$$E_c:=\{(\bar w,x,\bar w'):x\in\mathfrak E\}$$

for a set $\mathfrak E$ of root entities of type $\beta_i$ still to be
chosen, the other constants being arbitrary. A *root operator* is a root
entity $F=(E',u)$ of type $t\to t$; $E'$ is a set of root propositions.

**(a) $h$ is onto the root propositions.** For a root proposition $(b,v)$
take the root entity $x:=(E,\lambda\bar z\,.\,v)$ with $E$ everything if
$b$ is true and empty if not. Then $h\,x$ has descriptor
$\exists\bar z\,.\,v$, provably identical to $v$, and is true at the
identity iff $E$ is nonempty.

**(b) $G$ is injective on root operators.** $GF$ is the root entity with
descriptor $Gu$ and root extension $\{\bar x:h\,x_j\in E'\}$. If
$E'\ne E''$, some root proposition lies in one and not the other, it is
$h\,x_j$ for some $x_j$ by (a), and the root extensions differ. If the
descriptors $u,u'$ are not provably identical, neither are $Gu,Gu'$: from
$Gu=Gu'$, applying both to a tuple with $x_j:=\lambda\bar z\,.\,p$ gives
$up=u'p$ for a variable $p$, and then $u=u'$.

**(c)** For a root operator $F=(E',u)$, the root proposition $QF$ has
descriptor $Qu$ and is true at the identity iff $GF\in\mathfrak E$, the
root domains being nonempty. By (b), for **any** set $\mathcal S$ of root
operators there is a choice of $\mathfrak E$, namely
$\{GF:F\in\mathcal S\}$, for which $QF$ is true at the identity exactly for
$F\in\mathcal S$.

**(d) $Q$ is injective on closed terms.** If C($\Sigma$) does not prove
$u=u'$ for closed $u,u'$ of type $t\to t$, it does not prove $Qu=Qu'$:
choose $\mathcal S$ to be the root operators with descriptor $u$. Nor does
it prove $Qu=\top$: choose $\mathcal S$ empty.

### Two models

Fix, before any root extension is chosen:

- $P$, the set of root propositions whose descriptor is provably identical
  to $Qu$ for some closed $u$;
- $a:=(\text{false},Q\rho)$ and $c_\top:=(\text{true},\top)$. So $a\in P$,
  and $c_\top\notin P$ by (d).

For a set $S$ of root propositions let $\mathcal S_S$ be the set of root
operators

$$\{(E',u):u\text{ is not provably identical to }\rho,\ c_\top\in E'\}\ \cup\
\{(E',\rho):E'\ne P,\ E'\ne S\},$$

and choose $\mathfrak E$ by (c) so that $QF$ is true at the identity
exactly for $F\in\mathcal S_S$.

- **Model A:** $S_A:=P\setminus\{a\}$.
- **Model B:** $S_B:=(P\setminus\{a\})\cup\{c_\top\}$.

Both satisfy Maximalism (signature Σ), as every member of the family does.

**The root extension of $\rho$ is $P$, in both.** A root proposition $x$ is
in it iff some root operator $F=(E',u)$ has $x=QF$ and $x\notin E'$. $QF$
is the proposition with descriptor $Qu$ that is true at the identity iff
$F\in\mathcal S_S$. So $x$ has a descriptor $Qu$, and by (d) $u$ is
determined up to provable identity. Conversely let
$x=(b,Qu)$.

- $u$ not provably $\rho$: membership of $(E',u)$ in $\mathcal S_S$ depends
  only on whether $c_\top\in E'$, and $x\ne c_\top$. So some $E'$ omits $x$
  and gives $QF$ the truth value $b$.
- $u$ provably $\rho$ and $b$ true: take $E':=\emptyset$, which is neither
  $P$ nor $S$.
- $u$ provably $\rho$ and $b$ false, so $x=a$: take $E':=S$, which omits
  $a$.

Nothing here is circular: $P$, $a$, $c_\top$ and $S$ were fixed before
$\mathfrak E$.

**The twins.** So $\rho$ denotes $(P,\rho)$, which is not in
$\mathcal S_S$; hence $Q\rho$ is false at the identity and denotes $a$. A
root operator $F=(E',u)$ has $QF=Q\rho$ iff $Qu$ is provably $Q\rho$ and
$F\notin\mathcal S_S$, that is, by (d), iff $u$ is provably $\rho$ and
$E'\in\{P,S\}$. The only such $F$ other than $\rho$ is $F^*:=(S,\rho)$.

**The verdicts.** $F^*$ differs from $\rho$ at $Q\rho$: $a\in P$ and
$a\notin S$. $\rho\top$ is the proposition with descriptor $\rho\top$ that
is false at the identity, since $c_\top\notin P$. $F^*\top$ has the same
descriptor and is true at the identity iff $c_\top\in S$.

- Model A: $c_\top\notin S_A$, so $F^*\top=\rho\top$. $E_1$ holds and $E_2$
  fails.
- Model B: $c_\top\in S_B$, so $F^*\top\ne\rho\top$. $E_2$ holds and $E_1$
  fails.

This proves the Theorem for these signatures, with a unique twin in each
model.

