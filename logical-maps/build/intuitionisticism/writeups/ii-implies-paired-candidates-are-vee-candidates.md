# ⊤ ⇒ Possibility₂ ⊆ $\mathrm{Possibility}_\vee$

<p class='cert'>Result — Source: Misc.; produced by Codex (GPT-6), connecting proof; recorded by Codex (GPT-6).</p>

## Premises

- ⊤

## Conclusion

- **Possibility₂ ⊆ $\mathrm{Possibility}_\vee$.** ∀P:tt. Possibility₂(P) → $\mathrm{Possibility}_\vee$(P)

## Proof

Fix P and assume Possibility₂(P). Choose its spouse N, retaining □Normal(N), □PSa₂(N,P), □PSd₂(N,P), and □(PSb(P)∧PSc(P)). The closed substitution argument N⊤∧□r→Nr holds for every r: if r=⊤, replace equals in N⊤. By closing and necessitating this argument, □N⊤ gives the necessary version of ∀r.(□r→Nr).

Apply it to r=(p→q), and combine with the necessary PSa₂(N,P) clause. Necessitated logical implication and K give □PSa(P), now with the fixed necessity □. The necessary PSb and PSc clauses are already present. Their necessary conjunction is exactly $\mathrm{Possibility}_\vee$(P). Eliminate the spouse witness and discharge the candidate assumption; generalize P. Necessitation was used only on closed logical arguments, with boxed assumptions propagated by K.

## Notes

Informal proof; no independent checker or Lean verification. Formula assumptions are not eligible for unrestricted necessitation.

## Sources

- **Codex connecting proofs, 13 Sep 2026** — Codex (GPT-6), connecting proof ii-implies-paired-candidates-are-vee-candidates, 2026-09-13.
- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §§4.2–4.5, pp. 18–27 (definitions/background).

<p class='cert'>Record: <code>topics/intuitionisticism/results/ii-implies-paired-candidates-are-vee-candidates.yaml</code></p>

## Paper references

- **Background: Possibility in Intuitionistic Higher-Order Logic.** Zachary Goodsell (21 August 2026). Possibility in Intuitionistic Higher-Order Logic. Manuscript.
 — §§4.2–4.5, pp. 18–27
