# Strong Atomicity, Weak Rigid Comprehension and Relational Choice imply Intensional Choice

The construction is Cian Dorr's, proposed on 20 October 2026: choose, for each atom of type $t$, a
strong atom of type $\sigma t$ rather than an individual. The details and the pair lemma are by Claude
Opus 5.5 (Anthropic), 20 October 2026. Lean-verified the same day: the proof follows this
write-up step by step (`Classicism.Proofs.strong_atomicity_weak_rigid_comprehension_and_relational_choice_imply_intensional_choice`,
with the pair lemma as `box_pairs_of_weaklyInextensible`), and is a theorem of C⁻.

Fix $\sigma$ and let $F^{\sigma t}$ satisfy $\Box\exists y\, .\,Fy$. Strong Atomicity
is used at type $\sigma t$, and at type $t$ through Atomicity (type $t$), which they imply. Relational
Choice is used at types $t,\sigma t$, and Weak Rigid Comprehension at type $(\sigma t)t$. Only T and 4
are needed from the modal logic; BF and ND are not used. In this write-up an *atom* is an atom of type
$t$.

## The construction

Put
$$U:=\lambda wX\, .\,\operatorname{Atom}(w)\to\bigl(\operatorname{SAtom}_{\sigma t}(X)\land X\le\lambda y\, .\,w\land Fy\bigr).$$
It is serial. A non-atom is related to everything. For an atom $w$, $\Diamond w$ and
$\Box\exists y\, .\,Fy$ give $\Diamond\exists y\, .\,(w\land Fy)$, so $\lambda y\, .\,w\land Fy$ is not
bottom and Strong Atomicity gives a strong atom below it. Relational Choice gives a
functional $V$ with $VwX\to UwX$; write $X_w$ for the value of an atom $w$. Weak Rigid Comprehension gives
a weakly rigid $R$ coextensive with $\lambda X\, .\,\exists w\, .\,\operatorname{Atom}(w)\land VwX$, so
the actual instances of $R$ are exactly the $X_w$. Put
$$G:=\lambda y\, .\,\exists X\, .\,RX\land Xy .$$

## Two facts about the actual instances

**(a)** Let $A(X):=X\le F\land\forall Y^{\sigma t}\, .\,X\le Y\lor X\le\neg Y$. Then $\Box A(X_w)$ for
every atom $w$: $X_w\le F$, and $\le$ is boxed, so 4 gives the first conjunct necessarily; the second is
the boxed clause of $\operatorname{SAtom}_{\sigma t}(X_w)$.

**(b)** For all atoms $w,w'$,
$$\Box\bigl(X_w=X_{w'}\lor\neg(\exists y\, .\,X_wy\land\exists z\, .\,X_{w'}z)\bigr).$$
If $w=w'$, functionality gives $X_w=X_{w'}$, and identities are necessary. If $w\ne w'$, then
$w\land w'$ lies below the atom $w$, so it is $w$ or bottom, and likewise for $w'$; as $w\ne w'$ it is
bottom. Since $X_w\le\lambda y\, .\,w$ and $X_{w'}\le\lambda y\, .\,w'$, the two are necessarily not
both instantiated.

## Pair lemma

**Lemma.** Let $R$ be weakly inextensible, and suppose $\Box Z(a,b)$ for all $a,b$ with $Ra$ and $Rb$.
Then $\Box\forall ab\, .\,Ra\land Rb\to Z(a,b)$.

*Proof.* Fix $b$ with $Rb$. Weak inextensibility with target $\lambda a\, .\,Z(a,b)$ gives
$R\le\lambda a\, .\,Z(a,b)$, that is, $\Box\forall a\, .\,Ra\to Z(a,b)$, and by 4 this holds
necessarily. So every actual instance $b$ satisfies $\Box T(b)$, where
$T:=\lambda b\, .\,\Box\forall a\, .\,Ra\to Z(a,b)$. Weak inextensibility gives $R\le T$, and T applied
inside the box gives the claim. ∎

## Verification

**$G\le F$.** Weak inextensibility and (a) give $\Box\forall X\, .\,RX\to A(X)$. So necessarily, if $Gy$,
then $RX$ and $Xy$ for some $X$ with $X\le F$, and T gives $Fy$.

**$\Box\exists y\, .\,Gy$.** Suppose otherwise. Atomicity (type $t$) gives an atom
$w_0\le\neg\exists y\, .\,Gy$. Weak persistence gives $\Box RX_{w_0}$. As $X_{w_0}$ is not bottom,
$\Diamond\exists y\, .\,X_{w_0}y$, and $X_{w_0}\le\lambda y\, .\,w_0$, so
$\Diamond(w_0\land\exists y\, .\,Gy)$. This contradicts $w_0\le\neg\exists y\, .\,Gy$.

**Necessarily at most one instance.** Reason inside the box. Suppose $Gy$ and $Gz$, with $RX$, $Xy$,
$RX'$ and $X'z$. The pair lemma with (b) gives $X=X'$. By (a), $X\le\lambda u\, .\,u=y$ or
$X\le\lambda u\, .\,u\ne y$. The second, by T, contradicts $Xy$. So the first holds, and T with $Xz$
gives $z=y$.

So $G\le F$ and $\Box\exists y\, .\,(Gy\land\forall z\, .\,Gz\to z=y)$.

## Remarks

*Why strong atoms.* An atom of type $\sigma t$ settles only actual properties. The uniqueness step needs
$X$ to settle the haecceity $\lambda u\, .\,u=y$ of an instance $y$ at another world, and that $y$ need
not be actual. A strong atom settles every property necessarily, so the condition is persistent and
passes through weak inextensibility as (a).

*Comparison.* The earlier proof,
[BF, Weak Rigid Comprehension, Atomicity and Relational Choice imply Intensional Choice](bf-weak-rigid-comprehension-atomicity-and-relational-choice-imply-intensional-choice.html),
used BF to choose an individual $x$ with $w\le Fx$, and again to pull instances below an atom back to
actual ones. Choosing a property needs no BF, and the pair lemma replaces the pull-back.

*Modalized Relational Choice.* The argument does not extend. With inputs, values would be chosen for
pairs of an atom $w$ and an actual input $x$. Two distinct actual inputs $x_1,x_2$ may, without ND, be
identified at a world where $w$ is true, and the chosen values for $(w,x_1)$ and $(w,x_2)$ are then two
values of the merged input; (b) fails for such pairs. Without BF there is a further gap: an input that
is not actual has no chosen value.
