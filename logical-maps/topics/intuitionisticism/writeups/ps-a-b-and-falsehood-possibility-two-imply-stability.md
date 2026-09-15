# PSa (◇₂) ∧ PSb (◇₂) ∧ Impossibility ⇒ necessary falsehood (◇₂) ⇒ Stability of □¬

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- **PSa (◇₂).** For every p and $q, \Box (p \to q)$ implies that $\Diamond _{2}(p)$ implies $\Diamond _{2}(q)$, with $\Box p$ defined as $p = \top$.
- **PSb (◇₂).** $\Diamond _{2}$ does not hold of the contradiction $\bot$.
- **Impossibility ⇒ necessary falsehood (◇₂).** $\forall p:t. \neg \Diamond _{2}(p) \to \Box \neg p$

## Conclusion

- **Stability of □¬.** $\forall p:t. \neg \neg \Box \neg p \to \Box \neg p$

## Proof

PSa at $(p,\bot )$, together with PSb, gives $\Box \neg p\to \neg \Diamond _{2}(p)$. Under $\neg \neg \Box \neg p$ this gives $\neg \neg \neg \Diamond _{2}(p)$, hence $\neg \Diamond _{2}(p)$ by triple-negation reduction. The selected necessary-falsehood condition gives $\Box \neg p$. Discharge and generalize p.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.1, Eqs. (28)–(29), p. 17.

<p class='cert'>Record: <code>topics/intuitionisticism/results/ps-a-b-and-falsehood-possibility-two-imply-stability.yaml</code></p>
