# Rich Outcomes ∧ Totality ∧ Mixture Independence ∧ Integer Affine Preservation ∧ Reflection Anti-Invariance ⇒ Uniqueness of Negative Self-Similarity (integer ratios)

<p class='cert'>Result — Source: Misc.; produced by Zachary Goodsell (observation that integer preservation with a negation anti-invariance suffices) and Claude (Fable 5.1) (proof), 2026-09-24; recorded by Claude (Fable 5.1), 2026-09-24.</p>

## Premises

- **Rich Outcomes.** Every real number r occurs as a utility level of a sure outcome: for each $r \in \mathbb{R}$ there is an outcome $o_r$ with $u(o_r)=r$, with u defined by the normalized binary-mixture comparisons in the background. This does not assert that every outcome has a finite real level.
- **Totality.** For all gambles X,Y, either $X \succeq Y$ or $Y \succeq X$.
- **Mixture Independence.** For all X,Y,Z and $0<p<1, X \succeq Y$ iff $M_p(X,Z) \succeq M_p(Y,Z)$, where M is the fixed randomized-selection construction described in the background.
- **Integer Affine Preservation.** For every positive integer $k$ and real $b$: if $X \succeq Y$ then $kX+b \succeq kY+b$, and if $X \succ Y$ then $kX+b \succ kY+b$.
- **Reflection Anti-Invariance.** $X \succeq Y$ iff $- Y \succeq - X$, using the one fixed normalized origin 0.

## Conclusion

- **Uniqueness of Negative Self-Similarity (integer ratios).** Fix $0<p<1$, a positive integer $a$, $b\in \mathbb{R}$ and Z. If $X \sim M_p(- aX+b,Z)$ and $Y \sim M_p(- aY+b,Z)$, then $X \sim Y$.

## Proof

Fix p, a positive integer a, b and Z, and write $T(V)=- aV+b$ and $F(V)=M_p(T(V),Z)$; Rich Outcomes supplies the intermediate gambles aV and $- aV$. If $V\succ W$, Integer Affine Preservation gives $aV\succ aW$, Reflection Anti-Invariance (applied to both weak directions) gives $- aW\succ - aV$, and Integer Affine Preservation with factor 1 gives $T(W)\succ T(V)$; Mixture Independence, applied to both weak directions with the common Z, gives $F(W)\succ F(V)$. So F reverses strict preference. If $X\sim F(X)$, $Y\sim F(Y)$ and $X\succ Y$, then $F(Y)\succ F(X)$ and the two indifferences give $Y\succ X$, a contradiction; the case $Y\succ X$ is symmetric. Totality leaves $X\sim Y$. This is the recorded argument of totality-independence-negative-affine-imply-self-similarity with its one use of Negative Affine Anti-Invariance replaced by preservation at the integer factor followed by reflection.

## Notes

Original connecting proof, a premise refinement of totality-independence-negative-affine-imply-self-similarity: the negative affine map is only ever applied at the ratio a of the fixed-point equation, and for integer a it factors as a positive integer map followed by the reflection, each of which need only preserve strict comparisons. With comonotonic-sum-implies-integer-affine-preservation, Comonotonic Sum Invariance can stand in for Integer Affine Preservation. Rich Outcomes is listed for the intermediate gambles aV and −aV, which the fixed-point hypotheses alone need not supply. No independent checker or Lean verification is claimed.

## Sources

- **Goodsell observation 24 Sep** — Zachary Goodsell, Logical Maps session, 24 September 2026: the observation that Integer Affine Preservation with a negation anti-invariance already gives the alternating St Petersburg evaluation and related results.
- **Claude proof 24 Sep** — Claude (Fable 5.1), Logical Maps, 24 September 2026: proof in topics/unbounded-utility/results/totality-independence-integer-affine-reflection-imply-integer-self-similarity.yaml (proof field), adapting the recorded reduced-premise argument.
- **Symmetries of Value** — Goodsell, Symmetries of value, Noûs 60 (2026), 16–37; DOI 10.1111/nous.12549, Theorem 10, pp. 30–31

<p class='cert'>Record: <code>topics/unbounded-utility/results/totality-independence-integer-affine-reflection-imply-integer-self-similarity.yaml</code></p>

## Paper references

- **Background: [Symmetries of value](https://doi.org/10.1111/nous.12549).** Zachary Goodsell (2026). Symmetries of value. Noûs, 60, 16–37. — Theorem 10, pp. 30–31
