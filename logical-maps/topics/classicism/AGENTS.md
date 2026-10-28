# Classicism records

Use the shared mathematical workflow in the repository's `AGENTS.md` files.
Paths below are relative to `topics/classicism/`. Start with `topic.yaml` and
the relevant page of `background/`; read the editing rules before edits. Its pages,
in order: `framework` (C, types, notation, conventions, evidence), `necessity`,
`order` (pointwise operations, ≤, LB/GLB/LUB), `atoms` (atoms and strong atoms), `rigidity`, `varieties` (□≠, hats, □5), `relations` (functional, equivalence
and order predicates; Bourbaki–Witt), `arithmetic` (cardinality, arithmetic,
analysis), `signatures` (pure and signature schemata).

## Locate the question

These are entry points, not a second database. Confirm the exact statement in
`principles/<id>.yaml`, then search the same IDs in `results/` and `models/`.
Read a matching `writeups/<id>.md` when it exists.

| User's terminology | Principle IDs / entry points |
| --- | --- |
| C, Classicism, H, Logical Equivalence, relational types | `topic.yaml`; `background/framework.md`; it defines the standing logic |
| BF / Barcan; CBF; NI; ND | `barcan-r`, `converse-barcan-r`, `identity-necessary-r`, `distinctness-necessary-r`; `-t` variants where present |
| C5, boxed ND | preset `c5` = `necessary-distinctness-necessary-r`; not unboxed ND |
| BC, completeness, atomicity, strong atoms, Strong Atomicity (Leibniz Biconditionals), self-atoms and Self-Atomicity, Strong Actuality | `boolean-completeness-r`, `atomicity-r`, `strong-atomicity-r`, `strong-actuality`; corresponding `-t` and `necessary-` records; lattice/world definitions in `background/order.md` and `background/atoms.md` |
| RC, rigidity, persistence, inextensibility, weak rigidity, Gallin | `rigid-comprehension-r`, `persistent-comprehension-r`, `inextensible-comprehension-r`, `weakly-inextensible-comprehension-r`, `weak-rigid-comprehension-r`, `gallin-extensional-comprehension-r` |
| Choice, Plenitude, Actuality, transversals or selectors for equivalence relations | `functional-choice-r`, `relational-choice-r`, `transversal-choice-r`, `plenitude-r`, `actuality` (with its form Actual Profile) |
| Extensionality, Fregean Axiom, Functionality, Tractarianism | `extensionality-r`, `fregean-axiom`, `functionality-r`, `tractarianism-r`; distinguish `modalized-` and `necessary-` variants |
| Maximalism, pure/signature, in its Distinctness or Possibility form | `distinctness-schema-r`; `distinctness-signature-r`; `possibility-plus-*`, `strong-possibility-*` |
| Logical Combinatorialism, No Brute Necessities, separation, freedom, independence | `logical-necessity-r`, `witnessed-possibility-r` (No Brute Necessities), `possibly-witnessed-possibility-r`, `separated-structure-r`, `modal-freedom-signature-r`, `independence-signature-r` |
| No contingency, pure B, signature B | `no-pure-contingency-r`, `no-contingency-signature-r`, `pure-b-r`, `signature-b-r` |
| Infinity, arithmetic, countable completeness | `infinity-e`, `infinity-t` (schemata), `axiom-of-infinity-e`, `axiom-of-infinity-t`, `possible-infinity-e`, `possible-infinity-t`, `countable-boolean-completeness-r`, `necessity-of-arithmetic` |

## Constructions and sources

- For finite-support action models, search `models/finite-support-*.yaml`; the
  one-object ones belong to `groups/finite-support-one-object.yaml`, and
  arguments that hold beyond one group are in `arguments/`, with the conditions
  they require in `conditions.yaml`.
  Full Henkin and full action constructions are in `models/full-*.yaml`;
  choice failure also has `models/henkin-without-relational-choice.yaml`.
- Symmetry-constrained full models (finite, Dorr's symmetry condition on a full model;
  Intensional Choice fails with Actuality and Atomicity) are `models/symmetry-constrained-full-*.yaml`,
  grouped in `groups/symmetry-constrained-full.yaml`; their Intensional Choice failure is the
  general argument `arguments/intensional-choice-collapse.yaml`, shared with the symmetric models.
- Dorr's BC versus RC examples are in `models/symmetric-*.yaml`. Read the
  individual record's `definition` (construction and evaluation point), its
  `arguments` and its `history`; do not transfer one variant's flags to another.
- A model record lists only the verdicts the engine cannot derive; `status
  --model <id>` or the viewer shows the rest.
- Coalesced sums use `models/coalesced-*.yaml`. The glued free-monoid models
  use `models/full-free-monoid-glued-constants*.yaml` and matching write-ups.
  For signature claims, check the specified interpretation of constants and
  any pending expansion obligation, even when the pure-language model is proved.
- Choice-free variants: `full-action-models` has a `metatheory` parameter (`choice`,
  `no-countable-choice-reals`, `socks`); a choiceless value gives a model only arguments marked
  `choice: free`. ZF + ¬AC_ω(ℝ) applies to members meeting `numbered-returning-arrows`
  (`arguments/countable-choice-reals-full.yaml`); socks applies wherever an infinite set is left
  unspecified (`socks-full`, `socks-relational-choice`, the S5 model's own argument), and
  `intensional-choice-finitely-many-arrows` keeps □Intensional Choice in the finite ones.
- `CANDIDATES.md` lists candidate principles not yet recorded, with notes on what
  each would need; check it before adding a principle.
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
  do not assert distinct denotations. Preserve the conventions in `background/signatures.md`.
- Schema failure means failure at some admitted instance, not every instance.
  The engine does not instantiate schemas or necessitate theorems on its own.

## Existing editing constraints

- Classicism is listed on the main page with a [Draft] title marker. Keep
  that marker until the user asks to remove it.
- The fixed framework is C in the paper's relational type system: base types
  e and t, with sigma→tau allowed only when tau is not e. Principle names
  omit a type-system suffix. Do not reintroduce full-simple-type comparisons.
- Write a type schema with its type variables free in the formula, not with
  a type quantifier ($\forall^{\mathrm{Ty}}$ is no longer used), and add a
  parenthesized proviso such as $\qquad(\tau\ne e)$ only where the range is
  restricted; see Background, Type scope. Type variables stay outside object
  closure and boxes. Preserve formula-schema side conditions and the source
  reference theory C.
- Application associates to the right. Parenthesize curried application.
- The user authorized model entries with precise construction references in
  Classicism instead of full construction details. The paper's models use
  the same type system as the map. Preserve any separate signature or
  verification caveats and retain the models' revision history.
- Do not copy reference PDFs into the topic or its downloads. Page numbers
  refer to the draft dated 16 May 2023. `papers.yaml` records the references.
- Preserve direct mathematical attribution separately from transcription.
  Do not promote the two source-reported results without supplying proofs.
