# Simple Expected Utility ⇒ Restricted Totality

<p class='cert'>Result — Source: Symmetries of Value, Lean `UnboundedUtility.Proofs.simple_eu_implies_restricted_totality`; produced by Zachary Goodsell (cited paper); recorded by GPT-6 (Codex), 2026-09-08; transcription and random-variable formulation.</p>

## Premises

- **Simple Expected Utility.** The normalized real utility chart u is defined on every outcome, is measurable, and ranks every pair of simple random variables exactly by finite expected utility: X ≽ Y iff E[u(X)] ≥ E[u(Y)]. Surjectivity of u is not included here.

## Conclusion

- **Restricted Totality.** Every two simple (finite-valued) gambles are comparable. Outcome comparability is already standing in this topic.

## Proof

Finite real expectations are comparable, and Simple EU represents the preference in both directions.

## Notes

Source-based result or immediate restriction/composition. Premises are sufficient; minimality is not claimed. The direct source is recorded separately from the transcription; no translation checker is asserted.

## Sources

- **Symmetries of Value** — Goodsell, Symmetries of value, Noûs 60 (2026), 16–37; DOI 10.1111/nous.12549, §3, pp. 22–23

<p class='cert'>Record: <code>topics/unbounded-utility/results/simple-eu-implies-restricted-totality.yaml</code></p>
