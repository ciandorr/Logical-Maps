import Classicism.Paper
import Classicism.Background.Rigidity
import Classicism.Background.Lattice
import Classicism.Background.Atoms

/-!
# Principles of the map's category `coarse`

The modal principles `B` and `5`, the Necessity of Distinctness, the Barcan Formula and
Tractarianism, with their boxed forms. See `Classicism/Principles.lean` for how a principle
is stated and where its forms go.

The scope `Classicism.Paper` is not opened here. These principles are about `t` and the
types of individuals, where its symbols would change nothing, except Tractarianism, whose
`≤` at `Prop` is `entails` (`Core.lean`): inside the scope it would be `Rel.le`, the same
relation by definition but a different constant, and the principle's quoted sentence would
change with it.

Each dual form is the official form at the negations of its variables, contraposed, with
`◇ = ¬□¬` and `∃ = ¬∀¬`; each boxed dual follows from the boxed official form by `K` and
the necessitation of the unboxed equivalence.
-/

namespace Classicism.P

/-! ## `B` -/

/-- `modal-b`: `∀p. p → □◇p`. -/
def ModalB : Prop := ∀ p : Prop, p → □ ◇ p
/-- `modal-b`, form `dual`: `∀p. ◇□p → p`. -/
def ModalBDual : Prop := ∀ p : Prop, ◇ □ p → p

/-- `modal-b` to its dual form: `B` at `¬p`, contraposed. -/
theorem ModalB.to_dual : ModalB → ModalBDual := by
  intro b p h
  refine (em p).elim (fun hp => hp) (fun hn => ?_)
  exfalso
  have h₁ : □ ◇ (¬ p) := b (¬ p) hn
  rw [dia_not_eq, box_not_eq_not_dia] at h₁
  exact h₁ h

/-- `modal-b` from its dual form: the dual at `¬p`, contraposed. -/
theorem ModalB.of_dual : ModalBDual → ModalB := by
  intro d p hp
  refine (em (□ ◇ p)).elim (fun h => h) (fun hn => ?_)
  exfalso
  have h₁ : ◇ (¬ ◇ p) := dia_not_of_not_box _ hn
  rw [← box_not_eq_not_dia] at h₁
  exact d (¬ p) h₁ hp

/-- `necessary-modal-b`: `B` boxed. -/
def NecModalB : Prop := □ ModalB
/-- `necessary-modal-b`, form `dual`: the dual of `B`, boxed. -/
def NecModalBDual : Prop := □ ModalBDual

/-- `necessary-modal-b` to its dual form. -/
theorem NecModalB.to_dual : NecModalB → NecModalBDual := modal_K _ _ (nec% ModalB.to_dual)
/-- `necessary-modal-b` from its dual form. -/
theorem NecModalB.of_dual : NecModalBDual → NecModalB := modal_K _ _ (nec% ModalB.of_dual)

/-! ## `5` -/

/-- `modal-five`: `∀p. ◇p → □◇p`. -/
def ModalFive : Prop := ∀ p : Prop, ◇ p → □ ◇ p
/-- `modal-five`, form `dual`: `∀p. ◇□p → □p`. -/
def ModalFiveDual : Prop := ∀ p : Prop, ◇ □ p → □ p

/-- `modal-five` to its dual form: `5` at `¬p`, contraposed. -/
theorem ModalFive.to_dual : ModalFive → ModalFiveDual := by
  intro f p h
  refine (em (□ p)).elim (fun hb => hb) (fun hn => ?_)
  exfalso
  have h₁ : □ ◇ (¬ p) := f (¬ p) (dia_not_of_not_box _ hn)
  rw [dia_not_eq, box_not_eq_not_dia] at h₁
  exact h₁ h

