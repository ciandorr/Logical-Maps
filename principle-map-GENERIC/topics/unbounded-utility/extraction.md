# Source extraction: updated 9 September 2026

## Addition: unpublished background-risk manuscript (9 September)

The new supplied source is Goodsell, *Unbounded Utility and Background Risk*,
5 June 2026, `sources/Goodsell - Unpublished (do not cite) - Erroneous.pdf`.
It is **unpublished, marked “do not cite”, and erroneous**. Its own provenance
name is **Unbounded Utility and Background Risk (unpublished)**.

The [detailed inventory and audit](writeups/symmetric-dtu-refutes-independent-sum-candidate.md)
records all extracted concepts and separates surviving arguments from the
withdrawn symmetry/total-extension claims. New entries add Full, Independent,
Comonotonic, and Antitonic Sum Invariance, separate independent-sum forward
preservation and cancellation, and CDF-Area Extension. The sum
incompatibilities are expressed as implications to False. Existing reflection and mixture nodes receive terminology
aliases rather than duplicates.

The [CDF-area dominance](writeups/cdf-area-preorder.md) is an explicit proved
incomplete model; the [CDF-area conclosure: total extension](writeups/conjectured-total-independent-sum-extension.md)
now has a proved existence construction, including Independent Sum
Consistency. Goodsell’s conclosure and total-extension construction
preserves the original strict comparisons and supplies totality. The model’s
direct source is his unpublished manuscript; GPT-6 is credited for the
cone-language exposition and additional proof details, not for originating
the construction. Neither reflection requirement is assumed or recorded as
violated. The user's recalled stable-law obstruction remains a conjectured
implication pending an exact witness.

After the falsity migration, this addition contributes **seven principles,
16 relations (15 proved, one conjectured), and two proved models**.
The full topic now has **36 principles, 55 relations, and six models**.
Five former failure nodes were removed: their claims are constraints
concluding False, with the existing result IDs, sources, and proof text
preserved. Their old descriptions are archived in `writeups/falsity-migration.md`. New concrete checks
are in `checks/background_risk.py`. No Lean formalization was added.

A subsequent premise audit records **Rich Outcomes + Simple EU + Stochastic
Dominance + Archimedean Gambles ⇒ False** using the same Goodsell
St Petersburg argument. This strengthens the available connection beyond
the original full-DTU package; its proof and attribution are in
`results/rich-simple-dominance-refutes-archimedean-gambles.yaml`.

The counts and descriptions below document the original two-paper extraction
of 8 September; they are not current totals.

## Original sources

| Key | Supplied file | Published reference |
| --- | --- | --- |
| U | `sources/Nous - 2023 - Goodsell - Decision theory unbound (1).pdf` | Goodsell, *Decision theory unbound*, Noûs 58 (2024), 669–695, DOI 10.1111/nous.12473; online 2023 |
| S | `sources/Goodsell - 2026 - Symmetries of value.pdf` | Goodsell, *Symmetries of value*, Noûs 60 (2026), 16–37, DOI 10.1111/nous.12549 |

Page references in the YAML are **printed journal pages**. For U, PDF page 1
is printed p. 669; for S, PDF page 1 is printed p. 16. Local PDFs were read
directly; no other papers were used as substitute evidence.

## Main extracted relations

All rows are relative to the framework in `background.md`; DTU and Sym are
expanded there and in each YAML record.

