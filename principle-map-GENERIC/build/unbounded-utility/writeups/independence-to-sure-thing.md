# Stochastic Equivalence ∧ Mixture Independence ⇒ Sure-Thing

<p class='cert'>Result — Source: Decision Theory Unbound; produced by Zachary Goodsell (cited paper); recorded by GPT-6 (Codex), 2026-09-08; transcription and random-variable formulation.</p>

## Premises

- **Stochastic Equivalence.** If X and Y have the same probability law over outcomes, then X ~ Y. The variables remain distinct objects; indifference is an additional axiom.
- **Mixture Independence.** For all X,Y,Z and 0<p<1, X ≽ Y iff M_p(X,Z) ≽ M_p(Y,Z), where M is the fixed randomized-selection construction described in the background.

## Conclusion

- **Sure-Thing.** For an event E with 0<P(E)<1, if X|E ~ Y|E, then X ≽ Y iff X|Eᶜ ≽ Y|Eᶜ. Here X|E equals X on E and sure 0 elsewhere; it is not a conditional expectation.

## Proof

Let p=P(E). Realize the conditional laws on E and Eᶜ as A,B for X and C,D for Y. Law invariance gives X~M_p(A,B), Y~M_p(C,D), X|E~M_p(A,0), Y|E~M_p(C,0). Independence cancels 0 to yield A~C from the hypothesis. Replace indifferent mixture components and cancel the common E component: X≽Y iff B≽D. The latter is equivalent to X|Eᶜ≽Y|Eᶜ by independence and law invariance.

## Notes

Source-based result or immediate restriction/composition. Premises are sufficient; minimality is not claimed. The direct source is recorded separately from the transcription; no translation checker is asserted.

## Sources

- **Decision Theory Unbound** — Goodsell, Decision theory unbound, Noûs 58 (2024), 669–695; online 2023; DOI 10.1111/nous.12473, §3.2, p. 679 and p. 682, footnote 28

<p class='cert'>Record: <code>topics/unbounded-utility/results/independence-to-sure-thing.yaml</code></p>
