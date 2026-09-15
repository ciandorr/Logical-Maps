# Universal Copula Sum Invariance ⇒ Comonotonic Sum Invariance

<p class='cert'>Result — Source: Misc.; produced by GPT-6 (Codex); recorded by GPT-6 (Codex), 2026-09-09.</p>

## Premises

- **Universal Copula Sum Invariance.** For every copula $C, \operatorname{SC}(C)$ holds. A copula C is a Borel probability measure on $[0,1]^{2}$ with both marginals uniform. Write $H_C(u,v)=C([0,u]\times [0,v])$. A real-utility pair (A,B) admits C when $P(A\le a,B\le b)=H_C(F_A(a),F_B(b))$ for every real a,b. Define $\operatorname{SC}(C)$: for every eligible triple X,Y,Z for which both (X,Z) and (Y,Z) admit this same $C, X \succeq Y$ iff $X+Z \succeq Y+Z$.

## Conclusion

- **Comonotonic Sum Invariance.** If X and Z are comonotonic, and Y and Z are comonotonic, then $X \succeq Y$ iff $X+Z \succeq Y+Z$. A pair is comonotonic when its members admit nondecreasing representations in one common uniform random variable.

## Proof

Use the diagonal copula, the law of (U,U) for uniform U, with $H(u,v)=\min (u,v)$. For a comonotonic pair, the lower-threshold events are nested up to null sets, so its joint CDF is $\min (F_A(a),F_B(b))$. Thus both comonotonic pairs (X,Z) and (Y,Z) admit this same copula. Applying $\operatorname{SC}(C)$ gives the desired biconditional for the actual X,Y,Z. No replacement of variables in a preference comparison is used.

## Sources

- **GPT-6 generated 9 Sep** — GPT-6 (Codex), original copula sum consistency definitions and connecting proofs recorded in this project, 9 September 2026, implementing Zachary Goodsell’s proposal.
- **Zach Goodsell proposal 9 Sep** — Zachary Goodsell, project TODO.md copula-sum proposal and request to add universal/existential variants, 9 September 2026; precise definitions recorded by GPT-6 (Codex).

<p class='cert'>Record: <code>topics/unbounded-utility/results/universal-copula-implies-comonotonic.yaml</code></p>
