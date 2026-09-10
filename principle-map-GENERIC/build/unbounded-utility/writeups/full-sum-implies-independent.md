# Full Sum Invariance ⇒ Independent Sum Invariance

<p class='cert'>Result — Source: Misc., Lean `UnboundedUtility.Proofs.full_sum_implies_independent`; produced by GPT-6 (Codex); recorded by GPT-6 (Codex), 2026-09-09; extraction and random-variable translation.</p>

## Premises

- **Full Sum Invariance.** For all X,Y,Z, with arbitrary dependence, X ≽ Y iff X+Z ≽ Y+Z.

## Conclusion

- **Independent Sum Invariance.** Whenever Z is independent of the pair (X,Y), X ≽ Y iff X+Z ≽ Y+Z.

## Proof

Restrict the universal quantifier over X,Y,Z to triples satisfying the stated dependence condition. Both directions of the same biconditional remain available.

## Sources

- **GPT-6 generated 9 Sep** — GPT-6 (Codex), original connecting proof recorded 9 September 2026 in this project
- **Unbounded Utility and Background Risk (unpublished)** — Zachary Goodsell, Unbounded Utility and Background Risk, 5 June 2026, unpublished manuscript marked “do not cite” and erroneous; §6.1–2, pp. 17–18

<p class='cert'>Record: <code>topics/unbounded-utility/results/full-sum-implies-independent.yaml</code></p>
