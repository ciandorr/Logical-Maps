# Mixture Independence and Shift Transfer imply Shift Invariance

**Claim.** Mixture Independence + Shift Transfer imply Shift Invariance.

Fix real-utility variables $X,Y$ and $b\in\mathbb R$ such that $X+b$ and $Y+b$ are available. Apply Shift Transfer with mixture weight $1/2$ and transfer parameter $b/2$, first to $(X,X)$ and then to $(Y,X)$:

$$M_{1/2}(X+b,X)\sim M_{1/2}(X,X+b),$$
$$M_{1/2}(Y+b,X)\sim M_{1/2}(Y,X+b).$$

Transitivity of the standing preorder lets an indifferent object replace either side of a weak comparison. Therefore

$$\begin{aligned}
X\succeq Y
&\iff M_{1/2}(X,X+b)\succeq M_{1/2}(Y,X+b)\\
&\iff M_{1/2}(X+b,X)\succeq M_{1/2}(Y+b,X)\\
&\iff X+b\succeq Y+b.
\end{aligned}$$

The first and last equivalences are exactly Mixture Independence, with common second arguments $X+b$ and $X$ respectively.

No branch interchange, independent copy, totality assumption or law identity occurs. Using $X$ as the common gamble also avoids assuming the availability of a new sure outcome at utility $b$: all transformations used were already stipulated to exist in this instance of Shift Invariance.

**Original work: direct consequence.** This is a two-application specialization followed by mixture cancellation. The choice of common gamble is the small domain check needed to avoid unnecessary outcome-richness assumptions. No literature novelty is asserted.

**Attribution.** GPT-6 (Codex), 9 September 2026, original connecting argument for this project. No independent checker or Lean proof is claimed.
