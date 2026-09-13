# Propositional intensionalism (□₂) ⇒ □₂ entails □

<p class='cert'>Result — Source: Misc.; produced by Codex (GPT-6), connecting proof; recorded by Codex (GPT-6).</p>

## Premises

- **Propositional intensionalism (□₂).** ∀p,q:t. □₂(p ↔ q) → (p = q)

## Conclusion

- **□₂ entails □.** ∀p:t. □₂p → □p

## Proof

Fix p and assume □₂p. Necessitate the closed intuitionistic theorem p→(p↔⊤) using the proved empty-context □₂ rule, and use K for □₂ to obtain □₂(p↔⊤). Instantiate the selected □₂-intensionalism sentence at p,⊤ to infer p=⊤, namely □p. Discharge and generalize p.

## Notes

Informal proof; no independent checker or Lean verification. Formula assumptions are not eligible for unrestricted necessitation.

## Sources

- **Codex connecting proofs, 13 Sep 2026** — Codex (GPT-6), connecting proof two-intensionalism-implies-reverse-necessity, 2026-09-13.
- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §§4.2–4.5, pp. 18–27 (definitions/background).

<p class='cert'>Record: <code>topics/intuitionisticism/results/two-intensionalism-implies-reverse-necessity.yaml</code></p>

## Paper references

- **Background: Possibility in Intuitionistic Higher-Order Logic.** Zachary Goodsell (21 August 2026). Possibility in Intuitionistic Higher-Order Logic. Manuscript.
 — §§4.2–4.5, pp. 18–27
