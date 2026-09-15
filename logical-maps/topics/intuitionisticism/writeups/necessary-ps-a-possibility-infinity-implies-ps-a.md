# □PSa ($\Diamond_\infty$) ⇒ PSa ($\Diamond_\infty$)

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- **□PSa ($\Diamond_\infty$).** $\Box (\forall p, q : t. (\Box (p \to q) \to$ ($\Diamond_\infty$$(p) \to$ $\Diamond_\infty$(q))))

## Conclusion

- **PSa ($\Diamond_\infty$).** For every p and $q, \Box (p \to q)$ implies that $\Diamond_\infty$(p) implies $\Diamond_\infty$(q), with $\Box p$ defined as $p = \top$.

## Proof

Apply the standing theorem $\Box A \to A$ to the entire quantified PS condition. This is modal elimination, with no necessitation of assumptions.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.4, Theorem 12, pp. 23–24.

<p class='cert'>Record: <code>topics/intuitionisticism/results/necessary-ps-a-possibility-infinity-implies-ps-a.yaml</code></p>
