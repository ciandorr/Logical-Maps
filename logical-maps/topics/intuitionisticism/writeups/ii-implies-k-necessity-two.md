# ⊤ ⇒ K (□₂)

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- $\top$

## Conclusion

- **K (□₂).** $\forall p,q:t. \Box _{2}(p \to q) \to (\Box _{2}p \to \Box _{2}q)$

## Proof

Assume $\Box _{2}(p\to q)$ and $\Box _{2}p$. For any qualified N, its necessary normality gives its universally quantified K condition. Instantiate that condition at p,q, and use $N(p\to q)$ and Np obtained from the two assumptions, to get Nq. Quantify N, discharge and generalize p,q.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.5, Theorem 15, p. 26.

<p class='cert'>Record: <code>topics/intuitionisticism/results/ii-implies-k-necessity-two.yaml</code></p>
