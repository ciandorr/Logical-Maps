# ND ∧ Strong Actuality ⇒ Gallin Extensional Comprehension

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.nd_and_strong_actuality_imply_gallin_comprehension`; produced by Cian Dorr, 11 October 2026; checked by Claude Opus 5.5 (Anthropic); recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 11 October 2026.</p>

## Premises

- **ND.** Distinct things of any type are necessarily distinct.
- **Strong Actuality.** There is a true strong atom: a true proposition that necessarily entails every proposition or its negation.

## Conclusion

- **Gallin Extensional Comprehension.** Every relation is coextensive with one that is persistent and has a persistent pointwise negation. This is the source’s comparison with Gallin’s different rigidity convention.

## Proof

Let $w$ witness Strong Actuality: $w$ is true and $\Box\forall q\, .\,w\le q\lor w\le\neg q$. Given $X$, put $Y:=\lambda\bar z\, .\,w\le X[\bar z]$. $Y$ is coextensive with $X$: $w$ is true and settles each $X[\bar z]$. $Y$ is persistent, $w\le X[\bar z]$ being boxed, by 4. For the persistence of $\neg Y$, that is $\Box\forall\bar z\, .\,\Diamond(w\land\neg X[\bar z])\to\Box\Diamond(w\land\neg X[\bar z])$: ND gives B (ND (type t) gives 5, and 5 gives B, both recorded), so $\Box\Diamond w$, and $\Box\Box\Diamond w$ by 4. At any world, if $\Diamond(w\land\neg X[\bar z])$ then $w\not\le X[\bar z]$, so $w\le\neg X[\bar z]$ by the boxed condition on $w$, and by 4 this holds at every later world, where $\Diamond w$ also holds; so $\Box\Diamond(w\land\neg X[\bar z])$.

## Notes

With the recorded gallin-comprehension-implies-nd and gallin-comprehension-implies-strong-actuality, Gallin Extensional Comprehension is equivalent to ND together with Strong Actuality. ND is used only through B at the witness $w$, and B, 5, ND (type t) and ND are equivalent in C by the recorded results.

## Sources

- **Dorr 11 Oct** — Cian Dorr, suggestion of 11 October 2026.

<p class='cert'>Record: <code>topics/classicism/results/nd-and-strong-actuality-imply-gallin-comprehension.yaml</code></p>
