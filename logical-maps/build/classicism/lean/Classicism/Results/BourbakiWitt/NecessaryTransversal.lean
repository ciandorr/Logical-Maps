import Classicism.Background.BourbakiWitt
import Classicism.Principles

/-!
# Boolean Completeness and Modalized Relational Choice imply □Transversal

The record `boolean-completeness-and-modalized-relational-choice-imply-necessary-transversal`,
following its write-up (GPT-6 Astra, prompted by Daniel Kodsi, 26 October 2026; presentation by
Claude Opus 5.5, prompted by Cian Dorr, 28 October 2026). At `σ`, with `ρ := σ → t`: Boolean
Completeness at `ρ → t` and Modalized Relational Choice at `(ρ → t, ρ)` give □Transversal at `σ`.

The Bourbaki–Witt lemma is used in its case for partial orders (`BW.bourbaki_witt_fixed_point₀`)
on the *separated* properties `Y` of type `ρ → t` (necessarily no two distinct instances
coextensive), ordered by `≤`, with the graph of the step `Φ`, which adds to `Y` the selector's
choice from the properties missed by `Y`.
-/

namespace Classicism.Proofs.BWTransversal
open Classicism.P Classicism.Paper Classicism.BW

/-- Coextension at `ρ = σ → t`. -/
def Ceq {σ : Type} [Ty σ] (x y : σ → Prop) : Prop := ∀ z, x z ↔ y z

/-- `PT(Y)`: no two distinct instances of `Y` are coextensive. -/
def PT {σ : Type} [Ty σ] (Y : (σ → Prop) → Prop) : Prop :=
  ∀ x y, Y x → Y y → Ceq x y → x = y

/-- `(ΓB)x := ∀y. By ∧ x ≡ y → x = y`. -/
def Gam {σ : Type} [Ty σ] (B : (σ → Prop) → Prop) : (σ → Prop) → Prop :=
  λ x ↦ ∀ y, B y → Ceq x y → x = y

/-- `Y` is separated: necessarily `PT(Y)`. -/
def Sep {σ : Type} [Ty σ] (Y : (σ → Prop) → Prop) : Prop := □ (PT Y)

/-- `Miss_Y := λy. ¬∃x. Yx ∧ x ≡ y`. -/
def Miss {σ : Type} [Ty σ] (Y : (σ → Prop) → Prop) : (σ → Prop) → Prop :=
  λ y ↦ ¬ ∃ x, Y x ∧ Ceq x y

/-- `ΦY := Y ∨ D_Y`, with `D_Y := λy. Miss_Y y ∧ (S Miss_Y) y`. -/
def Phi {σ : Type} [Ty σ] (S : ((σ → Prop) → Prop) → (σ → Prop) → Prop)
    (Y : (σ → Prop) → Prop) : (σ → Prop) → Prop :=
  λ y ↦ Y y ∨ (Miss Y y ∧ S (Miss Y) y)

/-- The relation the selector is chosen from: `λP y. Py ∨ ¬∃z. Pz`. -/
def Pick {σ : Type} [Ty σ] : ((σ → Prop) → Prop) → (σ → Prop) → Prop :=
  λ P y ↦ P y ∨ ¬ ∃ z, P z

theorem ceq_symm {σ : Type} [Ty σ] (x y : σ → Prop) (h : Ceq x y) : Ceq y x :=
  fun z => (h z).symm

theorem ceq_trans {σ : Type} [Ty σ] (x y w : σ → Prop) (h₁ : Ceq x y) (h₂ : Ceq y w) :
    Ceq x w :=
  fun z => (h₁ z).trans (h₂ z)

/-! ### The selector -/

/-- `Pick` is serial: a theorem, so necessarily. -/
theorem pick_serial {σ : Type} [Ty σ] : Serial (Pick (σ := σ)) := by
  intro P
  rcases em (∃ z, P z) with h | h
  · obtain ⟨z, hz⟩ := h
    exact ⟨z, Or.inl hz⟩
  · exact ⟨λ _ ↦ True, Or.inr h⟩

