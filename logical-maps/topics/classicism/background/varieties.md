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
(the order is necessary pointwise implication); each of these operators is
necessarily N, K, T and 4, and $\Box_5$ is an S5 operator; and if $\Box_{\ne}$ or
$\hat{\hat\Box}$ is identical to its own hat, it is identical to $\Box_5$.
