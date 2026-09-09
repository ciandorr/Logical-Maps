# Does DTU plus Shift Invariance imply Shift Transfer?

**Status: unresolved question in this map.** The implication is entered as
conjectured so that it appears in the Conjectures tab. No proof or separating
model is claimed, and the entry expresses neither confidence in its truth nor
a claim that the literature has left it open.

The question was formulated by GPT-6 (Codex), 9 September 2026. The principles
and the stronger affine-symmetry derivations are Zachary Goodsell's
*Symmetries of value*, Theorems 3–4, pp. 25–27; the paper is not attributed
this reduced-premise conjecture. Original work here consists of identifying
the precise remaining gap and checking the available model families.

With all six DTU axioms assumed, does

\[
X\succeq Y\quad\Longleftrightarrow\quad X+b\succeq Y+b
\quad\text{for every real }b
\]

already force

\[
M_p(X+b/p,Y)\sim M_p(X,Y+b/(1-p))
\quad(0<p<1)?
\]

Under DTU, the recorded implications make the latter equivalent to Simple
Relative Expectation, so the question can equally be read as whether a
common-shift symmetry determines comparisons under every simple pointwise
perturbation.

Two additional hypotheses settle it:

- **Symmetric Neutrality:** the new
  [neutrality-and-shift proof](neutrality-shift-imply-shift-transfer.md)
  centers paired laws, then cancels a common mixture branch. Scale Invariance
  is unnecessary, but the neutral value of the centered laws is essential
  to that proof.
- **L¹ Continuity:** DTU plus L¹ Continuity gives Expected Utility, and the
  [conditional-truncation proof](eu-independence-l1-imply-relative.md) then
  gives Relative Expectation. That implies Simple Relative Expectation and
  Shift Transfer, even without a prior shift-symmetry assumption.

A countermodel must therefore fail **both** Symmetric Neutrality and L¹
Continuity. The symmetric and asymmetric continuous clipping models already
satisfy Relative Expectation and so cannot separate the question. The
[Folded-tail cone: lexicographic extension](lexicographic-folded-extension.md) does fail
L¹ Continuity, but retains neutrality and Relative Expectation, so it also
satisfies transfer. The exact clipping records do not establish the required
Shift Invariance and cannot simply be claimed as counterexamples.

To settle the entry positively, one must derive the transfer equality without
using either supplementary hypothesis. To settle it negatively, one must
verify a model of all six DTU axioms and Shift Invariance, and exhibit particular
\(X,Y,b,p\) for which the displayed transfer indifference fails. A failure of
one attempted proof, or an unverified model flag, would not suffice.
