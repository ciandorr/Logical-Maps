import Classicism.Principles.Base
import Classicism.Principles.Coarse
import Classicism.Principles.Extensionality
import Classicism.Principles.Lattice
import Classicism.Principles.Instances
import Classicism.Principles.Comprehension
import Classicism.Principles.Choice
import Classicism.Principles.Infinity
import Classicism.Principles.Schematic

/-!
# Principle statements

One definition per principle of the map with a shallow statement, named as the map's
`lean_def` convention expects (`Classicism.P.<Name>`), in a file per category of the map
(the `category` field of the principle's record):

| file | the map's category |
| --- | --- |
| `Principles/Base.lean` | `base`: theorems of `C`: `K`, `T`, `4`, CBF, NI, Existence |
| `Principles/Coarse.lean` | `coarse`: `B`, `5`, ND, BF, Tractarianism |
| `Principles/Extensionality.lean` | `extensionality`: the Fregean Axiom, Extensionality, Functionality |
| `Principles/Lattice.lean` | `lattice`: Atomicity, Boolean Completeness, Actuality, Strong Atomicity |
| `Principles/Instances.lean` | `instances`: the principles at `t` kept beside their general forms |
| `Principles/Comprehension.lean` | `comprehension`: the comprehension principles |
| `Principles/Choice.lean` | `choice`: Choice, Plenitude, Transversals |
| `Principles/Infinity.lean` | `infinity`: the Axioms of Infinity and Possible Infinity |
| `Principles/Schematic.lean` | `schematic`: the Distinctness-Preserving Collapse |

The sentence schemas, the map's other `schematic` principles and its `signature` ones, are
not shallow statements: they are defined in the object language, in `Syntax/`.

## Principles are families of formulas, indexed by types

The map's metalinguistic quantifier `∀ᵀʸ σ` ranges over *types*, and a principle is a
family of formulas, its **instances**, one for each choice of types. No formula of the
paper's language quantifies over types, so a principle is not itself a formula, and it is
not rendered here as one Lean proposition quantifying over types. Each principle takes its
types as explicit **type parameters** and is a formula once they are fixed:
`Functionality σ τ` is `(∀z. Xz = Yz) → X = Y` for `X Y : σ → τ`, and `Barcan Prop` is BF
at type `t`. The guards `[Ty σ]` (a **Ty-parameter**) and `[Rel τ]` (a **Rel-parameter**)
are the map's side conditions on the types. The set of a principle's instances, as
sentences of the object language, is its **schema**, `P.X.schema`
(`Certified/Schemas.lean`); the README sets out these names.

This is what the type-system check enforces: a binder over a type may be a parameter of a
declaration, never a quantifier inside a formula. A record about principles is then an
implication between *instances*, with the types the argument needs as parameters, which
the paper reads as a metatheorem and which keeps every certified statement within the
strict layer's reach.

`□P` for a principle `P` is likewise the family of `□`-prefixed instances, so a boxed
principle boxes the formula after its type parameters, as the Background says.

Definitions are from `topics/classicism/background.md`; each statement is the record's
`formal` field with its type quantifier made a parameter.

## Forms

A principle's equivalent forms, the map's *variants* (`dual`, `lub`, …), are stated beside
it, so that a link from the principle's page lands on all of them:

* the form is defined right after the official definition, named `P.<Name><Form>`
  (`P.BarcanDual`, `P.BooleanCompletenessLUB`), its docstring naming the map's principle
  and variant (`` `barcan-r`, form `dual` ``);
* the two directions of the equivalence follow, as record theorems `P.<Name>.to_<form>`
  and `P.<Name>.of_<form>` (`P.Barcan.to_dual : Barcan σ → BarcanDual σ`), held to the
  gate and certified as entailments between schemas by the same audits as the records
  (`Certified/`);
* the map's certificate `Map.<principle-id>.<form-id>` cites `P.<Name>.to_<form>.entails`
  and `P.<Name>.of_<form>.entails`.

A boxed principle's form is the boxed form (`P.NecBarcanDual σ := □ BarcanDual σ`), and its
equivalence is the unboxed one necessitated, with `K`. A form of an instance at `t` is the
instance of the general form, unless the map words it at `t` in its own way (`□p` for
`¬p ≤ p`, `neg_le_iff_box`).

Two kinds of form are not shallow statements, and live elsewhere. The **polyadic** form of
a principle with a Ty-parameter is its vectorization, `P.X.listQuoted` (`Certified/Schemas.lean`),
with the two directions in `Results/Lists.lean`; a **dual polyadic** form is the
vectorization of the dual, and its equivalence is composed from those and the vectorized
directions `P.X.to_dual.listEntails` and `P.X.of_dual.listEntails`. A form of a sentence
schema is a sentence schema, defined beside it in `Syntax/`.

## The paper's symbols

The files open the scope `Classicism.Paper` where its symbols are used, so that the
statements read as the map writes them: `x ≤ ¬ x`, `W ≠ ⊥`, `Persistent (¬ Y)`. The scope
changes no terms (`Paper.lean`). The exception is `Principles/Coarse.lean`, which does not
open it: Tractarianism's `≤` at `Prop` is `entails`, and inside the scope it would be
`Rel.le`.
-/
