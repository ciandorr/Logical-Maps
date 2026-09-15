# Comonotonic Sum Invariance ⇒ Shift Invariance

<p class='cert'>Result — Source: Misc.; produced by GPT-6 (Codex); recorded by GPT-6 (Codex), 2026-09-09; extraction and random-variable translation.</p>

## Premises

- **Comonotonic Sum Invariance.** If X and Z are comonotonic, and Y and Z are comonotonic, then $X \succeq Y$ iff $X+Z \succeq Y+Z$. A pair is comonotonic when its members admit nondecreasing representations in one common uniform random variable.

## Conclusion

- **Shift Invariance.** For every real $b, X \succeq Y$ iff $X+b \succeq Y+b$.

## Proof

Choose Z to be the constant utility b. A constant is independent of every pair and is both comonotonic and antitonic with every variable, so the sum biconditional becomes $X \succeq Y$ iff $X+b \succeq Y+b$. Apply this wherever the shifted outcomes exist.

## Sources

- **GPT-6 generated 9 Sep** — GPT-6 (Codex), original connecting proof recorded 9 September 2026 in this project
- **Unbounded Utility and Background Risk (unpublished)** — Zachary Goodsell, Unbounded Utility and Background Risk, 5 June 2026, unpublished manuscript marked “do not cite” and erroneous; §6.2, p. 18; definitions on pp. 3–4

<p class='cert'>Record: <code>topics/unbounded-utility/results/comonotonic-sum-implies-shift.yaml</code></p>

## Paper references

- **Background: Unbounded Utility and Background Risk.** Zachary Goodsell (5 June 2026). Unbounded Utility and Background Risk. Unpublished working manuscript. — §6.2, p. 18; definitions on pp. 3–4
