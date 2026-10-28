import Classicism.Background.Lattice

/-!
# Background: atoms

The lemmas of the Background page *Atoms*: an atom decides everything of its
type, and a non-bottom entity that decides everything is an atom.
-/

namespace Classicism
open Paper

variable {τ : Type} [Rel τ]

/-! ### At `t` -/

/-- An atom at `t` decides every proposition: `w ≤ q` or `w ≤ ¬q`. Take `z := w ∧ q`,
which is below `w`: either it is `w`, so `w ≤ q`, or it is `⊥`, so `w ∧ q = ⊥` and
`w ≤ ¬q`. -/
theorem atom_le_or_le_neg (w q : Prop) (hw : Atom w) : w ≤ q ∨ w ≤ ¬ q :=
  (em (Rel.and w q = w)).elim
    (fun h => Or.inl (by
      have : (w ∧ q) ≤ q := and_le_right_prop w q
      rw [show (w ∧ q) = w from h] at this
      exact this))
    (fun h => Or.inr (by
      have hbot : (w ∧ q) = False := eq_false_of_le_neg _ ((hw (Rel.and w q)).1 ⟨and_le_left_prop w q, h⟩)
      show (¬ q) = (w ∨ ¬ q)
      calc (¬ q) = (¬ q ∨ False) := (or_false_eq (¬ q)).symm
        _ = (¬ q ∨ (w ∧ q)) := by rw [hbot]
        _ = ((¬ q ∨ w) ∧ (¬ q ∨ q)) := or_and_distrib_eq (¬ q) w q
        _ = ((¬ q ∨ w) ∧ True) := by rw [or_comm_eq (¬ q) q, em_eq]
        _ = (¬ q ∨ w) := and_true_eq _
        _ = (w ∨ ¬ q) := or_comm_eq _ _))

/-- A non-bottom proposition deciding every proposition is an atom. -/
theorem atom_of_decides (w : Prop) (h : ¬ (w = False) ∧ ∀ z, w ≤ z ∨ w ≤ ¬ z) : Atom w :=
  fun z => ⟨fun hz => (h.2 z).elim
      (fun hwz => absurd (le_antisymm_prop z w hz.1 hwz) hz.2)
      (fun hwn => le_trans_prop z w (¬ z) hz.1 hwn),
    fun hz => by
      have hz0 : z = False := eq_false_of_le_neg z hz
      exact ⟨hz0 ▸ bot_le_prop w, fun e => h.1 (e ▸ hz0)⟩⟩

/-- An atom `w` entails `q → w ≤ q`, for every `q`: if `w ≤ q`, then `w ≤ q` is
necessary, so `q → w ≤ q` is `⊤`; if `w ≤ ¬q`, then `w ≤ ¬q ∨ r` for any `r`. -/
theorem atom_le_imp_le (w q : Prop) (hw : Atom w) : w ≤ (q → w ≤ q) :=
  (atom_le_or_le_neg w q hw).elim
    (fun h => by
      rw [show (w ≤ q) = True from box_le_prop w q h, imp_true_eq]
      exact le_top_prop w)
    (fun h => by
      rw [imp_eq_not_or q (w ≤ q)]
      exact le_or_of_le_left_prop w (¬ q) _ h)

/-- An atom of type `t` is not `⊥`. -/
theorem atom_ne_false (w : Prop) (hw : Atom w) : w ≠ False := fun e =>
  not_le_neg_of_atom hw (le_neg_of_eq_false w e)

/-! ### At `σ → t` -/

/-- A non-bottom property deciding every property is an atom, at `σ → t`. -/
theorem atom_of_decides_arrow {σ : Type} [Ty σ] (W : σ → Prop) (hne : W ≠ Rel.bot (σ → Prop))
    (hdec : ∀ Y : σ → Prop, W ≤ Y ∨ W ≤ ¬ Y) : Atom W := fun z =>
  ⟨fun hz => (hdec z).elim (fun h => absurd (le_antisymm_arrow z W hz.1 h) hz.2)
      (fun h => le_trans_arrow z W _ hz.1 h),
   fun hz => ⟨le_of_le_neg_arrow z W hz, fun e => hne (eq_bot_of_le_neg_arrow W (e ▸ hz))⟩⟩

/-- `(∀z. Wz ∧ Yz → ¬(Wz ∧ Yz)) → ∀z. Wz → ¬Yz`. -/
theorem imp_not_of_and_bot {σ : Type} [Ty σ] (W Y : σ → Prop) :
    (∀ z, W z ∧ Y z → ¬ (W z ∧ Y z)) → ∀ z, W z → ¬ Y z :=
  fun a z hw hy => a z ⟨hw, hy⟩ ⟨hw, hy⟩

/-- An atom at `σ → t` decides every property: `λz. Wz ∧ Yz` is `W` or `⊥`. -/
theorem atom_decides_arrow {σ : Type} [Ty σ] (W Y : σ → Prop) (hW : Atom W) :
    W ≤ Y ∨ W ≤ ¬ Y :=
  (em ((λ z ↦ W z ∧ Y z) = W)).elim
    (fun e => Or.inl (e ▸ (le_iff _ _).2 (nec% (fun (z : σ) (h : W z ∧ Y z) => h.2))))
    (fun hne => Or.inr ((le_iff _ _).2 (modal_K _ _ (nec% (imp_not_of_and_bot W Y))
      ((le_iff _ _).1 ((hW _).1
        ⟨(le_iff _ _).2 (nec% (fun (z : σ) (h : W z ∧ Y z) => h.1)), hne⟩)))))

/-! ### At a relational type -/

section rel
variable [Order τ] [Pointwise τ]

/-- An atom lies below `x` or below `¬_τ x`: its meet with `x` is below it, so is either the
atom itself or bottom. -/
theorem atom_le_or_le_neg_rel (y x : τ) (hy : Atom y) : y ≤ x ∨ y ≤ ¬ x :=
  (em ((y ∧ x) = y)).elim
    (fun e => Or.inl (by rw [← e]; exact (le_iff _ _).2 (nec% (incl_and_right y x))))
    (fun hne => Or.inr ((le_iff _ _).2 (modal_K _ _ (nec% (incl_neg_of_and_incl_neg y x))
      ((le_iff _ _).1 ((hy (y ∧ x)).1 ⟨(le_iff _ _).2 (nec% (incl_and_left y x)), hne⟩)))))

end rel

end Classicism
