# PSa (≠⊥) ∧ PSb (≠⊥) ∧ Impossibility ⇒ necessary falsehood (≠⊥) ⇒ Stability of □¬

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- **PSa (≠⊥).** For every p and q, □(p → q) implies that p ≠ ⊥ implies q ≠ ⊥, with □p defined as p = ⊤.
- **PSb (≠⊥).** The contradiction is not distinct from itself: ¬(⊥ ≠ ⊥).
- **Impossibility ⇒ necessary falsehood (≠⊥).** ∀p:t. ¬(p ≠ ⊥) → □¬p

## Conclusion

- **Stability of □¬.** ∀p:t. ¬¬□¬p → □¬p

## Proof

PSa at (p,⊥), together with PSb, gives □¬p→¬(p≠⊥). Under ¬¬□¬p this gives ¬¬¬(p≠⊥), hence ¬(p≠⊥) by triple-negation reduction. The selected necessary-falsehood condition gives □¬p. Discharge and generalize p.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.1, Eqs. (28)–(29), p. 17.

<p class='cert'>Record: <code>topics/intuitionisticism/results/ps-a-b-and-falsehood-distinct-from-bottom-imply-stability.yaml</code></p>
