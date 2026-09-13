# Uniform impossibility counterexamples ∧ A PSb–PSc–PSd operator exists ⇒ False (⊥)

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- **Uniform impossibility counterexamples.** ∀f:tt. (PSb(f) ∧ PSc(f)) → ∃p:t. (¬f p ∧ p ≠ ⊥)
- **A PSb–PSc–PSd operator exists.** ∃f:tt. PSb(f) ∧ PSc(f) ∧ PSd(f)

## Conclusion

- **False (⊥).** These premises cannot all hold together.

## Proof

Choose f with PSb, PSc and PSd. The uniform counterexample formula at f gives p with ¬fp and p≠⊥. PSd at p,⊥ turns ¬fp into □¬p, hence p=⊥ by footnote 5. Contradiction.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.1, Theorem 5(ii), p. 17.

<p class='cert'>Record: <code>topics/intuitionisticism/results/uniform-counterexamples-exclude-ps-b-c-d.yaml</code></p>
