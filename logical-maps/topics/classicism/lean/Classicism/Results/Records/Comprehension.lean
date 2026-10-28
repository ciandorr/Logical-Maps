import Classicism.Paper
import Classicism.Principles
import Classicism.Background.RigidityClosure

/-!
# Proofs of map records: Comprehension

Records among the comprehension principles (Classicism, §2.3; Dorr, *BC does not imply
RC*). Those whose premise is Actuality or Boolean Completeness are in `Lattice.lean`.
The conventions are in `Results/Records.lean`.
-/

namespace Classicism.Proofs
open Classicism.P Classicism.Paper

/-! ### Comprehension (Classicism, §2.3; Dorr, *BC does not imply RC*) -/

/-- `rigid-comprehension-r-implies-persistent-comprehension-r`: the first conjunct. -/
theorem rigid_comprehension_r_implies_persistent_comprehension_r {τ : Type} [Rel τ] :
    RigidComprehension τ → PersistentComprehension τ := by
  intro rc X
  obtain ⟨Y, hY, hco⟩ := rc X
  exact ⟨Y, hY.1, hco⟩

/-- `rigid-comprehension-r-implies-inextensible-comprehension-r`: the second conjunct. -/
theorem rigid_comprehension_r_implies_inextensible_comprehension_r {τ : Type} [Rel τ] :
    RigidComprehension τ → InextensibleComprehension τ := by
  intro rc X
  obtain ⟨Y, hY, hco⟩ := rc X
  exact ⟨Y, hY.2, hco⟩

/-- `rigid-comprehension-r-implies-weak-rigid-comprehension-r`: `T` strips the leading
boxes from both conjuncts of rigidity. So the rigid coextension already witnesses the
weaker principle. -/
theorem rigid_comprehension_r_implies_weak_rigid_comprehension_r {τ : Type} [Rel τ] :
    RigidComprehension τ → WeakRigidComprehension τ := by
  intro rc X
  obtain ⟨Y, hY, hco⟩ := rc X
  exact ⟨Y, weaklyRigid_of_rigid hY, hco⟩

/-- `weak-rigid-comprehension-r-implies-persistent-comprehension-r`: a weakly rigid
relation is persistent (`persistent_of_weaklyRigid`). -/
theorem weak_rigid_comprehension_r_implies_persistent_comprehension_r {τ : Type} [Rel τ]
    [Pointwise τ] : WeakRigidComprehension τ → PersistentComprehension τ := by
  intro wrc X
  obtain ⟨Y, hY, hco⟩ := wrc X
  exact ⟨Y, persistent_of_weaklyRigid hY, hco⟩

/-- Closed lemma for the Gallin argument: a relation holding of `a` and failing of `b`
distinguishes them, by Leibniz's Law. Being closed, it may be necessitated. -/
theorem ne_of_holds_and_not_holds {σ : Type} [Ty σ] (Y : σ → Prop) (a b : σ) :
    (Y a ∧ ¬ Y b) → a ≠ b := fun ⟨hYa, hnYb⟩ hab => hnYb (hab ▸ hYa)

/-- `gallin-comprehension-implies-nd`. Apply Gallin Extensional Comprehension to
`λx^σ. x = a`, of the admitted type `σt`, and let `Y` be the coextension supplied.
Coextensiveness gives `Ya` from `a = a` and `¬Yb` from `b ≠ a`; persistence of `Y` and of
`¬Y` boxes each. The box distributes over the conjunction, and the closed lemma above
necessitates, so `K` yields `□(a ≠ b)`. The instance of the premise used is the one at
`σ → t`, for ND at `σ`. -/
theorem gallin_comprehension_implies_nd {σ : Type} [Ty σ] :
    GallinExtensionalComprehension (σ → Prop) → NecessityOfDistinctness σ := by
  intro gec a b hne
  obtain ⟨Y, hY, hnY, hco⟩ := gec (λ x : σ ↦ x = a)
  have hYa : Y a := (hco a).1 rfl
  have hnYb : ¬ Y b := fun hb => hne ((hco b).2 hb).symm
  have hbox : □ (Y a) ∧ □ (¬ Y b) :=
    ⟨weaklyPersistent_apply (weaklyPersistent_of_persistent hY) a hYa,
     weaklyPersistent_neg_apply (weaklyPersistent_of_persistent hnY) b hnYb⟩
  have hconj : □ (Y a ∧ ¬ Y b) := by rw [box_and_eq]; exact hbox
  exact modal_K _ _ (nec% (ne_of_holds_and_not_holds Y a b)) hconj

