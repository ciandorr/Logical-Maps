# Actuality and the 5-necessity collapse imply Inextensible Comprehension

Assume Actuality and that 5-necessities are ND-necessary, in the map's fixed
relational type system. The conclusion is Inextensible Comprehension: every
relation is coextensive with an inextensible one. The theorem and argument
are Cian Dorr's, found with help from GPT-6 Astra (OpenAI) on 29 October 2026.
Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, checked and adapted the
text. No independent checker or Lean verification is recorded.

The argument is the one for
[BF and Actuality](actuality-and-bf-imply-inextensible-comprehension.md),
with BF replaced by a restricted Barcan formula. That formula is derived from
the premises.

## Definitions

$\Box_{\ne}p:=\exists q\, .\,q\land\Box(\Diamond q\to p)$, with dual

$$
\Diamond_{\ne}p\ \leftrightarrow\ \forall q\, .\,q\to\Diamond(\Diamond q\land p).
$$

$\Box_5$ is necessity under every S5 operator, with dual $\Diamond_5$
(Background, Varieties of necessity). C proves $\Box_{\ne}\le\Box_5$. The
premise $\forall p\, .\,\Box_5p\to\Box_{\ne}p$ therefore makes the two
operators coextensive, and so also their duals. Inextensibility and
Actuality are as in the BF write-up. Let $a$ witness Actuality.

## Step 1: Actuality gives $\Diamond_{\ne}$ a simple form

Put $D_ap:=\Diamond(\Diamond a\land p)$. Then

$$
(1)\qquad \forall p\, .\,D_ap\leftrightarrow\Diamond_{\ne}p.
$$

Right to left, take $q:=a$, which is true. Left to right, let $q$ be true.
Then $a\le q$, so $\Box(\Diamond a\to\Diamond q)$ by 4 and K, and
$\Diamond(\Diamond a\land p)$ gives $\Diamond(\Diamond q\land p)$.

## Step 2: the 5-necessity collapse

With the premise, (1) gives

$$
(2)\qquad \forall p\, .\,D_ap\leftrightarrow\Diamond_5p.
$$

This is coextensiveness at the actual world only. The argument never needs
the operators to be identical or necessarily coextensive.

## Step 3: a Barcan formula restricted to $\Diamond a$

$\Box_5$ obeys the Barcan formula at every type, as a theorem of C. This is
Prior's derivation from B (Background, [[box5-barcan]]). Dually, for tuples,
$\Diamond_5\exists\bar x\, .\,R[\bar x]\to\exists\bar x\, .\,\Diamond_5R[\bar x]$.

Transfer this through (2), applying (2) once to $\exists\bar x\, .\,R[\bar x]$
and once to each $R[\bar x]$:

$$
\text{(RB)}\qquad
\Diamond\exists\bar x\, .\,\Diamond a\land R[\bar x]
\ \to\ \exists\bar x\, .\,\Diamond(\Diamond a\land R[\bar x]).
$$

This holds at the actual world, for every relation $R$ and at every type.

## Step 4: inextensibility

Fix $F$ of type $\bar\sigma t$ and put
$C:=\lambda\bar z\, .\,\Diamond(a\land F[\bar z])$. As in the BF write-up,
Actuality makes $C$ coextensive with $F$. Suppose $C$ is not inextensible.
With $A(X):=\forall\bar y\, .\,C[\bar y]\to\Box X[\bar y]$,

$$
(3)\qquad \Diamond\exists X\, .\,A(X)\land\Diamond\exists\bar z\, .\,
  C[\bar z]\land\neg X[\bar z].
$$

1. **Extract $X$.** The matrix of (3) implies $\Diamond a$. Its second
   conjunct gives $\Diamond\Diamond a$, since $C[\bar z]$ implies $\Diamond a$,
   and then 4 applies. So (RB), at the type of $X$, gives an $X$ with
   $$(4)\qquad\Diamond(\Diamond a\land A(X)\land\Diamond\exists\bar z\, .\,C[\bar z]\land\neg X[\bar z]).$$
2. **Extract $\bar z$.** By 4, $\Diamond\exists\bar z\, .\,C[\bar z]\land\neg X[\bar z]$.
   Its matrix implies $\Diamond a$, so (RB) at the types $\bar\sigma$ gives
   $\bar z$ with $\Diamond(C[\bar z]\land\neg X[\bar z])$.
3. **Facts at the actual world.** $\Diamond C[\bar z]$ gives $C[\bar z]$ by 4,
   hence $F[\bar z]$; also $\Diamond\neg X[\bar z]$. Actuality gives
   $a\le F[\bar z]$ and $a\le\Diamond\neg X[\bar z]$. By 4 and K,
   $$(5)\qquad\Box(\Diamond a\to C[\bar z]\land\Diamond\neg X[\bar z]).$$
4. **Contradiction.** (4) gives a world where $A(X)$ and $\Diamond a$ hold.
   There, (5) gives $C[\bar z]$ and $\Diamond\neg X[\bar z]$. But
   $A(X)$, instantiated at $\bar z$, gives $\Box X[\bar z]$.

So $C$ is inextensible and coextensive with $F$.

## Remarks

- **What replaces BF.** BF is used in the earlier proof only to bring
  quantifiers out from under a possibility. Every such possibility there is
  compatible with $\Diamond a$, so the restricted form (RB) is enough.
  - (RB) follows from the 5-necessity collapse at the actual world, because
    $\Box_5$ satisfies the Barcan formula outright.
- **The boxed version.** It follows by necessitating the theorem, since the
  premises are used only at finitely many closed instances.
- **Consequences on the map.** Self-Atomicity and Strong Atomicity, at type
  $t$ or at every type, give Actuality and the 5-necessity collapse through
  the recorded results. So they now give Inextensible Comprehension.
