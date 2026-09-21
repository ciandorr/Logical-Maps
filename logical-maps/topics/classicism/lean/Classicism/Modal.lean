import Classicism.Booleanism

/-!
# The modal logic of Classicism

With `□p := (p = True)`, the theorems of this file are the paper's §1.5 and §2.1:
`K`, `T` and `4` (so the logic of `□` is `S4`, Bacon 2018), the Necessity of Identity,
the Converse Barcan Formula, Intensionality at every relational type, and its nullary
and functional forms, the Modalized Fregean Axiom and Modalized Functionality.

Every hypothesis is discharged by Leibniz's Law alone; `propext` and `funext` occur
only with closed arguments (see `Classicism/Equivalence.lean`).
-/

namespace Classicism

/-! ### Basic facts about `□` and `◇` -/

/-- `□p` from a closed proof of `p`, as a theorem-level helper: only ever apply it to a
global theorem, never to a hypothesis, since `p → □p` with `p` a variable is a form of
the Fregean Axiom. The macro `nec%` is the same term; this form exists for `K`-style
chaining. -/
theorem box_true : □ True := rfl

theorem box_elim {p : Prop} (h : □ p) : p := h ▸ trivial

/-- `T`: `□p → p`. -/
theorem modal_T (p : Prop) : □ p → p := box_elim

/-- `K`: `□(p → q) → □p → □q`. Purely Leibniz's Law over the closed identity
`q = (True → q)`. -/
theorem modal_K (p q : Prop) : □ (p → q) → □ p → □ q := fun hpq hp =>
  calc q = (True → q) := (true_imp_eq q).symm
    _ = (p → q) := by rw [hp]
    _ = True := hpq

/-- Necessity of Identity, `NI`: `x = y → □(x = y)` at every type, including `e`.
Necessitate `x = x`, then substitute `y` for the second `x` (Classicism, §2.1). -/
theorem necessity_of_identity {σ : Type} [Ty σ] (x y : σ) : x = y → □ (x = y) := fun h =>
  Eq.subst (motive := fun z => □ (x = z)) h (nec% (Eq.refl x))

/-- `4`: `□p → □□p`. This is `NI` applied to the identity `p = True`. -/
theorem modal_four (p : Prop) : □ p → □ □ p := necessity_of_identity p True

/-- `p → ◇p`, the dual of `T`. -/
theorem dia_intro (p : Prop) : p → ◇ p := fun hp hf => hf ▸ hp

/-- `□¬p = (p = False)`. Each direction is Leibniz's Law over closed Boolean
identities, so the biconditional is a theorem and Equivalence applies. -/
theorem box_not_eq (p : Prop) : □ (¬ p) = (p = False) :=
  propext
    ⟨fun h => calc p = ¬ ¬ p := (not_not_eq p).symm
        _ = ¬ True := by rw [h]
        _ = False := not_true_eq,
     fun h => calc (¬ p) = ¬ False := by rw [h]
        _ = True := not_false_eq⟩

/-- `◇p = ¬□¬p`, connecting the map's definition of `◇` to the usual one. -/
theorem dia_eq_not_box_not (p : Prop) : ◇ p = ¬ □ (¬ p) := by
  show (¬ (p = False)) = ¬ □ (¬ p)
  rw [box_not_eq]

/-- `□¬p = ¬◇p`. -/
theorem box_not_eq_not_dia (p : Prop) : □ (¬ p) = ¬ ◇ p := by
  rw [dia_eq_not_box_not, not_not_eq]

/-- `□(p ∧ q) = (□p ∧ □q)`. -/
theorem box_and_eq (p q : Prop) : □ (p ∧ q) = (□ p ∧ □ q) :=
  propext
    ⟨fun h =>
      ⟨calc p = (p ∨ (p ∧ q)) := (or_and_absorb_eq p q).symm
          _ = (p ∨ True) := by rw [h]
          _ = True := or_true_eq p,
       calc q = (q ∨ (q ∧ p)) := (or_and_absorb_eq q p).symm
          _ = (q ∨ (p ∧ q)) := by rw [and_comm_eq q p]
          _ = (q ∨ True) := by rw [h]
          _ = True := or_true_eq q⟩,
     fun ⟨hp, hq⟩ => calc (p ∧ q) = (True ∧ True) := by rw [hp, hq]
        _ = True := and_self_eq True⟩

