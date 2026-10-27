import Classicism.Results.Research.ModalPropagation

/-!
Narrow dependency for the modal-propagation certificates. The six proofs below
are copied without mathematical changes from `Classicism/Results/Arity.lean`
(the box/persistence lemmas and Atomicity + Rigid Comprehension section).
That source identifies Bacon, *Could the truths of mathematics have been
 different?*, Lemma C.6; its local citation has no page locator. This file
makes no new authorship claim and does not modify the original proof.
The separate namespace avoids importing the all-record certification batch.
-/
namespace Classicism.Research.ModalPropagationRigidPower
open Classicism.Paper
variable {σ : Type} [Ty σ]

/-- The power property is persistent, in C. -/
theorem rigid_power_property_persistent {τ : Type} [Rel τ] [Order τ] (F : τ) :
    Persistent (fun X : τ => Rigid X ∧ X ≤ F) :=
  nec% (fun (X : τ) (hX : Rigid X ∧ X ≤ F) =>
    Eq.mpr (box_and_eq (Rigid X) (X ≤ F)) ⟨rigid_necessary X hX.1, box_le_rel X F hX.2⟩)

/-! ### Atomicity and Rigid Comprehension give Rigid Power (19 October 2026)

Lemma C.6 of Bacon, *Could the truths of mathematics have been different?*, with `□` for his
`□_N`: an atom `W` of the power type below the power property of a rigid `F` singles out an
actual rigid `X ≤ F` that is, wherever `W` is instantiated, its only instance. With Atomicity at
the power type that makes the power property weakly inextensible, and Rigid Comprehension at the
power type, as Tame Rigidity there, makes it rigid. No BF is used. -/

/-- Lemma C.6 (Bacon). `W` an atom of type `(σ → t) → t` below `λX. Rigid X ∧ X ≤ F`, `F`
rigid: by Rigid Comprehension at `σ → t` let `X` be rigid and coextensive with
`λz. Fz ∧ □∀Y. WY → Yz`. Then `X ≤ F`, and `W` entails being coextensive with `X`: one
inclusion by the inextensibility of `X`, the other by that of `F`, with `W` deciding `λY. Yz`
at each actual `z`. Coextensive weakly rigid relations being identical, `W` entails being `X`. -/
theorem atom_power_pullback (F : σ → Prop) (hF : Rigid F) (rc : P.RigidComprehension (σ → Prop))
    (W : (σ → Prop) → Prop) (hW : Atom W)
    (hWP : □ (∀ Y : σ → Prop, W Y → Rigid Y ∧ Y ≤ F)) :
    ∃ X : σ → Prop, (Rigid X ∧ X ≤ F) ∧ □ (∀ Y : σ → Prop, W Y → Y = X) :=
  (rc (fun z => F z ∧ □ (∀ Y : σ → Prop, W Y → Y z))).elim fun X ⟨hX, hco⟩ =>
  -- (a) `X ≤ F`
  have hXF : X ≤ F := le_of_box_incl (weaklyInextensible_of_inextensible hX.2 F
    fun z hz => weaklyPersistent_of_persistent hF.1 z ((hco z).2 hz).1)
  -- (b) necessarily every member of `W` includes `X`
  have hb : □ (∀ z : σ, X z → ∀ Y : σ → Prop, W Y → Y z) :=
    weaklyInextensible_of_inextensible hX.2 (fun z => ∀ Y : σ → Prop, W Y → Y z)
      fun z hz => ((hco z).2 hz).2
  -- (c) necessarily every member of `W` is included in `X`, on `F`
  have hc : □ (∀ z : σ, F z → ∀ Y : σ → Prop, W Y → Y z → X z) :=
    weaklyInextensible_of_inextensible hF.2 (fun z => ∀ Y : σ → Prop, W Y → Y z → X z)
      fun z hz => (em (X z)).elim
        (fun hx => modal_K _ _ (nec% (fun (h : X z) (Y : σ → Prop) (_ : W Y) (_ : Y z) => h))
          (weaklyPersistent_of_persistent hX.1 z hx))
        (fun hnx =>
          have hnle : ¬ W ≤ (fun Y : σ → Prop => Y z) := fun hle =>
            hnx ((hco z).1 ⟨hz, ((le_iff _ _).1 hle : □ (∀ Y : σ → Prop, W Y → Y z))⟩)
          (atom_decides_arrow W (fun Y : σ → Prop => Y z) hW).elim (fun h => (hnle h).elim)
            fun h => modal_K _ _
              (nec% (fun (h : ∀ Y : σ → Prop, W Y → ¬ Y z) (Y : σ → Prop) (hY : W Y)
                  (hYz : Y z) => ((h Y hY hYz).elim : X z)))
              ((le_iff _ _).1 h))
  ⟨X, ⟨hX, hXF⟩,
    modal_K _ _ (modal_K _ _ (modal_K _ _ (modal_K _ _
      (nec% (fun (hWP : ∀ Y : σ → Prop, W Y → Rigid Y ∧ Y ≤ F)
          (hb : ∀ z : σ, X z → ∀ Y : σ → Prop, W Y → Y z)
          (hc : ∀ z : σ, F z → ∀ Y : σ → Prop, W Y → Y z → X z)
          (hwX : WeaklyRigid X) (Y : σ → Prop) (hY : W Y) =>
        eq_of_weaklyRigid_coext (weaklyRigid_of_rigid (hWP Y hY).1) hwX
          fun z => ⟨fun hYz => hc z (incl_of_le (hWP Y hY).2 z hYz) Y hY hYz,
                    fun hXz => hb z hXz Y hY⟩))
      hWP) hb) hc) ((rigid_iff_box_weaklyRigid X).1 hX)⟩

