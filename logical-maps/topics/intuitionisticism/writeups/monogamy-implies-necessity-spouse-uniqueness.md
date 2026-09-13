# Marriage is monogamous ⇒ Spouse uniqueness for □

<p class='cert'>Result — Source: Misc.; produced by Codex (GPT-6), 13 September 2026; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- **Marriage is monogamous.** ∀N,P,Q:tt. (Necessity₂(N) ∧ Possibility₂(P) ∧ Possibility₂(Q) ∧ Married(N,P) ∧ Married(N,Q)) → (P = Q)

## Conclusion

- **Spouse uniqueness for □.** ∀P,Q:tt. (Possibility₂(P) ∧ Possibility₂(Q) ∧ Married((λp:t. □p), P) ∧ Married((λp:t. □p), Q)) → (P = Q)

## Proof

Given two qualified spouses P,Q of □, the standing normality theorems for □ give □Normal(□). Possibility₂(P) supplies the necessary PSb/PSc clauses for P, so P together with Married(□,P) witnesses Necessity₂(□). Instantiate the selected monogamy sentence with N=□, P and Q to get P=Q; discharge and generalize.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Codex connecting proof, 13 Sep 2026** — Codex (GPT-6), connecting proof recorded 13 September 2026 in monogamy-implies-necessity-spouse-uniqueness.
- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §7.1, Question 3, p. 46.

<p class='cert'>Record: <code>topics/intuitionisticism/results/monogamy-implies-necessity-spouse-uniqueness.yaml</code></p>
