# PSa ($\Diamond_\vee$) ∧ PSb ($\Diamond_\vee$) ∧ Impossibility ⇒ necessary falsehood ($\Diamond_\vee$) ⇒ Stability of □¬

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- **PSa ($\Diamond_\vee$).** For every p and $q, \Box (p \to q)$ implies that $\Diamond_\vee$(p) implies $\Diamond_\vee$(q), with $\Box p$ defined as $p = \top$.
- **PSb ($\Diamond_\vee$).** $\Diamond_\vee$ does not hold of the contradiction $\bot$.
- **Impossibility ⇒ necessary falsehood ($\Diamond_\vee$).** $\forall p:t. \neg$$\Diamond_\vee$$(p) \to \Box \neg p$

## Conclusion

- **Stability of □¬.** $\forall p:t. \neg \neg \Box \neg p \to \Box \neg p$

## Proof

PSa at $(p,\bot )$, together with PSb, gives $\Box \neg p\to \neg$$\Diamond_\vee$(p). Under $\neg \neg \Box \neg p$ this gives $\neg \neg \neg$$\Diamond_\vee$(p), hence $\neg$$\Diamond_\vee$(p) by triple-negation reduction. The selected necessary-falsehood condition gives $\Box \neg p$. Discharge and generalize p.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.1, Eqs. (28)–(29), p. 17.

<p class='cert'>Record: <code>topics/intuitionisticism/results/ps-a-b-and-falsehood-possibility-vee-imply-stability.yaml</code></p>

## Paper references

- **Proof: Possibility in Intuitionistic Higher-Order Logic.** Zachary Goodsell (21 August 2026). Possibility in Intuitionistic Higher-Order Logic. Manuscript.
 — §4.1, Eqs. (28)–(29), p. 17
