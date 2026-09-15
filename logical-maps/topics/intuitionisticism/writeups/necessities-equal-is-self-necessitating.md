# □ = □₂ ⇒ □(□ = □₂)

<p class='cert'>Result — Source: Misc.; produced by Codex (GPT-6), connecting proof; recorded by Codex (GPT-6).</p>

## Premises

- **□ = □₂.** $(\lambda p:t. \Box p) = \Box _{2}$

## Conclusion

- **□(□ = □₂).** $\Box ((\lambda p:t. \Box p) = \Box _{2})$

## Proof

For any same-typed terms a,b, assume $a=b$. Leibniz substitution gives $(a=b)=(b=b)$. Reflexivity is an assumption-free theorem, so standing propositional intensionality gives $(b=b)=\top$. Therefore $(a=b)=\top$, namely $\Box (a=b)$. Instantiate a,b with the two operators in the selected identity. This proof applies at function types as well as at t.

## Notes

Informal proof; no independent checker or Lean verification. Formula assumptions are not eligible for unrestricted necessitation.

## Sources

- **Codex connecting proofs, 13 Sep 2026** — Codex (GPT-6), connecting proof necessities-equal-is-self-necessitating, 2026-09-13.
- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §2.2, pp. 5–6; §3.2, Theorem 1, p. 9 (same substitution method) (definitions/background).

<p class='cert'>Record: <code>topics/intuitionisticism/results/necessities-equal-is-self-necessitating.yaml</code></p>
