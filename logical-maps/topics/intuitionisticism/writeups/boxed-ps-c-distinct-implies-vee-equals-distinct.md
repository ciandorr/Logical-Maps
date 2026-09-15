# □PSc (≠⊥) ⇒ $\Diamond_\vee$ = ≠⊥

<p class='cert'>Result — Source: Misc.; produced by Codex (GPT-6), connecting proof; recorded by Codex (GPT-6).</p>

## Premises

- **□PSc (≠⊥).** $\Box (\forall p, q : t. (((p \lor q) \ne \bot ) \to ((p \ne \bot ) \lor (q \ne \bot ))))$

## Conclusion

- **$\Diamond_\vee$ = ≠⊥.** $\Diamond_\vee$ $= (\lambda p:t. p \ne \bot )$

## Proof

The necessary PSa and PSb conditions for $\ne \bot$ follow by necessitating their assumption-free II proofs. With the selected $\Box \operatorname{PSc}(\ne \bot )$, this makes $\ne \bot a$ $\mathrm{Possibility}_\vee$ candidate. It follows that $p\ne \bot \to$$\Diamond_\vee$p. Conversely, the II bound for every PSb candidate gives $\Diamond_\vee$$p\to p\ne \bot$.

The selected premise is boxed and implies its own box. Thus necessitating the discharged argument and using K yields $\Box \forall p$.($\Diamond_\vee$$p\leftrightarrow p\ne \bot$). Apply the predicate intensionality lemma to obtain the identity of the two operators.

## Notes

Informal proof; no independent checker or Lean verification. Formula assumptions are not eligible for unrestricted necessitation.

## Sources

- **Codex connecting proofs, 13 Sep 2026** — Codex (GPT-6), connecting proof boxed-ps-c-distinct-implies-vee-equals-distinct, 2026-09-13.
- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §§4.2–4.5, pp. 18–27 (definitions/background).

<p class='cert'>Record: <code>topics/intuitionisticism/results/boxed-ps-c-distinct-implies-vee-equals-distinct.yaml</code></p>
