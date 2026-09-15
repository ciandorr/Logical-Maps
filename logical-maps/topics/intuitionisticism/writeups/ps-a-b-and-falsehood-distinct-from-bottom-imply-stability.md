# PSa (≠⊥) ∧ PSb (≠⊥) ∧ Impossibility ⇒ necessary falsehood (≠⊥) ⇒ Stability of □¬

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- **PSa (≠⊥).** For every p and $q, \Box (p \to q)$ implies that $p \ne \bot$ implies $q \ne \bot$, with $\Box p$ defined as $p = \top$.
- **PSb (≠⊥).** The contradiction is not distinct from itself: $\neg (\bot \ne \bot )$.
- **Impossibility ⇒ necessary falsehood (≠⊥).** $\forall p:t. \neg (p \ne \bot ) \to \Box \neg p$

## Conclusion

- **Stability of □¬.** $\forall p:t. \neg \neg \Box \neg p \to \Box \neg p$

## Proof

PSa at $(p,\bot )$, together with PSb, gives $\Box \neg p\to \neg (p\ne \bot )$. Under $\neg \neg \Box \neg p$ this gives $\neg \neg \neg (p\ne \bot )$, hence $\neg (p\ne \bot )$ by triple-negation reduction. The selected necessary-falsehood condition gives $\Box \neg p$. Discharge and generalize p.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.1, Eqs. (28)–(29), p. 17.

<p class='cert'>Record: <code>topics/intuitionisticism/results/ps-a-b-and-falsehood-distinct-from-bottom-imply-stability.yaml</code></p>
