# Vicinity and Relational Choice imply Transversal Choice

The theorem is due to GPT-6 Astra (OpenAI), prompted by Daniel Kodsi, in a research note of
26 October 2026 in Daniel Kodsi's pull request #18. Astra's proof interprets C5 inside C
plus Vicinity and proves the result for C5. The direct proof below was written by Claude
Opus 5.5 (Anthropic), prompted by Cian Dorr, 26–28 October 2026. It does not use the
interpretation. Its collection lemma is Christopher Sun's argument for the 5-necessity form
of Vicinity.

**Claim.** For every type $\sigma$, including $e$, C together with Vicinity and Relational
Choice at types $(\sigma t,\sigma)$ proves Transversal Choice at $\sigma$. Every premise is
unboxed, and the whole argument takes place at the evaluation point.

**The idea.** The Zermelo-style argument grows a partial transversal by adding chosen
points, and partial transversals are compared by $\le$, necessary inclusion. That order is
antisymmetric, so coextensive but distinct partial transversals cause no trouble. In C,
what fails is the step to suprema: the union of a chain need not be its least upper bound
under $\le$. Vicinity supplies a truth $s$ that settles every identity statement and lets
universal quantifiers commute with "$s\le\cdots$". That is enough for suprema of chains
whose membership is settled by $s$. The Bourbaki–Witt lemma for admissible chains
(Background, *Relations, orders and fixed points*) needs suprema only for such chains,
provided the properties its proof forms are settled too, and they are.

## What Vicinity provides

Let $v$ witness Vicinity, so that $v$ is true and $\forall q\, .\,q\to v\le\Diamond q$. Put

$$
A:=\forall r\, .\,r\to v\le\Diamond r,\qquad s:=v\land A .
$$

Both conjuncts are true, so $s$ is true. Call a proposition $p$ *settled* if $s\le p$ or
$s\le\neg p$, and a property $Y^{\tau t}$ *settled* if each of its instances is:

$$
\operatorname{Settled}(p):=s\le p\lor s\le\neg p,\qquad
\operatorname{Settled}(Y):=\forall b^\tau\, .\,\operatorname{Settled}(Yb).
$$

Because $s$ is true, a settled proposition is true if and only if $s\le p$. Call this
fact (∗).

**Lemma 1 ($s$ settles identities).** For any $a,b$ of the same type,
$\operatorname{Settled}(a=b)$.

*Proof.* If $a=b$ is true, it is $\top$ by NI. If it is false, $A$ applied to the truth
$a\ne b$ gives $v\le\Diamond(a\ne b)$, and by NI $\Diamond(a\ne b)\le(a\ne b)$. So
$s\le v\le(a\ne b)$. $\square$

**Lemma 2 (collection; Sun).** For $F^{\tau t}$: if $s\le Fx$ for every $x^\tau$, then
$s\le\forall x\, .\,Fx$.

*Proof.* Let $T:=\forall x\, .\,s\le Fx$, which is true. Since $v\land T$ is true and $A$
is true, $E:=(v\le\Diamond(v\land T))$ is true. Being an identity, $E$ is $\top$. It
therefore suffices to show $\vdash E\to(s\to\forall x\, .\,Fx)$, since necessitation then
gives $s\le\forall x\, .\,Fx$.

Assume $E$, $s$ and $\neg Fx$. Since $s$ includes $A$, applying $A$ to $s\land\neg Fx$
gives $G:=(v\le\Diamond(s\land\neg Fx))$. This is an identity, so $\Box G$. From $v$ and
$E$ we get $\Diamond(v\land T)$, hence $\Diamond(v\land T\land G)$. At such a world, $v$
and $G$ give $\Diamond(s\land\neg Fx)$, while $T$ gives $\Box(s\to Fx)$ by instantiation.
These are inconsistent. So $\vdash E\land s\land\neg Fx\to\bot$, and generalizing on $x$
gives $\vdash E\land s\land\exists x\, .\,\neg Fx\to\bot$. $\square$

**Lemma 3 (settledness spreads).** Let $Y_1,\dots,Y_n$ be variables of property types, and
let $\varphi$ be a formula built by truth-functional connectives and quantifiers from atoms
of two kinds:

- identities $a=b$, where $a$ and $b$ are any terms;
- atoms $Y_ib$, where $b$ is any term.

Quantifiers binding a $Y_i$ must be restricted to settled properties, in the form
$\forall Y_i\, .\,\operatorname{Settled}(Y_i)\to\psi$ or
$\exists Y_i\, .\,\operatorname{Settled}(Y_i)\land\psi$. Quantifiers binding other variables
are unrestricted. Then it is a theorem of C, universally closed over the free variables,
that if $v$ witnesses Vicinity, then

$$
\operatorname{Settled}(Y_1)\land\cdots\land\operatorname{Settled}(Y_n)\to\operatorname{Settled}(\varphi).
$$

*Proof.* By induction on $\varphi$, for all lists $Y_1,\dots,Y_n$ at once. Identities are
settled by Lemma 1, and atoms $Y_ib$ by the hypothesis on $Y_i$. Connectives are immediate.

