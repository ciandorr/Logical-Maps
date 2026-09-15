# Clipped expectation: exact ultrafilter dominance

Source: Goodsell, *Decision theory unbound*, Appendix B, Theorems 1, 3,
and 10. Human model: Zachary Goodsell.
Recorded and translated by GPT-6 (Codex); no transcription checker asserted.

Take all real-valued random variables. Let U be an ultrafilter on positive
truncation levels containing every tail $(s,\infty )$. Define $v_X(t)=E[c_t(X)]$
as in the eventual-clipping write-up and set

$$X\succeq Y\quad\Longleftrightarrow\quad
\{t:v_X(t)\ge v_Y(t)\}\in\mathcal U.$$

Reflexivity holds because the entire domain is in U; finite intersections
prove transitivity; the ultrafilter dichotomy proves Totality. The ordering
extends eventual weak comparisons and eventual strictly positive gaps.
Thus its law invariance, Simple EU, richness, and stochastic dominance follow
from the calculations for clipped expectations. Common mixture components
cancel pointwise before taking the ultrafilter, giving Independence.
Reflection negates $v_X$ exactly, giving reflection anti-invariance. These
properties give the DTU package in the topic's random-variable language.

The geometric N from the accompanying eventual model has expectation 2, but
$v_N(t)$<2 for every finite t>2. Therefore N is strictly worse than 2 on this
total ordering as well. This establishes failure of EU, exactly as the source's
Theorem 3 notes. The Countable Sure-Thing and Archimedean Gambles violations
follow from the recorded St Petersburg arguments.

**Scale failure is a source theorem application.** Goodsell's Theorem 10
(pp. 693–695) states that every total ordering constructed in this way fails
Scale Invariance. Its argument uses a pair of attainable clipped-expectation
curves whose difference oscillates in log scale, reverses sign on a doubling
of the truncation parameter, and cannot be neutralized simultaneously in both
phases by an ultrafilter. Apply that theorem to the U just chosen. This does
not assert that all total DTU models fail scale: the 2026 paper constructs
models that satisfy it.

The printed analytic witness has the notation/endpoint issues documented in
`extraction.md`. This model record accepts the published theorem for the scale
flag; it does not claim an independently checked correction of that entire
witness. The explicit EU counterexample and elementary satisfied-axiom
calculations above do not depend on those issues.
