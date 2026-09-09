# Independent Sum Invariance ∧ Stochastic Equivalence ⇒ Existential Copula Sum Invariance

<p class='cert'>Result — Source: Misc.; produced by GPT-6 (Codex); recorded by GPT-6 (Codex), 2026-09-09.</p>

## Premises

- **Independent Sum Invariance.** Whenever Z is independent of the pair (X,Y), X ≽ Y iff X+Z ≽ Y+Z.
- **Stochastic Equivalence.** If X and Y have the same probability law over outcomes, then X ~ Y. The variables remain distinct objects; indifference is an additional axiom.

## Conclusion

- **Existential Copula Sum Invariance.** There exists one copula C such that SC(C) holds for all eligible X,Y,Z. The copula is chosen once for the preference relation, independently of the triple and its marginal laws. A copula C is a Borel probability measure on [0,1]² with both marginals uniform. Write H_C(u,v)=C([0,u]×[0,v]). A real-utility pair (A,B) admits C when P(A≤a,B≤b)=H_C(F_A(a),F_B(b)) for every real a,b. Define SC(C): for every eligible triple X,Y,Z for which both (X,Z) and (Y,Z) admit this same C, X ≽ Y iff X+Z ≽ Y+Z.

## Proof

Choose the product copula once. For an eligible triple admitting that copula in both pairs, Z is separately independent of X and Y, but need not be independent of (X,Y). On the standing atomless space realize independent uniforms U,V, and utility coordinates X′=Q_X(U), Y′=Q_Y(U), Z′=Q_Z(V). Now Z′ is independent of (X′,Y′). The marginal laws and both pair laws agree with those of the original triple; consequently so do the two sum laws. Independent Sum Invariance gives the biconditional for the new triple. Stochastic Equivalence and transitivity transfer it to the original comparisons. This establishes SC(C) for the product copula.

## Notes

The Stochastic Equivalence premise licenses copying the variables; pairwise independence alone does not license applying the existing jointly-independent sum principle to the original triple.

## Sources

- **GPT-6 generated 9 Sep** — GPT-6 (Codex), original copula sum consistency definitions and connecting proofs recorded in this project, 9 September 2026, implementing Zachary Goodsell’s proposal.
- **Zach Goodsell proposal 9 Sep** — Zachary Goodsell, project TODO.md copula-sum proposal and request to add universal/existential variants, 9 September 2026; precise definitions recorded by GPT-6 (Codex).

<p class='cert'>Record: <code>topics/unbounded-utility/results/independent-sum-and-equivalence-imply-existential-copula.yaml</code></p>
