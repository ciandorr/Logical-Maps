# Rich Outcomes ∧ Simple Expected Utility ∧ Sure-Thing ∧ Countable Sure-Thing ⇒ False (⊥)

<p class='cert'>Result — Source: Infinite Prospects; produced by Jeffrey Sanford Russell and Yoaav Isaacs (Countable Sure-Thing obstruction); Zachary Goodsell (strengthened version recorded here); recorded by GPT-6 (Codex), 2026-09-08; transcription and random-variable formulation.</p>

## Premises

- **Rich Outcomes.** Every real number r occurs as a utility level of a sure outcome: for each $r \in \mathbb{R}$ there is an outcome $o_r$ with $u(o_r)=r$, with u defined by the normalized binary-mixture comparisons in the background. This does not assert that every outcome has a finite real level.
- **Simple Expected Utility.** The normalized real utility chart u is defined on every outcome, is measurable, and ranks every pair of simple random variables exactly by finite expected utility: $X \succeq Y$ iff $E[u(X)] \ge E[u(Y)]$. Surjectivity of u is not included here.
- **Sure-Thing.** For an event E with $0<P(E)<1$, if $X|E \sim Y|E$, then $X \succeq Y$ iff $X|E^{c} \succeq Y|E^{c}$. Here X|E equals X on E and sure 0 elsewhere; it is not a conditional expectation.
- **Countable Sure-Thing.** For every countable measurable partition $(E_n)$ into events of positive probability, if $X|E_n \succeq Y|E_n$ for every n, then $X \succeq Y$. If one conditional comparison is strict, $X \succ Y$.

## Conclusion

- **False (⊥).** These premises cannot all hold together.

## Proof

Use the strengthened St Petersburg contradiction from §2.3. Simple EU supplies Restricted Totality, Restricted Stochastic Equivalence and finite conditional EU calculations. With independent sequences of fair tosses let A be first-toss St Petersburg, B the same starting at toss 2, and C an independent St Petersburg variable. Conditional on $B=2^n, A$ is a fair mixture of 2 and $2^{n+1}$, so its conditional expected value exceeds B by 1; Countable Sure-Thing would give $A\succ B$. Partition the A,C space by the maximum of their finite stopping times. On each cell they are simple and their restricted laws coincide, so Countable Sure-Thing would give $A\sim C$. Repeat for B,C to get $B\sim C$, contradicting Preordering. Null sets can be assigned a finite outcome without changing the simple-law comparisons.

## Notes

Russell and Isaacs supply the Countable Sure-Thing principle and original St Petersburg obstruction. Goodsell, Decision theory unbound, §2.3, pp. 675–676 supplies the strengthened version and proof recorded here. The arrow is attributed to the original result, with the strengthening credited separately. Premises, proof and verification status are unchanged.

## Sources

- **Russell & Isaacs (2021)** — Russell, J. S., & Isaacs, Y. (2021). Infinite prospects. Philosophy and Phenomenological Research, 103(1), 178–198. §2, author’s April 2020 manuscript pp. 6–8; §4, p. 15, footnote 17. https://doi.org/10.1111/phpr.12704
- **Decision Theory Unbound** — Goodsell, Decision theory unbound, Noûs 58 (2024), 669–695; online 2023; DOI 10.1111/nous.12473, §2.3, pp. 675–676

<p class='cert'>Record: <code>topics/unbounded-utility/results/rich-simple-sure-thing-refutes-countable.yaml</code></p>

## Paper references

- **Origin: [Infinite prospects](https://doi.org/10.1111/phpr.12704).** Russell, J. S., & Isaacs, Y. (2021). Infinite prospects. Philosophy and Phenomenological Research, 103(1), 178–198. — §2, author’s April 2020 manuscript pp. 6–8; §4, p. 15, footnote 17. Original St Petersburg obstruction to Countable Sure-Thing with unbounded real utilities. The sufficient premises and proof recorded here follow Goodsell’s strengthened version in Decision theory unbound, §2.3.
- **Proof: [Decision theory unbound](https://doi.org/10.1111/nous.12473).** Zachary Goodsell (2024). Decision theory unbound. Noûs, 58, 669–695. First published online in 2023. — §2.3, pp. 675–676
