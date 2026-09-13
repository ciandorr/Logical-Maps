# Universal self-necessitation ∧ Nonfalsity gives distinct disjunct ⇒ WLEM

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- **Universal self-necessitation.** ∀p:t. p → □p
- **Nonfalsity gives distinct disjunct.** ∀p,q:t. ¬¬(p ∨ q) → ((p ≠ ⊥) ∨ (q ≠ ⊥))

## Conclusion

- **WLEM.** ∀p:t. ¬p ∨ ¬¬p

## Proof

Instantiate self-necessitation at ¬p to obtain ¬p→□¬p, equivalently ¬p→p=⊥. Contraposition gives p≠⊥→¬¬p. At ¬¬p the same reasoning gives ¬p≠⊥→¬¬¬p→¬p. Intuitionistic logic proves ¬¬(p∨¬p); Eq. (77), instantiated at p and ¬p, therefore yields p≠⊥∨¬p≠⊥. The two implications just obtained give ¬¬p∨¬p. Generalize p.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §5.5, Eqs. (77)–(79), pp. 37–38.

<p class='cert'>Record: <code>topics/intuitionisticism/results/self-necessitation-and-distinct-disjunction-imply-weak.yaml</code></p>

## Paper references

- **Proof: Possibility in Intuitionistic Higher-Order Logic.** Zachary Goodsell (21 August 2026). Possibility in Intuitionistic Higher-Order Logic. Manuscript.
 — §5.5, Eqs. (77)–(79), pp. 37–38