Take $\forall x\, .\,\varphi(x)$, where $x$ is not among the $Y_i$. Every instance
$\varphi(a)$ is settled, by induction. If every instance is true, then by (∗)
$s\le\varphi(a)$ for every $a$, so $s\le\forall x\, .\,\varphi(x)$ by Lemma 2. If some
instance $\varphi(a)$ is false, then by (∗)
$s\le\neg\varphi(a)\le\neg\forall x\, .\,\varphi(x)$. The existential quantifier is dual.

Take $\forall Y\, .\,\operatorname{Settled}(Y)\to\psi$. The formula
$\operatorname{Settled}(Y)$ is built from identities ($s\le Yb$ is the identity
$s\land Yb=s$), so it is settled. If it is false, then
$s\le\neg\operatorname{Settled}(Y)$, and the instance $\operatorname{Settled}(Y)\to\psi$
is settled. If it is true, the induction hypothesis for $\psi$, with $Y$ added to the
list, shows that $\psi$ is settled, and so is the instance. So every instance is settled,
and the previous case applies. The restricted existential quantifier is dual. $\square$

Lemmas 1–3 are all that Vicinity contributes.

## The construction

Fix $\sigma$ and an equivalence relation $R^{\sigma\sigma t}$, which need only be an
equivalence relation actually. The variables $B,D,\dots$ range over properties of type
$\sigma t$. Put

$$
(Qx)y:=\forall z\, .\,(Rx)z\leftrightarrow(Ry)z,\qquad
\overline B:=\lambda x\, .\,\exists y\, .\,(Qx)y\land By,
$$

$$
\operatorname{PT}(B):=\forall x\,y\, .\,Bx\land By\land(Qx)y\to x=y,\qquad
\operatorname{Full}(B):=\forall x\, .\,\overline Bx .
$$

$Q$ is an equivalence relation by pure logic, hence necessarily, and it is actually
coextensive with $R$, since $R$ is actually an equivalence relation. A property $B$ with
$\operatorname{PT}(B)\land\operatorname{Full}(B)$ is therefore a transversal of $R$. We use
$Q$ rather than $R$ so that its symmetry and transitivity can be used under $\Box$.

**Candidates.** $B$ is a *candidate* if $B\le\lambda x\, .\,s$ and
$\Box\operatorname{PT}(B)$. That is, every instance of $B$ entails $s$, and $B$ is
necessarily a partial transversal of $Q$.

**The step.** The relation $(UB)a:=\operatorname{Full}(B)\lor\neg\overline Ba$ is serial:
if $B$ is not full, some $a$ lies outside $\overline B$. Relational Choice gives a
functional $K^{(\sigma t)\sigma t}$ with $K\subseteq U$. For each $B$ put

$$
D_B:=\lambda x\, .\,s\land(KB)x\land\bigl(\forall y\, .\,(KB)y\land(Qx)y\to y=x\bigr)
\land\neg\overline Bx,\qquad
fB:=\lambda x\, .\,Bx\lor D_Bx .
$$

The uniqueness clause in $D_B$ is needed because $K$ is functional only actually, while
candidates must be partial transversals necessarily. Here $f$ is a term of type
$(\sigma t)\sigma t$ with $s$ and $K$ as parameters. So statements such as $D=fB$ and
$fB\le D$ are identity statements, whatever $K$ is.

## Applying the Bourbaki–Witt lemma

Apply the Bourbaki–Witt lemma for admissible chains at type $\sigma t$, with:

- $\mathcal A:=\operatorname{Settled}$, so the admissible properties are the settled ones;
- $X:=\lambda B\, .\,B$ is a candidate;
- $(RB)D:=B\le D$;
- $(FB)D:=(D=fB)$.

Here $\le$ is antisymmetric (Intensionality) and $F$ is functional, so this is the special
case of partial orders: $\approx$ is identity on the candidates. If the hypotheses hold,
part (c) of the lemma gives a candidate $m$ with $fm=m$.

That $m$ is a transversal of $R$. Suppose $\operatorname{Full}(m)$ were false. Let $a$ be
the actual $K$-value of $m$, so $(Km)a$. Since $K\subseteq U$, $\neg\overline ma$. Each
conjunct of $D_ma$ is then true: $s$ is true, and the uniqueness clause holds because $K$
is functional. So $(fm)a$ is true. But $ma$ is false, since $m$ is included in
$\overline m$ by the reflexivity of $Q$. So $fm\ne m$, a contradiction. Hence
$\operatorname{Full}(m)$. Since $m$ is a candidate, $\operatorname{PT}(m)$ is true. So $m$
has exactly one instance in each $Q$-cell. As $Q$ is actually coextensive with $R$, $m$ is
a transversal of $R$, which proves Transversal Choice at $\sigma$.

It remains to check the hypotheses of the lemma.

## Hypothesis 1: $R$ preorders the candidates

$\le$ is reflexive and transitive, and it is antisymmetric as well.

## Hypothesis 2: every settled chain has a supremum

