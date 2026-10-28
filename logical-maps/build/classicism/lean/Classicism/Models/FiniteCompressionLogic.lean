import Classicism.Models.FiniteCompressionBase

/-!
# Finite pinning, exact-image profiles, and entrance Tame Rigidity

Original adaptation (misc), 23 October 2026. Source:
research/2026-10-23/finite-compression-labelled-entrance.md, sections 1, 3, 5,
and 7 (unpaginated).
The generic finite-pinning arguments adapt ColourCollapseRigidity. Pins now
have the world-dependent type Set (cat.X W). The concrete root factorization
is proved in FiniteCompressionBase, not assumed as a model interface.
-/

namespace Classicism.Meta.Intensional.FiniteCompression

open CategoryTheory
noncomputable section

abbrev et : RTy := .arr .e .t

abbrev RD (W : cat.Ob) (ρ : RTy) := model.Dom W (.rel ρ)
abbrev TA (ρ : RTy) (W : cat.Ob) := Args model.inner ρ W

def prof {ρ : RTy} {W V : cat.Ob} (F : RD W ρ) (h : W ⟶ V) (a : TA ρ V) : Prop :=
  (⟨V, a, h⟩ : Tuple model.inner ρ W) ∈ model.incl ρ W F

@[simp] theorem prof_map {ρ : RTy} {W V U : cat.Ob} (F : RD W ρ) (h : W ⟶ V)
    (k : V ⟶ U) (a : TA ρ U) :
    prof ((model.inner (.rel ρ)).map h F) k a ↔ prof F (h ≫ k) a := by
  unfold prof
  rw [model.incl_map]
  rfl

theorem fin_pin (σ : Ty) (W : cat.Ob) (x : model.Dom W σ) :
    ∃ S : Set (cat.X W), S.Finite ∧ model.PinnedO σ (W := W) S (model.Incl σ W x) :=
  symIdeal_inner_finPinned (De := cat.De) (G := syms) (J := PinIdeal.fin cat.De)
    (W₀ := A) (nonempty_e := (base A).ne) (I := model.I) σ W x

theorem tuple_pin : ∀ (ρ : RTy) (W : cat.Ob) (a : TA ρ W),
    ∃ S : Set (cat.X W), S.Finite ∧ ∀ V (h i : W ⟶ V), AgreeOn cat.De (W := W) S h i →
      Args.map model.inner ρ h a = Args.map model.inner ρ i a
  | .t, W, a => ⟨∅, Set.finite_empty, fun _ _ _ _ => rfl⟩
  | .arr σ ρ, W, a => by
    obtain ⟨S, hS, hpS⟩ := fin_pin σ W a.1
    obtain ⟨T, hT, hpT⟩ := tuple_pin ρ W a.2
    refine ⟨S ∪ T, hS.union hT, fun V h i ha => ?_⟩
    change ((model.inner σ).map h a.1, Args.map model.inner ρ h a.2) =
      ((model.inner σ).map i a.1, Args.map model.inner ρ i a.2)
    exact Prod.ext ((model.pinnedO_Incl_iff σ (W := W) S a.1).1 hpS V h i (ha.mono cat.De Set.subset_union_left))
      (hpT V h i (ha.mono cat.De Set.subset_union_right))

theorem prof_agree {ρ : RTy} {W V : cat.Ob} {F : RD W ρ} {S : Set (cat.X W)}
    (hp : model.PinnedO (.rel ρ) (W := W) S (model.incl ρ W F))
    {h i : W ⟶ V} (ha : AgreeOn cat.De (W := W) S h i) (a : TA ρ V) :
    prof F h a ↔ prof F i a := by
  have he := congrArg (fun R : Intension model.inner ρ V =>
    (⟨V, a, 𝟙 V⟩ : Tuple model.inner ρ V) ∈ R) (hp V h i ha)
  simpa only [prof, Outer.map_rel, Intension.mem_map, Category.comp_id] using Iff.of_eq he

