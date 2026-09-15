# Rich Outcomes ∧ Folded Expectation ⇒ Symmetric Gambles Are Neutral

<p class='cert'>Result — Source: Symmetries of Value; produced by Zachary Goodsell (cited paper); recorded by GPT-6 (Codex), 2026-09-08; transcription and random-variable formulation.</p>

## Premises

- **Rich Outcomes.** Every real number r occurs as a utility level of a sure outcome: for each $r \in \mathbb{R}$ there is an outcome $o_r$ with $u(o_r)=r$, with u defined by the normalized binary-mixture comparisons in the background. This does not assert that every outcome has a finite real level.
- **Folded Expectation.** Put $h_X(t)=P(u(X)>t)- P(u(X)<- t)$ for $t\ge 0$. If $\int _0^{\infty }|h_X(t)|dt$ and $\int _0^{\infty }|h_Y(t)|dt$ are finite, compare X,Y exactly by $F(X)=\int _0^{\infty }h_X(t)dt$ and $F(Y)$. Boundary atoms do not change these integrals.

## Conclusion

- **Symmetric Gambles Are Neutral.** If $u(X)$ and $- u(X)$ have the same law, then $X \sim 0$.

## Proof

For a symmetric real $\operatorname{law}, h_X(t)=0$ almost everywhere, so $F(X)=0$. The zero constant also has folded value zero; apply Folded Expectation.

## Notes

Source-based result or immediate restriction/composition. Premises are sufficient; minimality is not claimed. The direct source is recorded separately from the transcription; no translation checker is asserted.

## Sources

- **Symmetries of Value** — Goodsell, Symmetries of value, Noûs 60 (2026), 16–37; DOI 10.1111/nous.12549, §4, pp. 27–28

<p class='cert'>Record: <code>topics/unbounded-utility/results/folded-implies-symmetric-neutrality.yaml</code></p>

## Paper references

- **Proof: [Symmetries of value](https://doi.org/10.1111/nous.12549).** Zachary Goodsell (2026). Symmetries of value. Noûs, 60, 16–37. — §4, pp. 27–28
