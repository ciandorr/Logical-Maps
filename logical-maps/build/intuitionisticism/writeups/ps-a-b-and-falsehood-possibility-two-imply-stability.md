# PSa (◇₂) ∧ PSb (◇₂) ∧ Impossibility ⇒ necessary falsehood (◇₂) ⇒ Stability of □¬

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- **PSa (◇₂).** For every p and q, □(p → q) implies that ◇₂(p) implies ◇₂(q), with □p defined as p = ⊤.
- **PSb (◇₂).** ◇₂ does not hold of the contradiction ⊥.
- **Impossibility ⇒ necessary falsehood (◇₂).** ∀p:t. ¬◇₂(p) → □¬p

## Conclusion

- **Stability of □¬.** ∀p:t. ¬¬□¬p → □¬p

## Proof

PSa at (p,⊥), together with PSb, gives □¬p→¬◇₂(p). Under ¬¬□¬p this gives ¬¬¬◇₂(p), hence ¬◇₂(p) by triple-negation reduction. The selected necessary-falsehood condition gives □¬p. Discharge and generalize p.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.1, Eqs. (28)–(29), p. 17.

<p class='cert'>Record: <code>topics/intuitionisticism/results/ps-a-b-and-falsehood-possibility-two-imply-stability.yaml</code></p>

## Paper references

- **Proof: Possibility in Intuitionistic Higher-Order Logic.** Zachary Goodsell (21 August 2026). Possibility in Intuitionistic Higher-Order Logic. Manuscript.
 — §4.1, Eqs. (28)–(29), p. 17
