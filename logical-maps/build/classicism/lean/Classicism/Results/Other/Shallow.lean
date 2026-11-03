import Classicism.Results.Records

/-!
# Further records, proved in the shallow layer (1 November 2026)

Records of the map proved here in the shallow layer, beside those of `Results/Records/`, and
certified in `Results/Other/Certificates.lean`. Each theorem is named by its record's id, in
the namespace `Classicism.Proofs.Other`.
-/

namespace Classicism.Proofs.Other

open Classicism.Proofs Classicism.P Classicism.Paper

/-- `necessary-atomlessness-implies-atomlessness`: `T`. -/
theorem necessary_atomlessness_implies_atomlessness : NecAtomlessness → Atomlessness :=
  fun h => box_elim h

/-- `necessary-distinctness-preserving-collapse-implies-distinctness-preserving-collapse`: `T`. -/
theorem necessary_distinctness_preserving_collapse_implies_distinctness_preserving_collapse :
    NecTruthsAreNDNecessary → TruthsAreNDNecessary :=
  fun h => box_elim h

/-- `tame-rigidity-and-bf-t-imply-necessary-bf-t`: the record at `t` of
`tame-rigidity-and-barcan-imply-necessary-barcan`: Tame Rigidity at `t → t` makes the weakly
rigid `λp. ⊤` rigid, and its inextensibility is `□`BF at `t`. -/
theorem tame_rigidity_and_bf_t_imply_necessary_bf_t :
    TameRigidity (Prop → Prop) → BarcanT → NecBarcanT :=
  tame_rigidity_and_barcan_imply_necessary_barcan (σ := Prop)

/-- `rigid-comprehension-and-bf-t-imply-necessary-bf-t`: Rigid Comprehension at `t → t` gives
Tame Rigidity there (`rigid-comprehension-implies-tame-rigidity`). -/
theorem rigid_comprehension_and_bf_t_imply_necessary_bf_t :
    RigidComprehension (Prop → Prop) → BarcanT → NecBarcanT := fun rc =>
  tame_rigidity_and_bf_t_imply_necessary_bf_t (rigid_comprehension_implies_tame_rigidity rc)

/-- `rigid-rigidity-and-rigid-power-imply-necessary-rigid-power`: every rigid `F` has its rigid
power property rigid, by Rigid Power, and so necessarily (`rigid_necessary`); the weak
inextensibility of `λX. Rigid X`, from Rigid Rigidity, makes that hold necessarily for every
rigid `F`, which is `□`Rigid Power. -/
theorem rigid_rigidity_and_rigid_power_imply_necessary_rigid_power {τ : Type} [Rel τ] :
    RigidRigidity τ → RigidPower τ → NecRigidPower τ := fun rr rp =>
  (weaklyInextensible_of_inextensible rr.2) (fun F : τ => Rigid (fun X : τ => Rigid X ∧ X ≤ F))
    (fun F hF => rigid_necessary _ (rp F hF))

/-! ### `C5` and Atomlessness -/

/-- Under `5` and `ND` at `t`, a witness of Atomlessness at `p` is one necessarily. -/
theorem box_atomless_witness (five : ModalFive) (nd : NecessityOfDistinctnessT) (p q : Prop)
    (h : ◇ q ∧ q ≤ p ∧ q ≠ p) : □ (◇ q ∧ q ≤ p ∧ q ≠ p) :=
  modal_K _ _ (modal_K _ _ (modal_K _ _
    (nec% (fun (a : ◇ q) (b : □ (q ⊆ p)) (c : q ≠ p) => (⟨a, (le_iff_prop q p).2 b, c⟩ :
      ◇ q ∧ q ≤ p ∧ q ≠ p)))
    (five q h.1)) (modal_four _ ((le_iff_prop q p).1 h.2.1))) (nd q p h.2.2)

/-- `c5-and-atomlessness-imply-necessary-atomlessness`: `□ND` at `t` gives `5`, `ND` and `BF`
at `t`; with them each instance of Atomlessness is necessary, its witness necessarily one when
`◇p`, and `◇p` necessarily false when false; `BF` boxes the quantifier. -/
theorem c5_and_atomlessness_imply_necessary_atomlessness :
    NecNecessityOfDistinctness Prop → Atomlessness → NecAtomlessness := fun hnd al =>
  have nd : NecessityOfDistinctnessT := box_elim hnd
  have five : ModalFive := Proofs.distinctness_necessary_t_implies_modal_five nd
  bf_of_box_nd_t (σ := Prop) hnd (λ p ↦ ◇ p → ∃ q : Prop, ◇ q ∧ q ≤ p ∧ q ≠ p) fun p =>
    (em (◇ p)).elim
      (fun hp => (al p hp).elim fun q hq =>
        modal_K _ _ (nec% (fun (h : ◇ q ∧ q ≤ p ∧ q ≠ p) (_ : ◇ p) =>
          (⟨q, h⟩ : ∃ q : Prop, ◇ q ∧ q ≤ p ∧ q ≠ p))) (box_atomless_witness five nd p q hq))
      (fun hn => modal_K _ _
        (nec% (fun (h : □ (¬ p)) (hd : ◇ p) => absurd hd (not_dia_of_box_not p h) :
          □ (¬ p) → ◇ p → ∃ q : Prop, ◇ q ∧ q ≤ p ∧ q ≠ p))
        (modal_four _ (box_not_of_not_dia p hn)))

end Classicism.Proofs.Other
