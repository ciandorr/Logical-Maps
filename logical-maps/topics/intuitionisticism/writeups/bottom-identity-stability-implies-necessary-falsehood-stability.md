# Stability of =⊥ ⇒ Stability of □¬

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- **Stability of =⊥.** $\forall p:t. \neg \neg (p = \bot ) \to (p = \bot )$

## Conclusion

- **Stability of □¬.** $\forall p:t. \neg \neg \Box \neg p \to \Box \neg p$

## Proof

Use the II identity $(=\bot ) = ((=\top )\circ \neg )$ from footnote 5, so $p=\bot$ and $\Box \neg p$ can be replaced even inside negations. The entire quantified stability formula is thereby transformed into the other one.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §3.2, footnote 5, p. 10; §4.1, Eqs. (28)–(29), p. 17.

<p class='cert'>Record: <code>topics/intuitionisticism/results/bottom-identity-stability-implies-necessary-falsehood-stability.yaml</code></p>
