# Results about the sentence schemas

The map's principles that are schematic in a *sentence* rather than a type — No Pure
Contingency, No Contingency and B for a signature, Distinctness, Possibility, Maximalist
Classicism — are sentence schemas, defined in the metalogical layer
(`Syntax/SentenceSchemas.lean`), and the side conditions of Distinctness and Possibility,
"not a theorem of `C`", "consistent with `C`", are met by exhibiting a model. This folder
holds the map's results about them: what they entail and what they exclude. The
consistency facts from the models that the exclusions rest on are in `../Consistency/`.

Every theorem is over any signature `Sig` where it can be — the pure and the signature
versions of a record are then one theorem — and at `Signature.pure`, where the schemas of
the map's type-indexed principles, `P.schema`, live, where one of those is involved. A certified
lemma of the shallow layer is carried into a signature by `Term.ofPure`
(`Syntax/Pure.lean`), and instantiated at the sentences of the proof by `allEβ` and
`allE₂β`.

| file | contents |
| --- | --- |
| `PossibilityDistinctness.lean` | Distinctness and Possibility are equivalent, relative to any theory over any signature; `Max T` entails both. The one object-level step, `◇(x ≠ y) → x ≠ y`, is a shallow lemma certified once. |
| `Contingency.lean` | No Pure Contingency necessitates every schema of pure sentences, `NPC ∪ Ax ⟹ Ax.box` — the map's twenty `no-pure-contingency-and-X-imply-necessary-X` records as one theorem; the arrows among No Contingency, No Pure Contingency, B for the signature and B for pure sentences; B and the Fregean Axiom as sources. |
| `Incompatibilities.lean` | Possibility, Distinctness and `Max T` refute the necessitation of anything refutable in a model (`possibility_box_inconsistent`); Maximalist Classicism against `ND`, `□`Actuality, `□`Atomicity, `□`Boolean Completeness; Possibility against No Pure Contingency and against B for pure sentences. |
| `Arithmetic.lean`, `ArithmeticMeta.lean` | `C5` gives the Necessity of Arithmetic (Bacon, Theorem 4.4, in the map's formulation). The steps of the induction on arithmetical sentences — numbers are necessarily numbers, sums and products are necessary when true and, with B, impossible when false, identities by `NI` and `ND`, the connectives, and the quantifier restricted to numbers by `BF` at the type of numbers — are shallow theorems derived in `Arithmetic.lean`, with the vocabulary `ℕ`, `𝟎`, `Suc`, `Sum`, `Prod` taken as variables equal to the definitions; `ArithmeticMeta.lean` composes their derivations by induction on `AForm`, instantiating the vocabulary at the quoted terms of `Certified/Arithmetic.lean`, the equations discharged by reflexivity, with one β-conversion at the quantifier. |

## The map's records covered

| record | theorem |
| --- | --- |
| `distinctness-schema-r-implies-possibility-schema-r` | `distinctness_entails_possibility` (at `Signature.pure`, `empty`) |
| `possibility-schema-r-implies-distinctness-schema-r` | `possibility_entails_distinctness` |
| `distinctness-signature-r-implies-possibility-signature-r` | `distinctness_entails_possibility` (any `Sig`) |
| `possibility-signature-r-implies-distinctness-signature-r` | `possibility_entails_distinctness` |
| `no-pure-contingency-and-X-imply-necessary-X` (twenty records) | `npc_union_entails_box_pure`; named: `npc_barcanT_entails_necBarcanT`, `npc_ndT_entails_necNdT`, `npc_barcan_entails_box`, `npc_nd_entails_box`, `npc_fregean_entails_box`, `npc_actuality_entails_necActuality`, `npc_booleanCompleteness_entails_box`, `npc_atomicity_entails_box` |
| `no-contingency-signature-r-implies-no-pure-contingency-r` | `noContingency_entails_npc` |
| `no-contingency-signature-r-implies-signature-b-r` | `noContingency_entails_signatureB` |
| `no-pure-contingency-r-implies-pure-b-r` | `npc_entails_pureB` |
| `signature-b-r-implies-pure-b-r` | `signatureB_entails_pureB` |
| `modal-b-implies-signature-b-r` | `modalB_entails_signatureB` |
| `modal-b-implies-pure-b-r` | `modalB_entails_pureB` |
| `fregean-axiom-implies-no-contingency-signature-r` | `fregean_entails_noContingency` |
| `fregean-axiom-implies-no-pure-contingency-r` | `fregean_entails_npc` |
| `possibility-and-necessary-barcan-t-incompatible` | `possibility_necBarcanT_inconsistent` |
| `possibility-and-no-pure-contingency-incompatible` | `possibility_schema_npc_inconsistent` |
| `possibility-and-necessary-rigid-power-incompatible` | `possibility_necRigidPower_inconsistent` (`RigidPower.lean`; the model of pair-preserving injections and collapses) |
| `pure-b-and-pure-possibility-incompatible` | `possibility_pureB_inconsistent` |
| `maximalist-distinctness-incompatible-with-nd` | `maximalist_nd_inconsistent` (through `ND_t`) |
| `maximalist-distinctness-incompatible-with-necessary-barcan-r` | `maximalist_necBarcan_inconsistent` (through `□BF_t`) |
| `maximalist-distinctness-incompatible-with-necessary-tractarianism-r` | `maximalist_necTractarianism_inconsistent` (through `t`) |
| `maximalist-distinctness-incompatible-with-necessary-actuality` | `maximalist_necActuality_inconsistent` (the permutation model) |
| `maximalist-distinctness-incompatible-with-necessary-atomicity-r` | `maximalist_necAtomicity_inconsistent` (through `t`, the permutation model) |
| `maximalist-distinctness-incompatible-with-necessary-boolean-completeness-r` | `maximalist_necBooleanCompleteness_inconsistent` (through `e → t`, the permutation model; the `P.NecBooleanCompleteness` form with a prime) |
| `c5-implies-necessity-of-arithmetic` | `c5_entails_necessityOfArithmetic` (`ArithmeticMeta.lean`; `nc_of_aform`, the induction) |

The necessitation of a schema `Ax` is `Ax.box`, so that of a principle's schema is
`AxiomSet.box P.schema`; the two boxed principles the shallow layer states, `□BF_t` and
`□ND_t`, have the schemas `P.NecBarcanT.schema` and `P.NecNecessityOfDistinctnessT.schema`,
and the theorems are stated for them where the record is about them.

## Not yet here, and why

- **Principles not in the shallow layer**: Witnessed Possibility and its kin (substitution
  of constants for variables), Possibility+, Strong Possibility (`◇_≠`), Separated
  Structure, Independence, Modal Freedom, Logical Necessity, the Infinity principles. (The
  Necessity of Arithmetic is a sentence schema of `Certified/Arithmetic.lean`, and its
  `C5` record is here; Actuality, Boolean Completeness, Atomlessness and Plenitude
  are now in `Principles.lean`, with their shallow records in `Results/Records.lean`.)
- **Models not yet built**: the incompatibilities of Possibility with `□`Strong Atomicity
  (`t`) and `□`Relational Choice need the coalesced sums and a Henkin model without
  choice; with Countable Boolean Completeness, Gödel. The maximalist incompatibilities with
  `□`Functionality and Rigid Comprehension need models refuting those principles; those
  with `□`Actuality, `□`Atomicity and `□`Boolean Completeness come from the permutation
  model of Appendix D (`Models/Permutations.lean`). Parts 2 to 8 (`Models/Monoids.lean`)
  add, in `../Consistency/Consistency.lean`, one section per part: the paper's Proposition D.5 rows, and
  the non-theoremhood of each failing principle from the holding ones (`BF_e` from
  Actuality and Atomicity, Actuality from Atomicity, Atomicity from `BF` and Actuality,
  `ND_e` and Boolean Completeness from all three).
- **`c5-and-atomicity(-t)-imply-no-pure-contingency`**: the automorphism exchanging two
  atoms, extended by conjugation to every type, is a substantial metalogical proof by
  induction on terms.

## What the results depend on

The entailments rest on `propext` and `Quot.sound`, like every certified derivation. The
incompatibilities rest also on what the consistency facts they cite rest on
(`../Consistency/README.md`). `#print axioms` on any theorem reports which.
