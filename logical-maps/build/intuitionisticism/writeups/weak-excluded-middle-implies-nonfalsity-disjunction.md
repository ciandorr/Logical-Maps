# WLEM ⇒ Nonfalsity distributes over ∨

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- **WLEM.** $\forall p:t. \neg p \lor \neg \neg p$

## Conclusion

- **Nonfalsity distributes over ∨.** $\forall p,q:t. \neg \neg (p \lor q) \to (\neg \neg p \lor \neg \neg q)$

## Proof

Assume $\neg \neg (p\lor q)$ and instantiate weak excluded middle at p. If $\neg \neg p$, inject into the conclusion. If $\neg p$, then $\neg q$ would refute $p\lor q$, contrary to the assumption; hence $\neg \neg q$. Discharge the assumption and generalize p,q.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.2, Theorem 8, p. 19.

<p class='cert'>Record: <code>topics/intuitionisticism/results/weak-excluded-middle-implies-nonfalsity-disjunction.yaml</code></p>

## Paper references

- **Proof: Possibility in Intuitionistic Higher-Order Logic.** Zachary Goodsell (21 August 2026). Possibility in Intuitionistic Higher-Order Logic. Manuscript.
 — §4.2, Theorem 8, p. 19
