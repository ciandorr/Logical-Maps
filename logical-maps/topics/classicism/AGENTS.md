# Classicism records

Use the shared mathematical workflow in the repository's `AGENTS.md` files.
Paths below are relative to `topics/classicism/`. Start with `topic.yaml` and
the relevant sections of `background.md`; read the editing rules before edits.

## Locate the question

These are entry points, not a second database. Confirm the exact statement in
`principles/<id>.yaml`, then search the same IDs in `results/` and `models/`.
Read a matching `writeups/<id>.md` when it exists.

| User's terminology | Principle IDs / entry points |
| --- | --- |
| C, Classicism, H, Logical Equivalence, relational types | `topic.yaml`; `background.md` Framework, Notation, Conventions; these define the standing logic |
| BF / Barcan; CBF; NI; ND | `barcan-r`, `converse-barcan-r`, `identity-necessary-r`, `distinctness-necessary-r`; `-t` variants where present |
| C5, boxed ND | preset `c5` = `necessary-distinctness-necessary-r`; not unboxed ND |
| BC, completeness, atomicity, weak/strong worlds, Leibniz | `boolean-completeness-r`, `atomicity-r`, `strong-leibniz-r`; corresponding `-t` and `necessary-` records; lattice/world definitions in `background.md` |
| RC, rigidity, persistence, inextensibility, weak rigidity, Gallin | `rigid-comprehension-r`, `persistent-comprehension-r`, `inextensible-comprehension-r`, `weakly-inextensible-comprehension-r`, `weak-rigid-comprehension-r`, `very-weak-rigid-comprehension-r`, `gallin-extensional-comprehension-r` |
| Choice, Plenitude, Actuality | `functional-choice-r`, `relational-choice-r`, `plenitude-r`, `actuality`, `actual-profile-r` |
| Extensionality, Fregean Axiom, Functionality, Tractarianism | `extensionality-r`, `fregean-axiom`, `functionality-r`, `tractarianism-r`; distinguish `modalized-` and `necessary-` variants |
| Maximalism, pure/signature Distinctness Maximalism or Possibility Maximalism | `distinctness-schema-r`, `possibility-schema-r`; `distinctness-signature-r`, `possibility-signature-r`; `possibility-plus-*`, `strong-possibility-*` |
| Logical Combinatorialism, No Brute Necessities, separation, freedom, independence | `logical-necessity-r`, `witnessed-possibility-r` (No Brute Necessities), `possibly-witnessed-possibility-r`, `separated-structure-r`, `general-separated-structure-r`, `modal-freedom-signature-r`, `independence-signature-r` |
| No contingency, pure B, signature B | `no-pure-contingency-r`, `no-contingency-signature-r`, `pure-b-r`, `signature-b-r` |
| Infinity, arithmetic, countable completeness | `infinity-e`, `infinity-t` (schemata), `axiom-of-infinity-e`, `axiom-of-infinity-t`, `possible-infinity-e`, `possible-infinity-t`, `countable-boolean-completeness-r`, `necessity-of-arithmetic` |

## Constructions and sources

- For finite-support action models, search `models/finite-support-*.yaml`.
  Full Henkin and full action constructions are in `models/full-*.yaml`;
  choice failure also has `models/henkin-without-relational-choice.yaml`.
- Dorr's BC versus RC examples are in `models/symmetric-*.yaml`. Read the
  individual record's construction, evaluation point, and `changes`; do not
  transfer one variant's flags to another.
- Coalesced sums use `models/coalesced-*.yaml`. The glued free-monoid models
  use `models/full-free-monoid-glued-constants*.yaml` and matching write-ups.
  For signature claims, check the specified interpretation of constants and
  any pending expansion obligation, even when the pure-language model is proved.
- `extraction.md` indexes Classicism by proposition/section, followed by
  sections on *Arithmetic is Necessary*, *Logical Combinatorialism*, and
  *A Philosophical Introduction to Higher-Order Logics*. Use `papers.yaml`
  and the matching records for locators. Classicism locators refer to the
  16 May 2023 draft; the book and other drafts have their own pagination.
- Mathematical brainstorming uses the records and write-ups. Do not start
  Lean work unless explicitly requested or already agreed; asking for a proof
  or an argument check is not a Lean request.
- For requested formalization work, start at `lean/README.md` and
  `lean/VERIFICATION.md`.
  The file map in the README routes to definitions, proofs, the Equivalence
  gate, strict identities, and the type-system checker. Ordinary Lean tactics
  can import principles stronger than C; follow that library's proof policy.

## Mathematical guardrails

- C is fixed, even though `topic.yaml` has no background principle IDs. C5 and
  the other presets add optional assumptions. Equivalence and necessitation
  have theoremhood restrictions; a proof from an optional hypothesis does not
  automatically give its boxed counterpart.
- The `-r` IDs retain historical spelling within one fixed relational type
  system. All-type, type-t, boxed, pure, and signature principles are distinct
  records. Check the connecting result instead of silently substituting one.
- Pure/signature side conditions refer to C or C(Σ), not to whichever stronger
  theory the user is considering. Σ has a relational constant; distinct symbols
  do not assert distinct denotations. Preserve the conventions in `background.md`.
- Schema failure means failure at some admitted instance, not every instance.
  The engine does not instantiate schemas or necessitate theorems on its own.

## Existing editing constraints

- Classicism is listed on the main page with a [Draft] title marker. Keep
  that marker until the user asks to remove it.
- The fixed framework is C in the paper's relational type system: base types
  e and t, with sigma→tau allowed only when tau is not e. Principle names
  omit a type-system suffix. Do not reintroduce full-simple-type comparisons.
- Keep metalinguistic type quantifiers outside object closure and boxes.
  Use one homogeneous outer type-quantifier block. Preserve formula-schema
  side conditions and the source reference theory C.
- Application associates to the right. Parenthesize curried application.
- The user authorized model entries with precise construction references in
  Classicism instead of full construction details. The paper's models use
  the same type system as the map. Preserve any separate signature or
  verification caveats and retain the models' revision history.
- Do not copy reference PDFs into the topic or its downloads. Page numbers
  refer to the draft dated 16 May 2023. `papers.yaml` records the references.
- Preserve direct mathematical attribution separately from transcription.
  Do not promote the two source-reported results without supplying proofs.
