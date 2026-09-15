# ⊤ ⇒ Possibility₂ ⊆ $\mathrm{Possibility}_\vee$

<p class='cert'>Result — Source: Misc.; produced by Codex (GPT-6), connecting proof; recorded by Codex (GPT-6).</p>

## Premises

- $\top$

## Conclusion

- **Possibility₂ ⊆ $\mathrm{Possibility}_\vee$.** $\forall P:tt. \operatorname{Possibility}_{2}(P) \to$ $\mathrm{Possibility}_\vee$(P)

## Proof

Fix P and assume $\operatorname{Possibility}_{2}(P)$. Choose its spouse N, retaining $\Box \operatorname{Normal}(N), \Box \operatorname{PSa}_{2}(N,P), \Box \operatorname{PSd}_{2}(N,P)$, and $\Box (\operatorname{PSb}(P)\land \operatorname{PSc}(P))$. The closed substitution argument $N\top \land \Box r\to Nr$ holds for every r: if $r=\top$, replace equals in $N\top$. By closing and necessitating this argument, $\Box N\top$ gives the necessary version of $\forall r.(\Box r\to Nr)$.

Apply it to $r=(p\to q)$, and combine with the necessary $\operatorname{PSa}_{2}(N,P)$ clause. Necessitated logical implication and K give $\Box \operatorname{PSa}(P)$, now with the fixed necessity $\Box$. The necessary PSb and PSc clauses are already present. Their necessary conjunction is exactly $\mathrm{Possibility}_\vee$(P). Eliminate the spouse witness and discharge the candidate assumption; generalize P. Necessitation was used only on closed logical arguments, with boxed assumptions propagated by K.

## Notes

Informal proof; no independent checker or Lean verification. Formula assumptions are not eligible for unrestricted necessitation.

## Sources

- **Codex connecting proofs, 13 Sep 2026** — Codex (GPT-6), connecting proof ii-implies-paired-candidates-are-vee-candidates, 2026-09-13.
- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §§4.2–4.5, pp. 18–27 (definitions/background).

<p class='cert'>Record: <code>topics/intuitionisticism/results/ii-implies-paired-candidates-are-vee-candidates.yaml</code></p>
