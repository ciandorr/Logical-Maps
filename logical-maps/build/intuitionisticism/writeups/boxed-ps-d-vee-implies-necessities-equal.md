# □PSd ($\Diamond_\vee$) ⇒ □ = □₂

<p class='cert'>Result — Source: Misc.; produced by Codex (GPT-6), connecting proof; recorded by Codex (GPT-6).</p>

## Premises

- **□PSd ($\Diamond_\vee$).** $\Box (\forall p,q:t$. (($\Diamond_\vee$$(p) \to \Box q) \to \Box (p \to q$)))

## Conclusion

- **□ = □₂.** $(\lambda p:t. \Box p) = \Box _{2}$

## Proof

Let A be $\Box \operatorname{PSd}$($\Diamond_\vee$). The standing necessary PSa, PSb and PSc clauses for $\Diamond_\vee$, and the standing necessary normality of $\Box$, show that $\Box$ and $\Diamond_\vee$ form a qualified married pair. Thus $\operatorname{Necessity}_{2}(\Box )$. Instantiating the definition of $\Box _{2}p$ with this candidate yields $\Box _{2}p\to \Box p$ for every p. The reverse comparison is an II theorem.

After discharging A, the pointwise argument is a closed theorem $A\to \forall p.(\Box _{2}p\leftrightarrow \Box p)$. Since A is boxed, 4 gives $A\to \Box A$. Necessitate the closed conditional and apply K to obtain $\Box \forall p.(\Box _{2}p\leftrightarrow \Box p)$. Apply the proved predicate intensionality lemma to identify $\Box _{2}$ and $\Box$.

## Notes

Informal proof; no independent checker or Lean verification. Formula assumptions are not eligible for unrestricted necessitation.

## Sources

- **Codex connecting proofs, 13 Sep 2026** — Codex (GPT-6), connecting proof boxed-ps-d-vee-implies-necessities-equal, 2026-09-13.
- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §§4.2–4.5, pp. 18–27 (definitions/background).

<p class='cert'>Record: <code>topics/intuitionisticism/results/boxed-ps-d-vee-implies-necessities-equal.yaml</code></p>

## Paper references

- **Background: Possibility in Intuitionistic Higher-Order Logic.** Zachary Goodsell (21 August 2026). Possibility in Intuitionistic Higher-Order Logic. Manuscript.
 — §§4.2–4.5, pp. 18–27
