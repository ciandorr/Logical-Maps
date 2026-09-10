# Independent Sum Preservation ∧ Independent Sum Cancellation ⇒ Independent Sum Invariance

<p class='cert'>Result — Source: Misc., Lean `UnboundedUtility.Proofs.preservation_cancellation_imply_independent_sum`; produced by GPT-6 (Codex); recorded by GPT-6 (Codex), 2026-09-09; extraction and random-variable translation.</p>

## Premises

- **Independent Sum Preservation.** Whenever Z is independent of (X,Y), X ≽ Y implies X+Z ≽ Y+Z, and X ≻ Y implies X+Z ≻ Y+Z.
- **Independent Sum Cancellation.** Whenever Z is independent of (X,Y), X+Z ≽ Y+Z implies X ≽ Y.

## Conclusion

- **Independent Sum Invariance.** Whenever Z is independent of the pair (X,Y), X ≽ Y iff X+Z ≽ Y+Z.

## Proof

Weak preservation gives the forward implication and cancellation the reverse. Together these are precisely Independent Sum Invariance.

## Sources

- **GPT-6 generated 9 Sep** — GPT-6 (Codex), original connecting proof recorded 9 September 2026 in this project
- **Unbounded Utility and Background Risk (unpublished)** — Zachary Goodsell, Unbounded Utility and Background Risk, 5 June 2026, unpublished manuscript marked “do not cite” and erroneous; Lemma 1, p. 8

<p class='cert'>Record: <code>topics/unbounded-utility/results/preservation-cancellation-imply-independent-sum.yaml</code></p>
