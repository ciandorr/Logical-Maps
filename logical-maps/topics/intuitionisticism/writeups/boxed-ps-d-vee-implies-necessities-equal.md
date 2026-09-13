# □PSd ($\Diamond_\vee$) ⇒ □ = □₂

<p class='cert'>Result — Source: Misc.; produced by Codex (GPT-6), connecting proof; recorded by Codex (GPT-6).</p>

## Premises

- **□PSd ($\Diamond_\vee$).** □(∀p,q:t. (($\Diamond_\vee$(p) → □q) → □(p → q)))

## Conclusion

- **□ = □₂.** (λp:t. □p) = □₂

## Proof

Let A be □PSd($\Diamond_\vee$). The standing necessary PSa, PSb and PSc clauses for $\Diamond_\vee$, and the standing necessary normality of □, show that □ and $\Diamond_\vee$ form a qualified married pair. Thus Necessity₂(□). Instantiating the definition of □₂p with this candidate yields □₂p→□p for every p. The reverse comparison is an II theorem.

After discharging A, the pointwise argument is a closed theorem A→∀p.(□₂p↔□p). Since A is boxed, 4 gives A→□A. Necessitate the closed conditional and apply K to obtain □∀p.(□₂p↔□p). Apply the proved predicate intensionality lemma to identify □₂ and □.

## Notes

Informal proof; no independent checker or Lean verification. Formula assumptions are not eligible for unrestricted necessitation.

## Sources

- **Codex connecting proofs, 13 Sep 2026** — Codex (GPT-6), connecting proof boxed-ps-d-vee-implies-necessities-equal, 2026-09-13.
- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §§4.2–4.5, pp. 18–27 (definitions/background).

<p class='cert'>Record: <code>topics/intuitionisticism/results/boxed-ps-d-vee-implies-necessities-equal.yaml</code></p>
