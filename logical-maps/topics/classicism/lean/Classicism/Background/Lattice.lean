import Classicism.Paper
import Classicism.Background.Order
import Classicism.Pointwise

/-!
# Lattice predicates

The map's Background defines, at a relational type `τ` with the algebraic order `≤_τ`,

    Atom_τ(y) := ∀z. (z ≤_τ y ∧ z ≠ y) ↔ z ≤_τ ¬_τ z

so that an atom is non-bottom (`z ≤ ¬z` says `z = ⊥`) and has no non-bottom strict lower
bound (*Classicism*, §2.2, pp. 23–24). The predicate needs only `Rel τ`, since the order is
the algebraic one; its pointwise reading is through `Order.le_iff`.
-/

namespace Classicism
open Paper

variable {τ : Type} [Rel τ]

/-- `Atom_τ(y) := ∀z. (z ≤ y ∧ z ≠ y) ↔ z ≤ ¬z`. -/
def Atom (y : τ) : Prop := ∀ z : τ, (z ≤ y ∧ z ≠ y) ↔ z ≤ ¬ z

/-- An atom is not below its own negation: it is not `⊥`. -/
theorem not_le_neg_of_atom {y : τ} (h : Atom y) : ¬ y ≤ ¬ y :=
  fun hy => ((h y).2 hy).2 rfl

/-! ### Bounds

The Background's `LB_τ(y, X) := ∀z. Xz → y ≤ z` and `GLB_τ(y, X) := ∀z. LB(z, X) ↔ z ≤ y`,
and the dual pair with `UB` and `LUB`, in which some of the map's proofs state Boolean
Completeness. -/

/-- `LB_τ(y, X) := ∀z. Xz → y ≤ z`. -/
def LB (y : τ) (X : τ → Prop) : Prop := ∀ z : τ, X z → y ≤ z
/-- `GLB_τ(y, X) := ∀z. LB(z, X) ↔ z ≤ y`. -/
def GLB (y : τ) (X : τ → Prop) : Prop := ∀ z : τ, LB z X ↔ z ≤ y
/-- `UB_τ(y, X) := ∀z. Xz → z ≤ y`. -/
def UB (y : τ) (X : τ → Prop) : Prop := ∀ z : τ, X z → z ≤ y
/-- `LUB_τ(y, X) := ∀z. UB(z, X) ↔ y ≤ z`. -/
def LUB (y : τ) (X : τ → Prop) : Prop := ∀ z : τ, UB z X ↔ y ≤ z

/-- `w` is an actual world: a truth that entails every truth, `w ∧ ∀q. q → w ≤ q`.
Actuality says there is one. -/
def ActualWorld (w : Prop) : Prop := w ∧ ∀ q : Prop, q → w ≤ q

/-! ### The order at `t`

`p ≤ q` is the identity `q = (p ∨ q)`, so these are the Boolean identities of
`Booleanism.lean` read as facts about the order: reflexivity, transitivity and
antisymmetry, the bounds, meets and joins, and the passage through the box by `NI` and
`K` (`le_iff_prop`). Each is a closed lemma, so that a metalogical proof can necessitate
it. -/

section prop

theorem le_refl_prop (p : Prop) : p ≤ p := (or_self_eq p).symm

