# ⊤ ⇒ Necessitation (□)

<p class='cert'>Result — Source: The Broadest Necessity; produced by Andrew Bacon; intuitionistic proof as presented by Zachary Goodsell; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- $\top$

## Conclusion

- **Necessitation (□).** For every formula A: from $\vdash A$ infer $\vdash \Box A$; the assumption context must be empty.

## Proof

For any formula A with an assumption-free derivation, intuitionistic logic gives an assumption-free derivation of $A \leftrightarrow \top$. Apply standing propositional intensionality to get $A = \top$. This covers every admissible instance and does not permit necessitating a selected formula assumption.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **The Broadest Necessity** — Andrew Bacon (2018), The Broadest Necessity, Journal of Philosophical Logic 47.5, pp. 733–783; attribution in Goodsell, Theorem 1.
- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §3.2, Theorem 1, p. 9.

<p class='cert'>Record: <code>topics/intuitionisticism/results/ii-implies-necessitation.yaml</code></p>

## Paper references

- **Origin: The Broadest Necessity.** Andrew Bacon (2018). The Broadest Necessity. Journal of Philosophical Logic 47.5, pp. 733–783.. Original attribution follows Goodsell; the supplied proof is the intuitionistic presentation in Goodsell.
- **Proof: Possibility in Intuitionistic Higher-Order Logic.** Zachary Goodsell (21 August 2026). Possibility in Intuitionistic Higher-Order Logic. Manuscript.
 — §3.2, Theorem 1, p. 9