/-- `modal-five` from its dual form: the dual at `¬p`, contraposed. -/
theorem ModalFive.of_dual : ModalFiveDual → ModalFive := by
  intro d p hp
  refine (em (□ ◇ p)).elim (fun h => h) (fun hn => ?_)
  exfalso
  have h₁ : ◇ (¬ ◇ p) := dia_not_of_not_box _ hn
  rw [← box_not_eq_not_dia] at h₁
  exact not_dia_of_box_not p (d (¬ p) h₁) hp

/-- `necessary-modal-five`: `5` boxed. -/
def NecModalFive : Prop := □ ModalFive
/-- `necessary-modal-five`, form `dual`: the dual of `5`, boxed. -/
def NecModalFiveDual : Prop := □ ModalFiveDual

/-- `necessary-modal-five` to its dual form. -/
theorem NecModalFive.to_dual : NecModalFive → NecModalFiveDual :=
  modal_K _ _ (nec% ModalFive.to_dual)
/-- `necessary-modal-five` from its dual form. -/
theorem NecModalFive.of_dual : NecModalFiveDual → NecModalFive :=
  modal_K _ _ (nec% ModalFive.of_dual)

/-! ## The Necessity of Distinctness -/

/-- `distinctness-necessary-r` (ND) at `σ`: `∀xy. x ≠ y → □(x ≠ y)`. -/
def NecessityOfDistinctness (σ : Type) [Ty σ] : Prop := ∀ x y : σ, x ≠ y → □ (x ≠ y)
/-- `distinctness-necessary-r`, form `dual`, at `σ`: `∀xy. ◇(x = y) → x = y`. -/
def NecessityOfDistinctnessDual (σ : Type) [Ty σ] : Prop := ∀ x y : σ, ◇ (x = y) → x = y

/-- `distinctness-necessary-r` to its dual form: a possible identity is true, or its
negation would be necessary. -/
theorem NecessityOfDistinctness.to_dual {σ : Type} [Ty σ] :
    NecessityOfDistinctness σ → NecessityOfDistinctnessDual σ := fun nd x y h =>
  eq_of_dia_eq nd x y h

/-- `distinctness-necessary-r` from its dual form: a distinctness that is not necessary
leaves the identity possible. -/
theorem NecessityOfDistinctness.of_dual {σ : Type} [Ty σ] :
    NecessityOfDistinctnessDual σ → NecessityOfDistinctness σ := fun d x y hne =>
  box_not_of_not_dia (x = y) (fun h => hne (d x y h))

/-- `necessary-distinctness-necessary-r`: □ND at `σ`. -/
def NecNecessityOfDistinctness (σ : Type) [Ty σ] : Prop := □ (NecessityOfDistinctness σ)
/-- `necessary-distinctness-necessary-r`, form `dual`, at `σ`: the dual of ND, boxed. -/
def NecNecessityOfDistinctnessDual (σ : Type) [Ty σ] : Prop :=
  □ (NecessityOfDistinctnessDual σ)

/-- `necessary-distinctness-necessary-r` to its dual form. -/
theorem NecNecessityOfDistinctness.to_dual {σ : Type} [Ty σ] :
    NecNecessityOfDistinctness σ → NecNecessityOfDistinctnessDual σ :=
  modal_K _ _ (nec% (NecessityOfDistinctness.to_dual (σ := σ)))
/-- `necessary-distinctness-necessary-r` from its dual form. -/
theorem NecNecessityOfDistinctness.of_dual {σ : Type} [Ty σ] :
    NecNecessityOfDistinctnessDual σ → NecNecessityOfDistinctness σ :=
  modal_K _ _ (nec% (NecessityOfDistinctness.of_dual (σ := σ)))

/-! ## The Barcan Formula -/

/-- `barcan-r` (BF) at `σ`: `∀X. (∀x. □Xx) → □(∀x. Xx)`. -/
def Barcan (σ : Type) [Ty σ] : Prop := ∀ X : σ → Prop, (∀ x, □ (X x)) → □ (∀ x, X x)
/-- `barcan-r`, form `dual`, at `σ`: `∀X. ◇(∃x. Xx) → ∃x. ◇Xx`. -/
def BarcanDual (σ : Type) [Ty σ] : Prop := ∀ X : σ → Prop, ◇ (∃ x, X x) → ∃ x, ◇ (X x)

