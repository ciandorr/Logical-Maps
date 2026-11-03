import Classicism.Syntax.PossibilityPlus
import Classicism.Syntax.WitnessedPossibility

/-!
# Possibility+

The map's arrows out of Possibility+ (`Syntax/PossibilityPlus.lean`):

- `possibility-plus-r-implies-distinctness-schema-r` and
  `possibility-plus-signature-r-implies-distinctness-signature-r`: the instances with no
  variables, `⊤ → ◇P` (for a signature, with `⊤ ∧ … ∧ ⊤` for the constants of `P`).
- `possibility-plus-signature-r-implies-possibility-plus-r`: a pure instance read in a
  closed signature is an instance for the signature, with no constants to keep the
  variables from; its consistency with `C(Σ)` is its consistency with `C`, by
  conservativity (`Syntax/Conservativity.lean`).
-/

namespace Classicism.Meta

open AxiomSet

variable {Sig : Signature}

/-- The individual constants of a term, listed. -/
theorem Term.exists_indConsts_list {Γ : Ctx} {σ : Ty} (t : Term Sig Γ σ) :
    ∃ ds : List (IndConst Sig), ∀ c ∈ t.consts, ∀ h : Sig.typeOf c = Ty.e, (⟨c, h⟩ : IndConst Sig) ∈ ds := by
  have hfin : {x : IndConst Sig | x.1 ∈ t.consts}.Finite :=
    (Term.consts_finite t).preimage Subtype.val_injective.injOn
  exact ⟨hfin.toFinset.toList, fun c hc h => by simpa using hc⟩

/-- With no variables, the antecedent for the constants is `⊤ ∧ … ∧ ⊤`. -/
theorem Derivable.neConsts_zero {Ax : AxiomSet Sig} {Γ : Ctx} {Δ : List (Formula Sig Γ)} :
    ∀ ds : List (IndConst Sig), Derivable Ax Δ (Term.neConsts 0 .nil ds Term.top)
  | [] => Derivable.top
  | _ :: ds => Derivable.andI Derivable.top (neConsts_zero ds)

/-- `possibility-plus-r-implies-distinctness-schema-r`: the instance with no variables. -/
theorem possibilityPlus_entails_possibility :
    possibilityPlus Signature.pure ⟹ possibility (empty : AxiomSet Signature.pure) := by
  rintro a ⟨hc0, p, hc, rfl⟩
  have h : Theorem (C.axioms ∪ possibilityPlus Signature.pure) (Term.imp Term.top (Term.dia p)) :=
    Theorem.ax ⟨by simpa using hc0, 0, p, Term.pure_of_pureSig p,
      Consistent.mono (subset_union_right _ _) hc, rfl⟩
  exact Theorem.mp h Derivable.top

/-- `possibility-plus-signature-r-implies-distinctness-signature-r`: the instance with no
variables. -/
theorem possibilityPlusSig_entails_possibility :
    possibilityPlusSig Sig ⟹ possibility (empty : AxiomSet Sig) := by
  rintro a ⟨hc0, p, hc, rfl⟩
  obtain ⟨ds, hds⟩ := Term.exists_indConsts_list p
  have h : Theorem (C.axioms ∪ possibilityPlusSig Sig)
      (Term.imp (Term.neConsts 0 .nil ds Term.top) (Term.dia p)) :=
    Theorem.ax ⟨by simpa [Term.closedTypes_neConsts_zero] using hc0, 0, p, ds, hds,
      Consistent.mono (subset_union_right _ _) hc, rfl⟩
  exact Theorem.mp h (Derivable.neConsts_zero ds)

/-- `possibility-plus-signature-r-implies-possibility-plus-r`: Possibility+ (pure), read in
a closed signature, is part of Possibility+ for the signature. -/
theorem ofPure_possibilityPlus_subset (hS : Sig.Closed) :
    AxiomSet.ofPure (possibilityPlus Signature.pure) ⊆ possibilityPlusSig Sig := by
  rintro a ⟨_, ⟨hct, n, P, -, hc, rfl⟩, rfl⟩
  refine ⟨by rw [Term.closedTypes_ofPure]; exact hct, n, Term.ofPure P, [], ?_, ?_, ?_⟩
  · intro c hc'
    rw [Term.consts_eq_empty_of_pure _ (Term.pure_ofPure P)] at hc'
    exact hc'.elim
  · rw [← Term.ofPure_existsBlock]
    exact Consistent.mono (fun b hb => ⟨_, rfl, hb⟩) ((consistent_ofPure_iff hS).2 hc)
  · rw [Term.ofPure_forallBlock]
    show Term.forallBlock _ (Term.imp (Term.ofPure (Term.distinct n (Terms.vars _ []))) (Term.dia (Term.ofPure P))) = _
    rw [Term.ofPure_distinct, Terms.ofPure_vars]
    rfl

end Classicism.Meta
