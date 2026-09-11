# Symmetric neutrality and shifts suffice for transfer across mixtures

**Source and work accounting.** The paired-reflection argument is Zachary
Goodsell's *Symmetries of value*, Theorem 3, pp. 25–26. The contribution here is
a small premise reduction and an explicit cancellation proof, recorded by GPT-6
(Codex), 9 September 2026. No independent checker or Lean certification is asserted.

Assume Rich Outcomes, Stochastic Equivalence, Simple EU, Mixture Independence,
Symmetric Neutrality and Shift Invariance. Totality and Scale Invariance are
not used. Work in the normalized real utility chart.

For a gamble $X$ and real $c$, the law of

\[
M_{1/2}(X+c/2,-X-c/2)
\]

is symmetric. Neutrality makes this gamble indifferent to zero. Shift both
outcomes by $c/2$. Shift Invariance, followed by Stochastic Equivalence to
identify the resulting fixed-lift realization, gives

\[
M_{1/2}(X+c,-X)\sim c/2. \tag{1}
\]

Fix $0<p<1$ and $b\in\mathbb R$, and put

\[
L=M_p(X+b/p,Y),\qquad R=M_p(X,Y+b/(1-p)).
\]

The law of $M_{1/2}(L,-R)$ can be regrouped as

\[
M_p\left(
 M_{1/2}(X+b/p,-X),
 M_{1/2}(Y,-Y-b/(1-p))
\right).
\]

By (1), the two inner mixtures are indifferent to $b/(2p)$ and

\[
-\frac{b}{2(1-p)},
\]

respectively. Mixture Independence propagates these indifferences; Simple EU
makes their outer mixture indifferent to zero, since its expectation is

\[
p\frac{b}{2p}+(1-p)\frac{-b}{2(1-p)}=0.
\]

Consequently $M_{1/2}(L,-R)\sim0$. Symmetric Neutrality also gives

\[
M_{1/2}(R,-R)\sim0.
\]

Transitivity of indifference and Mixture Independence cancel the common

\[
-R
\]

branch and yield $L\sim R$, which is Shift Transfer. Every regrouping above
is an identity of laws and uses Stochastic Equivalence before being used as
a preference identity. Rich Outcomes supplies the finite constants and all
the displayed translations.

Under DU this gives a useful sufficient route to Simple Relative Expectation:
Symmetric Neutrality plus Shift Invariance suffice. The source theorem's full
negative-affine package already supplies them, but its scale component is not
needed for this conclusion. This is an account of work performed for the map,
not a claim of priority in the literature.

## Paper references

- **Background: [Symmetries of value](https://doi.org/10.1111/nous.12549).** Zachary Goodsell (2026). Symmetries of value. Noûs, 60, 16–37. — Theorem 3, pp. 25–26: paired-reflection and centering argument
