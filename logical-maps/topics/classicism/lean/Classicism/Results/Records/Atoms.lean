import Classicism.Results.Records.Lattice
import Classicism.Results.Records.Necessity
import Classicism.Results.Records.Choice

/-!
# Proofs of map records: self-atoms, strong atoms, Self-Atomicity and Strong Actuality

Records among Self-Atomicity, the bridge principles (Atoms are self-atoms, Self-atoms are
atoms, Self-atoms are strong atoms, Atoms are strong atoms), Strong Atomicity, Atomicity and
Strong Actuality (Cian Dorr's self-atoms, 25 October 2026). The records over relational types
are proved at a type parameter `τ`, from the laws of the order there, and so hold at every
arity; those whose proof uses BF over the argument types are at `σ → t`, their list forms
being the map's records (`Results/AtomsArity.lean`). The boxed twins are the unboxed records
necessitated, and `K`. The conventions are in `Results/Records.lean`.
-/

namespace Classicism.Proofs
open Classicism.P Classicism.Paper

/-! ### The order lemmas at a type parameter -/

section lemmas
variable {τ : Type} [Rel τ] [Order τ] [Pointwise τ]

/-- An atom is not bottom. -/
theorem atom_ne_bot_rel (X : τ) (hX : Atom X) : X ≠ ⊥ := fun e =>
  not_le_neg_of_atom hX (by rw [e]; exact bot_le_rel _)

/-- A non-bottom part of an atom is the atom. -/
theorem eq_of_le_atom_rel (X Q : τ) (hX : Atom X) (hQ : Q ≠ ⊥) (h : Q ≤ X) : Q = X :=
  (em (Q = X)).elim id fun hne => absurd (eq_bot_of_le_neg_rel Q ((hX Q).1 ⟨h, hne⟩)) hQ

/-- What is not bottom and lies below each entity or its negation is an atom. -/
theorem atom_of_decides_rel (W : τ) (hne : W ≠ ⊥) (h : ∀ Y : τ, W ≤ Y ∨ W ≤ ¬ Y) :
    Atom W := fun z =>
  ⟨fun hz => (h z).elim (fun hWz => absurd (le_antisymm_rel z W hz.1 hWz) hz.2)
      (fun hWn => le_trans_rel _ _ _ hz.1 hWn),
   fun hz =>
    have e : z = ⊥ := eq_bot_of_le_neg_rel z hz
    ⟨by rw [e]; exact bot_le_rel W, fun ezW => hne (ezW.symm.trans e)⟩⟩

/-- A strong atom is an atom: `T` on its boxed clause. -/
theorem atom_of_satom_rel (W : τ) (h : SAtom W) : Atom W :=
  atom_of_decides_rel W h.1 (box_elim h.2)

omit [Order τ] in
/-- Bottom is not instantiated. -/
theorem ne_bot_of_instantiated (W : τ) (hi : Instantiated W) : W ≠ ⊥ := fun e =>
  hi (by rw [e]; exact incl_refl _)

/-- What decides every entity and is instantiated is an atom. -/
theorem atom_of_decides_instantiated (W : τ) :
    (∀ Y : τ, W ≤ Y ∨ W ≤ ¬ Y) → Instantiated W → Atom W := fun h hi =>
  atom_of_decides_rel W (ne_bot_of_instantiated W hi) h

/-- A strong atom is a self-atom: under the box, an instantiated entity that decides every
entity is an atom. -/
theorem selfAtom_of_satom_rel (W : τ) (h : SAtom W) : SelfAtom W :=
  ⟨h.1, modal_K _ _ (nec% (atom_of_decides_instantiated W)) h.2⟩

end lemmas

/-! ### The unboxed records over relational types -/

section records
variable {τ : Type} [Rel τ] [Order τ] [Pointwise τ]

/-- `atomicity-r-and-atoms-are-self-atoms-r-imply-self-atomicity-r`: the atom below a
possible entity is a self-atom. -/
theorem atomicity_r_and_atoms_are_self_atoms_r_imply_self_atomicity_r :
    Atomicity τ → AtomsAreSelfAtoms τ → SelfAtomicity τ := fun at_ h X hX =>
  (at_ X).elim (fun hle => absurd (eq_bot_of_le_neg_rel X hle) hX)
    fun hy => hy.elim fun y hy => ⟨y, h y hy.1, hy.2⟩

/-- `atomicity-r-and-atoms-are-strong-atoms-r-imply-strong-atomicity-r`. -/
theorem atomicity_r_and_atoms_are_strong_atoms_r_imply_strong_atomicity_r :
    Atomicity τ → AtomsAreStrongAtoms τ → StrongAtomicity τ := fun at_ h X hX =>
  (at_ X).elim (fun hle => absurd (eq_bot_of_le_neg_rel X hle) hX)
    fun hy => hy.elim fun y hy => ⟨y, h y hy.1, hy.2⟩

omit [Order τ] [Pointwise τ] in
/-- `atoms-are-self-atoms-r-and-self-atoms-are-strong-atoms-r-imply-atoms-are-strong-atoms-r`. -/
theorem atoms_are_self_atoms_r_and_self_atoms_are_strong_atoms_r_imply_atoms_are_strong_atoms_r :
    AtomsAreSelfAtoms τ → SelfAtomsAreStrongAtoms τ → AtomsAreStrongAtoms τ :=
  fun h₁ h₂ X hX => h₂ X (h₁ X hX)

omit [Order τ] [Pointwise τ] in
/-- `atoms-are-strong-atoms-r-and-self-atoms-are-atoms-r-imply-self-atoms-are-strong-atoms-r`. -/
theorem atoms_are_strong_atoms_r_and_self_atoms_are_atoms_r_imply_self_atoms_are_strong_atoms_r :
    AtomsAreStrongAtoms τ → SelfAtomsAreAtoms τ → SelfAtomsAreStrongAtoms τ :=
  fun h₁ h₂ X hX => h₁ X (h₂ X hX)

/-- `atoms-are-strong-atoms-r-implies-atoms-are-self-atoms-r`: a strong atom is a self-atom. -/
theorem atoms_are_strong_atoms_r_implies_atoms_are_self_atoms_r :
    AtomsAreStrongAtoms τ → AtomsAreSelfAtoms τ := fun h X hX =>
  selfAtom_of_satom_rel X (h X hX)

/-- `strong-atomicity-r-implies-atoms-are-strong-atoms-r`: the strong atom below an atom is
the atom. -/
theorem strong_atomicity_r_implies_atoms_are_strong_atoms_r :
    StrongAtomicity τ → AtomsAreStrongAtoms τ := fun sa X hX =>
  (sa X (atom_ne_bot_rel X hX)).elim fun W hW =>
    (eq_of_le_atom_rel X W hX hW.1.1 hW.2) ▸ hW.1

/-- `strong-atomicity-r-implies-self-atomicity-r`: the strong atom below a possible entity is
a self-atom. -/
theorem strong_atomicity_r_implies_self_atomicity_r :
    StrongAtomicity τ → SelfAtomicity τ := fun sa X hX =>
  (sa X hX).elim fun W hW => ⟨W, selfAtom_of_satom_rel W hW.1, hW.2⟩

/-- `self-atomicity-r-implies-atoms-are-self-atoms-r`: the self-atom below an atom is the
atom. -/
theorem self_atomicity_r_implies_atoms_are_self_atoms_r :
    SelfAtomicity τ → AtomsAreSelfAtoms τ := fun sa X hX =>
  (sa X (atom_ne_bot_rel X hX)).elim fun Q hQ =>
    (eq_of_le_atom_rel X Q hX hQ.1.1 hQ.2) ▸ hQ.1

/-- `self-atomicity-r-and-self-atoms-are-atoms-r-imply-atomicity-r`. -/
theorem self_atomicity_r_and_self_atoms_are_atoms_r_imply_atomicity_r :
    SelfAtomicity τ → SelfAtomsAreAtoms τ → Atomicity τ := fun sa h X =>
  (em (X ≤ ¬ X)).elim Or.inl fun hX => Or.inr
    ((sa X fun e => hX (by rw [e]; exact bot_le_rel _)).elim fun Q hQ => ⟨Q, h Q hQ.1, hQ.2⟩)

omit [Order τ] [Pointwise τ] in
/-- `self-atomicity-r-and-self-atoms-are-strong-atoms-r-imply-strong-atomicity-r`. -/
theorem self_atomicity_r_and_self_atoms_are_strong_atoms_r_imply_strong_atomicity_r :
    SelfAtomicity τ → SelfAtomsAreStrongAtoms τ → StrongAtomicity τ := fun sa h X hX =>
  (sa X hX).elim fun Q hQ => ⟨Q, h Q hQ.1, hQ.2⟩

/-- `self-atoms-are-strong-atoms-r-implies-self-atoms-are-atoms-r`: a strong atom is an atom. -/
theorem self_atoms_are_strong_atoms_r_implies_self_atoms_are_atoms_r :
    SelfAtomsAreStrongAtoms τ → SelfAtomsAreAtoms τ := fun h X hX =>
  atom_of_satom_rel X (h X hX)

end records

/-! ### Instantiation, possibility and atoms at a type parameter -/

section inst
variable {τ : Type} [Rel τ] [Order τ] [Pointwise τ]


/-- What is necessarily uninstantiated is bottom. -/
theorem eq_bot_of_box_not_instantiated (X : τ) (h : □ (¬ Instantiated X)) : X = ⊥ :=
  le_antisymm_rel X ⊥ ((le_iff _ _).2 (modal_K _ _ (nec% (incl_bot_of_not_instantiated X)) h))
    (bot_le_rel X)

/-- A non-bottom entity is possibly instantiated. -/
theorem dia_instantiated_of_ne_bot (X : τ) (h : X ≠ ⊥) : ◇ (Instantiated X) := fun e =>
  h (eq_bot_of_box_not_instantiated X ((box_not_eq _).mpr e))

/-- `X ⊆ ⊥` excludes instantiation. -/
theorem not_instantiated_of_incl_bot (X : τ) : X ⊆ ⊥ → ¬ Instantiated X := fun h hi => hi h

/-- A possibly instantiated entity is not bottom. -/
theorem ne_bot_of_dia_instantiated (X : τ) (h : ◇ (Instantiated X)) : X ≠ ⊥ := fun e =>
  h ((box_not_eq _).mp (modal_K _ _ (nec% (not_instantiated_of_incl_bot X))
    ((le_iff _ _).1 (by rw [e]; exact le_refl_rel _))))

/-- An entity's atomhood, where it is instantiated, rules out an instantiable strict part
below it that it is not included in. -/
theorem incl_of_atom_instantiated (X z : τ) :
    (Instantiated X → Atom X) → z ≤ X → ◇ (Instantiated z) → X ⊆ z := fun hA hzX hd =>
  (em (X ⊆ z)).elim id fun hn =>
    have hi : Instantiated X := fun hb => hn (incl_trans X ⊥ z hb (incl_of_constP z False id))
    have hne : z ≠ X := fun e => hn (by rw [e]; exact incl_refl X)
    (ne_bot_of_dia_instantiated z hd (eq_bot_of_le_neg_rel z ((hA hi z).1 ⟨hzX, hne⟩))).elim

/-- An atom decides every entity. -/
theorem decides_of_atom (X : τ) : Atom X → ∀ Y : τ, X ≤ Y ∨ X ≤ ¬ Y := fun h Y =>
  atom_le_or_le_neg_rel X Y h

/-- `W ≤ Y ∨ W ≤ ¬Y` is necessary once true: each disjunct is an identity. -/
theorem box_le_or_le_rel (W Y : τ) (h : W ≤ Y ∨ W ≤ ¬ Y) : □ (W ≤ Y ∨ W ≤ ¬ Y) :=
  h.elim
    (fun h => modal_K _ _ (nec% (fun (h' : W ≤ Y) => (Or.inl h' : W ≤ Y ∨ W ≤ ¬ Y)))
      (necessity_of_identity _ _ h))
    (fun h => modal_K _ _ (nec% (fun (h' : W ≤ ¬ Y) => (Or.inr h' : W ≤ Y ∨ W ≤ ¬ Y)))
      (necessity_of_identity _ _ h))

end inst

/-! ### At `t` -/


/-- A true proposition entailing every truth is an atom. -/
theorem atom_of_actualWorld (w : Prop) (hw : ActualWorld w) : Atom w :=
  atom_of_decides w ⟨fun e => (show w = False from e) ▸ hw.1, fun z =>
    (em z).elim (fun hz => Or.inl (hw.2 z hz)) (fun hz => Or.inr (hw.2 (¬ z) hz))⟩

/-- Where an actual world is instantiated, it is an atom. -/
theorem atom_of_instantiated_actualWorld (w : Prop) :
    (w → ∀ q : Prop, q → w ≤ q) → Instantiated w → Atom w := fun f hi =>
  have hw := of_instantiated_prop w hi
  atom_of_actualWorld w ⟨hw, f hw⟩

/-- An actual world is a self-atom: it entails that it entails every truth. -/
theorem selfAtom_of_actualWorld (w : Prop) (hw : ActualWorld w) : SelfAtom w :=
  ⟨fun e => (show w = False from e) ▸ hw.1, modal_K _ _ (nec% (atom_of_instantiated_actualWorld w))
    ((le_iff_prop _ _).1 (hw.2 _ hw.2))⟩

/-- A true self-atom is an atom, and so an actual world. -/
theorem actualWorld_of_selfAtom (v : Prop) (hs : SelfAtom v) (hv : v) : ActualWorld v :=
  have ha : Atom v := box_elim hs.2 (fun hn => False.elim (hn hv))
  ⟨hv, fun q hq => (atom_le_or_le_neg v q ha).elim id
    fun hn => (imp_of_le_prop v (¬ q) hn hv hq).elim⟩

/-! ### The unboxed records at `t` -/

/-- `atomicity-t-and-atoms-are-self-atoms-t-imply-self-atomicity-t`. -/
theorem atomicity_t_and_atoms_are_self_atoms_t_imply_self_atomicity_t :
    AtomicityT → AtomsAreSelfAtomsT → SelfAtomicityT :=
  atomicity_r_and_atoms_are_self_atoms_r_imply_self_atomicity_r

/-- `atomicity-t-and-atoms-are-strong-atoms-t-imply-strong-atomicity-t`. -/
theorem atomicity_t_and_atoms_are_strong_atoms_t_imply_strong_atomicity_t :
    AtomicityT → AtomsAreStrongAtomsT → StrongAtomicityT :=
  atomicity_r_and_atoms_are_strong_atoms_r_imply_strong_atomicity_r

/-- `atoms-are-self-atoms-t-and-self-atoms-are-strong-atoms-t-imply-atoms-are-strong-atoms-t`. -/
theorem atoms_are_self_atoms_t_and_self_atoms_are_strong_atoms_t_imply_atoms_are_strong_atoms_t :
    AtomsAreSelfAtomsT → SelfAtomsAreStrongAtomsT → AtomsAreStrongAtomsT :=
  fun h₁ h₂ X hX => h₂ X (h₁ X hX)

/-- `atoms-are-strong-atoms-t-and-self-atoms-are-atoms-t-imply-self-atoms-are-strong-atoms-t`. -/
theorem atoms_are_strong_atoms_t_and_self_atoms_are_atoms_t_imply_self_atoms_are_strong_atoms_t :
    AtomsAreStrongAtomsT → SelfAtomsAreAtomsT → SelfAtomsAreStrongAtomsT :=
  fun h₁ h₂ X hX => h₁ X (h₂ X hX)

/-- `atoms-are-strong-atoms-t-implies-atoms-are-self-atoms-t`. -/
theorem atoms_are_strong_atoms_t_implies_atoms_are_self_atoms_t :
    AtomsAreStrongAtomsT → AtomsAreSelfAtomsT :=
  atoms_are_strong_atoms_r_implies_atoms_are_self_atoms_r

/-- `self-atomicity-t-and-self-atoms-are-atoms-t-imply-atomicity-t`. -/
theorem self_atomicity_t_and_self_atoms_are_atoms_t_imply_atomicity_t :
    SelfAtomicityT → SelfAtomsAreAtomsT → AtomicityT :=
  self_atomicity_r_and_self_atoms_are_atoms_r_imply_atomicity_r

/-- `self-atomicity-t-and-self-atoms-are-strong-atoms-t-imply-strong-atomicity-t`. -/
theorem self_atomicity_t_and_self_atoms_are_strong_atoms_t_imply_strong_atomicity_t :
    SelfAtomicityT → SelfAtomsAreStrongAtomsT → StrongAtomicityT :=
  fun sa h X hX => (sa X hX).elim fun Q hQ => ⟨Q, h Q hQ.1, hQ.2⟩

/-- `self-atomicity-t-implies-atoms-are-self-atoms-t`. -/
theorem self_atomicity_t_implies_atoms_are_self_atoms_t : SelfAtomicityT → AtomsAreSelfAtomsT :=
  self_atomicity_r_implies_atoms_are_self_atoms_r

/-- `self-atoms-are-strong-atoms-t-implies-self-atoms-are-atoms-t`. -/
theorem self_atoms_are_strong_atoms_t_implies_self_atoms_are_atoms_t :
    SelfAtomsAreStrongAtomsT → SelfAtomsAreAtomsT :=
  self_atoms_are_strong_atoms_r_implies_self_atoms_are_atoms_r

/-- `strong-atomicity-t-implies-atoms-are-strong-atoms-t`. -/
theorem strong_atomicity_t_implies_atoms_are_strong_atoms_t :
    StrongAtomicityT → AtomsAreStrongAtomsT :=
  strong_atomicity_r_implies_atoms_are_strong_atoms_r

/-- `strong-atomicity-t-implies-self-atomicity-t`. -/
theorem strong_atomicity_t_implies_self_atomicity_t : StrongAtomicityT → SelfAtomicityT :=
  strong_atomicity_r_implies_self_atomicity_r

/-! ### The instances at `t` -/

/-- `self-atomicity-r-implies-self-atomicity-t`. -/
theorem self_atomicity_r_implies_self_atomicity_t : SelfAtomicity Prop → SelfAtomicityT :=
  fun h => h
/-- `atoms-are-self-atoms-r-implies-atoms-are-self-atoms-t`. -/
theorem atoms_are_self_atoms_r_implies_atoms_are_self_atoms_t :
    AtomsAreSelfAtoms Prop → AtomsAreSelfAtomsT := fun h => h
/-- `atoms-are-strong-atoms-r-implies-atoms-are-strong-atoms-t`. -/
theorem atoms_are_strong_atoms_r_implies_atoms_are_strong_atoms_t :
    AtomsAreStrongAtoms Prop → AtomsAreStrongAtomsT := fun h => h
/-- `self-atoms-are-atoms-r-implies-self-atoms-are-atoms-t`. -/
theorem self_atoms_are_atoms_r_implies_self_atoms_are_atoms_t :
    SelfAtomsAreAtoms Prop → SelfAtomsAreAtomsT := fun h => h
/-- `self-atoms-are-strong-atoms-r-implies-self-atoms-are-strong-atoms-t`. -/
theorem self_atoms_are_strong_atoms_r_implies_self_atoms_are_strong_atoms_t :
    SelfAtomsAreStrongAtoms Prop → SelfAtomsAreStrongAtomsT := fun h => h

/-! ### `T` -/

/-- `necessary-self-atomicity-r-implies-self-atomicity-r`. -/
theorem necessary_self_atomicity_r_implies_self_atomicity_r {τ : Type} [Rel τ] :
    NecSelfAtomicity τ → SelfAtomicity τ := box_elim
/-- `necessary-atoms-are-self-atoms-r-implies-atoms-are-self-atoms-r`. -/
theorem necessary_atoms_are_self_atoms_r_implies_atoms_are_self_atoms_r {τ : Type} [Rel τ] :
    NecAtomsAreSelfAtoms τ → AtomsAreSelfAtoms τ := box_elim
/-- `necessary-atoms-are-strong-atoms-r-implies-atoms-are-strong-atoms-r`. -/
theorem necessary_atoms_are_strong_atoms_r_implies_atoms_are_strong_atoms_r {τ : Type} [Rel τ] :
    NecAtomsAreStrongAtoms τ → AtomsAreStrongAtoms τ := box_elim
/-- `necessary-self-atoms-are-atoms-r-implies-self-atoms-are-atoms-r`. -/
theorem necessary_self_atoms_are_atoms_r_implies_self_atoms_are_atoms_r {τ : Type} [Rel τ] :
    NecSelfAtomsAreAtoms τ → SelfAtomsAreAtoms τ := box_elim
/-- `necessary-self-atoms-are-strong-atoms-r-implies-self-atoms-are-strong-atoms-r`. -/
theorem necessary_self_atoms_are_strong_atoms_r_implies_self_atoms_are_strong_atoms_r
    {τ : Type} [Rel τ] : NecSelfAtomsAreStrongAtoms τ → SelfAtomsAreStrongAtoms τ := box_elim
/-- `necessary-self-atomicity-t-implies-self-atomicity-t`. -/
theorem necessary_self_atomicity_t_implies_self_atomicity_t : NecSelfAtomicityT → SelfAtomicityT :=
  box_elim
/-- `necessary-atoms-are-self-atoms-t-implies-atoms-are-self-atoms-t`. -/
theorem necessary_atoms_are_self_atoms_t_implies_atoms_are_self_atoms_t :
    NecAtomsAreSelfAtomsT → AtomsAreSelfAtomsT := box_elim
/-- `necessary-atoms-are-strong-atoms-t-implies-atoms-are-strong-atoms-t`. -/
theorem necessary_atoms_are_strong_atoms_t_implies_atoms_are_strong_atoms_t :
    NecAtomsAreStrongAtomsT → AtomsAreStrongAtomsT := box_elim
/-- `necessary-self-atoms-are-atoms-t-implies-self-atoms-are-atoms-t`. -/
theorem necessary_self_atoms_are_atoms_t_implies_self_atoms_are_atoms_t :
    NecSelfAtomsAreAtomsT → SelfAtomsAreAtomsT := box_elim
/-- `necessary-self-atoms-are-strong-atoms-t-implies-self-atoms-are-strong-atoms-t`. -/
theorem necessary_self_atoms_are_strong_atoms_t_implies_self_atoms_are_strong_atoms_t :
    NecSelfAtomsAreStrongAtomsT → SelfAtomsAreStrongAtomsT := box_elim

/-! ### Strong Actuality, Actuality and BF -/

/-- `actuality-and-self-atoms-are-strong-atoms-t-imply-strong-actuality`: the actual world is a
self-atom, so a strong atom. -/
theorem actuality_and_self_atoms_are_strong_atoms_t_imply_strong_actuality :
    Actuality → SelfAtomsAreStrongAtomsT → StrongActuality := fun act h =>
  act.elim fun w hw => ⟨w, hw.1, (h w (selfAtom_of_actualWorld w hw)).2⟩

/-- `atoms-are-strong-atoms-t-and-actuality-imply-strong-actuality`: the actual world is an
atom, so a strong atom. -/
theorem atoms_are_strong_atoms_t_and_actuality_imply_strong_actuality :
    AtomsAreStrongAtomsT → Actuality → StrongActuality := fun h act =>
  act.elim fun w hw => ⟨w, hw.1, (h w (atom_of_actualWorld w hw)).2⟩

/-- A true proposition whose decisions are necessary witnesses Strong Actuality. -/
theorem strongActuality_of_decides (w : Prop) :
    □ (∀ q : Prop, w ≤ q ∨ w ≤ ¬ q) → w → StrongActuality := fun hD hw => ⟨w, hw, hD⟩

/-- `strong-atomicity-t-implies-necessary-strong-actuality`: each strong atom entails Strong
Actuality (by `4` on its decisions); were Strong Actuality possibly false, a strong atom
would entail its negation too, and be `⊥`. -/
theorem strong_atomicity_t_implies_necessary_strong_actuality :
    StrongAtomicityT → NecStrongActuality := fun sl =>
  (em (□ StrongActuality)).elim id fun hn =>
    (sl (¬ StrongActuality) (dia_not_of_not_box _ hn)).elim fun w hw =>
      (hw.1.1 ((box_not_eq w).mp (modal_K _ _ (modal_K _ _
        (nec% (not_of_imp_both w StrongActuality))
        (modal_K _ _ (nec% (strongActuality_of_decides w)) (modal_four _ hw.1.2)))
        ((le_iff_prop _ _).1 hw.2)))).elim

/-- A self-atom, where it is true, makes some self-atom true. -/
theorem exists_true_selfAtom_of (q : Prop) :
    □ (Instantiated q → Atom q) → q → ∃ v : Prop, SelfAtom v ∧ v := fun hb hq =>
  ⟨q, ⟨fun e => (show q = False from e) ▸ hq, hb⟩, hq⟩

/-- Under Self-Atomicity at `t`, necessarily some self-atom is true. -/
theorem box_exists_true_selfAtom (sa : SelfAtomicityT) : □ (∃ v : Prop, SelfAtom v ∧ v) :=
  (em (□ (∃ v : Prop, SelfAtom v ∧ v))).elim id fun hn =>
    (sa _ (dia_not_of_not_box _ hn)).elim fun w hw =>
      (hw.1.1 ((box_not_eq w).mp (modal_K _ _ (modal_K _ _
        (nec% (not_of_imp_both w (∃ v : Prop, SelfAtom v ∧ v)))
        (modal_K _ _ (nec% (exists_true_selfAtom_of w)) (modal_four _ hw.1.2)))
        ((le_iff_prop _ _).1 hw.2)))).elim

/-- A true self-atom is an actual world. -/
theorem actuality_of_exists_true_selfAtom : (∃ v : Prop, SelfAtom v ∧ v) → Actuality := fun h =>
  h.elim fun v hv => ⟨v, actualWorld_of_selfAtom v hv.1 hv.2⟩

/-- `self-atomicity-t-implies-necessary-actuality`. -/
theorem self_atomicity_t_implies_necessary_actuality : SelfAtomicityT → NecActuality := fun sa =>
  modal_K _ _ (nec% actuality_of_exists_true_selfAtom) (box_exists_true_selfAtom sa)

/-- `p ∧ Actuality` gives an actual world with `p`. -/
theorem exists_and_actualWorld (p : Prop) : p ∧ Actuality → ∃ w : Prop, p ∧ ActualWorld w :=
  fun h => h.2.elim fun w hw => ⟨w, h.1, hw⟩

/-- `p ∧ ActualWorld(w)` entails `w`. -/
theorem and_actualWorld_le (p w : Prop) : (p ∧ ActualWorld w) ≤ w :=
  (le_iff_prop _ _).2 (nec% (fun (h : p ∧ ActualWorld w) => h.2.1))

/-- Where `p ∧ ActualWorld(w)` is instantiated, it is `w`, and an atom. -/
theorem atom_of_instantiated_and_actualWorld (p w : Prop) :
    Instantiated (p ∧ ActualWorld w) → Atom (p ∧ ActualWorld w) := fun hi =>
  have hs := of_instantiated_prop _ hi
  have e : (p ∧ ActualWorld w) = w :=
    le_antisymm_prop _ _ (and_actualWorld_le p w) (hs.2.2 _ hs)
  by rw [e]; exact atom_of_actualWorld w hs.2

/-- `barcan-t-and-necessary-actuality-imply-self-atomicity-t` (Cian Dorr, 28 October 2026):
for a possible `p`, BF at `t` gives `w` with `◇(p ∧ ActualWorld(w))`, and `p ∧ ActualWorld(w)`
is a self-atom below `p`. -/
theorem barcan_t_and_necessary_actuality_imply_self_atomicity_t :
    BarcanT → NecActuality → SelfAtomicityT := fun bf nact p hp =>
  (dia_exists_of_bf bf (λ w ↦ p ∧ ActualWorld w)
      (dia_mono _ _ (nec% (exists_and_actualWorld p)) (dia_and_of_dia_box p Actuality hp nact))).elim
    fun w hw => ⟨p ∧ ActualWorld w, ⟨hw, nec% (atom_of_instantiated_and_actualWorld p w)⟩,
      and_le_left_prop p _⟩

/-- `necessary-barcan-t-and-necessary-actuality-imply-necessary-self-atomicity-t`: the last
record necessitated, `□Actuality` boxed again by `4`. -/
theorem necessary_barcan_t_and_necessary_actuality_imply_necessary_self_atomicity_t :
    NecBarcanT → NecActuality → NecSelfAtomicityT := fun h₁ h₂ =>
  modal_K _ _ (modal_K _ _ (nec% barcan_t_and_necessary_actuality_imply_self_atomicity_t) h₁)
    (modal_four _ h₂)

/-- `barcan-t-implies-atoms-are-strong-atoms-t`: an atom's decisions are necessary, and BF at
`t` boxes the quantifier (Bacon, Exercise 8.12, without Atomicity). -/
theorem barcan_t_implies_atoms_are_strong_atoms_t : BarcanT → AtomsAreStrongAtomsT := fun bf w hw =>
  ⟨atom_ne_false w hw,
    bf (λ q ↦ w ≤ q ∨ w ≤ ¬ q) fun q => box_le_or_le w q (atom_le_or_le_neg w q hw)⟩

/-- `barcan-relational-implies-atoms-are-strong-atoms-r`: the same at a relational type. -/
theorem barcan_relational_implies_atoms_are_strong_atoms_r {τ : Type} [Rel τ] [Order τ]
    [Pointwise τ] : BarcanRelational τ → AtomsAreStrongAtoms τ := fun bf W hW =>
  ⟨atom_ne_bot_rel W hW,
    bf (λ Y ↦ W ≤ Y ∨ W ≤ ¬ Y) fun Y => box_le_or_le_rel W Y (atom_le_or_le_neg_rel W Y hW)⟩

/-! ### Under 5 -/

/-- Under 5 a self-atom at `t` is necessarily one. -/
theorem box_selfAtom_of_five_t (five : ModalFive) (w : Prop) (h : SelfAtom w) : □ (SelfAtom w) :=
  (box_and_eq (◇ w) (□ (Instantiated w → Atom w))).mpr ⟨five w h.1, modal_four _ h.2⟩

/-- A necessarily self-atom, where it holds, makes some necessarily self-atom true. -/
theorem not_of_box_selfAtom (w : Prop) :
    □ (SelfAtom w) → (w → ¬ ∃ v : Prop, □ (SelfAtom v) ∧ v) → ¬ w :=
  fun hs hi hw => hi hw ⟨w, hs, hw⟩

/-- A self-atom at `t` is possible. -/
theorem dia_of_selfAtom (w : Prop) : SelfAtom w → ◇ w := fun h => h.1

/-- A true, necessarily self-atom entails each truth and is necessarily possible: B. -/
theorem modal_b_of_true_box_selfAtom : (∃ v : Prop, □ (SelfAtom v) ∧ v) → ModalB := fun h p hp =>
  h.elim fun v hv =>
    ((actualWorld_of_selfAtom v (box_elim hv.1) hv.2).2 p hp) |> fun hle =>
      modal_K _ _ (modal_K _ _ (nec% (dia_mono v p)) (modal_four _ ((le_iff_prop _ _).1 hle)))
        (modal_K _ _ (nec% (dia_of_selfAtom v)) hv.1)

/-- Under 5 and Self-Atomicity at `t`, necessarily some necessarily self-atom is true. -/
theorem box_true_box_selfAtom (five : ModalFive) (sa : SelfAtomicityT) :
    □ (∃ v : Prop, □ (SelfAtom v) ∧ v) :=
  (em (□ (∃ v : Prop, □ (SelfAtom v) ∧ v))).elim id fun hn =>
    (sa _ (dia_not_of_not_box _ hn)).elim fun w hw =>
      (hw.1.1 ((box_not_eq w).mp (modal_K _ _ (modal_K _ _ (nec% (not_of_box_selfAtom w))
        (modal_four _ (box_selfAtom_of_five_t five w hw.1)))
        ((le_iff_prop _ _).1 hw.2)))).elim

/-- `five-and-self-atomicity-t-imply-necessary-b`. -/
theorem five_and_self_atomicity_t_imply_necessary_b : ModalFive → SelfAtomicityT → NecModalB :=
  fun five sa => modal_K _ _ (nec% modal_b_of_true_box_selfAtom) (box_true_box_selfAtom five sa)

section five
variable {τ : Type} [Rel τ] [Order τ] [Pointwise τ]

/-- `modal-five-implies-self-atoms-are-atoms-r`: a non-bottom strict part `z` of a self-atom
`X` would be possibly instantiated, necessarily so by 5; where `X` is instantiated but `z` is
not all of it, `X` is an atom with a non-bottom strict part. So `X ⊆ z` necessarily, and
`z = X`. -/
theorem modal_five_implies_self_atoms_are_atoms_r : ModalFive → SelfAtomsAreAtoms τ :=
  fun five X hX z =>
  ⟨fun hz => (em (z ≤ ¬ z)).elim id fun hzn =>
      have hzb : z ≠ ⊥ := fun e => hzn (by rw [e]; exact bot_le_rel _)
      have hXz : X ≤ z := (le_iff _ _).2 (modal_K _ _ (modal_K _ _ (modal_K _ _
        (nec% (incl_of_atom_instantiated X z)) hX.2) (necessity_of_identity _ _ hz.1))
        (five _ (dia_instantiated_of_ne_bot z hzb)))
      (hz.2 (le_antisymm_rel z X hz.1 hXz)).elim,
   fun hz =>
    have e : z = ⊥ := eq_bot_of_le_neg_rel z hz
    ⟨by rw [e]; exact bot_le_rel X, fun ezX => hX.1 (ezX.symm.trans e)⟩⟩


/-- Under 5 a self-atom is necessarily one: 5 boxes its possible instantiation, 4 its boxed
clause. -/
theorem box_selfAtom_of_five (five : ModalFive) (X : τ) (h : SelfAtom X) : □ (SelfAtom X) :=
  (box_and_eq (X ≠ ⊥) (□ (Instantiated X → Atom X))).mpr
    ⟨modal_K _ _ (nec% (ne_bot_of_dia_instantiated X))
      (five _ (dia_instantiated_of_ne_bot X h.1)), modal_four _ h.2⟩

/-- Under `□5` every self-atom is a strong atom: necessarily a self-atom, so necessarily an
atom, by 5 there, so necessarily deciding every entity. -/
theorem self_atoms_are_strong_atoms_of_box_five : □ ModalFive → SelfAtomsAreStrongAtoms τ :=
  fun h5 X hX =>
  ⟨hX.1, modal_K _ _ (nec% (decides_of_atom X)) (modal_K _ _ (modal_K _ _
    (nec% (fun (f : ModalFive) (s : SelfAtom X) => modal_five_implies_self_atoms_are_atoms_r f X s))
    h5) (box_selfAtom_of_five (box_elim h5) X hX))⟩

/-- `necessary-modal-five-implies-necessary-self-atoms-are-strong-atoms-r`. -/
theorem necessary_modal_five_implies_necessary_self_atoms_are_strong_atoms_r :
    NecModalFive → NecSelfAtomsAreStrongAtoms τ := fun h =>
  modal_K _ _ (nec% (self_atoms_are_strong_atoms_of_box_five (τ := τ))) (modal_four _ h)

end five

/-! ### Atomlessness -/

/-- Under Atomlessness there is no atom at `t`. -/
theorem not_atom_of_atomlessness (atl : Atomlessness) (q : Prop) (hq : Atom q) : False :=
  (atl q (atom_ne_false q hq)).elim fun r hr =>
    hr.1 (eq_false_of_le_neg r ((hq r).1 ⟨hr.2.1, hr.2.2⟩))

section atomless
variable {τ : Type} [Rel τ] [Order τ] [Pointwise τ]

/-- If `X ∧ q̂ = X`, the instantiation of `X` entails `q`. -/
theorem of_instantiated_of_and_eq (X : τ) (q : Prop) :
    (X ∧ constP q) = X → Instantiated X → q := fun e hi =>
  (em q).elim id fun hn => (hi (by rw [← e]; exact incl_of_and_constP X ⊥ q hn)).elim

/-- If `X ∧ q̂ = ⊥`, the instantiation of `X` entails `¬q`. -/
theorem not_of_instantiated_of_and_eq_bot (X : τ) (q : Prop) :
    (X ∧ constP q) = ⊥ → Instantiated X → ¬ q := fun e hi hq =>
  hi (incl_trans X (X ∧ constP q) ⊥ (incl_and_constP_self X q hq) (by rw [e]; exact incl_refl _))


/-- Under Atomlessness there is no atom at any relational type. -/
theorem not_atom_rel_of_atomlessness (atl : Atomlessness) (X : τ) (hX : Atom X) : False :=
  not_atom_of_atomlessness atl _ (atom_instantiated_of_atom X hX)

/-- `atomlessness-implies-atoms-are-strong-atoms-r`: vacuously. -/
theorem atomlessness_implies_atoms_are_strong_atoms_r : Atomlessness → AtomsAreStrongAtoms τ :=
  fun atl X hX => (not_atom_rel_of_atomlessness atl X hX).elim


/-- Under `□`Atomlessness there is no self-atom: it would be necessarily uninstantiated. -/
theorem self_atoms_are_strong_atoms_of_box_atomlessness :
    □ Atomlessness → SelfAtomsAreStrongAtoms τ := fun h X hX =>
  (hX.1 (eq_bot_of_box_not_instantiated X (modal_K _ _ (modal_K _ _
    (nec% (fun (atl : Atomlessness) (f : Instantiated X → Atom X) (hi : Instantiated X) =>
      not_atom_rel_of_atomlessness atl X (f hi))) h) hX.2))).elim

/-- `necessary-atomlessness-implies-necessary-self-atoms-are-strong-atoms-r`: by `4`. -/
theorem necessary_atomlessness_implies_necessary_self_atoms_are_strong_atoms_r :
    NecAtomlessness → NecSelfAtomsAreStrongAtoms τ := fun h =>
  modal_K _ _ (nec% (self_atoms_are_strong_atoms_of_box_atomlessness (τ := τ))) (modal_four _ h)

end atomless

/-! ### Self-Atomicity at `t` and the varieties of necessity -/

/-- A true proposition is instantiated. -/
theorem instantiated_of_prop (p : Prop) (hp : p) : Instantiated p := fun hn => False.elim (hn hp)

/-- The dual of Self-Atomicity at `t`: what every self-atom entails is necessary. -/
theorem box_of_selfAtoms_le (sa : SelfAtomicityT) (X : Prop) (h : ∀ v : Prop, SelfAtom v → v ≤ X) :
    □ X :=
  (em (□ X)).elim id fun hn =>
    (sa (¬ X) (dia_not_of_not_box _ hn)).elim fun v hv =>
      (hv.1.1 ((box_not_eq v).mp (modal_K _ _ (modal_K _ _ (nec% (not_of_imp_both v X))
        ((le_iff_prop _ _).1 (h v hv.1))) ((le_iff_prop _ _).1 hv.2)))).elim

/-- Where a self-atom `v` holds, with `◇w` and `◇w → ◇(◇v ∧ q)`, `□_≠¬q` fails: `v` is an atom
there, so decides every proposition. -/
theorem selfAtom_not_boxNe (v w q p : Prop) :
    (Instantiated v → Atom v) → (◇ w → ◇ (◇ v ∧ q)) → (¬ BoxNe (¬ q) → p) → v → ◇ w → p :=
  fun hA g b hv hw => b (not_boxNe_neg_of_decides v q
    (fun Y => atom_le_or_le_neg v Y (hA (instantiated_of_prop v hv))) (fun _ => g hw) hv)

/-- `self-atomicity-t-implies-two-hat-implies-nd`: let `w` be the actual world (Self-Atomicity
gives `□`Actuality) and `q` witness `□̂̂p`; `w` witnesses `□_≠p`, by the dual of Self-Atomicity:
every self-atom `v` entails `◇w → p`, since `w` entails the truth `◇v ∧ q`, and wherever `v`
holds it is an atom, so decides every proposition. -/
theorem self_atomicity_t_implies_two_hat_implies_nd :
    SelfAtomicityT → TwoHatImpliesNdNecessity := fun sa p hp =>
  hp.elim fun q hq =>
  (box_elim (self_atomicity_t_implies_necessary_actuality sa)).elim fun w hw =>
    have key : ∀ v : Prop, SelfAtom v → v ≤ (◇ w → p) := fun v hv =>
      have h₁ : □ (◇ w → ◇ (◇ v ∧ q)) := modal_K _ _
        (nec% (fun (g : □ (w → ◇ v ∧ q)) => dia_mono w _ g))
        (modal_four _ ((le_iff_prop _ _).1 (hw.2 _ ⟨hv.1, hq.1⟩)))
      (le_iff_prop _ _).2 (modal_K _ _ (modal_K _ _ (modal_K _ _
        (nec% (selfAtom_not_boxNe v w q p)) hv.2) h₁) hq.2)
    ⟨w, hw.1, box_of_selfAtoms_le sa _ key⟩

/-! ### Self-atoms and the bridge principles from type `t` -/

section lift
variable {τ : Type} [Rel τ] [Order τ] [Pointwise τ]

/-- `X ∧ Y` is instantiated only where `X` is. -/
theorem instantiated_of_and (X Y : τ) : Instantiated (X ∧ Y) → Instantiated X := fun h hX =>
  h (incl_trans _ X ⊥ (incl_and_left X Y) hX)

/-- `X ∧ Y = ⊥` gives `X ⊆ ¬Y`. -/
theorem incl_neg_of_and_eq_bot (X Y : τ) : (X ∧ Y) = ⊥ → X ⊆ ¬ Y := fun e =>
  incl_neg_of_and_incl_neg X Y (by rw [e]; exact incl_of_constP _ False id)

/-- `X ∧ Y` and `X ∧ ¬Y` are not one instantiated entity. -/
theorem not_instantiated_of_and_eq_and_neg (X Y : τ) :
    (X ∧ Y) = (X ∧ ¬ Y) → ¬ Instantiated (X ∧ Y) := fun e hi =>
  hi (incl_trans _ (Y ∧ ¬ Y) ⊥
    (incl_and _ _ _ (incl_and_right X Y) (by rw [e]; exact incl_and_right X (¬ Y)))
    (incl_and_neg Y ⊥))

/-- Where an atom `X` is instantiated together with `X ∧ Y` and `X ∧ ¬Y`, a contradiction:
both are non-bottom parts of `X`, so both are `X`. -/
theorem not_of_atom_both (X Y : τ) :
    (Instantiated X → Atom X) → Instantiated (X ∧ Y) → Instantiated (X ∧ ¬ Y) → False :=
  fun hA h₁ h₂ =>
    have hX := hA (instantiated_of_and X Y h₁)
    have e₁ := eq_of_le_atom_rel X _ hX (ne_bot_of_instantiated _ h₁)
      ((le_iff _ _).2 (nec% (incl_and_left X Y)))
    have e₂ := eq_of_le_atom_rel X _ hX (ne_bot_of_instantiated _ h₂)
      ((le_iff _ _).2 (nec% (incl_and_left X (¬ Y))))
    not_instantiated_of_and_eq_and_neg X Y (e₁.trans e₂.symm) h₁


/-- Under Self-atoms are atoms at `t`, the instantiation of `X ∧ Y`, for `X` a self-atom, is
`⊥` or that of `X`. -/
theorem instantiated_and_eq (saa : SelfAtomsAreAtomsT) (X Y : τ) (hX : SelfAtom X) :
    Instantiated (X ∧ Y) = False ∨ Instantiated (X ∧ Y) = Instantiated X :=
  (em (Instantiated (X ∧ Y) = False)).elim Or.inl fun hne => Or.inr
    (eq_of_le_atom_rel _ _ (saa _ (selfAtom_instantiated X hX)) hne
      ((le_iff_prop _ _).2 (nec% (instantiated_of_and X Y))))

end lift

section unary
variable {σ : Type} [Ty σ]

/-- Where `λy. w ∧ y = x` is instantiated, `w` is true. -/
theorem of_instantiated_pin (w : Prop) (x : σ) : Instantiated (λ y ↦ w ∧ y = x) → w := fun hi =>
  (em w).elim id fun hn => (hi (fun y h => absurd h.1 hn)).elim

/-- Where `w` is an atom if true, `λy. w ∧ y = x` is an atom if instantiated. -/
theorem pin_atom (w : Prop) (x : σ) :
    (Instantiated w → Atom w) → Instantiated (λ y ↦ w ∧ y = x) → Atom (λ y ↦ w ∧ y = x) :=
  fun hA hi => atom_of_decides_arrow _ (ne_bot_of_instantiated _ hi)
    (pin_decides w x fun q => atom_le_or_le_neg w q
      (hA (instantiated_of_prop w (of_instantiated_pin w x hi))))

/-- `self-atomicity-t-and-bf-imply-self-atomicity-r`, at `σ → t`, its list form being the map's
record: BF gives `x` with `◇Xx`, Self-Atomicity at `t` a self-atom `w ≤ Xx`, and
`λy. w ∧ y = x` is a self-atom below `X`. -/
theorem self_atomicity_t_and_bf_imply_self_atomicity_r :
    SelfAtomicityT → Barcan σ → SelfAtomicity (σ → Prop) := fun sa bf X hX =>
  (dia_exists_of_bf bf X (dia_exists_of_ne_bot X hX)).elim fun x hx =>
    (sa (X x) hx).elim fun w hw =>
      ⟨λ y ↦ w ∧ y = x,
        ⟨fun e => hw.1.1 ((and_rfl_eq w x).symm.trans (congrFun e x)),
          modal_K _ _ (nec% (pin_atom w x)) hw.1.2⟩,
        pin_le_of_le w x X hw.2⟩

/-- An instance makes a property instantiated. -/
theorem instantiated_of_apply (X : σ → Prop) (x : σ) : X x → Instantiated X := fun h hb =>
  False.elim (hb x h)

/-- `self-atoms-are-strong-atoms-t-and-bf-imply-self-atoms-are-strong-atoms-r`, at `σ → t`: a
self-atom `X` is an atom (Self-atoms are atoms, from type `t`); BF gives `x` with `◇Xx`; `Xx`
is the atom `∃y. Xy` below which it lies, a self-atom of type `t` and so a strong atom; and `X`
is the non-bottom part `λy. Xx ∧ y = x` of itself, which that strong atom makes strong. -/
theorem self_atoms_are_strong_atoms_t_and_bf_imply_self_atoms_are_strong_atoms_r :
    SelfAtomsAreStrongAtomsT → Barcan σ → SelfAtomsAreStrongAtoms (σ → Prop) := fun sas bf X hX =>
  have saa : SelfAtomsAreAtomsT := self_atoms_are_strong_atoms_t_implies_self_atoms_are_atoms_t sas
  have hA : Atom X := self_atoms_are_atoms_t_implies_self_atoms_are_atoms_r saa X hX
  have hp := selfAtom_instantiated X hX
  (dia_exists_of_bf bf X (dia_exists_of_ne_bot X hX.1)).elim fun x hx =>
    have e : X x = Instantiated X := eq_of_le_atom_rel _ _ (saa _ hp) hx
      ((le_iff_prop _ _).2 (nec% (instantiated_of_apply X x)))
    have hwS : SAtom (X x) := by rw [e]; exact sas _ hp
    have hle : (λ y ↦ X x ∧ y = x) ≤ X := pin_le_of_le _ x X (le_refl_prop _)
    have hne : (λ y ↦ X x ∧ y = x) ≠ ⊥ := fun e' =>
      hx ((and_rfl_eq _ x).symm.trans (congrFun e' x))
    (eq_of_le_atom_rel X _ hA hne hle) ▸ ⟨hne, modal_K _ _ (nec% (pin_decides _ x)) hwS.2⟩

end unary

/-- A property that is an atom wherever it is instantiated has at most one instance. -/
theorem unique_of_selfAtom {σ : Type} [Ty σ] (X : σ → Prop) :
    (Instantiated X → Atom X) → ∀ y z, X y → X z → z = y := fun h y z hy hz =>
  unique_of_decides X (fun Y => atom_decides_arrow X Y (h (instantiated_of_apply X y hy))) y z hy hz

/-- `self-atomicity-atomicity-t-weak-rigid-comprehension-and-relational-choice-imply-intensional-choice`:
the argument recorded for Strong Atomicity (`strong-atomicity-weak-rigid-comprehension-and-relational-choice-imply-intensional-choice`,
Cian Dorr's construction) with self-atoms for strong atoms: for each atom `w` of type `t`, a
self-atom `X_w` below `λy. w ∧ Fy`; the uniqueness step needs `X_w` to decide every property
only where it is instantiated, where a self-atom is an atom. -/
theorem self_atomicity_atomicity_t_weak_rigid_comprehension_and_relational_choice_imply_intensional_choice
    {σ : Type} [Ty σ] :
    SelfAtomicity (σ → Prop) → AtomicityT →
      WeakRigidComprehension ((σ → Prop) → Prop) → RelationalChoice Prop (σ → Prop) →
        IntensionalChoice σ := by
  intro sl₁ at₀ wrc rc F hF
  -- Each atom `w` is related to the strong atoms of type `σt` below `λy. w ∧ Fy`.
  have hser : Serial (λ (w : Prop) (X : σ → Prop) ↦
      Atom w → SelfAtom X ∧ X ≤ (λ y ↦ w ∧ F y)) := by
    intro w
    em_cases hw : Atom w
    · have hne : (λ y ↦ w ∧ F y) ≠ Rel.bot (σ → Prop) := fun e => by
        have h₁ : □ (∀ y, w ∧ F y → False) := by
          rw [show (∀ y, w ∧ F y → False) = (∀ y : σ, Rel.bot (σ → Prop) y → False) from
            congrArg (λ (P : σ → Prop) ↦ ∀ y, P y → False) e]
          exact nec% (fun (y : σ) (h : False) => h)
        have h₂ : □ (¬ w) := modal_K _ _ (modal_K _ _
          (nec% (fun (h : ∀ y, w ∧ F y → False) (hx : ∃ x, F x) (hw : w) =>
            hx.elim fun x hx => h x ⟨hw, hx⟩)) h₁) hF
        exact atom_ne_false w hw (eq_false_of_le_neg w ((le_iff_prop _ _).2
          (modal_K _ _ (nec% (fun (h : ¬ w) (hw : w) => (h hw).elim)) h₂)))
      obtain ⟨X, hX, hle⟩ := sl₁ _ hne
      exact ⟨X, fun _ => ⟨hX, hle⟩⟩
    · obtain ⟨X, -⟩ := existence_rel (τ := σ → Prop)
      exact ⟨X, fun h => (hw h).elim⟩
  obtain ⟨V, hVf, hVU⟩ := rc _ hser
  obtain ⟨R, ⟨hRp, hRi⟩, hco⟩ := wrc (λ X ↦ ∃ w, Atom w ∧ V w X)
  have hco' : ∀ X, R X ↔ ∃ w, Atom w ∧ V w X := fun X => (hco X).symm
  -- What an actual instance of `R` is: a strong atom below `λy. w ∧ Fy` for an atom `w`.
  have hinst : ∀ X, R X → ∃ w, Atom w ∧ V w X ∧ SelfAtom X ∧ □ (∀ y, X y → w ∧ F y) :=
    fun X hX => ((hco' X).1 hX).elim fun w ⟨hw, hV⟩ =>
      ⟨w, hw, hV, (hVU w X hV hw).1, (le_iff _ _).1 (hVU w X hV hw).2⟩
  -- (a) Necessarily, each instance of `R` is below `F` and has at most one instance.
  have ha : □ (∀ X, R X → (∀ y, X y → F y) ∧ (∀ y z, X y → X z → z = y)) :=
    hRi (λ X ↦ (∀ y, X y → F y) ∧ (∀ y z, X y → X z → z = y)) fun X hX =>
      (hinst X hX).elim fun w ⟨_, _, hS, hle⟩ =>
        modal_K _ _ (modal_K _ _
          (nec% (fun (h₁ : ∀ y, X y → w ∧ F y) (h₂ : Instantiated X → Atom X) =>
            (⟨fun y hy => (h₁ y hy).2, unique_of_selfAtom X h₂⟩ :
              (∀ y, X y → F y) ∧ (∀ y z, X y → X z → z = y)))) hle) hS.2
  -- (b) Necessarily, two instances of `R` are identical or not both instantiated.
  have hb : □ (∀ a b, R a → R b → a = b ∨ ¬ ((∃ y, a y) ∧ ∃ z, b z)) :=
    box_pairs_of_weaklyInextensible R hRi _ fun a b ha hb =>
      (hinst a ha).elim fun w ⟨hw, hVa, _, hla⟩ => (hinst b hb).elim fun w' ⟨hw', hVb, _, hlb⟩ =>
        (em (w = w')).elim
          (fun e => by
            subst e
            have hab : a = b := (hVf w).elim fun c ⟨_, hu⟩ => (hu a hVa).symm.trans (hu b hVb)
            exact modal_K _ _
              (nec% (fun (h : a = b) => (Or.inl h : a = b ∨ ¬ ((∃ y, a y) ∧ ∃ z, b z))))
              (necessity_of_identity a b hab))
          (fun hne => modal_K _ _ (modal_K _ _ (modal_K _ _
            (nec% (fun (h₀ : ¬ (w ∧ w')) (h₁ : ∀ y, a y → w ∧ F y) (h₂ : ∀ y, b y → w' ∧ F y) =>
              (Or.inr (fun ⟨⟨y, hy⟩, ⟨z, hz⟩⟩ => h₀ ⟨(h₁ y hy).1, (h₂ z hz).1⟩) :
                a = b ∨ ¬ ((∃ y, a y) ∧ ∃ z, b z))))
            (box_not_and_of_atoms w w' hw hw' hne)) hla) hlb)
  refine ⟨λ y ↦ ∃ X, R X ∧ X y, ?_, ?_⟩
  · -- `G ≤ F`, from (a).
    exact le_of_box_incl (modal_K _ _
      (nec% (fun (H : ∀ X, R X → (∀ y, X y → F y) ∧ (∀ y z, X y → X z → z = y)) (y : σ)
          (hy : ∃ X, R X ∧ X y) => hy.elim fun X ⟨hX, hXy⟩ => (H X hX).1 y hXy)) ha)
  · -- Every atom entails that `G` is instantiated, so it necessarily is.
    have hex : □ (∃ y, ∃ X, R X ∧ X y) := (neg_le_iff_box _).1
      (Atomicity.to_dual at₀ _ fun w hw => (atom_le_or_le_neg w _ hw).elim id fun hn => by
        obtain ⟨X, hV, -⟩ := hVf w
        have hRX : R X := (hco' X).2 ⟨w, hw, hV⟩
        have hS : SelfAtom X := (hVU w X hV hw).1
        have hle : □ (∀ y, X y → w ∧ F y) := (le_iff _ _).1 (hVU w X hV hw).2
        have hbot : □ (X ⊆ Rel.bot (σ → Prop)) := modal_K _ _ (modal_K _ _ (modal_K _ _
          (nec% (fun (h₁ : w → ¬ ∃ y, ∃ X, R X ∧ X y) (h₂ : R X) (h₃ : ∀ y, X y → w ∧ F y) =>
              (fun (y : σ) (hy : X y) => ((h₁ (h₃ y hy).1 ⟨y, X, h₂, hy⟩).elim :
                Rel.bot (σ → Prop) y) : X ⊆ Rel.bot (σ → Prop))))
          ((le_iff_prop _ _).1 hn)) (hRp X hRX)) hle
        exact (hS.1 (le_antisymm_arrow X _ (le_of_box_incl hbot) (bot_le_arrow X))).elim)
    -- Necessarily at most one instance: (b), then (a).
    have huniq : □ (∀ y z, (∃ X, R X ∧ X y) → (∃ X, R X ∧ X z) → z = y) :=
      modal_K _ _ (modal_K _ _
        (nec% (fun (H₁ : ∀ a b, R a → R b → a = b ∨ ¬ ((∃ y, a y) ∧ ∃ z, b z))
            (H₂ : ∀ X, R X → (∀ y, X y → F y) ∧ (∀ y z, X y → X z → z = y)) (y z : σ)
            (hy : ∃ X, R X ∧ X y) (hz : ∃ X, R X ∧ X z) =>
          hy.elim fun a ⟨ha, hay⟩ => hz.elim fun b ⟨hb, hbz⟩ =>
            (H₁ a b ha hb).elim (fun e => (H₂ a ha).2 y z hay ((congrFun e z).mpr hbz))
              (fun hn => (hn ⟨⟨y, hay⟩, ⟨z, hbz⟩⟩).elim))) hb) ha
    exact modal_K _ _ (modal_K _ _
      (nec% (fun (h₁ : ∃ y, ∃ X, R X ∧ X y)
          (h₂ : ∀ y z, (∃ X, R X ∧ X y) → (∃ X, R X ∧ X z) → z = y) =>
        (h₁.elim fun x hx => ⟨x, hx, fun y hy => h₂ x y hx hy⟩ :
          ∃ x, (∃ X, R X ∧ X x) ∧ ∀ y, (∃ X, R X ∧ X y) → y = x))) hex) huniq


end Classicism.Proofs
