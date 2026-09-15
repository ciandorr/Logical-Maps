# Simple Expected Utility ⇒ Restricted Stochastic Equivalence

<p class='cert'>Result — Source: Decision Theory Unbound, Lean `UnboundedUtility.Proofs.simple_eu_implies_restricted_equivalence`; produced by Zachary Goodsell (cited paper); recorded by GPT-6 (Codex), 2026-09-08; transcription and random-variable formulation.</p>

## Premises

- **Simple Expected Utility.** The normalized real utility chart u is defined on every outcome, is measurable, and ranks every pair of simple random variables exactly by finite expected utility: $X \succeq Y$ iff $E[u(X)] \ge E[u(Y)]$. Surjectivity of u is not included here.

## Conclusion

- **Restricted Stochastic Equivalence.** If simple gambles X,Y have the same law, then $X \sim Y$.

## Proof

Equal laws of simple variables give equal finite expectations. Simple EU therefore gives both preference directions.

## Notes

Source-based result or immediate restriction/composition. Premises are sufficient; minimality is not claimed. The direct source is recorded separately from the transcription; no translation checker is asserted.

## Sources

- **Decision Theory Unbound** — Goodsell, Decision theory unbound, Noûs 58 (2024), 669–695; online 2023; DOI 10.1111/nous.12473, §§2.3, 3.2

<p class='cert'>Record: <code>topics/unbounded-utility/results/simple-eu-implies-restricted-equivalence.yaml</code></p>

## Paper references

- **Proof: [Decision theory unbound](https://doi.org/10.1111/nous.12473).** Zachary Goodsell (2024). Decision theory unbound. Noûs, 58, 669–695. First published online in 2023. — §§2.3, 3.2
