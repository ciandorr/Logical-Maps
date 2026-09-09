# Existential Copula Sum Invariance ⇒ Shift Invariance

<p class='cert'>Result — Source: Misc.; produced by GPT-6 (Codex); recorded by GPT-6 (Codex), 2026-09-09.</p>

## Premises

- **Existential Copula Sum Invariance.** There exists one copula C such that SC(C) holds for all eligible X,Y,Z. The copula is chosen once for the preference relation, independently of the triple and its marginal laws. A copula C is a Borel probability measure on [0,1]² with both marginals uniform. Write H_C(u,v)=C([0,u]×[0,v]). A real-utility pair (A,B) admits C when P(A≤a,B≤b)=H_C(F_A(a),F_B(b)) for every real a,b. Define SC(C): for every eligible triple X,Y,Z for which both (X,Z) and (Y,Z) admit this same C, X ≽ Y iff X+Z ≽ Y+Z.

## Conclusion

- **Shift Invariance.** For every real b, X ≽ Y iff X+b ≽ Y+b.

## Proof

Choose the single copula C supplied by the existential principle. For Z equal to a constant b, F_Z(z) is either 0 or 1. Every copula satisfies H_C(u,0)=0 and H_C(u,1)=u, so (X,b) and (Y,b) admit C for every X,Y. SC(C) therefore gives X ≽ Y iff X+b ≽ Y+b whenever the shifted gambles exist. This uses the actual constant summand and needs no Stochastic Equivalence.

## Sources

- **GPT-6 generated 9 Sep** — GPT-6 (Codex), original copula sum consistency definitions and connecting proofs recorded in this project, 9 September 2026, implementing Zachary Goodsell’s proposal.
- **Zach Goodsell proposal 9 Sep** — Zachary Goodsell, project TODO.md copula-sum proposal and request to add universal/existential variants, 9 September 2026; precise definitions recorded by GPT-6 (Codex).

<p class='cert'>Record: <code>topics/unbounded-utility/results/existential-copula-implies-shift.yaml</code></p>
