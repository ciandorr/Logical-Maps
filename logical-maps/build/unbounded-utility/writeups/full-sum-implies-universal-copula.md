# Full Sum Invariance ⇒ Universal Copula Sum Invariance

<p class='cert'>Result — Source: Misc., Lean `UnboundedUtility.Proofs.full_sum_implies_universal_copula`; produced by GPT-6 (Codex); recorded by GPT-6 (Codex), 2026-09-09.</p>

## Premises

- **Full Sum Invariance.** For all X,Y,Z, with arbitrary dependence, $X \succeq Y$ iff $X+Z \succeq Y+Z$.

## Conclusion

- **Universal Copula Sum Invariance.** For every copula $C, \operatorname{SC}(C)$ holds. A copula C is a Borel probability measure on $[0,1]^{2}$ with both marginals uniform. Write $H_C(u,v)=C([0,u]\times [0,v])$. A real-utility pair (A,B) admits C when $P(A\le a,B\le b)=H_C(F_A(a),F_B(b))$ for every real a,b. Define $\operatorname{SC}(C)$: for every eligible triple X,Y,Z for which both (X,Z) and (Y,Z) admit this same $C, X \succeq Y$ iff $X+Z \succeq Y+Z$.

## Proof

Fix any copula C and any eligible triple whose two pairs admit C. Full Sum Invariance applies to this triple regardless of dependence and supplies the required biconditional. Since C was arbitrary, $\operatorname{SC}(C)$ holds for every copula.

## Notes

No converse is asserted: Universal Copula Sum Invariance only constrains triples for which the two pairs admit a common copula; Full Sum Invariance constrains all eligible triples.

## Sources

- **GPT-6 generated 9 Sep** — GPT-6 (Codex), original copula sum consistency definitions and connecting proofs recorded in this project, 9 September 2026, implementing Zachary Goodsell’s proposal.
- **Zach Goodsell proposal 9 Sep** — Zachary Goodsell, project TODO.md copula-sum proposal and request to add universal/existential variants, 9 September 2026; precise definitions recorded by GPT-6 (Codex).

<p class='cert'>Record: <code>topics/unbounded-utility/results/full-sum-implies-universal-copula.yaml</code></p>

## Paper references

- **Related: [Preference for equivalent random variables: A price for unbounded utilities](https://doi.org/10.1016/j.jmateco.2008.12.002).** Seidenfeld, T., Schervish, M., & Kadane, J. (2009). Preference for equivalent random variables: A price for unbounded utilities. Journal of Mathematical Economics, 45, 329–340. — §1. Related coherence treatment of unbounded random variables; this is not an attribution of the recorded implication to the paper.
