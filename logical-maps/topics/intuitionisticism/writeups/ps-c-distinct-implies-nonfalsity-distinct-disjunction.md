# PSc (≠⊥) ⇒ Nonfalsity gives distinct disjunct

<p class='cert'>Result — Source: Misc.; produced by Codex (GPT-6), connecting proof; recorded by Codex (GPT-6).</p>

## Premises

- **PSc (≠⊥).** For every p and q, (p ∨ q) ≠ ⊥ implies p ≠ ⊥ or q ≠ ⊥.

## Conclusion

- **Nonfalsity gives distinct disjunct.** ∀p,q:t. ¬¬(p ∨ q) → ((p ≠ ⊥) ∨ (q ≠ ⊥))

## Proof

If ¬¬(p∨q), then (p∨q)≠⊥: an identity with ⊥ would give ¬(p∨q), contradicting its double negation. Instantiate PSc for ≠⊥ at p,q to obtain p≠⊥∨q≠⊥. Discharge and generalize p,q.

## Notes

Informal proof; no independent checker or Lean verification. Formula assumptions are not eligible for unrestricted necessitation.

## Sources

- **Codex connecting proofs, 13 Sep 2026** — Codex (GPT-6), connecting proof ps-c-distinct-implies-nonfalsity-distinct-disjunction, 2026-09-13.
- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §3.2, Eqs. (13)–(16), p. 10; §5.5, Eq. (77), p. 37 (definitions/background).

<p class='cert'>Record: <code>topics/intuitionisticism/results/ps-c-distinct-implies-nonfalsity-distinct-disjunction.yaml</code></p>