/-! ### Quantifiers -/

/-- The Converse Barcan Formula: `□(∀x. Xx) → ∀x. □(Xx)`, at every type. -/
theorem converse_barcan {σ : Type} [Ty σ] (X : σ → Prop) : □ (∀ x, X x) → ∀ x, □ (X x) :=
  fun h x =>
    calc X x = (X x ∧ True) := (and_true_eq _).symm
      _ = (X x ∧ ∀ u, X u) := by rw [h]
      _ = (∀ u, X u) := and_forall_absorb_eq X x
      _ = True := h

/-! ### Existence

`H` proves `∃x.x = x` at every type. At every `R`-type other than `e` a closed term is
available, so Existence there is a theorem of `C⁻` and needs no axiom. At `e` it is the
axiom `e_exists`, and these two theorems are the only place in the library where the
distinction can arise (Classicism, §1.1 and nn. 12–13). -/

/-- Existence at every relational type: the closed term `⊤_τ` is the witness. A theorem
of `C⁻`; its axiom report does not name `e_exists`. -/
theorem existence_rel {τ : Type} [Rel τ] : ∃ x : τ, x = x := ⟨Rel.top τ, rfl⟩

/-- Existence at `e`, the one instance `H⁻` does not prove. This is the only theorem in
the library whose axiom report names `e_exists`. -/
theorem existence_e : ∃ x : e, x = x := e_exists

/-! ### Intensionality -/

/-- Intensionality (Classicism, §1.5, p. 17): necessarily coextensive relations are
identical. The proof is the paper's: `X = X ∧_τ ⊤ = X ∧_τ (⊤ ∧ H) = Y ∧_τ (⊤ ∧ H) = Y`
where `H` is the coextension sentence, the middle step being the closed identity
`Rel.and_constP_coext`, and the box supplying `H = True` for Leibniz's Law. -/
theorem intensionality {τ : Type} [Rel τ] (X Y : τ) : □ (coext X Y) → X = Y := fun h =>
  calc X = Rel.and X (constP True) := (Rel.and_constP_true X).symm
    _ = Rel.and X (constP (True ∧ coext X Y)) := by rw [h, and_self_eq]
    _ = Rel.and Y (constP (True ∧ coext X Y)) := Rel.and_constP_coext X Y True
    _ = Rel.and Y (constP True) := by rw [h, and_self_eq]
    _ = Y := Rel.and_constP_true Y

/-- The Modalized Fregean Axiom: `□(p ↔ q) → p = q`, the nullary case of
Intensionality. -/
theorem modalized_fregean (p q : Prop) : □ (p ↔ q) → p = q := intensionality p q

/-- Pointwise identity gives coextension: `(∀ z. Xz = Yz) → coext X Y`. Closed. -/
theorem coext_of_forall_eq {σ τ : Type} [Ty σ] [Rel τ] (X Y : σ → τ) :
    (∀ z, X z = Y z) → coext X Y :=
  fun h z => h z ▸ Rel.coext_refl (X z)

/-- Modalized Functionality (Classicism, §1.5, p. 18): `□(∀z. Xz = Yz) → X = Y` when
the output type is relational. Necessitation of the closed lemma above, `K`, and
Intensionality. -/
theorem modalized_functionality {σ τ : Type} [Ty σ] [Rel τ] (X Y : σ → τ) :
    □ (∀ z, X z = Y z) → X = Y := fun h =>
  intensionality X Y (modal_K _ _ (nec% (coext_of_forall_eq X Y)) h)

end Classicism
