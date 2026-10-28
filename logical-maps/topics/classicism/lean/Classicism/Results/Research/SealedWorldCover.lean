import Classicism.Results.Records.Lattice
import Classicism.Tools.Check
import Classicism.Tools.TypeSystem

/-!
# Sealed world covers and rigid bottom cuts

Direct research source: `research/2026-10-22/strong-atomicity-rigid-bottom-cut.md`,
§§1–6, and `followup/modal-propagation.md`, §§1–2 (22 October 2026).
These are new research proofs, not proofs attributed to a published source.

The cut lemma is uniform in a relational type. Join representations and their
consequences below are stated separately at t and at σ → t. No infinitary
language or future comprehension premise is used. This file is a draft until
the separate gate, type and object-language checks recorded in modal-status.md
have actually succeeded. No generated statements or record statuses are edited.
-/

namespace Classicism.Research.SealedWorldCover
open Classicism.P Classicism.Paper

section cuts
variable {τ : Type} [Rel τ] [Order τ] [Pointwise τ]

def Decides (W : τ) : Prop := ∀ Y : τ, W ≤ Y ∨ W ≤ ¬ Y
def Cut (A : τ → Prop) (Y : τ) : τ → Prop := fun W => A W ∧ W ≤ Y

/-- The three sealed facts needed by the bottom-cut construction. -/
def Sealed (A : τ → Prop) : Prop :=
  Rigid A ∧ □ (A (Rel.bot τ)) ∧ □ (∀ W, A W → Decides W)

theorem decides_bottom : Decides (Rel.bot τ) := fun Y => Or.inl (bot_le_rel Y)

theorem sealed_necessary (A : τ → Prop) (h : Sealed A) : □ (Sealed A) :=
  (box_and_eq _ _).mpr ⟨rigid_necessary A h.1,
    (box_and_eq _ _).mpr ⟨modal_four _ h.2.1, modal_four _ h.2.2⟩⟩

/-- A rigid coextension of the strong atoms together with bottom is sealed. -/
theorem seal_from_coextension (A : τ → Prop) (hA : Rigid A)
    (hco : coext (fun W : τ => SAtom W ∨ W = Rel.bot τ) A) : Sealed A :=
  ⟨hA, weaklyPersistent_of_persistent hA.1 _ ((hco _).1 (Or.inr rfl)),
    weaklyInextensible_of_inextensible hA.2 Decides fun W hW =>
      ((hco W).2 hW).elim (fun hw => hw.2)
        (fun hw => hw.symm ▸ (nec% (decides_bottom (τ := τ))))⟩

theorem cut_persistent (A : τ → Prop) (Y : τ) (hA : Persistent A) :
    Persistent (Cut A Y) :=
  modal_K _ _
    (nec% (fun (wp : WeaklyPersistent A) (W : τ) (hW : Cut A Y W) =>
      (show □ (Cut A Y W) from
        (box_and_eq _ _).mpr ⟨wp W hW.1, box_le_rel W Y hW.2⟩))) hA

theorem opposite_cut_is_bottom (A : τ → Prop) (Y W : τ)
    (hn : W ≤ ¬ Y) (hW : Cut A Y W) : W = Rel.bot τ :=
  eq_bot_of_le_neg_rel W (le_neg_of_le_both_rel W Y hW.2 hn)

/-- The only exceptional branch collapses to bottom, which belongs to every cut. -/
theorem cut_weakly_inextensible (A : τ → Prop) (Y : τ)
    (wi : WeaklyInextensible A) (hb : A (Rel.bot τ))
    (hd : ∀ W, A W → Decides W) : WeaklyInextensible (Cut A Y) := by
  intro Z hZ
  have hz : □ (Z (Rel.bot τ)) := hZ _ ⟨hb, bot_le_rel Y⟩
  have hh : □ (∀ W, A W → Cut A Y W → Z W) :=
    wi (fun W => Cut A Y W → Z W) fun W hW =>
      (hd W hW Y).elim
        (fun hy => box_imp_of_box _ _ (hZ W ⟨hW, hy⟩))
        (fun hn => modal_K _ _ (modal_K _ _
          (nec% (fun (hn : W ≤ ¬ Y) (hz : Z (Rel.bot τ)) (hc : Cut A Y W) =>
            (opposite_cut_is_bottom A Y W hn hc).symm ▸ hz))
          (box_le_rel W (¬ Y) hn)) hz)
  exact modal_K _ _
    (nec% (fun (h : ∀ W, A W → Cut A Y W → Z W) (W : τ) (hc : Cut A Y W) =>
      h W hc.1 hc)) hh

