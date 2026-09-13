# PSa ($\Diamond_\infty$) ∧ PSb ($\Diamond_\infty$) ∧ Impossibility ⇒ necessary falsehood ($\Diamond_\infty$) ⇒ Stability of □¬

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- **PSa ($\Diamond_\infty$).** For every p and q, □(p → q) implies that $\Diamond_\infty$(p) implies $\Diamond_\infty$(q), with □p defined as p = ⊤.
- **PSb ($\Diamond_\infty$).** $\Diamond_\infty$ does not hold of the contradiction ⊥.
- **Impossibility ⇒ necessary falsehood ($\Diamond_\infty$).** ∀p:t. ¬$\Diamond_\infty$(p) → □¬p

## Conclusion

- **Stability of □¬.** ∀p:t. ¬¬□¬p → □¬p

## Proof

PSa at (p,⊥), together with PSb, gives □¬p→¬$\Diamond_\infty$(p). Under ¬¬□¬p this gives ¬¬¬$\Diamond_\infty$(p), hence ¬$\Diamond_\infty$(p) by triple-negation reduction. The selected necessary-falsehood condition gives □¬p. Discharge and generalize p.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.1, Eqs. (28)–(29), p. 17.

<p class='cert'>Record: <code>topics/intuitionisticism/results/ps-a-b-and-falsehood-possibility-infinity-imply-stability.yaml</code></p>

## Paper references

- **Proof: Possibility in Intuitionistic Higher-Order Logic.** Zachary Goodsell (21 August 2026). Possibility in Intuitionistic Higher-Order Logic. Manuscript.
 — §4.1, Eqs. (28)–(29), p. 17