| Relation | Source |
| --- | --- |
| Simple EU ⇒ Archimedean Outcomes, Restricted Totality, Restricted Stochastic Equivalence | S p. 22 n. 3; U §§2.3, 3.2 |
| Stochastic Dominance ⇒ Stochastic Equivalence; with Archimedean Outcomes ⇒ Statewise Dominance | U pp. 678–679 |
| Rich + Archimedean Outcomes + Stochastic Equivalence + Statewise Dominance ⇒ Stochastic Dominance | U p. 678 n. 19; real quantile translation |
| Stochastic Equivalence + Mixture Independence ⇒ Sure-Thing | U p. 679 and p. 682 n. 28 |
| Original DTU axiom package ⇒ Simple EU and Mixture Independence | U pp. 679–681 |
| Rich Outcomes + Simple EU + Sure-Thing ⇒ failure of Countable Sure-Thing | U §2.3, pp. 675–676 |
| DTU ⇒ failure of Archimedean Gambles | S p. 22 |
| Under Rich Outcomes: shift + scale ⇔ positive affine invariance | U §4.2; S §5 |
| Under Rich Outcomes: negative affine anti-invariance ⇔ positive affine invariance + reflection anti-invariance | S p. 24 |
| DTU + L¹ Continuity ⇒ Expected Utility | S p. 23 |
| DTU + Sym ⇒ shift transfer and Simple Relative Expectation | S Theorems 3–4 |
| Under DTU + Sym: Relative Expectation ⇔ L¹ Continuity | S Corollary 5 |
| DTU + Sym + L¹ Continuity ⇒ Folded Expectation | S Theorem 6 |
| DTU + Sym ⇒ alternating St Petersburg ~ −1/2 and uniqueness of negative self-similarity | S Theorems 9–10 |
| DTU + Sym + L¹ Continuity ⇒ Arroyo ~ ln 2 and Pasadena ~ ln 2 | S Theorems 8, 11 |
| DTU + Sym + L¹ Continuity is consistent | S Theorem 2, with construction in §5 |
| DTU does not imply Expected Utility, and is consistent with it | U Theorems 1–3, Appendix B |
| DTU + EU + shift + reflection does not imply scale invariance | U Theorems 7, 8, 10 |

These are implications with **joint premises**, not separate arrows from each
premise. Straightforward restrictions (for example EU ⇒ Simple EU) and the
reflection/symmetric-neutrality observation are also recorded.

## Models

1. **Clipped expectation: eventual dominance** (U Theorem 2): incomplete, satisfies
   finite EU and dominance; violates EU. Its lack of Totality has an explicit
   alternating-St-Petersburg witness. The checks also exhibit failure of L¹
   Continuity.
2. **Clipped expectation: exact ultrafilter dominance** (U Theorem 1): total, satisfies DTU, violates
   EU. Source Theorem 10 supplies failure of scale invariance.
3. **Clipped expectation: continuous ultrafilter dominance** (U Theorem 3): satisfies DTU and EU,
   shift and reflection. Source Theorem 10 supplies failure of scale invariance.
4. **Signed-measure cone: affine-symmetric extension** (S Theorem 2): a source-attributed
   nonconstructive existence model for DTU + Sym + L¹ Continuity. Its
   Countable Sure-Thing and Archimedean Gambles failures follow from the same
   St Petersburg arguments as for other DTU models.

Each satisfies/violates entry is either explained in its write-up, inherited
from a recorded implication, or explicitly attributed to a source theorem.
Source-attributed is weaker evidence than an independent proof audit. The direct
source is identified by `certificate.source_id`; `produced_by`, `recorded_by`,
and the empty checker list describe authorship and the separate transcription.

## Provenance and display categories

Direct source filters distinguish **Decision Theory Unbound** (11 records),
**Symmetries of Value** (19 records), and **Misc.** (12 records: ten connecting
proofs and two user-suggested conjectures). Every arrow and model retains its
author, date, and precise source references.
The ten AI arrows are restrictions/compositions added to connect definitions:
`totality-restricts`, `stochastic-equivalence-restricts`,
`expected-utility-implies-simple`, `archimedean-gambles-restricts`,
`positive-affine-implies-shift`, `positive-affine-implies-scale`,
`shift-scale-imply-positive-affine`, `relative-implies-simple-relative`,
`relative-implies-eu`, and `folded-implies-eu`. Their sources explicitly
identify the AI proof as well as the paper definitions it uses.

The graph filter groups all 31 principles into Basic decision theory (15),
Invariance principles (7), Extensions of EUT (5), and Prospect evaluations (4).
Each group has independent select-all/unselect-all controls. Category and
checkbox changes only affect display, not the underlying implication rules.

## Transcription decisions and issues needing care

- S p. 24 prints a same-direction sign in the displayed **Reflection
  Anti-Invariance** definition. Read it as X≽Y iff −X≼−Y. This is forced by
  the negative-affine definition directly above, the introduction, and the
  subsequent proofs. It was checked visually in the PDF.
