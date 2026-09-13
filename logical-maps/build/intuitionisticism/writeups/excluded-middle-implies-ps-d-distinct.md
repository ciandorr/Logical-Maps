# LEM ⇒ PSd (≠⊥)

<p class='cert'>Result — Source: Misc.; produced by Codex (GPT-6), 13 September 2026; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- **LEM.** Every proposition is true or has an intuitionistic negation that is true.

## Conclusion

- **PSd (≠⊥).** For every p and q, if p ≠ ⊥ implies □q, then □(p → q), with □p defined as p = ⊤.

## Proof

Fix p,q and assume (p≠⊥)→□q. Instantiate excluded middle at p=⊥. If p=⊥, substitution and the closed identity (⊥→q)=⊤ give □(p→q). Otherwise p≠⊥, so □q; the necessitated intuitionistic theorem q→(p→q), with K, gives □(p→q). Discharge and generalize p,q. Only the closed intuitionistic theorem is necessitated, never excluded middle.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Codex connecting proof, 13 Sep 2026** — Codex (GPT-6), connecting proof recorded 13 September 2026 in excluded-middle-implies-ps-d-distinct.
- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §6.2, Eqs. (82)–(83), p. 43.

<p class='cert'>Record: <code>topics/intuitionisticism/results/excluded-middle-implies-ps-d-distinct.yaml</code></p>

## Paper references

- **Background: Possibility in Intuitionistic Higher-Order Logic.** Zachary Goodsell (21 August 2026). Possibility in Intuitionistic Higher-Order Logic. Manuscript.
 — §6.2, Eqs. (82)–(83), p. 43
