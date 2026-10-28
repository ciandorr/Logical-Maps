import Classicism.Paper
import Classicism.Background.Rigidity
import Classicism.Background.Lattice
import Classicism.Background.Atoms

/-!
# Principles of the map's category `base`

Theorems of Classicism among the map's principles: the modal logic `K`, `T`, `4` of the
defined box, the Necessity of Identity, the Converse Barcan Formula, Existence, Broad
Necessitism, and the coarse-grainedness principles every model of `C` satisfies,
Intensionality and its corollaries. See `Classicism/Principles.lean` for how a principle is
stated and where its forms go.
-/

namespace Classicism.P

/-! ## Modal principles, at type `t`

`K`, `T` and `4` are theorems of `C` (`Modal.lean`), and so are their duals, so each form
gives the other outright. -/

/-- `modal-k`: `∀pq. □(p→q) → (□p → □q)`. -/
def ModalK : Prop := ∀ p q : Prop, □ (p → q) → □ p → □ q
/-- `modal-k`, form `dual`: `∀pq. □(p→q) → (◇p → ◇q)`. -/
def ModalKDual : Prop := ∀ p q : Prop, □ (p → q) → ◇ p → ◇ q

/-- `modal-k` to its dual form: the dual is a theorem of `C`. -/
theorem ModalK.to_dual : ModalK → ModalKDual := fun _ p q => dia_mono p q
/-- `modal-k` from its dual form: `K` is a theorem of `C`. -/
theorem ModalK.of_dual : ModalKDual → ModalK := fun _ p q => modal_K p q

/-- `modal-t`: `∀p. □p → p`. -/
def ModalT : Prop := ∀ p : Prop, □ p → p
/-- `modal-t`, form `dual`: `∀p. p → ◇p`. -/
def ModalTDual : Prop := ∀ p : Prop, p → ◇ p

/-- `modal-t` to its dual form: the dual is a theorem of `C`. -/
theorem ModalT.to_dual : ModalT → ModalTDual := fun _ p => dia_intro p
/-- `modal-t` from its dual form: `T` is a theorem of `C`. -/
theorem ModalT.of_dual : ModalTDual → ModalT := fun _ p => modal_T p

/-- `modal-four`: `∀p. □p → □□p`. -/
def ModalFour : Prop := ∀ p : Prop, □ p → □ □ p
/-- `modal-four`, form `dual`: `∀p. ◇◇p → ◇p`. -/
def ModalFourDual : Prop := ∀ p : Prop, ◇ ◇ p → ◇ p

/-- `modal-four` to its dual form: the dual is a theorem of `C`. -/
theorem ModalFour.to_dual : ModalFour → ModalFourDual := fun _ p => dia_dia p
/-- `modal-four` from its dual form: `4` is a theorem of `C`. -/
theorem ModalFour.of_dual : ModalFourDual → ModalFour := fun _ p => modal_four p

/-- `modalized-fregean`: `∀pq. □(p↔q) → p = q`. -/
def ModalizedFregean : Prop := ∀ p q : Prop, □ (p ↔ q) → p = q

/-! ## Coarse-grainedness principles of `C`, at a type -/

/-- `intensionality-r` at the relational type `τ`: `□(∀z̄. X[z̄] ↔ Y[z̄]) → X = Y`. -/
def Intensionality (τ : Type) [Rel τ] : Prop := ∀ X Y : τ, □ (coext X Y) → X = Y
/-- `modalized-functionality-r` at `σ → τ`: `□(∀z. Xz = Yz) → X = Y`. -/
def ModalizedFunctionality (σ τ : Type) [Ty σ] [Rel τ] : Prop :=
  ∀ X Y : σ → τ, □ (∀ z, X z = Y z) → X = Y
/-- `identity-necessary-r` (NI) at `σ`: `∀xy. x = y → □(x = y)`. -/
def NecessityOfIdentity (σ : Type) [Ty σ] : Prop := ∀ x y : σ, x = y → □ (x = y)

/-! ## The Converse Barcan Formula -/

/-- `converse-barcan-r` (CBF) at `σ`: `∀X. □(∀x. Xx) → ∀x. □Xx`. -/
def ConverseBarcan (σ : Type) [Ty σ] : Prop := ∀ X : σ → Prop, □ (∀ x, X x) → ∀ x, □ (X x)
/-- `converse-barcan-r`, form `dual`, at `σ`: `∀X. (∃x. ◇Xx) → ◇∃x. Xx`. -/
def ConverseBarcanDual (σ : Type) [Ty σ] : Prop :=
  ∀ X : σ → Prop, (∃ x, ◇ (X x)) → ◇ (∃ x, X x)

/-- `converse-barcan-r` to its dual form: the dual is a theorem of `C`, since `Xx` entails
`∃x. Xx` necessarily (`dia_mono`), as CBF is. -/
theorem ConverseBarcan.to_dual {σ : Type} [Ty σ] : ConverseBarcan σ → ConverseBarcanDual σ :=
  fun _ X h => h.elim fun x hx =>
    dia_mono _ _ (nec% (fun (hx : X x) => (⟨x, hx⟩ : ∃ y, X y))) hx

/-- `converse-barcan-r` from its dual form: the dual at `λx. ¬Xx`, contraposed. -/
theorem ConverseBarcan.of_dual {σ : Type} [Ty σ] : ConverseBarcanDual σ → ConverseBarcan σ := by
  intro d X h x
  refine (em (□ (X x))).elim (fun hb => hb) (fun hn => ?_)
  exfalso
  have h₁ : ◇ (∃ x, ¬ X x) := d (λ x ↦ ¬ X x) ⟨x, dia_not_of_not_box _ hn⟩
  rw [← not_forall_eq, dia_not_eq] at h₁
  exact h₁ h

/-! ## Existence and Broad Necessitism -/

/-- `existence-r` at `σ`: `∃x^σ. x = x`. The type system has two shapes of type, `e` and
the relational types; `Existence e` is the axiom `e_exists`, and `Existence τ` for
relational `τ` is a theorem of `C⁻`. The two instances are the two records' proofs. -/
def Existence (σ : Type) [Ty σ] : Prop := ∃ x : σ, x = x
/-- `broad-necessitism-r` at `σ`: `∀x. □∃y. y = x`. -/
def BroadNecessitism (σ : Type) [Ty σ] : Prop := ∀ x : σ, □ (∃ y : σ, y = x)

end Classicism.P
