import Classicism.Results.Research.RigidityClosureResearchJoins

/-!
# Atomicity and Rigid Comprehension imply Weakly Rigid Power

Direct source: notes/maximalism-modal.md §16 (original adaptation, misc,
unpaginated, 22 October 2026). Its background attribution is to Bacon,
Could the truths of mathematics have been different?, Appendix C.2, Lemma C.6,
pp.15–16; the weakened WRP argument is the research note's proof, not attributed
as a theorem in that paper. Only RC at σt and Atomicity at (σt)t are assumed.
-/
namespace Classicism.Research.RigidityClosure
open Classicism.P Classicism.Paper
variable {σ : Type} [Ty σ]

def WeakPowerFamily (F : σ → Prop) : (σ → Prop) → Prop :=
  fun Y => WeaklyRigid Y ∧ Y ≤ F

def AtomMeetProfile (F : σ → Prop) (W : (σ → Prop) → Prop) : σ → Prop :=
  fun a => F a ∧ □ (∀ Y : σ → Prop, W Y → Y a)

theorem atomic_profile_below (F X : σ → Prop) (W : (σ → Prop) → Prop)
    (hf : WeaklyRigid F) (hx : Rigid X) (hc : AtomMeetProfile F W ≡ X) : X ≤ F :=
  le_of_box_incl ((weaklyInextensible_of_inextensible hx.2) F
    (fun a ha => hf.1 a ((hc a).mpr ha).1))

theorem atomic_profile_lower (F X : σ → Prop) (W : (σ → Prop) → Prop)
    (hx : Rigid X) (hc : AtomMeetProfile F W ≡ X) :
    □ (∀ Y : σ → Prop, W Y → ∀ a : σ, X a → Y a) :=
  modal_K _ _
    (nec% (fun (h : ∀ a : σ, X a → ∀ Y : σ → Prop, W Y → Y a)
      (Y : σ → Prop) (hy : W Y) (a : σ) (ha : X a) => h a ha Y hy))
    ((weaklyInextensible_of_inextensible hx.2) (fun a => ∀ Y : σ → Prop, W Y → Y a)
      (fun a ha => ((hc a).mpr ha).2))

theorem atomic_profile_reverse_at (F X : σ → Prop) (W : (σ → Prop) → Prop)
    (hw : Atom W) (hx : Rigid X) (hc : AtomMeetProfile F W ≡ X)
    (a : σ) (hfa : F a) : □ (∀ Y : σ → Prop, W Y → Y a → X a) :=
  (em (X a)).elim
    (fun ha => modal_K _ _
      (nec% (fun (ha : X a) (Y : σ → Prop) (_ : W Y) (_ : Y a) => ha))
      (weaklyPersistent_of_persistent hx.1 a ha))
    (fun hn => (atom_le_or_le_neg_rel W (fun Y : σ → Prop => Y a) hw).elim
      (fun hp => False.elim (hn ((hc a).mp ⟨hfa, (le_iff _ _).1 hp⟩)))
      (fun hp => modal_K _ _
        (nec% (fun (h : ∀ Y : σ → Prop, W Y → ¬ Y a) (Y : σ → Prop)
          (hy : W Y) (hya : Y a) => (False.elim (h Y hy hya) : X a)))
        ((le_iff _ _).1 hp)))

theorem atomic_profile_upper (F X : σ → Prop) (W : (σ → Prop) → Prop)
    (hf : WeaklyRigid F) (hw : Atom W) (hx : Rigid X)
    (hc : AtomMeetProfile F W ≡ X) (hi : W ≤ WeakPowerFamily F) :
    □ (∀ Y : σ → Prop, W Y → ∀ a : σ, Y a → X a) :=
  modal_K _ _ (modal_K _ _
    (nec% (fun (h : ∀ a : σ, F a → ∀ Y : σ → Prop, W Y → Y a → X a)
      (hi : ∀ Y : σ → Prop, W Y → WeakPowerFamily F Y)
      (Y : σ → Prop) (hy : W Y) (a : σ) (hya : Y a) =>
      h a (incl_of_le (hi Y hy).2 a hya) Y hy hya))
    (hf.2 (fun a => ∀ Y : σ → Prop, W Y → Y a → X a)
      (fun a ha => atomic_profile_reverse_at F X W hw hx hc a ha)))
    ((le_iff _ _).1 hi)

