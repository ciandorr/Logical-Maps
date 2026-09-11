# L¹ Continuity (random variables) ⇒ Continuity under Vanishing Shifts

<p class='cert'>Result — Source: Misc., Lean `UnboundedUtility.Proofs.l1_implies_vanishing_shift_continuity`; produced by GPT-6 (Codex); recorded by GPT-6 (Codex), 2026-09-09.</p>

## Premises

- **L¹ Continuity (random variables).** On variables with real utility levels, if E|u(X_n)−u(X)| → 0 and X_n ≽ Y for every n, then X ≽ Y. Only the upper-section clause is imposed, matching the paper. Distance can be infinite between other pairs.

## Conclusion

- **Continuity under Vanishing Shifts.** For real-utility variables X,Y, if X+ε ≽ Y for every ε>0, then X ≽ Y. The shifts act on utility levels, and all the displayed variables must be available. Only this upper-section closure condition is imposed.

## Proof

Suppose all the eligible positive shifts X+ε satisfy X+ε ≽ Y. Use the actual coupling X_n=X+1/n. Its expected absolute utility difference from X is exactly 1/n, tending to zero. Upper-section L1 Continuity therefore yields X ≽ Y. No shift invariance, law replacement, or lower-section continuity is used.

## Notes

Original work: immediate axiom restriction. This records the comparison between continuity conditions, not a claim of literature novelty.

## Sources

- **GPT-6 direct deduction 9 Sep** — GPT-6 (Codex), 9 September 2026, direct restriction of the recorded upper-section L1 Continuity axiom to constant-shift sequences in Logical Maps.

<p class='cert'>Record: <code>topics/unbounded-utility/results/l1-implies-vanishing-shift-continuity.yaml</code></p>
