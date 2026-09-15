# ⊤ ⇒ PSa (≠⊥)

<p class='cert'>Result — Source: Misc.; produced by Codex (GPT-6), 13 September 2026; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- $\top$

## Conclusion

- **PSa (≠⊥).** For every p and $q, \Box (p \to q)$ implies that $p \ne \bot$ implies $q \ne \bot$, with $\Box p$ defined as $p = \top$.

## Proof

Given $\Box (p\to q)$ and $p\ne \bot$, suppose $q=\bot$. Substitution turns the boxed implication into $\Box \neg p$, hence $p=\bot$ by footnote 5, a contradiction. Thus $q\ne \bot$. Discharge and generalize p,q.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Codex connecting proof, 13 Sep 2026** — Codex (GPT-6), connecting proof recorded 13 September 2026 in ii-implies-ps-a-distinct-from-bottom.
- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §3.1, definition of $\ne \bot , p. 8$; §3.2, footnote 5, p. 10.

<p class='cert'>Record: <code>topics/intuitionisticism/results/ii-implies-ps-a-distinct-from-bottom.yaml</code></p>
