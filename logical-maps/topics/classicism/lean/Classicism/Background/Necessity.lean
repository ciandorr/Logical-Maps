import Classicism.Paper
import Classicism.Booleanism
import Classicism.Background.Framework

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
open Paper

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
  Eq.subst (motive := λ z ↦ □ (x = z)) h (nec% (Eq.refl x))

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

/-! ### Intensionality -/

/-- Intensionality (Classicism, §1.5, p. 17): necessarily coextensive relations are
identical. The proof is the paper's: `X = X ∧_τ ⊤ = X ∧_τ (⊤ ∧ H) = Y ∧_τ (⊤ ∧ H) = Y`
where `H` is the coextension sentence, the middle step being the closed identity
`Rel.and_constP_coext`, and the box supplying `H = True` for Leibniz's Law. -/
theorem intensionality {τ : Type} [Rel τ] (X Y : τ) : □ (X ≡ Y) → X = Y := fun h =>
  calc X = (X ∧ constP True) := (Rel.and_constP_true X).symm
    _ = (X ∧ constP (True ∧ X ≡ Y)) := by rw [h, and_self_eq]
    _ = (Y ∧ constP (True ∧ X ≡ Y)) := Rel.and_constP_coext X Y True
    _ = (Y ∧ constP True) := by rw [h, and_self_eq]
    _ = Y := Rel.and_constP_true Y

/-- The Modalized Fregean Axiom: `□(p ↔ q) → p = q`, the nullary case of
Intensionality. -/
theorem modalized_fregean (p q : Prop) : □ (p ↔ q) → p = q := intensionality p q

/-- Pointwise identity gives coextension: `(∀ z. Xz = Yz) → coext X Y`. Closed. -/
theorem coext_of_forall_eq {σ τ : Type} [Ty σ] [Rel τ] (X Y : σ → τ) :
    (∀ z, X z = Y z) → X ≡ Y :=
  fun h z => h z ▸ Rel.coext_refl (X z)

/-- Modalized Functionality (Classicism, §1.5, p. 18): `□(∀z. Xz = Yz) → X = Y` when
the output type is relational. Necessitation of the closed lemma above, `K`, and
Intensionality. -/
theorem modalized_functionality {σ τ : Type} [Ty σ] [Rel τ] (X Y : σ → τ) :
    □ (∀ z, X z = Y z) → X = Y := fun h =>
  intensionality X Y (modal_K _ _ (nec% (coext_of_forall_eq X Y)) h)

/-! ### Further laws of `□` and `◇`

Laws the results use, with the closed propositional lemmas they necessitate. A lemma
stating a broadly applicable property lives in the library, not beside the result that
first needs it (`HANDOFF.md` §3). -/

/-- `□¬p → ¬◇p`. -/
theorem not_dia_of_box_not (p : Prop) : □ (¬ p) → ¬ ◇ p := fun h => (box_not_eq_not_dia p).mp h

/-- `¬◇p → □¬p`. -/
theorem box_not_of_not_dia (p : Prop) : ¬ ◇ p → □ (¬ p) := fun h => (box_not_eq_not_dia p).mpr h

/-- `◇¬p` is `¬□p`. -/
theorem dia_not_eq (p : Prop) : (◇ (¬ p)) = ¬ □ p := by
  rw [dia_eq_not_box_not, not_not_eq]

/-- `¬□q → ◇¬q`. -/
theorem dia_not_of_not_box (q : Prop) : ¬ □ q → ◇ (¬ q) := fun h e =>
  h ((not_not_eq q).symm.trans ((congrArg Not e).trans not_false_eq))

/-- `□p → (¬p) = ⊥`. -/
theorem not_eq_false_of_box (p : Prop) (h : □ p) : (¬ p) = False :=
  (congrArg Not h).trans not_true_eq

/-- `q ∧ ¬q` is impossible. -/
theorem not_dia_and_not (q : Prop) : ¬ ◇ (q ∧ ¬ q) :=
  fun h => h (propext ⟨fun hq => hq.2 hq.1, False.elim⟩)

/-- `(w → q) → w → ◇q`. -/
theorem imp_dia_of_imp (w q : Prop) : (w → q) → w → ◇ q := fun h hw => dia_intro q (h hw)

/-- Closed lemma for Prior's argument: `◇(x ≠ y) → x ≠ y`, since `x = y` gives
`□(x = y)` by NI and then `(x ≠ y) = False`. -/
theorem ne_of_dia_ne {σ : Type} [Ty σ] (x y : σ) : ◇ (x ≠ y) → x ≠ y := fun hd hxy =>
  hd (calc (x ≠ y) = ¬ (x = y) := rfl
        _ = ¬ True := by rw [necessity_of_identity x y hxy]
        _ = False := not_true_eq)

