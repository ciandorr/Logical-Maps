# Universal Copula Sum Invariance ⇒ Independent Sum Invariance

<p class='cert'>Result — Source: Misc.; produced by GPT-6 (Codex); recorded by GPT-6 (Codex), 2026-09-09.</p>

## Premises

- **Universal Copula Sum Invariance.** For every copula $C, \operatorname{SC}(C)$ holds. A copula C is a Borel probability measure on $[0,1]^{2}$ with both marginals uniform. Write $H_C(u,v)=C([0,u]\times [0,v])$. A real-utility pair (A,B) admits C when $P(A\le a,B\le b)=H_C(F_A(a),F_B(b))$ for every real a,b. Define $\operatorname{SC}(C)$: for every eligible triple X,Y,Z for which both (X,Z) and (Y,Z) admit this same $C, X \succeq Y$ iff $X+Z \succeq Y+Z$.

## Conclusion

- **Independent Sum Invariance.** Whenever Z is independent of the pair $(X,Y), X \succeq Y$ iff $X+Z \succeq Y+Z$.

## Proof

If Z is independent of (X,Y), it is independent of X and independent of Y. Hence the joint CDFs of (X,Z) and (Y,Z) both factor through the product copula $H(u,v)=$uv. Instantiate Universal Copula Sum Consistency at that copula and apply it to the original triple.

## Notes

The converse construction needs care: the product-copula condition gives pairwise independence from Z, which need not be independence from the pair (X,Y).

## Sources

- **GPT-6 generated 9 Sep** — GPT-6 (Codex), original copula sum consistency definitions and connecting proofs recorded in this project, 9 September 2026, implementing Zachary Goodsell’s proposal.
- **Zach Goodsell proposal 9 Sep** — Zachary Goodsell, project TODO.md copula-sum proposal and request to add universal/existential variants, 9 September 2026; precise definitions recorded by GPT-6 (Codex).

<p class='cert'>Record: <code>topics/unbounded-utility/results/universal-copula-implies-independent.yaml</code></p>

## Paper references

- **Background: [Flummoxing expectations](https://doi.org/10.1111/nous.12530).** Hayden Wilkinson (2025). Flummoxing expectations. Noûs, 59(3), 700–728. First published online in 2024. — §6.1. Source of Independent Sum Consistency; see the principle reference for the changed independence condition. The proof or conjecture recorded here retains its separate attribution.
