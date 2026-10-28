import Classicism.Models.FiniteCompressionLogic
import Classicism.Models.FiniteCompressionMaps

/-!
# Descent of rigid subrelations of old bounds

Original formalization (misc), 23 October 2026.
Source: research/2026-10-23/finite-compression-labelled-entrance.md,
sections 5–6 (unpaginated).
-/

namespace Classicism.Meta.Intensional.FiniteCompression

open CategoryTheory
noncomputable section

def PointPinnedArgs {ρ : RTy} (a : TA ρ B) : Prop :=
  ∃ S : Set Point, S.Finite ∧ ∀ V (h k : B ⟶ V),
    AgreeOn cat.De (W := B) (point B '' S) h k →
      Args.map model.inner ρ h a = Args.map model.inner ρ k a

def PointPinned {ρ : RTy} (F : RD B ρ) : Prop :=
  ∃ S : Set Point, S.Finite ∧
    model.PinnedO (.rel ρ) (W := B) (point B '' S) (model.incl ρ B F)

theorem old_tuple_pointPinned {ρ : RTy} (h : A ⟶ B) (a : TA ρ A) :
    PointPinnedArgs (Args.map model.inner ρ h a) := by
  obtain ⟨S, hS, hpS⟩ := tuple_pin ρ A a
  refine ⟨pointMap h '' S, hS.image _, ?_⟩
  intro V k l hag
  rw [← Args.map_comp, ← Args.map_comp]
  apply hpS
  intro x hx
  change FunCat.fn k (FunCat.fn h x) = FunCat.fn l (FunCat.fn h x)
  apply hag
  exact ⟨pointMap h x, ⟨x, hx, rfl⟩, (fn_point h x).symm⟩

theorem old_bounded_args {ρ : RTy} {F : RD A ρ} (hF : RigidData F)
    (h : A ⟶ B) {Y : RD B ρ}
    (hYF : model.incl ρ B Y ⊆ model.incl ρ B ((model.inner (.rel ρ)).map h F))
    (a : TA ρ B) (ha : prof Y (𝟙 B) a) : PointPinnedArgs a := by
  have hfa : prof F h a := by
    simpa only [Category.comp_id] using (prof_map F h (𝟙 B) a).1 (hYF ha)
  obtain ⟨b, hb, he⟩ := (weak_exact F (rigid_weak hF) h a).1 hfa
  rw [← he]
  exact old_tuple_pointPinned h b

theorem pin_map {ρ : RTy} {W V : cat.Ob} {F : RD W ρ}
    {P : Set (cat.X W)}
    (hp : model.PinnedO (.rel ρ) (W := W) P (model.incl ρ W F)) (c : W ⟶ V) :
    model.PinnedO (.rel ρ) (W := V) (FunCat.fn c '' P)
      (model.incl ρ V ((model.inner (.rel ρ)).map c F)) := by
  apply (model.pinnedO_Incl_iff (.rel ρ) (W := V) _ _).2
  intro U h k hag
  rw [← FunctorToTypes.map_comp_apply, ← FunctorToTypes.map_comp_apply]
  apply (model.pinnedO_Incl_iff (.rel ρ) (W := W) P F).1 hp
  intro x hx
  exact hag (FunCat.fn c x) ⟨x, hx, rfl⟩

