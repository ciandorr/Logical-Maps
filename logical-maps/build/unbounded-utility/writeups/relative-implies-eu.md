# Archimedean Outcomes ∧ Relative Expectation ⇒ Expected Utility

<p class='cert'>Result — Source: Misc.; produced by GPT-6 (Codex), 2026-09-08; recorded by GPT-6 (Codex), 2026-09-08; transcription and random-variable formulation.</p>

## Premises

- **Archimedean Outcomes.** For any three sure outcomes $a \succ b \succ c$, some nontrivial mixture of the outer two is equally good as the intermediate one: $b \sim M_p(a,c)$ for some $p \in (0,1)$. Only the three inputs are sure outcomes. This is the no-infinite-ratios condition, not continuity of preferences over arbitrary gambles.
- **Relative Expectation.** For real-utility variables X,Y on the same probability space, if $E|u(X)- u(Y)|<\infty$, then $X \succeq Y$ iff $E[u(X)- u(Y)] \ge 0$. Their individual expectations may both be undefined.

## Conclusion

- **Expected Utility.** The normalized chart u is defined on all outcomes and is measurable. Whenever $u(X),u(Y)$ are integrable, $X \succeq Y$ iff $E[u(X)] \ge E[u(Y)]$. Expectations here are finite Lebesgue expectations; this says nothing about two $+\infty$ expectations or conditionally convergent sums.

## Proof

Archimedean Outcomes makes the real chart total. If $u(X),u(Y)$ are integrable, so is their difference, and $E[u(X)- u(Y)]=E[u(X)]- E[u(Y)]$. Apply Relative Expectation.

## Notes

Source-based result or immediate restriction/composition. Premises are sufficient; minimality is not claimed. The direct source is recorded separately from the transcription; no translation checker is asserted.

## Sources

- **Symmetries of Value** — Goodsell, Symmetries of value, Noûs 60 (2026), 16–37; DOI 10.1111/nous.12549, §4, pp. 26–27
- **GPT-6 generated 8 Sep** — GPT-6 (Codex), 2026-09-08: elementary connecting proof in topics/unbounded-utility/results/relative-implies-eu.yaml (proof field), using the cited paper’s definitions; not a separately stated paper theorem.

<p class='cert'>Record: <code>topics/unbounded-utility/results/relative-implies-eu.yaml</code></p>

## Paper references

- **Background: [Symmetries of value](https://doi.org/10.1111/nous.12549).** Zachary Goodsell (2026). Symmetries of value. Noûs, 60, 16–37. — §4, pp. 26–27
