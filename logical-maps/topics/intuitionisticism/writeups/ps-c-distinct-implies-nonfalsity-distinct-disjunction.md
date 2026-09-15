# PSc (≠⊥) ⇒ Nonfalsity gives distinct disjunct

<p class='cert'>Result — Source: Misc.; produced by Codex (GPT-6), connecting proof; recorded by Codex (GPT-6).</p>

## Premises

- **PSc (≠⊥).** For every p and $q, (p \lor q) \ne \bot$ implies $p \ne \bot$ or $q \ne \bot$.

## Conclusion

- **Nonfalsity gives distinct disjunct.** $\forall p,q:t. \neg \neg (p \lor q) \to ((p \ne \bot ) \lor (q \ne \bot ))$

## Proof

If $\neg \neg (p\lor q)$, then $(p\lor q)\ne \bot$: an identity with $\bot$ would give $\neg (p\lor q)$, contradicting its double negation. Instantiate PSc for $\ne \bot$ at p,q to obtain $p\ne \bot \lor q\ne \bot$. Discharge and generalize p,q.

## Notes

Informal proof; no independent checker or Lean verification. Formula assumptions are not eligible for unrestricted necessitation.

## Sources

- **Codex connecting proofs, 13 Sep 2026** — Codex (GPT-6), connecting proof ps-c-distinct-implies-nonfalsity-distinct-disjunction, 2026-09-13.
- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §3.2, Eqs. (13)–(16), p. 10; §5.5, Eq. (77), p. 37 (definitions/background).

<p class='cert'>Record: <code>topics/intuitionisticism/results/ps-c-distinct-implies-nonfalsity-distinct-disjunction.yaml</code></p>
