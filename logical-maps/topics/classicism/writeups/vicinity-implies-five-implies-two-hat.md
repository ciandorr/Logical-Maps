# Vicinity implies 5-necessities are two-hat necessary

Conjectured by Cian Dorr, 14 October 2026. Proved by Christopher Sun, in a handwritten argument
sent to Cian Dorr on 19 October 2026: he showed that if there is a strongest 5-necessary
proposition, every 5-necessary proposition is two-hat necessary, and, from the 5-necessity form
of Vicinity, the latter is his argument recorded on the page of Vicinity. The passage from that
form to a strongest 5-necessary proposition (Step 1) was added by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr when
recording it, 19 October 2026.

## Facts used

All are theorems of C (Background, *Hats, two-hat necessity and 5-necessity*):

- $\Box\le\Box_{\ne}\le\hat{\hat\Box}\le\Box_5\le\lambda p\,.\,p$, the order being necessary
  pointwise implication. Dually $\Diamond_5\le\Diamond$ and $\Diamond_{\ne}\le\Diamond$.
- $\Box_5$ is an S5 operator: N, K, T, 4 and B. So it also obeys the Barcan formula for
  propositional quantification, by Prior's derivation from B and the converse Barcan formula.
- $\Diamond_{\ne}x\leftrightarrow\forall r\,.\,r\to\Diamond(\Diamond r\land x)$, the dual of
  $\Box_{\ne}p:=\exists q\,.\,q\land\Box(\Diamond q\to p)$; it is monotone under $\le$.
- $\hat{\hat\Box}$ is the hat of $\Box_{\ne}$: $\hat{\hat\Box}p\leftrightarrow\exists q\,.\,q\land\Box(\Diamond_{\ne}q\to p)$.
- Theorem D9 of *The Bounds of Possibility*, Appendix D: $\Box_5$ materially implies every
  operator that is $\mathrm{NKJF}_{\langle\rangle}$. Here $\mathrm N X$ says $\Box\le X$,
  $\mathrm K$ is the K axiom, $\mathrm J X:=\forall p\,.\,p\to X\Diamond p$, and
  $\mathrm F_{\langle\rangle}X:=\forall Y^{tt}\,.\,(\forall z\,.\,X(Yz))\to X(\forall z\,.\,Yz)$.
  The definition of $\Box_5$ there is necessarily equivalent to the map's.

## Step 1: a strongest 5-necessary proposition

By the 5-necessity form of Vicinity (on the page of Vicinity), let $t$ be a truth with
$\forall q\,.\,\Box_5 q\to t\le q$, and put $s:=\Diamond_5 t$.

(a) $s$ is true, as $t$ is (T for $\Box_5$).

(b) $\Box_5 s$, by B for $\Box_5$.

(c) If $\Box_5 q$ then $s\le q$. By 4, $\Box_5\Box_5 q$, so $t\le\Box_5 q$, that is
$\Box(t\to\Box_5 q)$. Let $s$ hold at a world. There $\Box(t\to\Box_5 q)$ still holds, by 4, so
$\Box_5(t\to\Box_5 q)$, as $\Box\le\Box_5$. With $\Diamond_5 t$ this gives $\Diamond_5\Box_5 q$,
and so $q$, by B for $\Box_5$.

(d) If $s\le q$ then $\Box_5 q$, by (b), $\Box\le\Box_5$ and K.

So $\forall q\,.\,\Box_5 q\leftrightarrow s\le q$: in Sun's terms, 5-necessity is principal.

## Step 2 (Sun): $\Box(\Diamond_{\ne}s\to s)$

Suppose otherwise, put $A:=\Diamond_{\ne}s\land\neg s$, so that $\Diamond A$, and let
$O:=\lambda p\,.\,A\le p$.

- $\Box_5 s$, but not $O s$, since $\Diamond(A\land\neg s)$. So $\Box_5$ does not materially
  imply $O$, and by Theorem D9, $O$ is not $\mathrm{NKJF}_{\langle\rangle}$.
- $O$ is N and K, as $\le$ is necessary implication.
- $O$ is J. Let $q$ be true. Then $\Box_5\Diamond_5 q$ (B), so $\Box_5\Diamond q$; by (c),
  $s\le\Diamond q$; so $\Diamond s\le\Diamond q$ by 4; and $A\le\Diamond_{\ne}s\le\Diamond s$.
  So $A\le\Diamond q$.
- So $O$ is not $\mathrm F_{\langle\rangle}$: there is an $X^{tt}$ with $\forall p\,.\,A\le Xp$ and
  $\Diamond\exists q\,.\,A\land\neg Xq$.

Each $A\le Xp$ is necessary by 4, hence 5-necessary, so the Barcan formula for $\Box_5$ gives
$\Box_5 T$, where $T:=\forall p\,.\,A\le Xp$. By (c), $s\le T$, and so $\Diamond_{\ne}s\le\Diamond_{\ne}T$.

Now take a world, and a $q$, with $A\land\neg Xq$. There $\Diamond_{\ne}s$ holds, hence
$\Diamond_{\ne}T$; applying the characterization of $\Diamond_{\ne}$ to the truth
$r:=A\land\neg Xq$, that world sees one where $\Diamond(A\land\neg Xq)$ and $T$ hold. But $T$ gives
$A\le Xq$ there, that is $\Box(A\to Xq)$: a contradiction.

## Step 3: 5-necessities are two-hat necessary

$s$ is true and $\Box(\Diamond_{\ne}s\to s)$. If $\Box_5 p$, then $s\le p$ by (c), so
$\Box(\Diamond_{\ne}s\to p)$, and $s$ witnesses $\hat{\hat\Box}p$. $\blacksquare$

## Remarks

- The argument is a derivation in C from Vicinity, so its necessitation gives the boxed form,
  □Vicinity implies □5-necessities are two-hat necessary.
- Actuality, and Vicinity with BF at type $t$, were already known to suffice. As the notes of the
  conjecture explain, the Actuality proof does not adapt; Sun's argument works through Theorem D9
  instead of an atom.
- Sun's first page derives a strongest 5-necessary proposition from a strongest
  $\Box_{\ne}$-necessary one, by a different route: $s:=v\land\forall p\,.\,p\to v\le\Diamond p$.
  Step 1 above needs only Vicinity.
