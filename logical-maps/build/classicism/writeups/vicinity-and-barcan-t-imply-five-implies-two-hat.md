# Vicinity ∧ BF (type t) ⇒ 5-necessities are two-hat necessary

<p class='cert'>Result — Source: The Bounds of Possibility (2021), Lean `Classicism.Map.vicinity_and_barcan_t_imply_five_implies_two_hat`; produced by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 14 October 2026, from Propositions D8 and D18 of The Bounds of Possibility, Appendix D; Vicinity in place of Actuality suggested by Christopher Sun; recorded by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 14 October 2026.</p>

## Premises

- **Vicinity.** There is a true proposition that entails the possibility of each true proposition.
- **BF (type t).** If every proposition necessarily has a property, then necessarily every proposition has it.

## Conclusion

- **5-necessities are two-hat necessary.** Whatever is 5-necessary is two-hat necessary.

## Proof

Let $w$ witness Vicinity: $w$ is true and $\forall t(t\to\Box(w\to\Diamond t))$. First, $\Box_{\ne}p\leftrightarrow\Box(\Diamond w\to p)$ for every $p$: right to left take $q:=w$ in the definition of $\Box_{\ne}$; left to right, if $q$ is true with $\Box(\Diamond q\to p)$, Vicinity gives $\Box(w\to\Diamond q)$, so $\Box(\Diamond w\to\Diamond q)$ by S4 and $\Box(\Diamond w\to p)$. (Equivalently, by the ND-necessity form of Vicinity, $w$ entails every ND-necessary truth, and $\Diamond r$ is ND-necessary for true $r$; this is Proposition D18 of The Bounds of Possibility for $X=\Box$, with the Vicinity witness in place of the atom.) Second, B for $\Box_{\ne}$ at every true $p$: $\hat\Diamond p=\forall r(r\to\Diamond(\Diamond r\wedge p))$, so by the first step it suffices to show $\Box(\Diamond w\to\forall r(r\to\Diamond(\Diamond r\wedge p)))$, and by BF at type $t$ (with CBF) it suffices to show $\Box(\Diamond w\wedge r\to\Diamond(\Diamond r\wedge p))$ for each $r$. If $\Box\neg r$ this is vacuous. Otherwise $\Diamond r\wedge p$ is true, so Vicinity gives $\Box(w\to\Diamond(\Diamond r\wedge p))$, hence $\Box(\Diamond w\to\Diamond(\Diamond r\wedge p))$ by S4. Third, B for $\Box_{\ne}$ at every true $q$ gives $\Box(\Diamond w\to\hat\Diamond q)$, hence the characterization $\hat{\hat\Box}p\leftrightarrow\Box(\hat\Diamond w\to p)$ (right to left is trivial, as $w$ is true). Fourth, BF at type $t$ applied to $\lambda z\, .\,\hat\Diamond w\to Yz$ turns $\forall z\,\Box(\hat\Diamond w\to Yz)$ into $\Box(\hat\Diamond w\to\forall z\,Yz)$: $\hat{\hat\Box}$ satisfies BF at type $t$ at the actual world. Finally relativize as in Proposition D8: with $C$ the true closed sentence that $\hat{\hat\Box}$ is NKJF$_{\langle\rangle}$, the operator $\lambda p\, .\,C\to\hat{\hat\Box}p$ is coextensive with $\hat{\hat\Box}$ and necessarily NKJF$_{\langle\rangle}$, so $\Box_5p\to\hat{\hat\Box}p$.

## Notes

Vicinity alone is not known to suffice; see the conjecture. With Actuality in place of Vicinity the result holds without BF.

## Sources

- **Bounds of Possibility** — Cian Dorr, John Hawthorne, and Juhani Yli-Vakkuri, The Bounds of Possibility, Appendix D, Propositions D8 and D18.
- **Dorr–Claude 14 Oct** — Cian Dorr and Claude Fable 5.1 (Anthropic), conversation of 14 October 2026 (transcript in the private notes).

<p class='cert'>Record: <code>topics/classicism/results/vicinity-and-barcan-t-imply-five-implies-two-hat.yaml</code></p>

## Paper references

- **Proof: The Bounds of Possibility.** Dorr, Cian, John Hawthorne, and Juhani Yli-Vakkuri (2021). The Bounds of Possibility. Oxford University Press. Appendix D, Narrower Modalities in Higher-Order S4, pp. 400–409; locators follow the OUP corrected proof dated 9 May 2024. Its background logic HS4 (a primitive S4 operator over higher-order logic) is read into C by interpreting the primitive box as $\lambda p\, .\,p=\top$, under which every theorem of HS4 is a theorem of C. — Propositions D8, D18
