# Unbounded utility: random variables

This topic records a first reading of **Decision theory unbound** (Goodsell,
2024; published online in 2023) and **Symmetries of value** (Goodsell, 2026).
The source PDFs are in this topic's `sources/` directory:
[Decision theory unbound](sources/Nous%20-%202023%20-%20Goodsell%20-%20Decision%20theory%20unbound%20%281%29.pdf)
and [Symmetries of value](sources/Goodsell%20-%202026%20-%20Symmetries%20of%20value.pdf).
See `extraction.md` for the source inventory, limitations, and transcription notes.

## Objects and standing assumptions

A gamble is a measurable **outcome-valued random variable** X on a fixed
atomless standard probability space, which can be represented by [0,1] with
Lebesgue measure or by countably many independent fair coin tosses. All such
variables are available. Thus the first paper's **Prospect Richness** is a
domain convention here; it is different from the **Rich Outcomes** node.

The relation ≽ on gambles is reflexive and transitive. Write X ~ Y when both
comparisons hold, and X ≻ Y when X ≽ Y but not Y ≽ X. **Totality is optional.**
Outcomes themselves are linearly ordered by their sure comparisons; outcomes
indifferent for sure are identified. There are two distinct reference outcomes
called 0 and 1, with 1 ≻ 0. These are outcome and nondegeneracy conventions,
not an assumption that all gambles are comparable.

Equal random variables are the same object, but random variables with the same
law need not be indifferent. **Stochastic Equivalence is optional.** In
particular, do not replace a variable with an independent copy in a preference
comparison without an axiom that licenses the replacement. Almost-sure
indifference also follows from the dominance or equivalence axioms when used;
it is not an extra background preference axiom.

## Mixtures and restrictions

M_p(X,Y) means a p chance of X and a 1-p chance of Y. Fix the following lift on
[0,1], with an arbitrary fixed convention at endpoints:

- if 0 ≤ w < p, M_p(X,Y)(w) = X(w/p);
- otherwise, M_p(X,Y)(w) = Y((w-p)/(1-p)).

Its law is the mixture of the input laws. It is **not** the pointwise utility
average pX+(1-p)Y. Associativity and commutativity of probability mixtures are
identities of laws; their use as preference identities requires Stochastic
Equivalence. All theorem imports from the distribution formulation retain that
axiom explicitly or obtain it from Stochastic Dominance.

X|E equals X on E and the reference outcome 0 off E. Set X ≽_E Y iff
X|E ≽ Y|E. This is the first paper's definition, not conditional expectation
and not a fresh ranking conditional on a changed probability measure.

## Real utility levels and the two outcome principles

Do not make all outcomes real-valued utilities by definition: doing so would
hide the outcome assumption the user wants to inspect. Start with an ordered
standard Borel outcome space O. Its finite real utility chart u is calibrated by
binary comparisons relative to 0 and 1, as in Decision theory unbound, §2.1,
footnote 9:

- for 0 ≤ r ≤ 1, u(o)=r means o ~ M_r(1,0);
- for r > 1, u(o)=r means 1 ~ M_(1/r)(o,0);
- for r < 0, u(o)=r means 0 ~ M_(-r/(1-r))(1,o).

The better outcome is placed first in each binary mixture. In the negative
branch this exchanges the two branches of the source's notation, to align
the fixed random-variable lift with Archimedean Outcomes. Under the source's
Stochastic Equivalence the two conventions agree. No branch exchange is
silently used as an indifference when Stochastic Equivalence is absent.

The chart, wherever defined, is understood to be single-valued, measurable,
and compatible with the sure-outcome order; sure-indifferent outcomes have
already been identified. These are the source's utility-level conventions.
They are not a representation of preferences over all gambles. The remaining
axioms constrain how these binary comparisons extend to other random variables.

**Rich Outcomes:** every r ∈ ℝ occurs in this chart. This does not exclude
additional outcomes lacking a finite level. It is the first paper's axiom
called "Unbounded Utility", which is stronger than mere unboundedness.

