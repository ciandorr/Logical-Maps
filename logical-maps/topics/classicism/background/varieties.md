# Varieties of necessity

Strong Possibility uses the distinctness-preserving modality of §2.6, p. 42:

$$
\Box_{\ne}p:=\exists q\, .\,q\land\Box(\Diamond q\to p),
\qquad \Diamond_{\ne}p:=\neg\Box_{\ne}\neg p.
$$

**Hats, two-hat necessity and 5-necessity.** For an operator $X^{tt}$ put

$$
\hat X:=\lambda p\, .\,\exists q\, .\,q\land\Box(\neg X\neg q\to p).
$$

In C, $\hat\Box=\Box_{\ne}$ (*The Bounds of Possibility*, Appendix D, Proposition
D17). *Two-hat necessity* is the hat of $\Box_{\ne}$, written $\hat{\hat\Box}$,
with dual $\hat{\hat\Diamond}p:=\neg\hat{\hat\Box}\neg p$. Call $X^{tt}$ an *S5
operator* when, necessarily, it is N, K and B:

$$
\operatorname{S5}(X):=\Box\bigl(\forall p\, .\,\Box p\to Xp\bigr)\land
\Box\bigl(\forall p\,q\, .\,X(p\to q)\to Xp\to Xq\bigr)\land
\Box\bigl(\forall p\, .\,p\to X\neg X\neg p\bigr).
$$

*5-necessity* is necessity under every S5 operator,
$\Box_5:=\lambda p\, .\,\forall X^{tt}\, .\,\operatorname{S5}(X)\to Xp$, with
dual $\Diamond_5$. Appendix D defines $\Box_5$ with the condition NKJF$_{\langle\rangle}$
in place of NKB; its facts (A5) and (C5) make the two definitions necessarily
equivalent. Theorems of C: $\Box\le\Box_{\ne}\le\hat{\hat\Box}\le\Box_5\le\lambda p\, .\,p$
(the order is necessary pointwise implication)
{lean: Classicism.box_le_boxNe, Classicism.boxNe_le_boxHH, Classicism.boxHH_le_box5, Classicism.box5_le}; each of these operators is
necessarily N, K, T and 4, and $\Box_5$ is an S5 operator; and if $\Box_{\ne}$ or
$\hat{\hat\Box}$ is identical to its own hat, it is identical to $\Box_5$.

## Appendix D of *The Bounds of Possibility*

Dorr, Hawthorne and Yli-Vakkuri, *The Bounds of Possibility* (2021), Appendix D,
*Narrower Modalities in Higher-Order S4*, pp. 400–409, reads into C: the appendix's
primitive $\Box$ is C's $\lambda p\, .\,p=\top$, under which every theorem of its
$\mathrm H_{S4}$ is a theorem of C. Only the propositions the map uses are given here, and
F and I are stated at type $t$ only. Operators are of type $tt$.

