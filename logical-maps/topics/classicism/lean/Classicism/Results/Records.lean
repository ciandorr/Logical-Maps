import Classicism.Results.Records.Base
import Classicism.Results.Records.Coarse
import Classicism.Results.Records.Extensionality
import Classicism.Results.Records.Comprehension
import Classicism.Results.Records.Lattice
import Classicism.Results.Records.Choice
import Classicism.Results.Records.C5
import Classicism.Results.Records.Infinity
import Classicism.Background.AppendixD
import Classicism.Results.Records.Necessity

/-!
# Proofs of map records

One theorem per record of `topics/classicism/results/`, named after the record id with
hyphens replaced by underscores. Records with no premises are theorems of C. Each
docstring names the record and the source of the argument.

## Records are stated between instances

A record "Schema A implies Schema B" is, in the paper, a metatheorem: from the instances
of A one derives each instance of B. What is stated here is the object-level content of
that, an implication between **instances** with the types as parameters:

    theorem functionality_r_implies_tractarianism_r {σ : Type} [Ty σ] :
        Functionality σ Prop → Tractarianism σ

says which instance of the premise the argument consumes, Functionality at `σ → t`, for
the conclusion at `σ`. Where an argument uses a premise at several types, each is a
separate hypothesis. This is the form the type-system check requires, since no formula
quantifies over types, and it is what puts every record within the strict layer's reach:
each theorem here has a necessitation, from which the boxed record follows by `K`.

## Where each record is

One file per topic, in the order of the map's categories, each importing those it cites:

| file | records |
| --- | --- |
| `Records/Base.lean` | theorems of `C`: the map's category `base` |
| `Records/Coarse.lean` | `B`, `5`, ND, BF, Tractarianism, Functionality (Propositions 2.1, 2.2) |
| `Records/Extensionality.lean` | Extensionality, the Fregean Axiom, the Distinctness-Preserving Collapse |
| `Records/Comprehension.lean` | among the comprehension principles |
| `Records/Lattice.lean` | Actuality, Boolean Completeness, Atomicity, Vicinity, Strong Atomicity, and the comprehension they give |
| `Records/Choice.lean` | Choice, Plenitude, Transversals, Modalized Plenitude |
| `Records/C5.lean` | the records of `C5`, `□ND` at `t` (§§2.1–2.3) |
| `Records/Infinity.lean` | Infinity, Countable Boolean Completeness |
| `Background/AppendixD.lean` | *The Bounds of Possibility*, Appendix D: properties of operators, hats, `□₅`, Propositions D11–D19 as the map's records use them (no records of its own) |
| `Records/Necessity.lean` | the varieties of necessity: `□_≠`, `□̂̂`, `□₅` and the principles comparing them |

A record goes in the file of its conclusion's category, unless it belongs to a group the
paper argues together (`C5`), or its premise is the more specific subject (Actuality and
Boolean Completeness giving comprehension, in `Lattice.lean`). Every theorem is in the
namespace `Classicism.Proofs`, so a record's name does not depend on its file.
-/
