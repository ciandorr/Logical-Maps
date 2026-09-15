# LEM ⇒ PSd (≠⊥)

<p class='cert'>Result — Source: Misc.; produced by Codex (GPT-6), 13 September 2026; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- **LEM.** Every proposition is true or has an intuitionistic negation that is true.

## Conclusion

- **PSd (≠⊥).** For every p and q, if $p \ne \bot$ implies $\Box q$, then $\Box (p \to q)$, with $\Box p$ defined as $p = \top$.

## Proof

Fix p,q and assume $(p\ne \bot )\to \Box q$. Instantiate excluded middle at $p=\bot$. If $p=\bot$, substitution and the closed identity $(\bot \to q)=\top$ give $\Box (p\to q)$. Otherwise $p\ne \bot$, so $\Box q$; the necessitated intuitionistic theorem $q\to (p\to q)$, with K, gives $\Box (p\to q)$. Discharge and generalize p,q. Only the closed intuitionistic theorem is necessitated, never excluded middle.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Codex connecting proof, 13 Sep 2026** — Codex (GPT-6), connecting proof recorded 13 September 2026 in excluded-middle-implies-ps-d-distinct.
- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §6.2, Eqs. (82)–(83), p. 43.

<p class='cert'>Record: <code>topics/intuitionisticism/results/excluded-middle-implies-ps-d-distinct.yaml</code></p>

## Paper references

- **Background: Possibility in Intuitionistic Higher-Order Logic.** Zachary Goodsell (21 August 2026). Possibility in Intuitionistic Higher-Order Logic. Manuscript.
 — §6.2, Eqs. (82)–(83), p. 43
