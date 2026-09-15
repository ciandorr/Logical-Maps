# Independent Sum Preservation ∧ Independent Sum Cancellation ⇒ Independent Sum Invariance

<p class='cert'>Result — Source: Misc., Lean `UnboundedUtility.Proofs.preservation_cancellation_imply_independent_sum`; produced by GPT-6 (Codex); recorded by GPT-6 (Codex), 2026-09-09; extraction and random-variable translation.</p>

## Premises

- **Independent Sum Preservation.** Whenever Z is independent of $(X,Y), X \succeq Y$ implies $X+Z \succeq Y+Z$, and $X \succ Y$ implies $X+Z \succ Y+Z$.
- **Independent Sum Cancellation.** Whenever Z is independent of $(X,Y), X+Z \succeq Y+Z$ implies $X \succeq Y$.

## Conclusion

- **Independent Sum Invariance.** Whenever Z is independent of the pair $(X,Y), X \succeq Y$ iff $X+Z \succeq Y+Z$.

## Proof

Weak preservation gives the forward implication and cancellation the reverse. Together these are precisely Independent Sum Invariance.

## Sources

- **GPT-6 generated 9 Sep** — GPT-6 (Codex), original connecting proof recorded 9 September 2026 in this project
- **Unbounded Utility and Background Risk (unpublished)** — Zachary Goodsell, Unbounded Utility and Background Risk, 5 June 2026, unpublished manuscript marked “do not cite” and erroneous; Lemma 1, p. 8

<p class='cert'>Record: <code>topics/unbounded-utility/results/preservation-cancellation-imply-independent-sum.yaml</code></p>

## Paper references

- **Background: Unbounded Utility and Background Risk.** Zachary Goodsell (5 June 2026). Unbounded Utility and Background Risk. Unpublished working manuscript. — Lemma 1, p. 8
- **Background: [Flummoxing expectations](https://doi.org/10.1111/nous.12530).** Hayden Wilkinson (2025). Flummoxing expectations. Noûs, 59(3), 700–728. First published online in 2024. — §6.1. Source of Independent Sum Consistency; see the principle reference for the changed independence condition. The proof or conjecture recorded here retains its separate attribution.
