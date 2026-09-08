# Rich Outcomes ∧ Simple Expected Utility ∧ Sure-Thing ⇒ Failure of Countable Sure-Thing

<p class='cert'>Result — Source: Decision Theory Unbound; produced by Zachary Goodsell (cited paper); recorded by GPT-6 (Codex), 2026-09-08; transcription and random-variable formulation.</p>

## Premises

- **Rich Outcomes.** Every real number r occurs as a utility level of a sure outcome: for each r ∈ ℝ there is an outcome o_r with u(o_r)=r, with u defined by the normalized binary-mixture comparisons in the background. This does not assert that every outcome has a finite real level.
- **Simple Expected Utility.** The normalized real utility chart u is defined on every outcome, is measurable, and ranks every pair of simple random variables exactly by finite expected utility: X ≽ Y iff E[u(X)] ≥ E[u(Y)]. Surjectivity of u is not included here.
- **Sure-Thing.** For an event E with 0<P(E)<1, if X|E ~ Y|E, then X ≽ Y iff X|Eᶜ ≽ Y|Eᶜ. Here X|E equals X on E and sure 0 elsewhere; it is not a conditional expectation.

## Conclusion

- **Failure of Countable Sure-Thing.** Countable Sure-Thing is false: there are X,Y and a countable positive-probability partition satisfying its conditional premises but failing its corresponding weak or strict conclusion.

## Proof

Use the strengthened St Petersburg contradiction from §2.3. Simple EU supplies Restricted Totality, Restricted Stochastic Equivalence and finite conditional EU calculations. With independent sequences of fair tosses let A be first-toss St Petersburg, B the same starting at toss 2, and C an independent St Petersburg variable. Conditional on B=2^n, A is a fair mixture of 2 and 2^(n+1), so its conditional expected value exceeds B by 1; Countable Sure-Thing would give A≻B. Partition the A,C space by the maximum of their finite stopping times. On each cell they are simple and their restricted laws coincide, so Countable Sure-Thing would give A~C. Repeat for B,C to get B~C, contradicting Preordering. Null sets can be assigned a finite outcome without changing the simple-law comparisons.

## Notes

Source-based result or immediate restriction/composition. Premises are sufficient; minimality is not claimed. The direct source is recorded separately from the transcription; no translation checker is asserted.

## Sources

- **Decision Theory Unbound** — Goodsell, Decision theory unbound, Noûs 58 (2024), 669–695; online 2023; DOI 10.1111/nous.12473, §2.3, pp. 675–676

<p class='cert'>Record: <code>topics/unbounded-utility/results/rich-simple-sure-thing-refutes-countable.yaml</code></p>
