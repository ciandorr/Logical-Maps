# Actuality ∧ Two-hat necessity implies ND-necessity ⇒ Strong Actuality

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.actuality_and_two_hat_implies_nd_imply_strong_actuality`; produced by Cian Dorr, 14 October 2026 (with 5-necessity implies ND-necessity as the second premise); weakened to Two-hat necessity implies ND-necessity, and checked, by Claude Fable 5.1 (Anthropic) the same day; recorded by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 14 October 2026.</p>

## Premises

- **Actuality.** There is a true proposition that entails every true proposition.
- **Two-hat necessity implies ND-necessity.** Whatever is two-hat necessary is ND-necessary: the distinctness-preserving modality agrees with its hat.

## Conclusion

- **Strong Actuality.** There is a true strong atom: a true proposition that necessarily entails every proposition or its negation.

## Proof

Let $w$ witness Actuality; it is a true atom, since a possible $p\le w$ cannot be false ($\neg p$ true would give $w\le\neg p$, so $p\le\neg p$) and if true satisfies $w\le p$. Suppose $w$ is not a strong atom: possibly some $Y$ has $w\not\le Y$ and $w\not\le\neg Y$, so $\Diamond(\Diamond w\wedge\neg\operatorname{Atom}w)$, since there $w\wedge Y$ is a possible strict lower bound of $w$. For every true $q$, $w\le q$, so $\Diamond w\le\Diamond q$ and $\Diamond(\Diamond q\wedge\Diamond w\wedge\neg\operatorname{Atom}w)$: that is $\Diamond_{\ne}(\Diamond w\wedge\neg\operatorname{Atom}w)$. The premise, dualized, gives $\hat{\hat\Diamond}(\Diamond w\wedge\neg\operatorname{Atom}w)$, hence $\hat{\hat\Diamond}\,\exists p(p\ne w\wedge p\le w\wedge\Diamond p)$, as $\Diamond w\wedge\neg\operatorname{Atom}w$ entails that $w$ has a possible strict lower bound and $\hat{\hat\Box}$ is N and K. Under Actuality, $\hat{\hat\Box}$ satisfies BF at type $t$ at the actual world (Proposition D19 of The Bounds of Possibility, Appendix D, for $X=\Box_{\ne}$, which uses Actuality only at the world of evaluation), so $\exists p\,\hat{\hat\Diamond}(p\ne w\wedge p\le w\wedge\Diamond p)$. Fix such a $p$. Since $\hat{\hat\Box}$ is N, $\Box$ is below it (if $p=\top$ then $\hat{\hat\Box}p=\hat{\hat\Box}\top$), so $\hat{\hat\Diamond}$ is below $\Diamond$ and $\Diamond\Diamond p$ gives $\Diamond p$; for the same reason it inherits the necessity of identity, so $\hat{\hat\Diamond}(p\ne w)$ gives $p\ne w$; and being the hat of the NK operator $\Box_{\ne}$ it is NKJ (Proposition D14) and so satisfies the necessity of distinctness at every type (Proposition D1): $\hat{\hat\Diamond}((p\to w)=\top)$ gives $(p\to w)=\top$, i.e. $p\le w$. Thus $p$ is a possible strict lower bound of the atom $w$, a contradiction. So $w$ is a true strong atom.

## Notes

Cian Dorr's argument used 5-necessity implies ND-necessity, with BF and the necessity of distinctness for $\Box_5$ (Theorem D16, Corollary D6); the same steps go through for $\hat{\hat\Box}$ once Actuality supplies its BF at the actual world, so the weaker collapse principle suffices. The recorded result from Actuality and Truth implies ND-necessity is now derivable, that principle implying this one. The hypothesis Actuality cannot be dropped (the one-object models in which every truth is ND-necessary but Actuality fails), and the converse fails: the two-object retract full model has Strong Actuality but not Two-hat necessity implies ND-necessity.

## Sources

- **Dorr 14 Oct** — Cian Dorr, argument of 14 October 2026, communicated in conversation with Claude Fable 5.1 (Anthropic) and checked there (transcript in the private notes).
- **Bounds of Possibility** — Cian Dorr, John Hawthorne, and Juhani Yli-Vakkuri, The Bounds of Possibility, Appendix D, Propositions D1 and D19.

<p class='cert'>Record: <code>topics/classicism/results/actuality-and-two-hat-implies-nd-imply-strong-actuality.yaml</code></p>

## Paper references

- **Proof: The Bounds of Possibility.** Dorr, Cian, John Hawthorne, and Juhani Yli-Vakkuri (2021). The Bounds of Possibility. Oxford University Press. Appendix D, Narrower Modalities in Higher-Order S4, pp. 400–409; locators follow the OUP corrected proof dated 9 May 2024. Its background logic HS4 (a primitive S4 operator over higher-order logic) is read into C by interpreting the primitive box as $\lambda p\, .\,p=\top$, under which every theorem of HS4 is a theorem of C. — Propositions D1, D14, D19. Necessity of distinctness for NKJ operators, NKJ for the hat of an NK operator, and BF for the hat of an NKJ operator; the last needs Actuality only at the evaluation world.
