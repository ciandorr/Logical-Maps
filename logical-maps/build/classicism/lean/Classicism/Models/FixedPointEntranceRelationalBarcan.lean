import Classicism.Models.FixedPointEntranceBarcan

/-!
# Barcan fails at every relational argument type

Original formalization (misc), 23 October 2026. Source:
`research/2026-10-22/notes/fixed-point-entrance-cone.md`, section 6
(unpaginated). The external equality proposition is lifted to a constant
relation at each relational type. Explicit empty relations inhabit all
argument types, so the concrete collapse still changes each lifted witness.
The root predicate of endomorphism-fixed entities supplies the BF failure.
-/

namespace Classicism.Meta.Intensional.FixedPointEntrance.Qualitative.RelationalBarcan

open CategoryTheory
noncomputable section

def emptyRelation (ρ : RTy) (W : cone.Ob) : model.Dom W (.rel ρ) :=
  ⟨∅, ⟨∅, Set.finite_empty, fun _ _ _ _ => rfl⟩,
    fun _ _ _ _ _ h => False.elim h⟩

def defaultValue : (σ : Ty) → (W : cone.Ob) → model.Dom W σ
  | .e, _ => PUnit.unit
  | .var _, _ => PUnit.unit
  | .rel ρ, W => emptyRelation ρ W

def defaultArgs : (ρ : RTy) → (W : cone.Ob) → Args model.inner ρ W
  | .t, _ => PUnit.unit
  | .arr σ ρ, W => (defaultValue σ W, defaultArgs ρ W)

def equalityRaw (ρ : RTy) {W : cone.Ob} (a b : cone.De.obj W) :
    Intension model.inner ρ W :=
  fun p => cone.De.map p.2.2 a = cone.De.map p.2.2 b

theorem equalityRaw_mem (ρ : RTy) {W : cone.Ob} (a b : cone.De.obj W) :
    equalityRaw ρ a b ∈ Set.range (model.incl ρ W) := by
  apply (SymmetricExternal.mem_range_symIncl cone.De pointAction (syms tail)
    (PinIdeal.fin cone.De) ρ W (equalityRaw ρ a b)).2
  refine ⟨⟨{a, b}, (Set.finite_singleton b).insert a, ?_⟩, ?_⟩
  · intro V h i hag
    have ha := hag a (by simp : a ∈ ({a, b} : Set (cone.De.obj W)))
    have hb := hag b (by simp : b ∈ ({a, b} : Set (cone.De.obj W)))
    ext ⟨U, x, k⟩
    change (cone.De.map k (cone.De.map h a) = cone.De.map k (cone.De.map h b)) ↔
      (cone.De.map k (cone.De.map i a) = cone.De.map k (cone.De.map i b))
    rw [ha, hb]
  · intro V x k g _ he
    change cone.De.map g (cone.De.map k a) = cone.De.map g (cone.De.map k b)
    exact congrArg (cone.De.map g) he

def witness (ρ : RTy) : model.Dom (B tail) (.rel ρ) :=
  Classical.choose (equalityRaw_mem ρ Barcan.nodeZero Barcan.nodeOne)

theorem incl_witness (ρ : RTy) :
    model.incl ρ (B tail) (witness ρ) = equalityRaw ρ Barcan.nodeZero Barcan.nodeOne :=
  Classical.choose_spec (equalityRaw_mem ρ Barcan.nodeZero Barcan.nodeOne)

theorem witness_changed (ρ : RTy) :
    (model.inner (.rel ρ)).map collapse (witness ρ) ≠ witness ρ := by
  intro he
  have hm : (⟨B tail, defaultArgs ρ (B tail), 𝟙 (B tail)⟩ :
      Tuple model.inner ρ (B tail)) ∈
      model.incl ρ (B tail) ((model.inner (.rel ρ)).map collapse (witness ρ)) := by
    rw [model.incl_map, Intension.mem_map, Category.comp_id, incl_witness]
    rfl
  rw [he, incl_witness] at hm
  change cone.De.map (𝟙 (B tail)) Barcan.nodeZero =
    cone.De.map (𝟙 (B tail)) Barcan.nodeOne at hm
  rw [cone.De.map_id_apply (B tail) Barcan.nodeZero,
    cone.De.map_id_apply (B tail) Barcan.nodeOne] at hm
  exact Nat.zero_ne_one (QualitativeLinks.Node.point.inj (Option.some.inj hm))

def FixedAt (ρ : RTy) (W : cone.Ob) (q : model.Dom W (.rel ρ)) : Prop :=
  ∀ m : W ⟶ W, (model.inner (.rel ρ)).map m q = q

def fixedRaw (ρ : RTy) : Intension model.inner (.arr (.rel ρ) .t) (A tail) :=
  fun p => FixedAt ρ p.1 p.2.1.1

theorem fixedRaw_mem (ρ : RTy) :
    fixedRaw ρ ∈ Set.range (model.incl (.arr (.rel ρ) .t) (A tail)) := by
  apply (SymmetricExternal.mem_range_symIncl cone.De pointAction (syms tail)
    (PinIdeal.fin cone.De) (.arr (.rel ρ) .t) (A tail) (fixedRaw ρ)).2
  refine ⟨⟨∅, Set.finite_empty, ?_⟩, ?_⟩
  · intro V h i _
    have he : h = i := (root_hom_subsingleton tail V).elim h i
    subst i
    rfl
  · intro V a k g _ ha
    change FixedAt ρ V a.1 at ha
    change FixedAt ρ V ((model.inner (.rel ρ)).map g a.1)
    rw [ha g]
    exact ha

theorem not_barcan_relational (ρ : RTy) :
    ¬ model.HoldsSentence (P.Barcan.quoted (.rel ρ)) := by
  obtain ⟨X, hX⟩ := fixedRaw_mem ρ
  change ¬ model.Holds (𝟙 (A tail)) (Sentence.bf (.rel ρ)) .nil
  refine model.not_holds_bf_of isModel (𝟙 (A tail)) X
    (fun q V h => ?_) (entrance tail) (witness ρ) ?_
  · rw [hX]
    intro m
    have he : h ≫ m = h := (root_hom_subsingleton tail V).elim _ _
    have hm := congrArg (fun k : A tail ⟶ V => (model.inner (.rel ρ)).map k q) he
    rw [Functor.map_comp] at hm
    exact hm
  · rw [hX]
    change ¬ FixedAt ρ (B tail) (witness ρ)
    exact fun hw => witness_changed ρ (hw collapse)

end
end Classicism.Meta.Intensional.FixedPointEntrance.Qualitative.RelationalBarcan
