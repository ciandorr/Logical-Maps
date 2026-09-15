# ⊤ ⇒ 4 (□)

<p class='cert'>Result — Source: The Broadest Necessity; produced by Andrew Bacon; intuitionistic proof as presented by Zachary Goodsell; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- $\top$

## Conclusion

- **4 (□).** $\forall p:t. \Box p \to \Box \Box p$

## Proof

If $p = \top$, Leibniz substitution gives $(p = \top ) = (\top = \top )$. The reflexivity theorem $\top = \top$ is identical to $\top$ by assumption-free propositional intensionality. Transitivity gives $(p = \top ) = \top$. Discharge and generalize.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **The Broadest Necessity** — Andrew Bacon (2018), The Broadest Necessity, Journal of Philosophical Logic 47.5, pp. 733–783; attribution in Goodsell, Theorem 1.
- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §3.2, Theorem 1, p. 9.

<p class='cert'>Record: <code>topics/intuitionisticism/results/ii-implies-four-necessity.yaml</code></p>

## Paper references

- **Origin: The Broadest Necessity.** Andrew Bacon (2018). The Broadest Necessity. Journal of Philosophical Logic 47.5, pp. 733–783.. Original attribution follows Goodsell; the supplied proof is the intuitionistic presentation in Goodsell.
- **Proof: Possibility in Intuitionistic Higher-Order Logic.** Zachary Goodsell (21 August 2026). Possibility in Intuitionistic Higher-Order Logic. Manuscript.
 — §3.2, Theorem 1, p. 9