/-- `necessary-gallin-comprehension-implies-gallin-comprehension`: `T`. -/
theorem necessary_gallin_comprehension_implies_gallin_comprehension {τ : Type} [Rel τ] :
    NecGallinExtensionalComprehension τ → GallinExtensionalComprehension τ := box_elim

/-- `necessary-gallin-comprehension-implies-necessary-nd`: the last record necessitated. -/
theorem necessary_gallin_comprehension_implies_necessary_nd {σ : Type} [Ty σ] :
    NecGallinExtensionalComprehension (σ → Prop) → NecNecessityOfDistinctness σ :=
  modal_K _ _ (nec% (gallin_comprehension_implies_nd (σ := σ)))

/-- `fregean-axiom-implies-necessary-distinctness-necessary-r`: under the Fregean Axiom
what is true is `⊤`, so necessary; apply that to each distinctness and then to ND. -/
theorem fregean_axiom_implies_necessary_distinctness_necessary_r {σ : Type} [Ty σ] :
    FregeanAxiom → NecNecessityOfDistinctness σ := fun fa =>
  have box : ∀ p : Prop, p → □ p := fun p hp => fa p True ⟨fun _ => trivial, fun _ => hp⟩
  box _ (fun x y hne => box _ hne)

/-- `necessary-rigid-comprehension-r-implies-rigid-comprehension-r`: `T`. -/
theorem necessary_rigid_comprehension_r_implies_rigid_comprehension_r {τ : Type} [Rel τ] :
    NecRigidComprehension τ → RigidComprehension τ := box_elim
/-! ### Weakly Inextensible Comprehension (25–27 September) -/

/-- `inextensible-comprehension-r-implies-weakly-inextensible-comprehension-r`: `T` strips
the box of inextensibility; the same witness. -/
theorem inextensible_comprehension_r_implies_weakly_inextensible_comprehension_r
    {τ : Type} [Rel τ] : InextensibleComprehension τ → WeaklyInextensibleComprehension τ :=
  fun ic X => (ic X).elim fun Y hY => ⟨Y, weaklyInextensible_of_inextensible hY.1, hY.2⟩

/-- `weak-rigid-comprehension-r-implies-weakly-inextensible-comprehension-r`: weak
inextensibility is a conjunct of weak rigidity. -/
theorem weak_rigid_comprehension_r_implies_weakly_inextensible_comprehension_r
    {τ : Type} [Rel τ] : WeakRigidComprehension τ → WeaklyInextensibleComprehension τ :=
  fun wrc X => (wrc X).elim fun Y hY => ⟨Y, hY.1.2, hY.2⟩

/-- `necessary-weakly-inextensible-comprehension-r-implies-weakly-inextensible-comprehension-r`:
`T`. -/
theorem necessary_weakly_inextensible_comprehension_r_implies_weakly_inextensible_comprehension_r
    {τ : Type} [Rel τ] :
    NecWeaklyInextensibleComprehension τ → WeaklyInextensibleComprehension τ :=
  fun h => box_elim h


/-! ### The boxed comprehension principles, `T`, and boxing the unboxed records -/

/-- `necessary-weak-rigid-comprehension-r-implies-weak-rigid-comprehension-r`: `T`. -/
theorem necessary_weak_rigid_comprehension_r_implies_weak_rigid_comprehension_r {τ : Type} [Rel τ] :
    NecWeakRigidComprehension τ → WeakRigidComprehension τ := box_elim
/-- `necessary-persistent-comprehension-r-implies-persistent-comprehension-r`: `T`. -/
theorem necessary_persistent_comprehension_r_implies_persistent_comprehension_r {τ : Type} [Rel τ] :
    NecPersistentComprehension τ → PersistentComprehension τ := box_elim