/-- Full rigidity of the actual cut; no comprehension is used at future worlds. -/
theorem cut_rigid (A : τ → Prop) (Y : τ) (h : Sealed A) : Rigid (Cut A Y) :=
  ⟨cut_persistent A Y h.1.1,
    modal_K _ _ (modal_K _ _ (modal_K _ _
      (nec% (cut_weakly_inextensible A Y)) h.1.2) h.2.1) h.2.2⟩

theorem cut_below (A : τ → Prop) (Y : τ) : Cut A Y ≤ A :=
  le_of_box_incl (nec% (fun (W : τ) (h : Cut A Y W) => h.1))

end cuts

section unary
variable {σ : Type} [Ty σ]

def Join (R : (σ → Prop) → Prop) : σ → Prop := fun x => ∃ W, R W ∧ W x

theorem cover_from_coextension (sl : StrongAtomicity (σ → Prop))
    (A : (σ → Prop) → Prop) (hA : Rigid A)
    (hco : coext (fun W : σ → Prop => SAtom W ∨ W = Rel.bot (σ → Prop)) A) :
    □ (∀ x : σ, Join A x) := by
  have hle := StrongAtomicity.to_dual sl (Join A) fun W hw =>
    (le_iff _ _).2 (modal_K _ _
      (nec% (fun (ha : A W) (x : σ) (hx : W x) => (show Join A x from ⟨W, ha, hx⟩)))
      (weaklyPersistent_of_persistent hA.1 W ((hco W).1 (Or.inl hw))))
  exact modal_K _ _
    (nec% (fun (h : ∀ x : σ, ¬ Join A x → Join A x) (x : σ) =>
      (em (Join A x)).elim (fun hx => hx) (h x))) ((le_iff _ _).1 hle)

theorem exists_sealed_cover : StrongAtomicity (σ → Prop) →
    RigidComprehension ((σ → Prop) → Prop) →
    ∃ A : (σ → Prop) → Prop, Sealed A ∧ □ (∀ x : σ, Join A x) := fun sl rc =>
  (rc (fun W => SAtom W ∨ W = Rel.bot (σ → Prop))).elim fun A hA =>
    ⟨A, seal_from_coextension A hA.1 hA.2, cover_from_coextension sl A hA.1 hA.2⟩

theorem cut_join_coext (A : (σ → Prop) → Prop) (Y : σ → Prop)
    (hc : ∀ x : σ, Join A x) (hd : ∀ W, A W → Decides W) :
    coext Y (Join (Cut A Y)) := fun x =>
  ⟨fun hy => (hc x).elim fun W hw =>
    ⟨W, ⟨hw.1, (hd W hw.1 Y).elim (fun h => h)
      (fun hn => (incl_of_le hn x hw.2 hy).elim)⟩, hw.2⟩,
    fun h => h.elim fun W hw => incl_of_le hw.1.2 x hw.2⟩

theorem cut_join_eq (A : (σ → Prop) → Prop) (Y : σ → Prop)
    (h : Sealed A) (hc : □ (∀ x : σ, Join A x)) : Y = Join (Cut A Y) :=
  intensionality Y _ (modal_K _ _ (modal_K _ _ (nec% (cut_join_coext A Y)) hc) h.2.2)

