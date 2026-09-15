# □ = □₂ ⇒ □□₂ entails □

<p class='cert'>Result — Source: Misc.; produced by Codex (GPT-6), connecting proof; recorded by Codex (GPT-6).</p>

## Premises

- **□ = □₂.** $(\lambda p:t. \Box p) = \Box _{2}$

## Conclusion

- **□□₂ entails □.** $\Box (\forall p:t. \Box _{2}p \to \Box p)$

## Proof

The reflexive sentence $\forall p.(\Box _{2}p\to \Box _{2}p)$ is an assumption-free theorem and may be necessitated. Substitute the selected operator identity into the appropriate occurrences inside that boxed sentence, using Leibniz’s Law. This yields the entire boxed pointwise implication in the conclusion.

## Notes

Informal proof; no independent checker or Lean verification. Formula assumptions are not eligible for unrestricted necessitation.

## Sources

- **Codex connecting proofs, 13 Sep 2026** — Codex (GPT-6), connecting proof necessities-equal-implies-boxed-pointwise, 2026-09-13.
- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §§4.2–4.5, pp. 18–27 (definitions/background).

<p class='cert'>Record: <code>topics/intuitionisticism/results/necessities-equal-implies-boxed-pointwise.yaml</code></p>
