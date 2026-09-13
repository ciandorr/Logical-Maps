# □PSc (≠⊥) ⇒ $\Diamond_\vee$ = ≠⊥

<p class='cert'>Result — Source: Misc.; produced by Codex (GPT-6), connecting proof; recorded by Codex (GPT-6).</p>

## Premises

- **□PSc (≠⊥).** □(∀p, q : t. (((p ∨ q) ≠ ⊥) → ((p ≠ ⊥) ∨ (q ≠ ⊥))))

## Conclusion

- **$\Diamond_\vee$ = ≠⊥.** $\Diamond_\vee$ = (λp:t. p ≠ ⊥)

## Proof

The necessary PSa and PSb conditions for ≠⊥ follow by necessitating their assumption-free II proofs. With the selected □PSc(≠⊥), this makes ≠⊥ a $\mathrm{Possibility}_\vee$ candidate. It follows that p≠⊥→$\Diamond_\vee$p. Conversely, the II bound for every PSb candidate gives $\Diamond_\vee$p→p≠⊥.

The selected premise is boxed and implies its own box. Thus necessitating the discharged argument and using K yields □∀p.($\Diamond_\vee$p↔p≠⊥). Apply the predicate intensionality lemma to obtain the identity of the two operators.

## Notes

Informal proof; no independent checker or Lean verification. Formula assumptions are not eligible for unrestricted necessitation.

## Sources

- **Codex connecting proofs, 13 Sep 2026** — Codex (GPT-6), connecting proof boxed-ps-c-distinct-implies-vee-equals-distinct, 2026-09-13.
- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §§4.2–4.5, pp. 18–27 (definitions/background).

<p class='cert'>Record: <code>topics/intuitionisticism/results/boxed-ps-c-distinct-implies-vee-equals-distinct.yaml</code></p>

## Paper references

- **Background: Possibility in Intuitionistic Higher-Order Logic.** Zachary Goodsell (21 August 2026). Possibility in Intuitionistic Higher-Order Logic. Manuscript.
 — §§4.2–4.5, pp. 18–27
