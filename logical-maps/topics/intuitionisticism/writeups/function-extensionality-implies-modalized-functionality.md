# Function extensionality ⇒ Modalized functionality

<p class='cert'>Result — Source: Misc.; produced by Codex (GPT-6), connecting proof; recorded by Codex (GPT-6).</p>

## Premises

- **Function extensionality.** For every $\sigma ,\tau : \forall f,g:\sigma \tau . (\forall x:\sigma . f x = g x) \to (f = g)$

## Conclusion

- **Modalized functionality.** For every $\sigma ,\tau : \forall f,g:\sigma \tau . \Box (\forall x:\sigma . f x = g x) \to (f = g)$

## Proof

Fix arbitrary $\sigma ,\tau$ and $f,g:\sigma \to \tau$. Under $\Box \forall x.fx=gx, T$ gives $\forall x.fx=gx$. Use the selected function-extensionality instance at exactly these $\sigma ,\tau$ to get $f=g$. Discharge, generalize f,g, and then observe that $\sigma ,\tau$ were arbitrary. This supplies every target instance.

## Notes

Informal proof; no independent checker or Lean verification. Formula assumptions are not eligible for unrestricted necessitation.

## Sources

- **Codex connecting proofs, 13 Sep 2026** — Codex (GPT-6), connecting proof function-extensionality-implies-modalized-functionality, 2026-09-13.
- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §5.2, Eq. (70), p. 32 (definitions/background).

<p class='cert'>Record: <code>topics/intuitionisticism/results/function-extensionality-implies-modalized-functionality.yaml</code></p>
