# PSd (◇₂) ⇒ Impossibility ⇒ necessary falsehood (◇₂)

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- **PSd (◇₂).** For every p and q, if ◇₂(p) implies □q, then □(p → q), with □p defined as p = ⊤.

## Conclusion

- **Impossibility ⇒ necessary falsehood (◇₂).** ∀p:t. ¬◇₂(p) → □¬p

## Proof

Fix p and assume ¬◇₂(p). Then ◇₂(p)→□⊥ by explosion. Instantiate PSd at p and q=⊥ to get □(p→⊥), which is □¬p. Discharge and generalize p.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.1, after Eq. (25), pp. 16–17.

<p class='cert'>Record: <code>topics/intuitionisticism/results/ps-d-possibility-two-implies-necessary-falsehood.yaml</code></p>

## Paper references

- **Proof: Possibility in Intuitionistic Higher-Order Logic.** Zachary Goodsell (21 August 2026). Possibility in Intuitionistic Higher-Order Logic. Manuscript.
 — §4.1, after Eq. (25), pp. 16–17