/-- `necessary-inextensible-comprehension-r-implies-inextensible-comprehension-r`: `T`. -/
theorem necessary_inextensible_comprehension_r_implies_inextensible_comprehension_r {τ : Type} [Rel τ] :
    NecInextensibleComprehension τ → InextensibleComprehension τ := box_elim
/-- `necessary-tame-rigidity-r-implies-tame-rigidity-r`: `T`. -/
theorem necessary_tame_rigidity_r_implies_tame_rigidity_r {τ : Type} [Rel τ] :
    NecTameRigidity τ → TameRigidity τ := box_elim
/-- `necessary-rigid-power-r-implies-rigid-power-r`: `T`. -/
theorem necessary_rigid_power_r_implies_rigid_power_r {τ : Type} [Rel τ] :
    NecRigidPower τ → RigidPower τ := box_elim

/-- `necessary-rigid-comprehension-implies-necessary-weak-rigid-comprehension`: the unboxed
record, necessitated. -/
theorem necessary_rigid_comprehension_implies_necessary_weak_rigid_comprehension {τ : Type} [Rel τ] :
    NecRigidComprehension τ → NecWeakRigidComprehension τ :=
  modal_K _ _ (nec% (rigid_comprehension_r_implies_weak_rigid_comprehension_r (τ := τ)))
/-- `necessary-rigid-comprehension-implies-necessary-inextensible-comprehension`. -/
theorem necessary_rigid_comprehension_implies_necessary_inextensible_comprehension {τ : Type} [Rel τ] :
    NecRigidComprehension τ → NecInextensibleComprehension τ :=
  modal_K _ _ (nec% (rigid_comprehension_r_implies_inextensible_comprehension_r (τ := τ)))
/-- `necessary-weak-rigid-comprehension-implies-necessary-persistent-comprehension`. -/
theorem necessary_weak_rigid_comprehension_implies_necessary_persistent_comprehension {τ : Type} [Rel τ]
    [Pointwise τ] :
    NecWeakRigidComprehension τ → NecPersistentComprehension τ :=
  modal_K _ _ (nec% (weak_rigid_comprehension_r_implies_persistent_comprehension_r (τ := τ)))
/-- `necessary-inextensible-comprehension-implies-necessary-wic`. -/
theorem necessary_inextensible_comprehension_implies_necessary_wic {τ : Type} [Rel τ] :
    NecInextensibleComprehension τ → NecWeaklyInextensibleComprehension τ :=
  modal_K _ _ (nec% (inextensible_comprehension_r_implies_weakly_inextensible_comprehension_r (τ := τ)))


/-! ### Tame Rigidity -/

/-- `tame-rigidity-and-weak-rigid-comprehension-imply-rigid-comprehension`: the weakly rigid
coextension that Weak Rigid Comprehension gives is rigid. -/
theorem tame_rigidity_and_weak_rigid_comprehension_imply_rigid_comprehension {τ : Type} [Rel τ] :
    TameRigidity τ → WeakRigidComprehension τ → RigidComprehension τ :=
  fun tr wrc X => (wrc X).elim fun Y hY => ⟨Y, tr Y hY.1, hY.2⟩

/-- `necessary-tame-rigidity-and-necessary-weak-rigid-comprehension-imply-necessary-rigid-comprehension`:
the unboxed record, necessitated. -/
theorem necessary_tame_rigidity_and_necessary_weak_rigid_comprehension_imply_necessary_rigid_comprehension
    {τ : Type} [Rel τ] :
    NecTameRigidity τ → NecWeakRigidComprehension τ → NecRigidComprehension τ := fun h₁ h₂ =>
  modal_K _ _ (modal_K _ _
    (nec% (tame_rigidity_and_weak_rigid_comprehension_imply_rigid_comprehension (τ := τ))) h₁) h₂

/-- `rigid-comprehension-implies-tame-rigidity`: a weakly rigid `F` is coextensive with a rigid
`G`, which is weakly rigid, so `F = G`. -/
theorem rigid_comprehension_implies_tame_rigidity {τ : Type} [Rel τ] [Order τ] [Pointwise τ] :
    RigidComprehension τ → TameRigidity τ := fun rc F hF =>
  (rc F).elim fun G hG => (eq_of_weaklyRigid_coext hF (weaklyRigid_of_rigid hG.1) hG.2) ▸ hG.1

