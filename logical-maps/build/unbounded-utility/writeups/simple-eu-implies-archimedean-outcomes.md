# Simple Expected Utility ⇒ Archimedean Outcomes

<p class='cert'>Result — Source: Symmetries of Value; produced by Zachary Goodsell (cited paper); recorded by GPT-6 (Codex), 2026-09-08; transcription and random-variable formulation.</p>

## Premises

- **Simple Expected Utility.** The normalized real utility chart u is defined on every outcome, is measurable, and ranks every pair of simple random variables exactly by finite expected utility: X ≽ Y iff E[u(X)] ≥ E[u(Y)]. Surjectivity of u is not included here.

## Conclusion

- **Archimedean Outcomes.** For any three sure outcomes a ≻ b ≻ c, some nontrivial mixture of the outer two is equally good as the intermediate one: b ~ M_p(a,c) for some p ∈ (0,1). Only the three inputs are sure outcomes. This is the no-infinite-ratios condition, not continuity of preferences over arbitrary gambles.

## Proof

For a≻b≻c put p=(u(b)−u(c))/(u(a)−u(c)). Then 0<p<1 and the simple variable M_p(a,c) has expectation u(b), so is indifferent to b.

## Notes

Source-based result or immediate restriction/composition. Premises are sufficient; minimality is not claimed. The direct source is recorded separately from the transcription; no translation checker is asserted.

## Sources

- **Symmetries of Value** — Goodsell, Symmetries of value, Noûs 60 (2026), 16–37; DOI 10.1111/nous.12549, p. 22, footnote 3

<p class='cert'>Record: <code>topics/unbounded-utility/results/simple-eu-implies-archimedean-outcomes.yaml</code></p>

## Paper references

- **Proof: [Symmetries of value](https://doi.org/10.1111/nous.12549).** Zachary Goodsell (2026). Symmetries of value. Noûs, 60, 16–37. — p. 22, footnote 3
