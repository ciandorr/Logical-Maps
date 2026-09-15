# ⊤ ⇒ $\Diamond_\vee$ entails ≠⊥

<p class='cert'>Result — Source: Misc.; produced by Codex (GPT-6), connecting proof; recorded by Codex (GPT-6).</p>

## Premises

- $\top$

## Conclusion

- **$\Diamond_\vee$ entails ≠⊥.** $\forall p:t$. $\Diamond_\vee$$p \to (p \ne \bot )$

## Proof

Given $\Diamond_\vee$p, choose its candidate witness P with $\mathrm{Possibility}_\vee$(P) and Pp. The candidate predicate implies $\operatorname{PSb}(P)$, namely $\neg P\bot$. If $p=\bot$, substitution in Pp gives $P\bot , a$ contradiction. Thus $p\ne \bot$. Discharge and generalize p. This bound only needs PSb and does not assume the disputed infinitary-to-binary reduction.

## Notes

Informal proof; no independent checker or Lean verification. Formula assumptions are not eligible for unrestricted necessitation.

## Sources

- **Codex connecting proofs, 13 Sep 2026** — Codex (GPT-6), connecting proof ii-implies-vee-entails-distinct, 2026-09-13.
- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §§4.2–4.5, pp. 18–27 (definitions/background).

<p class='cert'>Record: <code>topics/intuitionisticism/results/ii-implies-vee-entails-distinct.yaml</code></p>