**Archimedean Outcomes:** whenever sure a ≻ b ≻ c, there is p ∈ (0,1) such
that b ~ M_p(a,c). This supplies a finite chart coordinate for every outcome:
apply the condition to o and the reference pair 0,1 in their order. It does
not require that every real coordinate be realized. In particular it must not
be conflated with **Archimedean Gambles**, which quantifies over arbitrary
gambles in all three positions.

The **Simple Expected Utility** node asserts that this chart is total and
represents every finite-valued gamble by its expectation. Surjectivity is
deliberately omitted from that node and supplied by **Rich Outcomes**.
Consequently Simple EU implies Archimedean Outcomes, but no implication from
Rich Outcomes to Archimedean Outcomes is recorded.

Arithmetic notation such as X+b and −X abbreviates transforming the **utility
levels of the outcomes of X**, using u and its inverse on realized levels.
Numerical principles quantify over variables in the finite chart for which
the indicated transformed outcomes are available; they make no claim about
outcomes outside that chart. Full affine-group composition uses Rich Outcomes.
The source theorem packages include Rich Outcomes and Simple EU, so their
chart is all of ℝ and all the operations exist. Thus, throughout the numerical
proofs, X may simply be read as the real random variable u(X).

## Expectation and continuity

An ordinary expected utility in this dataset is **finite**: E|u(X)|<∞.
The sources treat St Petersburg as lacking an expected utility for their EU
principle. No rule comparing equal +∞ expectations is imported, and a
conditionally convergent series is not treated as a Lebesgue expectation.

Relative Expectation uses the expectation of the **pointwise difference**
u(X)-u(Y), which can be integrable when neither variable is. Mixtures remain
randomized selection, so these are different operations.

The L¹ node uses E|u(X_n)-u(X)|→0 for the variables' actual coupling, and the
upper-section closure clause printed in Symmetries, p. 23. This does not impose
Stochastic Equivalence by definition. With Stochastic Equivalence and the full
random-variable domain it is equivalent to the source's infimum-over-couplings
metric; the translation is explained in `writeups/l1-translation.md`.

Folded expectation requires absolute integrability of the *combined tail
difference*. It does not require each tail to be integrable and does not mean
merely taking a conditionally convergent improper integral.

## Source theorem packages

Preordering and availability of all random variables are standing throughout.
The 2026 paper's DTU is represented by:

**Rich Outcomes + Totality + Stochastic Equivalence + Simple EU + Stochastic
Dominance + Mixture Independence.**

The Stochastic Equivalence premise is redundant given this topic's weak-plus-
strict Dominance node, but is retained in imports to make the translation
visible. Archimedean Outcomes follows from Simple EU. **DTU + Sym** additionally
assumes Negative Affine Anti-Invariance, which supplies Positive Affine
Invariance as well as reflection. The elementary decomposition is recorded.

Full sufficient premise packages are preferred over unproved claims that a
paper's assumptions are minimal. There are no Lean files or Lean claims.

## Evidence and logical limitations

Provenance names the direct source: **Decision Theory Unbound**, **Symmetries
of Value**, or **Misc.** for original connecting proofs and one-off suggestions.
All records retain precise source references. The certificate names the mathematical author in
`produced_by` and credits AI transcription separately in `recorded_by`.
The checker list remains empty: human authorship of the source does not assert
human checking of its database transcription. A proved status here includes
**an application of a cited source theorem**; it does not mean that every
published proof has been independently audited. The record states when a
source supplies no expanded proof.

Countermodels witness non-implication. Source-based existence models are not
implemented comparison algorithms. The executable checks verify selected
concrete witness calculations, not arbitrary infinite or nonconstructive claims.

The two "Failure of ..." nodes express genuine negations, recorded with
explicit `negates` links. If the background implies both sides of either pair,
the graph displays a red inconsistency warning and hides all arrows. This
check uses proved results under the current source filters. The inference
engine still uses positive Horn rules; it does not infer arbitrary statements
from a contradiction. Missing arrows and missing model flags mean **not recorded**.