theorem join_representation (A : (σ → Prop) → Prop) (h : Sealed A)
    (hc : □ (∀ x : σ, Join A x)) (Y : σ → Prop) :
    ∃ R : (σ → Prop) → Prop, (Rigid R ∧ R ≤ A) ∧ Y = Join R :=
  ⟨Cut A Y, ⟨cut_rigid A Y h, cut_below A Y⟩, cut_join_eq A Y h hc⟩

theorem necessary_join_representation (A : (σ → Prop) → Prop) (h : Sealed A)
    (hc : □ (∀ x : σ, Join A x)) :
    □ (∀ Y : σ → Prop, ∃ R : (σ → Prop) → Prop, (Rigid R ∧ R ≤ A) ∧ Y = Join R) :=
  modal_K _ _ (modal_K _ _ (nec% (join_representation A))
    (sealed_necessary A h)) (modal_four _ hc)

theorem barcan_from_join_representation (A : (σ → Prop) → Prop)
    (wi : WeaklyInextensible (fun R : (σ → Prop) → Prop => Rigid R ∧ R ≤ A))
    (key : □ (∀ Y : σ → Prop, ∃ R : (σ → Prop) → Prop,
      (Rigid R ∧ R ≤ A) ∧ Y = Join R)) : Barcan (σ → Prop) := fun X hX =>
  have hall : □ (∀ R : (σ → Prop) → Prop, (Rigid R ∧ R ≤ A) → X (Join R)) :=
    wi (fun R => X (Join R)) fun R _ => hX (Join R)
  modal_K _ _ (modal_K _ _
    (nec% (fun (hall : ∀ R : (σ → Prop) → Prop, (Rigid R ∧ R ≤ A) → X (Join R))
      (key : ∀ Y : σ → Prop, ∃ R : (σ → Prop) → Prop,
        (Rigid R ∧ R ≤ A) ∧ Y = Join R) (Y : σ → Prop) =>
      (key Y).elim fun R hR => hR.2.symm ▸ hall R hR.1)) hall) key

theorem sealed_power_implies_necessary_barcan (A : (σ → Prop) → Prop)
    (h : Sealed A) (hc : □ (∀ x : σ, Join A x))
    (hp : Rigid (fun R : (σ → Prop) → Prop => Rigid R ∧ R ≤ A)) :
    NecBarcan (σ → Prop) :=
  modal_K _ _ (modal_K _ _ (nec% (barcan_from_join_representation A)) hp.2)
    (modal_four _ (necessary_join_representation A h hc))

/-- Exact finite dependency version: only local comprehension and local power. -/
theorem strong_atomicity_rc_power_implies_necessary_barcan : StrongAtomicity (σ → Prop) →
    RigidComprehension ((σ → Prop) → Prop) → RigidPower ((σ → Prop) → Prop) →
    NecBarcan (σ → Prop) := fun sl rc rp =>
  (exists_sealed_cover sl rc).elim fun A h =>
    sealed_power_implies_necessary_barcan A h.1 h.2 (rp A h.1.1)

theorem join_zero_of_only_bottom (R : (σ → Prop) → Prop) (hR : Rigid R)
    (h : ∀ W, R W → W = Rel.bot (σ → Prop)) : Join R = Rel.bot (σ → Prop) :=
  intensionality _ _ (modal_K _ _
    (nec% (fun (h : ∀ W, R W → W = Rel.bot (σ → Prop)) (x : σ) =>
      (show Join R x ↔ False from
        ⟨fun hx => hx.elim fun W hw => Eq.mp (congrFun (h W hw.1) x) hw.2,
         fun hf => hf.elim⟩)))
    (weaklyInextensible_of_inextensible hR.2 (fun W => W = Rel.bot (σ → Prop))
      fun W hw => necessity_of_identity W _ (h W hw)))

