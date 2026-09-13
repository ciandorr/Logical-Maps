# Universal self-necessitation ⇒ Propositional extensionality

<p class='cert'>Result — Source: Misc.; produced by Codex (GPT-6), connecting proof; recorded by Codex (GPT-6).</p>

## Premises

- **Universal self-necessitation.** ∀p:t. p → □p

## Conclusion

- **Propositional extensionality.** ∀p,q:t. (p ↔ q) → (p = q)

## Proof

Given p↔q, instantiate self-necessitation at the proposition p↔q to obtain □(p↔q). The zero-argument form of the proved intensionality lemma gives p=q: it follows by necessitation-free substitution into the closed identity ((p↔q)∧p)=((p↔q)∧q). Discharge and generalize p,q.

## Notes

Informal proof; no independent checker or Lean verification. Formula assumptions are not eligible for unrestricted necessitation.

## Sources

- **Codex connecting proofs, 13 Sep 2026** — Codex (GPT-6), connecting proof self-necessitation-implies-propositional-extensionality, 2026-09-13.
- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §2.2, pp. 5–6; §5.5, p. 37 (definitions/background).

<p class='cert'>Record: <code>topics/intuitionisticism/results/self-necessitation-implies-propositional-extensionality.yaml</code></p>

## Paper references

- **Background: Possibility in Intuitionistic Higher-Order Logic.** Zachary Goodsell (21 August 2026). Possibility in Intuitionistic Higher-Order Logic. Manuscript.
 — §2.2, pp. 5–6; §5.5, p. 37
