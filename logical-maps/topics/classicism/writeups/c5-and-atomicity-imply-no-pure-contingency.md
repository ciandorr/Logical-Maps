# C5 and Atomicity imply No Pure Contingency

Assume $\Box$ND at every type (C5) and Atomicity. The conclusion is No Pure
Contingency: $P\to\Box P$ for every closed pure sentence $P$. *Classicism*
(§2.2, p. 27) reports the theorem as Goodsell and Yli-Vakkuri's without a
proof. The proof below follows Cian Dorr's sketch of 23 September 2026 (with permission from Zachary Goodsell): two distinct atoms are exchanged by a Boolean
automorphism $F$ of the propositions, $F$ is extended by conjugation to
every type, the extension fixes the logical constants and hence every
closed pure term, and so two distinct atoms agree on every closed pure
sentence. Only the type-$t$ instance of Atomicity is used; $\Box$ND is used
at every type occurring in $P$, through ND and BF.

Throughout, $p\le q$ is $\Box(p\to q)$, that is $(p\to q)=\top$; C proves
that the propositions form a Boolean algebra under $\le$ with $\land$,
$\lor$, $\neg$, $\top$, $\bot$ the lattice operations, and that $\Box$ is a
normal operator satisfying K, T and 4 (*Classicism*, §§1.3–1.4, 2.1). We use
these facts, Logical Equivalence (an H-provable equivalence of formulas is
an identity, also under $\lambda$), Leibniz's law, NI, CBF, the Modalized
Fregean Axiom $\Box(p\leftrightarrow q)\to p=q$ and Modalized Functionality
$\Box\forall y\, .\,Xy=Yy\to X=Y$, all theorems of C, and the recorded
consequence BF of $\Box$ND at every type (Proposition 2.3). C is closed
under necessitation: a theorem is derivable in H from finitely many
instances of Logical Equivalence, which are identities, hence necessary by
NI, and the H-derivation is itself an instance of Logical Equivalence.

## 1. Rigid propositions and the lifting lemma

Call $p$ *rigid* when $\Box p\lor\Box\neg p$; equivalently $p=\top\lor p=\bot$,
and then $p$ is true iff $p=\top$.

**Lemma 1.** (i) Every identity proposition $A=_\sigma B$ is rigid. (ii) Rigid
propositions are closed under the connectives. (iii) If $\varphi(y)$ is
rigid for every $y^\sigma$, then $\forall y\, .\,\varphi(y)$ is rigid.

*Proof.* (i) NI gives $A=B\to\Box(A=B)$ and ND gives $A\ne B\to\Box(A\ne B)$.
(ii) If $p,q\in\{\top,\bot\}$ then $p\land q$, $\neg p$ and the rest are
$\top$ or $\bot$ by Leibniz's law and Logical Equivalence. (iii) If
$\forall y\, .\,\varphi(y)$ then $\forall y\, .\,\Box\varphi(y)$, and BF gives
$\Box\forall y\, .\,\varphi(y)$. If not, some $\varphi(y_0)$ is false, so
$\Box\neg\varphi(y_0)$, and $\Box$ is monotone, so
$\Box\exists y\, .\,\neg\varphi(y)$, that is $\Box\neg\forall y\, .\,\varphi(y)$.
$\square$

The order $\le$ and the predicate $\operatorname{Atom}_t$ are built from
identity propositions by connectives and quantifiers, so by Lemma 1 the
hypothesis

$$
H(w,w'):=\operatorname{Atom}_t(w)\land\operatorname{Atom}_t(w')\land w\ne w'
$$

is rigid: $H\to\Box H$. This is what lets material reasoning under $H$ be
lifted to identities.

**Lemma 2 (lifting).** Let $H$ be rigid, and let $P,Q,A,B$ have any free
variables. (i) If $\vdash H\to(P\leftrightarrow Q)$ then $\vdash H\to P=Q$.
(ii) If $\vdash H\to\forall y\, .\,A=B$ then $\vdash H\to(\lambda y\, .\,A)=(\lambda y\, .\,B)$.

*Proof.* (i) Necessitation and K give $\Box H\to\Box(P\leftrightarrow Q)$;
rigidity gives $H\to\Box(P\leftrightarrow Q)$; the Modalized Fregean Axiom
gives $P=Q$. (ii) Likewise $H\to\Box\forall y\, .\,A=B$; by $\beta$ under the
box and the quantifier (Logical Equivalence), $\Box\forall y\, .\,(\lambda y\, .\,A)y=(\lambda y\, .\,B)y$;
Modalized Functionality finishes. $\square$

## 2. Atoms

