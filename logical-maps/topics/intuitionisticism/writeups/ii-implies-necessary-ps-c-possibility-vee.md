# ⊤ ⇒ □PSc ($\Diamond_\vee$)

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- ⊤

## Conclusion

- **□PSc ($\Diamond_\vee$).** □(∀p, q : t. ($\Diamond_\vee$(p ∨ q) → ($\Diamond_\vee$(p) ∨ $\Diamond_\vee$(q))))

## Proof

Given $\Diamond_\vee$(p ∨ q), choose a defining candidate P with P(p ∨ q). Its necessary PSc condition implies Pp ∨ Pq. Each disjunct supplies a witness to $\Diamond_\vee$p or $\Diamond_\vee$q respectively. Discharge all temporary assumptions and universally generalize the displayed free proposition variables. Necessitate this closed theorem using the admissible empty-context rule for □.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.2, Theorem 6, p. 19.

<p class='cert'>Record: <code>topics/intuitionisticism/results/ii-implies-necessary-ps-c-possibility-vee.yaml</code></p>
