# Rich Outcomes ∧ Rational Scale Invariance ∧ Shift Invariance ⇒ Rational Affine Preservation

<p class='cert'>Result — Source: Misc.; produced by Claude (Fable 5.1), 2026-09-24; recorded by Claude (Fable 5.1), 2026-09-24.</p>

## Premises

- **Rich Outcomes.** Every real number r occurs as a utility level of a sure outcome: for each $r \in \mathbb{R}$ there is an outcome $o_r$ with $u(o_r)=r$, with u defined by the normalized binary-mixture comparisons in the background. This does not assert that every outcome has a finite real level.
- **Rational Scale Invariance.** For every rational $a>0, X \succeq Y$ iff $aX \succeq aY$.
- **Shift Invariance.** For every real $b, X \succeq Y$ iff $X+b \succeq Y+b$.

## Conclusion

- **Rational Affine Preservation.** For every rational $a>0$ and real $b$: if $X \succeq Y$ then $aX+b \succeq aY+b$, and if $X \succ Y$ then $aX+b \succ aY+b$.

## Proof

For rational $a>0$ and real b, Rational Scale Invariance gives $X \succeq Y$ iff $aX \succeq aY$, and Shift Invariance gives $aX \succeq aY$ iff $aX+b \succeq aY+b$; Rich Outcomes supplies the intermediate gambles $aX, aY$. Applying both biconditionals to $X \succeq Y$ and to $Y \succeq X$ preserves the weak comparison and, by reversing the second, the strict one.

## Notes

Immediate composition. Premises are sufficient; minimality is not claimed. No translation checker is asserted.

## Sources

- **Claude generated 24 Sep** — Claude (Fable 5.1), 2026-09-24: elementary composition recorded in topics/unbounded-utility/results/rational-scale-shift-imply-rational-affine-preservation.yaml (proof field), following the pattern of shift-scale-imply-positive-affine.
- **Symmetries of Value** — Goodsell, Symmetries of value, Noûs 60 (2026), 16–37; DOI 10.1111/nous.12549, §3, p. 24

<p class='cert'>Record: <code>topics/unbounded-utility/results/rational-scale-shift-imply-rational-affine-preservation.yaml</code></p>

## Paper references

- **Background: [Symmetries of value](https://doi.org/10.1111/nous.12549).** Zachary Goodsell (2026). Symmetries of value. Noûs, 60, 16–37. — §3, p. 24
