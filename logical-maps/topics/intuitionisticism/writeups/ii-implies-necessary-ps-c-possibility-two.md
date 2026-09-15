# ⊤ ⇒ □PSc (◇₂)

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- $\top$

## Conclusion

- **□PSc (◇₂).** $\Box (\forall p, q : t. (\Diamond _{2}(p \lor q) \to (\Diamond _{2}(p) \lor \Diamond _{2}(q))))$

## Proof

Given $\Diamond _{2}(p \lor q)$, choose a defining candidate P with $P(p \lor q)$. Its necessary PSc condition implies $Pp \lor Pq$. Each disjunct supplies a witness to $\Diamond _{2}p$ or $\Diamond _{2}q$ respectively. Discharge all temporary assumptions and universally generalize the displayed free proposition variables. Necessitate this closed theorem using the admissible empty-context rule for $\Box$.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.5, Theorem 15, p. 26.

<p class='cert'>Record: <code>topics/intuitionisticism/results/ii-implies-necessary-ps-c-possibility-two.yaml</code></p>
