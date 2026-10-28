# Strong Atomicity and Rigid Comprehension imply □Strong Atomicity

Proof by GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, 22 October 2026;
rewritten for the map by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr,
24 October 2026.

**Theorem.** Let $\sigma$ be a relational type. In C, Strong Atomicity
Biconditionals at $\sigma$ and Rigid Comprehension at $\sigma t$ imply Strong Atomicity at $\sigma$ necessarily. Both premises are unboxed.

The lemmas below are also used for
[□Rigid Comprehension](strong-atomicity-and-rigid-comprehension-imply-necessary-rigid-comprehension.html).

**Overview.** Take a rigid property $A$ whose instances are exactly the strong
atoms and $\bot$. Every entity $Y$ of type $\sigma$ is then, necessarily, the union
of the instances of $A$ below it, and that subproperty of $A$ is rigid. A rigid
property cannot gain non-bottom instances, so if $Y$ is possible some actual strong
atom lies below it, at every world.

## Notation

Fix a relational type $\sigma=\bar\sigma t$ and write $\bot$ for $\bot_\sigma$. Put

$$
\operatorname{Decides}(W):=\forall Y^\sigma\, .\,W\le Y\lor W\le\neg Y,
$$

so that $\operatorname{SAtom}(W)$ is $W\ne\bot\land\Box\operatorname{Decides}(W)$
(Background, strong and atoms). For a property $R$ of type $\sigma t$, its
*union* is

$$
\operatorname{Union}(R):=\lambda\bar x\, .\,\exists W^\sigma\, .\,RW\land W[\bar x].
$$

Recall that a relation is rigid iff it is necessarily weakly rigid, and that
$X\le Y$ means $\Box\forall\bar x\, .\,X[\bar x]\to Y[\bar x]$.

## Lemma 1: a stable cover

*Assume Strong Atomicity at $\sigma$ and Rigid Comprehension at
$\sigma t$.* By Rigid Comprehension there is a rigid $A^{\sigma t}$ coextensive with
$\lambda W\, .\,\operatorname{SAtom}(W)\lor W=\bot$. It satisfies

$$
\text{(a) }\Box A\bot,\qquad\text{(b) }A\le\operatorname{Decides},\qquad
\text{(c) }\operatorname{Union}(A)=\top_\sigma .
$$

*Proof.* (a) $A\bot$ holds, and $A$ is persistent.

(b) If $AW$, then either $\operatorname{SAtom}(W)$, which gives
$\Box\operatorname{Decides}(W)$, or $W=\bot$, and $\operatorname{Decides}(\bot)$ is a
theorem. So

$$
\forall W\, .\,AW\to\Box\operatorname{Decides}(W),
$$

and weak inextensibility of $A$ gives $A\le\operatorname{Decides}$.

(c) If $\operatorname{SAtom}(W)$ then $AW$, so $\Box AW$, and therefore
$W\le\operatorname{Union}(A)$. If $\operatorname{Union}(A)\ne\top$, Strong Atomicity
Biconditionals give $W$ with $\operatorname{SAtom}(W)$ and
$W\le\neg\operatorname{Union}(A)$. Then $W\le\operatorname{Union}(A)\land
\neg\operatorname{Union}(A)=\bot$, contradicting $W\ne\bot$. $\square$

Each of $\operatorname{Rigid}(A)$, (a), (b) and (c) is necessary if true: the first three
begin with $\Box$ and (c) is an identity. So in Lemmas 2 and 3, which use only
these facts, it is enough to argue at the evaluation point; the arguments are
derivations in C from these facts and can be necessitated.

## Lemma 2: cuts are rigid

*Let $A^{\sigma t}$ be rigid and satisfy (a) and (b).* For $Y^\sigma$, the *cut* of
$A$ at $Y$ is

$$
\operatorname{Cut}_Y:=\lambda W\, .\,AW\land W\le Y .
$$

Then necessarily, for every $Y$, $\operatorname{Cut}_Y$ is rigid.

*Proof.* We show that $\operatorname{Cut}_Y$ is weakly rigid. By the remark above,
$\Box\forall Y\, .\,\operatorname{WeaklyRigid}(\operatorname{Cut}_Y)$; by 4 and the
Converse Barcan Formula (theorems of C) this gives
$\Box\forall Y\, .\,\Box\operatorname{WeaklyRigid}(\operatorname{Cut}_Y)$, which is
the claim.

