# Rich Outcomes ∧ Stochastic Equivalence ∧ Simple Expected Utility ∧ Uniqueness of Negative Self-Similarity (integer ratios) ⇒ Alternating St Petersburg = −1/2

<p class='cert'>Result — Source: Misc.; produced by Zachary Goodsell (source argument); GPT-6 (Codex) (adaptation through the uniqueness principle); Claude (Fable 5.1) (integer-ratio premise audit), 2026-09-24; recorded by Claude (Fable 5.1), 2026-09-24.</p>

## Premises

- **Rich Outcomes.** Every real number r occurs as a utility level of a sure outcome: for each $r \in \mathbb{R}$ there is an outcome $o_r$ with $u(o_r)=r$, with u defined by the normalized binary-mixture comparisons in the background. This does not assert that every outcome has a finite real level.
- **Stochastic Equivalence.** If X and Y have the same probability law over outcomes, then $X \sim Y$. The variables remain distinct objects; indifference is an additional axiom.
- **Simple Expected Utility.** The normalized real utility chart u is defined on every outcome, is measurable, and ranks every pair of simple random variables exactly by finite expected utility: $X \succeq Y$ iff $E[u(X)] \ge E[u(Y)]$. Surjectivity of u is not included here.
- **Uniqueness of Negative Self-Similarity (integer ratios).** Fix $0<p<1$, a positive integer $a$, $b\in \mathbb{R}$ and Z. If $X \sim M_p(- aX+b,Z)$ and $Y \sim M_p(- aY+b,Z)$, then $X \sim Y$.

## Conclusion

- **Alternating St Petersburg = −1/2.** Every $X$ with
$$P(u(X)=(-2)^n)=2^{-n},\qquad n\ge 1$$
is indifferent to sure utility $-\frac{1}{2}$.

## Proof

The recorded proof of negative-self-similarity-evaluates-alternating (writeups/negative-self-similarity-evaluates-alternating.md) applies uniqueness once, at $p=1/2, a=2, b=0$ and Z sure −2: splitting off the first atom gives $A\sim M_{1/2}(- 2A,- 2)$ by Stochastic Equivalence, and Simple EU gives $c\sim M_{1/2}(- 2c,- 2)$ for the sure value $c=- 1/2$, since $M_{1/2}(1,- 2)$ has expectation −1/2. The ratio is the integer 2, so the integer-ratio principle gives $A\sim c$. Rich Outcomes supplies the outcomes used.

## Notes

Premise audit of negative-self-similarity-evaluates-alternating, which stays recorded with the real-ratio principle. With totality-independence-integer-affine-reflection-imply-integer-self-similarity and comonotonic-sum-implies-integer-affine-preservation, the alternating evaluation follows from Rich Outcomes, Totality, Stochastic Equivalence, Simple EU, Mixture Independence, Reflection Anti-Invariance and either Integer Affine Preservation or Comonotonic Sum Invariance; no scale invariance for real or rational factors is needed. No independent checker or Lean verification is claimed.

## Sources

- **GPT-6 adaptation 9 Sep, Claude audit 24 Sep** — GPT-6 (Codex), 9 September 2026: the factorization through the uniqueness principle, in writeups/negative-self-similarity-evaluates-alternating.md; Claude (Fable 5.1), 24 September 2026: the observation that only the ratio 2 is used.
- **Symmetries of Value** — Goodsell, Symmetries of value, Noûs 60 (2026), 16–37; DOI 10.1111/nous.12549, Theorems 9–10, pp. 30–31

<p class='cert'>Record: <code>topics/unbounded-utility/results/integer-self-similarity-evaluates-alternating.yaml</code></p>

## Paper references

- **Background: [Symmetries of value](https://doi.org/10.1111/nous.12549).** Zachary Goodsell (2026). Symmetries of value. Noûs, 60, 16–37. — Theorems 9–10, pp. 30–31
