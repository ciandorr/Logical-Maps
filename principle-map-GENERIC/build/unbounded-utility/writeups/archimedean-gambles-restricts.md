# Archimedean Gambles ⇒ Archimedean Outcomes

<p class='cert'>Result — Source: Misc., Lean `UnboundedUtility.Proofs.archimedean_gambles_restricts`; produced by GPT-6 (Codex), 2026-09-08; recorded by GPT-6 (Codex), 2026-09-08; transcription and random-variable formulation.</p>

## Premises

- **Archimedean Gambles.** For any gambles X ≻ Y ≻ Z, there is p ∈ (0,1) with Y ~ M_p(X,Z). Unlike Archimedean Outcomes, X,Y,Z may themselves be unbounded gambles.

## Conclusion

- **Archimedean Outcomes.** For any three sure outcomes a ≻ b ≻ c, some nontrivial mixture of the outer two is equally good as the intermediate one: b ~ M_p(a,c) for some p ∈ (0,1). Only the three inputs are sure outcomes. This is the no-infinite-ratios condition, not continuity of preferences over arbitrary gambles.

## Proof

Sure outcomes are particular gambles. Restrict the triple of quantified gambles to constants.

## Notes

Source-based result or immediate restriction/composition. Premises are sufficient; minimality is not claimed. The direct source is recorded separately from the transcription; no translation checker is asserted.

## Sources

- **Symmetries of Value** — Goodsell, Symmetries of value, Noûs 60 (2026), 16–37; DOI 10.1111/nous.12549, p. 22, footnote 3
- **GPT-6 generated 8 Sep** — GPT-6 (Codex), 2026-09-08: elementary connecting proof in topics/unbounded-utility/results/archimedean-gambles-restricts.yaml (proof field), using the cited paper’s definitions; not a separately stated paper theorem.

<p class='cert'>Record: <code>topics/unbounded-utility/results/archimedean-gambles-restricts.yaml</code></p>
