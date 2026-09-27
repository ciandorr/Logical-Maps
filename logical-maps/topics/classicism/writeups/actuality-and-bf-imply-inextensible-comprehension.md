# BF and Actuality imply Inextensible Comprehension

Assume BF and Actuality, in the map's fixed relational type system. The
conclusion is Inextensible Comprehension: every relation is coextensive
with an inextensible one. The witness is Christopher Sun's (26 September
2026). So is the argument from unboxed BF, which Cian Dorr reported on 27
September 2026. Claude Opus 5.5 (Anthropic) wrote out the details
below. No independent checker or Lean verification is recorded.

This strengthens the recorded result from □BF and Actuality, which used the
same witness but needed BF at every world.

## Definitions

For $Y$ of type $\bar\sigma t$,

$$
\operatorname{Inextensible}(Y):=\Box\forall X\, .\,
  (\forall\bar y\, .\,Y[\bar y]\to\Box X[\bar y])\to Y\le X,
$$

where $Y\le X$ is $\Box\forall\bar z\, .\,Y[\bar z]\to X[\bar z]$. Actuality
is $\exists p\, .\,p\land\forall q\, .\,q\to p\le q$. Let $w$ be a witness.

## The witness

Fix $F$ of type $\bar\sigma t$ and put

$$
C:=\lambda\bar z\, .\,\Diamond(w\land F[\bar z]).
$$

$C$ is coextensive with $F$. If $F[\bar z]$, then $w\land F[\bar z]$ is
true, hence possible. If $\neg F[\bar z]$, then $w\le\neg F[\bar z]$, which
is $\neg\Diamond(w\land F[\bar z])$.

## Two facts about entailment by $w$

C proves 4. So for any $r$, $w\le r$ gives $\Box\Box(w\to r)$. The formula
$\Box(w\to r)\to(\Diamond w\to\Diamond r)$ is a theorem, so necessitation
and K give

$$
(\ast)\qquad w\le r\ \to\ \Box(\Diamond w\to\Diamond r).
$$

With $r:=\Diamond\neg X[\bar z]$ and 4 inside the box, this gives
$w\le\Diamond\neg X[\bar z]\to\Box(\Diamond w\to\Diamond\neg X[\bar z])$.
Similarly, if $w\le F[\bar z]$, then 4 gives $\Box\Box(w\to F[\bar z])$.
The formula $\Box(w\to F[\bar z])\to(\Diamond w\to\Diamond(w\land F[\bar z]))$
is a theorem, so $w\le F[\bar z]\to\Box(\Diamond w\to C[\bar z])$.

## Inextensibility

Suppose $\neg\operatorname{Inextensible}(C)$. Write
$A(X):=\forall\bar y\, .\,C[\bar y]\to\Box X[\bar y]$ and
$B(X,\bar z):=C[\bar z]\land\neg X[\bar z]$. Then

$$
\Diamond\exists X\, .\,A(X)\land\Diamond\exists\bar z\, .\,B(X,\bar z).
$$

1. **Extract $X$.** BF at type $\bar\sigma t$, in its dual form
   $\Diamond\exists X\,\psi\to\exists X\,\Diamond\psi$, gives an $X$ with
   $\Diamond(A(X)\land\Diamond\exists\bar z\, .\,B(X,\bar z))$.
2. **Extract $\bar z$.** Step 1 gives
   $\Diamond\Diamond\exists\bar z\, .\,B(X,\bar z)$, hence
   $\Diamond\exists\bar z\, .\,B(X,\bar z)$ by 4. BF at the types $\bar\sigma$,
   applied once for each variable, gives $\bar z$ with
   $\Diamond(C[\bar z]\land\neg X[\bar z])$.
3. **Facts at the actual world.** From step 2, $\Diamond C[\bar z]$, which
   is $\Diamond\Diamond(w\land F[\bar z])$, so $C[\bar z]$ by 4. Hence
   $F[\bar z]$ by coextensiveness. Step 2 also gives $\Diamond\neg X[\bar z]$.
   Both are truths, so Actuality gives $w\le F[\bar z]$ and
   $w\le\Diamond\neg X[\bar z]$. By the two facts above,
   $$\Box(\Diamond w\to C[\bar z])\quad\text{and}\quad
     \Box(\Diamond w\to\Diamond\neg X[\bar z]).$$
4. **The world from step 1.** Step 1 gives
   $\Diamond(A(X)\land\Diamond w)$. Here $\Diamond w$ comes from
   $\Diamond\exists\bar z\, .\,\Diamond(w\land F[\bar z])\land\ldots$ by 4,
   under the box. Instantiating $A(X)$ at $\bar z$ (with $\bar z$ free, the
   instance holds under the box) gives
   $\Diamond((C[\bar z]\to\Box X[\bar z])\land\Diamond w)$.
5. **Contradiction.** At that world, $\Diamond w$ gives $C[\bar z]$ and
   $\Diamond\neg X[\bar z]$ by step 3. So $\Box X[\bar z]$ and
   $\Diamond\neg X[\bar z]$ both hold.

So $\operatorname{Inextensible}(C)$, and $C$ is an inextensible relation
coextensive with $F$.

## Where BF is used

BF is used only at the actual world, in steps 1 and 2, at the type of $X$
and at the argument types. It brings the quantifiers out from under the
negated leading box of inextensibility, so that Actuality can be applied at
the actual world to the chosen $\bar z$ and $X$. The earlier argument instead
applied a BF instance under that box, which is why it needed □BF. Only
worlds where $\Diamond w$ holds matter, as the earlier write-up observed. The
argument enters one of them in step 4 and uses the two consequences of
$\Diamond w$ from step 3.
