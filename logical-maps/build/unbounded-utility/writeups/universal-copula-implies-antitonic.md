# Universal Copula Sum Invariance ⇒ Antitonic Sum Invariance

<p class='cert'>Result — Source: Misc.; produced by GPT-6 (Codex); recorded by GPT-6 (Codex), 2026-09-09.</p>

## Premises

- **Universal Copula Sum Invariance.** For every copula $C, \operatorname{SC}(C)$ holds. A copula C is a Borel probability measure on $[0,1]^{2}$ with both marginals uniform. Write $H_C(u,v)=C([0,u]\times [0,v])$. A real-utility pair (A,B) admits C when $P(A\le a,B\le b)=H_C(F_A(a),F_B(b))$ for every real a,b. Define $\operatorname{SC}(C)$: for every eligible triple X,Y,Z for which both (X,Z) and (Y,Z) admit this same $C, X \succeq Y$ iff $X+Z \succeq Y+Z$.

## Conclusion

- **Antitonic Sum Invariance.** If X and Z are antitonic, and Y and Z are antitonic, then $X \succeq Y$ iff $X+Z \succeq Y+Z$. A pair is antitonic when one member is nondecreasing and the other nonincreasing in a common uniform random variable.

## Proof

Use the antidiagonal copula, the law of (U,1−U), with $H(u,v)=\max (u+v- 1,0)$. In an antitonic pair one lower-threshold event is an initial uniform interval and the other is a final interval; their intersection has this probability, including for atomic marginals. Both antitonic pairs therefore admit the same copula. $\operatorname{SC}(C)$ applies to the original triple, with no law-invariance premise.

## Sources

- **GPT-6 generated 9 Sep** — GPT-6 (Codex), original copula sum consistency definitions and connecting proofs recorded in this project, 9 September 2026, implementing Zachary Goodsell’s proposal.
- **Zach Goodsell proposal 9 Sep** — Zachary Goodsell, project TODO.md copula-sum proposal and request to add universal/existential variants, 9 September 2026; precise definitions recorded by GPT-6 (Codex).

<p class='cert'>Record: <code>topics/unbounded-utility/results/universal-copula-implies-antitonic.yaml</code></p>
