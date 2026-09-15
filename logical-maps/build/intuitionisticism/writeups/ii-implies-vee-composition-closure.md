# ⊤ ⇒ $\mathrm{Possibility}_\vee$ composition closure

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- $\top$

## Conclusion

- **$\mathrm{Possibility}_\vee$ composition closure.** $\forall P,Q:tt$. ($\mathrm{Possibility}_\vee$$(P) \land$ $\mathrm{Possibility}_\vee$$(Q)) \to$ $\mathrm{Possibility}_\vee$$(P \circ Q)$

## Proof

Assume $\mathrm{Possibility}_\vee$(P) and $\mathrm{Possibility}_\vee$(Q). Both premises are identities with $\top$, so they imply their own $\Box$-necessitations by 4. This permits modal reasoning with these necessary conditions; it does not permit unrestricted necessitation under assumptions.

For $\operatorname{PSa}, \Box (p\to q)$ and the necessary PSa condition for Q give $\Box (Qp\to Qq)$, by the necessitated universal-instantiation theorem and $K. \operatorname{PSa}(P)$ then takes $P(Qp)$ to $P(Qq)$. For $\operatorname{PSb}, \Box \neg Q\bot$ gives $Q\bot =\bot$, using $\Box \neg r\leftrightarrow r=\bot$; substituting this into $\Box \neg P\bot$ yields the required necessary bottom clause. For PSc, the necessary disjunction clause for Q gives $\Box (Q(p\lor q)\to (Qp\lor Qq))$; use $\operatorname{PSa}(P)$ and then $\operatorname{PSc}(P)$. These same derivations can be performed inside $\Box$, since the candidate premises imply their own $\Box$ forms. The closed logical deductions and K therefore give the necessary conjunction of PSa, PSb and PSc for $P\circ Q$. Discharge the two candidate assumptions and generalize P,Q.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.2, Theorem 9, Eq. (35), pp. 19–20.

<p class='cert'>Record: <code>topics/intuitionisticism/results/ii-implies-vee-composition-closure.yaml</code></p>

## Paper references

- **Proof: Possibility in Intuitionistic Higher-Order Logic.** Zachary Goodsell (21 August 2026). Possibility in Intuitionistic Higher-Order Logic. Manuscript.
 — §4.2, Theorem 9, Eq. (35), pp. 19–20