/-- `necessary-rigid-comprehension-implies-necessary-tame-rigidity`: the unboxed record,
necessitated. -/
theorem necessary_rigid_comprehension_implies_necessary_tame_rigidity {τ : Type} [Rel τ] [Order τ]
    [Pointwise τ] : NecRigidComprehension τ → NecTameRigidity τ :=
  modal_K _ _ (nec% (rigid_comprehension_implies_tame_rigidity (τ := τ)))

/-! ### Weakly Rigid Power, Rigid Rigidity, Weakly Rigid Weak Rigidity (10 October 2026) -/

/-- `weakly-rigid-power-implies-tame-rigidity`: a weakly rigid `X` falls under its own weakly
rigid power property, which is persistent, so `X` is necessarily weakly rigid. -/
theorem weakly_rigid_power_implies_tame_rigidity {τ : Type} [Rel τ] [Order τ] [Pointwise τ] :
    WeaklyRigidPower τ → TameRigidity τ := fun wrp X hX =>
  (rigid_iff_box_weaklyRigid X).2
    (modal_K _ _ (nec% (fun h : WeaklyRigid X ∧ X ≤ X => h.1))
      ((wrp X hX).1 X ⟨hX, le_refl_rel X⟩))

/-- The weakly rigid power property of `F` is identical to the rigid one when it is rigid:
its persistence puts each instance under `□`, so rigid. -/
theorem weaklyRigidPower_eq_of_rigid {τ : Type} [Rel τ] [Order τ] [Pointwise τ] (F : τ)
    (h : Rigid (fun X : τ => WeaklyRigid X ∧ X ≤ F)) :
    (fun X : τ => WeaklyRigid X ∧ X ≤ F) = (fun X : τ => Rigid X ∧ X ≤ F) :=
  le_antisymm_rel _ _
    (le_of_box_incl (modal_K _ _
      (nec% (fun (hp : ∀ X : τ, WeaklyRigid X ∧ X ≤ F → □ (WeaklyRigid X ∧ X ≤ F)) (X : τ)
          (hX : WeaklyRigid X ∧ X ≤ F) =>
        (⟨(rigid_iff_box_weaklyRigid X).2
            (modal_K _ _ (nec% (fun h : WeaklyRigid X ∧ X ≤ F => h.1)) (hp X hX)), hX.2⟩ :
          Rigid X ∧ X ≤ F)))
      h.1))
    (le_of_box_incl (nec% (fun (X : τ) (hX : Rigid X ∧ X ≤ F) =>
      (⟨weaklyRigid_of_rigid hX.1, hX.2⟩ : WeaklyRigid X ∧ X ≤ F))))

/-- `weakly-rigid-power-implies-rigid-power`: Weakly Rigid Power at `τ` makes the weakly rigid
power property of a rigid `F` weakly rigid, and at `τ → t` (as Tame Rigidity) rigid; it is
then the rigid power property. -/
theorem weakly_rigid_power_implies_rigid_power {τ : Type} [Rel τ] [Order τ] [Pointwise τ] :
    WeaklyRigidPower τ → WeaklyRigidPower (τ → Prop) → RigidPower τ := fun wrp wrp' F hF =>
  have hPr : Rigid (fun X : τ => WeaklyRigid X ∧ X ≤ F) :=
    weakly_rigid_power_implies_tame_rigidity wrp' _ (wrp F (weaklyRigid_of_rigid hF))
  weaklyRigidPower_eq_of_rigid F hPr ▸ hPr

