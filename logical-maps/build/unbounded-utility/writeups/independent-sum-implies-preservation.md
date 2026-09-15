# Independent Sum Invariance ⇒ Independent Sum Preservation

<p class='cert'>Result — Source: Misc., Lean `UnboundedUtility.Proofs.independent_sum_implies_preservation`; produced by GPT-6 (Codex); recorded by GPT-6 (Codex), 2026-09-09; extraction and random-variable translation.</p>

## Premises

- **Independent Sum Invariance.** Whenever Z is independent of the pair $(X,Y), X \succeq Y$ iff $X+Z \succeq Y+Z$.

## Conclusion

- **Independent Sum Preservation.** Whenever Z is independent of $(X,Y), X \succeq Y$ implies $X+Z \succeq Y+Z$, and $X \succ Y$ implies $X+Z \succ Y+Z$.

## Proof

Take the forward weak implication. If $X \succ Y$ but $Y+Z \succeq X+Z$, the reverse implication with X,Y swapped gives $Y \succeq X, a$ contradiction. Thus strict preference is preserved too.

## Sources

- **GPT-6 generated 9 Sep** — GPT-6 (Codex), original connecting proof recorded 9 September 2026 in this project
- **Unbounded Utility and Background Risk (unpublished)** — Zachary Goodsell, Unbounded Utility and Background Risk, 5 June 2026, unpublished manuscript marked “do not cite” and erroneous; §1–2; Lemma 1, p. 8

<p class='cert'>Record: <code>topics/unbounded-utility/results/independent-sum-implies-preservation.yaml</code></p>

## Paper references

- **Background: Unbounded Utility and Background Risk.** Zachary Goodsell (5 June 2026). Unbounded Utility and Background Risk. Unpublished working manuscript. — §1–2; Lemma 1, p. 8
- **Background: [Flummoxing expectations](https://doi.org/10.1111/nous.12530).** Hayden Wilkinson (2025). Flummoxing expectations. Noûs, 59(3), 700–728. First published online in 2024. — §6.1. Source of Independent Sum Consistency; see the principle reference for the changed independence condition. The proof or conjecture recorded here retains its separate attribution.