theorem sealed_implies_strong_atomicity (A : (σ → Prop) → Prop) (h : Sealed A)
    (hc : □ (∀ x : σ, Join A x)) : StrongAtomicity (σ → Prop) := fun Y hy => by
  have hex : ∃ W, Cut A Y W ∧ W ≠ Rel.bot (σ → Prop) :=
    (em (∃ W, Cut A Y W ∧ W ≠ Rel.bot (σ → Prop))).elim (fun hw => hw) fun hn =>
      (hy ((cut_join_eq A Y h hc).trans (join_zero_of_only_bottom (Cut A Y)
        (cut_rigid A Y h) fun W hw =>
          (em (W = Rel.bot (σ → Prop))).elim (fun he => he)
            (fun he => (hn ⟨W, hw, he⟩).elim)))).elim
  exact hex.elim fun W hw =>
    ⟨W, ⟨hw.2, modal_K _ _ (converse_barcan _ h.2.2 W)
      (weaklyPersistent_of_persistent h.1.1 W hw.1.1)⟩, hw.1.2⟩

theorem strong_atomicity_rc_implies_necessary_strong_atomicity : StrongAtomicity (σ → Prop) →
    RigidComprehension ((σ → Prop) → Prop) → NecStrongAtomicity (σ → Prop) := fun sl rc =>
  (exists_sealed_cover sl rc).elim fun A h =>
    modal_K _ _ (modal_K _ _ (nec% (sealed_implies_strong_atomicity A))
      (sealed_necessary A h.1)) (modal_four _ h.2)

end unary

/-! The empty argument tuple: proposition-valued joins. -/

def JoinT (R : Prop → Prop) : Prop := ∃ w, R w ∧ w

theorem exists_sealed_cover_t : StrongAtomicityT → RigidComprehension (Prop → Prop) →
    ∃ A : Prop → Prop, Sealed A ∧ □ (JoinT A) := fun sl rc =>
  (rc (fun w => SAtom w ∨ w = False)).elim fun A hA =>
    ⟨A, seal_from_coextension A hA.1 hA.2,
      StrongAtomicityT.to_dual sl (JoinT A) fun w hw =>
        (le_iff_prop _ _).2 (modal_K _ _
          (nec% (fun (ha : A w) (hww : w) => (show JoinT A from ⟨w, ha, hww⟩)))
          (weaklyPersistent_of_persistent hA.1.1 w ((hA.2 w).1 (Or.inl hw))))⟩

theorem cut_join_coext_t (A : Prop → Prop) (p : Prop) (hc : JoinT A)
    (hd : ∀ w, A w → Decides w) : p ↔ JoinT (Cut A p) :=
  ⟨fun hp => hc.elim fun w hw =>
    ⟨w, ⟨hw.1, (hd w hw.1 p).elim (fun h => h)
      (fun hn => (imp_of_le_prop w (¬ p) hn hw.2 hp).elim)⟩, hw.2⟩,
    fun h => h.elim fun w hw => imp_of_le_prop w p hw.1.2 hw.2⟩

theorem cut_join_eq_t (A : Prop → Prop) (p : Prop) (h : Sealed A)
    (hc : □ (JoinT A)) : p = JoinT (Cut A p) :=
  modalized_fregean _ _
    (modal_K _ _ (modal_K _ _ (nec% (cut_join_coext_t A p)) hc) h.2.2)

theorem join_representation_t (A : Prop → Prop) (h : Sealed A) (hc : □ (JoinT A))
    (p : Prop) : ∃ R : Prop → Prop, (Rigid R ∧ R ≤ A) ∧ p = JoinT R :=
  ⟨Cut A p, ⟨cut_rigid A p h, cut_below A p⟩, cut_join_eq_t A p h hc⟩

theorem necessary_join_representation_t (A : Prop → Prop) (h : Sealed A)
    (hc : □ (JoinT A)) :
    □ (∀ p : Prop, ∃ R : Prop → Prop, (Rigid R ∧ R ≤ A) ∧ p = JoinT R) :=
  modal_K _ _ (modal_K _ _ (nec% (join_representation_t A))
    (sealed_necessary A h)) (modal_four _ hc)

