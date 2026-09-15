# Shift Transfer recovers Simple Relative Expectation

**Claim.** Rich Outcomes + Stochastic Equivalence + Simple $\operatorname{EU} +$ Mixture Independence + Shift Transfer imply Simple Relative Expectation.

Use numerical utility notation throughout. Suppose $D=X-Y$ has finitely many values. Ignore probability-zero values, and write its remaining values as $d_1,\ldots,d_k$, with probabilities $p_1,\ldots,p_k>0$. Rich Outcomes supplies a sure outcome for each $d_i$ and the simple gamble with utility variable $D$.

For each $i$, choose $Y_i$ with the conditional law of $Y$ given $D=d_i$. Such real-valued laws can be realized on the standing atomless standard probability space. The corresponding conditional law of $X$ is that of $Y_i+d_i$. In particular, by laws,

$$\mathcal L\bigl(M_{1/2}(X,0)\bigr)
=\sum_{i=1}^k p_i\,\mathcal L\bigl(M_{1/2}(Y_i+d_i,0)\bigr).$$

Shift Transfer, with transfer parameter $d_i/2$, gives

$$M_{1/2}(Y_i+d_i,0)\sim M_{1/2}(Y_i,d_i).$$

Mixture Independence propagates indifferences through a finite randomized mixture. To justify replacement in a second branch, first exchange branches using Stochastic Equivalence, apply Independence, and exchange back. Iterating over a binary realization of the finite mixture therefore gives

$$M_{1/2}(X,0)\sim M_{1/2}(Y,D). \tag{1}$$

Here the law of the mixture after all replacements is

$$\sum_i p_i\left(\tfrac12\mathcal L(Y_i)+\tfrac12\delta_{d_i}\right)
=\tfrac12\mathcal L(Y)+\tfrac12\mathcal L(D),$$

which is precisely the law on the right of (1). Stochastic Equivalence licenses both law identities, and so also disposes of the ignored null values.

We can now cancel mixtures:

$$\begin{aligned}
X\succeq Y
&\iff M_{1/2}(X,0)\succeq M_{1/2}(Y,0)\\
&\iff M_{1/2}(Y,D)\succeq M_{1/2}(Y,0)\\
&\iff D\succeq0\\
&\iff\mathbb E D\geq0.
\end{aligned}$$

The first equivalence is Independence. The second uses (1) and the preorder. The third exchanges branches by Stochastic Equivalence and applies Independence with common second argument $Y$. The final equivalence is Simple EU applied to the simple gamble $D$ and sure zero.

No Totality, Stochastic Dominance, reflection or scaling principle is needed. Conditional laws are only a proof construction: every preference replacement of a same-law variable is explicitly licensed by Stochastic Equivalence. Rich Outcomes ensures availability of the newly formed numerical outcomes and does not serve as a hidden total-chart assumption.

**Original work: proof adaptation.** This is Goodsell's finite-shift redistribution argument from Theorem 4, reorganized to identify its actual sufficient premises. The source's use of affine symmetry enters through Shift Transfer, which is now exposed as a separate input. No literature novelty is asserted.

**Attribution.** Original argument: Zachary Goodsell, *Symmetries of value*, Theorem 4, pp. 26–27. Reduced-premise formulation and random-variable audit: GPT-6 (Codex), 9 September 2026. No independent checker or Lean proof is claimed.
