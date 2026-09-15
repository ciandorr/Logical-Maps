# □Spouse uniqueness for □ ⇒ Spouse uniqueness for □

<p class='cert'>Result — Source: Misc.; produced by Codex (GPT-6), connecting proof; recorded by Codex (GPT-6).</p>

## Premises

- **□Spouse uniqueness for □.** $\Box (\forall P,Q:tt. (\operatorname{Possibility}_{2}(P) \land \operatorname{Possibility}_{2}(Q) \land \operatorname{Married}((\lambda p:t. \Box p), P) \land \operatorname{Married}((\lambda p:t. \Box p), Q)) \to (P = Q))$

## Conclusion

- **Spouse uniqueness for □.** $\forall P,Q:tt. (\operatorname{Possibility}_{2}(P) \land \operatorname{Possibility}_{2}(Q) \land \operatorname{Married}((\lambda p:t. \Box p), P) \land \operatorname{Married}((\lambda p:t. \Box p), Q)) \to (P = Q)$

## Proof

Apply the standing theorem $\Box A\to A$ to the entire displayed sentence, with all of its quantifiers inside A.

## Notes

Informal proof; no independent checker or Lean verification. Formula assumptions are not eligible for unrestricted necessitation.

## Sources

- **Codex connecting proofs, 13 Sep 2026** — Codex (GPT-6), connecting proof unbox-necessity-spouse-uniqueness, 2026-09-13.
- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §3.2, Theorem 1, p. 9 (definitions/background).

<p class='cert'>Record: <code>topics/intuitionisticism/results/unbox-necessity-spouse-uniqueness.yaml</code></p>
