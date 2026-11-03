import Classicism.Background.Box5
import Classicism.Results.Records.Lattice
import Classicism.Results.Records.Necessity

/-!
# Proofs of map records: from the theory of 5-necessity

Records whose arguments use the Barcan formula for `□₅` or Theorem D9 of *The Bounds of
Possibility*, Appendix D (`Background/Box5.lean`):

* the 5-necessity form of Vicinity (Christopher Sun, 19 October 2026), the lemma
  `vicinity_five_form`;
* `vicinity-implies-five-implies-two-hat` (Sun's argument, through a strongest 5-necessary
  proposition and Theorem D9), and so `vicinity-and-barcan-t-imply-five-implies-two-hat`;
* `vicinity-and-atomicity-t-imply-actuality` (Dorr, 28 October 2026);
* `actuality-and-five-implies-nd-necessity-imply-inextensible-comprehension` (Dorr with
  GPT-6 Astra, 29 October 2026), at `σ → t`, its list form being the record at every arity.

The conventions are in `Results/Records.lean`.
-/

namespace Classicism.Proofs
open Classicism.P Classicism.Paper Classicism.AppD

/-! ### Operators of the form `λr. A ≤ r` -/

/-- `λr. □(A → r)` is N and K. -/
theorem boxImp_nk (A : Prop) : OpNK (fun r => □ (A → r)) :=
  ⟨fun p hp => box_imp_of_box A p hp,
   fun p q h₁ h₂ => modal_K _ _ (modal_K _ _
     (nec% (fun (f : A → p → q) (g : A → p) (a : A) => f a (g a))) h₁) h₂⟩

/-- An operator that is not F⟨⟩ has a counterexample. -/
theorem not_f0_witness (O : Prop → Prop) :
    ¬ OpF0 O → ∃ Y : Prop → Prop, (∀ z, O (Y z)) ∧ ¬ O (∀ z, Y z) := fun h =>
  (em (∃ Y : Prop → Prop, (∀ z, O (Y z)) ∧ ¬ O (∀ z, Y z))).elim id fun hn =>
    (h fun Y hY => (em (O (∀ z, Y z))).elim id fun ho => (hn ⟨Y, hY, ho⟩).elim).elim

/-- `¬(A → ∀z. Yz) → A ∧ ∃z. ¬Yz`. -/
theorem and_exists_not_of_not_imp (A : Prop) (Y : Prop → Prop) :
    ¬ (A → ∀ z, Y z) → A ∧ ∃ z, ¬ Y z := fun h =>
  ⟨(em A).elim id fun ha => (h fun a => (ha a).elim).elim,
   (em (∃ z, ¬ Y z)).elim id fun hn =>
     (h fun _ z => (em (Y z)).elim id fun hy => (hn ⟨z, hy⟩).elim).elim⟩

/-- `¬(a → b) → a ∧ ¬b`. -/
theorem and_not_of_not_imp (a b : Prop) : ¬ (a → b) → a ∧ ¬ b := fun h =>
  ⟨(em a).elim id fun ha => (h fun x => (ha x).elim).elim, fun hb => h fun _ => hb⟩

