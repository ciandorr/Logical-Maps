# ⊤ ⇒ $\mathrm{Possibility}_\vee$ composition closure

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- ⊤

## Conclusion

- **$\mathrm{Possibility}_\vee$ composition closure.** ∀P,Q:tt. ($\mathrm{Possibility}_\vee$(P) ∧ $\mathrm{Possibility}_\vee$(Q)) → $\mathrm{Possibility}_\vee$(P ∘ Q)

## Proof

Assume $\mathrm{Possibility}_\vee$(P) and $\mathrm{Possibility}_\vee$(Q). Both premises are identities with ⊤, so they imply their own □-necessitations by 4. This permits modal reasoning with these necessary conditions; it does not permit unrestricted necessitation under assumptions.

For PSa, □(p→q) and the necessary PSa condition for Q give □(Qp→Qq), by the necessitated universal-instantiation theorem and K. PSa(P) then takes P(Qp) to P(Qq). For PSb, □¬Q⊥ gives Q⊥=⊥, using □¬r↔r=⊥; substituting this into □¬P⊥ yields the required necessary bottom clause. For PSc, the necessary disjunction clause for Q gives □(Q(p∨q)→(Qp∨Qq)); use PSa(P) and then PSc(P). These same derivations can be performed inside □, since the candidate premises imply their own □ forms. The closed logical deductions and K therefore give the necessary conjunction of PSa, PSb and PSc for P∘Q. Discharge the two candidate assumptions and generalize P,Q.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.2, Theorem 9, Eq. (35), pp. 19–20.

<p class='cert'>Record: <code>topics/intuitionisticism/results/ii-implies-vee-composition-closure.yaml</code></p>
