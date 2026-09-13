# ⊤ ⇒ K (□)

<p class='cert'>Result — Source: The Broadest Necessity; produced by Andrew Bacon; intuitionistic proof as presented by Zachary Goodsell; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- ⊤

## Conclusion

- **K (□).** ∀p,q:t. □(p → q) → (□p → □q)

## Proof

Intensionality applied to an assumption-free intuitionistic equivalence gives p ∧ q = p ∧ (p → q). Assume □(p → q) and □p. Substitution turns the right side into ⊤ ∧ ⊤ and the left side into ⊤ ∧ q. The assumption-free identities ⊤ ∧ ⊤ = ⊤ and ⊤ ∧ q = q now give q = ⊤. Discharge both assumptions and universally generalize p,q.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **The Broadest Necessity** — Andrew Bacon (2018), The Broadest Necessity, Journal of Philosophical Logic 47.5, pp. 733–783; attribution in Goodsell, Theorem 1.
- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §3.2, Theorem 1, p. 9.

<p class='cert'>Record: <code>topics/intuitionisticism/results/ii-implies-k-necessity.yaml</code></p>