/-- `barcan-r` to its dual form: BF at `λx. ¬Xx`, contraposed (`dia_exists_of_bf`). -/
theorem Barcan.to_dual {σ : Type} [Ty σ] : Barcan σ → BarcanDual σ := fun bf X h =>
  dia_exists_of_bf bf X h

/-- `barcan-r` from its dual form: the dual at `λx. ¬Xx`, contraposed. -/
theorem Barcan.of_dual {σ : Type} [Ty σ] : BarcanDual σ → Barcan σ := by
  intro d X h
  refine (em (□ (∀ x, X x))).elim (fun hb => hb) (fun hn => ?_)
  exfalso
  have h₁ : ◇ (¬ ∀ x, X x) := dia_not_of_not_box _ hn
  rw [not_forall_eq] at h₁
  obtain ⟨x, hx⟩ := d (λ x ↦ ¬ X x) h₁
  have h₂ : ◇ (¬ X x) := hx
  rw [dia_not_eq] at h₂
  exact h₂ (h x)

/-- `necessary-barcan-r`: □BF at `σ`. -/
def NecBarcan (σ : Type) [Ty σ] : Prop := □ (Barcan σ)
/-- `necessary-barcan-r`, form `dual`, at `σ`: the dual of BF, boxed. -/
def NecBarcanDual (σ : Type) [Ty σ] : Prop := □ (BarcanDual σ)

/-- `necessary-barcan-r` to its dual form. -/
theorem NecBarcan.to_dual {σ : Type} [Ty σ] : NecBarcan σ → NecBarcanDual σ :=
  modal_K _ _ (nec% (Barcan.to_dual (σ := σ)))
/-- `necessary-barcan-r` from its dual form. -/
theorem NecBarcan.of_dual {σ : Type} [Ty σ] : NecBarcanDual σ → NecBarcan σ :=
  modal_K _ _ (nec% (Barcan.of_dual (σ := σ)))

/-- `barcan-r`, form `universal-weakly-rigid`, at `σ`: `λz. ⊤` is weakly rigid. -/
def BarcanUniversalWeaklyRigid (σ : Type) [Ty σ] : Prop := WeaklyRigid (fun _ : σ => True)

/-- `barcan-r` to its form `universal-weakly-rigid`: `λz. ⊤` is weakly persistent since `□⊤`;
weakly inextensible, since `∀z. □Zz` gives `□∀z. Zz` by BF. -/
theorem Barcan.to_universalWeaklyRigid {σ : Type} [Ty σ] :
    Barcan σ → BarcanUniversalWeaklyRigid σ := fun bf =>
  ⟨fun _ _ => box_true, fun Z hZ =>
    bf (λ z ↦ True → Z z) fun z => box_imp_of_box True (Z z) (hZ z trivial)⟩

/-- `barcan-r` from its form `universal-weakly-rigid`: the weak inextensibility of `λz. ⊤`
at `X` is BF at `X`. -/
theorem Barcan.of_universalWeaklyRigid {σ : Type} [Ty σ] :
    BarcanUniversalWeaklyRigid σ → Barcan σ := fun h X hX =>
  modal_K _ _ (nec% (fun (k : ∀ z : σ, True → X z) (z : σ) => k z trivial))
    (h.2 X (fun z _ => hX z))

/-- `necessary-barcan-r`, form `universal-rigid`, at `σ`: `λz. ⊤` is rigid. -/
def NecBarcanUniversalRigid (σ : Type) [Ty σ] : Prop := Rigid (fun _ : σ => True)

