# Strong Atomicity and Rigid Comprehension imply □Rigid Comprehension

Proof by GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 22 October 2026;
rewritten for the map by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr,
24 October 2026.

**Theorem.** In C, Strong Atomicity and Rigid Comprehension
imply □Rigid Comprehension, at every argument tuple including individual and mixed
ones. Both premises are unboxed.

**Overview.** First, the premises give BF at every relational type (Lemma 4),
using the cuts of the
[□Strong Atomicity](strong-atomicity-and-rigid-comprehension-imply-necessary-strong-atomicity.html)
write-up together with Rigid Power. Then, for a relation $X$ with a relational
argument type, each strong propositional world $w$ yields a rigid $P_w$ that is
coextensive with $X$ wherever $w$ is true. Since some strong atom is true at every
world, $X$ has a rigid coextension at every world, and BF moves the quantifier over
$X$ inside the box (Lemma 5). A coding by haecceities extends this to individual and
tuple arguments (Lemma 6).

We use Lemmas 1–3 and the notation of □Strong Atomicity write-up:
$\operatorname{Decides}$, $\operatorname{Union}$, the cover $A$ with (a) $\Box A\bot$,
(b) $A\le\operatorname{Decides}$, (c) $\operatorname{Union}(A)=\top$, and the cuts
$\operatorname{Cut}_Y$.

## Lemma 4: BF at relational types

*Let $\sigma$ be relational, and assume Strong Atomicity at $\sigma$,
and Rigid Comprehension and Rigid Power at $\sigma t$.* Then BF holds at $\sigma$.

*Proof.* Let $A^{\sigma t}$ be the cover of Lemma 1, and by Rigid Power let

$$
\mathcal P:=\lambda R^{\sigma t}\, .\,\operatorname{Rigid}(R)\land R\le A,
$$

which is rigid. By Lemmas 2 and 3,

$$
\Box\forall Y^\sigma\, .\,\mathcal P(\operatorname{Cut}_Y)\land Y=\operatorname{Union}(\operatorname{Cut}_Y).
\tag{1}
$$

Let $X^{\sigma t}$ satisfy $\forall Y\, .\,\Box XY$. Every $R$ with $\mathcal PR$ has
$\Box X(\operatorname{Union}(R))$. By weak inextensibility of $\mathcal P$,

$$
\Box\forall R\, .\,\mathcal PR\to X(\operatorname{Union}(R)),
$$

and with (1), $\Box\forall Y\, .\,XY$. $\square$

Strong Atomicity implies Atomicity, and Atomicity with Rigid
Comprehension implies Rigid Power (both recorded), so the premises of the theorem
give BF at every relational type.

## Lemma 5: one relational argument

*Let $\sigma$ be relational. Assume Strong Atomicity at $t$, Rigid
Comprehension at $\sigma t$ and at $tt$, and BF at $\sigma$ and at $\sigma t$.* Then

$$
\Box\forall X^{\sigma t}\, .\,\exists Y^{\sigma t}\, .\,\operatorname{Rigid}(Y)\landX\equiv Y.
$$

*Proof.* Let $A^{tt}$ be the cover of Lemma 1 at $t$. Here
$\operatorname{Decides}(w)$ is $\forall q^t\, .\,w\le q\lor w\le\neg q$, and (c) says
$\Box\exists w\, .\,Aw\land w$. For $X^{\sigma t}$ put

$$
\operatorname{HasRigidCoext}(X):=\exists Y^{\sigma t}\, .\,\operatorname{Rigid}(Y)\landX\equiv Y.
$$

Fix $X^{\sigma t}$, and let $w$ be an instance of $A$. By Rigid Comprehension at
$\sigma t$ there are rigid $P$ and $Q$ with

$$
\forall z\, .\,(Pz\leftrightarrow w\le Xz),\qquad\forall z\, .\,(Qz\leftrightarrow w\le\neg Xz).
$$

Each $z$ with $Pz$ has $\Box(w\to Xz)$, and each $z$ with $Qz$ has $\Box(w\to\neg Xz)$;
by weak inextensibility of $P$ and of $Q$,

$$
\Box\forall z\, .\,Pz\to(w\to Xz),\qquad\Box\forall z\, .\,Qz\to(w\to\neg Xz).
\tag{2}
$$

By $\operatorname{Decides}(w)$, every $z$ has $Pz\lor Qz$, so $\Box(Pz\lor Qz)$ by
persistence, and by BF at $\sigma$

$$
\Box\forall z\, .\,Pz\lor Qz .
\tag{3}
$$

From (2) and (3),

$$
\Box\bigl(w\toX\equiv P\bigr),
$$

and as $\operatorname{Rigid}(P)$ is necessary,
$\Box(w\to\operatorname{HasRigidCoext}(X))$. This holds for every instance $w$ of $A$:

$$
\forall w\, .\,Aw\to\Box\bigl(w\to\operatorname{HasRigidCoext}(X)\bigr).
$$

By weak inextensibility of $A$,
$\Box\forall w\, .\,Aw\to(w\to\operatorname{HasRigidCoext}(X))$, and with
$\Box\exists w\, .\,Aw\land w$,

$$
\Box\operatorname{HasRigidCoext}(X).
$$

This holds for every $X^{\sigma t}$, and BF at $\sigma t$ gives
$\Box\forall X\, .\,\operatorname{HasRigidCoext}(X)$. $\square$

Only the actual instances of BF are used, and $P$ and $Q$ may depend on $w$; no
choice is made uniformly in $w$.

## Lemma 6: coding tuples by haecceities

For a tuple $\bar\sigma$ (possibly containing $e$, possibly empty) let
$\delta:=\bar\sigma t$, and for $\bar x^{\bar\sigma}$ let
$H_{\bar x}:=\lambda\bar z\, .\,\bar z=\bar x$, of type $\delta$. Put
$\operatorname{Code}(H):=\exists\bar x\, .\,H=H_{\bar x}$. C proves
$H_{\bar x}=H_{\bar y}\leftrightarrow\bar x=\bar y$.

*Claim.* It is a theorem of C that if Rigid Comprehension holds for properties of
type $\delta t$, it holds for relations of type $\bar\sigma t$.

*Proof.* Let $X^{\bar\sigma t}$. Take a rigid $P^{\delta t}$ coextensive with
$\lambda H\, .\,\exists\bar x\, .\,H=H_{\bar x}\land X[\bar x]$, and put

$$
Y:=\lambda\bar x\, .\,P(H_{\bar x}).
$$

By injectivity of the codes, $Y$ is coextensive with $X$.

*$P$ contains only codes.* Each instance $H$ of $P$ is $H_{\bar a}$ for some $\bar a$,
so $\Box\operatorname{Code}(H)$. By weak inextensibility of $P$,

$$
P\le\operatorname{Code}.
\tag{4}
$$

*$Y$ is rigid.* Persistence of $Y$ is persistence of $P$ at the arguments
$H_{\bar x}$. For weak inextensibility, work at any world and suppose

$$
\forall\bar x\, .\,Y[\bar x]\to\Box Z[\bar x].
$$

Let $PH$. By (4), $H=H_{\bar a}$ for some $\bar a$; then $Y[\bar a]$, so
$\Box Z[\bar a]$, and $\Box(H=H_{\bar a})$. By injectivity of the codes,

$$
\Box\forall\bar x\, .\,H=H_{\bar x}\to Z[\bar x].
$$

So weak inextensibility of $P$, applied to
$\lambda H\, .\,\forall\bar x\, .\,H=H_{\bar x}\to Z[\bar x]$, gives
$\Box\forall H\, .\,PH\to\forall\bar x\, .\,(H=H_{\bar x}\to Z[\bar x])$. Taking
$H:=H_{\bar x}$ gives $Y\le Z$. Since $\operatorname{Rigid}(P)$ and (4) are necessary, this
holds at every world, so $Y$ is rigid. $\square$

## Proof of the theorem

By Lemma 4 and the remark after it, BF holds at every relational type. For a
tuple $\bar\sigma$, apply Lemma 5 with $\sigma:=\delta=\bar\sigma t$ (a relational
type): necessarily, Rigid Comprehension holds for properties of type $\delta t$. The
necessitation of Lemma 6 then gives, necessarily, Rigid Comprehension for relations
of type $\bar\sigma t$. $\square$

## Remarks

1. Lemma 4 strengthens the recorded
   [Strong Atomicity, □Rigid Comprehension and Rigid Power imply BF at relational types](strong-atomicity-necessary-rigid-comprehension-and-rigid-power-imply-bf-relational.html)
   by weakening □Rigid Comprehension to Rigid Comprehension. Including $\bot$ in
   the cover is what makes every cut rigid at every world (Lemma 2), so the
   argument needs no comprehension at other worlds.
2. With [□Strong Atomicity](strong-atomicity-and-rigid-comprehension-imply-necessary-strong-atomicity.html)
   and the recorded result that □Strong Atomicity and □Rigid Comprehension imply □BF
   at relational types, this gives □BF at relational types. That settles the
   conjecture from Bacon's Theorem 8.2
   ([□Strong Atomicity and Rigid Comprehension imply □BF at relational types](necessary-strong-atomicity-and-rigid-comprehension-imply-necessary-bf-relational.html)),
   whose book proof has a gap at non-actual worlds, from weaker premises.
3. BF at $e$ does not follow: the recorded model
   [Full action model: two-object chain, one individual becoming two](full-two-object-chain-new-individual.html)
   satisfies both premises and fails it.
4. With the recorded C theorem that Rigid Comprehension implies Boolean Completeness,
   the theorem also gives □Boolean Completeness.