theorem barcan_from_join_representation_t (A : Prop → Prop)
    (wi : WeaklyInextensible (fun R : Prop → Prop => Rigid R ∧ R ≤ A))
    (key : □ (∀ p : Prop, ∃ R : Prop → Prop, (Rigid R ∧ R ≤ A) ∧ p = JoinT R)) :
    Barcan Prop := fun X hX =>
  have hall : □ (∀ R : Prop → Prop, (Rigid R ∧ R ≤ A) → X (JoinT R)) :=
    wi (fun R => X (JoinT R)) fun R _ => hX (JoinT R)
  modal_K _ _ (modal_K _ _
    (nec% (fun (hall : ∀ R : Prop → Prop, (Rigid R ∧ R ≤ A) → X (JoinT R))
      (key : ∀ p : Prop, ∃ R : Prop → Prop, (Rigid R ∧ R ≤ A) ∧ p = JoinT R)
      (p : Prop) => (key p).elim fun R hR => hR.2.symm ▸ hall R hR.1)) hall) key

theorem strong_atomicity_rc_power_implies_necessary_barcan_t : StrongAtomicityT →
    RigidComprehension (Prop → Prop) → RigidPower (Prop → Prop) → NecBarcan Prop :=
  fun sl rc rp => (exists_sealed_cover_t sl rc).elim fun A h =>
    modal_K _ _ (modal_K _ _ (nec% (barcan_from_join_representation_t A))
      (rp A h.1.1).2) (modal_four _ (necessary_join_representation_t A h.1 h.2))

theorem join_zero_of_only_bottom_t (R : Prop → Prop) (hR : Rigid R)
    (h : ∀ w, R w → w = False) : JoinT R = False :=
  modalized_fregean _ _ (modal_K _ _
    (nec% (fun (h : ∀ w, R w → w = False) =>
      (show JoinT R ↔ False from
        ⟨fun hx => hx.elim fun w hw => (h w hw.1) ▸ hw.2, fun hf => hf.elim⟩)))
    (weaklyInextensible_of_inextensible hR.2 (fun w => w = False)
      fun w hw => necessity_of_identity w False (h w hw)))

theorem sealed_implies_strong_atomicity_t (A : Prop → Prop) (h : Sealed A)
    (hc : □ (JoinT A)) : StrongAtomicityT := fun p hp => by
  have hex : ∃ w, Cut A p w ∧ w ≠ False :=
    (em (∃ w, Cut A p w ∧ w ≠ False)).elim (fun hw => hw) fun hn =>
      (hp ((cut_join_eq_t A p h hc).trans (join_zero_of_only_bottom_t (Cut A p)
        (cut_rigid A p h) fun w hw =>
          (em (w = False)).elim (fun he => he)
            (fun he => (hn ⟨w, hw, he⟩).elim)))).elim
  exact hex.elim fun w hw =>
    ⟨w, ⟨hw.2, modal_K _ _ (converse_barcan _ h.2.2 w)
      (weaklyPersistent_of_persistent h.1.1 w hw.1.1)⟩, hw.1.2⟩

theorem strong_atomicity_rc_implies_necessary_strong_atomicity_t : StrongAtomicityT →
    RigidComprehension (Prop → Prop) → NecStrongAtomicity Prop := fun sl rc =>
  (exists_sealed_cover_t sl rc).elim fun A h =>
    modal_K _ _ (modal_K _ _ (nec% (sealed_implies_strong_atomicity_t A))
      (sealed_necessary A h.1)) (modal_four _ h.2)

end Classicism.Research.SealedWorldCover

