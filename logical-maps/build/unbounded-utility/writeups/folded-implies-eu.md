# Archimedean Outcomes ∧ Folded Expectation ⇒ Expected Utility

<p class='cert'>Result — Source: Misc.; produced by GPT-6 (Codex), 2026-09-08; recorded by GPT-6 (Codex), 2026-09-08; transcription and random-variable formulation.</p>

## Premises

- **Archimedean Outcomes.** For any three sure outcomes $a \succ b \succ c$, some nontrivial mixture of the outer two is equally good as the intermediate one: $b \sim M_p(a,c)$ for some $p \in (0,1)$. Only the three inputs are sure outcomes. This is the no-infinite-ratios condition, not continuity of preferences over arbitrary gambles.
- **Folded Expectation.** Put $h_X(t)=P(u(X)>t)- P(u(X)<- t)$ for $t\ge 0$. If $\int _0^{\infty }|h_X(t)|dt$ and $\int _0^{\infty }|h_Y(t)|dt$ are finite, compare X,Y exactly by $F(X)=\int _0^{\infty }h_X(t)dt$ and $F(Y)$. Boundary atoms do not change these integrals.

## Conclusion

- **Expected Utility.** The normalized chart u is defined on all outcomes and is measurable. Whenever $u(X),u(Y)$ are integrable, $X \succeq Y$ iff $E[u(X)] \ge E[u(Y)]$. Expectations here are finite Lebesgue expectations; this says nothing about two $+\infty$ expectations or conditionally convergent sums.

## Proof

For an integrable real utility variable, the integral of the absolute folded tail difference is bounded by $E|u(X)|$, and the tail-integral formula gives $F(X)=E[u(X)]$. Archimedean Outcomes makes the chart total. Restrict the Folded Expectation comparison to integrable X,Y.

## Notes

Source-based result or immediate restriction/composition. Premises are sufficient; minimality is not claimed. The direct source is recorded separately from the transcription; no translation checker is asserted.

## Sources

- **Symmetries of Value** — Goodsell, Symmetries of value, Noûs 60 (2026), 16–37; DOI 10.1111/nous.12549, §4, p. 27
- **GPT-6 generated 8 Sep** — GPT-6 (Codex), 2026-09-08: elementary connecting proof in topics/unbounded-utility/results/folded-implies-eu.yaml (proof field), using the cited paper’s definitions; not a separately stated paper theorem.

<p class='cert'>Record: <code>topics/unbounded-utility/results/folded-implies-eu.yaml</code></p>

## Paper references

- **Background: [Symmetries of value](https://doi.org/10.1111/nous.12549).** Zachary Goodsell (2026). Symmetries of value. Noûs, 60, 16–37. — §4, p. 27
