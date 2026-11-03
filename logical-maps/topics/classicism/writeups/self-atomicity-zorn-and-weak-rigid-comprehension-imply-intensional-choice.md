# Self-Atomicity, Zorn and Weak Rigid Comprehension imply Intensional Choice

The idea is Cian Dorr's (30 October 2026): select one self-atom below $F$ from each "world", make the
selection rigid, and take the property of instantiating a selected self-atom. Dorr selected with
Transversal Choice and Rigid Comprehension. Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, found a
gap in that form and repaired it the same day, selecting a maximal antichain by Zorn's Lemma and needing
only Weak Rigid Comprehension. Not Lean-verified.

Fix $\sigma$ and let $F^{\sigma t}$ satisfy $\Box\exists y\, .\,Fy$. Self-Atomicity is used at type
$\sigma t$, Zorn's Lemma at type $(\sigma t)t$, and Weak Rigid Comprehension at $(\sigma t)t$. Only T and 4
are needed from the modal logic. For $Y^{\sigma t}$ write $\exists Y$ for $\exists y\, .\,Yy$.

## The selection

Let $S(Y)$ say that $Y$ is a self-atom below $F$:
$$S(Y):=Y\ne\bot\land\Box(\exists Y\to\operatorname{Atom}(Y))\land Y\le F.$$
Call $Y$ and $Y'$ *incompatible* if $\neg\Diamond(\exists Y\land\exists Y')$. Let $\operatorname{Anti}(A)$
say that every member of $A^{(\sigma t)t}$ satisfies $S$, and any two members are identical or
incompatible.

Order the families by $A\preceq B:=\operatorname{Anti}(A)\to(\operatorname{Anti}(B)\land A\subseteq B)$.
This is a preorder. Every chain $X$ has an upper bound, namely the union $U$ of the antichains in $X$. Two
members of $U$ lie in antichains $a,a'$ of $X$, and $a\preceq a'$ or $a'\preceq a$ makes one antichain
contain the other. So $U$ is an antichain, and it contains every antichain in $X$. Zorn's Lemma gives a
maximal $A$. It is an antichain: the empty family $\varnothing$ is one, and $A\preceq\varnothing$ holds
vacuously unless $A$ is an antichain, so maximality gives $\varnothing\preceq A$. And no antichain
properly extends it.

Weak Rigid Comprehension gives a weakly rigid $A^*$ coextensive with $A$. Put
$$G:=\lambda x\, .\,\exists Y\, .\,A^*Y\land Yx.$$

## $G$ is below $F$ and has at most one instance at every world

Two facts about the members of $A^*$ are necessary when true, by 4:

- $Y\le F$ and $\Box(\exists Y\to\operatorname{Atom}(Y))$;
- for a fixed member $Y$, $Y'=Y\lor\Box\neg(\exists Y\land\exists Y')$, for every member $Y'$.

Weak inextensibility applied to the property $\lambda Y'\, .\,Y'=Y\lor\Box\neg(\exists Y\land\exists Y')$
carries the second fact to every world, for each fixed member $Y$. The resulting boxed statement is
again necessary when true. So a second application, to the property of $Y$ that it states, carries it to
every world for every member $Y$. The first fact is carried in the same way. Then, necessarily:

- if $A^*Y$ and $Yx$, then $Fx$. So $G\le F$.
- if $A^*Y$, $A^*Y'$, $Yx$ and $Y'x'$, then $Y=Y'$. Moreover $Y$ is instantiated, so it is an atom, and
  an atom of type $\sigma t$ has at most one instance ($\lambda z\, .\,Yz\land z=x$ is a non-bottom part of
  it). So $x=x'$.

## $G$ is necessarily instantiated

Suppose not. Since $F$ is necessarily instantiated, the property
$\lambda x\, .\,Fx\land\neg\exists Y(A^*Y\land\exists Y)$ is then possibly instantiated, hence non-bottom.
Self-Atomicity gives a self-atom $s$ below it, so $S(s)$. Wherever $s$ is instantiated, no member of
$A^*$ is instantiated there. Every member of $A$ is still a member of $A^*$ there, by weak persistence. So
$s$ is incompatible with every member of $A$. Moreover $s\notin A$: $s$ is possibly instantiated, and
where it is, it is not instantiated as a member. So $A\cup\{s\}$ is an antichain properly extending $A$,
contradicting maximality.

## The transversal form, and why it needs repair

Dorr's form takes a transversal of the relation "$X,Y$ are self-atoms that are possibly both instantiated".
Without 5 this need not be an equivalence relation. Take the action model on the poset category with
objects $w_0,u,v$, arrows $w_0\to u$ and $w_0\to v$, and the full propositions. Then $\{u,v\}$, $\{u\}$ and
$\{v\}$ are self-atoms: $u$ and $v$ each see only themselves, so each of these propositions is an atom
wherever it is true. And $\{u\}$ and $\{u,v\}$ are possibly both true, as are $\{u,v\}$ and $\{v\}$, but
$\{u\}$ and $\{v\}$ are not.

The transitive relation "same instance proposition" does not help either. Representatives with instance
propositions $\{u,v\}$ and $\{u\}$ can both be selected, and both are then instantiated at $u$, perhaps by
different individuals. A maximal antichain avoids both problems.

In C5 two self-atoms that are possibly both true are identical: at a world where both are true they are
true atoms, hence identical there, and ND brings the identity back. So the transversal form goes through
in C5, and Relational Choice can replace Transversal Choice there. But in C5 self-atoms are atoms, so that
case already follows from
[Self-Atomicity, Atomicity (type t), Weak Rigid Comprehension and Relational Choice](self-atomicity-atomicity-t-weak-rigid-comprehension-and-relational-choice-imply-intensional-choice.html).
