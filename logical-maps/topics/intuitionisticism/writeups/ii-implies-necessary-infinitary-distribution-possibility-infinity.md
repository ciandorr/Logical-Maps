# ⊤ ⇒ □Infinitary distribution ($\Diamond_\infty$)

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- ⊤

## Conclusion

- **□Infinitary distribution ($\Diamond_\infty$).** □(∀F:tt. Inex^t(F) → ($\Diamond_\infty$(∃x:t. F x) → ∃x:t. $\Diamond_\infty$(F x)))

## Proof

Fix F:t→t and assume Inex(F) and $\Diamond_\infty$(∃x.Fx). Choose a witness P with $\mathrm{Possibility}_\infty$(P) and P(∃x.Fx). Its $\mathrm{PSc}^{t}_{\infty}$ condition yields ∃x.P(Fx). Each such x, with the same candidate P, witnesses $\Diamond_\infty$(Fx), so ∃x.$\Diamond_\infty$(Fx). Discharge the assumptions and quantify F. This is an assumption-free theorem, so necessitate the whole sentence.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.4, Theorem 12, pp. 23–24.

<p class='cert'>Record: <code>topics/intuitionisticism/results/ii-implies-necessary-infinitary-distribution-possibility-infinity.yaml</code></p>
