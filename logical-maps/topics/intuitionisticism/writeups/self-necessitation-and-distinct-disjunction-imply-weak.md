# Universal self-necessitation ∧ Nonfalsity gives distinct disjunct ⇒ WLEM

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- **Universal self-necessitation.** $\forall p:t. p \to \Box p$
- **Nonfalsity gives distinct disjunct.** $\forall p,q:t. \neg \neg (p \lor q) \to ((p \ne \bot ) \lor (q \ne \bot ))$

## Conclusion

- **WLEM.** $\forall p:t. \neg p \lor \neg \neg p$

## Proof

Instantiate self-necessitation at $\neg p$ to obtain $\neg p\to \Box \neg p$, equivalently $\neg p\to p=\bot$. Contraposition gives $p\ne \bot \to \neg \neg p$. At $\neg \neg p$ the same reasoning gives $\neg p\ne \bot \to \neg \neg \neg p\to \neg p$. Intuitionistic logic proves $\neg \neg (p\lor \neg p)$; Eq. (77), instantiated at p and $\neg p$, therefore yields $p\ne \bot \lor \neg p\ne \bot$. The two implications just obtained give $\neg \neg p\lor \neg p$. Generalize p.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §5.5, Eqs. (77)–(79), pp. 37–38.

<p class='cert'>Record: <code>topics/intuitionisticism/results/self-necessitation-and-distinct-disjunction-imply-weak.yaml</code></p>
