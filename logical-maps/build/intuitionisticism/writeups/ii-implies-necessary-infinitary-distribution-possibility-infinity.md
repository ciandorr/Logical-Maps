# ⊤ ⇒ □Infinitary distribution ($\Diamond_\infty$)

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- $\top$

## Conclusion

- **□Infinitary distribution ($\Diamond_\infty$).** $\Box (\forall F:tt. \operatorname{Inex}^t(F) \to$ ($\Diamond_\infty$$(\exists x:t. F x) \to \exists x:t$. $\Diamond_\infty$(F x)))

## Proof

Fix $F:t\to t$ and assume $\operatorname{Inex}(F)$ and $\Diamond_\infty$$(\exists x.Fx)$. Choose a witness P with $\mathrm{Possibility}_\infty$(P) and $P(\exists x.Fx)$. Its $\mathrm{PSc}^{t}_{\infty}$ condition yields $\exists x.P(Fx)$. Each such x, with the same candidate P, witnesses $\Diamond_\infty$(Fx), so $\exists x$.$\Diamond_\infty$(Fx). Discharge the assumptions and quantify F. This is an assumption-free theorem, so necessitate the whole sentence.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.4, Theorem 12, pp. 23–24.

<p class='cert'>Record: <code>topics/intuitionisticism/results/ii-implies-necessary-infinitary-distribution-possibility-infinity.yaml</code></p>

## Paper references

- **Proof: Possibility in Intuitionistic Higher-Order Logic.** Zachary Goodsell (21 August 2026). Possibility in Intuitionistic Higher-Order Logic. Manuscript.
 — §4.4, Theorem 12, pp. 23–24
