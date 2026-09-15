# ⊤ ⇒ □PSd (□₂, ◇₂)

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- $\top$

## Conclusion

- **□PSd (□₂, ◇₂).** $\Box (\forall p,q:t. (\Diamond _{2}p \to \Box _{2}q) \to \Box _{2}(p \to q))$

## Proof

Assume $\Diamond _{2}p\to \Box _{2}q$. For arbitrary qualified N choose its qualified spouse P. Then $Pp\to \Diamond _{2}p\to \Box _{2}q\to Nq$. Their $\operatorname{PSd}_{2}$ clause gives $N(p\to q)$. Quantifying over qualified N gives $\Box _{2}(p\to q)$. Discharge temporary assumptions and universally generalize p,q. Necessitate the resulting closed theorem with the standing $\Box$ rule, as required by the outer identity in Married.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.5, Theorem 14, pp. 25–26.

<p class='cert'>Record: <code>topics/intuitionisticism/results/ii-implies-necessary-ps-d-paired-two.yaml</code></p>
