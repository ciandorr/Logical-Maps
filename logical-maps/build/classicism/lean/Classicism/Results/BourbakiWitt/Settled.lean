import Classicism.Background.BourbakiWitt
import Classicism.Principles

/-!
# What Vicinity provides: the settled propositions

Lemmas 1–4 of the write-ups of `vicinity-and-relational-choice-imply-transversal-choice` and
`vicinity-boolean-completeness-t-and-relational-choice-imply-actuality`. For `v` witnessing
Vicinity, `s := v ∧ ∀r. r → v ≤ ◇r` (here `Vs v`) is true; `p` is *settled* if `s ≤ p` or
`s ≤ ¬p`.

* Lemma 1 (`settled_eq`): every identity is settled.
* Lemma 2 (`collection`, Christopher Sun's argument): if `s ≤ Fx` for every `x`, then
  `s ≤ ∀x. Fx`.
* Lemma 3, a metatheorem by induction on formulas, is replaced here by its cases, as closed
  combinators (`settled_not`, `settled_and`, `settled_or`, `settled_imp`, `settled_forall`,
  `settled_exists`, and the restricted quantifiers through `settledP_settled`); each formula
  the proofs need is shown settled by composing them.
* Lemma 4 (`settled_family_*`): a settled family of propositions has its meet and join computed
  below `s`.

Then the admissibility hypotheses of the Bourbaki–Witt lemma for admissible chains, with the
settled properties admissible, hold whenever `X`, `R` and `F` are settled at every argument
(`bw_settled_admits_*`): the properties its proof forms are settled, by Lemma 3.
-/

namespace Classicism.Proofs.Settled
open Classicism.P Classicism.Paper Classicism.BW

/-- `s := v ∧ ∀r. r → v ≤ ◇r`; `v` witnesses Vicinity iff `Vs v` is true. -/
def Vs (v : Prop) : Prop := v ∧ ∀ r : Prop, r → v ≤ ◇ r

/-- `p` is settled (by `s`): `s ≤ p ∨ s ≤ ¬p`. -/
def Settled (s p : Prop) : Prop := s ≤ p ∨ s ≤ ¬ p

/-- A property is settled if each of its instances is. -/
def SettledP {τ : Type} [Ty τ] (s : Prop) (Y : τ → Prop) : Prop := ∀ b, Settled s (Y b)

/-! ### Below `s` -/

theorem le_of_box (s p : Prop) (h : □ p) : s ≤ p :=
  (le_iff_prop _ _).2 (modal_K _ _ (nec% (imp_intro' s p)) h)

theorem le_mono (s p q : Prop) (h : s ≤ p) (hb : □ (p → q)) : s ≤ q := le_of_le_of_box_imp s p q h hb

theorem le_mono₂ (s p q r : Prop) (hp : s ≤ p) (hq : s ≤ q) (hb : □ (p → q → r)) : s ≤ r :=
  le_mono s (p ∧ q) r (le_and_prop s p q hp hq)
    (modal_K _ _ (nec% (fun (f : p → q → r) (h : p ∧ q) => f h.1 h.2)) hb)

/-- (∗): a settled truth is entailed by the true `s`. -/
theorem le_of_settled (s p : Prop) (hs : s) (h : Settled s p) (hp : p) : s ≤ p :=
  h.elim id (fun h' => (imp_of_le_prop _ _ h' hs hp).elim)

theorem le_neg_of_settled (s p : Prop) (hs : s) (h : Settled s p) (hp : ¬ p) : s ≤ ¬ p :=
  h.elim (fun h' => (hp (imp_of_le_prop _ _ h' hs)).elim) id

/-! ### Lemma 1: identities are settled -/

theorem settled_eq {τ : Type} [Ty τ] (v : Prop) (hs : Vs v) (a b : τ) : Settled (Vs v) (a = b) := by
  rcases em (a = b) with h | h
  · refine Or.inl ?_
    rw [h]
    exact le_of_box _ _ (nec% (rfl : b = b))
  · refine Or.inr (le_mono _ _ _ (le_trans_prop _ _ _ (and_le_left_prop _ _) (hs.2 _ h))
      (nec% (ne_of_dia_ne a b)))

theorem settled_le (v : Prop) (hs : Vs v) (p q : Prop) : Settled (Vs v) (p ≤ q) :=
  settled_eq v hs q (p ∨ q)

theorem settled_le_rel {τ : Type} [Rel τ] (v : Prop) (hs : Vs v) (X Y : τ) :
    Settled (Vs v) (X ≤ Y) :=
  settled_eq v hs Y (Rel.or X Y)

theorem settled_box (v : Prop) (hs : Vs v) (p : Prop) : Settled (Vs v) (□ p) :=
  settled_eq v hs p True

/-! ### Lemma 2: collection (Sun) -/

theorem collect_incons {τ : Type} [Ty τ] (v : Prop) (F : τ → Prop) (x : τ) :
    ¬ ((v ∧ ∀ x, Vs v ≤ F x) ∧ (v ≤ ◇ (Vs v ∧ ¬ F x))) := fun h =>
  imp_of_le_prop _ _ h.2 h.1.1
    ((box_not_eq _).mp (modal_K _ _
      (nec% (fun (f : Vs v → F x) (k : Vs v ∧ ¬ F x) => k.2 (f k.1)))
      ((le_iff_prop _ _).1 (h.1.2 x))))

theorem collect_core {τ : Type} [Ty τ] (v : Prop) (F : τ → Prop) :
    (v ≤ ◇ (v ∧ ∀ x, Vs v ≤ F x)) → Vs v → ∀ x, F x := by
  intro hE hs x
  rcases em (F x) with h | h
  · exact h
  · have hG := hs.2 (Vs v ∧ ¬ F x) ⟨hs, h⟩
    have hd := dia_and_of_dia_box _ _ (imp_of_le_prop _ _ hE hs.1) (necessity_of_identity _ _ hG)
    exact (hd ((box_not_eq _).mp (nec% (collect_incons v F x)))).elim

/-- **Lemma 2** (collection; Sun): if `s ≤ Fx` for every `x`, then `s ≤ ∀x. Fx`. -/
theorem collection {τ : Type} [Ty τ] (v : Prop) (hs : Vs v) (F : τ → Prop)
    (h : ∀ x, Vs v ≤ F x) : Vs v ≤ ∀ x, F x :=
  (le_iff_prop _ _).2 (modal_K _ _ (nec% (collect_core v F))
    (necessity_of_identity _ _ (hs.2 (v ∧ ∀ x, Vs v ≤ F x) ⟨hs.1, h⟩)))

/-! ### Lemma 3, case by case -/

theorem settled_not (s p : Prop) (h : Settled s p) : Settled s (¬ p) :=
  h.elim (fun h => Or.inr (le_mono _ _ _ h (nec% (fun (hp : p) (hn : ¬ p) => hn hp))))
    Or.inl

theorem settled_imp (s p q : Prop) (hs : s) (hp : Settled s p) (hq : p → Settled s q) :
    Settled s (p → q) := by
  rcases em p with h | h
  · rcases hq h with h' | h'
    · exact Or.inl (le_mono _ _ _ h' (nec% (fun (k : q) (_ : p) => k)))
    · exact Or.inr (le_mono₂ _ _ _ _ (le_of_settled s p hs hp h) h'
        (nec% (fun (a : p) (b : ¬ q) (f : p → q) => b (f a))))
  · exact Or.inl (le_mono _ _ _ (le_neg_of_settled s p hs hp h)
      (nec% (fun (n : ¬ p) (a : p) => ((n a).elim : q))))

theorem settled_and (s p q : Prop) (hs : s) (hp : Settled s p) (hq : p → Settled s q) :
    Settled s (p ∧ q) := by
  rcases em p with h | h
  · rcases hq h with h' | h'
    · exact Or.inl (le_mono₂ _ _ _ _ (le_of_settled s p hs hp h) h'
        (nec% (fun (a : p) (b : q) => (⟨a, b⟩ : p ∧ q))))
    · exact Or.inr (le_mono _ _ _ h' (nec% (fun (b : ¬ q) (k : p ∧ q) => b k.2)))
  · exact Or.inr (le_mono _ _ _ (le_neg_of_settled s p hs hp h)
      (nec% (fun (n : ¬ p) (k : p ∧ q) => n k.1)))

theorem settled_or (s p q : Prop) (hs : s) (hp : Settled s p) (hq : Settled s q) :
    Settled s (p ∨ q) := by
  rcases em p with h | h
  · exact Or.inl (le_mono _ _ _ (le_of_settled s p hs hp h)
      (nec% (fun (a : p) => (Or.inl a : p ∨ q))))
  · rcases em q with h' | h'
    · exact Or.inl (le_mono _ _ _ (le_of_settled s q hs hq h')
        (nec% (fun (a : q) => (Or.inr a : p ∨ q))))
    · exact Or.inr (le_mono₂ _ _ _ _ (le_neg_of_settled s p hs hp h)
        (le_neg_of_settled s q hs hq h')
        (nec% (fun (a : ¬ p) (b : ¬ q) (k : p ∨ q) => k.elim a b)))

theorem settled_forall {τ : Type} [Ty τ] (v : Prop) (hs : Vs v) (F : τ → Prop)
    (h : ∀ x, Settled (Vs v) (F x)) : Settled (Vs v) (∀ x, F x) := by
  rcases em (∃ x, ¬ F x) with hx | hx
  · obtain ⟨x, hx⟩ := hx
    exact Or.inr (le_mono _ _ _ (le_neg_of_settled _ _ hs (h x) hx)
      (nec% (fun (n : ¬ F x) (k : ∀ x, F x) => n (k x))))
  · refine Or.inl (collection v hs F (fun x => le_of_settled _ _ hs (h x) ?_))
    rcases em (F x) with h' | h'
    · exact h'
    · exact (hx ⟨x, h'⟩).elim

theorem settled_exists {τ : Type} [Ty τ] (v : Prop) (hs : Vs v) (F : τ → Prop)
    (h : ∀ x, Settled (Vs v) (F x)) : Settled (Vs v) (∃ x, F x) := by
  rcases em (∃ x, F x) with hx | hx
  · obtain ⟨x, hx⟩ := hx
    exact Or.inl (le_mono _ _ _ (le_of_settled _ _ hs (h x) hx)
      (nec% (fun (k : F x) => (⟨x, k⟩ : ∃ x, F x))))
  · refine Or.inr (le_mono _ _ _ (collection v hs (λ x ↦ ¬ F x)
      (fun x => le_neg_of_settled _ _ hs (h x) (fun k => hx ⟨x, k⟩)))
      (nec% (fun (n : ∀ x, ¬ F x) (k : ∃ x, F x) => k.elim fun x hx => n x hx)))

/-- Being settled is built from identities, so it is settled. -/
theorem settledP_settled {τ : Type} [Ty τ] (v : Prop) (hs : Vs v) (Y : τ → Prop) :
    Settled (Vs v) (SettledP (Vs v) Y) :=
  settled_forall v hs _ (fun _ => settled_or _ _ _ hs (settled_le v hs _ _) (settled_le v hs _ _))

/-! ### Lemma 4: settled families of propositions -/

/-- (1): `s ∧ ∀p. (Ap → p) ≤ p` for every `p` with `Ap`. -/
theorem settled_family_meet (v : Prop) (hs : Vs v) (A : Prop → Prop) (hA : SettledP (Vs v) A)
    (p : Prop) (hp : A p) : (Vs v ∧ ∀ q, A q → q) ≤ p :=
  (le_iff_prop _ _).2 (modal_K _ _
    (nec% (fun (f : Vs v → A p) (k : Vs v ∧ ∀ q, A q → q) => k.2 p (f k.1)))
    ((le_iff_prop _ _).1 (le_of_settled _ _ hs (hA p) hp)))

/-- (2): `s ∧ p ≤ ∃q. Aq ∧ q` for every `p` with `Ap`. -/
theorem settled_family_join_upper (v : Prop) (hs : Vs v) (A : Prop → Prop)
    (hA : SettledP (Vs v) A) (p : Prop) (hp : A p) : (Vs v ∧ p) ≤ ∃ q, A q ∧ q :=
  (le_iff_prop _ _).2 (modal_K _ _
    (nec% (fun (f : Vs v → A p) (k : Vs v ∧ p) => (⟨p, f k.1, k.2⟩ : ∃ q, A q ∧ q)))
    ((le_iff_prop _ _).1 (le_of_settled _ _ hs (hA p) hp)))

/-- (3): `s ∧ ∃q. Aq ∧ q ≤ w` whenever `w` bounds every `p` with `Ap`. -/
theorem settled_family_join_least (v : Prop) (hs : Vs v) (A : Prop → Prop)
    (hA : SettledP (Vs v) A) (w : Prop) (hw : ∀ p, A p → p ≤ w) :
    (Vs v ∧ ∃ q, A q ∧ q) ≤ w := by
  have h : Vs v ≤ ∀ q, A q ∧ q → w := collection v hs _ (fun q => by
    rcases em (A q) with h | h
    · exact le_of_box _ _ (modal_K _ _ (nec% (fun (f : q → w) (k : A q ∧ q) => f k.2))
        ((le_iff_prop _ _).1 (hw q h)))
    · exact le_mono _ _ _ (le_neg_of_settled _ _ hs (hA q) h)
        (nec% (fun (n : ¬ A q) (k : A q ∧ q) => ((n k.1).elim : w))))
  exact (le_iff_prop _ _).2 (modal_K _ _
    (nec% (fun (f : Vs v → ∀ q, A q ∧ q → w) (k : Vs v ∧ ∃ q, A q ∧ q) =>
      k.2.elim (fun q hq => f k.1 q hq)))
    ((le_iff_prop _ _).1 h))

/-! ### The properties the Bourbaki–Witt proof forms are settled -/

section Admits
variable {τ : Type} [Ty τ]

theorem totalOn_settled (v : Prop) (hs : Vs v) (R : τ → τ → Prop) (Z : τ → Prop)
    (hR : ∀ x y, Settled (Vs v) (R x y)) (hZ : SettledP (Vs v) Z) :
    Settled (Vs v) (TotalOn R Z) :=
  settled_forall v hs _ fun x => settled_forall v hs _ fun y =>
    settled_imp _ _ _ hs (hZ x) fun _ => settled_imp _ _ _ hs (hZ y) fun _ =>
      settled_or _ _ _ hs (hR x y) (hR y x)

theorem ubIn_settled (v : Prop) (hs : Vs v) (X : τ → Prop) (R : τ → τ → Prop) (u : τ)
    (Z : τ → Prop) (hX : SettledP (Vs v) X) (hR : ∀ x y, Settled (Vs v) (R x y))
    (hZ : SettledP (Vs v) Z) : Settled (Vs v) (UBIn X R u Z) :=
  settled_and _ _ _ hs (hX u) fun _ => settled_forall v hs _ fun z =>
    settled_imp _ _ _ hs (hZ z) fun _ => hR z u

theorem supIn_settled (v : Prop) (hs : Vs v) (X : τ → Prop) (R : τ → τ → Prop) (u : τ)
    (Z : τ → Prop) (hX : SettledP (Vs v) X) (hR : ∀ x y, Settled (Vs v) (R x y))
    (hZ : SettledP (Vs v) Z) : Settled (Vs v) (SupIn X R u Z) :=
  settled_and _ _ _ hs (ubIn_settled v hs X R u Z hX hR hZ) fun _ =>
    settled_forall v hs _ fun w =>
      settled_imp _ _ _ hs (ubIn_settled v hs X R w Z hX hR hZ) fun _ => hR u w

theorem closed_settled (v : Prop) (hs : Vs v) (X : τ → Prop) (R F : τ → τ → Prop)
    (hX : SettledP (Vs v) X) (hR : ∀ x y, Settled (Vs v) (R x y))
    (hF : ∀ x y, Settled (Vs v) (F x y)) (Y : τ → Prop) (hY : SettledP (Vs v) Y) :
    Settled (Vs v) (Closed (SettledP (Vs v)) X R F Y) :=
  settled_and _ _ _ hs
    (settled_forall v hs _ fun x => settled_imp _ _ _ hs (hY x) fun _ => hX x) fun _ =>
  settled_and _ _ _ hs
    (settled_forall v hs _ fun x => settled_forall v hs _ fun y =>
      settled_imp _ _ _ hs (hY x) fun _ => settled_imp _ _ _ hs (hF x y) fun _ => hY y) fun _ =>
  settled_forall v hs _ fun Z => settled_forall v hs _ fun u =>
    settled_imp _ _ _ hs (settledP_settled v hs Z) fun hZ =>
      settled_imp _ _ _ hs
        (settled_forall v hs _ fun z => settled_imp _ _ _ hs (hZ z) fun _ => hY z) fun _ =>
      settled_imp _ _ _ hs (totalOn_settled v hs R Z hR hZ) fun _ =>
      settled_imp _ _ _ hs (supIn_settled v hs X R u Z hX hR hZ) fun _ => hY u

theorem tower_settled (v : Prop) (hs : Vs v) (X : τ → Prop) (R F : τ → τ → Prop)
    (hX : SettledP (Vs v) X) (hR : ∀ x y, Settled (Vs v) (R x y))
    (hF : ∀ x y, Settled (Vs v) (F x y)) : SettledP (Vs v) (Tower (SettledP (Vs v)) X R F) :=
  fun x => settled_forall v hs _ fun Y =>
    settled_imp _ _ _ hs (settledP_settled v hs Y) fun hY =>
      settled_imp _ _ _ hs (closed_settled v hs X R F hX hR hF Y hY) fun _ => hY x

theorem pivot_settled (v : Prop) (hs : Vs v) (X : τ → Prop) (R F : τ → τ → Prop)
    (hX : SettledP (Vs v) X) (hR : ∀ x y, Settled (Vs v) (R x y))
    (hF : ∀ x y, Settled (Vs v) (F x y)) : SettledP (Vs v) (Pivot (SettledP (Vs v)) X R F) :=
  have hT := tower_settled v hs X R F hX hR hF
  fun c => settled_and _ _ _ hs (hT c) fun _ =>
    settled_forall v hs _ fun b => settled_forall v hs _ fun d =>
      settled_imp _ _ _ hs (hT b) fun _ => settled_imp _ _ _ hs (hR b c) fun _ =>
      settled_imp _ _ _ hs (settled_not _ _ (hR c b)) fun _ =>
      settled_imp _ _ _ hs (hF b d) fun _ => hR d c

theorem mce_settled (v : Prop) (hs : Vs v) (X : τ → Prop) (R F : τ → τ → Prop)
    (hX : SettledP (Vs v) X) (hR : ∀ x y, Settled (Vs v) (R x y))
    (hF : ∀ x y, Settled (Vs v) (F x y)) (c e : τ) :
    SettledP (Vs v) (Mce (SettledP (Vs v)) X R F c e) :=
  have hT := tower_settled v hs X R F hX hR hF
  fun b => settled_and _ _ _ hs (hT b) fun _ => settled_or _ _ _ hs (hR b c) (hR e b)

theorem admits_settled (s : Prop) (Y : τ → Prop) (h : SettledP s Y) : Admits (SettledP s) Y :=
  ⟨Y, h, fun _ => Iff.rfl⟩

/-- The Bourbaki–Witt lemma for admissible chains with the settled properties admissible, for
`X`, `R`, `F` settled at every argument: a closed lemma, so that a use of it at large `X` and
`F` costs the translator a citation rather than the four admissibility proofs. -/
theorem bw_settled_fixed_point (v : Prop) (hs : Vs v) (X : τ → Prop) (R F : τ → τ → Prop)
    (hX : SettledP (Vs v) X) (hR : ∀ x y, Settled (Vs v) (R x y))
    (hFs : ∀ x y, Settled (Vs v) (F x y))
    (hrefl : ∀ x, X x → R x x)
    (htrans : ∀ x y z, X x → X y → X z → R x y → R y z → R x z)
    (hanti : ∀ x y, X x → X y → R x y → R y x → x = y)
    (hsup : ∀ Z, SettledP (Vs v) Z → (∀ z, Z z → X z) → TotalOn R Z → ∃ s, SupIn X R s Z)
    (hser : ∀ x, X x → ∃ y, F x y)
    (hF : ∀ x y, X x → F x y → X y)
    (hprog : ∀ x y, X x → F x y → R x y)
    (hfun : ∀ x y y', X x → F x y → F x y' → y = y') :
    ∃ m, X m ∧ F m m :=
  (bourbaki_witt_fixed_point (SettledP (Vs v)) X R F hrefl htrans hanti hsup hser hF hprog hfun
    (admits_settled _ _ hX)
    (admits_settled _ _ (tower_settled v hs X R F hX hR hFs))
    (admits_settled _ _ (pivot_settled v hs X R F hX hR hFs))
    (fun c e _ _ => admits_settled _ _ (mce_settled v hs X R F hX hR hFs c e))).elim
    fun m hm => ⟨m, hm.1.2.1.1, hm.2⟩

end Admits

end Classicism.Proofs.Settled
