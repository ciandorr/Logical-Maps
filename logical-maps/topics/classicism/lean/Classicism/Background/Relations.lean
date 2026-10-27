import Classicism.Paper
import Classicism.Principles

/-!
# Background: relations, orders and fixed points

Lemmas of the Background page *Relations, orders and fixed points*: well-orders, and
Modalized Plenitude at output types `t` and `σ' → t` (the operation `Fx := λu. ∀y. Uxy → yu`
represents `U` wherever its values are necessarily unique, by Intensionality).
-/

namespace Classicism
open Classicism.P Classicism.Paper

/-! ### Well-orders -/

/-- In a well-order the minimal instance of a property is its least instance. -/
theorem least_of_minimal {σ : Type} [Ty σ] {R : σ → σ → Prop} (h : WellOrders R)
    {Y : σ → Prop} {m : σ} (hmin : ∀ y, Y y → R y m → y = m) : ∀ z, Y z → R m z :=
  fun z hz => (h.2.2.1 m z).elim id fun hzm => by
    rw [hmin z hz hzm]
    exact (h.2.2.1 m m).elim id id

/-- A well-order makes the least instance of an instantiated property its unique least
instance. -/
theorem unique_least {σ : Type} [Ty σ] (R : σ → σ → Prop) (F : σ → Prop) (h : WellOrders R)
    (hF : ∃ x, F x) : ∃ x, (F x ∧ ∀ y, F y → R x y) ∧ ∀ y, (F y ∧ ∀ z, F z → R y z) → y = x :=
  (h.2.2.2 F hF).elim fun m ⟨hm, hmin⟩ =>
    have least := least_of_minimal h hmin
    ⟨m, ⟨hm, least⟩, fun y hy => h.2.1 y m (hy.2 m hm) (least y hy.1)⟩

/-- Being a well-order depends only on the extension. -/
theorem wellOrders_of_iff {σ : Type} [Ty σ] (R R' : σ → σ → Prop) (he : ∀ x y, R' x y ↔ R x y)
    (h : WellOrders R) : WellOrders R' :=
  ⟨fun x y z a b => (he x z).2 (h.1 x y z ((he x y).1 a) ((he y z).1 b)),
   fun x y a b => h.2.1 x y ((he x y).1 a) ((he y x).1 b),
   fun x y => (h.2.2.1 x y).elim (fun a => Or.inl ((he x y).2 a)) (fun a => Or.inr ((he y x).2 a)),
   fun Y hY => (h.2.2.2 Y hY).elim fun x ⟨hx, hmin⟩ =>
     ⟨x, hx, fun y hy hyx => hmin y hy ((he y x).1 hyx)⟩⟩

/-! ### Modalized Plenitude -/

/-- `φ(x, y₀) → ∀u. y₀u ↔ Fxu`. -/
theorem mp_value_coext {σ σ' : Type} [Ty σ] [Ty σ'] (U : σ → (σ' → Prop) → Prop) (x : σ)
    (y₀ : σ' → Prop) :
    (U x y₀ ∧ ∀ z, U x z → y₀ = z) → ∀ u, y₀ u ↔ ∀ y : σ' → Prop, U x y → y u :=
  fun h u => ⟨fun hu y hy => (h.2 y hy) ▸ hu, fun hF => hF y₀ h.1⟩

/-- `□φ(x, y₀)` makes `y₀` the value `Fx`. -/
theorem mp_value {σ σ' : Type} [Ty σ] [Ty σ'] (U : σ → (σ' → Prop) → Prop) (x : σ)
    (y₀ : σ' → Prop) (h : □ (U x y₀ ∧ ∀ z, U x z → y₀ = z)) :
    y₀ = λ u ↦ ∀ y : σ' → Prop, U x y → y u :=
  intensionality _ _ (modal_K _ _ (nec% (mp_value_coext U x y₀)) h)

/-- `(∀x. ∃y. □φ(x, y)) → ∀x y. Uxy ↔ y = Fx`. -/
theorem mp_represents {σ σ' : Type} [Ty σ] [Ty σ'] (U : σ → (σ' → Prop) → Prop) :
    (∀ x, ∃ y, □ (U x y ∧ ∀ z, U x z → y = z)) →
      ∀ x (y : σ' → Prop), U x y ↔ y = λ u ↦ ∀ y' : σ' → Prop, U x y' → y' u :=
  fun H x y => (H x).elim fun y₀ hy₀ =>
    have e := mp_value U x y₀ hy₀
    have hφ := box_elim hy₀
    ⟨fun hU => (hφ.2 y hU).symm.trans e, fun hy => (hy.trans e.symm) ▸ hφ.1⟩

/-- At output `t`, `φ(x, p₀) → (p₀ ↔ Fx)` for `Fx := ∀p. Uxp → p`. -/
theorem mp_value_coext_t {σ : Type} [Ty σ] (U : σ → Prop → Prop) (x : σ) (p₀ : Prop) :
    (U x p₀ ∧ ∀ z, U x z → p₀ = z) → (p₀ ↔ ∀ p : Prop, U x p → p) :=
  fun h => ⟨fun hp q hq => (h.2 q hq) ▸ hp, fun hF => hF p₀ h.1⟩

/-- At output `t`, `□φ(x, p₀)` makes `p₀` the value `Fx`, by the Modalized Fregean Axiom. -/
theorem mp_value_t {σ : Type} [Ty σ] (U : σ → Prop → Prop) (x : σ) (p₀ : Prop)
    (h : □ (U x p₀ ∧ ∀ z, U x z → p₀ = z)) : p₀ = ∀ p : Prop, U x p → p :=
  modalized_fregean _ _ (modal_K _ _ (nec% (mp_value_coext_t U x p₀)) h)

/-- At output `t`, `(∀x. ∃p. □φ(x, p)) → ∀x p. Uxp ↔ p = Fx`. -/
theorem mp_represents_t {σ : Type} [Ty σ] (U : σ → Prop → Prop) :
    (∀ x, ∃ p, □ (U x p ∧ ∀ z, U x z → p = z)) →
      ∀ x (p : Prop), U x p ↔ p = ∀ q : Prop, U x q → q :=
  fun H x p => (H x).elim fun p₀ hp₀ =>
    have e := mp_value_t U x p₀ hp₀
    have hφ := box_elim hp₀
    ⟨fun hU => (hφ.2 p hU).symm.trans e, fun hp => (hp.trans e.symm) ▸ hφ.1⟩

/-- Modalized Plenitude at output `t`: `λx. ∀p. Uxp → p` necessarily represents `U`. -/
theorem modalized_plenitude_t {σ : Type} [Ty σ] : ModalizedPlenitude σ Prop := fun U hH =>
  ⟨λ x ↦ ∀ p : Prop, U x p → p, modal_K _ _ (nec% (mp_represents_t U)) hH⟩

end Classicism
