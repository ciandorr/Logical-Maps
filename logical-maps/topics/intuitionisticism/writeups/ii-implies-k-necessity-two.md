# ⊤ ⇒ K (□₂)

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- ⊤

## Conclusion

- **K (□₂).** ∀p,q:t. □₂(p → q) → (□₂p → □₂q)

## Proof

Assume □₂(p→q) and □₂p. For any qualified N, its necessary normality gives its universally quantified K condition. Instantiate that condition at p,q, and use N(p→q) and Np obtained from the two assumptions, to get Nq. Quantify N, discharge and generalize p,q.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.5, Theorem 15, p. 26.

<p class='cert'>Record: <code>topics/intuitionisticism/results/ii-implies-k-necessity-two.yaml</code></p>
