# □ = □₂ ⇒ □PSd ($\Diamond_\vee$)

<p class='cert'>Result — Source: Misc.; produced by Codex (GPT-6), connecting proof; recorded by Codex (GPT-6).</p>

## Premises

- **□ = □₂.** $(\lambda p:t. \Box p) = \Box _{2}$

## Conclusion

- **□PSd ($\Diamond_\vee$).** $\Box (\forall p,q:t$. (($\Diamond_\vee$$(p) \to \Box q) \to \Box (p \to q$)))

## Proof

Let E be $\Box =\Box _{2}$. Suppose $\Diamond_\vee$$p\to \Box q$. Since $\Diamond _{2}p\to$$\Diamond_\vee$p is an II theorem, E gives $\Diamond _{2}p\to \Box _{2}q$. Paired $\operatorname{PSd}_{2}$ yields $\Box _{2}(p\to q)$, and E converts this to $\Box (p\to q)$. Discharge and generalize p,q, retaining only E.

This proves the closed implication $E\to \operatorname{PSd}$($\Diamond_\vee$). Identity implies its own $\Box$ by substituting equals into the reflexivity theorem, so $E\to \Box E$. Necessitate the closed implication and apply K to obtain $\Box \operatorname{PSd}$($\Diamond_\vee$).

## Notes

Informal proof; no independent checker or Lean verification. Formula assumptions are not eligible for unrestricted necessitation.

## Sources

- **Codex connecting proofs, 13 Sep 2026** — Codex (GPT-6), connecting proof necessities-equal-implies-boxed-ps-d-vee, 2026-09-13.
- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §§4.2–4.5, pp. 18–27 (definitions/background).

<p class='cert'>Record: <code>topics/intuitionisticism/results/necessities-equal-implies-boxed-ps-d-vee.yaml</code></p>