/-- `necessary-barcan-r` to its form `universal-rigid`: rigidity is necessary weak rigidity. -/
theorem NecBarcan.to_universalRigid {σ : Type} [Ty σ] :
    NecBarcan σ → NecBarcanUniversalRigid σ := fun h =>
  (rigid_iff_box_weaklyRigid _).2 (modal_K _ _ (nec% (Barcan.to_universalWeaklyRigid (σ := σ))) h)

/-- `necessary-barcan-r` from its form `universal-rigid`. -/
theorem NecBarcan.of_universalRigid {σ : Type} [Ty σ] :
    NecBarcanUniversalRigid σ → NecBarcan σ := fun h =>
  modal_K _ _ (nec% (Barcan.of_universalWeaklyRigid (σ := σ))) ((rigid_iff_box_weaklyRigid _).1 h)

/-- `barcan-relational` at `τ`: BF at a relational type. -/
def BarcanRelational (τ : Type) [Rel τ] : Prop :=
  ∀ X : τ → Prop, (∀ x, □ (X x)) → □ (∀ x, X x)
/-- `necessary-barcan-relational`: □BF at a relational type. -/
def NecBarcanRelational (τ : Type) [Rel τ] : Prop := □ (BarcanRelational τ)

/-! ## Tractarianism -/

/-- `tractarianism-r` at `σ`: `∀pX. (∀x. p ≤ Xx) → p ≤ ∀x. Xx`. -/
def Tractarianism (σ : Type) [Ty σ] : Prop :=
  ∀ (p : Prop) (X : σ → Prop), (∀ x, p ≤ X x) → p ≤ (∀ x, X x)
/-- `tractarianism-r`, form `dual`, at `σ`: `∀pX. (∀x. Xx ≤ p) → (∃x. Xx) ≤ p`. -/
def TractarianismDual (σ : Type) [Ty σ] : Prop :=
  ∀ (p : Prop) (X : σ → Prop), (∀ x, X x ≤ p) → (∃ x, X x) ≤ p

/-- `tractarianism-r` to its dual form: Tractarianism at `¬p` and `λx. ¬Xx`, with negation
reversing `≤`. -/
theorem Tractarianism.to_dual {σ : Type} [Ty σ] : Tractarianism σ → TractarianismDual σ :=
  fun t p X h =>
    (le_iff_prop _ _).2 (modal_K _ _ (nec% (exists_imp_of_not_imp_forall_not p X))
      ((le_iff_prop _ _).1 (t (¬ p) (λ x ↦ ¬ X x) fun x => entails_neg_neg _ _ (h x))))

/-- `tractarianism-r` from its dual form: the dual at `¬p` and `λx. ¬Xx`, with negation
reversing `≤`. -/
theorem Tractarianism.of_dual {σ : Type} [Ty σ] : TractarianismDual σ → Tractarianism σ :=
  fun d p X h =>
    (le_iff_prop _ _).2 (modal_K _ _ (nec% (forall_of_exists_not_imp_not p X))
      ((le_iff_prop _ _).1 (d (¬ p) (λ x ↦ ¬ X x) fun x => entails_neg_neg _ _ (h x))))

/-- `necessary-tractarianism-r` at `σ`. -/
def NecTractarianism (σ : Type) [Ty σ] : Prop := □ (Tractarianism σ)
/-- `necessary-tractarianism-r`, form `dual`, at `σ`: the dual of Tractarianism, boxed. -/
def NecTractarianismDual (σ : Type) [Ty σ] : Prop := □ (TractarianismDual σ)

/-- `necessary-tractarianism-r` to its dual form. -/
theorem NecTractarianism.to_dual {σ : Type} [Ty σ] :
    NecTractarianism σ → NecTractarianismDual σ :=
  modal_K _ _ (nec% (Tractarianism.to_dual (σ := σ)))
/-- `necessary-tractarianism-r` from its dual form. -/
theorem NecTractarianism.of_dual {σ : Type} [Ty σ] :
    NecTractarianismDual σ → NecTractarianism σ :=
  modal_K _ _ (nec% (Tractarianism.of_dual (σ := σ)))

end Classicism.P
