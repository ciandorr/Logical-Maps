# ⊤ ⇒ □PSd (□₂, ◇₂)

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- ⊤

## Conclusion

- **□PSd (□₂, ◇₂).** □(∀p,q:t. (◇₂p → □₂q) → □₂(p → q))

## Proof

Assume ◇₂p→□₂q. For arbitrary qualified N choose its qualified spouse P. Then Pp→◇₂p→□₂q→Nq. Their PSd₂ clause gives N(p→q). Quantifying over qualified N gives □₂(p→q). Discharge temporary assumptions and universally generalize p,q. Necessitate the resulting closed theorem with the standing □ rule, as required by the outer identity in Married.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.5, Theorem 14, pp. 25–26.

<p class='cert'>Record: <code>topics/intuitionisticism/results/ii-implies-necessary-ps-d-paired-two.yaml</code></p>
