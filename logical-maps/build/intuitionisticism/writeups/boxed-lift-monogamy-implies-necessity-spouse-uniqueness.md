# □Marriage is monogamous ⇒ □Spouse uniqueness for □

<p class='cert'>Result — Source: Misc.; produced by Codex (GPT-6), connecting proof; recorded by Codex (GPT-6).</p>

## Premises

- **□Marriage is monogamous.** $\Box (\forall N,P,Q:tt. (\operatorname{Necessity}_{2}(N) \land \operatorname{Possibility}_{2}(P) \land \operatorname{Possibility}_{2}(Q) \land \operatorname{Married}(N,P) \land \operatorname{Married}(N,Q)) \to (P = Q))$

## Conclusion

- **□Spouse uniqueness for □.** $\Box (\forall P,Q:tt. (\operatorname{Possibility}_{2}(P) \land \operatorname{Possibility}_{2}(Q) \land \operatorname{Married}((\lambda p:t. \Box p), P) \land \operatorname{Married}((\lambda p:t. \Box p), Q)) \to (P = Q))$

## Proof

The recorded proof monogamy-implies-necessity-spouse-uniqueness is an assumption-free II proof of its conclusion after all its displayed formula premises are discharged as a curried implication. Necessitate that closed implication. Starting from the boxed versions of exactly those premises, apply K once per premise to obtain the box of the entire conclusion. All object-language quantifiers stay inside their original boxes; no unboxed assumption is necessitated.

## Notes

Modal lifting of the separately recorded proof monogamy-implies-necessity-spouse-uniqueness. Original mathematical credit remains in that record; this edge credits only the connecting lift. No independent checker or Lean verification.

## Sources

- **Codex connecting proofs, 13 Sep 2026** — Codex (GPT-6), connecting proof boxed-lift-monogamy-implies-necessity-spouse-uniqueness, 2026-09-13.
- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §§4.2–4.5, pp. 18–27 (definitions/background).

<p class='cert'>Record: <code>topics/intuitionisticism/results/boxed-lift-monogamy-implies-necessity-spouse-uniqueness.yaml</code></p>

## Paper references

- **Background: Possibility in Intuitionistic Higher-Order Logic.** Zachary Goodsell (21 August 2026). Possibility in Intuitionistic Higher-Order Logic. Manuscript.
 — §§4.2–4.5, pp. 18–27
