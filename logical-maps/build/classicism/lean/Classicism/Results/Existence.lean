import Classicism.Results.Arity

/-!
# Existence as a premise, discharged

The shallow layer has no inhabitation lemma uniform in a type parameter: `Ty` is a marker
with no inhabitation field (`lean/README.md`, "C and C⁻"), Existence at `e` is the axiom
`e_exists` (`existence_e`), and at relational types the theorem `existence_rel`. So a record
whose argument says "since types are inhabited" at a type parameter `τ` is proved with the
instance it uses as one more hypothesis, `Existence τ` (`P.Existence`), and nothing else
changes: `#classicism_entails_audit` reads that hypothesis, like any other instance of a
principle, as the schema `P.Existence.schema` among the entailment's premises.

In the metalogic `Ty` is inductive, and `C` proves Existence at every closed type
(`Meta.classicism_implies_existence_r`: at `e` from the axiom, at relational types by
`⊤_ρ`). `Entails.discharge_existence` cuts that premise away, so the certificate states the
record's own premises. This is option (b) of the two one could take: a shallow class
providing Existence at `σ`, with instances at `e` and at arrows, would hide the dependence
on `e_exists` in an instance argument, and would make every theorem at `[Ty σ]` that used it
a theorem only of `C`; the hypothesis keeps the cost visible per theorem, and in the
metalogic it costs exactly what `C` already pays, the axiom at `e`.

Used by `modalized-relational-choice-implies-necessary-modalized-relational-choice` and
`barcan-and-intensional-choice-imply-necessary-intensional-choice` (`Records/Choice.lean`).
-/

namespace Classicism.Meta.AxiomSet.Entails

open Classicism.Meta Classicism.Meta.AxiomSet

/-- **Existence discharged**: a premise `P.Existence.schema`, the last of an entailment's
premises, is dropped, since `C` proves it at every closed type. Pure, as the entailments
`#classicism_entails_audit` writes are; `map_cert` reads them in every signature. -/
theorem discharge_existence {A B : AxiomSet Signature.pure}
    (h : A ∪ P.Existence.schema ⟹ B) : A ⟹ B :=
  Entails.trans (Entails.union (Entails.refl A)
    (Entails.mono_left (fun _ (h : empty _) => h.elim) classicism_implies_existence_r)) h

end Classicism.Meta.AxiomSet.Entails