/-- With Atomicity at the power type, the power property of a rigid `F` is weakly
inextensible: a counterexample `𝒳`, necessary of every actual rigid `X ≤ F` but possibly
failing of some, has an atom `W` below `λX. (Rigid X ∧ X ≤ F) ∧ ¬𝒳X`, and Lemma C.6 makes the
possible instance of `W` an actual `X`, of which `𝒳` is both necessary and possibly false. -/
theorem atom_rc_rigid_power_core (F : σ → Prop) (hF : Rigid F)
    (at_ : P.Atomicity ((σ → Prop) → Prop)) (rc : P.RigidComprehension (σ → Prop)) :
    WeaklyInextensible (fun X : σ → Prop => Rigid X ∧ X ≤ F) := fun 𝒳 h =>
  (em (□ (∀ X : σ → Prop, (Rigid X ∧ X ≤ F) → 𝒳 X))).elim id fun hn =>
  (at_ (fun X : σ → Prop => (Rigid X ∧ X ≤ F) ∧ ¬ 𝒳 X)).elim
    (fun hq => (hn (modal_K _ _
      (nec% (fun (hq : ∀ X : σ → Prop, ((Rigid X ∧ X ≤ F) ∧ ¬ 𝒳 X) →
            ¬ ((Rigid X ∧ X ≤ F) ∧ ¬ 𝒳 X)) (X : σ → Prop) (hP : Rigid X ∧ X ≤ F) =>
        (em (𝒳 X)).elim id fun hx => (hq X ⟨hP, hx⟩ ⟨hP, hx⟩).elim))
      ((le_iff _ _).1 hq))).elim)
    fun ⟨W, hW, hWQ⟩ =>
  have hWQ' : □ (∀ Y : σ → Prop, W Y → (Rigid Y ∧ Y ≤ F) ∧ ¬ 𝒳 Y) := (le_iff _ _).1 hWQ
  have hWP : □ (∀ Y : σ → Prop, W Y → Rigid Y ∧ Y ≤ F) := modal_K _ _
    (nec% (fun (h : ∀ Y : σ → Prop, W Y → (Rigid Y ∧ Y ≤ F) ∧ ¬ 𝒳 Y) (Y : σ → Prop)
        (hY : W Y) => (h Y hY).1)) hWQ'
  (atom_power_pullback F hF rc W hW hWP).elim fun X ⟨hPX, heq⟩ =>
  have h𝒳 : □ (𝒳 X) := h X hPX
  have hne : W ≠ Rel.bot ((σ → Prop) → Prop) := fun e =>
    not_le_neg_of_atom hW (by rw [e]; exact bot_le_arrow _)
  have hdia : ◇ (∃ Y : σ → Prop, W Y) := dia_exists_of_ne_bot W hne
  -- but `W` necessarily has no instance: its only possible instance `X` would be `𝒳` and not `𝒳`
  have hbox : □ (¬ ∃ Y : σ → Prop, W Y) := modal_K _ _ (modal_K _ _ (modal_K _ _
    (nec% (fun (f : ∀ Y : σ → Prop, W Y → (Rigid Y ∧ Y ≤ F) ∧ ¬ 𝒳 Y)
        (g : ∀ Y : σ → Prop, W Y → Y = X) (k : 𝒳 X) =>
      (fun hex => hex.elim fun Y hY =>
          (f Y hY).2 (Eq.subst (motive := fun Z => 𝒳 Z) (g Y hY).symm k)
        : ¬ ∃ Y : σ → Prop, W Y)))
    hWQ') heq) h𝒳
  (not_dia_of_box_not _ hbox hdia).elim

/-- `atomicity-and-rigid-comprehension-imply-rigid-power`, at `σ → t`: the power property is
persistent in C and, by the core, weakly inextensible; Rigid Comprehension at the power type,
as Tame Rigidity there, makes it rigid. -/
theorem atom_rc_rigid_power :
    P.Atomicity ((σ → Prop) → Prop) → P.RigidComprehension (σ → Prop) →
      P.RigidComprehension ((σ → Prop) → Prop) → P.RigidPower (σ → Prop) := fun at_ rc rc' F hF =>
  Proofs.rigid_comprehension_implies_tame_rigidity rc' _
    ⟨weaklyPersistent_of_persistent (rigid_power_property_persistent F),
     atom_rc_rigid_power_core F hF at_ rc⟩

end Classicism.Research.ModalPropagationRigidPower

#classicism_check
  Classicism.rigid_necessary
  Classicism.box_le_rel
  Classicism.Research.ModalPropagationRigidPower.rigid_power_property_persistent
  Classicism.Research.ModalPropagationRigidPower.atom_power_pullback
  Classicism.Research.ModalPropagationRigidPower.atom_rc_rigid_power_core
  Classicism.Research.ModalPropagationRigidPower.atom_rc_rigid_power
#classicism_types
  Classicism.rigid_necessary
  Classicism.box_le_rel
  Classicism.Research.ModalPropagationRigidPower.rigid_power_property_persistent
  Classicism.Research.ModalPropagationRigidPower.atom_power_pullback
  Classicism.Research.ModalPropagationRigidPower.atom_rc_rigid_power_core
  Classicism.Research.ModalPropagationRigidPower.atom_rc_rigid_power
