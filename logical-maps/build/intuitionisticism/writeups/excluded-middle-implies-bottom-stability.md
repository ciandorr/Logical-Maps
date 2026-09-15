# LEM ⇒ Stability of =⊥

<p class='cert'>Result — Source: Misc.; produced by Codex (GPT-6), 13 September 2026; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- **LEM.** Every proposition is true or has an intuitionistic negation that is true.

## Conclusion

- **Stability of =⊥.** $\forall p:t. \neg \neg (p = \bot ) \to (p = \bot )$

## Proof

Fix p and instantiate the selected quantified excluded-middle formula at the proposition $p=\bot$. Under $\neg \neg (p=\bot )$, its negative disjunct is impossible, so $p=\bot$. Discharge and generalize p. The excluded-middle assumption is not necessitated.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Codex connecting proof, 13 Sep 2026** — Codex (GPT-6), connecting proof recorded 13 September 2026 in excluded-middle-implies-bottom-stability.
- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §2.5, p. 7; §4.1, Eq. (29), p. 17.

<p class='cert'>Record: <code>topics/intuitionisticism/results/excluded-middle-implies-bottom-stability.yaml</code></p>

## Paper references

- **Background: Possibility in Intuitionistic Higher-Order Logic.** Zachary Goodsell (21 August 2026). Possibility in Intuitionistic Higher-Order Logic. Manuscript.
 — §2.5, p. 7; §4.1, Eq. (29), p. 17
