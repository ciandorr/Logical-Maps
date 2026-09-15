# Propositional extensionality ⇒ Universal self-necessitation

<p class='cert'>Result — Source: Misc.; produced by Codex (GPT-6), connecting proof; recorded by Codex (GPT-6).</p>

## Premises

- **Propositional extensionality.** $\forall p,q:t. (p \leftrightarrow q) \to (p = q)$

## Conclusion

- **Universal self-necessitation.** $\forall p:t. p \to \Box p$

## Proof

Assume p. Then $p\leftrightarrow \top$. Instantiate the selected extensionality sentence at $p,\top$ to obtain $p=\top$, hence $\Box p$. Discharge and generalize p.

## Notes

Informal proof; no independent checker or Lean verification. Formula assumptions are not eligible for unrestricted necessitation.

## Sources

- **Codex connecting proofs, 13 Sep 2026** — Codex (GPT-6), connecting proof propositional-extensionality-implies-self-necessitation, 2026-09-13.
- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §2.1, p. 5; §5.5, p. 37 (definitions/background).

<p class='cert'>Record: <code>topics/intuitionisticism/results/propositional-extensionality-implies-self-necessitation.yaml</code></p>
