import Classicism.Models.FiniteCompressionApproximation
import Classicism.Models.FiniteCompressionDescent
import Classicism.Models.FiniteCompressionFormula

/-!
# All-type Rigid Power at the finite-compression entrance

Original formalization (misc), 23 October 2026.
Source: research/2026-10-23/finite-compression-labelled-entrance.md,
section 7 (unpaginated).
-/

namespace Classicism.Meta.Intensional.FiniteCompression

open CategoryTheory
noncomputable section

theorem approximate_lift_of_pin {ρ : RTy} (F : RD A ρ) (hF : RigidData F)
    {V : cat.Ob} (h : A ⟶ V) (Y : RD V ρ) (hY : RigidData Y)
    (hYF : model.incl ρ V Y ⊆ model.incl ρ V ((model.inner (.rel ρ)).map h F))
    (N : Set Point) (hN : N.Finite)
    (hpF : model.PinnedO (.rel ρ) (W := A) N (model.incl ρ A F))
    (T : Set Point) (hT : T.Finite)
    (hpY : model.PinnedO (.rel ρ) (W := V) (point V '' T) (model.incl ρ V Y)) :
    ∃ j : A ⟶ V, AgreeOn cat.De (W := A) N j h ∧
      ∃ X : RD A ρ, RigidData X ∧ model.incl ρ A X ⊆ model.incl ρ A F ∧
        (model.inner (.rel ρ)).map j X = Y := by
  obtain ⟨j, hj, P, hP, hNP, hquot⟩ := root_approximation h N hN T hT
  have hjF : (model.inner (.rel ρ)).map j F = (model.inner (.rel ρ)).map h F :=
    (model.pinnedO_Incl_iff (.rel ρ) (W := A) N F).1 hpF V j h hj
  let D : Set (TA ρ A) := fun a => prof F (𝟙 A) a ∧
    prof Y (𝟙 V) (Args.map model.inner ρ j a)
  have hstable (u : A ⟶ A) (hu : AgreeOn cat.De (W := A) P u (𝟙 A))
      (a : TA ρ A) (ha : a ∈ D) : Args.map model.inner ρ u a ∈ D := by
    obtain ⟨v, hv, hfac⟩ := hquot u hu
    refine ⟨?_, ?_⟩
    · exact (prof_agree hpF (hu.mono cat.De hNP) _).1
        ((rigid_weak hF).1 a ha.1 u)
    · have hmem := (prof_agree hpY hv _).1
        ((rigid_weak hY).1 (Args.map model.inner ρ j a) ha.2 v)
      change prof Y (𝟙 V) (Args.map model.inner ρ j (Args.map model.inner ρ u a))
      rw [← Args.map_comp, hfac, Args.map_comp]
      exact hmem
  have hm := root_exact_mem hP D hstable
  let X := exactEntity D hm
  have hrX : RigidData X := exactEntity_rigid D hm
  have hXF : model.incl ρ A X ⊆ model.incl ρ A F := by
    apply weak_le_of_current (rigid_weak hrX) (rigid_weak hF)
    intro a ha
    exact ((prof_exactEntity_here D hm a).1 ha).1
  refine ⟨j, hj, X, hrX, hXF, ?_⟩
  apply weak_eq_of_current (rigid_weak (rigid_map hrX j)) (rigid_weak hY)
  intro a
  rw [prof_map, Category.comp_id]
  change prof (exactEntity D hm) j a ↔ prof Y (𝟙 V) a
  rw [prof_exactEntity]
  constructor
  · rintro ⟨b, hb, rfl⟩
    exact hb.2
  · intro ha
    have hfa : prof F j a := by
      have hfa' : prof ((model.inner (.rel ρ)).map j F) (𝟙 V) a := by
        rw [hjF]
        exact hYF ha
      simpa only [Category.comp_id] using (prof_map F j (𝟙 V) a).1 hfa'
    obtain ⟨b, hb, he⟩ := (weak_exact F (rigid_weak hF) j a).1 hfa
    exact ⟨b, ⟨hb, he.symm ▸ ha⟩, he⟩

