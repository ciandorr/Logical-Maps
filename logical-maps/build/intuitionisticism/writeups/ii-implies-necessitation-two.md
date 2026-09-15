# ⊤ ⇒ Necessitation (□₂)

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- $\top$

## Conclusion

- **Necessitation (□₂).** For every formula A: from $\vdash A$ infer $\vdash \Box _{2}A$; the assumption context must be empty.

## Proof

Given an assumption-free proof of any formula A, standing intensionality gives $A=\top$. For arbitrary qualified N, the candidate definition gives $N\top$, so substitution yields NA. Generalize over N to derive $\Box _{2}A$. This argument covers every empty-context instance of the rule.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.5, Theorems 15–17, p. 26.

<p class='cert'>Record: <code>topics/intuitionisticism/results/ii-implies-necessitation-two.yaml</code></p>

## Paper references

- **Proof: Possibility in Intuitionistic Higher-Order Logic.** Zachary Goodsell (21 August 2026). Possibility in Intuitionistic Higher-Order Logic. Manuscript.
 — §4.5, Theorems 15–17, p. 26
