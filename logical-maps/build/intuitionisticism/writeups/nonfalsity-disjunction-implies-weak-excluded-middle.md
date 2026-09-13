# Nonfalsity distributes over ∨ ⇒ WLEM

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- **Nonfalsity distributes over ∨.** ∀p,q:t. ¬¬(p ∨ q) → (¬¬p ∨ ¬¬q)

## Conclusion

- **WLEM.** ∀p:t. ¬p ∨ ¬¬p

## Proof

For arbitrary p, intuitionistic logic proves ¬¬(p∨¬p). Apply the selected distribution formula to p and ¬p, obtaining ¬¬p∨¬¬¬p. Triple-negation reduction gives ¬¬p∨¬p, hence weak excluded middle after swapping disjuncts. Generalize p.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.2, Theorem 8, p. 19.

<p class='cert'>Record: <code>topics/intuitionisticism/results/nonfalsity-disjunction-implies-weak-excluded-middle.yaml</code></p>

## Paper references

- **Proof: Possibility in Intuitionistic Higher-Order Logic.** Zachary Goodsell (21 August 2026). Possibility in Intuitionistic Higher-Order Logic. Manuscript.
 — §4.2, Theorem 8, p. 19
