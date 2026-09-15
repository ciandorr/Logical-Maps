# ⊤ ⇒ $\mathrm{Possibility}_\vee$ disjunction closure

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- $\top$

## Conclusion

- **$\mathrm{Possibility}_\vee$ disjunction closure.** $\forall P,Q:tt$. ($\mathrm{Possibility}_\vee$$(P) \land$ $\mathrm{Possibility}_\vee$$(Q)) \to$ $\mathrm{Possibility}_\vee$$(\lambda p:t. P p \lor Q p)$

## Proof

Assume the two candidate predicates, which are themselves $\Box$-stable identities with $\top$. For $R = \lambda p.(Pp\lor Qp), \operatorname{PSa}$ follows by cases from the PSa clauses of P and Q. Neither disjunct of $R\bot$ can hold by their PSb clauses. For PSc, split $P(p\lor q)\lor Q(p\lor q)$, apply the respective PSc clause, and inject into $Rp\lor Rq$. The same finite deduction is available necessarily: the candidate conditions are necessary, and necessitated logical theorems plus K transport the deduction under $\Box$. Thus the conjunction defining $\mathrm{Possibility}_\vee$(R) is identical to $\top$. Discharge and generalize P,Q.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.2, Theorem 9, Eq. (36), pp. 19–20.

<p class='cert'>Record: <code>topics/intuitionisticism/results/ii-implies-vee-disjunction-closure.yaml</code></p>
