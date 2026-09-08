# Source extraction: 8 September 2026

## Sources

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

1. **Eventual clipped expectations** (U Theorem 2): incomplete, satisfies
   finite EU and dominance; violates EU. Its lack of Totality has an explicit
   alternating-St-Petersburg witness. The checks also exhibit failure of L¹
   Continuity.
2. **Exact ultrafilter ordering** (U Theorem 1): total, satisfies DTU, violates
   EU. Source Theorem 10 supplies failure of scale invariance.
3. **Continuous ultrafilter quotient** (U Theorem 3): satisfies DTU and EU,
   shift and reflection. Source Theorem 10 supplies failure of scale invariance.
4. **Affine-symmetric extension** (S Theorem 2): a source-attributed
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
- The two explicit negation pairs now have `negates` links. A background
  deriving both sides triggers a red graph warning and suppresses arrows.
  This is a consistency check; the Horn rules do not use explosion.

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
