# Vicinity ∧ Weakly Inextensible Comprehension ⇒ Actuality

<p class='cert'>Result — Source: Misc.; produced by Christopher Sun (the claim and the witness), 27 September 2026; Claude Opus 5.5 (Anthropic), the written proof, reconstructed from Sun's witness at Cian Dorr's request and checked by him; recorded by Claude Opus 5.5 (Anthropic), 27 September 2026.</p>

## Premises

- **Vicinity.** There is a true proposition that entails the possibility of each true proposition.
- **Weakly Inextensible Comprehension.** Every relation, including a proposition, is coextensive with a weakly inextensible one.

## Conclusion

- **Actuality.** There is a true proposition that entails every true proposition.

## Proof

Let $w$ witness Vicinity. Weakly Inextensible Comprehension at type $t\to t$, applied to $X:=\lambda p\, .\,p$, gives a weakly inextensible $F$ with $\forall p\, .\,Fp\leftrightarrow p$. Put $a:=w\land\forall p\, .\,p\leftrightarrow Fp$, which is true. Fix a true $q$; we show $a\le q$. Let $Z_q:=\lambda p\, .\,w\to\Diamond(q\land p)$. If $Fp$ then $p$ is true, so $q\land p$ is true and Vicinity gives $w\le\Diamond(q\land p)$, which is $\Box Z_q\,p$. Hence $\forall p\, .\,Fp\to\Box Z_q\,p$, and weak inextensibility gives $F\le Z_q$, that is $\Box\forall p\, .\,Fp\to(w\to\Diamond(q\land p))$. Instantiate at $p:=\neg q$: since $\Diamond(q\land\neg q)=\Diamond\bot=\bot$, this is $\Box\neg(w\land F\neg q)$. The formula $a\land\neg q\to w\land F\neg q$ is a theorem, so by necessitation and K, $\Box\neg(a\land\neg q)$, which is $a\le q$. So $a$ witnesses Actuality.

## Notes

Only the type-$(t\to t)$ instance of Weakly Inextensible Comprehension at $X=\lambda p\, .\,p$ is used. Unlike the derivation of Weakly Inextensible Comprehension from Actuality, the argument uses the box in the antecedent of weak inextensibility, and Vicinity is what supplies it. With that derivation and Actuality ⇒ Vicinity, Actuality is equivalent to Vicinity together with Weakly Inextensible Comprehension. Since the implication is a theorem of C, its necessitation also holds, but the map has no record of necessary Weakly Inextensible Comprehension.

## Sources

- **Sun 27 Sep** — Christopher Sun, claim and witness communicated to Cian Dorr, 27 September 2026.
- **BC does not imply RC** — Cian Dorr, Boolean Completeness does not imply Rigid Comprehension, draft of 30 July 2026, p. 12 (weak inextensibility).

<p class='cert'>Record: <code>topics/classicism/results/vicinity-and-weakly-inextensible-comprehension-imply-actuality.yaml</code></p>

## Paper references

- **Background: Boolean Completeness does not imply Rigid Comprehension.** Dorr, Cian. Boolean Completeness does not imply Rigid Comprehension. Unpublished draft in progress, 30 July 2026, 27 pages. All page, proposition and lemma locators for this source refer to that draft. Parts of the draft were drafted with AI assistance; its mathematical claims are attributed to the author. — p. 12. Source of weak inextensibility.
