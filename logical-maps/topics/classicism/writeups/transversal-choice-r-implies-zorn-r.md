# Transversal Choice implies Zorn's Lemma

The proof follows the route through the Bourbaki–Witt fixed-point lemma in Serge Lang,
*Algebra*, Appendix 2. It applies the Bourbaki–Witt lemma (Background, "Relations, orders and fixed points") to the
$R$-chains, preordered by inclusion. The step function adds a chosen point to any chain
that can be extended. A fixed point is then a chain that nothing extends, and an upper
bound of such a chain is maximal. The translation into C is by Claude Opus 5.5
(Anthropic), prompted by Cian Dorr, 27 October 2026.

**Claim.** For each type $\sigma$, including $e$, Transversal Choice implies Zorn's Lemma
at $\sigma$. The proof uses two consequences of Transversal Choice:

- Transversal at $\sigma$, which is Transversal Choice at $\sigma t$ for coextension;
- Relational Choice at $(\sigma t,\sigma)$, by the recorded result that Transversal Choice
  implies Relational Choice.

Preorder, Total and TotalOrder are as in Background. Everything is unboxed, and the whole
argument takes place at the evaluation point.

## Setting

Fix a preorder $R^{\sigma\sigma t}$, write $x\preccurlyeq y$ for $(Rx)y$, and suppose
every $R$-chain has an upper bound. Here an $R$-chain is a property $C$ with
$\operatorname{TotalOrder}(R,C)$.

For $C^{\sigma t}$ and $y^\sigma$ put $C+y:=\lambda z\, .\,Cz\lor z=y$. Say that $y$
*extends* $C$ if $\neg Cy$ and $C+y$ is an $R$-chain. Whether $y$ extends $C$ depends only
on the extension of $C$.

## The step relation

The relation

$$
(UC)y:=(\neg\exists y'\, .\,y'\text{ extends }C)\lor y\text{ extends }C
$$

is serial, so Relational Choice gives a functional $S\subseteq U$. Transversal gives
$\mathcal T^{(\sigma t)t}$, with exactly one instance coextensive with each property. Put

$$
\begin{aligned}
(FC)D:=\exists C'\,k\, .\,{}&\mathcal TC'\land C'\equiv C\land(SC')k\\
&\land\bigl((k\text{ extends }C\land D\equiv C+k)\lor
(\neg\,k\text{ extends }C\land D\equiv C)\bigr).
\end{aligned}
$$

In words: to step from $C$, take the $\mathcal T$-representative $C'$ of $C$'s
coextension class, take the point $k$ that $S$ chooses for $C'$, and add $k$ to $C$ if it
extends $C$.

## Applying Bourbaki–Witt

Apply the lemma at type $\sigma t$, with:

- $X:=\lambda C\, .\,\operatorname{TotalOrder}(R,C)$, the $R$-chains;
- $\preccurlyeq\ :=\ \subseteq$, so that $\approx$ is $\equiv$;
- $F$ as above.

The hypotheses hold as follows.

**Hypothesis 1.** Inclusion is reflexive and transitive.

**Hypothesis 2: chains have suprema.** Let $Z$ be a family of $R$-chains that $\subseteq$
totally preorders, and put $J:=\lambda x\, .\,\exists C\, .\,ZC\land Cx$.

- $J$ is an $R$-chain. Each of Trans, Antisymm and Total concerns at most three instances
  of $J$. Each of these lies in a member of $Z$, and the members are comparable under
  inclusion, so the largest of those members contains all of them. That member is an
  $R$-chain.
- Every member of $Z$ is included in $J$, and $J$ is included in every property that
  includes all the members.
- So $J$ is a supremum of $Z$. When $Z$ is empty, $J$ is $\bot_{\sigma t}$.

**Hypothesis 3: $F$ is progressive and invariant.** Let $C$ be an $R$-chain.

- *Existence.* $\mathcal T$ has an instance $C'\equiv C$, and $S$ gives $k$ with
  $(SC')k$, so $C$ has an $F$-value.
- *Progress.* Every $F$-value $D$ includes $C$. It is an $R$-chain, since it is
  coextensive with $C+k$ for a $k$ that extends $C$, or else with $C$, and TotalOrder
  depends only on extensions.
- *Invariance.* Let $C\equiv C_1$, $(FC)D$ and $(FC_1)D_1$. The two witnesses for $C'$
  are $\mathcal T$-instances coextensive with $C$, so they are identical by the uniqueness
  clause of Transversal. Functionality of $S$ then gives the same $k$. Since $k$ extends
  $C$ iff it extends $C_1$, $D\equiv D_1$.

Invariance is the only place where Transversal is used. Everything else would work with
$S$ applied to $C$ directly.

## A maximal chain, and a maximal element

By part (c) of the lemma, there is an $R$-chain $m$ such that $D\equiv m$ whenever
$(Fm)D$.

Nothing extends $m$. Suppose something did. Let $C'$ be the $\mathcal T$-instance
coextensive with $m$, and $k$ the point with $(SC')k$. Something extends $C'$, so $(UC')k$
gives that $k$ extends $C'$, and hence $m$. Then $m+k$ is an $F$-value of $m$. It
contains $k$, while $m$ does not, so $m+k\not\equiv m$, contradicting the choice of $m$.

By hypothesis, $m$ has an upper bound $u$. Suppose $u\preccurlyeq y$ but
$y\not\preccurlyeq u$. Then $\neg my$, since every instance of $m$ is $\preccurlyeq u$.
Also $m+y$ is an $R$-chain:

- transitivity holds since $R$ is a preorder;
- every instance $x$ of $m$ has $x\preccurlyeq u\preccurlyeq y$;
- $y\preccurlyeq x$ would give $y\preccurlyeq u$, so antisymmetry holds at $y$.

So $y$ extends $m$, which is impossible. Hence $u\preccurlyeq y$ implies
$y\preccurlyeq u$, and $u$ is maximal. $\square$

## Remarks

**Two kinds of chain.** The lemma's chains are families of $R$-chains, totally preordered
by inclusion, and they need not be antisymmetric. Zorn's Lemma concerns $R$-chains, which
must be antisymmetric. The two notions meet only in hypothesis 2, where a union of
$R$-chains is shown to be an $R$-chain.

**Relational Choice alone.** If the lemma did not require invariance, the argument would
run with $S$ applied to $C$ in place of the $\mathcal T$-mediated $F$. It would then give
Zorn's Lemma from Relational Choice alone. Zorn's Lemma implies Well-Ordering, which
implies Transversal Choice, by the recorded results. So a proof of Zorn's Lemma from
Relational Choice alone would settle the open question whether Relational Choice implies Transversal Choice.

Weak Rigid Comprehension can do the job of the transversal: choose from the weakly rigid
property coextensive with $C$, which is unique by the recorded result that Relational Choice and Weak Rigid
Comprehension imply Transversal Choice.

**Earlier proof.** An earlier version of this write-up followed Jonathan Lewin's proof by
conforming subsets ("A Simple Proof of Zorn's Lemma", *American Mathematical Monthly* 98,
1991). The Lean certificate formalizes that earlier argument.
