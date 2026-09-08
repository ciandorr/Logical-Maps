# Rich Outcomes ∧ Archimedean Outcomes ∧ Totality ∧ Stochastic Dominance ∧ Sure-Thing ⇒ Mixture Independence

<p class='cert'>Result — Source: Decision Theory Unbound; produced by Zachary Goodsell (cited paper); recorded by GPT-6 (Codex), 2026-09-08; transcription and random-variable formulation.</p>

## Premises

- **Rich Outcomes.** Every real number r occurs as a utility level of a sure outcome: for each r ∈ ℝ there is an outcome o_r with u(o_r)=r, with u defined by the normalized binary-mixture comparisons in the background. This does not assert that every outcome has a finite real level.
- **Archimedean Outcomes.** For any three sure outcomes a ≻ b ≻ c, some nontrivial mixture of the outer two is equally good as the intermediate one: b ~ M_p(a,c) for some p ∈ (0,1). Only the three inputs are sure outcomes. This is the no-infinite-ratios condition, not continuity of preferences over arbitrary gambles.
- **Totality.** For all gambles X,Y, either X ≽ Y or Y ≽ X.
- **Stochastic Dominance.** If P(X>o) ≥ P(Y>o) for every outcome threshold o, then X ≽ Y; if one threshold inequality is strict, X ≻ Y. Thresholds use the sure-outcome order.
- **Sure-Thing.** For an event E with 0<P(E)<1, if X|E ~ Y|E, then X ≽ Y iff X|Eᶜ ≽ Y|Eᶜ. Here X|E equals X on E and sure 0 elsewhere; it is not a conditional expectation.

## Conclusion

- **Mixture Independence.** For all X,Y,Z and 0<p<1, X ≽ Y iff M_p(X,Z) ≽ M_p(Y,Z), where M is the fixed randomized-selection construction described in the background.

## Proof

Source reduction, §3.2: in the original DTU framework, Stochastic Dominance yields Stochastic Equivalence. Preferences therefore descend to laws. Every law and its conditional realizations are available by Prospect Richness, and the paper identifies Sure-Thing in this quotient with von Neumann–Morgenstern Independence. Pull this implication back along X↦L(X). The full original DTU assumptions are retained; a weaker converse for arbitrary incomplete orders has not been extracted.

## Notes

Source-based result or immediate restriction/composition. Premises are sufficient; minimality is not claimed. The direct source is recorded separately from the transcription; no translation checker is asserted.

## Sources

- **Decision Theory Unbound** — Goodsell, Decision theory unbound, Noûs 58 (2024), 669–695; online 2023; DOI 10.1111/nous.12473, §3.2, p. 679

<p class='cert'>Record: <code>topics/unbounded-utility/results/sure-thing-to-independence.yaml</code></p>
