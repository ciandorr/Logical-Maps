# Clipped expectation: continuous ultrafilter dominance

Source: Goodsell, *Decision theory unbound*, Appendix B, Lemma 6 and proof
of Theorem 3 (p. 691), Theorems 7, 8, and 10 (pp. 693–695).
Human model: Zachary Goodsell. Recorded and translated by GPT-6 (Codex);
no transcription checker asserted.

With U and v_X as in the exact-ultrafilter model, define

$$X\succeq Y\quad\Longleftrightarrow\quad
\text{for every }\varepsilon>0,
\{t:v_X(t)\ge v_Y(t)-\varepsilon\}\in\mathcal U.$$

This quotients out infinitesimal errors in the ultrafilter comparison.
Reflexivity and transitivity follow using ε/2 in each premise and intersecting
sets. If X is not at least as good as Y, some positive ε gives a U-large
set where Y exceeds X by ε, which implies Y≻X. This proves Totality.
The affine mixture formula for v_X gives Independence after rescaling ε.
Equal laws give equality. Constants and simple variables stabilize, giving
Rich Outcomes and Simple EU. A strict stochastic dominance comparison gives
a fixed positive gap for all sufficiently large t, and so remains strict
after taking this quotient. Thus the model satisfies DTU.

For integrable X, v_X(t)→E[X] by dominated convergence. Hence two integrable
variables are compared exactly by their finite expectations, including
indifference when those expectations agree. This proves EU, the purpose of
the continuous quotient in the source's Theorem 3.

Reflection negates clipped expectation exactly. For any fixed b,

$$c_t(X+b)-c_t(X)\longrightarrow b,\qquad
|c_t(X+b)-c_t(X)|\le |b|.$$

Dominated convergence gives v_(X+b)(t)-v_X(t)→b, even for nonintegrable X.
Simultaneously shifting X and Y therefore changes their truncated comparison
by a function tending to zero, which the quotient ignores. This proves Shift
Invariance. Reflection and shift do **not** establish scale invariance.

The failed scale flag applies the source's Theorem 10 to this continuous
ultrafilter construction. Its witness and proof-audit limitation are described
in the exact-ultrafilter write-up and `extraction.md`. Thus this is a
source-attributed witness that DTU + EU + shift + reflection does not entail
positive affine invariance. The two St Petersburg arguments establish failure
of Countable Sure-Thing and Archimedean Gambles here as well.

No L¹ Continuity or Relative Expectation flag is inferred from the name
"continuous": the quotient construction and the topic's closure axiom are
different mathematical claims.
