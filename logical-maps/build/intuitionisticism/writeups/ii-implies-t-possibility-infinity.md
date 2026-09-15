# ⊤ ⇒ T ($\Diamond_\infty$)

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- $\top$

## Conclusion

- **T ($\Diamond_\infty$).** For every p, p implies $\Diamond_\infty$(p).

## Proof

Let $\operatorname{Truth} = \lambda p.p. \operatorname{PSa}$ follows from $\Box (p\to q)\to (p\to q), \operatorname{PSb}$ is $\neg \bot$, and the infinitary clause becomes $\operatorname{Inex}(F)\to (\exists x.Fx\to \exists x.Fx)$. Each necessary candidate condition can be necessitated after its assumption-free derivation, so Truth is a qualified candidate. Given p, choose Truth in the existential definition of $\Diamond_\infty$p. Discharge and generalize p.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.4, Theorem 12, pp. 23–24.

<p class='cert'>Record: <code>topics/intuitionisticism/results/ii-implies-t-possibility-infinity.yaml</code></p>

## Paper references

- **Proof: Possibility in Intuitionistic Higher-Order Logic.** Zachary Goodsell (21 August 2026). Possibility in Intuitionistic Higher-Order Logic. Manuscript.
 — §4.4, Theorem 12, pp. 23–24