/-- **Theorem D9 against `λr. A ≤ r`.** If `A` is possible and excludes a 5-necessary `p`,
and `λr. A ≤ r` is J, then it is not F⟨⟩: there is `Y` with `A ≤ Yz` for each `z` and
`◇(A ∧ ∃z. ¬Yz)`. -/
theorem boxImp_counter (A p : Prop) (hJ : OpJ (fun r => □ (A → r))) (h5 : Box5 p)
    (hA : ◇ A) (hAp : □ (A → ¬ p)) :
    ∃ Y : Prop → Prop, (∀ z, □ (A → Y z)) ∧ ◇ (A ∧ ∃ z, ¬ Y z) :=
  (not_f0_witness _ fun hF =>
    have hb : □ (A → p) := theorem_D9 _ ⟨(boxImp_nk A).1, (boxImp_nk A).2, hJ, hF⟩ p h5
    not_dia_of_box_not _ (modal_K _ _ (modal_K _ _
      (nec% (fun (g : A → p) (g' : A → ¬ p) (a : A) => g' a (g a))) hb) hAp) hA).elim
    fun Y ⟨hY, hn⟩ => ⟨Y, hY, dia_mono _ _ (nec% (and_exists_not_of_not_imp A Y))
      (dia_not_of_not_box _ hn)⟩

/-! ### The 5-necessity form of Vicinity -/

/-- The closed step of `vicinity_five_form`: where `A` holds, entailing `v` and that `v` entails
the possibility of each truth, `v ≤ ◇(v ∧ ∀z. A ≤ Yz)` excludes `¬Yz`. -/
theorem vicinity_five_core (A v : Prop) (Y : Prop → Prop)
    (hA : A → v ∧ ∀ r : Prop, r → v ≤ ◇ r) :
    □ (v → ◇ (v ∧ ∀ z, □ (A → Y z))) → (A ∧ ∃ z, ¬ Y z) → False := fun H ⟨ha, z, hz⟩ =>
  have h₂ : □ (v → ◇ (A ∧ ¬ Y z)) := (le_iff_prop _ _).1 ((hA ha).2 _ ⟨ha, hz⟩)
  have h₃ : □ (¬ (v ∧ ∀ z, □ (A → Y z))) := modal_K _ _
    (nec% (fun (g : □ (v → ◇ (A ∧ ¬ Y z))) (c : v ∧ ∀ z, □ (A → Y z)) =>
      not_dia_of_box_not _ (modal_K _ _
        (nec% (fun (f : A → Y z) (d : A ∧ ¬ Y z) => d.2 (f d.1))) (c.2 z)) (box_elim g c.1)))
    (modal_four _ h₂)
  box_elim H (hA ha).1 ((box_not_eq _).mp h₃)

/-- **The 5-necessity form of Vicinity** (Christopher Sun, 19 October 2026): with `v` the
witness of Vicinity, `s := v ∧ ∀r. r → v ≤ ◇r` is a truth entailing every 5-necessary truth.
Were `◇(s ∧ ¬p)` with `□₅p`, `λr. (s ∧ ¬p) ≤ r` would be N, K and J but, by Theorem D9, not
F⟨⟩; its counterexample `Y` is refuted by Vicinity at the truth `v ∧ ∀z. (s ∧ ¬p) ≤ Yz`. -/
theorem vicinity_five_form : Vicinity → ∃ s : Prop, s ∧ ∀ q : Prop, Box5 q → s ≤ q :=
  fun ⟨v, hv, hV⟩ => ⟨v ∧ ∀ r : Prop, r → v ≤ ◇ r, ⟨hv, hV⟩, fun p h5 =>
    (em ((v ∧ ∀ r : Prop, r → v ≤ ◇ r) ≤ p)).elim id fun hnp =>
      have hA : ◇ ((v ∧ ∀ r : Prop, r → v ≤ ◇ r) ∧ ¬ p) := dia_mono _ _
        (nec% (and_not_of_not_imp (v ∧ ∀ r : Prop, r → v ≤ ◇ r) p))
        (dia_not_of_not_box _ fun hb => hnp ((le_iff_prop _ _).2 hb))
      (boxImp_counter ((v ∧ ∀ r : Prop, r → v ≤ ◇ r) ∧ ¬ p) p
        (fun r hr => modal_K _ _
          (nec% (fun (g : v → ◇ r) (a : (v ∧ ∀ r : Prop, r → v ≤ ◇ r) ∧ ¬ p) => g a.1.1))
          ((le_iff_prop _ _).1 (hV r hr)))
        h5 hA (nec% (fun (a : (v ∧ ∀ r : Prop, r → v ≤ ◇ r) ∧ ¬ p) => a.2))).elim
        fun Y ⟨hY, hD⟩ => (not_dia_of_box_not _ (modal_K _ _
          (nec% (vicinity_five_core ((v ∧ ∀ r : Prop, r → v ≤ ◇ r) ∧ ¬ p) v Y (fun a => a.1)))
          (modal_four _ ((le_iff_prop _ _).1 (hV _ ⟨hv, hY⟩)))) hD).elim⟩

/-! ### Vicinity: 5-necessities are two-hat necessary (Sun, 19 October 2026) -/

/-- The closed step of (c): `□(t → □₅q) → ◇₅t → q`. -/
theorem principal_core (t q : Prop) : □ (t → Box5 q) → ¬ Box5 (¬ t) → q := fun h hs =>
  (em q).elim id fun hq => (hs (box5_k _ _
    (box5_mono _ _ (nec% (fun (f : t → Box5 q) (g : ¬ Box5 q) (ht : t) => g (f ht))) (box5_n _ h))
    (by have h' := box5_b (¬ q) hq; rwa [not_not_eq] at h'))).elim

/-- (c) of the write-up: if `t` entails every 5-necessary truth, `◇₅t` entails every
5-necessary proposition, by `4` and B for `□₅`. -/
theorem principal_le (t : Prop) (hT : ∀ q : Prop, Box5 q → t ≤ q) (q : Prop) (h : Box5 q) :
    (¬ Box5 (¬ t)) ≤ q :=
  (le_iff_prop _ _).2 (modal_K _ _ (nec% (principal_core t q))
    (modal_four _ ((le_iff_prop _ _).1 (hT _ (box5_four q h)))))

/-- `□_≠` is monotone, so `◇_≠` is: `□(s → T) → ◇_≠s → ◇_≠T`. -/
theorem diaNe_mono (s T : Prop) : □ (s → T) → DiaNe s → DiaNe T := fun h hs ⟨q, hq, hb⟩ =>
  hs ⟨q, hq, modal_K _ _ (modal_K _ _
    (nec% (fun (f : s → T) (g : ◇ q → ¬ T) (d : ◇ q) (h' : s) => g d (f h'))) h) hb⟩

/-- `◇_≠x → r → ◇(◇r ∧ x)`. -/
theorem diaNe_char (x r : Prop) : DiaNe x → r → ◇ (◇ r ∧ x) := fun h hr =>
  (em (◇ (◇ r ∧ x))).elim id fun hn => (h ⟨r, hr, modal_K _ _
    (nec% (fun (g : ¬ (◇ r ∧ x)) (d : ◇ r) (hx : x) => g ⟨d, hx⟩))
    (box_not_of_not_dia _ hn)⟩).elim

/-- The closed step of Sun's Step 2: where `A` holds, entailing `◇_≠s`, and `◇_≠` carries `s` to
`T := ∀z. A ≤ Yz`, there is no `z` with `¬Yz`. -/
theorem sun_core (s A : Prop) (Y : Prop → Prop) (hAs : A → DiaNe s) :
    (DiaNe s → DiaNe (∀ z, □ (A → Y z))) → (A ∧ ∃ z, ¬ Y z) → False := fun g ⟨ha, z, hz⟩ =>
  diaNe_char _ (A ∧ ¬ Y z) (g (hAs ha)) ⟨ha, hz⟩ ((box_not_eq _).mp
    (nec% (fun (c : ◇ (A ∧ ¬ Y z) ∧ ∀ z, □ (A → Y z)) => not_dia_of_box_not _ (modal_K _ _
      (nec% (fun (f : A → Y z) (d : A ∧ ¬ Y z) => d.2 (f d.1))) (c.2 z)) c.1)))

/-- Sun's Step 2: with `t` a truth entailing every 5-necessary truth and `s := ◇₅t`,
`□(◇_≠s → s)`. Otherwise `A := ◇_≠s ∧ ¬s` is possible, and `λr. A ≤ r` is J (each `◇q`, for
`q` true, being 5-necessary, so entailed by `s`), so by Theorem D9 it fails F⟨⟩ at some `Y`;
`T := ∀z. A ≤ Yz` is 5-necessary (the Barcan formula for `□₅`), so `s ≤ T`, and the
characterization of `◇_≠` refutes the counterexample. -/
theorem box_diaNe_imp_principal (t : Prop) (ht : t) (hT : ∀ q : Prop, Box5 q → t ≤ q) :
    □ (DiaNe (¬ Box5 (¬ t)) → ¬ Box5 (¬ t)) :=
  (em (□ (DiaNe (¬ Box5 (¬ t)) → ¬ Box5 (¬ t)))).elim id fun hn =>
    have hA : ◇ (DiaNe (¬ Box5 (¬ t)) ∧ ¬ ¬ Box5 (¬ t)) := dia_mono _ _
      (nec% (and_not_of_not_imp _ _)) (dia_not_of_not_box _ hn)
    have hJ : OpJ (fun r => □ (DiaNe (¬ Box5 (¬ t)) ∧ ¬ ¬ Box5 (¬ t) → r)) := fun q hq =>
      modal_K _ _ (nec% (fun (g : ◇ (¬ Box5 (¬ t)) → ◇ q)
          (a : DiaNe (¬ Box5 (¬ t)) ∧ ¬ ¬ Box5 (¬ t)) => g (dia_of_not_boxNe_neg _ a.1)))
        (box_dia_imp_of_box_imp_dia _ _
          ((le_iff_prop _ _).1 (principal_le t hT _ (box5_dia q hq))))
    (boxImp_counter _ _ hJ (box5_b t ht) hA (nec% (fun (a : DiaNe (¬ Box5 (¬ t)) ∧
        ¬ ¬ Box5 (¬ t)) => a.2))).elim fun Y ⟨hY, hD⟩ =>
      have hsT := principal_le t hT _ (box5_barcan _ fun z => box5_n _ (modal_four _ (hY z)))
      (not_dia_of_box_not _ (modal_K _ _
        (nec% (sun_core (¬ Box5 (¬ t)) (DiaNe (¬ Box5 (¬ t)) ∧ ¬ ¬ Box5 (¬ t)) Y (fun a => a.1)))
        (modal_K _ _ (nec% (diaNe_mono _ _)) (modal_four _ ((le_iff_prop _ _).1 hsT)))) hD).elim

/-- `vicinity-implies-five-implies-two-hat` (Christopher Sun, 19 October 2026). By the
5-necessity form of Vicinity, let `t` be a truth entailing every 5-necessary truth; then
`s := ◇₅t` is true, entails every 5-necessary proposition (`principal_le`), and
`□(◇_≠s → s)` (`box_diaNe_imp_principal`); so `s` witnesses `□̂̂p` for each 5-necessary `p`. -/
theorem vicinity_implies_five_implies_two_hat : Vicinity → FiveImpliesTwoHatNecessity :=
  fun vic p h5 => (vicinity_five_form vic).elim fun t ⟨ht, hT⟩ =>
    ⟨¬ Box5 (¬ t), fun h => box5_le _ h ht, modal_K _ _ (modal_K _ _
      (nec% (fun (f : DiaNe (¬ Box5 (¬ t)) → ¬ Box5 (¬ t)) (g : ¬ Box5 (¬ t) → p)
          (d : DiaNe (¬ Box5 (¬ t))) => g (f d)))
      (box_diaNe_imp_principal t ht hT)) ((le_iff_prop _ _).1 (principal_le t hT p h5))⟩

/-- `vicinity-and-barcan-t-imply-five-implies-two-hat`: Vicinity alone suffices
(`vicinity_implies_five_implies_two_hat`). -/
theorem vicinity_and_barcan_t_imply_five_implies_two_hat :
    Vicinity → BarcanT → FiveImpliesTwoHatNecessity := fun vic _ =>
  vicinity_implies_five_implies_two_hat vic

/-! ### Vicinity and Atomicity give Actuality (Dorr, 28 October 2026) -/

/-- A true atom gives Actuality: it entails each truth. -/
theorem actuality_of_true_atom (w : Prop) (ha : Atom w) (hw : w) : Actuality :=
  ⟨w, hw, fun q hq => (atom_le_or_le_neg w q ha).elim id fun h =>
    (imp_of_le_prop w (¬ q) h hw hq).elim⟩

/-- The clause of `Atom w` at `z` is decided: 5-necessary when true. -/
theorem box5_atom_clause (w z : Prop) :
    ((z ≤ w ∧ z ≠ w) ↔ z ≤ ¬ z) → Box5 ((z ≤ w ∧ z ≠ w) ↔ z ≤ ¬ z) :=
  have hP := box5_and_of_decided (z ≤ w) (z ≠ w) (box5_of_eq _ _) (box5_of_ne _ _)
    (box5_of_ne _ _) (fun h => box5_mono _ _ (nec% (fun (e : z = w) (hn : z ≠ w) => hn e))
      (box5_of_eq _ _ ((em (z = w)).elim id fun hne => (h hne).elim)))
  box5_iff_of_decided _ _ hP.1 hP.2 (box5_of_eq _ _) (box5_of_ne _ _)

/-- `◇₅¬Atom w → ¬Atom w`: the clauses of `Atom w` are decided, and the Barcan formula for
`□₅` brings the quantifier out. -/
theorem not_atom_of_dia5 (w : Prop) : ¬ Box5 (Atom w) → ¬ Atom w := fun hn ha =>
  (dia5_exists (fun z => ¬ ((z ≤ w ∧ z ≠ w) ↔ z ≤ ¬ z)) fun hb => hn (box5_mono _ _
    (nec% (fun (H : ¬ ∃ z, ¬ ((z ≤ w ∧ z ≠ w) ↔ z ≤ ¬ z)) (z : Prop) =>
      (em ((z ≤ w ∧ z ≠ w) ↔ z ≤ ¬ z)).elim id fun h => (H ⟨z, h⟩).elim)) hb)).elim
    fun z hz => hz (box5_mono _ _
      (nec% (fun (h : (z ≤ w ∧ z ≠ w) ↔ z ≤ ¬ z) (hn : ¬ ((z ≤ w ∧ z ≠ w) ↔ z ≤ ¬ z)) => hn h))
      (box5_atom_clause w z (ha z)))

/-- An atom below a truth `v` that entails every 5-necessary truth is a self-atom:
`w ≤ Atom w`. Otherwise `w ≤ ¬Atom w`; `◇₅w`, since `v` entails each 5-necessity; so
`◇₅¬Atom w`, and `¬Atom w` (`not_atom_of_dia5`). -/
theorem le_atom_of_le_five (v : Prop) (hv : ∀ q : Prop, Box5 q → v ≤ q) (w : Prop) (hw : Atom w)
    (hwv : w ≤ v) : w ≤ Atom w :=
  (atom_le_or_le_neg w (Atom w) hw).elim id fun hn =>
    have h5w : ¬ Box5 (¬ w) := fun h => not_le_neg_of_atom hw (le_trans_prop w v (¬ w) hwv (hv _ h))
    (not_atom_of_dia5 w (fun h => h5w (box5_mono _ _ (modal_K _ _
      (nec% (fun (g : w → ¬ Atom w) (a : Atom w) (h' : w) => g h' a))
      ((le_iff_prop _ _).1 hn)) h)) hw).elim

/-- `vicinity-and-atomicity-t-imply-actuality` (Cian Dorr, 28 October 2026). Let `v` be a truth
entailing every 5-necessary truth. Every atom below `v` is a self-atom (`le_atom_of_le_five`),
so entails Actuality, a true atom giving it. By Atomicity, in its dual form, `v ≤ Actuality`:
an atom is below `v` or below `¬v`. -/
theorem vicinity_and_atomicity_t_imply_actuality : Vicinity → AtomicityT → Actuality :=
  fun vic at_ => (vicinity_five_form vic).elim fun v ⟨hv, hV⟩ =>
    box_elim (AtomicityT.to_dual at_ (v → Actuality) fun w hw =>
      (atom_le_or_le_neg w v hw).elim
        (fun hwv => (le_iff_prop _ _).2 (modal_K _ _
          (nec% (fun (g : w → Atom w) (h : w) (_ : v) => actuality_of_true_atom w (g h) h))
          ((le_iff_prop _ _).1 (le_atom_of_le_five v hV w hw hwv))))
        (fun hwn => (le_iff_prop _ _).2 (modal_K _ _
          (nec% (fun (g : w → ¬ v) (h : w) (h' : v) => ((g h h').elim : Actuality)))
          ((le_iff_prop _ _).1 hwn)))) hv

/-! ### Actuality and the 5-necessity collapse give Inextensible Comprehension
(Dorr with GPT-6 Astra, 29 October 2026) -/

/-- With `a` the actual world, `◇(◇a ∧ p) → ◇_≠p`: a truth `q` is entailed by `a`. -/
theorem diaNe_of_dia_actual (a : Prop) (ha : ActualWorld a) (p : Prop) :
    ◇ (◇ a ∧ p) → DiaNe p := fun hd ⟨q, hq, hb⟩ =>
  not_dia_of_box_not _ (modal_K _ _ (modal_K _ _
    (nec% (fun (f : ◇ a → ◇ q) (g : ◇ q → ¬ p) (c : ◇ a ∧ p) => g (f c.1) c.2))
    (modal_K _ _ (nec% (dia_mono a q)) (modal_four _ ((le_iff_prop _ _).1 (ha.2 q hq))))) hb) hd

/-- **The restricted Barcan formula (RB)**, at every type, from Actuality and the 5-necessity
collapse: `◇∃x. ◇a ∧ Rx → ∃x. ◇(◇a ∧ Rx)`. Through `◇(◇a ∧ ·) ≤ ◇_≠ ≤ ◇₅` at the actual
world, the dual Barcan formula for `□₅`, and `◇₅ ≤ ◇_≠ ≤ ◇(◇a ∧ ·)` (take `q := a`). -/
theorem restricted_barcan {τ : Type} [Ty τ] (a : Prop) (ha : ActualWorld a)
    (h5 : FiveImpliesNdNecessity) (R : τ → Prop) :
    ◇ (∃ x, ◇ a ∧ R x) → ∃ x, ◇ (◇ a ∧ R x) := fun hd =>
  have d₁ : ◇ (◇ a ∧ ∃ x, R x) := dia_mono _ _
    (nec% (fun (h : ∃ x, ◇ a ∧ R x) => h.elim fun x hx => (⟨hx.1, ⟨x, hx.2⟩⟩ : ◇ a ∧ ∃ x, R x))) hd
  (dia5_exists R fun hb => diaNe_of_dia_actual a ha _ d₁ (h5 _ hb)).elim fun x hx =>
    ⟨x, (em (◇ (◇ a ∧ R x))).elim id fun hn => (hx (boxHH_le_box5 _ (boxNe_le_boxHH _
      ⟨a, ha.1, modal_K _ _ (nec% (fun (g : ¬ (◇ a ∧ R x)) (d : ◇ a) (r : R x) => g ⟨d, r⟩))
        (box_not_of_not_dia _ hn)⟩))).elim⟩

/-- (RB) for a matrix that necessarily implies `◇a`: `◇∃x. Φx → ∃x. ◇Φx`. -/
theorem restricted_barcan_of {τ : Type} [Ty τ] (a : Prop) (ha : ActualWorld a)
    (h5 : FiveImpliesNdNecessity) (Φ : τ → Prop) (hΦ : □ (∀ x, Φ x → ◇ a)) :
    ◇ (∃ x, Φ x) → ∃ x, ◇ (Φ x) := fun hd =>
  (restricted_barcan a ha h5 Φ (dia_mono _ _ (modal_K _ _
    (nec% (fun (H : ∀ x, Φ x → ◇ a) (h : ∃ x, Φ x) =>
      h.elim fun x hx => (⟨x, H x hx, hx⟩ : ∃ x, ◇ a ∧ Φ x))) hΦ) hd)).elim fun x hx =>
    ⟨x, dia_mono _ _ (nec% (fun (h : ◇ a ∧ Φ x) => h.2)) hx⟩

/-- `actuality-and-five-implies-nd-necessity-imply-inextensible-comprehension`, at `σ → t`, its
list form being the map's record: the proof of `actuality_and_bf_imply_inextensible_comprehension`
with (RB) in place of BF, each possibility it extracts from implying `◇w`. -/
theorem actuality_and_five_implies_nd_necessity_imply_inextensible_comprehension
    {σ : Type} [Ty σ] :
    Actuality → FiveImpliesNdNecessity → InextensibleComprehension (σ → Prop) :=
  fun act h5 X => act.elim fun w (hw : ActualWorld w) =>
    ⟨λ z ↦ ◇ (w ∧ X z), (em (□ (WeaklyInextensible (λ z ↦ ◇ (w ∧ X z))))).elim id fun hn =>
      ((restricted_barcan_of w hw h5 _
          (nec% (fun (Y : σ → Prop)
              (h : (∀ z, ◇ (w ∧ X z) → □ (Y z)) ∧ ◇ (∃ z, ◇ (w ∧ X z) ∧ ¬ Y z)) =>
            dia_dia _ (dia_dia _ (dia_mono _ _ (nec% (dia_of_exists_dia_and w X Y)) h.2))))
          (dia_mono _ _
            (nec% (not_weaklyInextensible (λ z ↦ ◇ (w ∧ X z)))) (dia_not_of_not_box _ hn))).elim
        fun Y hY =>
          (restricted_barcan_of w hw h5 _
              (nec% (fun (z : σ) (h : ◇ (w ∧ X z) ∧ ¬ Y z) =>
                dia_mono _ _ (nec% (fun (h : w ∧ X z) => h.1)) h.1))
              (dia_dia _ (dia_mono _ _
              (nec% (fun (h : (∀ z, ◇ (w ∧ X z) → □ (Y z)) ∧ ◇ (∃ z, ◇ (w ∧ X z) ∧ ¬ Y z)) =>
                h.2)) hY))).elim fun z hz =>
            have hC : ◇ (w ∧ X z) := dia_dia _
              (dia_mono _ _ (nec% (fun (h : ◇ (w ∧ X z) ∧ ¬ Y z) => h.1)) hz)
            have hnY : ◇ (¬ Y z) := dia_mono _ _ (nec% (fun (h : ◇ (w ∧ X z) ∧ ¬ Y z) => h.2)) hz
            have f₂ : □ (◇ w → ◇ (w ∧ X z)) := modal_K _ _ (nec% (dia_mono w (w ∧ X z)))
              (modal_four _ (modal_K _ _ (nec% (fun (h : w → X z) (h' : w) => (⟨h', h h'⟩ : w ∧ X z)))
                ((le_iff_prop _ _).1 (hw.2 _ ((coext_dia_actual w hw X z).2 hC)))))
            have f₃ : □ (◇ w → ◇ (¬ Y z)) := modal_K _ _
              (nec% (fun (f : ◇ w → ◇ ◇ (¬ Y z)) (h : ◇ w) => dia_dia _ (f h)))
              (modal_K _ _ (nec% (dia_mono w (◇ (¬ Y z))))
                (modal_four _ ((le_iff_prop _ _).1 (hw.2 _ hnY))))
            hY ((box_not_eq _).mp (modal_K _ _ (modal_K _ _
              (nec% (inext_dia_contra w X Y z)) f₂) f₃))).elim,
      coext_dia_actual w hw X⟩

end Classicism.Proofs
