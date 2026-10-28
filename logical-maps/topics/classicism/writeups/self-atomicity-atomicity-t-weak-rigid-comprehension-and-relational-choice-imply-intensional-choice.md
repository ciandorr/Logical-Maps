# Self-Atomicity, Atomicity (type t), Weak Rigid Comprehension and Relational Choice imply Intensional Choice

The construction is Cian Dorr's (20 October 2026), as recorded for Strong Atomicity in
[that write-up](strong-atomicity-weak-rigid-comprehension-and-relational-choice-imply-intensional-choice.html);
the observation that self-atoms suffice is by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25
October 2026, from a survey of Strong Atomicity results. Not Lean-verified.

Fix $\sigma$ and let $F^{\sigma t}$ satisfy $\Box\exists y\, .\,Fy$. Self-Atomicity is used at type
$\sigma t$, Atomicity at type $t$, Relational Choice at types $t,\sigma t$, and Weak Rigid Comprehension at
$(\sigma t)t$. Only T and 4 are needed from the modal logic. An *atom* below is an atom of type $t$, and
$\operatorname{SelfAtom}_{\sigma t}(X):=X\ne\bot\land\Box(\exists y\, .\,Xy\to\operatorname{Atom}_{\sigma t}(X))$.

## The construction

Put
$$U:=\lambda wX\, .\,\operatorname{Atom}(w)\to\bigl(\operatorname{SelfAtom}_{\sigma t}(X)\land X\le\lambda y\, .\,w\land Fy\bigr).$$
It is serial: for an atom $w$, $\Diamond w$ and $\Box\exists y\, .\,Fy$ give $\Diamond\exists y\, .\,(w\land Fy)$,
so $\lambda y\, .\,w\land Fy$ is not bottom and Self-Atomicity gives a self-atom below it. Relational
Choice gives a functional $V$ with $VwX\to UwX$; write $X_w$ for the value at an atom $w$. Weak Rigid
Comprehension gives a weakly rigid $R$ coextensive with $\lambda X\, .\,\exists w\, .\,\operatorname{Atom}(w)\land VwX$,
and $G:=\lambda y\, .\,\exists X\, .\,RX\land Xy$.

## Two facts about the actual instances

**(a)** For every atom $w$, $\Box(X_w\le F)$ and $\Box\Box(\exists y\, .\,X_wy\to\operatorname{Atom}_{\sigma t}(X_w))$:
the first since $\le$ is boxed and 4, the second by 4 on the self-atom clause. By weak inextensibility of $R$,
$$\Box\forall X\, .\,RX\to\bigl(X\le F\land\Box(\exists y\, .\,Xy\to\operatorname{Atom}_{\sigma t}(X))\bigr).$$

**(b)** For all atoms $w,w'$, $\Box\bigl(X_w=X_{w'}\lor\neg(\exists y\, .\,X_wy\land\exists z\, .\,X_{w'}z)\bigr)$,
exactly as in Strong Atomicity write-up: distinct atoms are disjoint, and $X_w\le\lambda y\, .\,w$. This is
where the indices must be atoms rather than self-atoms, which may overlap.

The pair lemma of that write-up then gives $\Box\forall XX'\, .\,RX\land RX'\to X=X'\lor\neg(\text{both instantiated})$.

## Verification

**$G\le F$.** From (a), necessarily an instance $X$ of $R$ has $X\le F$, so $Gy$ gives $Fy$ by T.

**$\Box\exists y\, .\,Gy$.** As in Strong Atomicity write-up, using Atomicity (type $t$): an atom
$w_0\le\neg\exists y\, .\,Gy$ would have $\Box RX_{w_0}$ by weak persistence, $\Diamond\exists y\, .\,X_{w_0}y$ since
$X_{w_0}\ne\bot$, and $X_{w_0}\le\lambda y\, .\,w_0$, so $\Diamond(w_0\land\exists y\, .\,Gy)$.

**Necessarily at most one instance.** Reason inside the box. Suppose $Gy$ and $Gz$, with $RX$, $Xy$, $RX'$ and
$X'z$. The pair lemma gives $X=X'$. By (a), $X$ is instantiated here, so $\operatorname{Atom}_{\sigma t}(X)$ holds
here, and an atom lies below every property or its negation: $X\le\lambda u\, .\,u=y$ or
$X\le\lambda u\, .\,u\ne y$. The second contradicts $Xy$ by T, so the first holds, and $Xz$ gives $z=y$.

So $G\le F$ and $\Box\exists y\, .\,(Gy\land\forall z\, .\,Gz\to z=y)$. ∎

## Remark

Strong Atomicity write-up explains why an atom of type $\sigma t$ would not do: it settles only actual
properties, while the uniqueness step needs the haecceity of an instance at another world. A self-atom
settles every property at the worlds where it is instantiated, and those are the only worlds the step
visits.