/-! ### Hypothesis 3: `Φ` is progressive and preserves separation -/

theorem pt_phi {σ : Type} [Ty σ] (S : ((σ → Prop) → Prop) → (σ → Prop) → Prop)
    (Y : (σ → Prop) → Prop) : PT Y → Functional S → PT (Phi S Y) := by
  intro hY hS x y hx hy hxy
  rcases hx with hx | hx <;> rcases hy with hy | hy
  · exact hY x y hx hy hxy
  · exact (hy.1 ⟨x, hx, hxy⟩).elim
  · exact (hx.1 ⟨y, hy, ceq_symm x y hxy⟩).elim
  · obtain ⟨w, _, hw⟩ := hS (Miss Y)
    exact (hw x hx.2).symm.trans (hw y hy.2)

theorem sep_phi {σ : Type} [Ty σ] (S : ((σ → Prop) → Prop) → (σ → Prop) → Prop)
    (hS : □ (Functional S)) (Y : (σ → Prop) → Prop) (hY : Sep Y) : Sep (Phi S Y) :=
  modal_K _ _ (modal_K _ _ (nec% (pt_phi S Y)) hY) hS

theorem le_phi {σ : Type} [Ty σ] (S : ((σ → Prop) → Prop) → (σ → Prop) → Prop)
    (Y : (σ → Prop) → Prop) : Y ≤ Phi S Y :=
  le_of_box_incl (nec% (fun (y : σ → Prop) (h : Y y) => (Or.inl h : Phi S Y y)))

/-! ### Hypothesis 2: joins of chains of separated properties are separated -/

theorem gam_of_sub {σ : Type} [Ty σ] (A B : (σ → Prop) → Prop) :
    (∀ x, A x → B x) → PT B → ∀ x, A x → Gam B x :=
  fun h hB x hx y hy hxy => hB x y (h x hx) hy hxy

theorem gam_of_sup {σ : Type} [Ty σ] (A B : (σ → Prop) → Prop) :
    (∀ x, B x → A x) → PT A → ∀ x, A x → Gam B x :=
  fun h hA x hx y hy hxy => hA x y hx (h y hy) hxy

theorem gam_symm {σ : Type} [Ty σ] (J B : (σ → Prop) → Prop) :
    (∀ x, J x → Gam B x) → ∀ y, B y → Gam J y :=
  fun h y hy x hx hyx => (h x hx y hy (ceq_symm y x hyx)).symm

theorem pt_of_gam {σ : Type} [Ty σ] (J : (σ → Prop) → Prop) :
    (∀ x, J x → Gam J x) → PT J :=
  fun h x y hx hy hxy => h x hx y hy hxy

/-- For separated `A` and `B` comparable under `≤`, `A ≤ ΓB`. -/
theorem le_gam {σ : Type} [Ty σ] (A B : (σ → Prop) → Prop) (hA : Sep A) (hB : Sep B)
    (h : A ≤ B ∨ B ≤ A) : A ≤ Gam B := by
  rcases h with h | h
  · exact le_of_box_incl (modal_K _ _ (modal_K _ _ (nec% (gam_of_sub A B)) ((le_iff _ _).1 h)) hB)
  · exact le_of_box_incl (modal_K _ _ (modal_K _ _ (nec% (gam_of_sup A B)) ((le_iff _ _).1 h)) hA)

/-- The least upper bound of a chain of separated properties is separated. -/
theorem sep_lub {σ : Type} [Ty σ] (Z : ((σ → Prop) → Prop) → Prop) (J : (σ → Prop) → Prop)
    (hZ : ∀ B, Z B → Sep B) (hT : TotalOn (fun B D : (σ → Prop) → Prop => B ≤ D) Z) (hJ : LUB J Z) : Sep J := by
  have hJB : ∀ B, Z B → J ≤ Gam B := fun B hB =>
    (hJ (Gam B)).1 (fun A hA => le_gam A B (hZ A hA) (hZ B hB) (hT A B hA hB))
  have hBJ : ∀ B, Z B → B ≤ Gam J := fun B hB =>
    le_of_box_incl (modal_K _ _ (nec% (gam_symm J B)) ((le_iff _ _).1 (hJB B hB)))
  exact modal_K _ _ (nec% (pt_of_gam J)) ((le_iff _ _).1 ((hJ (Gam J)).1 hBJ))

