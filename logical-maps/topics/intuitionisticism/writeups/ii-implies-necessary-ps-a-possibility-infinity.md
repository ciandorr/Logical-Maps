# ⊤ ⇒ □PSa ($\Diamond_\infty$)

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- ⊤

## Conclusion

- **□PSa ($\Diamond_\infty$).** □(∀p, q : t. (□(p → q) → ($\Diamond_\infty$(p) → $\Diamond_\infty$(q))))

## Proof

Given □(p → q) and $\Diamond_\infty$p, choose its defining witness P with $\mathrm{Possibility}_\infty$(P) and Pp. Extract PSa(P) using □A → A, and infer Pq, hence $\Diamond_\infty$q. Discharge all temporary assumptions and universally generalize the displayed free proposition variables. Necessitate this closed theorem using the admissible empty-context rule for □.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.4, Theorem 12, pp. 23–24.

<p class='cert'>Record: <code>topics/intuitionisticism/results/ii-implies-necessary-ps-a-possibility-infinity.yaml</code></p>