*Weak persistence.* $AW\land W\le Y$ gives $\Box AW\land\Box(W\le Y)$.

*Weak inextensibility.* Suppose

$$
\forall W\, .\,\operatorname{Cut}_YW\to\Box ZW .
$$

Since $A\bot$ and $\bot\le Y$, $\operatorname{Cut}_Y\bot$, so $\Box Z\bot$. We show

$$
\forall W\, .\,AW\to\Box(\operatorname{Cut}_YW\to ZW).
$$

Let $AW$. By (b), $W\le Y$ or $W\le\neg Y$.

- If $W\le Y$, then $\operatorname{Cut}_YW$, so $\Box ZW$.
- If $W\le\neg Y$, this is necessary, and
  $\Box\bigl(\operatorname{Cut}_YW\to W\le Y\land W\le\neg Y\bigr)$, so
  $\Box(\operatorname{Cut}_YW\to W=\bot)$; with $\Box Z\bot$ this gives
  $\Box(\operatorname{Cut}_YW\to ZW)$.

Weak inextensibility of $A$, applied to $\lambda W\, .\,\operatorname{Cut}_YW\to ZW$,
gives

$$
A\le\lambda W\, .\,(\operatorname{Cut}_YW\to ZW),
$$

and since $\operatorname{Cut}_Y\le A$, $\operatorname{Cut}_Y\le Z$. $\square$

Including $\bot$ in $A$ is essential: otherwise an instance of $A$ below $\neg Y$
could become an instance of $\operatorname{Cut}_Y$ by becoming $\bot$.

## Lemma 3: every entity is the union of its cut

*Let $A^{\sigma t}$ be rigid and satisfy (a), (b) and (c).* Then

$$
\Box\forall Y^\sigma\, .\,Y=\operatorname{Union}(\operatorname{Cut}_Y).
$$

*Proof.* $\operatorname{Union}(\operatorname{Cut}_Y)\le Y$, since
$\exists W\, .\,AW\land W\le Y\land W[\bar x]$ implies $Y[\bar x]$, necessarily.

For $Y\le\operatorname{Union}(\operatorname{Cut}_Y)$, work at an arbitrary world and
suppose $Y[\bar x]$. By (c), $\operatorname{Union}(A)[\bar x]$, so there is $W$ with
$AW\land W[\bar x]$. By (b), $W\le Y$ or $W\le\neg Y$; the second contradicts
$Y[\bar x]\land W[\bar x]$. So $\operatorname{Cut}_YW\land W[\bar x]$, that is,
$\operatorname{Union}(\operatorname{Cut}_Y)[\bar x]$. $\square$

## Proof of the theorem

Let $A$ be as in Lemma 1. By the remark after Lemma 1 it suffices to derive Strong Atomicity at $\sigma$ from $\operatorname{Rigid}(A)$, (a), (b) and
(c). Let $Y\ne\bot$, and put $R:=\operatorname{Cut}_Y$, which is rigid (Lemma 2) with
$Y=\operatorname{Union}(R)$ (Lemma 3).

Suppose every instance of $R$ were $\bot$. Then

$$
\forall W\, .\,RW\to\Box(W=\bot),
$$

so by weak inextensibility of $R$, $R\le\lambda W\, .\,W=\bot$, hence
$\operatorname{Union}(R)\le\bot$ and $Y=\bot$, a contradiction. So there is $W$ with
$RW$ and $W\ne\bot$. Then $AW$, so $\Box AW$, and by (b)
$\Box\operatorname{Decides}(W)$. So $\operatorname{SAtom}(W)$ and $W\le Y$. $\square$

## Remarks

1. The premises used are Strong Atomicity at $\sigma$ and Rigid
   Comprehension at $\sigma t$.
2. With [□Rigid Comprehension](strong-atomicity-and-rigid-comprehension-imply-necessary-rigid-comprehension.html),
   the recorded result that □Strong Atomicity and □Rigid Comprehension imply □BF at
   relational types gives the conclusion of Bacon's Theorem 8.2, whose book proof
   has a gap, from weaker premises.
