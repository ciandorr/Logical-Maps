# Actuality and Distinctness-preserving collapse imply Inextensible Comprehension

Assume Actuality and Distinctness-preserving collapse, with the map's fixed
type range. The conclusion is Inextensible Comprehension: every relation is
coextensive with an inextensible one, where inextensibility carries its
leading box. This is an original connecting proof by Claude Fable 5.1
(Anthropic), 25 September 2026, at Cian Dorr's direction. It has no
independent checker or Lean verification recorded. The witness is the one
note 38 of Bacon and Dorr, *Classicism* (16 May 2023 draft, p. 29) uses
for Actuality; the distinctness-preserving modality
$\Box_{\ne}p:=\exists q\, .\,q\land\Box(\Diamond q\to p)$ is that of §2.6,
p. 42, and the collapse principle $\forall p\, .\,p\to\Box_{\ne}p$ is from
Appendix E, p. 83.

## Where Actuality alone stops

Let $w$ witness Actuality and fix $X^\tau$, $\tau=\bar\sigma t$. The
recorded result from Actuality shows that
$Y_w:=\lambda\bar z\, .\,w\land X[\bar z]$ is coextensive with $X$ and
weakly inextensible: whenever $\forall\bar z\, .\,Y_w[\bar z]\to Z[\bar z]$
is true, $w$ entails it, and that entailment is $Y_w\le Z$. Inextensibility
asks for weak inextensibility at every world. At a world where $w$ is
false, $Y_w$ has no instances, so the antecedent of weak inextensibility
holds vacuously for every $Z$, and the conclusion $Y_w\le Z$ for every $Z$
amounts to $Y_w\le\bot$: it is impossible there that $w\land\exists\bar z\,
.\,X[\bar z]$. That is fine where $w$ is impossible, and it fails wherever
$w$ is false but possible and $X$ is possibly nonempty under $w$. Under B,
for instance, it fails whenever $X$ is actually nonempty. Under C5 Rigid
Comprehension holds anyway by Proposition 2.10, through a different witness;
so the question is what happens between the two extremes.

## Two theorems of C

Write $L(a)$ for $a\land\forall q\, .\,q\to a\le q$, "$a$ is a true
proposition entailing every truth", and $Y_a:=\lambda\bar z\, .\,a\land X[\bar z]$.

**(i)** $L(a)\to\operatorname{WeaklyInextensible}(Y_a)$. This is the
recorded argument from Actuality, read with $a$ as a free variable: given
$\forall\bar z\, .\,Y_a[\bar z]\to\Box Z[\bar z]$, T gives the truth
$\forall\bar z\, .\,a\land X[\bar z]\to Z[\bar z]$, so
$\Box(a\to\forall\bar z\, .\,a\land X[\bar z]\to Z[\bar z])$, and the boxed
formula is H-equivalent to $\forall\bar z\, .\,Y_a[\bar z]\to Z[\bar z]$, so
Logical Equivalence gives $Y_a\le Z$.

**(ii)** $\Box\neg a\to\operatorname{WeaklyInextensible}(Y_a)$. From
$\Box\neg a$ and the H-theorem
$\neg a\to\forall\bar z\, .\,a\land X[\bar z]\to Z[\bar z]$, K gives
$Y_a\le Z$ for every $Z$.

Combining them, since $\neg\Diamond a$ is $\Box\neg a$,

$$
(\Diamond a\to L(a))\to\operatorname{WeaklyInextensible}(Y_a)
$$

is a theorem of C with $a$, $X$ free. C is closed under necessitation, so
its box is a theorem too, and K gives

$$
\Box(\Diamond a\to L(a))\to\operatorname{Inextensible}(Y_a). \tag{$*$}
$$

No optional hypothesis has been necessitated: the only hypothesis used
inside the box is the boxed statement on the left of $(*)$.

## Proof

Let $a$ witness Actuality, so $L(a)$ is true. Apply Distinctness-preserving
collapse to the truth $L(a)$: there is a true $q^*$ with
$\Box(\Diamond q^*\to L(a))$. Since $q^*$ is true and $a$ entails every
truth, $\Box(a\to q^*)$. The K-theorem
$\Box(a\to q^*)\to(\Diamond a\to\Diamond q^*)$, necessitated, together with
4 and K, gives $\Box(\Diamond a\to\Diamond q^*)$, hence
$\Box(\Diamond a\to L(a))$. Now for any $X$, $(*)$ makes
$Y_a=\lambda\bar z\, .\,a\land X[\bar z]$ inextensible, and it is
coextensive with $X$ because $a$ is true. $\square$

The hypothesis actually used is $\Box(\Diamond a\to L(a))$: necessarily, the
actual atom is the least truth wherever it is so much as possible. It says
two things at once, that $a$ is possible only where true and that it stays
the least truth wherever it is true. Distinctness-preserving collapse gives
it directly; the recorded verifications of that principle in the action
models all take $q:=a$ and check exactly these two facts.

## What this places on the map

Every recorded model with Actuality also satisfies Distinctness-preserving
collapse, so Inextensible Comprehension now holds in all of them by
derivation, including

- the symmetric two-object unpinned model and the qualitative-link model,
  where boxed Boolean Completeness and boxed Actuality hold, hence Weak Rigid
  Comprehension, and Rigid Comprehension fails;
- the finite-support identity-or-collapse, dyadic-rounding and
  truncated-shift models and the coalesced sums, where Boolean Completeness
  fails, hence Weak Rigid Comprehension fails.

So an inextensible coextension and a persistent, weakly inextensible
coextension can both exist while no single relation is both persistent and
inextensible: Rigid Comprehension is not the conjunction of Inextensible
Comprehension and Weak Rigid Comprehension. Inextensible Comprehension
also implies neither Boolean Completeness nor Weak Rigid Comprehension. The
witness that does the work, $\lambda\bar z\, .\,a\land X[\bar z]$, is
about as far from persistent as a relation can be: it loses every instance
as soon as $a$ fails.

A countermodel to Actuality alone implying Inextensible Comprehension
would need an Actuality witness that is possible at some world where it is
false, so that Distinctness-preserving collapse fails, without the symmetry
that makes C5 deliver Rigid Comprehension; and it would have to defeat not
only $Y_a$ but every other coextension of some $X$. None is recorded. The
converse questions, whether Inextensible Comprehension or Weakly
Inextensible Comprehension implies Actuality, are also open, except that
Weakly Inextensible Comprehension does not, since it follows from Boolean
Completeness.