theorem le_trans_prop (p q r : Prop) (h₁ : p ≤ q) (h₂ : q ≤ r) : p ≤ r := by
  have h₁' : q = (p ∨ q) := h₁
  have h₂' : r = (q ∨ r) := h₂
  show r = (p ∨ r)
  calc r = (q ∨ r) := h₂'
    _ = ((p ∨ q) ∨ r) := by conv => lhs; rw [h₁']
    _ = (p ∨ (q ∨ r)) := or_assoc_eq p q r
    _ = (p ∨ r) := by rw [← h₂']

theorem le_antisymm_prop (p q : Prop) (h₁ : p ≤ q) (h₂ : q ≤ p) : p = q := by
  show p = q
  calc p = (q ∨ p) := h₂
    _ = (p ∨ q) := or_comm_eq q p
    _ = q := h₁.symm

theorem bot_le_prop (p : Prop) : False ≤ p := (false_or_eq p).symm
theorem le_top_prop (p : Prop) : p ≤ True := (or_true_eq p).symm

theorem le_or_left_prop (p q : Prop) : p ≤ (p ∨ q) := by
  show (p ∨ q) = (p ∨ (p ∨ q))
  rw [← or_assoc_eq, or_self_eq]

theorem le_or_right_prop (p q : Prop) : q ≤ (p ∨ q) := by
  show (p ∨ q) = (q ∨ (p ∨ q))
  rw [or_comm_eq p q, ← or_assoc_eq, or_self_eq]

theorem and_le_left_prop (p q : Prop) : (p ∧ q) ≤ p := by
  show p = ((p ∧ q) ∨ p)
  rw [or_comm_eq, or_and_absorb_eq]

theorem and_le_right_prop (p q : Prop) : (p ∧ q) ≤ q := by
  show q = ((p ∧ q) ∨ q)
  rw [or_comm_eq, and_comm_eq, or_and_absorb_eq]

/-- `p ≤ q` and `p ≤ r` give `p ≤ q ∧ r`, through the box. -/
theorem le_and_prop_aux (p q r : Prop) : (p → q) → (p → r) → (p → q ∧ r) :=
  fun h₁ h₂ hp => ⟨h₁ hp, h₂ hp⟩

theorem le_and_prop (p q r : Prop) (h₁ : p ≤ q) (h₂ : p ≤ r) : p ≤ (q ∧ r) :=
  (le_iff_prop _ _).2 (modal_K _ _ (modal_K _ _ (nec% (le_and_prop_aux p q r))
    ((le_iff_prop _ _).1 h₁)) ((le_iff_prop _ _).1 h₂))

/-- `p ≤ ¬p` says `p = ⊥`. -/
theorem eq_false_of_le_neg (p : Prop) (h : p ≤ ¬ p) : p = False := by
  have h' : (¬ p) = True := by
    show (¬ p) = True
    calc (¬ p) = (p ∨ ¬ p) := h
      _ = True := em_eq p
  calc p = ¬ ¬ p := (not_not_eq p).symm
    _ = ¬ True := by rw [h']
    _ = False := not_true_eq

theorem le_neg_of_eq_false (p : Prop) (h : p = False) : p ≤ ¬ p := by
  show (¬ p) = (p ∨ ¬ p)
  rw [h, not_false_eq, false_or_eq]

/-- `p ≤ q` is an identity, so it is necessary when true. -/
theorem box_le_prop (p q : Prop) (h : p ≤ q) : □ (p ≤ q) := necessity_of_identity _ _ h

/-- `p ≤ q` gives `p → q`. -/
theorem imp_of_le_prop (p q : Prop) (h : p ≤ q) (hp : p) : q := h.mpr (Or.inl hp)

/-- `p ≤ q` gives `p ≤ q ∨ r`, and `p ≤ r → q` is `p ≤ ¬r ∨ q`. -/
theorem le_or_of_le_left_prop (p q r : Prop) (h : p ≤ q) : p ≤ (q ∨ r) :=
  le_trans_prop _ _ _ h (le_or_left_prop q r)

/-! ### More at `t` -/

/-- `True ≤ q` is `□q`: `q = (True ∨ q)` iff `q = True`. -/
theorem true_entails_eq_box (q : Prop) : entails True q = □ q := by
  show (q = (True ∨ q)) = (q = True)
  rw [true_or_eq]

/-- `(p → q) → (q → r) → p → r`. -/
theorem imp_trans_aux (p q r : Prop) : (p → q) → (q → r) → p → r := fun h₁ h₂ hp => h₂ (h₁ hp)

/-- `p ≤ q` and `□(q → r)` give `p ≤ r`. -/
theorem le_of_le_of_box_imp (p q r : Prop) (h : p ≤ q) (hb : □ (q → r)) : p ≤ r :=
  (le_iff_prop _ _).2 (modal_K _ _ (modal_K _ _ (nec% (imp_trans_aux p q r)) ((le_iff_prop _ _).1 h)) hb)

/-- A non-bottom proposition is not below its negation. -/
theorem not_le_neg_of_ne_false (p : Prop) (h : p ≠ False) : ¬ p ≤ ¬ p :=
  fun hle => h (eq_false_of_le_neg p hle)

/-- `w ≤ q ∨ w ≤ ¬q` is necessary once true: each disjunct is. -/
theorem box_le_or_le (w q : Prop) (h : w ≤ q ∨ w ≤ ¬ q) : □ (w ≤ q ∨ w ≤ ¬ q) :=
  h.elim (fun h => modal_K _ _ (nec% (fun (h' : w ≤ q) => (Or.inl h' : w ≤ q ∨ w ≤ ¬ q)))
      (box_le_prop w q h))
    (fun h => modal_K _ _ (nec% (fun (h' : w ≤ ¬ q) => (Or.inr h' : w ≤ q ∨ w ≤ ¬ q)))
      (box_le_prop w (¬ q) h))

/-- `¬p ≤ p` says that `p` is necessary: `p = (¬p ∨ p)` and `¬p ∨ p` is `⊤`. The duals of
Atomicity and Strong Atomicity at `t` are stated with `□p`. -/
theorem neg_le_iff_box (p : Prop) : (¬ p) ≤ p ↔ □ p :=
  have e : (¬ p ∨ p) = True := (or_comm_eq (¬ p) p).trans (em_eq p)
  ⟨fun h => h.trans e, fun h => h.trans e.symm⟩

/-- Negation reverses entailment: `p ≤ q` gives `¬q ≤ ¬p`. Stated with `entails`, the
constant of Tractarianism. -/
theorem entails_neg_neg (p q : Prop) (h : entails p q) : entails (¬ q) (¬ p) :=
  (le_iff_prop _ _).2 (modal_K _ _ (nec% (contra_imp p q)) ((le_iff_prop p q).1 h))

/-- `(¬p → ∀x. ¬Xx) → (∃x. Xx) → p`: for the dual form of Tractarianism. -/
theorem exists_imp_of_not_imp_forall_not {σ : Type} [Ty σ] (p : Prop) (X : σ → Prop) :
    (¬ p → ∀ x, ¬ X x) → (∃ x, X x) → p := fun h he =>
  (em p).elim (fun hp => hp) fun hn => he.elim fun x hx => absurd hx (h hn x)

/-- `((∃x. ¬Xx) → ¬p) → p → ∀x. Xx`: for the dual form of Tractarianism. -/
theorem forall_of_exists_not_imp_not {σ : Type} [Ty σ] (p : Prop) (X : σ → Prop) :
    ((∃ x, ¬ X x) → ¬ p) → p → ∀ x, X x := fun h hp x =>
  (em (X x)).elim (fun hx => hx) fun hn => absurd hp (h ⟨x, hn⟩)

end prop

/-! ### The order at `σ → t`

The same laws at the properties of a type, where `X ≤ Y` is `□∀z. Xz → Yz`: each is the
law at `t` under the box, through a closed lemma necessitated. -/

section arrow

/-- `(∀z. Pz → Qz) → (∀z. Qz → Pz) → P ≡ Q`. -/
theorem coext_of_imp_imp {σ : Type} [Ty σ] (P Q : σ → Prop) :
    (∀ z, P z → Q z) → (∀ z, Q z → P z) → ∀ z, P z ↔ Q z :=
  fun h₁ h₂ z => ⟨h₁ z, h₂ z⟩

/-- `G ≤ G` at `σ → t`. -/
theorem le_refl_arrow_prop {σ : Type} [Ty σ] (G : σ → Prop) : G ≤ G :=
  (le_iff G G).2 (nec% (fun (z : σ) (h : G z) => h))

/-- Two properties below each other are identical: Intensionality. -/
theorem le_antisymm_arrow {σ : Type} [Ty σ] (P Q : σ → Prop) (h₁ : P ≤ Q) (h₂ : Q ≤ P) :
    P = Q :=
  intensionality P Q (modal_K _ _ (modal_K _ _ (nec% (coext_of_imp_imp P Q))
    ((le_iff P Q).1 h₁)) ((le_iff Q P).1 h₂))

/-- At `σ → t`, `⊥` is below everything. -/
theorem bot_le_arrow {σ : Type} [Ty σ] (Y : σ → Prop) : Rel.bot (σ → Prop) ≤ Y :=
  (le_iff _ _).2 (nec% (fun (z : σ) (h : False) => (h.elim : Y z)))

/-- `≤` is transitive at `σ → t`. -/
theorem le_trans_arrow {σ : Type} [Ty σ] (X Y Z : σ → Prop) (h₁ : X ≤ Y) (h₂ : Y ≤ Z) :
    X ≤ Z :=
  (le_iff _ _).2 (modal_K _ _ (modal_K _ _
    (nec% (fun (a : ∀ z, X z → Y z) (b : ∀ z, Y z → Z z) (z : σ) (h : X z) => b z (a z h)))
    ((le_iff _ _).1 h₁)) ((le_iff _ _).1 h₂))

/-- What is below its own negation is below everything, at `σ → t`. -/
theorem le_of_le_neg_arrow {σ : Type} [Ty σ] (X Y : σ → Prop) (h : X ≤ ¬ X) : X ≤ Y :=
  (le_iff _ _).2 (modal_K _ _
    (nec% (fun (a : ∀ z, X z → ¬ X z) (z : σ) (hx : X z) => ((a z hx hx).elim : Y z)))
    ((le_iff _ _).1 h))

/-- And is `⊥`. -/
theorem eq_bot_of_le_neg_arrow {σ : Type} [Ty σ] (X : σ → Prop) (h : X ≤ ¬ X) :
    X = Rel.bot (σ → Prop) :=
  le_antisymm_arrow X _ (le_of_le_neg_arrow X _ h) (bot_le_arrow X)

/-- `X ≤ Y` at `σ → t` gives `Xa ≤ Ya`. -/
theorem le_apply_of_le {σ : Type} [Ty σ] (X Y : σ → Prop) (a : σ) (h : X ≤ Y) :
    X a ≤ Y a :=
  (le_iff_prop _ _).2 (converse_barcan (λ z ↦ X z → Y z) ((le_iff X Y).1 h) a)

/-- `w ≤ Xy` is an identity, so it is necessary when true: `λy. w ≤ Xy` is persistent. -/
theorem le_apply_box {σ : Type} [Ty σ] (w : Prop) (X : σ → Prop) :
    ∀ y, w ≤ X y → □ (w ≤ X y) := fun y h => necessity_of_identity _ _ h

/-- `W ≤ Y ∨ W ≤ ¬Y` is necessary once true: each disjunct is an identity. -/
theorem box_le_or_le_arrow {σ : Type} [Ty σ] (W Y : σ → Prop) (h : W ≤ Y ∨ W ≤ ¬ Y) :
    □ (W ≤ Y ∨ W ≤ ¬ Y) :=
  h.elim
    (fun h => modal_K _ _ (nec% (fun (h' : W ≤ Y) => (Or.inl h' : W ≤ Y ∨ W ≤ ¬ Y)))
      (necessity_of_identity _ _ h))
    (fun h => modal_K _ _ (nec% (fun (h' : W ≤ ¬ Y) => (Or.inr h' : W ≤ Y ∨ W ≤ ¬ Y)))
      (necessity_of_identity _ _ h))

/-- `(¬∃y. Xy) → ∀y. Xy ↔ ⊥`. -/
theorem coext_bot_of_not_exists {σ : Type} [Ty σ] (X : σ → Prop) :
    (¬ ∃ y, X y) → ∀ y, X y ↔ Rel.bot (σ → Prop) y :=
  fun h y => ⟨fun hx => h ⟨y, hx⟩, fun hb => hb.elim⟩

/-- A non-bottom property is possibly instantiated: were it necessarily empty, it would be
coextensive with `⊥` and so, by Intensionality, `⊥`. -/
theorem dia_exists_of_ne_bot {σ : Type} [Ty σ] (X : σ → Prop) (hX : X ≠ Rel.bot (σ → Prop)) :
    ◇ (∃ y, X y) :=
  (em (◇ (∃ y, X y))).elim id fun hn =>
    (hX (intensionality X _ (modal_K _ _ (nec% (coext_bot_of_not_exists X))
      (box_not_of_not_dia _ hn)))).elim

/-! ### More at `σ → t` -/

/-! ### Bounds of bounds -/

/-- A greatest lower bound of the upper bounds of `F` is an upper bound of `F`. -/
theorem glb_ub_upper {τ : Type} [Rel τ] (F : τ → Prop) (G : τ)
    (hG : GLB G (λ w ↦ UB w F)) : UB G F :=
  fun X hX => (hG X).1 (fun _ hY => hY X hX)

/-- And below every upper bound. -/
theorem glb_ub_least {σ : Type} [Ty σ] (F : (σ → Prop) → Prop) (G : σ → Prop)
    (hG : GLB G (λ w ↦ UB w F)) : ∀ Y : σ → Prop, UB Y F → G ≤ Y :=
  fun Y hY => (hG G).2 (le_refl_arrow_prop G) Y hY

/-- And below every upper bound, at `σ → σ' → t`. -/
theorem glb_ub_least₂ {σ σ' : Type} [Ty σ] [Ty σ'] (F : (σ → σ' → Prop) → Prop)
    (G : σ → σ' → Prop) (hG : GLB G (λ w ↦ UB w F)) : ∀ Y, UB Y F → G ≤ Y :=
  fun Y hY => (hG G).2 ((le_iff G G).2 (nec% (fun (x : σ) (z : σ') (h : G x z) => h))) Y hY

end arrow

/-! ### The order at a relational type

At a type parameter `τ`, reflexivity and transitivity come from those of the pointwise
implication (`Pointwise`), under the box; and with them the least upper bound of a property
is the greatest lower bound of its upper bounds, and dually. -/

section rel
variable [Order τ] [Pointwise τ]

/-- `≤` is reflexive at a relational type: `X ⊆ X` under the box. -/
theorem le_refl_rel (x : τ) : x ≤ x :=
  (le_iff _ _).2 (nec% (incl_refl x))

/-- `≤` is transitive at a relational type: `⊆` is, under the box. -/
theorem le_trans_rel (x y z : τ) (h₁ : x ≤ y) (h₂ : y ≤ z) : x ≤ z :=
  (le_iff _ _).2 (modal_K _ _ (modal_K _ _ (nec% (incl_trans x y z))
    ((le_iff _ _).1 h₁)) ((le_iff _ _).1 h₂))

/-- The greatest lower bound of the upper bounds of `X` is a least upper bound of `X`. -/
theorem lub_of_glb_ubs (X : τ → Prop) (y : τ) (hy : GLB y (λ z ↦ UB z X)) : LUB y X :=
  fun z => ⟨fun hz => (hy y).2 (le_refl_rel y) z hz,
    fun hyz x hx => le_trans_rel x y z ((hy x).1 fun w hw => hw x hx) hyz⟩

/-- The least upper bound of the lower bounds of `X` is a greatest lower bound of `X`. -/
theorem glb_of_lub_lbs (X : τ → Prop) (y : τ) (hy : LUB y (λ z ↦ LB z X)) : GLB y X :=
  fun z => ⟨fun hz => (hy y).2 (le_refl_rel y) z hz,
    fun hzy x hx => le_trans_rel z y x hzy ((hy x).1 fun w hw => hw x hx)⟩

/-- `≤` is antisymmetric at a relational type: inclusion both ways under the box is
coextension under the box, which Intensionality makes identity. -/
theorem le_antisymm_rel (x y : τ) (h₁ : x ≤ y) (h₂ : y ≤ x) : x = y :=
  intensionality x y (modal_K _ _ (modal_K _ _ (nec% (coext_of_incl x y))
    ((le_iff _ _).1 h₁)) ((le_iff _ _).1 h₂))

/-- `⊥_τ` is below everything. -/
theorem bot_le_rel (x : τ) : (⊥ : τ) ≤ x :=
  (le_iff _ _).2 (nec% (incl_of_constP x False (fun h => h)))

/-- `¬_τ ¬_τ x ≤ x`. -/
theorem neg_neg_le_rel (x : τ) : (¬ ¬ x) ≤ x := (le_iff _ _).2 (nec% (incl_neg_neg x))

/-- `x ≤ ¬_τ ¬_τ x`. -/
theorem le_neg_neg_rel (x : τ) : x ≤ ¬ ¬ x := (le_iff _ _).2 (nec% (incl_neg_neg' x))

/-- What is below `y` and below `¬_τ y` is below its own negation: it is `⊥_τ`. -/
theorem le_neg_of_le_both_rel (x y : τ) (h₁ : x ≤ y) (h₂ : x ≤ ¬ y) : x ≤ ¬ x :=
  (le_iff _ _).2 (modal_K _ _ (modal_K _ _ (nec% (incl_neg_of_incl_both x y))
    ((le_iff _ _).1 h₁)) ((le_iff _ _).1 h₂))

/-- What is below its own negation is `⊥_τ`. -/
theorem eq_bot_of_le_neg_rel (x : τ) (h : x ≤ ¬ x) : x = ⊥ :=
  le_antisymm_rel x ⊥
    ((le_iff _ _).2 (modal_K _ _ (nec% (incl_of_incl_neg x (⊥ : τ))) ((le_iff _ _).1 h)))
    (bot_le_rel x)

/-- `¬_τ` reverses `≤`: `x ≤ y → ¬y ≤ ¬x`. -/
theorem neg_le_neg_rel (x y : τ) (h : x ≤ y) : (¬ y) ≤ (¬ x) :=
  (le_iff _ _).2 (modal_K _ _ (nec% (incl_contra x y)) ((le_iff _ _).1 h))

/-- `¬_τ ¬_τ x = x`. -/
theorem neg_neg_rel (x : τ) : (¬ ¬ x) = x :=
  le_antisymm_rel _ _ (neg_neg_le_rel x) (le_neg_neg_rel x)

/-- `¬y ≤ ¬x → x ≤ y`. -/
theorem le_of_neg_le_neg_rel (x y : τ) (h : (¬ y) ≤ (¬ x)) : x ≤ y := by
  have h' := neg_le_neg_rel _ _ h
  rw [neg_neg_rel, neg_neg_rel] at h'
  exact h'

/-- `z ≤ ¬y → y ≤ ¬z`. -/
theorem le_neg_comm_rel (y z : τ) (h : z ≤ ¬ y) : y ≤ ¬ z := by
  have h' := neg_le_neg_rel _ _ h
  rw [neg_neg_rel] at h'
  exact h'

/-- `z` is a lower bound of the negations of the members of `X` iff `¬z` is an upper bound
of `X`. -/
theorem lb_neg_iff_ub_neg (X : τ → Prop) (z : τ) : LB z (λ w ↦ X (¬ w)) ↔ UB (¬ z) X :=
  ⟨fun h x hx => le_neg_comm_rel x z (h (¬ x) (show X (¬ ¬ x) by rw [neg_neg_rel]; exact hx)),
   fun h w hw => le_of_neg_le_neg_rel z w (h (¬ w) hw)⟩

/-- The greatest lower bound of the negations of the members of `X` is the negation of
their least upper bound: `GLB(¬y, λw. X(¬w)) ↔ LUB(y, X)`. -/
theorem glb_neg_iff_lub (X : τ → Prop) (y : τ) : GLB (¬ y) (λ w ↦ X (¬ w)) ↔ LUB y X :=
  ⟨fun h u => by
     have e : UB u X ↔ LB (¬ u) (λ w ↦ X (¬ w)) := by rw [lb_neg_iff_ub_neg, neg_neg_rel]
     exact e.trans ((h (¬ u)).trans ⟨le_of_neg_le_neg_rel y u, neg_le_neg_rel y u⟩),
   fun h z => (lb_neg_iff_ub_neg X z).trans ((h (¬ z)).trans
     ⟨le_neg_comm_rel z y, le_neg_comm_rel y z⟩)⟩

end rel

end Classicism
