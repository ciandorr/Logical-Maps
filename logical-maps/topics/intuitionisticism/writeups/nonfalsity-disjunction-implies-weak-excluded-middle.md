# Nonfalsity distributes over ∨ ⇒ WLEM

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- **Nonfalsity distributes over ∨.** $\forall p,q:t. \neg \neg (p \lor q) \to (\neg \neg p \lor \neg \neg q)$

## Conclusion

- **WLEM.** $\forall p:t. \neg p \lor \neg \neg p$

## Proof

For arbitrary p, intuitionistic logic proves $\neg \neg (p\lor \neg p)$. Apply the selected distribution formula to p and $\neg p$, obtaining $\neg \neg p\lor \neg \neg \neg p$. Triple-negation reduction gives $\neg \neg p\lor \neg p$, hence weak excluded middle after swapping disjuncts. Generalize p.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.2, Theorem 8, p. 19.

<p class='cert'>Record: <code>topics/intuitionisticism/results/nonfalsity-disjunction-implies-weak-excluded-middle.yaml</code></p>
