# Strong Atomicity (type t) ⇒ Two-hat necessity implies ND-necessity

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.strong_atomicity_t_implies_two_hat_implies_nd`; produced by Cian Dorr, 14 October 2026; checked step by step by Claude Fable 5.1 (Anthropic) the same day; recorded by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 14 October 2026.</p>

## Premises

- **Strong Atomicity (type t).** Every possible proposition is entailed by a strong atom, one that is possible and necessarily entails every proposition or its negation.

## Conclusion

- **Two-hat necessity implies ND-necessity.** Whatever is two-hat necessary is ND-necessary: the distinctness-preserving modality agrees with its hat.

## Proof

Let $w$ be a true strong atom, which Strong Atomicity (type $t$) supplies (strong-atomicity-t-implies-strong-actuality); $w$ is the true atom, so it entails every truth. We show that every ND-possible proposition is two-hat possible, the dual of the principle. Suppose $\Diamond_{\ne}p$, i.e. $\forall q(q\to\Diamond(\Diamond q\wedge p))$. Taking $q:=w$, $\Diamond(\Diamond w\wedge p)$. By Strong Atomicity there is a strong atom $v\le\Diamond w\wedge p$. Since $w$ is the true atom and $\Diamond v$ is true, $w\le\Diamond v$; with $v\le\Diamond w$ and K, $v\le\Diamond(\Diamond v\wedge w)$. Now $v$ is strong: $\Box\forall Y(v\le Y\vee v\le\neg Y)$. At any world where $v$ holds, $v\le\neg Y$ is impossible for a true $Y$ (by T), so $v$ entails every truth there; hence for every truth $q$ at such a world, $v\le q$, and from $v\le\Diamond(\Diamond v\wedge w)$ we get $\Diamond(\Diamond q\wedge w)$. So $v\le\forall q(q\to\Diamond(\Diamond q\wedge w))$, i.e. $v\le\Diamond_{\ne}w$. As $v\le p$ and $\Diamond v$, we have $\Diamond(\Diamond_{\ne}w\wedge p)$. Finally, for every true $q$, $w\le q$, and $\Diamond_{\ne}$ is monotone under necessary implication ($\Box_{\ne}$ is necessarily N and K), so $\Diamond_{\ne}w\le\Diamond_{\ne}q$ and $\Diamond(\Diamond_{\ne}q\wedge p)$: that is $\hat{\hat\Diamond}p$.

## Notes

With Actuality's consequence that 5-necessity implies two-hat necessity, this gives that Strong Atomicity (type t) makes 5-necessity, two-hat necessity and ND-necessity coextensive. It cannot be pushed to $\Box$ itself: the two-object chain full model satisfies Strong Atomicity while ND fails.

Strengthened by [[self-atomicity-t-implies-two-hat-implies-nd]]: the strong atom $v$ is used only as a self-atom.

## Revisions

- **2026-10-25** (Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026) — (minor) Cross-reference to the Self-Atomicity and bridge-principle records added; the record is unchanged.

## Sources

- **Dorr 14 Oct** — Cian Dorr, argument of 14 October 2026, communicated in conversation with Claude Fable 5.1 (Anthropic) and checked there (transcript in the private notes).

<p class='cert'>Record: <code>topics/classicism/results/strong-atomicity-t-implies-two-hat-implies-nd.yaml</code></p>