theorem sep_sup {σ : Type} [Ty σ] (bc : BooleanCompleteness ((σ → Prop) → Prop)) :
    ∀ Z : ((σ → Prop) → Prop) → Prop, (∀ z, Z z → Sep z) →
      TotalOn (fun B D : (σ → Prop) → Prop => B ≤ D) Z →
      ∃ s, SupIn Sep (fun B D : (σ → Prop) → Prop => B ≤ D) s Z := by
  intro Z hZ hT
  obtain ⟨J, hJ⟩ := BooleanCompleteness.to_lub bc Z
  exact ⟨J, ⟨sep_lub Z J hZ hT hJ, (hJ J).2 (le_refl_arrow_prop J)⟩,
    fun U hU => (hJ U).1 hU.2⟩

/-! ### The fixed point is necessarily a transversal -/

theorem transversal_of_fixed {σ : Type} [Ty σ] (m : (σ → Prop) → Prop)
    (S : ((σ → Prop) → Prop) → (σ → Prop) → Prop) :
    m = Phi S m → PT m → Functional S → (∀ P y, S P y → Pick P y) → Transversal σ := by
  intro e hm hS hSP
  refine ⟨m, fun X => ?_⟩
  rcases em (∃ x, m x ∧ Ceq x X) with h | h
  · obtain ⟨x, hx, hxX⟩ := h
    exact ⟨x, hx, ceq_symm x X hxX, fun Y' hY' =>
      hm Y' x hY'.1 hx (ceq_trans Y' X x (ceq_symm X Y' hY'.2) (ceq_symm x X hxX))⟩
  · obtain ⟨y, hy, _⟩ := hS (Miss m)
    have hmy : Miss m y := (hSP _ y hy).elim id (fun hn => (hn ⟨X, h⟩).elim)
    have hphi : Phi S m y := Or.inr ⟨hmy, hy⟩
    have hy' : m y := by rw [e]; exact hphi
    exact (hmy ⟨y, hy', fun _ => Iff.rfl⟩).elim

/-- **The record.** -/
theorem boolean_completeness_and_modalized_relational_choice_imply_necessary_transversal
    {σ : Type} [Ty σ] :
    BooleanCompleteness ((σ → Prop) → Prop) →
      ModalizedRelationalChoice ((σ → Prop) → Prop) (σ → Prop) → NecTransversal σ := by
  intro bc mrc
  obtain ⟨S, hS, hSP⟩ := mrc Pick (nec% (pick_serial (σ := σ)))
  obtain ⟨m, hm, hfix⟩ := bourbaki_witt_fixed_point₀ Sep (fun B D => B ≤ D)
    (fun Y D => D = Phi S Y)
    (fun Y _ => le_refl_arrow_prop Y)
    (fun X Y Z _ _ _ h₁ h₂ => le_trans_arrow X Y Z h₁ h₂)
    (fun X Y _ _ h₁ h₂ => le_antisymm_arrow X Y h₁ h₂)
    (sep_sup bc)
    (fun Y _ => ⟨Phi S Y, rfl⟩)
    (fun Y D hY e => e ▸ sep_phi S hS Y hY)
    (fun Y D _ e => e ▸ le_phi S Y)
    (fun _ _ _ _ e₁ e₂ => e₁.trans e₂.symm)
  exact modal_K _ _ (modal_K _ _ (modal_K _ _ (modal_K _ _
    (nec% (transversal_of_fixed m S)) (necessity_of_identity _ _ hfix)) hm) hS)
    ((le_iff _ _).1 hSP)

end Classicism.Proofs.BWTransversal
