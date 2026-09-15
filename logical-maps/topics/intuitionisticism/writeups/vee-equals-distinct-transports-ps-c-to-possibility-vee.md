# $\Diamond_\vee$ = ≠⊥ ∧ PSc (≠⊥) ⇒ PSc ($\Diamond_\vee$)

<p class='cert'>Result — Source: Misc.; produced by Codex (GPT-6), 13 September 2026; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- **$\Diamond_\vee$ = ≠⊥.** $\Diamond_\vee$ $= (\lambda p:t. p \ne \bot )$
- **PSc (≠⊥).** For every p and $q, (p \lor q) \ne \bot$ implies $p \ne \bot$ or $q \ne \bot$.

## Conclusion

- **PSc ($\Diamond_\vee$).** For every p and q, $\Diamond_\vee$$(p \lor q)$ implies $\Diamond_\vee$$(p) \lor$ $\Diamond_\vee$(q).

## Proof

Use the selected identity of the two defined operators in Leibniz’s Law with the whole quantified PS condition as the predicate of that operator. This directly replaces the operator under every connective and quantifier, leaving $\Box =(=\top )$ unchanged.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Codex connecting proof, 13 Sep 2026** — Codex (GPT-6), connecting proof recorded 13 September 2026 in vee-equals-distinct-transports-ps-c-to-possibility-vee.
- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.4, p. 24; §4.5, pp. 26–27; §5.4, p. 34.

<p class='cert'>Record: <code>topics/intuitionisticism/results/vee-equals-distinct-transports-ps-c-to-possibility-vee.yaml</code></p>