def WeakData {ρ : RTy} {W : cat.Ob} (F : RD W ρ) : Prop :=
  (∀ a : TA ρ W, prof F (𝟙 W) a → ∀ {V : cat.Ob} (h : W ⟶ V),
    prof F h (Args.map model.inner ρ h a)) ∧
  (∀ Z : RD W ρ, (∀ a : TA ρ W, prof F (𝟙 W) a → ∀ {V : cat.Ob} (h : W ⟶ V),
    prof Z h (Args.map model.inner ρ h a)) → model.incl ρ W F ⊆ model.incl ρ W Z)

def RigidData {ρ : RTy} {W : cat.Ob} (F : RD W ρ) : Prop :=
  ∀ {V : cat.Ob} (h : W ⟶ V), WeakData ((model.inner (.rel ρ)).map h F)

def ExactImage {ρ : RTy} {W : cat.Ob} (F : RD W ρ) : Prop :=
  ∀ {V : cat.Ob} (h : W ⟶ V) (a : TA ρ V),
    prof F h a ↔ ∃ b : TA ρ W, prof F (𝟙 W) b ∧ Args.map model.inner ρ h b = a

def hull {ρ : RTy} {W : cat.Ob} (N : Set (cat.X W)) (D : Set (TA ρ W)) : Intension model.inner ρ W :=
  fun p => ∃ j : W ⟶ p.1, AgreeOn cat.De (W := W) N p.2.2 j ∧
    ∃ a, a ∈ D ∧ Args.map model.inner ρ j a = p.2.1

theorem hull_mem {ρ : RTy} {W : cat.Ob} {N : Set (cat.X W)} (hN : N.Finite) (D : Set (TA ρ W)) :
    hull N D ∈ Set.range (model.incl ρ W) := by
  apply (mem_range_symIncl cat.De syms (PinIdeal.fin cat.De) ρ W (hull N D)).2
  refine ⟨⟨N, hN, ?_⟩, ?_⟩
  · intro V h i ha
    ext ⟨U, a, k⟩
    constructor
    · rintro ⟨j, hj, b, hb, he⟩
      exact ⟨j, ((ha.comp_right cat.De k).symm cat.De).trans cat.De hj, b, hb, he⟩
    · rintro ⟨j, hj, b, hb, he⟩
      exact ⟨j, (ha.comp_right cat.De k).trans cat.De hj, b, hb, he⟩
  · intro V a k g _
    rintro ⟨j, hj, b, hb, he⟩
    exact ⟨j ≫ g, hj.comp_right cat.De g, b, hb,
      (Args.map_comp model.inner ρ j g b).trans (congrArg (Args.map model.inner ρ g) he)⟩

theorem weak_below_hull {ρ : RTy} {W : cat.Ob} (F : RD W ρ) (hw : WeakData F)
    {N : Set (cat.X W)} (hN : N.Finite) :
    model.incl ρ W F ⊆ hull N (fun a => prof F (𝟙 W) a) := by
  obtain ⟨Z, hZ⟩ := hull_mem hN (fun a => prof F (𝟙 W) a)
  have h := hw.2 Z (fun a ha V j => by
    unfold prof
    rw [hZ]
    exact ⟨j, AgreeOn.refl cat.De (W := W) N j, a, ha, rfl⟩)
  rwa [hZ] at h