- The intended reflection axiom uses **one fixed utility origin**, as the
  explanatory prose on p. 24 says. Requiring reflection around every possible
  origin would also imply shifts. The literal phrase "for any utility
  representation" in that display should not silently strengthen this node.
- U p. 673 n. 9 prints an impossible interval in the middle branch of the
  utility definition. The normalized branch is 0≤r≤1, as required for the
  described probabilities. The negative and greater-than-one branches are
  kept separate.
- U pp. 683–684 defines **clipping**: mass beyond ±t moves to the endpoints.
  Its shorthand integral with bounds ±t must not be implemented as deleting
  the tails. We use E[max(−t,min(X,t))]. The prose and figure were checked
  visually. The cone discussion in S §5 inherits a related notational issue.
- S p. 28's Pasadena prose omits `/n`; Table 2 and Theorem 11 include it.
  This extraction uses −(−2)^n/n, probability 2^(−n).
- S Theorem 9 repeats one strict-comparison sign in the concluding sentence;
  the second case is the opposite strict comparison.
- S Theorem 10's expanded formula appears to print `−a^n` where the
  geometric recursion requires `(−a)^n`. The extracted principle records its
  clear **uniqueness in value** conclusion. No questionable expansion is used
  as a formula in the map.
- S p. 27's informal comparison with a reflection needs attention to a
  factor of two if it is used numerically. We do not import that sentence as
  a separate theorem or algorithm.
- U Theorem 10's displayed scale identity should be interpreted using
  E[c_t(aX)] = a E[c_(t/a)(X)]. The printed oscillating-function witness also
  has endpoint and normalization issues. Scale non-implication is recorded
  as the **source theorem's claim**, not as a numerically reconstructed proof.

## Deferred rather than silently asserted

- S Theorem 1 states stronger non-implications even after adding L¹, Relative
  Expectation, Weak Expectation, and Principal Value principles. The present
  models record the weaker, clearly identified U witnesses; they are **not**
  given these extra satisfies flags without a further proof audit.
- Weak Expectation and Principal Value theories are discussed and distinguished
  in S §4, but their full source definitions would need another careful pass.
  Their relative strength is not guessed from the words "principal value".
- The conjecture at the end of S §4 that DTU + Sym + L¹ entails either of those
  theories remains a conjecture. Pasadena's evaluation does not prove it.
- U's Coherent Extensibility concerns a class of alternative orderings and
  extension relations, beyond this topic's single primitive preorder. Its
  role in the consistency discussion is noted but it is not forced into an
  axiom about an individual random variable.
- No Rich Outcomes ⇒ Archimedean Outcomes implication has been inferred from
  the papers' convenient identification of outcomes with ℝ.
- No blanket EU ⇒ affine symmetry, EU ⇒ full Stochastic Equivalence, or
  Countable Sure-Thing equivalence is asserted. EU only governs integrable
  variables; full symmetry and law invariance cover more variables.
- The original failure nodes have now been migrated to implications to
  False. Deriving False triggers a red graph warning and suppresses arrows.
  The Horn rules do not use explosion; model violations can also follow
  from these incompatibility constraints.

## Reproduce

### Candidate additions from the user

Two further **human-proposed conjectures** were recorded on 8 September 2026:

- Countable Sure-Thing + Archimedean Outcomes ⇒ Archimedean Gambles.
- Countable Sure-Thing + Simple EU ⇒ Expected Utility.

These supplement the 36 proved records above. They appear in Conjectures and
as dashed arrows when the graph's Conjectures option is enabled; they do not
participate in proved deductions. Each record identifies the user's proposal
as its source and lists the remaining verification work. The Russell–Isaacs
reference attached to the first is related literature, not a verified
attribution of the exact two-premise claim.

The map is deliberately selective and can grow through later additions.
An unrecorded implication need not be an open problem in the literature.

### Commands

From `principle-map-GENERIC/`, with its Python requirements installed:

```sh
python3 scripts/pmap.py validate unbounded-utility
python3 topics/unbounded-utility/checks/countermodels.py
python3 scripts/pmap.py build unbounded-utility --no-pdf
```

Open `build/unbounded-utility/index.html`. Source YAML, the framework, and
write-ups remain under `topics/unbounded-utility/`; the original example topic
and shared renderer are unchanged.


