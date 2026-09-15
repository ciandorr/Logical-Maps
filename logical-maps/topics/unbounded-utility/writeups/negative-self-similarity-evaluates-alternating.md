# Negative Self-Similarity evaluates Alternating St Petersburg

**Claim.** Rich Outcomes + Stochastic Equivalence + Simple $\operatorname{EU} +$ Uniqueness of Negative Self-Similarity imply Alternating St Petersburg $=-1/2$.

Let $A$ be any gamble with

$$\mathbb P\bigl(u(A)=(-2)^n\bigr)=2^{-n},\qquad n\geq1.$$

Use numerical utility notation. Multiplication by $-2$ moves the $n$th atom to the $(n+1)$st value. Consequently

$$\mathcal L(A)=\mathcal L\bigl(M_{1/2}(-2A,-2)\bigr).$$

Indeed, the sure branch gives the first atom $-2$ probability $1/2$, and the transformed branch gives each value $(-2)^m$, $m\geq2$, probability $\frac12\,2^{-(m-1)}=2^{-m}$. Stochastic Equivalence therefore yields

$$A\sim M_{1/2}(-2A,-2). \tag{1}$$

Let $c$ be sure utility $-1/2$. Its corresponding mixture is

$$M_{1/2}(-2c,-2)=M_{1/2}(1,-2),$$

which is simple and has expected utility $-1/2$. Simple EU gives

$$c\sim M_{1/2}(-2c,-2). \tag{2}$$

Equations (1) and (2) are two instances of the same fixed-point equation with $p=1/2$, $a=2$, $b=0$ and $Z$ sure $-2$. Uniqueness of Negative Self-Similarity therefore implies $A\sim c$, which is the desired evaluation.

Rich Outcomes ensures the availability of the sure values and transformed variables. The proof uses no finite expectation for $A$, and it does not need Totality, Mixture Independence, Stochastic Dominance or affine invariance as additional assumptions.

**Original work: proof adaptation.** The new connection factors the source's alternating-prospect evaluation through its separately recorded uniqueness principle. The only calculation is the displayed one-step distributional recursion and the simple fixed point. No literature novelty is asserted.

**Attribution.** The evaluation and uniqueness principles are from Zachary Goodsell, *Symmetries of value*, Theorems 9–10, pp. 30–31. Their reduced-premise connection was recorded by GPT-6 (Codex), 9 September 2026. No independent checker or Lean proof is claimed.
