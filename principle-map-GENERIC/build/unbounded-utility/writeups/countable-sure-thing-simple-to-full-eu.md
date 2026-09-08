# Countable Sure-Thing ∧ Simple Expected Utility ⇒ Expected Utility

<p class='cert'>Conjecture — Source: Misc.; produced by User suggestion, 2026-09-08; recorded by GPT-6 (Codex), 2026-09-08.</p>

## Premises

- **Countable Sure-Thing.** For every countable measurable partition (E_n) into events of positive probability, if X|E_n ≽ Y|E_n for every n, then X ≽ Y. If one conditional comparison is strict, X ≻ Y.
- **Simple Expected Utility.** The normalized real utility chart u is defined on every outcome, is measurable, and ranks every pair of simple random variables exactly by finite expected utility: X ≽ Y iff E[u(X)] ≥ E[u(Y)]. Surjectivity of u is not included here.

## Conclusion

- **Expected Utility.** The normalized chart u is defined on all outcomes and is measurable. Whenever u(X),u(Y) are integrable, X ≽ Y iff E[u(X)] ≥ E[u(Y)]. Expectations here are finite Lebesgue expectations; this says nothing about two +∞ expectations or conditionally convergent sums.

## Notes

Candidate extension from finite-valued gambles to all integrable utility random variables. Verification must cover the full measurable domain, including variables with non-atomic distributions, and both directions of the expected-utility comparison. Do not silently add Rich Outcomes, Totality, Stochastic Equivalence, or Sure-Thing as premises. Rich Outcomes is optional here; the existing unbounded-utility inconsistency argument is not by itself a proof of this two-premise implication. Excluded from proved deductions until verified.

## Sources

- **User suggestion 8 Sep** — User suggestion in this project's conversation, 2026-09-08; proposed implication, not a completed proof.
- **Decision Theory Unbound** — Related motivation rather than a verified theorem with these exact premises: Goodsell, Decision theory unbound, Noûs 58 (2024), 669–695, DOI 10.1111/nous.12473, §4.1, pp. 685–686.

<p class='cert'>Record: <code>topics/unbounded-utility/results/countable-sure-thing-simple-to-full-eu.yaml</code></p>
