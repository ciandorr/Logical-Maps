import Classicism.Map
import Classicism.MapArguments
import Classicism.Certified.Atoms

/-!
# The map's results about self-atoms and strong atoms, certified

The certificates, as in `Map.lean`, of the results among Self-Atomicity, the bridge principles
(Atoms are self-atoms, Self-atoms are atoms, Self-atoms are strong atoms, Atoms are strong
atoms), Strong Atomicity and Strong Actuality: the shallow proofs are in
`Results/Records/Atoms.lean`, certified as entailments in `Certified/Atoms.lean`; a result
that is the boxed form of another is certified from that one's certificate by `map_boxed`
(`Results/Boxed.lean`).
-/

namespace Classicism.Meta
open AxiomSet

/-! ### At every arity: the records at `σ → t`, vectorized, with BF over the list -/

/-- `self-atomicity-t-and-bf-imply-self-atomicity-r`, at every arity. -/
theorem self_atomicity_t_and_bf_imply_self_atomicity_r :
    P.SelfAtomicityT.schema ∪ P.Barcan.schema ⟹ P.SelfAtomicity.schema :=
  Entails.mono_right (schema_subset_args _)
    (Entails.trans (Entails.union (Entails.union_left _ _)
        (Entails.trans (Entails.union_right _ _) P.Barcan.schema_entails_listSchema))
      Proofs.self_atomicity_t_and_bf_imply_self_atomicity_r.listEntails)

/-- `self-atoms-are-strong-atoms-t-and-bf-imply-self-atoms-are-strong-atoms-r`, at every arity. -/
theorem self_atoms_are_strong_atoms_t_and_bf_imply_self_atoms_are_strong_atoms_r :
    P.SelfAtomsAreStrongAtomsT.schema ∪ P.Barcan.schema ⟹ P.SelfAtomsAreStrongAtoms.schema :=
  Entails.mono_right (schema_subset_args _)
    (Entails.trans (Entails.union (Entails.union_left _ _)
        (Entails.trans (Entails.union_right _ _) P.Barcan.schema_entails_listSchema))
      Proofs.self_atoms_are_strong_atoms_t_and_bf_imply_self_atoms_are_strong_atoms_r.listEntails)

end Classicism.Meta

namespace Classicism.Map

open Meta Meta.AxiomSet

/-! ### Incompatibilities with Possibility, from the models -/

namespace AtomsConsistency

open Intensional Intensional.Premodel CategoryTheory

/-- Strong Atomicity at `t` fails in the permutation model of Appendix D, Part 1, where
Atomicity at `t` fails: the certified record that it implies Atomicity, by soundness. -/
theorem not_strongAtomicityT_consistent :
    Consistent (single (Term.neg P.StrongAtomicityT.quoted)) :=
  Consistent.of_model Perms.model Perms.model_isModel
    (holdsAx_single _ ((holdsSentence_neg _ Perms.model_isModel _).2 fun h =>
      Perms.not_atomicityT ((Perms.model).entails_holds Perms.model_isModel
        Proofs.strong_atomicity_t_implies_atomicity_t.entails (holdsAx_single _ h) _ rfl)))

/-- Atoms are strong atoms (type `t`) fails in the full model on the idempotent monoid, where
Atomicity at `t` holds and Strong Atomicity at `t` fails. -/
theorem not_atomsAreStrongAtomsT_consistent :
    Consistent (single (Term.neg P.AtomsAreStrongAtomsT.quoted)) :=
  have M : (MSet.model Idem).IsModel := MSet.model_isModel Idem
  have hat : (MSet.model Idem).HoldsAx P.AtomicityT.schema :=
    (MSet.model Idem).entails_holds M
      (Entails.trans Proofs.necessary_atomicity_r_implies_atomicity_r.entails
        Proofs.atomicity_r_implies_atomicity_t.entails)
      ((holdsAx_schemaIn_iff _ _).1
        (Map.Arguments.full_atomicity.necessary_atomicity_r _ M (MSet.model_full Idem)))
  Consistent.of_model (MSet.model Idem) M
    (holdsAx_single _ ((holdsSentence_neg _ M _).2 fun h =>
      Map.Arguments.nonepic_strong_atomicity.strong_atomicity_t _ M (MSet.model_full Idem)
        FullActionModels.idem_nonepic ((holdsAx_schemaIn_iff _ _).2
          ((MSet.model Idem).entails_holds M
            Proofs.atomicity_t_and_atoms_are_strong_atoms_t_imply_strong_atomicity_t.entails
            (holdsAx_union _ hat (holdsAx_single _ h))))))

