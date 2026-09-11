# Universal Copula Sum Invariance ⇒ Existential Copula Sum Invariance

<p class='cert'>Result — Source: Misc., Lean `UnboundedUtility.Proofs.universal_copula_implies_existential`; produced by GPT-6 (Codex); recorded by GPT-6 (Codex), 2026-09-09.</p>

## Premises

- **Universal Copula Sum Invariance.** For every copula C, SC(C) holds. A copula C is a Borel probability measure on [0,1]² with both marginals uniform. Write H_C(u,v)=C([0,u]×[0,v]). A real-utility pair (A,B) admits C when P(A≤a,B≤b)=H_C(F_A(a),F_B(b)) for every real a,b. Define SC(C): for every eligible triple X,Y,Z for which both (X,Z) and (Y,Z) admit this same C, X ≽ Y iff X+Z ≽ Y+Z.

## Conclusion

- **Existential Copula Sum Invariance.** There exists one copula C such that SC(C) holds for all eligible X,Y,Z. The copula is chosen once for the preference relation, independently of the triple and its marginal laws. A copula C is a Borel probability measure on [0,1]² with both marginals uniform. Write H_C(u,v)=C([0,u]×[0,v]). A real-utility pair (A,B) admits C when P(A≤a,B≤b)=H_C(F_A(a),F_B(b)) for every real a,b. Define SC(C): for every eligible triple X,Y,Z for which both (X,Z) and (Y,Z) admit this same C, X ≽ Y iff X+Z ≽ Y+Z.

## Proof

The class of bivariate copulas is nonempty: the product of two uniform laws is a copula. Instantiate the universal principle at that copula to obtain one fixed witness for the existential principle.

## Sources

- **GPT-6 generated 9 Sep** — GPT-6 (Codex), original copula sum consistency definitions and connecting proofs recorded in this project, 9 September 2026, implementing Zachary Goodsell’s proposal.
- **Zach Goodsell proposal 9 Sep** — Zachary Goodsell, project TODO.md copula-sum proposal and request to add universal/existential variants, 9 September 2026; precise definitions recorded by GPT-6 (Codex).

<p class='cert'>Record: <code>topics/unbounded-utility/results/universal-copula-implies-existential.yaml</code></p>