/-- Semantic exactness from the concrete finite-label factorization. The
factorization premise is discharged by the tail maps in the descent theorem. -/
theorem tail_exact_of_factor {ρ : RTy} (F : RD B ρ) (hw : WeakData F)
    (P : Set (cat.X B))
    (hp : model.PinnedO (.rel ρ) (W := B) P (model.incl ρ B F))
    (S : Set Point) (hS : S.Finite)
    (hfactor : ∀ h k : B ⟶ B, AgreeOn cat.De (W := B) (point B '' S) h k →
      ∀ M : Set Point, M.Finite → ∃ u : B ⟶ B,
        AgreeOn cat.De (W := B) P u (𝟙 B) ∧
          AgreeOn cat.De (W := B) (point B '' M) (u ≫ h) k)
    (hargs : ∀ a, prof F (𝟙 B) a → PointPinnedArgs a) :
    ExactImage F ∧ model.PinnedO (.rel ρ) (W := B) (point B '' S)
      (model.incl ρ B F) := by
  let D : Set (TA ρ B) := fun a => prof F (𝟙 B) a
  have hstable (u : B ⟶ B) (hu : AgreeOn cat.De (W := B) P u (𝟙 B))
      (a : TA ρ B) (ha : a ∈ D) : Args.map model.inner ρ u a ∈ D :=
    (prof_agree hp hu _).1 (hw.1 a ha u)
  have hraw : ∀ V (h k : B ⟶ V), AgreeOn cat.De (W := B) (point B '' S) h k →
      ∀ a : TA ρ V, exactRaw D ⟨V, a, h⟩ ↔ exactRaw D ⟨V, a, k⟩ := by
    intro V h k hag a
    have hv : V = B := target_from_B h
    subst V
    constructor
    · rintro ⟨b, hb, he⟩
      obtain ⟨M, hM, hpM⟩ := hargs b hb
      obtain ⟨u, hu, hfac⟩ := hfactor k h (hag.symm cat.De) M hM
      refine ⟨Args.map model.inner ρ u b, hstable u hu b hb, ?_⟩
      rw [← Args.map_comp, hpM B (u ≫ k) h hfac]
      exact he
    · rintro ⟨b, hb, he⟩
      obtain ⟨M, hM, hpM⟩ := hargs b hb
      obtain ⟨u, hu, hfac⟩ := hfactor h k hag M hM
      refine ⟨Args.map model.inner ρ u b, hstable u hu b hb, ?_⟩
      rw [← Args.map_comp, hpM B (u ≫ h) k hfac]
      exact he
  have hm := exactRaw_mem_of_agree (hS.image (point B)) D hraw
  let E := exactEntity D hm
  have hE : F = E := weak_eq_of_current hw (rigid_weak (exactEntity_rigid D hm))
    (fun a => (prof_exactEntity_here D hm a).symm)
  rw [hE]
  exact ⟨exactEntity_exact D hm, exactEntity_pinned_of_agree D hm hraw⟩

theorem finite_label_exact {ρ : RTy} (F : RD B ρ) (hw : WeakData F)
    (P : Set (cat.X B)) (hP : P.Finite)
    (hp : model.PinnedO (.rel ρ) (W := B) P (model.incl ρ B F))
    (hlabels : ∀ i, Sum.inr (Label.block i) ∉ P)
    (hargs : ∀ a, prof F (𝟙 B) a → PointPinnedArgs a) :
    ExactImage F ∧ PointPinned F := by
  obtain ⟨S, hS, hpoints, hfinite⟩ := finite_label_support P hP hlabels
  have hfactor : ∀ h k : B ⟶ B, AgreeOn cat.De (W := B) (point B '' S) h k →
      ∀ M : Set Point, M.Finite → ∃ u : B ⟶ B,
        AgreeOn cat.De (W := B) P u (𝟙 B) ∧
          AgreeOn cat.De (W := B) (point B '' M) (u ≫ h) k := by
    intro h k hag M hM
    have hag' : ∀ p ∈ S, pointMap h p = pointMap k p := by
      intro p hp
      apply point_injective B
      have hh := hag (point B p) ⟨p, hp, rfl⟩
      change FunCat.fn h (point B p) = FunCat.fn k (point B p) at hh
      simpa only [fn_point] using hh
    obtain ⟨u, hu, hfac⟩ := relative_factor P hS hM hpoints hfinite h k hag'
    refine ⟨u, hu, ?_⟩
    rintro _ ⟨p, hp, rfl⟩
    change FunCat.fn (u ≫ h) (point B p) = FunCat.fn k (point B p)
    rw [fn_point, fn_point, hfac p hp]
  obtain ⟨he, hpin⟩ := tail_exact_of_factor F hw P hp S hS hfactor hargs
  exact ⟨he, S, hS, hpin⟩

