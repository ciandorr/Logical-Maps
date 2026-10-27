import Classicism.Results.Research.RigidityClosureResearchFinite

/-!
# Existing joins and generation by current singleton relations

Direct source: research/2026-10-22/notes/rigidity-by-joins-and-boolean-closure.md,
§§1–2 (original research, unpaginated, misc, 22 October 2026).
The indexing family is an admitted object, and only its current members are
assumed rigid. Completeness and rigidity of the indexing family are not used.
-/
namespace Classicism.Research.RigidityClosure
open Classicism.P Classicism.Paper
variable {σ : Type} [Ty σ]

def Singleton (a : σ) : σ → Prop := fun x => x = a
def SingletonFamily (F : σ → Prop) : (σ → Prop) → Prop :=
  fun Y => ∃ a, F a ∧ Y = Singleton a

def RigidJoinClosure (σ : Type) [Ty σ] : Prop :=
  ∀ H : (σ → Prop) → Prop, ∀ Z : σ → Prop,
    LUB Z H → (∀ Y, H Y → Rigid Y) → Rigid Z

theorem singleton_le_iff_box (a : σ) (Z : σ → Prop) :
    Singleton a ≤ Z ↔ □ (Z a) :=
  ⟨fun h => modal_K _ _ (nec% (fun (h : a = a → Z a) => h rfl))
      (converse_barcan _ ((le_iff _ _).1 h) a),
   fun h => le_of_box_incl (modal_K _ _
     (nec% (fun (h : Z a) (x : σ) (hx : x = a) => hx.symm ▸ h)) h)⟩

theorem singletonFamily_upper_iff (F Z : σ → Prop) :
    UB Z (SingletonFamily F) ↔ (∀ a, F a → □ (Z a)) :=
  ⟨fun h a ha => (singleton_le_iff_box a Z).1 (h (Singleton a) ⟨a, ha, rfl⟩),
   fun h Y hy => hy.elim fun a ha => ha.2.symm ▸ (singleton_le_iff_box a Z).2 (h a ha.1)⟩

/-- Weak rigidity is exactly reconstruction from the current singleton family. -/
theorem weaklyRigid_iff_singleton_join (F : σ → Prop) :
    WeaklyRigid F ↔ LUB F (SingletonFamily F) := by
  refine ⟨?_, ?_⟩
  · intro hf Z
    refine ⟨fun hu => le_of_box_incl (hf.2 Z ((singletonFamily_upper_iff F Z).1 hu)), ?_⟩
    intro hi
    exact (singletonFamily_upper_iff F Z).2 fun a ha =>
      modal_K _ _ (converse_barcan _ ((le_iff F Z).1 hi) a) (hf.1 a ha)
  · intro hj
    exact ⟨(singletonFamily_upper_iff F F).1 ((hj F).2 (le_refl_rel F)),
      fun Z hz => (le_iff F Z).1 ((hj Z).1 ((singletonFamily_upper_iff F Z).2 hz))⟩

theorem rigid_iff_necessary_singleton_join (F : σ → Prop) :
    Rigid F ↔ □ (LUB F (SingletonFamily F)) :=
  ⟨fun hf => modal_K _ _ (nec% (weaklyRigid_iff_singleton_join F).1)
      ((rigid_iff_box_weaklyRigid F).1 hf),
   fun hj => (rigid_iff_box_weaklyRigid F).2
      (modal_K _ _ (nec% (weaklyRigid_iff_singleton_join F).2) hj)⟩

theorem persistent_below_box (Y Z : σ → Prop) (hy : Persistent Y) (hi : Y ≤ Z) :
    Y ≤ (fun a => □ (Z a)) :=
  le_of_box_incl (modal_K _ _ (modal_K _ _
    (nec% (fun (hp : WeaklyPersistent Y) (hb : □ (Y ⊆ Z)) (a : σ) (ha : Y a) =>
      modal_K _ _ (converse_barcan _ hb a) (hp a ha))) hy)
    (modal_four _ ((le_iff Y Z).1 hi)))

theorem represented_join_preserves_persistence (H : (σ → Prop) → Prop) (Z : σ → Prop)
    (hz : LUB Z H) (hh : ∀ Y, H Y → Persistent Y) : Persistent Z :=
  (persistent_iff_le Z).2 ((hz (boxAt Z)).1 fun Y hy =>
    persistent_below_box Y Z (hh Y hy) (((hz Z).2 (le_refl_rel Z)) Y hy))

theorem represented_join_preserves_weak_inextensibility (H : (σ → Prop) → Prop)
    (Z : σ → Prop) (hz : LUB Z H) (hh : ∀ Y, H Y → WeaklyInextensible Y) :
    WeaklyInextensible Z := fun W hw =>
  (le_iff Z W).1 ((hz W).1 fun Y hy =>
    le_of_box_incl (hh Y hy W fun a ha => hw a
      (incl_of_le (((hz Z).2 (le_refl_rel Z)) Y hy) a ha)))

