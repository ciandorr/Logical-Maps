# Relative Expectation ⇒ Simple Relative Expectation

<p class='cert'>Result — Source: Misc., Lean `UnboundedUtility.Proofs.relative_implies_simple_relative`; produced by GPT-6 (Codex), 2026-09-08; recorded by GPT-6 (Codex), 2026-09-08; transcription and random-variable formulation.</p>

## Premises

- **Relative Expectation.** For real-utility variables X,Y on the same probability space, if $E|u(X)- u(Y)|<\infty$, then $X \succeq Y$ iff $E[u(X)- u(Y)] \ge 0$. Their individual expectations may both be undefined.

## Conclusion

- **Simple Relative Expectation.** For real-utility variables X,Y on the same probability space, if $u(X)- u(Y)$ takes finitely many values, $X \succeq Y$ iff $E[u(X)- u(Y)] \ge 0$. X and Y themselves need not be simple or integrable.

## Proof

A finite-valued difference is integrable. Restrict Relative Expectation to such pairs.

## Notes

Source-based result or immediate restriction/composition. Premises are sufficient; minimality is not claimed. The direct source is recorded separately from the transcription; no translation checker is asserted.

## Sources

- **Symmetries of Value** — Goodsell, Symmetries of value, Noûs 60 (2026), 16–37; DOI 10.1111/nous.12549, §4, p. 26
- **GPT-6 generated 8 Sep** — GPT-6 (Codex), 2026-09-08: elementary connecting proof in topics/unbounded-utility/results/relative-implies-simple-relative.yaml (proof field), using the cited paper’s definitions; not a separately stated paper theorem.

<p class='cert'>Record: <code>topics/unbounded-utility/results/relative-implies-simple-relative.yaml</code></p>

## Paper references

- **Background: [Symmetries of value](https://doi.org/10.1111/nous.12549).** Zachary Goodsell (2026). Symmetries of value. Noûs, 60, 16–37. — §4, p. 26
