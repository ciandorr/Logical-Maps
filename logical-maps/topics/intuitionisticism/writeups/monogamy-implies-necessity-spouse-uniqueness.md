# Marriage is monogamous ⇒ Spouse uniqueness for □

<p class='cert'>Result — Source: Misc.; produced by Codex (GPT-6), 13 September 2026; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- **Marriage is monogamous.** $\forall N,P,Q:tt. (\operatorname{Necessity}_{2}(N) \land \operatorname{Possibility}_{2}(P) \land \operatorname{Possibility}_{2}(Q) \land \operatorname{Married}(N,P) \land \operatorname{Married}(N,Q)) \to (P = Q)$

## Conclusion

- **Spouse uniqueness for □.** $\forall P,Q:tt. (\operatorname{Possibility}_{2}(P) \land \operatorname{Possibility}_{2}(Q) \land \operatorname{Married}((\lambda p:t. \Box p), P) \land \operatorname{Married}((\lambda p:t. \Box p), Q)) \to (P = Q)$

## Proof

Given two qualified spouses P,Q of $\Box$, the standing normality theorems for $\Box$ give $\Box \operatorname{Normal}(\Box ). \operatorname{Possibility}_{2}(P)$ supplies the necessary PSb/PSc clauses for P, so P together with $\operatorname{Married}(\Box ,P)$ witnesses $\operatorname{Necessity}_{2}(\Box )$. Instantiate the selected monogamy sentence with $N=\Box , P$ and Q to get $P=Q$; discharge and generalize.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Codex connecting proof, 13 Sep 2026** — Codex (GPT-6), connecting proof recorded 13 September 2026 in monogamy-implies-necessity-spouse-uniqueness.
- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §7.1, Question 3, p. 46.

<p class='cert'>Record: <code>topics/intuitionisticism/results/monogamy-implies-necessity-spouse-uniqueness.yaml</code></p>