Let $Z$ be a settled property of properties, with $Z\subseteq X$ and
$\operatorname{Total}(R,Z)$. Its members are the $B$ with $ZB$ true, or equivalently, by
(∗), the $B$ with $s\le ZB$. Put

$$
J:=\lambda x\, .\,s\land\exists B\, .\,ZB\land Bx .
$$

*$J$ bounds the members.* If $ZB$ is true, then $s\le ZB$, and this identity is $\top$.
Since $B\le\lambda x\, .\,s$, pointwise $Bx\le s\land ZB\land Bx\le Jx$. So $B\le J$.

*$J$ is a candidate.* $J\le\lambda x\, .\,s$ is clear. For $\Box\operatorname{PT}(J)$, it
suffices to show $s\le\operatorname{PT}(J)$: since $Jx$ entails $s$,
$\neg s\to\operatorname{PT}(J)$ is a theorem. By Lemma 2, applied to each of the four
quantifiers, it suffices to show, for all $x,y,B,B'$,

$$
s\le\bigl(ZB\land ZB'\land Bx\land B'y\land(Qx)y\to x=y\bigr).
$$

If $B$ or $B'$ is not a member, this holds because $s\le\neg ZB$ or $s\le\neg ZB'$, as $Z$
is settled. If both are members, they are comparable, say $B\le B'$. Then $Bx$ entails
$B'x$, and since $B'$ is a candidate,
$s\le\operatorname{PT}(B')\le(B'x\land B'y\land(Qx)y\to x=y)$.

*$J$ is the least candidate bounding the members.* Let $D$ be a candidate with $B\le D$
for every member $B$. For each $B$,

$$
s\le\bigl(ZB\to\forall x\, .\,Bx\to Dx\bigr):
$$

for a member because $B\le D$, and for a non-member because $s\le\neg ZB$. Lemma 2 gives
$s\le\forall B\, .\,ZB\to\forall x\, .\,Bx\to Dx$, so $s\le\forall x\, .\,Jx\to Dx$. Where
$s$ is false, $J$ has no instances, so $J\le D$.

So $J$ is a supremum of $Z$ in $X$. The settledness of $Z$ was used twice, both times to
apply Lemma 2. Without it, the union of a chain bounds it only at the evaluation point.

## Hypothesis 3: $F$ is progressive

Let $B$ be a candidate. Its only $F$-value is $fB$, and $B\le fB$. To see that $fB$ is a
candidate:

- $fB\le\lambda x\, .\,s$, since $B$ and $D_B$ both are.
- $\operatorname{PT}(B)\to\operatorname{PT}(fB)$ is a theorem, so
  $\Box\operatorname{PT}(fB)$ follows from $\Box\operatorname{PT}(B)$.

Here is the theorem. Two $Q$-related instances of $D_B$ are identical, by the uniqueness
clause of $D_B$. An instance of $B$ cannot be $Q$-related to an instance of $D_B$, since
instances of $D_B$ lie outside $\overline B$ and $Q$ is symmetric. Two $Q$-related
instances of $B$ are identical by $\operatorname{PT}(B)$.

Since $F$ is functional and $\le$ antisymmetric, invariance is automatic.

## The new hypothesis: the properties the proof forms are settled

The variant requires $X$, the tower $M$, the property of being a pivot, and each $M_{c,e}$
to be coextensive with admissible properties. In fact each is itself settled, by Lemma 3.

Write out the definitions with the present $X$, $R$ and $F$. Then every atom is one of
three kinds:

- an identity, such as $B\le D$, $D=fB$, or one of the two identities that make up "$B$ is
  a candidate";
- an atom $YB$, where $Y$ is bound by the quantifier $\forall Y\, .\,\mathcal AY\land\operatorname{Closed}(Y)\to\cdots$ of the tower;
- an atom $ZB$, where $Z$ is bound in the clause of *closed* for suprema of admissible
  chains.

Both kinds of bound variable are restricted to settled properties, since
$\mathcal A=\operatorname{Settled}$. So Lemma 3, with $n=0$, shows that each of these
properties is settled at every argument. $\blacksquare$

## Remarks

**Where the premises are used.** Vicinity is used only through Lemmas 1–3. Relational
Choice is used only to show that a candidate fixed by $f$ is full. Nothing is boxed.

**Consequences.** ND at type $t$ implies Vicinity, so ND at type $t$ and Relational Choice
give Transversal Choice; in particular C5 and Relational Choice do, and there $s=\top$,
Lemma 1 being ND and Lemma 2 BF. Since Transversal Choice is equivalent to Transversal
together with Relational Choice, any model separating Relational Choice from Transversal
Choice must falsify Vicinity.

**Astra's route.** Astra's proof interprets C5 inside C plus Vicinity: propositions are
restricted to those below $s$, and necessity becomes identity with $s$. It then proves C5
and Relational Choice imply Transversal Choice by a fixed-point argument over rigid families,
and transfers Relational Choice into the interpretation and the transversal back out.
Lemmas 1–3 are the core of that interpretation, and the fixed-point argument has to deal
with rigidity in the same places as Hypothesis 2 and the new hypothesis above. Proving the
result directly avoids the soundness proof for the interpretation and the transfer steps.
