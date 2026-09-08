# Archimedean Outcomes ∧ Stochastic Dominance ⇒ Statewise Dominance

<p class='cert'>Result — Source: Decision Theory Unbound; produced by Zachary Goodsell (cited paper); recorded by GPT-6 (Codex), 2026-09-08; transcription and random-variable formulation.</p>

## Premises

- **Archimedean Outcomes.** For any three sure outcomes a ≻ b ≻ c, some nontrivial mixture of the outer two is equally good as the intermediate one: b ~ M_p(a,c) for some p ∈ (0,1). Only the three inputs are sure outcomes. This is the no-infinite-ratios condition, not continuity of preferences over arbitrary gambles.
- **Stochastic Dominance.** If P(X>o) ≥ P(Y>o) for every outcome threshold o, then X ≽ Y; if one threshold inequality is strict, X ≻ Y. Thresholds use the sure-outcome order.

## Conclusion

- **Statewise Dominance.** If X ≥ Y almost surely in the sure-outcome order, then X ≽ Y; if also P(X>Y)>0, then X ≻ Y.

## Proof

Use the real outcome chart supplied by Archimedean Outcomes. If X≥Y almost surely, {Y>t}⊆{X>t} modulo null events. If P(X>Y)>0, the countable family of rational cuts contains a cut with P(Y≤t<X)>0; approximate by a realized outcome threshold if necessary. The strict tail inequality then gives strict preference.

## Notes

Source-based result or immediate restriction/composition. Premises are sufficient; minimality is not claimed. The direct source is recorded separately from the transcription; no translation checker is asserted.

## Sources

- **Decision Theory Unbound** — Goodsell, Decision theory unbound, Noûs 58 (2024), 669–695; online 2023; DOI 10.1111/nous.12473, §3.2, pp. 678–679 and footnote 19

<p class='cert'>Record: <code>topics/unbounded-utility/results/dominance-implies-statewise.yaml</code></p>
