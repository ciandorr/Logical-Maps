# Comonotonic Sum Invariance ∧ Stochastic Equivalence ⇒ Existential Copula Sum Invariance

<p class='cert'>Result — Source: Misc.; produced by GPT-6 (Codex); recorded by GPT-6 (Codex), 2026-09-09.</p>

## Premises

- **Comonotonic Sum Invariance.** If X and Z are comonotonic, and Y and Z are comonotonic, then $X \succeq Y$ iff $X+Z \succeq Y+Z$. A pair is comonotonic when its members admit nondecreasing representations in one common uniform random variable.
- **Stochastic Equivalence.** If X and Y have the same probability law over outcomes, then $X \sim Y$. The variables remain distinct objects; indifference is an additional axiom.

## Conclusion

- **Existential Copula Sum Invariance.** There exists one copula C such that $\operatorname{SC}(C)$ holds for all eligible X,Y,Z. The copula is chosen once for the preference relation, independently of the triple and its marginal laws. A copula C is a Borel probability measure on $[0,1]^{2}$ with both marginals uniform. Write $H_C(u,v)=C([0,u]\times [0,v])$. A real-utility pair (A,B) admits C when $P(A\le a,B\le b)=H_C(F_A(a),F_B(b))$ for every real a,b. Define $\operatorname{SC}(C)$: for every eligible triple X,Y,Z for which both (X,Z) and (Y,Z) admit this same $C, X \succeq Y$ iff $X+Z \succeq Y+Z$.

## Proof

Choose the diagonal copula once. Given any eligible original triple whose pairs admit it, realize a triple (X′,Y′,Z′) with utility coordinates $(Q_X(U), Q_Y(U), Q_Z(U))$ on the standing atomless space, where Q denotes increasing marginal quantiles. Each new pair has the same joint law as its original counterpart, and each is comonotonic. Thus the new variables have the original marginal laws, and X′$+Z$′ and Y′$+Z$′ have the original sum laws. Apply Comonotonic Sum Invariance to the new triple. Stochastic Equivalence and transitivity transfer both sides of its biconditional to the original variables. This proves $\operatorname{SC}(C)$ for the chosen copula.

## Notes

Stochastic Equivalence is explicit because this proof passes through a new realization. No stronger implication without that premise is recorded here. Quantile endpoint values affect no law; choose valid outcomes at exceptional points.

## Sources

- **GPT-6 generated 9 Sep** — GPT-6 (Codex), original copula sum consistency definitions and connecting proofs recorded in this project, 9 September 2026, implementing Zachary Goodsell’s proposal.
- **Zach Goodsell proposal 9 Sep** — Zachary Goodsell, project TODO.md copula-sum proposal and request to add universal/existential variants, 9 September 2026; precise definitions recorded by GPT-6 (Codex).

<p class='cert'>Record: <code>topics/unbounded-utility/results/comonotonic-sum-and-equivalence-imply-existential-copula.yaml</code></p>
