# □LEM ∧ Necessary nonfalsity without necessity ⇒ False (⊥)

<p class='cert'>Result — Source: Misc.; produced by Codex (GPT-6), 13 September 2026; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- **□LEM.** The universally quantified law of excluded middle is identical to the tautology.
- **Necessary nonfalsity without necessity.** ∃p:t. (□¬¬p ∧ p ≠ ⊤)

## Conclusion

- **False (⊥).** These premises cannot all hold together.

## Proof

The closed intuitionistic implication from quantified excluded middle to ∀p.(¬¬p→p) can be necessitated. With necessary excluded middle, K and necessitated universal instantiation give □(¬¬p→p) for each p. Choose the existential witness with □¬¬p and p≠⊤; K yields □p, which is p=⊤, contradicting p≠⊤.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Codex connecting proof, 13 Sep 2026** — Codex (GPT-6), connecting proof recorded 13 September 2026 in necessary-classicality-excludes-distinct-necessary-nonfalsity.
- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §6.4, Eq. (85), p. 45.

<p class='cert'>Record: <code>topics/intuitionisticism/results/necessary-classicality-excludes-distinct-necessary-nonfalsity.yaml</code></p>

## Paper references

- **Background: Possibility in Intuitionistic Higher-Order Logic.** Zachary Goodsell (21 August 2026). Possibility in Intuitionistic Higher-Order Logic. Manuscript.
 — §6.4, Eq. (85), p. 45