/-- The semantic power argument needs only finite approximate lifts. Its
profile is the value of the actual rigid-power lambda term below. -/
theorem rigid_power_weak_of_lifts {ρ : RTy} (F : RD A ρ) (hF : RigidData F)
    (hlift : ∀ {V : cat.Ob} (h : A ⟶ V) (Y : RD V ρ), RigidData Y →
      model.incl ρ V Y ⊆ model.incl ρ V ((model.inner (.rel ρ)).map h F) →
      ∀ N : Set Point, N.Finite →
      model.PinnedO (.rel ρ) (W := A) N (model.incl ρ A F) →
      ∃ j : A ⟶ V, AgreeOn cat.De (W := A) N j h ∧
        ∃ X : RD A ρ, RigidData X ∧ model.incl ρ A X ⊆ model.incl ρ A F ∧
          (model.inner (.rel ρ)).map j X = Y) :
    WeakData (rigidPowerEntity (𝟙 A) F) := by
  let Q := rigidPowerEntity (𝟙 A) F
  have hQ := fun {V : cat.Ob} (h : A ⟶ V) (X : RD V ρ) =>
    prof_rigidPowerEntity (𝟙 A) F h X
  constructor
  · rintro ⟨X, xu⟩ hx V h
    cases xu
    obtain ⟨hrX, hXF⟩ := (hQ (𝟙 A) X).1 hx
    have hXF' : model.incl ρ A X ⊆ model.incl ρ A F := by
      simpa only [FunctorToTypes.map_id_apply] using hXF
    exact (hQ h _).2 ⟨rigid_map hrX h, map_preserves_subobject h hXF'⟩
  · intro Z hZ
    obtain ⟨S, hS, hpF⟩ := fin_pin (.rel ρ) A F
    obtain ⟨T, hT, hpZ⟩ := fin_pin (.rel (.arr (.rel ρ) .t)) A Z
    rintro ⟨V, ⟨Y, yu⟩, h⟩ hy
    cases yu
    obtain ⟨hrY, hYF⟩ := (hQ h Y).1 hy
    obtain ⟨j, hj, X, hrX, hXF, he⟩ := hlift h Y hrY hYF (S ∪ T)
      (hS.union hT) (Premodel.PinnedO.mono model Set.subset_union_left hpF)
    have hx : prof Q (𝟙 A) (X, PUnit.unit) := (hQ (𝟙 A) X).2
      ⟨hrX, by simpa only [FunctorToTypes.map_id_apply] using hXF⟩
    have hz := hZ (X, PUnit.unit) hx j
    change prof Z j ((model.inner (.rel ρ)).map j X, PUnit.unit) at hz
    rw [he] at hz
    exact (prof_agree hpZ (hj.mono cat.De Set.subset_union_right) _).1 hz

theorem approximate_lift {ρ : RTy} (F : RD A ρ) (hF : RigidData F)
    {V : cat.Ob} (h : A ⟶ V) (Y : RD V ρ) (hY : RigidData Y)
    (hYF : model.incl ρ V Y ⊆ model.incl ρ V ((model.inner (.rel ρ)).map h F))
    (N : Set Point) (hN : N.Finite)
    (hpF : model.PinnedO (.rel ρ) (W := A) N (model.incl ρ A F)) :
    ∃ j : A ⟶ V, AgreeOn cat.De (W := A) N j h ∧
      ∃ X : RD A ρ, RigidData X ∧ model.incl ρ A X ⊆ model.incl ρ A F ∧
        (model.inner (.rel ρ)).map j X = Y := by
  obtain ⟨T, hT, hpY⟩ := rigid_subobject_point_pin F hF h Y hY hYF
  exact approximate_lift_of_pin F hF h Y hY hYF N hN hpF T hT hpY

/-- The official Rigid Power sentence, at an arbitrary relational type. -/
theorem rigid_power_at_root (ρ : RTy) : model.HoldsSentence (P.RigidPower.quoted ρ) := by
  apply (holds_rigidPower_iff (𝟙 A) ρ).2
  intro F hF
  apply weak_rigid_at_root
  exact rigid_power_weak_of_lifts F hF (approximate_lift F hF)

theorem holds_rigid_power_schema : model.HoldsAx P.RigidPower.schema := by
  rintro _ ⟨ρ, _, rfl⟩
  exact rigid_power_at_root ρ

end
end Classicism.Meta.Intensional.FiniteCompression
