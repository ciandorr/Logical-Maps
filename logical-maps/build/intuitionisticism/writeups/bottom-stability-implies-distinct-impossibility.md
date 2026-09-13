# Stability of =⊥ ⇒ Impossibility ⇒ necessary falsehood (≠⊥)

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- **Stability of =⊥.** ∀p:t. ¬¬(p = ⊥) → (p = ⊥)

## Conclusion

- **Impossibility ⇒ necessary falsehood (≠⊥).** ∀p:t. ¬(p ≠ ⊥) → □¬p

## Proof

The antecedent ¬(p≠⊥) is ¬¬(p=⊥). Apply the selected stability formula, then the II identity p=⊥↔□¬p.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §3.2, Eqs. (17)–(18), p. 11.

<p class='cert'>Record: <code>topics/intuitionisticism/results/bottom-stability-implies-distinct-impossibility.yaml</code></p>

## Paper references

- **Proof: Possibility in Intuitionistic Higher-Order Logic.** Zachary Goodsell (21 August 2026). Possibility in Intuitionistic Higher-Order Logic. Manuscript.
 — §3.2, Eqs. (17)–(18), p. 11