/-- `◇∀x. Xx → ∀x. ◇Xx`: were some `Xx` identical to `⊥`, so would `∀x. Xx` be. -/
theorem dia_forall_imp {σ : Type} [Ty σ] (X : σ → Prop) : ◇ (∀ x, X x) → ∀ x, ◇ (X x) :=
  fun hd x hx => hd (calc (∀ u, X u) = (X x ∧ ∀ u, X u) := (and_forall_absorb_eq X x).symm
      _ = (False ∧ ∀ u, X u) := by rw [hx]
      _ = False := false_and_eq _)

/-- `q` gives `p → q`. -/
theorem imp_intro' (p q : Prop) : q → p → q := fun hq _ => hq

/-- `□r` gives `□(q → r)`. -/
theorem box_imp_of_box (q r : Prop) : □ r → □ (q → r) :=
  modal_K _ _ (nec% (imp_intro' q r))

/-- `□¬q` gives `□(q → r)`. -/
theorem box_imp_of_box_not (q r : Prop) : □ (¬ q) → □ (q → r) :=
  modal_K _ _ (nec% (fun (hn : ¬ q) (hq : q) => (hn hq).elim : ¬ q → q → r))

/-- `□(p → q)` and `◇p` give `◇q`. -/
theorem contra_imp (p q : Prop) : (p → q) → ¬ q → ¬ p := fun h hq hp => hq (h hp)

/-- `□(p → q)` and `◇p` give `◇q`. -/
theorem dia_mono (p q : Prop) : □ (p → q) → ◇ p → ◇ q := fun h hp hq =>
  hp ((box_not_eq p).mp
    (modal_K _ _ (modal_K _ _ (nec% (contra_imp p q)) h) ((box_not_eq q).mpr hq)))

/-- `◇(p ∨ q)` gives `◇p ∨ ◇q`. -/
theorem dia_or (p q : Prop) : ◇ (p ∨ q) → ◇ p ∨ ◇ q := fun h =>
  (em (◇ p)).elim Or.inl fun hp => (em (◇ q)).elim Or.inr fun hq =>
    (h (by
      have hp' : p = False := (not_not_eq _).mp hp
      have hq' : q = False := (not_not_eq _).mp hq
      rw [hp', hq', or_self_eq])).elim

/-- `◇p` and `□q` give `◇(p ∧ q)`. -/
theorem dia_and_of_dia_box (p q : Prop) : ◇ p → □ q → ◇ (p ∧ q) := fun hp hq h =>
  hp (calc p = (p ∧ True) := (and_true_eq p).symm
    _ = (p ∧ q) := by rw [hq]
    _ = False := h)

/-- `◇◇p → ◇p`, by `4`. -/
theorem dia_dia (p : Prop) : ◇ ◇ p → ◇ p := fun h =>
  (em (◇ p)).elim id fun hn => (not_dia_of_box_not _ (modal_K _ _ (nec% (not_dia_of_box_not p))
    (modal_four _ (box_not_of_not_dia p hn))) h).elim

/-- With `ND`, an identity that is possible is true. -/
theorem eq_of_dia_eq {σ : Type} [Ty σ] (nd : ∀ x y : σ, x ≠ y → □ (x ≠ y)) (a b : σ) :
    ◇ (a = b) → a = b := fun hd =>
  (em (a = b)).elim id fun hne => by
    have h : □ (a ≠ b) := nd a b hne
    have h' : (a = b) = False := by
      rw [← box_not_eq]; exact h
    exact (hd h').elim

/-- With `BF`, `◇∃x. φx` gives `∃x. ◇φx`: otherwise `∀x. □¬φx`, so `□∀x. ¬φx`, which is
`□¬∃x. φx`. -/
theorem dia_exists_of_bf {σ : Type} [Ty σ] (bf : ∀ X : σ → Prop, (∀ x, □ (X x)) → □ (∀ x, X x))
    (φ : σ → Prop) : ◇ (∃ x, φ x) → ∃ x, ◇ (φ x) := fun hd =>
  (em (∃ x, ◇ (φ x))).elim id fun hn => by
    have h1 : ∀ x, □ (¬ φ x) := fun x => by
      rw [box_not_eq_not_dia]; exact fun h => hn ⟨x, h⟩
    have h2 : □ (¬ ∃ x, φ x) := by
      rw [not_exists_eq]; exact bf _ h1
    rw [box_not_eq_not_dia] at h2
    exact (h2 hd).elim

/-- With `ND` and `NI`, `y ≠ x ∨ p = q` is necessary when true. -/
theorem box_ne_or_eq {σ τ : Type} [Ty σ] [Ty τ] (nd : ∀ x y : σ, x ≠ y → □ (x ≠ y)) (y x : σ)
    (p q : τ) : (y ≠ x ∨ p = q) → □ (y ≠ x ∨ p = q) := fun h => h.elim
  (fun hne => modal_K _ _ (nec% (fun (h : y ≠ x) => (Or.inl h : y ≠ x ∨ p = q))) (nd y x hne))
  (fun he => modal_K _ _ (nec% (fun (h : p = q) => (Or.inr h : y ≠ x ∨ p = q))) (necessity_of_identity p q he))

end Classicism
