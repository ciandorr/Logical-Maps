# □PSa (≠⊥) ⇒ PSa (≠⊥)

<p class='cert'>Result — Source: Misc.; produced by Codex (GPT-6), connecting proof; recorded by Codex (GPT-6).</p>

## Premises

- **□PSa (≠⊥).** $\Box (\forall p, q : t. (\Box (p \to q) \to ((p \ne \bot ) \to (q \ne \bot ))))$

## Conclusion

- **PSa (≠⊥).** For every p and $q, \Box (p \to q)$ implies that $p \ne \bot$ implies $q \ne \bot$, with $\Box p$ defined as $p = \top$.

## Proof

Apply the standing theorem $\Box A\to A$ to the entire displayed sentence, with all of its quantifiers inside A.

## Notes

Informal proof; no independent checker or Lean verification. Formula assumptions are not eligible for unrestricted necessitation.

## Sources

- **Codex connecting proofs, 13 Sep 2026** — Codex (GPT-6), connecting proof unbox-ps-a-distinct-from-bottom, 2026-09-13.
- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §3.2, Theorem 1, p. 9 (definitions/background).

<p class='cert'>Record: <code>topics/intuitionisticism/results/unbox-ps-a-distinct-from-bottom.yaml</code></p>
