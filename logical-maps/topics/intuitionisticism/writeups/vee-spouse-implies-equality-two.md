# Spouse ($\Diamond_\vee$) ⇒ $\Diamond_\vee$ = ◇₂

<p class='cert'>Result — Source: Misc.; produced by User proposal; proof by Codex (GPT-6); recorded by Codex (GPT-6).</p>

## Premises

- **Spouse ($\Diamond_\vee$).** $\exists N:tt. \operatorname{Necessity}_{2}(N) \land \operatorname{Married}(N$, $\Diamond_\vee$)

## Conclusion

- **$\Diamond_\vee$ = ◇₂.** $\Diamond_\vee$ $= \Diamond _{2}$

## Proof

Write S for Spouse($\Diamond_\vee$). Given S, choose a qualified spouse N. Theorems 6 and 14–15's definitions give the necessary PSb/PSc clauses for $\Diamond_\vee$ and the required marriage with N. Thus $\Diamond_\vee$ itself is $a \operatorname{Possibility}_{2}$ candidate, so $\forall p$.($\Diamond_\vee$$p\to \Diamond _{2}p$). The reverse implication $\forall p.(\Diamond _{2}p\to$$\Diamond_\vee$p) is an II theorem by candidate inclusion.

For use below, the spouse sentence is self-necessitating. Each necessary candidate or marriage clause is a boxed sentence, hence implies its own box by 4. A conjunction of such clauses has the same property. Also, if $B(x)\to \Box B(x)$ is a closed theorem, then $\exists x.B(x)\to \Box \exists x.B(x)$: choose the same witness x, obtain $\Box B(x)$, and apply K to the necessitated existential-introduction theorem $B(x)\to \exists y.B(y)$. This is the valid direction using an existing witness, not a converse Barcan assumption. Expanding $\operatorname{Necessity}_{2}(N)$ shows it is a conjunction and existential combination of boxed clauses. Therefore $\exists N.(\operatorname{Necessity}_{2}(N)\land \operatorname{Married}(N,P))$ implies its own $\Box$, for each fixed P.

The preceding pointwise proof, after discharging S, gives an assumption-free theorem $S\to \forall p$.($\Diamond_\vee$$p\leftrightarrow \Diamond _{2}p$). Necessitate that closed implication and use $\Box S$ and K to get $\Box \forall p$.($\Diamond_\vee$$p\leftrightarrow \Diamond _{2}p$). The predicate form of the proved modalized-functionality lemma then gives $\Diamond_\vee$$=\Diamond _{2}$. This final step establishes identity of operators, not merely their material equivalence at the selected background.

## Notes

Informal proof; no independent checker or Lean verification. Formula assumptions are not eligible for unrestricted necessitation.

## Sources

- **User proposal, 13 Sep 2026** — User proposal in this conversation, 13 September 2026: $\Diamond_\vee$ $= \Diamond _{2}$ is equivalent to $\Diamond_\vee$ having a spouse.
- **Codex connecting proofs, 13 Sep 2026** — Codex (GPT-6), connecting proof vee-spouse-implies-equality-two, 2026-09-13.
- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §§4.2–4.5, pp. 18–27 (definitions/background).

<p class='cert'>Record: <code>topics/intuitionisticism/results/vee-spouse-implies-equality-two.yaml</code></p>
