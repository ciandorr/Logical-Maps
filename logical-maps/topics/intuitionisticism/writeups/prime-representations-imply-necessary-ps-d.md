# Prime representation of $\Diamond_\vee$ ∧ Prime representation of □ ⇒ □PSd ($\Diamond_\vee$)

<p class='cert'>Conjecture — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- **Prime representation of $\Diamond_\vee$.** $\Diamond_\vee$ $= (\lambda p:t. \exists w:t. \operatorname{Prime}(w) \land \Box (w \to p))$
- **Prime representation of □.** $(\lambda p:t. \Box p) = (\lambda p:t. \forall w:t. \operatorname{Prime}(w) \to \Box (w \to p))$

## Conclusion

- **□PSd ($\Diamond_\vee$).** $\Box (\forall p,q:t$. (($\Diamond_\vee$$(p) \to \Box q) \to \Box (p \to q$)))

## Notes

The paper says PSd is recovered immediately by the quantified intuitionistic implication in Eq. (41). The necessary entailment and outer $\Box$ steps, under the two operator-identity assumptions, have not been fully transcribed here.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.3, Eqs. (39)–(41), p. 21.

<p class='cert'>Record: <code>topics/intuitionisticism/results/prime-representations-imply-necessary-ps-d.yaml</code></p>
