# Rich Outcomes ∧ Simple Expected Utility ∧ Stochastic Dominance ∧ Archimedean Gambles ⇒ False (⊥)

<p class='cert'>Result — Source: Misc.; produced by Zachary Goodsell (St Petersburg argument); GPT-6 (Codex), explicit reduction of the sufficient premises; recorded by GPT-6 (Codex), 2026-09-09.</p>

## Premises

- **Rich Outcomes.** Every real number r occurs as a utility level of a sure outcome: for each $r \in \mathbb{R}$ there is an outcome $o_r$ with $u(o_r)=r$, with u defined by the normalized binary-mixture comparisons in the background. This does not assert that every outcome has a finite real level.
- **Simple Expected Utility.** The normalized real utility chart u is defined on every outcome, is measurable, and ranks every pair of simple random variables exactly by finite expected utility: $X \succeq Y$ iff $E[u(X)] \ge E[u(Y)]$. Surjectivity of u is not included here.
- **Stochastic Dominance.** If $P(X>o) \ge P(Y>o)$ for every outcome threshold o, then $X \succeq Y$; if one threshold inequality is strict, $X \succ Y$. Thresholds use the sure-outcome order.
- **Archimedean Gambles.** For any gambles $X \succ Y \succ Z$, there is $p \in (0,1)$ with $Y \sim M_p(X,Z)$. Unlike Archimedean Outcomes, X,Y,Z may themselves be unbounded gambles.

## Conclusion

- **False (⊥).** These premises cannot all hold together.

## Proof

Let S take utility $2^{n}$ with probability $2^{-n}$ for $n\ge 1$. Rich Outcomes and standing prospect richness supply S, its finite truncations $T_N=\min (S,2$ᴺ), and the required mixtures. For $N\ge 1, E[T_N]=N+1$. By Simple $\operatorname{EU}, T_N$ is indifferent to the sure utility $N+1$. Stochastic Dominance gives $S \succeq T_N$, hence $S \succ c$ for every real c by choosing $N+1>c$. Thus $S \succ 1 \succ 0$. Fix any $p\in (0,1)$ and choose N with $p(N+1)>1$. The mixture $M_p(S,0)$ stochastically dominates the finite-valued mixture $M_p(T_N,0)$, which Simple EU makes indifferent to the sure utility $p(N+1)>1$. Therefore $M_p(S,0) \succ 1$ for every $p\in (0,1)$. Archimedean Gambles would require one such mixture to be indifferent to 1, a contradiction. Only the standing preorder is used to compose these comparisons; no Totality or Mixture Independence is required.

## Notes

This is the existing Goodsell argument with its sufficient assumptions made explicit, not a new counterexample. The original source-attributed DTU result is retained unchanged. Stochastic Equivalence follows from this topic’s dominance axiom, but is not separately needed in the displayed proof. Relative to these assumptions, Archimedean Gambles is ruled out; adding it to the background yields False.

## Sources

- **GPT-6 premise audit 9 Sep** — GPT-6 (Codex), project premise audit, 9 September 2026: the St Petersburg proof recorded in dtu-refutes-archimedean-gambles uses only Rich Outcomes, Simple EU, and Stochastic Dominance. This record makes that sufficient subpackage explicit.
- **Symmetries of Value** — Zachary Goodsell, Symmetries of value, Noûs 60 (2026), 16–37; DOI 10.1111/nous.12549, §3, p. 22: St Petersburg obstruction to Archimedean Gambles.

<p class='cert'>Record: <code>topics/unbounded-utility/results/rich-simple-dominance-refutes-archimedean-gambles.yaml</code></p>

## Paper references

- **Background: [Symmetries of value](https://doi.org/10.1111/nous.12549).** Zachary Goodsell (2026). Symmetries of value. Noûs, 60, 16–37. — §3, p. 22: St Petersburg obstruction to Archimedean Gambles