/-- Under □Tame Rigidity the two power properties of `F` are identical. -/
theorem weaklyRigidPower_eq_of_nec_tame {τ : Type} [Rel τ] [Order τ] [Pointwise τ]
    (ntr : NecTameRigidity τ) (F : τ) :
    (fun X : τ => WeaklyRigid X ∧ X ≤ F) = (fun X : τ => Rigid X ∧ X ≤ F) :=
  le_antisymm_rel _ _
    (le_of_box_incl (modal_K _ _
      (nec% (fun (tr : TameRigidity τ) (X : τ) (hX : WeaklyRigid X ∧ X ≤ F) =>
        (⟨tr X hX.1, hX.2⟩ : Rigid X ∧ X ≤ F))) ntr))
    (le_of_box_incl (nec% (fun (X : τ) (hX : Rigid X ∧ X ≤ F) =>
      (⟨weaklyRigid_of_rigid hX.1, hX.2⟩ : WeaklyRigid X ∧ X ≤ F))))

/-- `necessary-tame-rigidity-and-rigid-power-imply-weakly-rigid-power`. -/
theorem necessary_tame_rigidity_and_rigid_power_imply_weakly_rigid_power {τ : Type} [Rel τ]
    [Order τ] [Pointwise τ] :
    NecTameRigidity τ → RigidPower τ → WeaklyRigidPower τ := fun ntr rp F hF =>
  (weaklyRigidPower_eq_of_nec_tame ntr F).symm ▸
    weaklyRigid_of_rigid (rp F (box_elim ntr F hF))

/-- `necessary-weakly-rigid-power-r-implies-weakly-rigid-power-r`: `T`. -/
theorem necessary_weakly_rigid_power_r_implies_weakly_rigid_power_r {τ : Type} [Rel τ] :
    NecWeaklyRigidPower τ → WeaklyRigidPower τ := box_elim

/-- `necessary-weakly-rigid-power-implies-necessary-tame-rigidity`. -/
theorem necessary_weakly_rigid_power_implies_necessary_tame_rigidity {τ : Type} [Rel τ]
    [Order τ] [Pointwise τ] : NecWeaklyRigidPower τ → NecTameRigidity τ :=
  modal_K _ _ (nec% (weakly_rigid_power_implies_tame_rigidity (τ := τ)))

/-- `necessary-weakly-rigid-power-implies-necessary-rigid-power`. -/
theorem necessary_weakly_rigid_power_implies_necessary_rigid_power {τ : Type} [Rel τ]
    [Order τ] [Pointwise τ] :
    NecWeaklyRigidPower τ → NecWeaklyRigidPower (τ → Prop) → NecRigidPower τ := fun h₁ h₂ =>
  modal_K _ _ (modal_K _ _ (nec% (weakly_rigid_power_implies_rigid_power (τ := τ))) h₁) h₂

/-- `necessary-tame-rigidity-and-necessary-rigid-power-imply-necessary-weakly-rigid-power`:
`4` boxes □Tame Rigidity again. -/
theorem necessary_tame_rigidity_and_necessary_rigid_power_imply_necessary_weakly_rigid_power
    {τ : Type} [Rel τ] [Order τ] [Pointwise τ] :
    NecTameRigidity τ → NecRigidPower τ → NecWeaklyRigidPower τ := fun h₁ h₂ =>
  modal_K _ _ (modal_K _ _
    (nec% (necessary_tame_rigidity_and_rigid_power_imply_weakly_rigid_power (τ := τ)))
    (modal_four _ h₁)) h₂

/-- `rigid-rigidity-implies-necessary-rigid-rigidity`: rigidity is necessary weak rigidity,
and `4`. -/
theorem rigid_rigidity_implies_necessary_rigid_rigidity {τ : Type} [Rel τ] :
    RigidRigidity τ → NecRigidRigidity τ := fun h =>
  modal_K _ _ (nec% (rigid_iff_box_weaklyRigid (fun X : τ => Rigid X)).2)
    (modal_four _ ((rigid_iff_box_weaklyRigid _).1 h))

/-- `necessary-rigid-rigidity-r-implies-rigid-rigidity-r`: `T`. -/
theorem necessary_rigid_rigidity_r_implies_rigid_rigidity_r {τ : Type} [Rel τ] :
    NecRigidRigidity τ → RigidRigidity τ := box_elim