/-- Existing arbitrary admitted joins preserve weak rigidity in bare C. -/
theorem represented_join_preserves_weak_rigidity (H : (σ → Prop) → Prop)
    (Z : σ → Prop) (hz : LUB Z H) (hh : ∀ Y, H Y → WeaklyRigid Y) :
    WeaklyRigid Z :=
  ⟨weaklyPersistent_of_persistent
    (represented_join_preserves_persistence H Z hz fun Y hy => persistent_of_weaklyRigid (hh Y hy)),
   represented_join_preserves_weak_inextensibility H Z hz fun Y hy => (hh Y hy).2⟩

/-- Tameness is exactly closure of the rigid fragment under existing joins. -/
theorem tame_iff_rigid_join_closure : TameRigidity (σ → Prop) ↔ RigidJoinClosure σ :=
  ⟨fun tr H Z hz hh => tr Z (represented_join_preserves_weak_rigidity H Z hz
      fun Y hy => weaklyRigid_of_rigid (hh Y hy)),
   fun cl F hf => cl (SingletonFamily F) F ((weaklyRigid_iff_singleton_join F).1 hf)
      (fun Y hy => hy.elim fun a ha => ha.2.symm ▸
        Classicism.Rigidity.singleton_rigid a)⟩

/-- ND makes the current singleton join coextensive with its generating relation. -/
theorem nd_singleton_join_coext (nd : NecessityOfDistinctness σ)
    (F G : σ → Prop) (hg : LUB G (SingletonFamily F)) : F ≡ G := by
  intro a
  refine ⟨fun ha => box_elim ((singletonFamily_upper_iff F G).1
    ((hg G).2 (le_refl_rel G)) a ha), ?_⟩
  intro hga
  exact (em (F a)).elim id fun hn =>
    have hu : UB (fun x => x ≠ a) (SingletonFamily F) :=
      (singletonFamily_upper_iff F (fun x => x ≠ a)).2
        (fun b hb => nd b a (fun he => hn (he ▸ hb)))
    False.elim (incl_of_le ((hg (fun x => x ≠ a)).1 hu) a hga rfl)

/-- A join of singletons is weakly rigid, whether or not it reconstructs F itself. -/
theorem singleton_join_weakly_rigid (F G : σ → Prop)
    (hg : LUB G (SingletonFamily F)) : WeaklyRigid G :=
  represented_join_preserves_weak_rigidity (SingletonFamily F) G hg
    (fun Y hy => hy.elim fun a ha => ha.2.symm ▸
      weaklyRigid_of_rigid (Classicism.Rigidity.singleton_rigid a))

/-- Exact typewise ND + BC ⇒ Weak Rigid Comprehension. -/
theorem nd_bc_weak_comprehension : NecessityOfDistinctness σ →
    BooleanCompleteness (σ → Prop) → WeakRigidComprehension (σ → Prop) :=
  fun nd bc F => (bc (fun Z => UB Z (SingletonFamily F))).elim fun G hg =>
    ⟨G, singleton_join_weakly_rigid F G (lub_of_glb_ubs _ G hg),
      nd_singleton_join_coext nd F G (lub_of_glb_ubs _ G hg)⟩

/-- Closed-form schema packages for the type/list certificate generator. -/
def SingletonJoinCharacterization (σ : Type) [Ty σ] : Prop :=
  ∀ F : σ → Prop, WeaklyRigid F ↔ LUB F (SingletonFamily F)
def RepresentedJoinPersistence (σ : Type) [Ty σ] : Prop :=
  ∀ H : (σ → Prop) → Prop, ∀ Z : σ → Prop,
    LUB Z H → (∀ Y, H Y → Persistent Y) → Persistent Z
def RepresentedJoinWeakInextensibility (σ : Type) [Ty σ] : Prop :=
  ∀ H : (σ → Prop) → Prop, ∀ Z : σ → Prop,
    LUB Z H → (∀ Y, H Y → WeaklyInextensible Y) → WeaklyInextensible Z
def RepresentedJoinWeakRigidity (σ : Type) [Ty σ] : Prop :=
  ∀ H : (σ → Prop) → Prop, ∀ Z : σ → Prop,
    LUB Z H → (∀ Y, H Y → WeaklyRigid Y) → WeaklyRigid Z

theorem singleton_join_characterization : SingletonJoinCharacterization σ :=
  weaklyRigid_iff_singleton_join
theorem represented_join_persistence : RepresentedJoinPersistence σ :=
  represented_join_preserves_persistence
theorem represented_join_weak_inextensibility : RepresentedJoinWeakInextensibility σ :=
  represented_join_preserves_weak_inextensibility
theorem represented_join_weak_rigidity : RepresentedJoinWeakRigidity σ :=
  represented_join_preserves_weak_rigidity
theorem tame_implies_rigid_join_closure : TameRigidity (σ → Prop) → RigidJoinClosure σ :=
  tame_iff_rigid_join_closure.1
theorem rigid_join_closure_implies_tame : RigidJoinClosure σ → TameRigidity (σ → Prop) :=
  tame_iff_rigid_join_closure.2

end Classicism.Research.RigidityClosure