### Copula sum invariance additions — 9 September 2026

Zach Goodsell proposed the common-copula generalization in `TODO.md` and requested
universal and existential versions. GPT-6 (Codex) recorded the precise definitions
and supplied the connecting proofs, attributed to Misc. rather than to the
unpublished paper. The general copula terminology follows Benth, Di Nunno and
Schroers, [Definition 2.1 and Theorem 2.3](https://arxiv.org/html/2012.11530v2);
that reference is not the source of the new preference principles.

For a fixed copula C, SC(C) compares actual X,Y before and after adding the same
actual Z whenever both pair laws (X,Z) and (Y,Z) admit C. The universal principle
is ∀C SC(C); the existential principle is ∃C SC(C), with C chosen once for all
triples and marginal laws. Atomic marginals are included, with no uniqueness of
a pair's compatible copula assumed. Numerical operations retain the existing
finite-chart scope.

Recorded connections: Full Sum ⇒ Universal Copula Sum; Universal Copula Sum ⇒
Existential Copula Sum and each of the three existing dependence-restricted sum
principles; Existential Copula Sum ⇒ Shift Invariance. Each existing restricted
sum principle, together with Stochastic Equivalence, also implies Existential
Copula Sum. The latter proofs explicitly transfer comparisons from quantile
realizations. In particular, product copula compatibility is only pairwise
independence from Z, whereas the existing Independent Sum principle requires
independence of Z from the pair (X,Y).

The existing Rich Outcomes + Stochastic Dominance + Antitonic Sum incompatibility
already rules out Universal Copula Sum under those background assumptions; no
duplicate incompatibility record is needed. No model flags or Lean definitions
were added, and the separate background/Lean tasks remain pending.


### Further DU and DTU connections and resistant questions — 9 September 2026

The source download includes `DU-RESEARCH-2026-09-09-ROUND2.md`, recording
the new implication proofs, source-model specializations and an infinitesimal
folded-tail countermodel. In particular, under DTU, L¹ Continuity implies
Relative Expectation, which is equivalent to CDF-Area Extension; even Folded
Expectation does not imply L¹ Continuity. Three precise outstanding questions
are recorded as conjectures and do not contribute proved deductions. Each
addition describes reused source material and newly supplied work.


### DU and DTU terminology correction — 9 September 2026

DU does not assume Totality over arbitrary gambles; DTU is DU plus Totality.
The DU/DTU distinction follows *Decision theory unbound*, §3.3, pp. 681–682.
The preset initially used the equivalent formulation with Simple EU; the
subsequent finite-lottery proof below permits treating Simple EU as derived.
DTU has a separate optional preset. Both presets explicitly include Archimedean
Outcomes. Named conjunctions abbreviate these packages while retaining each
record's full, original premises.

The two research reports previously called the six-axiom package DU. Their
package-level summaries, complete-model labels and totality-dependent conjectures
now say DTU. Exact result premises and model flags are unchanged. Incomplete
DU models are eligible under the default background. Claims whose listed
premises do not need Totality remain valid DU consequences.

### Simple EU as a derived DU consequence — 9 September 2026

The new record `rich-archimedean-dominance-independence-imply-simple-eu`
proves Simple EU from Rich Outcomes, Archimedean Outcomes, Stochastic
Dominance and Mixture Independence. It uses common binary endpoints for
finite lotteries, checks all three normalized-chart calibrations and
measurability, and never assumes Totality or Restricted Totality.

The DU preset therefore assumes Rich Outcomes, Archimedean Outcomes,
Stochastic Equivalence, Stochastic Dominance and Mixture Independence;
Simple EU is displayed as a consequence. DTU adds Totality. Together with
the existing Simple EU ⇒ Archimedean Outcomes record, the new proof makes
this equivalent to the previous Simple-EU-based package.

The literal two-premise implication Rich Outcomes + Archimedean Outcomes
⇒ Simple EU is false. The `finite-two-sample-minimum` model supplies an
explicit witness, even with Totality and Stochastic Equivalence. Both new
records identify the connecting work as GPT-6 (Codex), 9 September 2026;
the source finite-lottery argument remains credited to Goodsell. Existing
source-attributed theorem premises and proofs are unchanged.
