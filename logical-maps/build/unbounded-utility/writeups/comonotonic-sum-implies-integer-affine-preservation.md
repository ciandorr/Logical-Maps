# Rich Outcomes ∧ Stochastic Equivalence ∧ Comonotonic Sum Invariance ⇒ Integer Affine Preservation

<p class='cert'>Result — Source: Misc.; produced by Zachary Goodsell (iterated-addition argument) and Claude (Fable 5.1) (comonotonic copies and strict chain), 2026-09-24; recorded by Claude (Fable 5.1), 2026-09-24.</p>

## Premises

- **Rich Outcomes.** Every real number r occurs as a utility level of a sure outcome: for each $r \in \mathbb{R}$ there is an outcome $o_r$ with $u(o_r)=r$, with u defined by the normalized binary-mixture comparisons in the background. This does not assert that every outcome has a finite real level.
- **Stochastic Equivalence.** If X and Y have the same probability law over outcomes, then $X \sim Y$. The variables remain distinct objects; indifference is an additional axiom.
- **Comonotonic Sum Invariance.** If X and Z are comonotonic, and Y and Z are comonotonic, then $X \succeq Y$ iff $X+Z \succeq Y+Z$. A pair is comonotonic when its members admit nondecreasing representations in one common uniform random variable.

## Conclusion

- **Integer Affine Preservation.** For every positive integer $k$ and real $b$: if $X \succeq Y$ then $kX+b \succeq kY+b$, and if $X \succ Y$ then $kX+b \succ kY+b$.

## Proof

Shifts: with the constant $Z=b$, comonotonic with everything, Comonotonic Sum Invariance gives $X \succeq Y$ iff $X+b \succeq Y+b$, so weak and strict comparisons pass to shifts; it remains to treat $kX$ against $kY$. By Stochastic Equivalence replace Y by its comonotonic copy $Y^\dagger=Q_Y(U)$ on a uniform U with $X=Q_X(U)$; the comparisons $X \succeq Y$, $Y \succeq X$, $kX \succeq kY$ and $kY \succeq kX$ are unchanged. Put $W_j=jX+(k-j)Y^\dagger$ for $0\le j\le k$ (Rich Outcomes). Since $W_{j+1}=X+Z_j$ and $W_j=Y^\dagger+Z_j$ with $Z_j=jX+(k-j-1)Y^\dagger$ a nondecreasing function of U, comonotonic with both, the invariance gives $W_{j+1}\succeq W_j$ iff $X\succeq Y$, and $W_j\succeq W_{j+1}$ iff $Y\succeq X$. If $X\succeq Y$, chaining $W_k\succeq W_{k-1}\succeq\dots\succeq W_0$ gives $kX\succeq kY$. If moreover $Y\not\succeq X$ and $kY\succeq kX$ held, then $W_0\succeq W_k\succeq W_1$ would give $W_0\succeq W_1$, that is $Y\succeq X$, a contradiction; so $kX\succ kY$. This is Lemma 1 of writeups/comonotonic-sum-totality-imply-rational-scale.md, which also records the two standard facts used: every X is $Q_X(U)$ for some uniform U on the atomless space, and sums of nondecreasing functions of U are comonotonic with their summands.

## Notes

Original connecting proof; neither Totality nor Mixture Independence is used, so the result holds under DU and under any background with these three premises. Cancellation is not claimed: kX ≽ kY does not give X ≽ Y here (cdf-area-unit-threshold), which is why fractional factors, Rational Affine Preservation, need more. The recorded models that fail Scale Invariance all do so by a doubling that reverses a strict comparison, so each fails this principle, and with Rich Outcomes and Stochastic Equivalence the contrapositive shows each fails Comonotonic Sum Invariance. No independent checker or Lean verification is claimed.

## Sources

- **Goodsell argument 24 Sep** — Zachary Goodsell, Logical Maps session, 24 September 2026: the doubling argument 2A = A + A ≽ B + A ≽ B + B = 2B and the request to record preservation of weak and strict order under positive rational affine maps.
- **Claude proof 24 Sep** — Claude (Fable 5.1), Logical Maps, 24 September 2026: comonotonic-copy reduction and strict chain, §§2–3 of writeups/comonotonic-sum-totality-imply-rational-scale.md.
- **Unbounded Utility and Background Risk (unpublished)** — Zachary Goodsell, Unbounded Utility and Background Risk, 5 June 2026, unpublished manuscript marked “do not cite” and erroneous; §6.2, p. 18; definitions on pp. 3–4

<p class='cert'>Record: <code>topics/unbounded-utility/results/comonotonic-sum-implies-integer-affine-preservation.yaml</code></p>

## Paper references

- **Background: Unbounded Utility and Background Risk.** Zachary Goodsell (5 June 2026). Unbounded Utility and Background Risk. Unpublished working manuscript. — §6.2, p. 18; definitions on pp. 3–4
