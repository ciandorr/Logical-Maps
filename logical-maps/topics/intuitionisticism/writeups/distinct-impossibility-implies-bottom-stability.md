# Impossibility ⇒ necessary falsehood (≠⊥) ⇒ Stability of =⊥

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- **Impossibility ⇒ necessary falsehood (≠⊥).** $\forall p:t. \neg (p \ne \bot ) \to \Box \neg p$

## Conclusion

- **Stability of =⊥.** $\forall p:t. \neg \neg (p = \bot ) \to (p = \bot )$

## Proof

Rewrite $\neg (p\ne \bot )$ as $\neg \neg (p=\bot )$, and $\Box \neg p$ as $p=\bot$, using the II identity in footnote 5. Generalize p.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §3.2, Eqs. (17)–(18), p. 11.

<p class='cert'>Record: <code>topics/intuitionisticism/results/distinct-impossibility-implies-bottom-stability.yaml</code></p>