/-- Self-Atomicity at `t` fails in a full model with an arrow `k` and a non-identity `j'` such that
`k ≫ j' = k`: the only candidate below `{k}` is `{k}`, which after `k` is true and has the proper
non-bottom part `{𝟙}`, so is not an atom there. -/
theorem not_selfAtomicityT {C : Type} [SmallCategory C] {B : Premodel Signature.pure C} (M : B.IsModel) (hF : B.Full)
    {V : C} (k : B.W₀ ⟶ V) (j' : V ⟶ V) (hne : j' ≠ 𝟙 V) (hk : k ≫ j' = k) :
    ¬ B.HoldsSentence P.SelfAtomicityT.quoted := by
  have sem_bot' : ∀ {Γ : Ctx} {W : C} (h : B.W₀ ⟶ W) (g : IEnv (B.Dom W) Γ),
      B.sem h (Term.bot : Formula Signature.pure Γ) g = ∅ := fun h g => B.sem_bot M h g
  simp only [Premodel.HoldsSentence, P.SelfAtomicityT.quoted, B.holds_forall M, B.holds_imp M,
    B.holds_exists M, B.holds_conj M, B.holds_neg M, B.holds_box M]
  simp only [B.holds_eq M, sem_var, sem_bot', B.sem_disj M, B.sem_neg M, IEnv.get, IEnv.get_map,
    B.incl_map]
  intro H
  obtain ⟨x, hx⟩ := hF .t B.W₀ {⟨V, PUnit.unit, k⟩}
  obtain ⟨w, ⟨hw, hbox⟩, hle⟩ := H x (by rw [hx]; exact Set.singleton_ne_empty _)
  rw [hx] at hle
  have hwx : B.incl .t B.W₀ w = {⟨V, PUnit.unit, k⟩} := by
    have hsub : B.incl .t B.W₀ w ⊆ {⟨V, PUnit.unit, k⟩} := Set.union_eq_right.1 hle.symm
    exact (Set.subset_singleton_iff_eq.1 hsub).resolve_left hw
  obtain ⟨y, hy⟩ := hF .t V {⟨V, PUnit.unit, 𝟙 V⟩}
  have h1 : (⟨V, PUnit.unit, 𝟙 V⟩ : Tuple B.inner .t V) ∈
      Intension.map B.inner k (B.incl .t B.W₀ w) := by
    rw [hwx]; show _ = _; simp
  have hj' : (⟨V, PUnit.unit, j'⟩ : Tuple B.inner .t V) ∈
      Intension.map B.inner k (B.incl .t B.W₀ w) := by
    rw [hwx]; show _ = _; rw [hk]
  have hT : B.Holds (𝟙 B.W₀ ≫ k) (Term.var Var.zero) (B.push k (IEnv.cons w (IEnv.cons x IEnv.nil))) := by
    rw [holds_var]
    simpa only [IEnv.get, IEnv.get_map, B.incl_map] using h1
  have hA := (hbox k (fun f => (f hT).2 (f hT).1) y).1
    ⟨by rw [hy]; exact (Set.union_eq_right.2 (Set.singleton_subset_iff.2 h1)).symm,
     fun e => hne (by
      have : (⟨V, PUnit.unit, j'⟩ : Tuple B.inner .t V) ∈ B.incl .t V y := by rw [e]; exact hj'
      rw [hy] at this
      obtain ⟨_, hh⟩ := Sigma.mk.inj_iff.mp (Set.mem_singleton_iff.1 this)
      exact (Prod.mk.inj (eq_of_heq hh)).2)⟩
  have hin : (⟨V, PUnit.unit, 𝟙 V⟩ : Tuple B.inner .t V) ∈ B.incl .t V y := by rw [hy]; rfl
  have : (⟨V, PUnit.unit, 𝟙 V⟩ : Tuple B.inner .t V) ∈ (B.incl .t V y)ᶜ := by
    rw [hA]; exact Or.inl hin
  exact this hin

/-- Atoms are self-atoms (type `t`) fails in the full model on the idempotent monoid, where
Atomicity at `t` holds and Self-Atomicity at `t` fails. -/
theorem not_atomsAreSelfAtomsT_consistent :
    Consistent (single (Term.neg P.AtomsAreSelfAtomsT.quoted)) :=
  have M : (MSet.model Idem).IsModel := MSet.model_isModel Idem
  have hat : (MSet.model Idem).HoldsAx P.AtomicityT.schema :=
    (MSet.model Idem).entails_holds M
      (Entails.trans Proofs.necessary_atomicity_r_implies_atomicity_r.entails
        Proofs.atomicity_r_implies_atomicity_t.entails)
      ((holdsAx_schemaIn_iff _ _).1
        (Map.Arguments.full_atomicity.necessary_atomicity_r _ M (MSet.model_full Idem)))
  Consistent.of_model (MSet.model Idem) M
    (holdsAx_single _ ((holdsSentence_neg _ M _).2 fun h =>
      not_selfAtomicityT (V := SingleObj.star Idem) M (MSet.model_full Idem)
        (Idem.k : SingleObj.star Idem ⟶ SingleObj.star Idem)
        (Idem.k : SingleObj.star Idem ⟶ SingleObj.star Idem) Idem.k_ne_one rfl
        ((MSet.model Idem).entails_holds M
          Proofs.atomicity_t_and_atoms_are_self_atoms_t_imply_self_atomicity_t.entails
          (holdsAx_union _ hat (holdsAx_single _ h)) _ rfl)))

end AtomsConsistency

/-- `possibility-and-necessary-atoms-are-strong-atoms-t-incompatible` -/
theorem possibility_and_necessary_atoms_are_strong_atoms_t_incompatible : Statements.possibility_and_necessary_atoms_are_strong_atoms_t_incompatible := by
  map_cert_incompatible (show ¬ Consistent (possibility (empty : AxiomSet Signature.pure) ∪ P.NecAtomsAreStrongAtomsT.schema) from
    possibility_box_inconsistent (Consistent.empty_union AtomsConsistency.not_atomsAreStrongAtomsT_consistent) rfl)

/-- `actuality-and-self-atoms-are-strong-atoms-t-imply-strong-actuality` -/
theorem actuality_and_self_atoms_are_strong_atoms_t_imply_strong_actuality : Statements.actuality_and_self_atoms_are_strong_atoms_t_imply_strong_actuality := by
  map_cert Proofs.actuality_and_self_atoms_are_strong_atoms_t_imply_strong_actuality.entails

/-- `atomicity-r-and-atoms-are-self-atoms-r-imply-self-atomicity-r` -/
theorem atomicity_r_and_atoms_are_self_atoms_r_imply_self_atomicity_r : Statements.atomicity_r_and_atoms_are_self_atoms_r_imply_self_atomicity_r := by
  map_cert Proofs.atomicity_r_and_atoms_are_self_atoms_r_imply_self_atomicity_r.entails

/-- `atomicity-r-and-atoms-are-strong-atoms-r-imply-strong-atomicity-r` -/
theorem atomicity_r_and_atoms_are_strong_atoms_r_imply_strong_atomicity_r : Statements.atomicity_r_and_atoms_are_strong_atoms_r_imply_strong_atomicity_r := by
  map_cert Proofs.atomicity_r_and_atoms_are_strong_atoms_r_imply_strong_atomicity_r.entails

/-- `atomicity-t-and-atoms-are-self-atoms-t-imply-self-atomicity-t` -/
theorem atomicity_t_and_atoms_are_self_atoms_t_imply_self_atomicity_t : Statements.atomicity_t_and_atoms_are_self_atoms_t_imply_self_atomicity_t := by
  map_cert Proofs.atomicity_t_and_atoms_are_self_atoms_t_imply_self_atomicity_t.entails

/-- `atomicity-t-and-atoms-are-strong-atoms-t-imply-strong-atomicity-t` -/
theorem atomicity_t_and_atoms_are_strong_atoms_t_imply_strong_atomicity_t : Statements.atomicity_t_and_atoms_are_strong_atoms_t_imply_strong_atomicity_t := by
  map_cert Proofs.atomicity_t_and_atoms_are_strong_atoms_t_imply_strong_atomicity_t.entails

/-- `atomlessness-implies-atoms-are-strong-atoms-r` -/
theorem atomlessness_implies_atoms_are_strong_atoms_r : Statements.atomlessness_implies_atoms_are_strong_atoms_r := by
  map_cert Proofs.atomlessness_implies_atoms_are_strong_atoms_r.entails

/-- `atoms-are-self-atoms-r-and-self-atoms-are-strong-atoms-r-imply-atoms-are-strong-atoms-r` -/
theorem atoms_are_self_atoms_r_and_self_atoms_are_strong_atoms_r_imply_atoms_are_strong_atoms_r : Statements.atoms_are_self_atoms_r_and_self_atoms_are_strong_atoms_r_imply_atoms_are_strong_atoms_r := by
  map_cert Proofs.atoms_are_self_atoms_r_and_self_atoms_are_strong_atoms_r_imply_atoms_are_strong_atoms_r.entails

/-- `atoms-are-self-atoms-r-implies-atoms-are-self-atoms-t` -/
theorem atoms_are_self_atoms_r_implies_atoms_are_self_atoms_t : Statements.atoms_are_self_atoms_r_implies_atoms_are_self_atoms_t := by
  map_cert Proofs.atoms_are_self_atoms_r_implies_atoms_are_self_atoms_t.entails

/-- `atoms-are-self-atoms-t-and-self-atoms-are-strong-atoms-t-imply-atoms-are-strong-atoms-t` -/
theorem atoms_are_self_atoms_t_and_self_atoms_are_strong_atoms_t_imply_atoms_are_strong_atoms_t : Statements.atoms_are_self_atoms_t_and_self_atoms_are_strong_atoms_t_imply_atoms_are_strong_atoms_t := by
  map_cert Proofs.atoms_are_self_atoms_t_and_self_atoms_are_strong_atoms_t_imply_atoms_are_strong_atoms_t.entails

/-- `atoms-are-strong-atoms-r-and-self-atoms-are-atoms-r-imply-self-atoms-are-strong-atoms-r` -/
theorem atoms_are_strong_atoms_r_and_self_atoms_are_atoms_r_imply_self_atoms_are_strong_atoms_r : Statements.atoms_are_strong_atoms_r_and_self_atoms_are_atoms_r_imply_self_atoms_are_strong_atoms_r := by
  map_cert Proofs.atoms_are_strong_atoms_r_and_self_atoms_are_atoms_r_imply_self_atoms_are_strong_atoms_r.entails

/-- `atoms-are-strong-atoms-r-implies-atoms-are-self-atoms-r` -/
theorem atoms_are_strong_atoms_r_implies_atoms_are_self_atoms_r : Statements.atoms_are_strong_atoms_r_implies_atoms_are_self_atoms_r := by
  map_cert Proofs.atoms_are_strong_atoms_r_implies_atoms_are_self_atoms_r.entails

/-- `atoms-are-strong-atoms-r-implies-atoms-are-strong-atoms-t` -/
theorem atoms_are_strong_atoms_r_implies_atoms_are_strong_atoms_t : Statements.atoms_are_strong_atoms_r_implies_atoms_are_strong_atoms_t := by
  map_cert Proofs.atoms_are_strong_atoms_r_implies_atoms_are_strong_atoms_t.entails

/-- `atoms-are-strong-atoms-t-and-actuality-imply-strong-actuality` -/
theorem atoms_are_strong_atoms_t_and_actuality_imply_strong_actuality : Statements.atoms_are_strong_atoms_t_and_actuality_imply_strong_actuality := by
  map_cert Proofs.atoms_are_strong_atoms_t_and_actuality_imply_strong_actuality.entails

/-- `atoms-are-strong-atoms-t-and-self-atoms-are-atoms-t-imply-self-atoms-are-strong-atoms-t` -/
theorem atoms_are_strong_atoms_t_and_self_atoms_are_atoms_t_imply_self_atoms_are_strong_atoms_t : Statements.atoms_are_strong_atoms_t_and_self_atoms_are_atoms_t_imply_self_atoms_are_strong_atoms_t := by
  map_cert Proofs.atoms_are_strong_atoms_t_and_self_atoms_are_atoms_t_imply_self_atoms_are_strong_atoms_t.entails

/-- `atoms-are-strong-atoms-t-implies-atoms-are-self-atoms-t` -/
theorem atoms_are_strong_atoms_t_implies_atoms_are_self_atoms_t : Statements.atoms_are_strong_atoms_t_implies_atoms_are_self_atoms_t := by
  map_cert Proofs.atoms_are_strong_atoms_t_implies_atoms_are_self_atoms_t.entails

/-- `barcan-relational-implies-atoms-are-strong-atoms-r` -/
theorem barcan_relational_implies_atoms_are_strong_atoms_r : Statements.barcan_relational_implies_atoms_are_strong_atoms_r := by
  map_cert Proofs.barcan_relational_implies_atoms_are_strong_atoms_r.entails

/-- `barcan-t-and-necessary-actuality-imply-self-atomicity-t` -/
theorem barcan_t_and_necessary_actuality_imply_self_atomicity_t : Statements.barcan_t_and_necessary_actuality_imply_self_atomicity_t := by
  map_cert Proofs.barcan_t_and_necessary_actuality_imply_self_atomicity_t.entails

/-- `barcan-t-implies-atoms-are-strong-atoms-t` -/
theorem barcan_t_implies_atoms_are_strong_atoms_t : Statements.barcan_t_implies_atoms_are_strong_atoms_t := by
  map_cert Proofs.barcan_t_implies_atoms_are_strong_atoms_t.entails

/-- `five-and-self-atomicity-t-imply-necessary-b` -/
theorem five_and_self_atomicity_t_imply_necessary_b : Statements.five_and_self_atomicity_t_imply_necessary_b := by
  map_cert Proofs.five_and_self_atomicity_t_imply_necessary_b.entails

/-- `modal-five-implies-self-atoms-are-atoms-r` -/
theorem modal_five_implies_self_atoms_are_atoms_r : Statements.modal_five_implies_self_atoms_are_atoms_r := by
  map_cert Proofs.modal_five_implies_self_atoms_are_atoms_r.entails

/-- `necessary-atomlessness-implies-necessary-self-atoms-are-strong-atoms-r` -/
theorem necessary_atomlessness_implies_necessary_self_atoms_are_strong_atoms_r : Statements.necessary_atomlessness_implies_necessary_self_atoms_are_strong_atoms_r := by
  map_cert Proofs.necessary_atomlessness_implies_necessary_self_atoms_are_strong_atoms_r.entails

/-- `necessary-atoms-are-self-atoms-r-implies-atoms-are-self-atoms-r` -/
theorem necessary_atoms_are_self_atoms_r_implies_atoms_are_self_atoms_r : Statements.necessary_atoms_are_self_atoms_r_implies_atoms_are_self_atoms_r := by
  map_cert Proofs.necessary_atoms_are_self_atoms_r_implies_atoms_are_self_atoms_r.entails

/-- `necessary-atoms-are-self-atoms-t-implies-atoms-are-self-atoms-t` -/
theorem necessary_atoms_are_self_atoms_t_implies_atoms_are_self_atoms_t : Statements.necessary_atoms_are_self_atoms_t_implies_atoms_are_self_atoms_t := by
  map_cert Proofs.necessary_atoms_are_self_atoms_t_implies_atoms_are_self_atoms_t.entails

/-- `necessary-atoms-are-strong-atoms-r-implies-atoms-are-strong-atoms-r` -/
theorem necessary_atoms_are_strong_atoms_r_implies_atoms_are_strong_atoms_r : Statements.necessary_atoms_are_strong_atoms_r_implies_atoms_are_strong_atoms_r := by
  map_cert Proofs.necessary_atoms_are_strong_atoms_r_implies_atoms_are_strong_atoms_r.entails

/-- `necessary-atoms-are-strong-atoms-t-implies-atoms-are-strong-atoms-t` -/
theorem necessary_atoms_are_strong_atoms_t_implies_atoms_are_strong_atoms_t : Statements.necessary_atoms_are_strong_atoms_t_implies_atoms_are_strong_atoms_t := by
  map_cert Proofs.necessary_atoms_are_strong_atoms_t_implies_atoms_are_strong_atoms_t.entails

/-- `necessary-barcan-t-and-necessary-actuality-imply-necessary-self-atomicity-t` -/
theorem necessary_barcan_t_and_necessary_actuality_imply_necessary_self_atomicity_t : Statements.necessary_barcan_t_and_necessary_actuality_imply_necessary_self_atomicity_t := by
  map_cert Proofs.necessary_barcan_t_and_necessary_actuality_imply_necessary_self_atomicity_t.entails

/-- `necessary-modal-five-implies-necessary-self-atoms-are-strong-atoms-r` -/
theorem necessary_modal_five_implies_necessary_self_atoms_are_strong_atoms_r : Statements.necessary_modal_five_implies_necessary_self_atoms_are_strong_atoms_r := by
  map_cert Proofs.necessary_modal_five_implies_necessary_self_atoms_are_strong_atoms_r.entails

/-- `necessary-self-atomicity-r-implies-self-atomicity-r` -/
theorem necessary_self_atomicity_r_implies_self_atomicity_r : Statements.necessary_self_atomicity_r_implies_self_atomicity_r := by
  map_cert Proofs.necessary_self_atomicity_r_implies_self_atomicity_r.entails

/-- `necessary-self-atomicity-t-implies-self-atomicity-t` -/
theorem necessary_self_atomicity_t_implies_self_atomicity_t : Statements.necessary_self_atomicity_t_implies_self_atomicity_t := by
  map_cert Proofs.necessary_self_atomicity_t_implies_self_atomicity_t.entails

/-- `necessary-self-atoms-are-atoms-r-implies-self-atoms-are-atoms-r` -/
theorem necessary_self_atoms_are_atoms_r_implies_self_atoms_are_atoms_r : Statements.necessary_self_atoms_are_atoms_r_implies_self_atoms_are_atoms_r := by
  map_cert Proofs.necessary_self_atoms_are_atoms_r_implies_self_atoms_are_atoms_r.entails

/-- `necessary-self-atoms-are-atoms-t-implies-self-atoms-are-atoms-t` -/
theorem necessary_self_atoms_are_atoms_t_implies_self_atoms_are_atoms_t : Statements.necessary_self_atoms_are_atoms_t_implies_self_atoms_are_atoms_t := by
  map_cert Proofs.necessary_self_atoms_are_atoms_t_implies_self_atoms_are_atoms_t.entails

/-- `necessary-self-atoms-are-strong-atoms-r-implies-self-atoms-are-strong-atoms-r` -/
theorem necessary_self_atoms_are_strong_atoms_r_implies_self_atoms_are_strong_atoms_r : Statements.necessary_self_atoms_are_strong_atoms_r_implies_self_atoms_are_strong_atoms_r := by
  map_cert Proofs.necessary_self_atoms_are_strong_atoms_r_implies_self_atoms_are_strong_atoms_r.entails

/-- `necessary-self-atoms-are-strong-atoms-t-implies-self-atoms-are-strong-atoms-t` -/
theorem necessary_self_atoms_are_strong_atoms_t_implies_self_atoms_are_strong_atoms_t : Statements.necessary_self_atoms_are_strong_atoms_t_implies_self_atoms_are_strong_atoms_t := by
  map_cert Proofs.necessary_self_atoms_are_strong_atoms_t_implies_self_atoms_are_strong_atoms_t.entails

/-- `no-pure-contingency-and-atoms-are-self-atoms-r-imply-necessary-atoms-are-self-atoms-r` -/
theorem no_pure_contingency_and_atoms_are_self_atoms_r_imply_necessary_atoms_are_self_atoms_r : Statements.no_pure_contingency_and_atoms_are_self_atoms_r_imply_necessary_atoms_are_self_atoms_r := by
  map_cert (Entails.mono_right (Ax₃ := P.NecAtomsAreSelfAtoms.schema) (by map_box)
    (npc_union_entails_box_pure P.AtomsAreSelfAtoms.schema_closedTypes))

/-- `no-pure-contingency-and-atoms-are-self-atoms-t-imply-necessary-atoms-are-self-atoms-t` -/
theorem no_pure_contingency_and_atoms_are_self_atoms_t_imply_necessary_atoms_are_self_atoms_t : Statements.no_pure_contingency_and_atoms_are_self_atoms_t_imply_necessary_atoms_are_self_atoms_t := by
  map_cert (Entails.mono_right (Ax₃ := P.NecAtomsAreSelfAtomsT.schema) (by map_box)
    (npc_union_entails_box_pure P.AtomsAreSelfAtomsT.schema_closedTypes))

/-- `no-pure-contingency-and-atoms-are-strong-atoms-r-imply-necessary-atoms-are-strong-atoms-r` -/
theorem no_pure_contingency_and_atoms_are_strong_atoms_r_imply_necessary_atoms_are_strong_atoms_r : Statements.no_pure_contingency_and_atoms_are_strong_atoms_r_imply_necessary_atoms_are_strong_atoms_r := by
  map_cert (Entails.mono_right (Ax₃ := P.NecAtomsAreStrongAtoms.schema) (by map_box)
    (npc_union_entails_box_pure P.AtomsAreStrongAtoms.schema_closedTypes))

/-- `no-pure-contingency-and-atoms-are-strong-atoms-t-imply-necessary-atoms-are-strong-atoms-t` -/
theorem no_pure_contingency_and_atoms_are_strong_atoms_t_imply_necessary_atoms_are_strong_atoms_t : Statements.no_pure_contingency_and_atoms_are_strong_atoms_t_imply_necessary_atoms_are_strong_atoms_t := by
  map_cert (Entails.mono_right (Ax₃ := P.NecAtomsAreStrongAtomsT.schema) (by map_box)
    (npc_union_entails_box_pure P.AtomsAreStrongAtomsT.schema_closedTypes))

/-- `no-pure-contingency-and-self-atomicity-r-imply-necessary-self-atomicity-r` -/
theorem no_pure_contingency_and_self_atomicity_r_imply_necessary_self_atomicity_r : Statements.no_pure_contingency_and_self_atomicity_r_imply_necessary_self_atomicity_r := by
  map_cert (Entails.mono_right (Ax₃ := P.NecSelfAtomicity.schema) (by map_box)
    (npc_union_entails_box_pure P.SelfAtomicity.schema_closedTypes))

/-- `no-pure-contingency-and-self-atomicity-t-imply-necessary-self-atomicity-t` -/
theorem no_pure_contingency_and_self_atomicity_t_imply_necessary_self_atomicity_t : Statements.no_pure_contingency_and_self_atomicity_t_imply_necessary_self_atomicity_t := by
  map_cert (Entails.mono_right (Ax₃ := P.NecSelfAtomicityT.schema) (by map_box)
    (npc_union_entails_box_pure P.SelfAtomicityT.schema_closedTypes))

/-- `no-pure-contingency-and-self-atoms-are-atoms-r-imply-necessary-self-atoms-are-atoms-r` -/
theorem no_pure_contingency_and_self_atoms_are_atoms_r_imply_necessary_self_atoms_are_atoms_r : Statements.no_pure_contingency_and_self_atoms_are_atoms_r_imply_necessary_self_atoms_are_atoms_r := by
  map_cert (Entails.mono_right (Ax₃ := P.NecSelfAtomsAreAtoms.schema) (by map_box)
    (npc_union_entails_box_pure P.SelfAtomsAreAtoms.schema_closedTypes))

/-- `no-pure-contingency-and-self-atoms-are-atoms-t-imply-necessary-self-atoms-are-atoms-t` -/
theorem no_pure_contingency_and_self_atoms_are_atoms_t_imply_necessary_self_atoms_are_atoms_t : Statements.no_pure_contingency_and_self_atoms_are_atoms_t_imply_necessary_self_atoms_are_atoms_t := by
  map_cert (Entails.mono_right (Ax₃ := P.NecSelfAtomsAreAtomsT.schema) (by map_box)
    (npc_union_entails_box_pure P.SelfAtomsAreAtomsT.schema_closedTypes))

/-- `no-pure-contingency-and-self-atoms-are-strong-atoms-r-imply-necessary-self-atoms-are-strong-atoms-r` -/
theorem no_pure_contingency_and_self_atoms_are_strong_atoms_r_imply_necessary_self_atoms_are_strong_atoms_r : Statements.no_pure_contingency_and_self_atoms_are_strong_atoms_r_imply_necessary_self_atoms_are_strong_atoms_r := by
  map_cert (Entails.mono_right (Ax₃ := P.NecSelfAtomsAreStrongAtoms.schema) (by map_box)
    (npc_union_entails_box_pure P.SelfAtomsAreStrongAtoms.schema_closedTypes))

/-- `no-pure-contingency-and-self-atoms-are-strong-atoms-t-imply-necessary-self-atoms-are-strong-atoms-t` -/
theorem no_pure_contingency_and_self_atoms_are_strong_atoms_t_imply_necessary_self_atoms_are_strong_atoms_t : Statements.no_pure_contingency_and_self_atoms_are_strong_atoms_t_imply_necessary_self_atoms_are_strong_atoms_t := by
  map_cert (Entails.mono_right (Ax₃ := P.NecSelfAtomsAreStrongAtomsT.schema) (by map_box)
    (npc_union_entails_box_pure P.SelfAtomsAreStrongAtomsT.schema_closedTypes))

/-- `self-atomicity-atomicity-t-weak-rigid-comprehension-and-relational-choice-imply-intensional-choice` -/
theorem self_atomicity_atomicity_t_weak_rigid_comprehension_and_relational_choice_imply_intensional_choice : Statements.self_atomicity_atomicity_t_weak_rigid_comprehension_and_relational_choice_imply_intensional_choice := by
  map_cert Proofs.self_atomicity_atomicity_t_weak_rigid_comprehension_and_relational_choice_imply_intensional_choice.entails

/-- `self-atomicity-r-and-self-atoms-are-atoms-r-imply-atomicity-r` -/
theorem self_atomicity_r_and_self_atoms_are_atoms_r_imply_atomicity_r : Statements.self_atomicity_r_and_self_atoms_are_atoms_r_imply_atomicity_r := by
  map_cert Proofs.self_atomicity_r_and_self_atoms_are_atoms_r_imply_atomicity_r.entails

/-- `self-atomicity-r-and-self-atoms-are-strong-atoms-r-imply-strong-atomicity-r` -/
theorem self_atomicity_r_and_self_atoms_are_strong_atoms_r_imply_strong_atomicity_r : Statements.self_atomicity_r_and_self_atoms_are_strong_atoms_r_imply_strong_atomicity_r := by
  map_cert Proofs.self_atomicity_r_and_self_atoms_are_strong_atoms_r_imply_strong_atomicity_r.entails

/-- `self-atomicity-r-implies-atoms-are-self-atoms-r` -/
theorem self_atomicity_r_implies_atoms_are_self_atoms_r : Statements.self_atomicity_r_implies_atoms_are_self_atoms_r := by
  map_cert Proofs.self_atomicity_r_implies_atoms_are_self_atoms_r.entails

/-- `self-atomicity-r-implies-self-atomicity-t` -/
theorem self_atomicity_r_implies_self_atomicity_t : Statements.self_atomicity_r_implies_self_atomicity_t := by
  map_cert Proofs.self_atomicity_r_implies_self_atomicity_t.entails

/-- `self-atomicity-t-and-bf-imply-self-atomicity-r` -/
theorem self_atomicity_t_and_bf_imply_self_atomicity_r : Statements.self_atomicity_t_and_bf_imply_self_atomicity_r := by
  map_cert Meta.self_atomicity_t_and_bf_imply_self_atomicity_r

/-- `self-atomicity-t-and-self-atoms-are-atoms-t-imply-atomicity-t` -/
theorem self_atomicity_t_and_self_atoms_are_atoms_t_imply_atomicity_t : Statements.self_atomicity_t_and_self_atoms_are_atoms_t_imply_atomicity_t := by
  map_cert Proofs.self_atomicity_t_and_self_atoms_are_atoms_t_imply_atomicity_t.entails

/-- `self-atomicity-t-and-self-atoms-are-strong-atoms-t-imply-strong-atomicity-t` -/
theorem self_atomicity_t_and_self_atoms_are_strong_atoms_t_imply_strong_atomicity_t : Statements.self_atomicity_t_and_self_atoms_are_strong_atoms_t_imply_strong_atomicity_t := by
  map_cert Proofs.self_atomicity_t_and_self_atoms_are_strong_atoms_t_imply_strong_atomicity_t.entails

/-- `self-atomicity-t-implies-atoms-are-self-atoms-t` -/
theorem self_atomicity_t_implies_atoms_are_self_atoms_t : Statements.self_atomicity_t_implies_atoms_are_self_atoms_t := by
  map_cert Proofs.self_atomicity_t_implies_atoms_are_self_atoms_t.entails

/-- `self-atomicity-t-implies-necessary-actuality` -/
theorem self_atomicity_t_implies_necessary_actuality : Statements.self_atomicity_t_implies_necessary_actuality := by
  map_cert Proofs.self_atomicity_t_implies_necessary_actuality.entails

/-- `self-atomicity-t-implies-two-hat-implies-nd` -/
theorem self_atomicity_t_implies_two_hat_implies_nd : Statements.self_atomicity_t_implies_two_hat_implies_nd := by
  map_cert Proofs.self_atomicity_t_implies_two_hat_implies_nd.entails

/-- `self-atoms-are-atoms-r-implies-self-atoms-are-atoms-t` -/
theorem self_atoms_are_atoms_r_implies_self_atoms_are_atoms_t : Statements.self_atoms_are_atoms_r_implies_self_atoms_are_atoms_t := by
  map_cert Proofs.self_atoms_are_atoms_r_implies_self_atoms_are_atoms_t.entails

/-- `self-atoms-are-atoms-t-and-bf-imply-self-atoms-are-atoms-r` -/
theorem self_atoms_are_atoms_t_and_bf_imply_self_atoms_are_atoms_r : Statements.self_atoms_are_atoms_t_and_bf_imply_self_atoms_are_atoms_r := by
  map_cert Proofs.self_atoms_are_atoms_t_implies_self_atoms_are_atoms_r.entails

/-- `self-atoms-are-strong-atoms-r-implies-self-atoms-are-atoms-r` -/
theorem self_atoms_are_strong_atoms_r_implies_self_atoms_are_atoms_r : Statements.self_atoms_are_strong_atoms_r_implies_self_atoms_are_atoms_r := by
  map_cert Proofs.self_atoms_are_strong_atoms_r_implies_self_atoms_are_atoms_r.entails

/-- `self-atoms-are-strong-atoms-r-implies-self-atoms-are-strong-atoms-t` -/
theorem self_atoms_are_strong_atoms_r_implies_self_atoms_are_strong_atoms_t : Statements.self_atoms_are_strong_atoms_r_implies_self_atoms_are_strong_atoms_t := by
  map_cert Proofs.self_atoms_are_strong_atoms_r_implies_self_atoms_are_strong_atoms_t.entails

/-- `self-atoms-are-strong-atoms-t-and-bf-imply-self-atoms-are-strong-atoms-r` -/
theorem self_atoms_are_strong_atoms_t_and_bf_imply_self_atoms_are_strong_atoms_r : Statements.self_atoms_are_strong_atoms_t_and_bf_imply_self_atoms_are_strong_atoms_r := by
  map_cert Meta.self_atoms_are_strong_atoms_t_and_bf_imply_self_atoms_are_strong_atoms_r

/-- `self-atoms-are-strong-atoms-t-implies-self-atoms-are-atoms-t` -/
theorem self_atoms_are_strong_atoms_t_implies_self_atoms_are_atoms_t : Statements.self_atoms_are_strong_atoms_t_implies_self_atoms_are_atoms_t := by
  map_cert Proofs.self_atoms_are_strong_atoms_t_implies_self_atoms_are_atoms_t.entails

/-- `strong-atomicity-r-implies-atoms-are-strong-atoms-r` -/
theorem strong_atomicity_r_implies_atoms_are_strong_atoms_r : Statements.strong_atomicity_r_implies_atoms_are_strong_atoms_r := by
  map_cert Proofs.strong_atomicity_r_implies_atoms_are_strong_atoms_r.entails

/-- `strong-atomicity-r-implies-self-atomicity-r` -/
theorem strong_atomicity_r_implies_self_atomicity_r : Statements.strong_atomicity_r_implies_self_atomicity_r := by
  map_cert Proofs.strong_atomicity_r_implies_self_atomicity_r.entails

/-- `strong-atomicity-t-implies-atoms-are-strong-atoms-t` -/
theorem strong_atomicity_t_implies_atoms_are_strong_atoms_t : Statements.strong_atomicity_t_implies_atoms_are_strong_atoms_t := by
  map_cert Proofs.strong_atomicity_t_implies_atoms_are_strong_atoms_t.entails

/-- `strong-atomicity-t-implies-necessary-strong-actuality` -/
theorem strong_atomicity_t_implies_necessary_strong_actuality : Statements.strong_atomicity_t_implies_necessary_strong_actuality := by
  map_cert Proofs.strong_atomicity_t_implies_necessary_strong_actuality.entails

/-- `strong-atomicity-t-implies-self-atomicity-t` -/
theorem strong_atomicity_t_implies_self_atomicity_t : Statements.strong_atomicity_t_implies_self_atomicity_t := by
  map_cert Proofs.strong_atomicity_t_implies_self_atomicity_t.entails

/-- `necessary-actuality-and-necessary-self-atoms-are-strong-atoms-t-imply-necessary-strong-actuality` -/
theorem necessary_actuality_and_necessary_self_atoms_are_strong_atoms_t_imply_necessary_strong_actuality : Statements.necessary_actuality_and_necessary_self_atoms_are_strong_atoms_t_imply_necessary_strong_actuality := by
  map_boxed actuality_and_self_atoms_are_strong_atoms_t_imply_strong_actuality

/-- `necessary-atomicity-r-and-necessary-atoms-are-self-atoms-r-imply-necessary-self-atomicity-r` -/
theorem necessary_atomicity_r_and_necessary_atoms_are_self_atoms_r_imply_necessary_self_atomicity_r : Statements.necessary_atomicity_r_and_necessary_atoms_are_self_atoms_r_imply_necessary_self_atomicity_r := by
  map_boxed atomicity_r_and_atoms_are_self_atoms_r_imply_self_atomicity_r

/-- `necessary-atomicity-r-and-necessary-atoms-are-strong-atoms-r-imply-necessary-strong-atomicity-r` -/
theorem necessary_atomicity_r_and_necessary_atoms_are_strong_atoms_r_imply_necessary_strong_atomicity_r : Statements.necessary_atomicity_r_and_necessary_atoms_are_strong_atoms_r_imply_necessary_strong_atomicity_r := by
  map_boxed atomicity_r_and_atoms_are_strong_atoms_r_imply_strong_atomicity_r

/-- `necessary-atomicity-t-and-necessary-atoms-are-self-atoms-t-imply-necessary-self-atomicity-t` -/
theorem necessary_atomicity_t_and_necessary_atoms_are_self_atoms_t_imply_necessary_self_atomicity_t : Statements.necessary_atomicity_t_and_necessary_atoms_are_self_atoms_t_imply_necessary_self_atomicity_t := by
  map_boxed atomicity_t_and_atoms_are_self_atoms_t_imply_self_atomicity_t

/-- `necessary-atomicity-t-and-necessary-atoms-are-strong-atoms-t-imply-necessary-strong-atomicity-t` -/
theorem necessary_atomicity_t_and_necessary_atoms_are_strong_atoms_t_imply_necessary_strong_atomicity_t : Statements.necessary_atomicity_t_and_necessary_atoms_are_strong_atoms_t_imply_necessary_strong_atomicity_t := by
  map_boxed atomicity_t_and_atoms_are_strong_atoms_t_imply_strong_atomicity_t

/-- `necessary-atomlessness-implies-necessary-atoms-are-strong-atoms-r` -/
theorem necessary_atomlessness_implies_necessary_atoms_are_strong_atoms_r : Statements.necessary_atomlessness_implies_necessary_atoms_are_strong_atoms_r := by
  map_boxed atomlessness_implies_atoms_are_strong_atoms_r

/-- `necessary-atoms-are-self-atoms-r-and-necessary-self-atoms-are-strong-atoms-r-imply-necessary-atoms-are-strong-atoms-r` -/
theorem necessary_atoms_are_self_atoms_r_and_necessary_self_atoms_are_strong_atoms_r_imply_necessary_atoms_are_strong_atoms_r : Statements.necessary_atoms_are_self_atoms_r_and_necessary_self_atoms_are_strong_atoms_r_imply_necessary_atoms_are_strong_atoms_r := by
  map_boxed atoms_are_self_atoms_r_and_self_atoms_are_strong_atoms_r_imply_atoms_are_strong_atoms_r

/-- `necessary-atoms-are-self-atoms-r-implies-necessary-atoms-are-self-atoms-t` -/
theorem necessary_atoms_are_self_atoms_r_implies_necessary_atoms_are_self_atoms_t : Statements.necessary_atoms_are_self_atoms_r_implies_necessary_atoms_are_self_atoms_t := by
  map_boxed atoms_are_self_atoms_r_implies_atoms_are_self_atoms_t

/-- `necessary-atoms-are-self-atoms-t-and-necessary-self-atoms-are-strong-atoms-t-imply-necessary-atoms-are-strong-atoms-t` -/
theorem necessary_atoms_are_self_atoms_t_and_necessary_self_atoms_are_strong_atoms_t_imply_necessary_atoms_are_strong_atoms_t : Statements.necessary_atoms_are_self_atoms_t_and_necessary_self_atoms_are_strong_atoms_t_imply_necessary_atoms_are_strong_atoms_t := by
  map_boxed atoms_are_self_atoms_t_and_self_atoms_are_strong_atoms_t_imply_atoms_are_strong_atoms_t

/-- `necessary-atoms-are-strong-atoms-r-and-necessary-self-atoms-are-atoms-r-imply-necessary-self-atoms-are-strong-atoms-r` -/
theorem necessary_atoms_are_strong_atoms_r_and_necessary_self_atoms_are_atoms_r_imply_necessary_self_atoms_are_strong_atoms_r : Statements.necessary_atoms_are_strong_atoms_r_and_necessary_self_atoms_are_atoms_r_imply_necessary_self_atoms_are_strong_atoms_r := by
  map_boxed atoms_are_strong_atoms_r_and_self_atoms_are_atoms_r_imply_self_atoms_are_strong_atoms_r

/-- `necessary-atoms-are-strong-atoms-r-implies-necessary-atoms-are-self-atoms-r` -/
theorem necessary_atoms_are_strong_atoms_r_implies_necessary_atoms_are_self_atoms_r : Statements.necessary_atoms_are_strong_atoms_r_implies_necessary_atoms_are_self_atoms_r := by
  map_boxed atoms_are_strong_atoms_r_implies_atoms_are_self_atoms_r

/-- `necessary-atoms-are-strong-atoms-r-implies-necessary-atoms-are-strong-atoms-t` -/
theorem necessary_atoms_are_strong_atoms_r_implies_necessary_atoms_are_strong_atoms_t : Statements.necessary_atoms_are_strong_atoms_r_implies_necessary_atoms_are_strong_atoms_t := by
  map_boxed atoms_are_strong_atoms_r_implies_atoms_are_strong_atoms_t

/-- `necessary-atoms-are-strong-atoms-t-and-necessary-actuality-imply-necessary-strong-actuality` -/
theorem necessary_atoms_are_strong_atoms_t_and_necessary_actuality_imply_necessary_strong_actuality : Statements.necessary_atoms_are_strong_atoms_t_and_necessary_actuality_imply_necessary_strong_actuality := by
  map_boxed atoms_are_strong_atoms_t_and_actuality_imply_strong_actuality

/-- `necessary-atoms-are-strong-atoms-t-and-necessary-self-atoms-are-atoms-t-imply-necessary-self-atoms-are-strong-atoms-t` -/
theorem necessary_atoms_are_strong_atoms_t_and_necessary_self_atoms_are_atoms_t_imply_necessary_self_atoms_are_strong_atoms_t : Statements.necessary_atoms_are_strong_atoms_t_and_necessary_self_atoms_are_atoms_t_imply_necessary_self_atoms_are_strong_atoms_t := by
  map_boxed atoms_are_strong_atoms_t_and_self_atoms_are_atoms_t_imply_self_atoms_are_strong_atoms_t

/-- `necessary-atoms-are-strong-atoms-t-implies-necessary-atoms-are-self-atoms-t` -/
theorem necessary_atoms_are_strong_atoms_t_implies_necessary_atoms_are_self_atoms_t : Statements.necessary_atoms_are_strong_atoms_t_implies_necessary_atoms_are_self_atoms_t := by
  map_boxed atoms_are_strong_atoms_t_implies_atoms_are_self_atoms_t

/-- `necessary-barcan-relational-implies-necessary-atoms-are-strong-atoms-r` -/
theorem necessary_barcan_relational_implies_necessary_atoms_are_strong_atoms_r : Statements.necessary_barcan_relational_implies_necessary_atoms_are_strong_atoms_r := by
  map_boxed barcan_relational_implies_atoms_are_strong_atoms_r

/-- `necessary-barcan-t-implies-necessary-atoms-are-strong-atoms-t` -/
theorem necessary_barcan_t_implies_necessary_atoms_are_strong_atoms_t : Statements.necessary_barcan_t_implies_necessary_atoms_are_strong_atoms_t := by
  map_boxed barcan_t_implies_atoms_are_strong_atoms_t

/-- `necessary-modal-five-implies-necessary-self-atoms-are-atoms-r` -/
theorem necessary_modal_five_implies_necessary_self_atoms_are_atoms_r : Statements.necessary_modal_five_implies_necessary_self_atoms_are_atoms_r := by
  map_boxed modal_five_implies_self_atoms_are_atoms_r

/-- `necessary-self-atomicity-r-and-necessary-self-atoms-are-atoms-r-imply-necessary-atomicity-r` -/
theorem necessary_self_atomicity_r_and_necessary_self_atoms_are_atoms_r_imply_necessary_atomicity_r : Statements.necessary_self_atomicity_r_and_necessary_self_atoms_are_atoms_r_imply_necessary_atomicity_r := by
  map_boxed self_atomicity_r_and_self_atoms_are_atoms_r_imply_atomicity_r

/-- `necessary-self-atomicity-r-and-necessary-self-atoms-are-strong-atoms-r-imply-necessary-strong-atomicity-r` -/
theorem necessary_self_atomicity_r_and_necessary_self_atoms_are_strong_atoms_r_imply_necessary_strong_atomicity_r : Statements.necessary_self_atomicity_r_and_necessary_self_atoms_are_strong_atoms_r_imply_necessary_strong_atomicity_r := by
  map_boxed self_atomicity_r_and_self_atoms_are_strong_atoms_r_imply_strong_atomicity_r

/-- `necessary-self-atomicity-r-implies-necessary-atoms-are-self-atoms-r` -/
theorem necessary_self_atomicity_r_implies_necessary_atoms_are_self_atoms_r : Statements.necessary_self_atomicity_r_implies_necessary_atoms_are_self_atoms_r := by
  map_boxed self_atomicity_r_implies_atoms_are_self_atoms_r

/-- `necessary-self-atomicity-r-implies-necessary-self-atomicity-t` -/
theorem necessary_self_atomicity_r_implies_necessary_self_atomicity_t : Statements.necessary_self_atomicity_r_implies_necessary_self_atomicity_t := by
  map_boxed self_atomicity_r_implies_self_atomicity_t

/-- `necessary-self-atomicity-t-and-necessary-bf-imply-necessary-self-atomicity-r` -/
theorem necessary_self_atomicity_t_and_necessary_bf_imply_necessary_self_atomicity_r : Statements.necessary_self_atomicity_t_and_necessary_bf_imply_necessary_self_atomicity_r := by
  map_boxed self_atomicity_t_and_bf_imply_self_atomicity_r

/-- `necessary-self-atomicity-t-and-necessary-self-atoms-are-atoms-t-imply-necessary-atomicity-t` -/
theorem necessary_self_atomicity_t_and_necessary_self_atoms_are_atoms_t_imply_necessary_atomicity_t : Statements.necessary_self_atomicity_t_and_necessary_self_atoms_are_atoms_t_imply_necessary_atomicity_t := by
  map_boxed self_atomicity_t_and_self_atoms_are_atoms_t_imply_atomicity_t

/-- `necessary-self-atomicity-t-and-necessary-self-atoms-are-strong-atoms-t-imply-necessary-strong-atomicity-t` -/
theorem necessary_self_atomicity_t_and_necessary_self_atoms_are_strong_atoms_t_imply_necessary_strong_atomicity_t : Statements.necessary_self_atomicity_t_and_necessary_self_atoms_are_strong_atoms_t_imply_necessary_strong_atomicity_t := by
  map_boxed self_atomicity_t_and_self_atoms_are_strong_atoms_t_imply_strong_atomicity_t

/-- `necessary-self-atomicity-t-implies-necessary-atoms-are-self-atoms-t` -/
theorem necessary_self_atomicity_t_implies_necessary_atoms_are_self_atoms_t : Statements.necessary_self_atomicity_t_implies_necessary_atoms_are_self_atoms_t := by
  map_boxed self_atomicity_t_implies_atoms_are_self_atoms_t

/-- `necessary-self-atomicity-t-implies-necessary-two-hat-implies-nd` -/
theorem necessary_self_atomicity_t_implies_necessary_two_hat_implies_nd : Statements.necessary_self_atomicity_t_implies_necessary_two_hat_implies_nd := by
  map_boxed self_atomicity_t_implies_two_hat_implies_nd

/-- `necessary-self-atoms-are-atoms-r-implies-necessary-self-atoms-are-atoms-t` -/
theorem necessary_self_atoms_are_atoms_r_implies_necessary_self_atoms_are_atoms_t : Statements.necessary_self_atoms_are_atoms_r_implies_necessary_self_atoms_are_atoms_t := by
  map_boxed self_atoms_are_atoms_r_implies_self_atoms_are_atoms_t

/-- `necessary-self-atoms-are-atoms-t-and-necessary-bf-imply-necessary-self-atoms-are-atoms-r` -/
theorem necessary_self_atoms_are_atoms_t_and_necessary_bf_imply_necessary_self_atoms_are_atoms_r : Statements.necessary_self_atoms_are_atoms_t_and_necessary_bf_imply_necessary_self_atoms_are_atoms_r := by
  map_boxed self_atoms_are_atoms_t_and_bf_imply_self_atoms_are_atoms_r

/-- `necessary-self-atoms-are-strong-atoms-r-implies-necessary-self-atoms-are-atoms-r` -/
theorem necessary_self_atoms_are_strong_atoms_r_implies_necessary_self_atoms_are_atoms_r : Statements.necessary_self_atoms_are_strong_atoms_r_implies_necessary_self_atoms_are_atoms_r := by
  map_boxed self_atoms_are_strong_atoms_r_implies_self_atoms_are_atoms_r

/-- `necessary-self-atoms-are-strong-atoms-r-implies-necessary-self-atoms-are-strong-atoms-t` -/
theorem necessary_self_atoms_are_strong_atoms_r_implies_necessary_self_atoms_are_strong_atoms_t : Statements.necessary_self_atoms_are_strong_atoms_r_implies_necessary_self_atoms_are_strong_atoms_t := by
  map_boxed self_atoms_are_strong_atoms_r_implies_self_atoms_are_strong_atoms_t

/-- `necessary-self-atoms-are-strong-atoms-t-and-necessary-bf-imply-necessary-self-atoms-are-strong-atoms-r` -/
theorem necessary_self_atoms_are_strong_atoms_t_and_necessary_bf_imply_necessary_self_atoms_are_strong_atoms_r : Statements.necessary_self_atoms_are_strong_atoms_t_and_necessary_bf_imply_necessary_self_atoms_are_strong_atoms_r := by
  map_boxed self_atoms_are_strong_atoms_t_and_bf_imply_self_atoms_are_strong_atoms_r

/-- `necessary-self-atoms-are-strong-atoms-t-implies-necessary-self-atoms-are-atoms-t` -/
theorem necessary_self_atoms_are_strong_atoms_t_implies_necessary_self_atoms_are_atoms_t : Statements.necessary_self_atoms_are_strong_atoms_t_implies_necessary_self_atoms_are_atoms_t := by
  map_boxed self_atoms_are_strong_atoms_t_implies_self_atoms_are_atoms_t

/-- `necessary-strong-atomicity-r-implies-necessary-atoms-are-strong-atoms-r` -/
theorem necessary_strong_atomicity_r_implies_necessary_atoms_are_strong_atoms_r : Statements.necessary_strong_atomicity_r_implies_necessary_atoms_are_strong_atoms_r := by
  map_boxed strong_atomicity_r_implies_atoms_are_strong_atoms_r

/-- `necessary-strong-atomicity-r-implies-necessary-self-atomicity-r` -/
theorem necessary_strong_atomicity_r_implies_necessary_self_atomicity_r : Statements.necessary_strong_atomicity_r_implies_necessary_self_atomicity_r := by
  map_boxed strong_atomicity_r_implies_self_atomicity_r

/-- `necessary-strong-atomicity-t-implies-necessary-atoms-are-strong-atoms-t` -/
theorem necessary_strong_atomicity_t_implies_necessary_atoms_are_strong_atoms_t : Statements.necessary_strong_atomicity_t_implies_necessary_atoms_are_strong_atoms_t := by
  map_boxed strong_atomicity_t_implies_atoms_are_strong_atoms_t

/-- `necessary-strong-atomicity-t-implies-necessary-self-atomicity-t` -/
theorem necessary_strong_atomicity_t_implies_necessary_self_atomicity_t : Statements.necessary_strong_atomicity_t_implies_necessary_self_atomicity_t := by
  map_boxed strong_atomicity_t_implies_self_atomicity_t

end Classicism.Map
