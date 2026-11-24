import Classicism.Certified.Entailed
import Classicism.Results.SentenceSchemas.Incompatibilities
import Classicism.Results.SentenceSchemas.ArithmeticNecessitism
import Classicism.Results.SentenceSchemas.Contingency

/-!
# Potential Infinity and the sentence schemas

Potential Infinity at `e` and at `t` (`P.PotentialInfinityE`, `P.PotentialInfinityT`,
`Principles/Infinity.lean`) is a closed pure sentence, so the sentence schemas apply to it
(24 November 2026).

* `pureB_potentialInfinityE_entails_necPotentialInfinityE`, and at `t`: **B for pure
  sentences carries Potential Infinity to its necessitation.** Pure B gives `P → □◇P`, and
  `◇P → P` is a theorem of `C` (`potentialInfinity_of_dia`), hence necessary; the shallow
  lemma `pureB_potInf`. The map's `potential-infinity-e-and-pure-b-imply-necessary-potential-infinity-e`
  and its twin at `t`.
* `not_potentialInfinityE_consistent`, and at `t`: the negation of Potential Infinity is
  consistent with `C`, since Potential Infinity implies `I*` (`P.PotentialInfinityE.to_peano`),
  which fails over one individual (`not_iStar_consistent`).
* `possibility_necPotentialInfinityE_inconsistent`, and at `t`: so **Possibility refutes
  `□`Potential Infinity**. The map's `possibility-and-necessary-potential-infinity-e-incompatible`
  and its twin at `t`.
-/

namespace Classicism

/-- With `P → □◇P` at Potential Infinity, Potential Infinity is necessary if true: `◇P → P`
is a theorem, so necessary, and `K` applies. -/
theorem pureB_potInf {σ : Type} [Ty σ] :
    (PotInf σ → □ ◇ (PotInf σ)) → PotInf σ → □ (PotInf σ) :=
  fun hB h => modal_K _ _ (nec% (potentialInfinity_of_dia (σ := σ))) (hB h)

#classicism_derive Classicism.pureB_potInf

namespace Meta

open AxiomSet

/-- `potential-infinity-e-and-pure-b-imply-necessary-potential-infinity-e`. -/
theorem pureB_potentialInfinityE_entails_necPotentialInfinityE :
    pureB Signature.pure ∪ P.PotentialInfinityE.schema ⟹ P.NecPotentialInfinityE.schema := by
  rintro a rfl
  exact Theorem.mp₂ (Theorem.ofCMinus (pureB_potInf.derivable .e))
    (Theorem.ax (Or.inl (pureB_mem (Term.pure_of_pureSig _) rfl)))
    (Theorem.ax (Or.inr rfl))

/-- `potential-infinity-t-and-pure-b-imply-necessary-potential-infinity-t`. -/
theorem pureB_potentialInfinityT_entails_necPotentialInfinityT :
    pureB Signature.pure ∪ P.PotentialInfinityT.schema ⟹ P.NecPotentialInfinityT.schema := by
  rintro a rfl
  exact Theorem.mp₂ (Theorem.ofCMinus (pureB_potInf.derivable Ty.t))
    (Theorem.ax (Or.inl (pureB_mem (Term.pure_of_pureSig _) rfl)))
    (Theorem.ax (Or.inr rfl))

/-- **The negation of Potential Infinity at `e` is consistent with `C`**: Potential Infinity
implies `I*_e`, whose negation holds over one individual. -/
theorem not_potentialInfinityE_consistent :
    Consistent (single (Term.neg P.PotentialInfinityE.quoted)) :=
  consistent_neg_of_imp (C.Derivable.of_minus P.PotentialInfinityE.to_peano.derivable)
    (not_iStar_consistent .e)

/-- **The negation of Potential Infinity at `t` is consistent with `C`.** -/
theorem not_potentialInfinityT_consistent :
    Consistent (single (Term.neg P.PotentialInfinityT.quoted)) :=
  consistent_neg_of_imp (C.Derivable.of_minus P.PotentialInfinityT.to_peano.derivable)
    (not_iStar_consistent Ty.t)

/-- `possibility-and-necessary-potential-infinity-e-incompatible`. -/
theorem possibility_necPotentialInfinityE_inconsistent :
    ¬ Consistent (possibility (empty : AxiomSet Signature.pure) ∪
      P.NecPotentialInfinityE.schema) :=
  possibility_box_inconsistent (Consistent.empty_union not_potentialInfinityE_consistent) rfl

/-- `possibility-and-necessary-potential-infinity-t-incompatible`. -/
theorem possibility_necPotentialInfinityT_inconsistent :
    ¬ Consistent (possibility (empty : AxiomSet Signature.pure) ∪
      P.NecPotentialInfinityT.schema) :=
  possibility_box_inconsistent (Consistent.empty_union not_potentialInfinityT_consistent) rfl

end Meta

end Classicism
