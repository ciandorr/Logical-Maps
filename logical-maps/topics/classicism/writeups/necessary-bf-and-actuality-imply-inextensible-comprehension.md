# □BF and Actuality imply Inextensible Comprehension

Assume □BF (every closed instance of the Barcan Formula is necessary) and
Actuality, in the map's fixed relational type system. The conclusion is
Inextensible Comprehension: every relation is coextensive with an
inextensible one. The witness and the argument are Christopher Sun's,
reported by Cian Dorr on 26 September 2026; the observation that the BF
hypothesis must be taken in its boxed form, and this write-up, are by Claude
Fable 5.1 (Anthropic) the same day. No independent checker or Lean
verification is recorded.

## Definitions

For $Y$ of type $\bar\sigma t$, with $Y[\bar z]$ the left-nested application
to the tuple $\bar z$,

$$
\operatorname{Inextensible}(Y):=\Box\forall X\, .\,
  (\forall\bar z\, .\,Y[\bar z]\to\Box X[\bar z])\to Y\le X,
$$

where $Y\le X$ is $\Box\forall\bar z\, .\,Y[\bar z]\to X[\bar z]$. Actuality
is $\exists p\, .\,p\land\forall q\, .\,q\to p\le q$; write $w$ for a witness.

## The witness

Fix $F$ of type $\bar\sigma t$ and put

$$
C:=\lambda\bar z\, .\,\Diamond(w\land F[\bar z]).
$$

**$C$ is coextensive with $F$.** If $F[\bar z]$, then $w\land F[\bar z]$ is
true, hence possible by T, so $C[\bar z]$. If $\neg F[\bar z]$, then
$\neg F[\bar z]$ is a truth, so $w\le\neg F[\bar z]$ by the choice of $w$,
i.e. $\Box(w\to\neg F[\bar z])$, which is $\neg\Diamond(w\land F[\bar z])$.
Only Actuality is used.

## Inextensibility

Two theorems of C, for any $X$ and any $\bar z$:

1. $\neg C[\bar z]$ is the box $\Box(w\to\neg F[\bar z])$, so by 4,
   $\neg C[\bar z]\to\Box\neg C[\bar z]$. Hence
   $(C[\bar z]\to\Box X[\bar z])\to(\Box\neg C[\bar z]\lor\Box X[\bar z])
   \to\Box(C[\bar z]\to X[\bar z])$.
2. Consequently
   $(\forall\bar z\, .\,C[\bar z]\to\Box X[\bar z])\to
   \forall\bar z\, .\,\Box(C[\bar z]\to X[\bar z])$.

Let $\beta$ be the closed BF instance
$\forall X\, .\,(\forall\bar z\, .\,\Box(C[\bar z]\to X[\bar z]))\to
\Box\forall\bar z\, .\,(C[\bar z]\to X[\bar z])$, obtained from BF at the
types $\bar\sigma$ by abstracting $\lambda\bar z\, .\,C[\bar z]\to X[\bar z]$
and closing in $X$. From 2 and $\beta$,

$$
\beta\to\forall X\, .\,(\forall\bar z\, .\,C[\bar z]\to\Box X[\bar z])\to C\le X
$$

is a theorem of C. Necessitating it and applying K,

$$
\Box\beta\to\Box\forall X\, .\,(\forall\bar z\, .\,C[\bar z]\to\Box X[\bar z])\to C\le X,
$$

and the consequent is $\operatorname{Inextensible}(C)$. $\Box\beta$ is an
instance of □BF (its type range and closure are outside the box, as the
map's conventions require). So $C$ is an inextensible relation coextensive
with $F$.

## Why the box on BF is needed

Everything before the last step uses only Actuality and 4. The BF instance
$\beta$ is needed under the leading box of inextensibility, that is, at an
arbitrary world, and BF at the actual world does not supply it: BF does not
imply □BF on the map (the two-object all-maps model has BF without □BF,
though it lacks Actuality). Whether Actuality and BF together imply □BF is
open, and a proof of that would establish the unboxed claim, which is not
recorded. Any other route to the unboxed claim must either
find a different witness or show that the BF instance for
$\lambda\bar z\, .\,C[\bar z]\to X[\bar z]$ holds at every world for other
reasons; $\Diamond w$ fails at every world from which no arrow leads back to
the actual world, and there $C$ is empty and trivially inextensible, so
only the worlds at which $\Diamond w$ holds are in question.