/-- `weakly-rigid-weak-rigidity-implies-necessary-tame-rigidity`: a weakly rigid relation is
persistent, and the persistence of weak rigidity is □Tame Rigidity. -/
theorem weakly_rigid_weak_rigidity_implies_necessary_tame_rigidity {τ : Type} [Rel τ] :
    WeaklyRigidWeakRigidity τ → NecTameRigidity τ := fun h =>
  modal_K _ _
    (nec% (fun (hp : ∀ X : τ, WeaklyRigid X → □ (WeaklyRigid X)) (X : τ) (hX : WeaklyRigid X) =>
      (rigid_iff_box_weaklyRigid X).2 (hp X hX)))
    (persistent_of_weaklyRigid h)

/-- Under □Tame Rigidity weak rigidity and rigidity are identical properties. -/
theorem weaklyRigid_eq_rigid_of_nec_tame {τ : Type} [Rel τ] (ntr : NecTameRigidity τ) :
    (fun X : τ => WeaklyRigid X) = (fun X : τ => Rigid X) :=
  le_antisymm_rel _ _
    (le_of_box_incl (modal_K _ _
      (nec% (fun (tr : TameRigidity τ) (X : τ) (hX : WeaklyRigid X) => tr X hX)) ntr))
    (le_of_box_incl (nec% (fun (X : τ) (hX : Rigid X) => weaklyRigid_of_rigid hX)))