/-- Full weak rigidity at A implies an exact-image profile at every outgoing
arrow, through actual finite pinning and the explicit root factorization. -/
theorem weak_exact {ρ : RTy} (F : RD A ρ) (hw : WeakData F) : ExactImage F := by
  obtain ⟨S, hS, hp⟩ := fin_pin (.rel ρ) A F
  intro V h a
  constructor
  · intro ha
    obtain ⟨h', hag, b, hb, hba⟩ := weak_below_hull F hw hS ha
    obtain ⟨M, hM, hpM⟩ := tuple_pin ρ A b
    obtain ⟨u, hfix, hfactor⟩ := root_factor h h' hS hM hag
    have hfix' : AgreeOn cat.De (W := A) S u (𝟙 A) := by
      intro x hx
      exact hfix x hx
    have hcurrent : prof F (𝟙 A) (Args.map model.inner ρ u b) :=
      (prof_agree hp (h := u) (i := 𝟙 A) hfix' _).1 (hw.1 b hb u)
    refine ⟨Args.map model.inner ρ u b, hcurrent, ?_⟩
    rw [← Args.map_comp, hpM V (u ≫ h) h' hfactor]
    exact hba
  · rintro ⟨b, hb, rfl⟩
    exact hw.1 b hb h

theorem exact_rigid {ρ : RTy} {W : cat.Ob} (F : RD W ρ) (he : ExactImage F) : RigidData F := by
  intro V k
  constructor
  · intro a ha U j
    have hFa : prof F k a := by simpa using ha
    obtain ⟨b, hb, hba⟩ := (he k a).1 hFa
    apply (prof_map F k j _).2
    apply (he (k ≫ j) _).2
    exact ⟨b, hb, by rw [Args.map_comp, hba]⟩
  · intro Z hZ
    rintro ⟨U, a, j⟩ ha
    have hFa : prof F (k ≫ j) a := (prof_map F k j a).1 ha
    obtain ⟨b, hb, hba⟩ := (he (k ≫ j) a).1 hFa
    have hbV : prof ((model.inner (.rel ρ)).map k F) (𝟙 V) (Args.map model.inner ρ k b) := by
      rw [prof_map, Category.comp_id]
      exact (he k _).2 ⟨b, hb, rfl⟩
    have hz := hZ (Args.map model.inner ρ k b) hbV j
    rw [← Args.map_comp, hba] at hz
    exact hz

theorem weak_rigid_at_root {ρ : RTy} (F : RD A ρ) : WeakData F → RigidData F :=
  fun hw => exact_rigid F (weak_exact F hw)

/-- The official full Tame Rigidity instance at A, at arbitrary relational
type. The semantic construction above is used to discharge both boxes. -/
theorem tame_at_root (ρ : RTy) : model.HoldsSentence (P.TameRigidity.quoted ρ) := by
  simp only [Premodel.HoldsSentence, P.TameRigidity.quoted,
    model.holds_forall isModel, model.holds_imp isModel, model.holds_conj isModel,
    model.holds_box isModel, Premodel.holds_inclR isModel, Premodel.sem_boxR isModel,
    Premodel.sem_var, IEnv.get, IEnv.get_map, model.incl_map, Intension.mem_map,
    Set.mem_ofPred_eq, Category.comp_id, Category.id_comp]
  intro F hF
  have hw : WeakData F := by
    constructor
    · simpa [prof] using hF.1
    · intro Z hZ
      rintro ⟨V, a, k⟩ ha
      exact hF.2 Z (by simpa [prof] using hZ) k a ha
  have hr : RigidData F := weak_rigid_at_root F hw
  constructor
  · intro V k a ha U j
    have ha' : prof ((model.inner (.rel ρ)).map k F) (𝟙 V) a :=
      (prof_map F k (𝟙 V) a).2 (by simpa only [prof, Category.comp_id] using ha)
    exact (prof_map F k j _).1 ((hr k).1 a ha' j)
  · intro V k Z hZ U j a ha
    have hz := (hr k).2 Z (fun b hb T l =>
      hZ b (by simpa only [prof, Category.comp_id] using
        (prof_map F k (𝟙 V) b).1 hb) T l)
    exact hz ((prof_map F k j a).2 ha)


/-- Transport and extensional comparison at arbitrary relational types. -/
theorem rigid_weak {ρ : RTy} {W : cat.Ob} {F : RD W ρ}
    (hF : RigidData F) : WeakData F := by
  simpa only [FunctorToTypes.map_id_apply] using hF (𝟙 W)

theorem rigid_map {ρ : RTy} {W V : cat.Ob} {F : RD W ρ}
    (hF : RigidData F) (h : W ⟶ V) : RigidData ((model.inner (.rel ρ)).map h F) := by
  intro U k
  simpa only [FunctorToTypes.map_comp_apply] using hF (h ≫ k)

theorem weak_eq_of_current {ρ : RTy} {W : cat.Ob} {F G : RD W ρ}
    (hF : WeakData F) (hG : WeakData G)
    (he : ∀ a, prof F (𝟙 W) a ↔ prof G (𝟙 W) a) : F = G := by
  apply model.Incl_injective (.rel ρ) W
  apply Set.Subset.antisymm
  · exact hF.2 G (fun a ha V h => hG.1 a ((he a).1 ha) h)
  · exact hG.2 F (fun a ha V h => hF.1 a ((he a).2 ha) h)

theorem weak_le_of_current {ρ : RTy} {W : cat.Ob} {F G : RD W ρ}
    (hF : WeakData F) (hG : WeakData G)
    (hc : ∀ a, prof F (𝟙 W) a → prof G (𝟙 W) a) :
    model.incl ρ W F ⊆ model.incl ρ W G :=
  hF.2 G (fun a ha V h => hG.1 a (hc a ha) h)

theorem map_preserves_subobject {ρ : RTy} {W V : cat.Ob} (h : W ⟶ V)
    {X F : RD W ρ} (hXF : model.incl ρ W X ⊆ model.incl ρ W F) :
    model.incl ρ V ((model.inner (.rel ρ)).map h X) ⊆
      model.incl ρ V ((model.inner (.rel ρ)).map h F) := by
  rintro ⟨U, a, k⟩ ha
  apply (prof_map F h k a).2
  exact hXF ((prof_map X h k a).1 ha)

/-- The exact-image profile of an arbitrary set of current tuples. -/
def exactRaw {ρ : RTy} {W : cat.Ob} (D : Set (TA ρ W)) : Intension model.inner ρ W :=
  fun p => ∃ a ∈ D, Args.map model.inner ρ p.2.2 a = p.2.1

theorem exactRaw_pinned_of_agree {ρ : RTy} {W : cat.Ob} {S : Set (cat.X W)}
    (D : Set (TA ρ W))
    (hp : ∀ V (h i : W ⟶ V), AgreeOn cat.De (W := W) S h i → ∀ a : TA ρ V,
      exactRaw D ⟨V, a, h⟩ ↔ exactRaw D ⟨V, a, i⟩) :
    model.PinnedO (.rel ρ) (W := W) S (exactRaw D) := by
  intro V h i ha
  ext ⟨U, a, k⟩
  exact hp U (h ≫ k) (i ≫ k) (ha.comp_right cat.De k) a

/-- Admission requires an actual finite pin; image profiles automatically
respect every target symmetry. -/
theorem exactRaw_mem_of_agree {ρ : RTy} {W : cat.Ob} {S : Set (cat.X W)}
    (hS : S.Finite) (D : Set (TA ρ W))
    (hp : ∀ V (h i : W ⟶ V), AgreeOn cat.De (W := W) S h i → ∀ a : TA ρ V,
      exactRaw D ⟨V, a, h⟩ ↔ exactRaw D ⟨V, a, i⟩) :
    exactRaw D ∈ Set.range (model.incl ρ W) := by
  apply (mem_range_symIncl cat.De syms (PinIdeal.fin cat.De) ρ W (exactRaw D)).2
  refine ⟨⟨S, hS, ?_⟩, ?_⟩
  · intro V h i ha
    ext ⟨U, a, k⟩
    exact hp U (h ≫ k) (i ≫ k) (ha.comp_right cat.De k) a
  · intro V a k g _
    rintro ⟨b, hb, he⟩
    exact ⟨b, hb, (Args.map_comp model.inner ρ k g b).trans
      (congrArg (Args.map model.inner ρ g) he)⟩

def exactEntity {ρ : RTy} {W : cat.Ob} (D : Set (TA ρ W))
    (hm : exactRaw D ∈ Set.range (model.incl ρ W)) : RD W ρ := Classical.choose hm

theorem incl_exactEntity {ρ : RTy} {W : cat.Ob} (D : Set (TA ρ W))
    (hm : exactRaw D ∈ Set.range (model.incl ρ W)) :
    model.incl ρ W (exactEntity D hm) = exactRaw D := Classical.choose_spec hm

theorem exactEntity_pinned_of_agree {ρ : RTy} {W : cat.Ob} {S : Set (cat.X W)}
    (D : Set (TA ρ W)) (hm : exactRaw D ∈ Set.range (model.incl ρ W))
    (hp : ∀ V (h i : W ⟶ V), AgreeOn cat.De (W := W) S h i → ∀ a : TA ρ V,
      exactRaw D ⟨V, a, h⟩ ↔ exactRaw D ⟨V, a, i⟩) :
    model.PinnedO (.rel ρ) (W := W) S (model.incl ρ W (exactEntity D hm)) := by
  rw [incl_exactEntity]
  exact exactRaw_pinned_of_agree D hp

@[simp] theorem prof_exactEntity {ρ : RTy} {W V : cat.Ob} (D : Set (TA ρ W))
    (hm : exactRaw D ∈ Set.range (model.incl ρ W)) (h : W ⟶ V) (a : TA ρ V) :
    prof (exactEntity D hm) h a ↔ ∃ b ∈ D, Args.map model.inner ρ h b = a := by
  unfold prof
  rw [incl_exactEntity]
  rfl

@[simp] theorem prof_exactEntity_here {ρ : RTy} {W : cat.Ob} (D : Set (TA ρ W))
    (hm : exactRaw D ∈ Set.range (model.incl ρ W)) (a : TA ρ W) :
    prof (exactEntity D hm) (𝟙 W) a ↔ a ∈ D := by
  rw [prof_exactEntity]
  simp only [Args.map_id]
  simp

theorem exactEntity_exact {ρ : RTy} {W : cat.Ob} (D : Set (TA ρ W))
    (hm : exactRaw D ∈ Set.range (model.incl ρ W)) : ExactImage (exactEntity D hm) := by
  intro V h a
  rw [prof_exactEntity]
  simp only [prof_exactEntity_here]

theorem exactEntity_rigid {ρ : RTy} {W : cat.Ob} (D : Set (TA ρ W))
    (hm : exactRaw D ∈ Set.range (model.incl ρ W)) : RigidData (exactEntity D hm) :=
  exact_rigid _ (exactEntity_exact D hm)

/-- Stable root sets have admitted exact-image profiles at every relation type. -/
theorem root_exact_mem {ρ : RTy} {S : Set (cat.X A)} (hS : S.Finite)
    (D : Set (TA ρ A))
    (hD : ∀ (u : A ⟶ A), AgreeOn cat.De (W := A) S u (𝟙 A) →
      ∀ a ∈ D, Args.map model.inner ρ u a ∈ D) :
    exactRaw D ∈ Set.range (model.incl ρ A) := by
  apply exactRaw_mem_of_agree hS D
  intro V h i ha a
  constructor
  · rintro ⟨b, hb, hba⟩
    obtain ⟨M, hM, hpM⟩ := tuple_pin ρ A b
    obtain ⟨u, hu, hfactor⟩ := root_factor i h hS hM (ha.symm cat.De)
    have hfix : AgreeOn cat.De (W := A) S u (𝟙 A) := by
      intro x hx
      exact hu x hx
    refine ⟨Args.map model.inner ρ u b, hD u hfix b hb, ?_⟩
    rw [← Args.map_comp, hpM V (u ≫ i) h hfactor]
    exact hba
  · rintro ⟨b, hb, hba⟩
    obtain ⟨M, hM, hpM⟩ := tuple_pin ρ A b
    obtain ⟨u, hu, hfactor⟩ := root_factor h i hS hM ha
    have hfix : AgreeOn cat.De (W := A) S u (𝟙 A) := by
      intro x hx
      exact hu x hx
    refine ⟨Args.map model.inner ρ u b, hD u hfix b hb, ?_⟩
    rw [← Args.map_comp, hpM V (u ≫ h) i hfactor]
    exact hba

end
end Classicism.Meta.Intensional.FiniteCompression
