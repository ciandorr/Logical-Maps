# PSb (≠⊥) ∧ PSc (≠⊥) ∧ PSd (≠⊥) ⇒ A PSb–PSc–PSd operator exists

<p class='cert'>Result — Source: Misc.; produced by Codex (GPT-6), 13 September 2026; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- **PSb (≠⊥).** The contradiction is not distinct from itself: ¬(⊥ ≠ ⊥).
- **PSc (≠⊥).** For every p and q, (p ∨ q) ≠ ⊥ implies p ≠ ⊥ or q ≠ ⊥.
- **PSd (≠⊥).** For every p and q, if p ≠ ⊥ implies □q, then □(p → q), with □p defined as p = ⊤.

## Conclusion

- **A PSb–PSc–PSd operator exists.** ∃f:tt. PSb(f) ∧ PSc(f) ∧ PSd(f)

## Proof

Use the defined operator ≠⊥ as the witness f, preserving all three selected conjuncts.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Codex connecting proof, 13 Sep 2026** — Codex (GPT-6), connecting proof recorded 13 September 2026 in ps-b-c-d-distinct-from-bottom-give-existence.
- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.1, Theorem 5(ii), p. 17.

<p class='cert'>Record: <code>topics/intuitionisticism/results/ps-b-c-d-distinct-from-bottom-give-existence.yaml</code></p>