/-- `weakly-rigid-weak-rigidity-implies-rigid-rigidity`: at `τ` weak rigidity is rigidity,
and at `τ → t` Tame Rigidity makes it rigid. -/
theorem weakly_rigid_weak_rigidity_implies_rigid_rigidity {τ : Type} [Rel τ] :
    WeaklyRigidWeakRigidity τ → WeaklyRigidWeakRigidity (τ → Prop) → RigidRigidity τ :=
  fun h h' =>
  have heq := weaklyRigid_eq_rigid_of_nec_tame
    (weakly_rigid_weak_rigidity_implies_necessary_tame_rigidity h)
  box_elim (weakly_rigid_weak_rigidity_implies_necessary_tame_rigidity h') _ (heq ▸ h)

/-- `rigid-rigidity-and-necessary-tame-rigidity-imply-weakly-rigid-weak-rigidity`. -/
theorem rigid_rigidity_and_necessary_tame_rigidity_imply_weakly_rigid_weak_rigidity {τ : Type}
    [Rel τ] : RigidRigidity τ → NecTameRigidity τ → WeaklyRigidWeakRigidity τ := fun h ntr =>
  show WeaklyRigid (fun X : τ => WeaklyRigid X) from
    (weaklyRigid_eq_rigid_of_nec_tame ntr).symm ▸ weaklyRigid_of_rigid h

/-- `weakly-rigid-weak-rigidity-implies-necessary-weakly-rigid-weak-rigidity`: both conjuncts
of the equivalent `RR ∧ □TR` are necessary by `4`. -/
theorem weakly_rigid_weak_rigidity_implies_necessary_weakly_rigid_weak_rigidity {τ : Type}
    [Rel τ] :
    WeaklyRigidWeakRigidity τ → WeaklyRigidWeakRigidity (τ → Prop) →
      NecWeaklyRigidWeakRigidity τ := fun h h' =>
  modal_K _ _ (modal_K _ _
    (nec% (rigid_rigidity_and_necessary_tame_rigidity_imply_weakly_rigid_weak_rigidity (τ := τ)))
    (rigid_rigidity_implies_necessary_rigid_rigidity
      (weakly_rigid_weak_rigidity_implies_rigid_rigidity h h')))
    (modal_four _ (weakly_rigid_weak_rigidity_implies_necessary_tame_rigidity h))

/-- `necessary-weakly-rigid-weak-rigidity-r-implies-weakly-rigid-weak-rigidity-r`: `T`. -/
theorem necessary_weakly_rigid_weak_rigidity_r_implies_weakly_rigid_weak_rigidity_r {τ : Type}
    [Rel τ] : NecWeaklyRigidWeakRigidity τ → WeaklyRigidWeakRigidity τ := box_elim

/-! ### BF at the relational types, Gallin and Strong Actuality (11 October 2026) -/

/-- `barcan-r-implies-barcan-relational`: an instance at a relational type. -/
theorem barcan_r_implies_barcan_relational {τ : Type} [Rel τ] :
    Barcan τ → BarcanRelational τ := fun h => h
/-- `barcan-relational-implies-barcan-t`: the instance at `t`. -/
theorem barcan_relational_implies_barcan_t : BarcanRelational Prop → BarcanT := fun h => h
/-- `necessary-barcan-r-implies-necessary-barcan-relational`. -/
theorem necessary_barcan_r_implies_necessary_barcan_relational {τ : Type} [Rel τ] :
    NecBarcan τ → NecBarcanRelational τ := fun h => h
/-- `necessary-barcan-relational-implies-necessary-barcan-t`. -/
theorem necessary_barcan_relational_implies_necessary_barcan_t :
    NecBarcanRelational Prop → NecBarcanT := fun h => h
/-- `necessary-barcan-relational-implies-barcan-relational`: `T`. -/
theorem necessary_barcan_relational_implies_barcan_relational {τ : Type} [Rel τ] :
    NecBarcanRelational τ → BarcanRelational τ := box_elim

/-- The weak inextensibility of `λx. ⊤` is BF. -/
theorem barcan_of_weaklyInextensible_top {σ : Type} [Ty σ]
    (wi : WeaklyInextensible (fun _ : σ => True)) : Barcan σ := fun X hX =>
  modal_K _ _ (nec% (fun (h : ∀ x : σ, True → X x) (x : σ) => h x trivial))
    (wi X (fun x _ => hX x))

/-- `tame-rigidity-and-barcan-imply-necessary-barcan`, at `σ`: Tame Rigidity at `σ → t`
makes the weakly rigid `λx. ⊤` rigid, and its inextensibility is `□`BF. -/
theorem tame_rigidity_and_barcan_imply_necessary_barcan {σ : Type} [Ty σ] :
    TameRigidity (σ → Prop) → Barcan σ → NecBarcan σ := fun tr bf =>
  modal_K _ _ (nec% (barcan_of_weaklyInextensible_top (σ := σ)))
    (tr _ (P.Barcan.to_universalWeaklyRigid bf)).2

/-- `tame-rigidity-and-bf-relational-imply-necessary-bf-relational`: the same, at a
relational type. -/
theorem tame_rigidity_and_bf_relational_imply_necessary_bf_relational {τ : Type} [Rel τ] :
    TameRigidity (τ → Prop) → BarcanRelational τ → NecBarcanRelational τ :=
  tame_rigidity_and_barcan_imply_necessary_barcan (σ := τ)

/-- `gallin-comprehension-implies-strong-actuality`: a Gallin-rigid `Y` coextensive with
`λq. q` makes `∀q. Yq ↔ q` a true proposition that necessarily decides every proposition. -/
theorem gallin_comprehension_implies_strong_actuality :
    GallinExtensionalComprehension (Prop → Prop) → StrongActuality := fun g =>
  (g (fun q : Prop => q)).elim fun Y hY =>
  ⟨∀ q : Prop, Y q ↔ q, fun q => (hY.2.2 q).symm,
   modal_K _ _ (modal_K _ _
     (nec% (fun (h₁ : ∀ q : Prop, Y q → □ (Y q)) (h₂ : ∀ q : Prop, ¬ Y q → □ (¬ Y q))
         (q : Prop) =>
       (em (Y q)).elim
         (fun hy => Or.inl (le_of_box_incl (modal_K _ _
           (nec% (fun (hy : Y q) (hp : ∀ r : Prop, Y r ↔ r) => (hp q).1 hy)) (h₁ q hy))))
         (fun hn => Or.inr (le_of_box_incl (modal_K _ _
           (nec% (fun (hn : ¬ Y q) (hp : ∀ r : Prop, Y r ↔ r) (hq : q) => hn ((hp q).2 hq)))
           (h₂ q hn))))))
     hY.1) hY.2.1⟩

/-- `necessary-gallin-comprehension-implies-necessary-strong-actuality`. -/
theorem necessary_gallin_comprehension_implies_necessary_strong_actuality :
    NecGallinExtensionalComprehension (Prop → Prop) → NecStrongActuality :=
  modal_K _ _ (nec% gallin_comprehension_implies_strong_actuality)

end Classicism.Proofs