/-- Every atom below the weak-power family lies below an actual member's haecceity. -/
theorem atom_weak_power_pullback (rc : RigidComprehension (σ → Prop))
    (F : σ → Prop) (hf : WeaklyRigid F) (W : (σ → Prop) → Prop)
    (hw : Atom W) (hi : W ≤ WeakPowerFamily F) :
    ∃ X : σ → Prop, WeakPowerFamily F X ∧ W ≤ Singleton X := by
  obtain ⟨X, hx, hc⟩ := rc (AtomMeetProfile F W)
  refine ⟨X, ⟨weaklyRigid_of_rigid hx, atomic_profile_below F X W hf hx hc⟩, ?_⟩
  apply le_of_box_incl
  exact modal_K _ _ (modal_K _ _ (modal_K _ _ (modal_K _ _
    (nec% (fun (hx : WeaklyRigid X)
      (hi : ∀ Y : σ → Prop, W Y → WeakPowerFamily F Y)
      (hxy : ∀ Y : σ → Prop, W Y → ∀ a : σ, X a → Y a)
      (hyx : ∀ Y : σ → Prop, W Y → ∀ a : σ, Y a → X a)
      (Y : σ → Prop) (hy : W Y) =>
      eq_of_weaklyRigid_coext (hi Y hy).1 hx
        (fun a => ⟨hyx Y hy a, hxy Y hy a⟩)))
    ((rigid_iff_box_weaklyRigid X).1 hx)) ((le_iff _ _).1 hi))
    (atomic_profile_lower F X W hx hc)) (atomic_profile_upper F X W hf hw hx hc hi)

theorem tame_weak_power_persistent (tr : TameRigidity (σ → Prop))
    (F : σ → Prop) : WeaklyPersistent (WeakPowerFamily F) :=
  fun Y hy => (box_and_eq _ _).mpr
    ⟨(rigid_iff_box_weaklyRigid Y).1 (tr Y hy.1), necessity_of_identity _ _ hy.2⟩

theorem atomic_weak_power_inextensible (hat : Atomicity ((σ → Prop) → Prop))
    (rc : RigidComprehension (σ → Prop)) (F : σ → Prop) (hf : WeaklyRigid F) :
    WeaklyInextensible (WeakPowerFamily F) := by
  intro Z hz
  let B : (σ → Prop) → Prop := fun Y => WeakPowerFamily F Y ∧ ¬ Z Y
  apply (hat B).elim
  · intro hb
    exact modal_K _ _
      (nec% (fun (h : ∀ Y : σ → Prop, B Y → ¬ B Y) (Y : σ → Prop)
        (hy : WeakPowerFamily F Y) => (em (Z Y)).elim id
          (fun hn => False.elim (h Y ⟨hy, hn⟩ ⟨hy, hn⟩))))
      ((le_iff _ _).1 hb)
  · intro hw
    obtain ⟨W, hw, hi⟩ := hw
    have hip : W ≤ WeakPowerFamily F := le_of_box_incl
      (modal_K _ _ (nec% (fun (h : ∀ Y : σ → Prop, W Y → B Y)
        (Y : σ → Prop) (hy : W Y) => (h Y hy).1)) ((le_iff _ _).1 hi))
    have hin : W ≤ (fun Y => ¬ Z Y) := le_of_box_incl
      (modal_K _ _ (nec% (fun (h : ∀ Y : σ → Prop, W Y → B Y)
        (Y : σ → Prop) (hy : W Y) => (h Y hy).2)) ((le_iff _ _).1 hi))
    obtain ⟨X, hx, hsing⟩ := atom_weak_power_pullback rc F hf W hw hip
    have hiz : W ≤ Z := le_trans_rel W (Singleton X) Z hsing
      ((singleton_le_iff_box X Z).2 (hz X hx))
    exact False.elim (not_le_neg_of_atom hw (le_neg_of_le_both_rel W Z hiz hin))

/-- Exact finite-instance strengthening of Atomicity + RC ⇒ Rigid Power. -/
theorem atomicity_rc_implies_weak_power : Atomicity ((σ → Prop) → Prop) →
    RigidComprehension (σ → Prop) → WeaklyRigidPower (σ → Prop) :=
  fun hat rc F hf =>
    ⟨tame_weak_power_persistent (Proofs.rigid_comprehension_implies_tame_rigidity rc) F,
     atomic_weak_power_inextensible hat rc F hf⟩

theorem necessary_atomicity_rc_implies_necessary_weak_power :
    NecAtomicity ((σ → Prop) → Prop) → NecRigidComprehension (σ → Prop) →
    NecWeaklyRigidPower (σ → Prop) :=
  fun hat rc => modal_K _ _ (modal_K _ _ (nec% (atomicity_rc_implies_weak_power (σ := σ))) hat) rc

end Classicism.Research.RigidityClosure
