# Rich Outcomes ∧ Stochastic Equivalence ∧ Mixture Independence ∧ Relative Expectation ∧ Uniqueness of Negative Self-Similarity (integer ratios) ⇒ Pasadena = ln 2

<p class='cert'>Result — Source: Misc.; produced by Zachary Goodsell (Highland Park and Q constructions); GPT-6 (Codex) (negative-self-similarity factorization and explicit couplings); Claude (Fable 5.1) (integer-ratio premise audit), 2026-09-24; recorded by Claude (Fable 5.1), 2026-09-24.</p>

## Premises

- **Rich Outcomes.** Every real number r occurs as a utility level of a sure outcome: for each $r \in \mathbb{R}$ there is an outcome $o_r$ with $u(o_r)=r$, with u defined by the normalized binary-mixture comparisons in the background. This does not assert that every outcome has a finite real level.
- **Stochastic Equivalence.** If X and Y have the same probability law over outcomes, then $X \sim Y$. The variables remain distinct objects; indifference is an additional axiom.
- **Mixture Independence.** For all X,Y,Z and $0<p<1, X \succeq Y$ iff $M_p(X,Z) \succeq M_p(Y,Z)$, where M is the fixed randomized-selection construction described in the background.
- **Relative Expectation.** For real-utility variables X,Y on the same probability space, if $E|u(X)- u(Y)|<\infty$, then $X \succeq Y$ iff $E[u(X)- u(Y)] \ge 0$. Their individual expectations may both be undefined.
- **Uniqueness of Negative Self-Similarity (integer ratios).** Fix $0<p<1$, a positive integer $a$, $b\in \mathbb{R}$ and Z. If $X \sim M_p(- aX+b,Z)$ and $Y \sim M_p(- aY+b,Z)$, then $X \sim Y$.

## Conclusion

- **Pasadena = ln 2.** Every $X$ with
$$P(u(X)=-\frac{(-2)^n}{n})=2^{-n},\qquad n\ge 1$$
is indifferent to sure utility $\ln 2$.

## Proof

The recorded proof of relative-self-similarity-evaluates-pasadena (writeups/relative-self-similarity-evaluates-pasadena.md) applies uniqueness once, to Highland Park H and the sure value 0 as fixed values of $X \mapsto M_{1/2}(- 2X,0)$, that is at $p=1/2, a=2, b=0$ and Z sure 0. The ratio is the integer 2, so the integer-ratio principle gives $H\sim 0$; the remaining steps (the integrable difference P − H of mean ln 2, the auxiliary identity $Q\sim M_{1/4}(4Q,0)$ from Relative Expectation, and the shift transfer through a half-mixture) are unchanged and use only Rich Outcomes, Stochastic Equivalence, Mixture Independence and Relative Expectation.

## Notes

Premise audit of relative-self-similarity-evaluates-pasadena, which stays recorded with the real-ratio principle. Under DTU with L¹ Continuity, Relative Expectation is recorded (dtu-l1-implies-eu, eu-independence-l1-imply-relative), so Pasadena = ln 2 then follows from Reflection Anti-Invariance with either Integer Affine Preservation or Comonotonic Sum Invariance in place of the full symmetry package. No independent checker or Lean verification is claimed.

## Sources

- **GPT-6 adaptation 9 Sep, Claude audit 24 Sep** — GPT-6 (Codex), 9 September 2026: the factorization through the uniqueness principle and the explicit couplings, in writeups/relative-self-similarity-evaluates-pasadena.md; Claude (Fable 5.1), 24 September 2026: the observation that only the ratio 2 is used.
- **Symmetries of Value** — Goodsell, Symmetries of value, Noûs 60 (2026), 16–37; DOI 10.1111/nous.12549, Theorem 11, pp. 32–33

<p class='cert'>Record: <code>topics/unbounded-utility/results/integer-self-similarity-relative-evaluates-pasadena.yaml</code></p>

## Paper references

- **Background: [Symmetries of value](https://doi.org/10.1111/nous.12549).** Zachary Goodsell (2026). Symmetries of value. Noûs, 60, 16–37. — Theorem 11, pp. 32–33