#classicism_check Classicism.rigid_necessary
  Classicism.box_le_rel
  Classicism.Research.SealedWorldCover.decides_bottom
  Classicism.Research.SealedWorldCover.sealed_necessary
  Classicism.Research.SealedWorldCover.seal_from_coextension
  Classicism.Research.SealedWorldCover.cut_persistent
  Classicism.Research.SealedWorldCover.opposite_cut_is_bottom
  Classicism.Research.SealedWorldCover.cut_weakly_inextensible
  Classicism.Research.SealedWorldCover.cut_rigid
  Classicism.Research.SealedWorldCover.cut_below
  Classicism.Research.SealedWorldCover.cover_from_coextension
  Classicism.Research.SealedWorldCover.exists_sealed_cover
  Classicism.Research.SealedWorldCover.cut_join_coext
  Classicism.Research.SealedWorldCover.cut_join_eq
  Classicism.Research.SealedWorldCover.join_representation
  Classicism.Research.SealedWorldCover.necessary_join_representation
  Classicism.Research.SealedWorldCover.barcan_from_join_representation
  Classicism.Research.SealedWorldCover.sealed_power_implies_necessary_barcan
  Classicism.Research.SealedWorldCover.strong_atomicity_rc_power_implies_necessary_barcan
  Classicism.Research.SealedWorldCover.join_zero_of_only_bottom
  Classicism.Research.SealedWorldCover.sealed_implies_strong_atomicity
  Classicism.Research.SealedWorldCover.strong_atomicity_rc_implies_necessary_strong_atomicity
  Classicism.Research.SealedWorldCover.exists_sealed_cover_t
  Classicism.Research.SealedWorldCover.cut_join_coext_t
  Classicism.Research.SealedWorldCover.cut_join_eq_t
  Classicism.Research.SealedWorldCover.join_representation_t
  Classicism.Research.SealedWorldCover.necessary_join_representation_t
  Classicism.Research.SealedWorldCover.barcan_from_join_representation_t
  Classicism.Research.SealedWorldCover.strong_atomicity_rc_power_implies_necessary_barcan_t
  Classicism.Research.SealedWorldCover.join_zero_of_only_bottom_t
  Classicism.Research.SealedWorldCover.sealed_implies_strong_atomicity_t
  Classicism.Research.SealedWorldCover.strong_atomicity_rc_implies_necessary_strong_atomicity_t
#classicism_types Classicism.rigid_necessary
  Classicism.box_le_rel
  Classicism.Research.SealedWorldCover.decides_bottom
  Classicism.Research.SealedWorldCover.sealed_necessary
  Classicism.Research.SealedWorldCover.seal_from_coextension
  Classicism.Research.SealedWorldCover.cut_persistent
  Classicism.Research.SealedWorldCover.opposite_cut_is_bottom
  Classicism.Research.SealedWorldCover.cut_weakly_inextensible
  Classicism.Research.SealedWorldCover.cut_rigid
  Classicism.Research.SealedWorldCover.cut_below
  Classicism.Research.SealedWorldCover.cover_from_coextension
  Classicism.Research.SealedWorldCover.exists_sealed_cover
  Classicism.Research.SealedWorldCover.cut_join_coext
  Classicism.Research.SealedWorldCover.cut_join_eq
  Classicism.Research.SealedWorldCover.join_representation
  Classicism.Research.SealedWorldCover.necessary_join_representation
  Classicism.Research.SealedWorldCover.barcan_from_join_representation
  Classicism.Research.SealedWorldCover.sealed_power_implies_necessary_barcan
  Classicism.Research.SealedWorldCover.strong_atomicity_rc_power_implies_necessary_barcan
  Classicism.Research.SealedWorldCover.join_zero_of_only_bottom
  Classicism.Research.SealedWorldCover.sealed_implies_strong_atomicity
  Classicism.Research.SealedWorldCover.strong_atomicity_rc_implies_necessary_strong_atomicity
  Classicism.Research.SealedWorldCover.exists_sealed_cover_t
  Classicism.Research.SealedWorldCover.cut_join_coext_t
  Classicism.Research.SealedWorldCover.cut_join_eq_t
  Classicism.Research.SealedWorldCover.join_representation_t
  Classicism.Research.SealedWorldCover.necessary_join_representation_t
  Classicism.Research.SealedWorldCover.barcan_from_join_representation_t
  Classicism.Research.SealedWorldCover.strong_atomicity_rc_power_implies_necessary_barcan_t
  Classicism.Research.SealedWorldCover.join_zero_of_only_bottom_t
  Classicism.Research.SealedWorldCover.sealed_implies_strong_atomicity_t
  Classicism.Research.SealedWorldCover.strong_atomicity_rc_implies_necessary_strong_atomicity_t
