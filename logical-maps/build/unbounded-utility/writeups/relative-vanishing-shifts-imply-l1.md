# Rich Outcomes ∧ Relative Expectation ∧ Continuity under Vanishing Shifts ⇒ L¹ Continuity (random variables)

<p class='cert'>Result — Source: Misc.; produced by GPT-6 (Codex); recorded by GPT-6 (Codex), 2026-09-09.</p>

## Premises

- **Rich Outcomes.** Every real number r occurs as a utility level of a sure outcome: for each $r \in \mathbb{R}$ there is an outcome $o_r$ with $u(o_r)=r$, with u defined by the normalized binary-mixture comparisons in the background. This does not assert that every outcome has a finite real level.
- **Relative Expectation.** For real-utility variables X,Y on the same probability space, if $E|u(X)- u(Y)|<\infty$, then $X \succeq Y$ iff $E[u(X)- u(Y)] \ge 0$. Their individual expectations may both be undefined.
- **Continuity under Vanishing Shifts.** For real-utility variables X,Y, if $X+\epsilon \succeq Y$ for every $\epsilon >0$, then $X \succeq Y$. The shifts act on utility levels, and all the displayed variables must be available. Only this upper-section closure condition is imposed.

## Conclusion

- **L¹ Continuity (random variables).** On variables with real utility levels, if $E|u(X_n)- u(X)| \to 0$ and $X_n \succeq Y$ for every n, then $X \succeq Y$. Only the upper-section clause is imposed, matching the paper. Distance can be infinite between other pairs.

## Proof

Suppose $E|u(X_n)- u(X)|$ tends to zero and $X_n \succeq Y$ for every n. Fix $\epsilon >0$. Rich Outcomes supplies $X+\epsilon$ in the real utility chart. For a sufficiently large n, the actual difference $(X+\epsilon )- X_n$ is integrable and has expectation at least $\epsilon - E|u(X_n)- u(X)|>0$. Relative Expectation applied in both directions gives $X+\epsilon \succ X_n$, so transitivity gives $X+\epsilon \succeq Y$. This holds for every $\epsilon >0$. Continuity under Vanishing Shifts yields $X \succeq Y$, exactly the recorded upper-section L1 Continuity clause. Neither transporting a preference by a shift nor closing a lower section is required.

## Notes

Original work: short positive-buffer argument. With Rich Outcomes and Relative Expectation, Continuity under Vanishing Shifts and L1 Continuity are equivalent, using the separately recorded reverse implication. The proof concerns actual coupled utility differences and assumes neither Totality nor Stochastic Equivalence nor Shift Invariance. This describes the work performed for the map, not literature priority.

## Sources

- **GPT-6 connecting proof 9 Sep** — GPT-6 (Codex), 9 September 2026, original connecting proof in the Logical Maps investigation of the CDF-area model and weak continuity.

<p class='cert'>Record: <code>topics/unbounded-utility/results/relative-vanishing-shifts-imply-l1.yaml</code></p>