/-- A rigid subrelation under a transported root bound has an exact-image
profile and a pin containing only old individual points. -/
theorem rigid_subobject_descent {ρ : RTy} (F : RD A ρ) (hF : RigidData F)
    (h : A ⟶ B) (Y : RD B ρ) (hY : RigidData Y)
    (hYF : model.incl ρ B Y ⊆ model.incl ρ B ((model.inner (.rel ρ)).map h F)) :
    ExactImage Y ∧ PointPinned Y := by
  obtain ⟨P, hP, hpY⟩ := fin_pin (.rel ρ) B Y
  obtain ⟨c, r, hret, hlabels, hrpoints⟩ := compress_return P hP
  let T := (model.inner (.rel ρ)).map c Y
  have hT : RigidData T := rigid_map hY c
  have hpT : model.PinnedO (.rel ρ) (W := B) (FunCat.fn c '' P)
      (model.incl ρ B T) := pin_map hpY c
  have hTF : model.incl ρ B T ⊆
      model.incl ρ B ((model.inner (.rel ρ)).map (h ≫ c) F) := by
    simpa only [FunctorToTypes.map_comp_apply] using map_preserves_subobject c hYF
  obtain ⟨heT, S, hS, hpinT⟩ := finite_label_exact T (rigid_weak hT)
    (FunCat.fn c '' P) (hP.image _) hpT hlabels
    (old_bounded_args hF (h ≫ c) hTF)
  have hreturn : (model.inner (.rel ρ)).map r T = Y := by
    have he := (model.pinnedO_Incl_iff (.rel ρ) (W := B) P Y).1 hpY B
      (c ≫ r) (𝟙 B) hret
    simpa only [FunctorToTypes.map_comp_apply, FunctorToTypes.map_id_apply] using he
  have hfix : (model.inner (.rel ρ)).map r T = T := by
    have hag : AgreeOn cat.De (W := B) (point B '' S) r (𝟙 B) := by
      rintro _ ⟨p, hp, rfl⟩
      change FunCat.fn r (point B p) = point B p
      rw [fn_point, hrpoints p]
    simpa only [FunctorToTypes.map_id_apply] using
      (model.pinnedO_Incl_iff (.rel ρ) (W := B) (point B '' S) T).1 hpinT B r (𝟙 B) hag
  have hYT : Y = T := hreturn.symm.trans hfix
  rw [hYT]
  exact ⟨heT, S, hS, hpinT⟩

theorem rigid_subobject_point_pin {ρ : RTy} (F : RD A ρ) (hF : RigidData F)
    {V : cat.Ob} (h : A ⟶ V) (Y : RD V ρ) (hY : RigidData Y)
    (hYF : model.incl ρ V Y ⊆ model.incl ρ V ((model.inner (.rel ρ)).map h F)) :
    ∃ T : Set Point, T.Finite ∧
      model.PinnedO (.rel ρ) (W := V) (point V '' T) (model.incl ρ V Y) := by
  cases V
  · obtain ⟨T, hT, hpT⟩ := fin_pin (.rel ρ) A Y
    refine ⟨T, hT, ?_⟩
    have himage : point A '' T = T := by
      apply Set.Subset.antisymm
      · rintro _ ⟨x, hx, rfl⟩
        exact hx
      · intro x hx
        exact ⟨x, hx, rfl⟩
    exact Eq.mpr (congrArg (fun U : Set (cat.X A) =>
      model.PinnedO (.rel ρ) (W := A) U (model.incl ρ A Y)) himage) hpT
  · exact (rigid_subobject_descent F hF h Y hY hYF).2

end
end Classicism.Meta.Intensional.FiniteCompression
