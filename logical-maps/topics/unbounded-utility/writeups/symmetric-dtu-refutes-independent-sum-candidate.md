# Symmetric DTU versus independent sums — settled

**Proved implication:** DTU + Symmetric Gambles Are Neutral + Independent Sum
Invariance implies **False**.

**Proof.** Independent Sum Invariance supplies Independent Sum Preservation.
Apply the [completed Lévy obstruction](levy-refutes-neutral-independent-preservation.html),
which needs only Rich Outcomes, Stochastic Dominance, Mixture Independence,
Symmetric Neutrality and that preservation property.

**Original work: direct consequence of a proof completion.** Goodsell supplied
the claim and stable-law obstruction proposal; GPT-6 (Codex), 9 September 2026,
supplied the specified witness and reduced-premise proof in the linked record.
This larger-premise consequence needs no further construction. Source: Misc.;
no independent checker or Lean verification is asserted.

Zachary Goodsell thinks Wilkinson’s claimed independent-sum result in
[*Flummoxing expectations*, Theorem A.4](https://doi.org/10.1111/nous.12530)
is mistaken. This record relies on the Lévy proof above.

## Historical source audit

The audit below is preserved from before the proof completion. Its statements
that the incompatibility was conjectured or lacked a proof describe that earlier
state; they are superseded by the proved result above. The withdrawn manuscript
argument is not reinstated.


**Conjectured implication:** Rich Outcomes + Totality + Stochastic Equivalence
+ Simple EU + Stochastic Dominance + Mixture Independence + Symmetric
Neutrality + Independent Sum Invariance ⇒ False. There is no completed
proof recorded for this implication. The audit below separates it from the
verified portions of the manuscript.

**Source:** Zachary Goodsell, *Unbounded Utility and Background Risk*,
5 June 2026, 21 pages. The draft itself is not included in the public downloads.
**Unpublished; do not cite; erroneous.** The short provenance name in the map
is **Unbounded Utility and Background Risk (unpublished)**. These references identify
which supplied document an entry came from; they do not endorse its claims
or describe it as a published paper. PDF and printed page numbers coincide.

Extraction recorded by GPT-6 (Codex), 9 September 2026, following Goodsell’s
request to preserve the interesting principles and extension construction.
No separate checker or formal verification is claimed.

## Principle inventory

| Manuscript discussion | Map representation |
| --- | --- |
| Expected Utility, pp. 3–4 | Existing Expected Utility; finite expectations retain the topic’s established scope |
| Totality, p. 4 | Existing Totality; reflexivity and transitivity remain standing |
| Preferences over probability distributions | Existing optional Stochastic Equivalence; translated to random variables |
| Stochastic Dominance, pp. 3–4 | Existing weak-plus-strict Stochastic Dominance |
| Independence / Convexity, pp. 3, 6 | Existing Mixture Independence, with a source terminology alias |
| Reflection Symmetry, pp. 3–4 | Existing Symmetric Neutrality, with an alias; not a second node |
| Reflection Anti-Invariance, pp. 3–4 | Existing Reflection Anti-Invariance |
| Full Sum Invariance, pp. 1–2, 17 | New arbitrary-dependence sum biconditional |
| Independent Sum Invariance / Convolution Invariance, pp. 1–6 | New independent-common-summand biconditional |
| Forward and reverse portions of Lemma 1, p. 8 | Separate Independent Sum Preservation (weak and strict) and Cancellation |
| Relative-area base relation and strict extension, pp. 7–8 | New CDF-Area Extension, plus the exact incomplete model |
| Fixed-copula sum-consistency family, p. 18 | General family documented below; independent, comonotonic and antitonic nodes instantiated |
| Comonotonic Sum Invariance, pp. 18–20 | New node; verified in the explicit area model |
| Antitonic Sum Invariance, pp. 18–19 | New node; incompatibility with dominance recorded |
| Real-valued utility domain throughout | Existing Rich Outcomes and Archimedean Outcomes remain distinct |

Full, Antitonic, and Independent Sum incompatibilities are now recorded as
implications to False, with the relevant sum principle added to the other
premises. There are no separate failure nodes. The independent-sum
incompatibility currently has only a **conjectured** arrow. It must not
trigger a known-inconsistency warning.

For a fixed copula $\kappa$, the general schema compares
$Q_X(U)+Q_Z(V)$ with $Q_Y(U)+Q_Z(V)$ for $(U,V)\sim\kappa$.
A choice of copula specifies an axiom; the schema is not silently promoted to
one axiom universally quantifying over every copula. The three distinguished
instances are the product, comonotonic, and antitonic copulas. All comparisons
in the database remain comparisons of random variables, and law identities
are used in proofs only with Stochastic Equivalence or a premise implying it.

“Coherent Indifference” is mentioned in the introduction as background to an
earlier impossibility result, but not defined in this manuscript. No new
axiom is invented from that mention. Conclosure and extension are construction
operations on relations, not additional primitive properties of an individual
gamble. The model write-up preserves them in their appropriate role.

## What survives

The full-sum St Petersburg counterexample (§6.1) and antitonic impossibility
(Theorem 6) are recorded with explicit proofs. The latter requires neither
Totality nor Symmetric Neutrality. Full Sum Invariance restricts to the
three dependence-specific principles. Each of those implies Shift Invariance
by taking a constant summand. Independent Sum Invariance splits into forward
preservation and reverse cancellation.

The footnote on pp. 12–13 establishes, under totality, law invariance and
mixture independence, that Symmetric Neutrality implies Reflection
Anti-Invariance. This argument is independent of the failed construction.

The base area preorder is a proved incomplete model. Theorem 7’s comonotonic
argument can be made rigorous using separate positive and negative quantile
areas, avoiding undefined differences of infinities. Its independent-sum
**forward** property follows from Tonelli. See
[the detailed construction](cdf-area-preorder.html).

CDF-Area Extension implies Expected Utility, Relative Expectation, and
Stochastic Dominance. It does **not** automatically transfer the exact
model’s invariance properties to every extension: newly supplied comparisons
must themselves respect any requested invariance axioms.

## Failed claims and remaining gaps

- **Lemma 3 / Theorem 4, pp. 10–12:** the manuscript explicitly acknowledges
  that the symmetry-extension proof fails. Convolving an odd function with
  an arbitrary probability law need not preserve oddness. Convolution with a
  nonzero point mass already translates the function away from its symmetry
  center. The claimed symmetric consistency model is not entered as proved.
- **Lemma 1, p. 8:** convolved positive and negative parts can overlap. The
  asserted identification with the positive and negative parts of the
  convolved difference is false. This invalidates the given cancellation
  proof; it does not by itself disprove cancellation for the base relation.
- **Equation (16), p. 8:** reflection substitution introduces an incorrect
  minus sign. The area model’s anti-invariance nevertheless has a direct
  corrected proof.
- **Lemma 2, pp. 9–10:** the proposed chain construction shows forward
  transformation closure, not the reverse cancellation clauses its use
  requires. Taking the genuine closure by intersection is possible, but
  the total-extension write-up now spells out Goodsell’s conclosure in
  cone language, including strictness-preservation details that do not
  rely on this lemma’s chain description.
- **Theorem 5, pp. 12–14:** neither the failed symmetric seed nor the
  questionable closure calculation establishes the symmetric total extension.
  A separate [proved total extension without either reflection requirement](conjectured-total-independent-sum-extension.html)
  uses Goodsell’s conclosure and total-extension strategy, with cone-language
  exposition and additional proof details recorded by GPT-6. It establishes
  the previously conjectured package, including Independent Sum Invariance,
  without rehabilitating the original symmetry lemma.
- **Cauchy discussion, pp. 15–16:** the draft’s objections to a particular
  attempted dominance comparison do not establish its own consistency
  theorem. No new consistency or incompatibility arrow is inferred from
  its plots or tail heuristics.

## User’s recalled stable-law obstruction

Goodsell reports that the main consistency claim is false and recalls
balanced mixtures involving stable parameters 1 and 1/2. By symmetry, the
relevant prospects should both be indifferent to zero; convolution with a
common parameter-1/2 law is recalled to create strict stochastic dominance.
If those specifications work, independent-sum invariance transports the
initial indifference to the convolved pair, contradicting strict dominance.

The recollection does not yet fix whether the parameters refer to stability
indices or another parameter, nor the skewness, scale, location, mixture
weights, and full dominance comparison. The map records the resulting
proposed incompatibility with a sufficient DTU-plus-neutrality package as
**conjectured**, source **Goodsell proposal 9 Sep**. No numerical plot or
partially specified stable law is used as a proof. This leaves the author’s
withdrawal explicit while separating it from a checked mathematical witness.

## Provenance and scope

New manuscript arguments and its explicit construction use the manuscript’s
own direct source. Original restriction/decomposition proofs use **Misc.**,
with **GPT-6 generated 9 Sep** identifying the contribution. The total-extension model is attributed directly to
**Unbounded Utility and Background Risk (unpublished)**: its CDF-area
construction, conclosure, and extension strategy are Goodsell’s. The
cone-language exposition and additional proof details are separately
credited as **GPT-6 proof details 9 Sep**, not as a new AI construction. The remaining
stable-law conjecture uses **Misc.**, with **Goodsell proposal 9 Sep**.
Source definitions are cited separately, and no published proof was rewritten.

After migrating the failure nodes, the additions are seven principles,
sixteen implications (fifteen proved and
one conjectured), one proved incomplete model, and one proved total
extension model. The graph remains selective; no claim is made to exhaust all true
consequences. No Lean formalization was added.