Fix $w,w'$ with $H(w,w')$, and put $u:=\neg(w\lor w')$.

**Lemma 3.** (i) For every $p$, exactly one of $w\le p$ and $w\le\neg p$
holds; so $(w\le\neg p)=\neg(w\le p)$. (ii) $w\land w'=\bot$; hence exactly
one of $u,w,w'$ is true. (iii) If $w$ is true then, for every $p$,
$w\le p$ iff $p$. (iv) For every $p$, $w\land(w'\le p)$ is $w$ if $w'\le p$
and $\bot$ otherwise; so $w\le w\land(w'\le p)$ iff $w'\le p$.

*Proof.* (i) $w\land p\le w$, so by atomhood $w\land p$ is $\bot$ or $w$, that
is $w\le\neg p$ or $w\le p$; both would give $w\le\bot$, so $w=\bot$,
against atomhood. The identity follows by Lemma 1(i) and (ii): two rigid,
materially equivalent propositions are both $\top$ or both $\bot$. (ii)
$w\land w'$ is below both, so it is $\bot$ or equal to each; if it is not
$\bot$ then $w=w\land w'=w'$. Then $u\lor w\lor w'=\top$ and the three are
pairwise disjoint. (iii) $w\le p$ gives $p$ by T. If $p$ and not $w\le p$,
then $w\le\neg p$ by (i), so $\neg p$ by T. (iv) $w'\le p$ is rigid, so it
is $\top$ or $\bot$, and $w\land\top=w$, $w\land\bot=\bot\ne w$. $\square$

## 3. The automorphism $F$

Define

$$
F:=\lambda p\, .\,(u\land p)\lor(w\land(w'\le p))\lor(w'\land(w\le p)).
$$

**Lemma 4.** Under $H$, for all $p,q,G^{\sigma t},x^\sigma,y^\sigma$, the
following hold as identities:

$$
FFp=p,\quad F\neg p=\neg Fp,\quad F(p\land q)=Fp\land Fq,\quad F\top=\top,\quad
F(\forall y\, .\,Gy)=\forall y\, .\,F(Gy),\quad F(x=y)=(x=y).
$$

Moreover $w\le Fp$ iff $w'\le p$, and $w'\le Fp$ iff $w\le p$.

*Proof.* By Lemma 2(i) it suffices to prove each as a material
equivalence under $H$, with the displayed variables free. By Lemma 3(ii)
we may split on which of $u,w,w'$ is true.

*Case $u$.* Then $w,w'$ are false, so $Fp\leftrightarrow p$ for every $p$,
and every equivalence is immediate.

*Case $w$.* Then $u,w'$ are false, so $Fp\leftrightarrow(w'\le p)$ for every
$p$. Now $F\neg p\leftrightarrow(w'\le\neg p)\leftrightarrow\neg(w'\le p)$
by Lemma 3(i); $F(p\land q)\leftrightarrow(w'\le p\land q)\leftrightarrow(w'\le p)\land(w'\le q)$
since $\Box$ distributes over $\land$; $F\top\leftrightarrow(w'\le\top)$,
true; $F(\forall y\, .\,Gy)\leftrightarrow\Box\forall y\, .\,(w'\to Gy)\leftrightarrow\forall y\, .\,\Box(w'\to Gy)\leftrightarrow\forall y\, .\,F(Gy)$
by CBF and BF at $\sigma$; and $F(x=y)\leftrightarrow(w'\le(x=y))\leftrightarrow(x=y)$,
because $x=y$ is $\top$ or $\bot$ by Lemma 1(i) and $w'\not\le\bot$. For
$FFp$: by Boolean algebra and Lemma 3(ii), $w'\land Fp=w'\land(w\le p)$, so
$w'\le Fp$ iff $w\le p$ by Lemma 3(iv); hence
$FFp\leftrightarrow(w'\le Fp)\leftrightarrow(w\le p)\leftrightarrow p$ by
Lemma 3(iii).

*Case $w'$.* Symmetric, with $Fp\leftrightarrow(w\le p)$.

The two entailment claims are Lemma 3(iv) applied to
$w\land Fp=w\land(w'\le p)$ and $w'\land Fp=w'\land(w\le p)$. $\square$

Since every connective is a Boolean combination of $\neg$ and $\land$ by
Logical Equivalence, $F$ commutes with each of them, and $F\bot=\bot$.

## 4. Conjugation to all types

Define closed terms $F^*_\sigma:\sigma\to\sigma$ (with parameters $w,w'$) by
recursion on the type:

$$
F^*_e:=\lambda x\, .\,x,\qquad F^*_t:=F,\qquad
F^*_{\sigma\tau}:=\lambda X\, .\,\lambda y\, .\,F^*_\tau\bigl(X(F^*_\sigma y)\bigr).
$$

**Lemma 5.** Under $H$: $F^*_\sigma(F^*_\sigma x)=x$ for every type $\sigma$
and every $x$; consequently $F^*_\sigma x=F^*_\sigma y\to x=y$, and
$(F^*_{\sigma\tau}X)(F^*_\sigma y)=F^*_\tau(Xy)$.

*Proof.* Induction on $\sigma$. Type $e$ is $\beta$; type $t$ is Lemma 4.
For $\sigma\tau$: by $\beta$,
$F^*(F^*X)=\lambda y\, .\,F^*_\tau\bigl(F^*_\tau\bigl(X(F^*_\sigma(F^*_\sigma y))\bigr)\bigr)$.
By the induction hypotheses at $\sigma$ and $\tau$ and Leibniz's law, the
body equals $Xy$ for each $y$, and Lemma 2(ii) lifts this under
$\lambda y$; $\eta$ gives $X$. The consequences are Leibniz's law and
$\beta$. $\square$

**Lemma 6.** Under $H$, $F^*$ fixes every logical constant:
$F^*_t\top=\top$, $F^*_{tt}\neg=\neg$, $F^*_{ttt}\land=\land$ (and so each
connective), $F^*_{\sigma\sigma t}(=_\sigma)=(=_\sigma)$ and
$F^*_{(\sigma t)t}\forall_\sigma=\forall_\sigma$.

*Proof.* Each is $\beta$, the identities of Lemma 4, Lemma 5 and Lemma
2(ii) to pass under the abstractions, then $\eta$. For the connectives:
$F^*\neg=\lambda p\, .\,F(\neg Fp)=\lambda p\, .\,\neg FFp=\lambda p\, .\,\neg p$;
$F^*{\land}=\lambda p\,q\, .\,F(Fp\land Fq)=\lambda p\,q\, .\,p\land q$. For
identity: $F^*(=)=\lambda x\,y\, .\,F(F^*x=F^*y)=\lambda x\,y\, .\,(F^*x=F^*y)=\lambda x\,y\, .\,(x=y)$,
the last step by Lemma 5 in both directions. For the quantifier:
$F^*\forall_\sigma=\lambda G\, .\,F\bigl(\forall y\, .\,F(G(F^*y))\bigr)=\lambda G\, .\,\forall y\, .\,FF(G(F^*y))=\lambda G\, .\,\forall y\, .\,G(F^*y)$,
and $\forall y\, .\,G(F^*y)$ is materially equivalent to $\forall y\, .\,Gy$
under $H$, since $F^*$ is an involution: instantiate at $F^*y_0$ and use
$F^*F^*y_0=y_0$. Lemma 2(i) makes this an identity. $\square$

**Lemma 7.** For every pure term $A$ of type $\tau$ with free variables
among $\bar x$, under $H$:

$$
F^*_\tau A=A[F^*\bar x/\bar x].
$$

*Proof.* Induction on $A$. A variable is immediate; a logical constant is
Lemma 6. For an application $AB$ with $A:\sigma\tau$, $B:\sigma$: by Lemma
5, $F^*_\tau(AB)=(F^*A)(F^*B)$, and the induction hypotheses give
$A[F^*\bar x](B[F^*\bar x])$. For an abstraction $\lambda y\, .\,A$ with
$y:\sigma$: by $\beta$, $F^*(\lambda y\, .\,A)=\lambda z\, .\,F^*_\tau(A[F^*z/y])$.
The induction hypothesis for $A$, with $y$ among its free variables,
instantiated at $y:=F^*z$, gives
$F^*_\tau(A[F^*z/y])=A[F^*\bar x/\bar x,\ F^*F^*z/y]=A[F^*\bar x/\bar x,\ z/y]$
by Lemma 5; Lemma 2(ii) passes this under $\lambda z$, and renaming the
bound variable gives $(\lambda y\, .\,A)[F^*\bar x/\bar x]$. $\square$

**Corollary 8.** For every closed pure sentence $P$, under $H(w,w')$:
$FP=P$, and therefore $w\le P$ iff $w'\le P$.

*Proof.* $FP=P$ is Lemma 7 with $\bar x$ empty. By Lemma 4,
$w\le P$ iff $w\le FP$ iff $w'\le P$. $\square$

## 5. Conclusion

Let $P$ be a closed pure sentence and suppose $P$. If $P\ne\top$ then
$\neg P\ne\bot$, and Atomicity at type $t$ gives an atom $w'\le\neg P$.
Since $P$ is true, $P\ne\bot$, and Atomicity gives an atom $w\le P$. Then
$w\ne w'$, for otherwise $w\le P\land\neg P=\bot$. So $H(w,w')$ holds, and
Corollary 8 gives $w'\le P$; with $w'\le\neg P$ this makes $w'\le\bot$,
contradicting atomhood. Hence $P=\top$, that is $\Box P$. $\square$

## 6. Remarks

The hypotheses are used as follows. Atomicity: only at type $t$, in §5.
ND at a type $\sigma$: to make identity propositions at $\sigma$ rigid
(Lemma 1(i)), used for $F^*(=_\sigma)$ and for the rigidity of $H$. BF at
$\sigma$: for $F$ to commute with $\forall_\sigma$ (Lemma 4) and for
Lemma 1(iii); both ND and BF follow from $\Box$ND, and conversely
ND and BF give $\Box$ND (Proposition 2.4). The Modalized Fregean Axiom and
Modalized Functionality, theorems of C, are what allow the material
reasoning under the non-theorem hypothesis $H$ to yield identities; the
rigidity of $H$ is essential there, since a contingent hypothesis could
not be carried under the box.
