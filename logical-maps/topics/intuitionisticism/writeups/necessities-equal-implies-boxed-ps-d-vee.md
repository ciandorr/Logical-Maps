# □ = □₂ ⇒ □PSd ($\Diamond_\vee$)

<p class='cert'>Result — Source: Misc.; produced by Codex (GPT-6), connecting proof; recorded by Codex (GPT-6).</p>

## Premises

- **□ = □₂.** (λp:t. □p) = □₂

## Conclusion

- **□PSd ($\Diamond_\vee$).** □(∀p,q:t. (($\Diamond_\vee$(p) → □q) → □(p → q)))

## Proof

Let E be □=□₂. Suppose $\Diamond_\vee$p→□q. Since ◇₂p→$\Diamond_\vee$p is an II theorem, E gives ◇₂p→□₂q. Paired PSd₂ yields □₂(p→q), and E converts this to □(p→q). Discharge and generalize p,q, retaining only E.

This proves the closed implication E→PSd($\Diamond_\vee$). Identity implies its own □ by substituting equals into the reflexivity theorem, so E→□E. Necessitate the closed implication and apply K to obtain □PSd($\Diamond_\vee$).

## Notes

Informal proof; no independent checker or Lean verification. Formula assumptions are not eligible for unrestricted necessitation.

## Sources

- **Codex connecting proofs, 13 Sep 2026** — Codex (GPT-6), connecting proof necessities-equal-implies-boxed-ps-d-vee, 2026-09-13.
- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §§4.2–4.5, pp. 18–27 (definitions/background).

<p class='cert'>Record: <code>topics/intuitionisticism/results/necessities-equal-implies-boxed-ps-d-vee.yaml</code></p>
