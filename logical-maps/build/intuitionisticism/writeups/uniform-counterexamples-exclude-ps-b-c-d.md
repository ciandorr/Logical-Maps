# Uniform impossibility counterexamples ∧ A PSb–PSc–PSd operator exists ⇒ False (⊥)

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- **Uniform impossibility counterexamples.** $\forall f:tt. (\operatorname{PSb}(f) \land \operatorname{PSc}(f)) \to \exists p:t. (\neg f p \land p \ne \bot )$
- **A PSb–PSc–PSd operator exists.** $\exists f:tt. \operatorname{PSb}(f) \land \operatorname{PSc}(f) \land \operatorname{PSd}(f)$

## Conclusion

- **False (⊥).** These premises cannot all hold together.

## Proof

Choose f with PSb, PSc and PSd. The uniform counterexample formula at f gives p with $\neg fp$ and $p\ne \bot . \operatorname{PSd}$ at $p,\bot$ turns $\neg fp$ into $\Box \neg p$, hence $p=\bot$ by footnote 5. Contradiction.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.1, Theorem 5(ii), p. 17.

<p class='cert'>Record: <code>topics/intuitionisticism/results/uniform-counterexamples-exclude-ps-b-c-d.yaml</code></p>

## Paper references

- **Proof: Possibility in Intuitionistic Higher-Order Logic.** Zachary Goodsell (21 August 2026). Possibility in Intuitionistic Higher-Order Logic. Manuscript.
 — §4.1, Theorem 5(ii), p. 17
