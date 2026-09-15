# A PSb–PSd operator exists ⇒ Stability of =⊥

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- **A PSb–PSd operator exists.** $\exists f:tt. \operatorname{PSb}(f) \land \operatorname{PSd}(f)$

## Conclusion

- **Stability of =⊥.** $\forall p:t. \neg \neg (p = \bot ) \to (p = \bot )$

## Proof

Choose f with PSb and PSd. Fix p and assume $\neg \neg (p=\bot )$. If $p=\bot$, substitution and PSb give $\neg fp$. Therefore the double-negated identity gives $\neg \neg \neg fp$, hence $\neg fp$ by triple-negation reduction. PSd at $p,\bot$ then gives $\Box \neg p$, equivalently $p=\bot$. Discharge and generalize p; the conclusion does not depend on the chosen f, so eliminate its existential witness.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.1, Theorem 5(i) and discussion of Eq. (29), p. 17.

<p class='cert'>Record: <code>topics/intuitionisticism/results/ps-b-d-existence-implies-stability.yaml</code></p>

## Paper references

- **Proof: Possibility in Intuitionistic Higher-Order Logic.** Zachary Goodsell (21 August 2026). Possibility in Intuitionistic Higher-Order Logic. Manuscript.
 — §4.1, Theorem 5(i) and discussion of Eq. (29), p. 17
