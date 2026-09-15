# ⊤ ⇒ □PSa ($\Diamond_\vee$)

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- $\top$

## Conclusion

- **□PSa ($\Diamond_\vee$).** $\Box (\forall p, q : t. (\Box (p \to q) \to$ ($\Diamond_\vee$$(p) \to$ $\Diamond_\vee$(q))))

## Proof

Given $\Box (p \to q)$ and $\Diamond_\vee$p, choose its defining witness P with $\mathrm{Possibility}_\vee$(P) and Pp. Extract $\operatorname{PSa}(P)$ using $\Box A \to A$, and infer Pq, hence $\Diamond_\vee$q. Discharge all temporary assumptions and universally generalize the displayed free proposition variables. Necessitate this closed theorem using the admissible empty-context rule for $\Box$.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.2, Theorem 6, p. 19.

<p class='cert'>Record: <code>topics/intuitionisticism/results/ii-implies-necessary-ps-a-possibility-vee.yaml</code></p>
