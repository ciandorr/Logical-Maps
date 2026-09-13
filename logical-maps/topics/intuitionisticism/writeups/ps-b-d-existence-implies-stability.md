# A PSb–PSd operator exists ⇒ Stability of =⊥

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- **A PSb–PSd operator exists.** ∃f:tt. PSb(f) ∧ PSd(f)

## Conclusion

- **Stability of =⊥.** ∀p:t. ¬¬(p = ⊥) → (p = ⊥)

## Proof

Choose f with PSb and PSd. Fix p and assume ¬¬(p=⊥). If p=⊥, substitution and PSb give ¬fp. Therefore the double-negated identity gives ¬¬¬fp, hence ¬fp by triple-negation reduction. PSd at p,⊥ then gives □¬p, equivalently p=⊥. Discharge and generalize p; the conclusion does not depend on the chosen f, so eliminate its existential witness.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.1, Theorem 5(i) and discussion of Eq. (29), p. 17.

<p class='cert'>Record: <code>topics/intuitionisticism/results/ps-b-d-existence-implies-stability.yaml</code></p>
