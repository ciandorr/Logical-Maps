# Does DTU plus Shift Invariance imply Shift Transfer?

**Recorded countermodel, 13 September 2026.**
[Stochastic dominance: finite-shift total extension](finite-shift-total-extension.html)
satisfies every premise below and strictly orders a pair that Shift Transfer
requires to be indifferent. It therefore refutes the implication under its
stated premises. The original conjecture ID, statement, and conjectured
status are retained; the Conjectures tab computes its answer from the
separate model. Source filters can remove that evidence, and stronger
backgrounds can prove the conditional implication.

Zachary Goodsell proposed the finite-shift conclosure and separating total
extension. GPT-6 (Codex) supplied the witness and the proof that saturation
and maximal extension preserve its strict comparison. The model's write-up
records the construction, attribution, and checks; no independent checker
or Lean verification is claimed.

The question was formulated by GPT-6 (Codex), 9 September 2026. The principles
and the stronger affine-symmetry derivations are Zachary Goodsell's
*Symmetries of value*, Theorems 3–4, pp. 25–27; the paper is not attributed
this reduced-premise conjecture. The original analysis identified the
remaining gap and checked the model families then available.

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
- **Continuity under Vanishing Shifts:** the
  [common-mixture proof](du-vanishing-shifts-imply-relative.html) gives
  Relative Expectation already under DU, without Totality or a prior
  shift-symmetry assumption. This implies Simple Relative Expectation and
  Shift Transfer. Under DU, this continuity condition is equivalent to
  L¹ Continuity; a separate
  [conditional-approximation proof](du-l1-implies-relative.html) also
  establishes the L¹ route.

A countermodel must therefore fail **both** Symmetric Neutrality and L¹
Continuity. The symmetric and asymmetric continuous clipping models already
satisfy Relative Expectation and so cannot separate the question. The
[Folded-tail cone: lexicographic extension](lexicographic-folded-extension.md) does fail
L¹ Continuity, but retains neutrality and Relative Expectation, so it also
satisfies transfer. The exact clipping records do not establish the required
Shift Invariance and cannot simply be claimed as counterexamples.

The earlier
[Stochastic dominance: finite-support compensation](finite-support-compensated-dominance.html)
model does satisfy DU and Shift Invariance while violating Shift Transfer,
with the explicit pair $M_{1/2}(U+1,0)$ and $M_{1/2}(U,1)$ for uniform
$U$ on $[0,1]$. It also violates Totality, so it settles the version with
DU but does not itself supply a total countermodel. Its failure of continuity
under vanishing shifts is witnessed by $U+\varepsilon\succeq1/2$ for every
$\varepsilon>0$ while $U$ is incomparable with $1/2$.

The [finite-shift total extension](finite-shift-total-extension.html)
supplies the missing Totality while preserving a strict ranking of that
same pair. Finite-kernel saturation leaves the pair incomparable initially;
adjoining one orientation and saturating again preserves the indifferent
subspace exactly. A maximal saturated cone with that fixed subspace is
total, retains every common shift, and keeps the chosen comparison strict.
Thus the refutation is supplied by an actual existence model and an
explicit failed transfer instance.

## Paper references

- **Background: [Symmetries of value](https://doi.org/10.1111/nous.12549).** Zachary Goodsell (2026). Symmetries of value. Noûs, 60, 16–37. — Theorems 3–4, pp. 25–27: source for Shift Transfer and its derivation with full affine symmetry, not this conjecture
