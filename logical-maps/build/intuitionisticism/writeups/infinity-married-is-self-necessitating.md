# Spouse ($\Diamond_\infty$) ⇒ □Spouse ($\Diamond_\infty$)

<p class='cert'>Result — Source: Misc.; produced by Codex (GPT-6), connecting proof; recorded by Codex (GPT-6).</p>

## Premises

- **Spouse ($\Diamond_\infty$).** ∃N:tt. Necessity₂(N) ∧ Married(N, $\Diamond_\infty$)

## Conclusion

- **□Spouse ($\Diamond_\infty$).** □(∃N:tt. Necessity₂(N) ∧ Married(N, $\Diamond_\infty$))

## Proof

For use below, the spouse sentence is self-necessitating. Each necessary candidate or marriage clause is a boxed sentence, hence implies its own box by 4. A conjunction of such clauses has the same property. Also, if B(x)→□B(x) is a closed theorem, then ∃x.B(x)→□∃x.B(x): choose the same witness x, obtain □B(x), and apply K to the necessitated existential-introduction theorem B(x)→∃y.B(y). This is the valid direction using an existing witness, not a converse Barcan assumption. Expanding Necessity₂(N) shows it is a conjunction and existential combination of boxed clauses. Therefore ∃N.(Necessity₂(N)∧Married(N,P)) implies its own □, for each fixed P.

## Notes

Informal proof; no independent checker or Lean verification. Formula assumptions are not eligible for unrestricted necessitation.

## Sources

- **Codex connecting proofs, 13 Sep 2026** — Codex (GPT-6), connecting proof infinity-married-is-self-necessitating, 2026-09-13.
- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §§4.2–4.5, pp. 18–27 (definitions/background).

<p class='cert'>Record: <code>topics/intuitionisticism/results/infinity-married-is-self-necessitating.yaml</code></p>

## Paper references

- **Background: Possibility in Intuitionistic Higher-Order Logic.** Zachary Goodsell (21 August 2026). Possibility in Intuitionistic Higher-Order Logic. Manuscript.
 — §§4.2–4.5, pp. 18–27