::: definition {#appendix-d-operator-properties}
title: properties of operators
sources: The Bounds of Possibility, Appendix D, p. 400 and p. 407
---
For $X^{tt}$:

$$
\begin{aligned}
\mathrm N\,X&:=\forall p\, .\,\Box p\to Xp, &
\mathrm K\,X&:=\forall p\,q\, .\,X(p\to q)\to Xp\to Xq,\\
\mathrm J\,X&:=\forall p\, .\,p\to X\Diamond p, &
\mathrm F_{\langle\rangle}X&:=\forall Y^{tt}\, .\,(\forall z\, .\,X(Yz))\to X\forall z\, .\,Yz,
\end{aligned}
$$

and NK, NKJ and NKJF$_{\langle\rangle}$ are the conjunctions; F$_{\langle\rangle}$ is BF
for $X$ at type $t$. The appendix's 5-necessity is
$\Box_5^{\mathrm A}:=\lambda p\, .\,\forall X\, .\,\Box\,\mathrm{NKJF}_{\langle\rangle}X\to Xp$,
and $W_@a:=a\land\forall q\, .\,q\to\Box(a\to q)$ says that $a$ is the actual world.
:::

::: proposition {#appendix-d-d1}
title: D1, at type $t$
lean: [Classicism.AppD.prop_D1, Classicism.AppD.prop_D1_dual]
credit: Cian Dorr, John Hawthorne and Juhani Yli-Vakkuri
sources: The Bounds of Possibility, Appendix D
---
If $X$ is NKJ, then $y\ne z\to X(y\ne z)$ for $y,z$ of type $t$, and dually
$\neg X\neg(y=z)\to y=z$.

*Proof.* J gives $X\Diamond(y\ne z)$, and necessarily $\Diamond(y\ne z)\to y\ne z$
{lean: Classicism.ne_of_dia_ne}, so N and K give $X(y\ne z)$. $\square$
:::

::: proposition {#appendix-d-d11}
title: D11
lean: [Classicism.AppD.prop_D11a, Classicism.AppD.prop_D11b]
credit: Cian Dorr, John Hawthorne and Juhani Yli-Vakkuri
sources: The Bounds of Possibility, Appendix D
---
For every operator $X$: $p\to\hat X\neg X\neg p$, and $\neg\hat X\neg Xp\to p$. In C the
second needs no hypothesis on $X$, since $\neg\neg p=p$.
:::

::: proposition {#appendix-d-d12}
title: D12
lean: [Classicism.AppD.prop_D12a, Classicism.AppD.prop_D12b]
credit: Cian Dorr, John Hawthorne and Juhani Yli-Vakkuri
sources: The Bounds of Possibility, Appendix D
---
If $X$ is NKJF$_{\langle\rangle}$, then $p\to X\neg\hat X\neg p$ and
$\neg X\neg\hat Xp\to p$.
:::

::: proposition {#appendix-d-d14-d15}
title: D14 and D15, the second at type $t$
lean: [Classicism.AppD.prop_D14, Classicism.AppD.box_nkjf_hat]
credit: Cian Dorr, John Hawthorne and Juhani Yli-Vakkuri
sources: The Bounds of Possibility, Appendix D
---
If $\Box\,\mathrm{NK}\,X$ then $\Box\,\mathrm{NKJ}\,\hat X$ (D14); and if
$\Box\,\mathrm{NKJF}_{\langle\rangle}X$ then $\Box\,\mathrm{NKJF}_{\langle\rangle}\hat X$ (D14
with D15).

*Proof of F$_{\langle\rangle}$ for $\hat X$.* Given $\forall z\, .\,\hat X(Yz)$, the witness is
$q:=\forall z\, .\,\hat X(Yz)$: necessarily, $\neg X\neg q$ gives $\neg X\neg\hat X(Yz)$ for each
$z$, by N and K, and hence $Yz$, by [[appendix-d-d12|D12]]. $\square$
:::

::: theorem {#appendix-d-d16}
title: D16, the parts the map needs
lean: [Classicism.AppD.box5A_n, Classicism.AppD.box5A_k, Classicism.AppD.box5A_b, Classicism.AppD.s5Op_box5A, Classicism.AppD.box5_le_box5A]
credit: Cian Dorr, John Hawthorne and Juhani Yli-Vakkuri
sources: The Bounds of Possibility, Appendix D
---
$\Box_5^{\mathrm A}$ is N, K and B, necessarily, so it is an S5 operator; hence
$\Box_5\le\Box_5^{\mathrm A}$.

*Proof of B.* For $X$ with $\Box\,\mathrm{NKJF}_{\langle\rangle}X$, [[appendix-d-d12|D12]] gives
$X\neg\hat X\neg p$ from $p$; and $\hat X$ is necessarily NKJF$_{\langle\rangle}$
([[appendix-d-d14-d15]]), so necessarily $\Box_5^{\mathrm A}\neg p\to\hat X\neg p$. $\square$
:::

::: proposition {#appendix-d-relativization}
title: relativization, as in Proposition D8
lean: [Classicism.AppD.nkjf_relativized, Classicism.AppD.box5A_le_of_nkjf]
credit: Cian Dorr, John Hawthorne and Juhani Yli-Vakkuri
sources: The Bounds of Possibility, Appendix D
---
For any $X$, $\lambda r\, .\,\mathrm{NKJF}_{\langle\rangle}X\to Xr$ is NKJF$_{\langle\rangle}$
outright, and so necessarily. So whatever is $\Box_5^{\mathrm A}$ is $X$ wherever $X$ is
NKJF$_{\langle\rangle}$.
:::

::: proposition {#appendix-d-d18-d19}
title: D18 and D19, at the actual world
lean: [Classicism.AppD.prop_D18_lr, Classicism.AppD.prop_D19]
credit: Cian Dorr, John Hawthorne and Juhani Yli-Vakkuri
sources: The Bounds of Possibility, Appendix D, p. 407
---
Suppose $W_@a$ at the world of evaluation. If $\Box\,\mathrm{NK}\,X$, then
$\hat Xp\to\Box(\neg X\neg a\to p)$ (D18, left to right); and if $\Box\,\mathrm{NKJ}\,X$, then
F$_{\langle\rangle}\hat X$ (D19). The appendix assumes $\mathrm H_{S5R}$, used only for
$\Box$Actuality; here the witness $W_@a$ is needed at the world of evaluation only, as the
map's records need.
:::

The link $\hat{\hat\Box}\le\Box_5$ of the chain above is Proposition D21, right to left,
and $\hat\Box=\Box_{\ne}$ is Proposition D17.

::: proposition {#box5-barcan}
title: the Barcan formula for 5-necessity
credit: Cian Dorr, with help from GPT-6 Astra (OpenAI), 29 October 2026
---
At every type $\sigma$, C proves $\forall x^\sigma\, .\,\Box_5Rx\to\Box_5\forall x\, .\,Rx$, and
dually $\Diamond_5\exists x\, .\,Rx\to\exists x\, .\,\Diamond_5Rx$; iterating, the same holds for
tuples of variables.

*Proof.* This is Prior's derivation of the Barcan formula from B. It uses only that
$\Box_5$ is an S5 operator, a theorem of C, so every step below is a theorem and may
be necessitated. Put $U:=\forall x\, .\,\Box_5Rx$. For each $x$, $U\to\Box_5Rx$ is a
theorem, so by necessitation, N and K for $\Box_5$, $\Diamond_5U\to\Diamond_5\Box_5Rx$.
The dual of B gives $\Diamond_5\Box_5Rx\to Rx$. So $\Diamond_5U\to\forall x\, .\,Rx$ is a
theorem, and necessitation, N and K give $\Box_5\Diamond_5U\to\Box_5\forall x\, .\,Rx$.
B gives $U\to\Box_5\Diamond_5U$. $\square$
:::
