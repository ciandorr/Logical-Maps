# Expected Utility ⇒ Simple Expected Utility

<p class='cert'>Result — Source: Misc., Lean `UnboundedUtility.Proofs.expected_utility_implies_simple`; produced by GPT-6 (Codex), 2026-09-08; recorded by GPT-6 (Codex), 2026-09-08; transcription and random-variable formulation.</p>

## Premises

- **Expected Utility.** The normalized chart u is defined on all outcomes and is measurable. Whenever u(X),u(Y) are integrable, X ≽ Y iff E[u(X)] ≥ E[u(Y)]. Expectations here are finite Lebesgue expectations; this says nothing about two +∞ expectations or conditionally convergent sums.

## Conclusion

- **Simple Expected Utility.** The normalized real utility chart u is defined on every outcome, is measurable, and ranks every pair of simple random variables exactly by finite expected utility: X ≽ Y iff E[u(X)] ≥ E[u(Y)]. Surjectivity of u is not included here.

## Proof

All simple variables have finite real expected utility. Restrict Expected Utility to them.

## Notes

Source-based result or immediate restriction/composition. Premises are sufficient; minimality is not claimed. The direct source is recorded separately from the transcription; no translation checker is asserted.

## Sources

- **Decision Theory Unbound** — Goodsell, Decision theory unbound, Noûs 58 (2024), 669–695; online 2023; DOI 10.1111/nous.12473, §4.1, p. 685
- **GPT-6 generated 8 Sep** — GPT-6 (Codex), 2026-09-08: elementary connecting proof in topics/unbounded-utility/results/expected-utility-implies-simple.yaml (proof field), using the cited paper’s definitions; not a separately stated paper theorem.

<p class='cert'>Record: <code>topics/unbounded-utility/results/expected-utility-implies-simple.yaml</code></p>

## Paper references

- **Background: [Decision theory unbound](https://doi.org/10.1111/nous.12473).** Zachary Goodsell (2024). Decision theory unbound. Noûs, 58, 669–695. First published online in 2023. — §4.1, p. 685
