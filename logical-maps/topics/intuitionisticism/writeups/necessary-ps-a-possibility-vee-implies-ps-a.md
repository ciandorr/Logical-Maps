# □PSa ($\Diamond_\vee$) ⇒ PSa ($\Diamond_\vee$)

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- **□PSa ($\Diamond_\vee$).** □(∀p, q : t. (□(p → q) → ($\Diamond_\vee$(p) → $\Diamond_\vee$(q))))

## Conclusion

- **PSa ($\Diamond_\vee$).** For every p and q, □(p → q) implies that $\Diamond_\vee$(p) implies $\Diamond_\vee$(q), with □p defined as p = ⊤.

## Proof

Apply the standing theorem □A → A to the entire quantified PS condition. This is modal elimination, with no necessitation of assumptions.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.2, Theorem 6, p. 19.

<p class='cert'>Record: <code>topics/intuitionisticism/results/necessary-ps-a-possibility-vee-implies-ps-a.yaml</code></p>
