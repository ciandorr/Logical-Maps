# Full Sum Invariance ⇒ Independent Sum Invariance

<p class='cert'>Result — Source: Misc., Lean `UnboundedUtility.Proofs.full_sum_implies_independent`; produced by GPT-6 (Codex); recorded by GPT-6 (Codex), 2026-09-09; extraction and random-variable translation.</p>

## Premises

- **Full Sum Invariance.** For all X,Y,Z, with arbitrary dependence, $X \succeq Y$ iff $X+Z \succeq Y+Z$.

## Conclusion

- **Independent Sum Invariance.** Whenever Z is independent of the pair $(X,Y), X \succeq Y$ iff $X+Z \succeq Y+Z$.

## Proof

Restrict the universal quantifier over X,Y,Z to triples satisfying the stated dependence condition. Both directions of the same biconditional remain available.

## Sources

- **GPT-6 generated 9 Sep** — GPT-6 (Codex), original connecting proof recorded 9 September 2026 in this project
- **Unbounded Utility and Background Risk (unpublished)** — Zachary Goodsell, Unbounded Utility and Background Risk, 5 June 2026, unpublished manuscript marked “do not cite” and erroneous; §6.1–2, pp. 17–18

<p class='cert'>Record: <code>topics/unbounded-utility/results/full-sum-implies-independent.yaml</code></p>

## Paper references

- **Background: Unbounded Utility and Background Risk.** Zachary Goodsell (5 June 2026). Unbounded Utility and Background Risk. Unpublished working manuscript. — §6.1–2, pp. 17–18
- **Background: [Flummoxing expectations](https://doi.org/10.1111/nous.12530).** Hayden Wilkinson (2025). Flummoxing expectations. Noûs, 59(3), 700–728. First published online in 2024. — §6.1. Source of Independent Sum Consistency; see the principle reference for the changed independence condition. The proof or conjecture recorded here retains its separate attribution.
- **Related: [Preference for equivalent random variables: A price for unbounded utilities](https://doi.org/10.1016/j.jmateco.2008.12.002).** Seidenfeld, T., Schervish, M., & Kadane, J. (2009). Preference for equivalent random variables: A price for unbounded utilities. Journal of Mathematical Economics, 45, 329–340. — §1. Related coherence treatment of unbounded random variables; this is not an attribution of the recorded implication to the paper.
