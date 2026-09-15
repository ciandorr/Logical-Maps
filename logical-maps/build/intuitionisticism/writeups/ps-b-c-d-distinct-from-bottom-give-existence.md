# PSb (≠⊥) ∧ PSc (≠⊥) ∧ PSd (≠⊥) ⇒ A PSb–PSc–PSd operator exists

<p class='cert'>Result — Source: Misc.; produced by Codex (GPT-6), 13 September 2026; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- **PSb (≠⊥).** The contradiction is not distinct from itself: $\neg (\bot \ne \bot )$.
- **PSc (≠⊥).** For every p and $q, (p \lor q) \ne \bot$ implies $p \ne \bot$ or $q \ne \bot$.
- **PSd (≠⊥).** For every p and q, if $p \ne \bot$ implies $\Box q$, then $\Box (p \to q)$, with $\Box p$ defined as $p = \top$.

## Conclusion

- **A PSb–PSc–PSd operator exists.** $\exists f:tt. \operatorname{PSb}(f) \land \operatorname{PSc}(f) \land \operatorname{PSd}(f)$

## Proof

Use the defined operator $\ne \bot$ as the witness f, preserving all three selected conjuncts.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Codex connecting proof, 13 Sep 2026** — Codex (GPT-6), connecting proof recorded 13 September 2026 in ps-b-c-d-distinct-from-bottom-give-existence.
- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.1, Theorem 5(ii), p. 17.

<p class='cert'>Record: <code>topics/intuitionisticism/results/ps-b-c-d-distinct-from-bottom-give-existence.yaml</code></p>

## Paper references

- **Background: Possibility in Intuitionistic Higher-Order Logic.** Zachary Goodsell (21 August 2026). Possibility in Intuitionistic Higher-Order Logic. Manuscript.
 — §4.1, Theorem 5(ii), p. 17
