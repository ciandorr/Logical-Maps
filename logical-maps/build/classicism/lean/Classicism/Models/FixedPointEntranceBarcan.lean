import Classicism.Models.FixedPointEntranceModel
import Classicism.Semantics.FullModels

/-!
# Failure of propositional Barcan at the fixed-point entrance

Original formalization (misc), 23 October 2026, of
`research/2026-10-22/notes/fixed-point-entrance-cone.md`, section 6
(unpaginated). Equality of two external pinning nodes defines an admitted
proposition. The concrete tail collapse changes this proposition. An
admitted root predicate selects exactly propositions fixed by all local
endomorphisms: it holds of every transported root proposition but not of
the displayed tail proposition. This supplies the actual quoted BF_t
counterexample, with no Barcan-failure or fullness assumption.
-/

namespace Classicism.Meta.Intensional.FixedPointEntrance.Qualitative.Barcan

open CategoryTheory
noncomputable section

/-- Equality of two nodes in the external pinning action along each arrow.
The external nodes are not interpreted individuals of the model. -/
def externalEquality {W : cone.Ob} (a b : cone.De.obj W) :
    Intension model.inner .t W :=
  fun p => cone.De.map p.2.2 a = cone.De.map p.2.2 b

theorem externalEquality_mem {W : cone.Ob} (a b : cone.De.obj W) :
    externalEquality a b ∈ Set.range (model.incl .t W) := by
  apply (SymmetricExternal.mem_range_symIncl cone.De pointAction (syms tail)
    (PinIdeal.fin cone.De) .t W (externalEquality a b)).2
  refine ⟨⟨{a, b}, (Set.finite_singleton b).insert a, ?_⟩, ?_⟩
  · intro V h i hag
    have ha : cone.De.map h a = cone.De.map i a := hag a (by simp)
    have hb : cone.De.map h b = cone.De.map i b := hag b (by simp)
    ext ⟨U, x, k⟩
    change (cone.De.map (h ≫ k) a = cone.De.map (h ≫ k) b) ↔
      (cone.De.map (i ≫ k) a = cone.De.map (i ≫ k) b)
    change (cone.De.map k (cone.De.map h a) = cone.De.map k (cone.De.map h b)) ↔
      (cone.De.map k (cone.De.map i a) = cone.De.map k (cone.De.map i b))
    rw [ha, hb]
  · intro V x k g _ he
    change cone.De.map (k ≫ g) a = cone.De.map (k ≫ g) b
    change cone.De.map g (cone.De.map k a) = cone.De.map g (cone.De.map k b)
    exact congrArg (cone.De.map g) he

def equalityEntity {W : cone.Ob} (a b : cone.De.obj W) : model.Dom W (.rel .t) :=
  Classical.choose (externalEquality_mem a b)

theorem incl_equalityEntity {W : cone.Ob} (a b : cone.De.obj W) :
    model.incl .t W (equalityEntity a b) = externalEquality a b :=
  Classical.choose_spec (externalEquality_mem a b)

def nodeZero : cone.De.obj (B tail) := some (QualitativeLinks.Node.point 0)
def nodeOne : cone.De.obj (B tail) := some (QualitativeLinks.Node.point 1)

/-- The distinguished tail proposition: the two marked points have merged. -/
def witness : model.Dom (B tail) (.rel .t) := equalityEntity nodeZero nodeOne

theorem incl_witness : model.incl .t (B tail) witness = externalEquality nodeZero nodeOne :=
  incl_equalityEntity nodeZero nodeOne

theorem witness_false :
    (⟨B tail, PUnit.unit, 𝟙 (B tail)⟩ : Tuple model.inner .t (B tail)) ∉
      model.incl .t (B tail) witness := by
  rw [incl_witness]
  change ¬ cone.De.map (𝟙 (B tail)) nodeZero = cone.De.map (𝟙 (B tail)) nodeOne
  rw [cone.De.map_id_apply (B tail) nodeZero, cone.De.map_id_apply (B tail) nodeOne]
  intro he
  have hn : (0 : Nat) = 1 := QualitativeLinks.Node.point.inj (Option.some.inj he)
  exact Nat.zero_ne_one hn

theorem witness_after_collapse :
    (⟨B tail, PUnit.unit, collapse⟩ : Tuple model.inner .t (B tail)) ∈
      model.incl .t (B tail) witness := by
  rw [incl_witness]
  change some (QualitativeLinks.collapseFn (.point 0)) =
    some (QualitativeLinks.collapseFn (.point 1))
  rfl

theorem witness_changed : (model.inner (.rel .t)).map collapse witness ≠ witness := by
  intro he
  have hm : (⟨B tail, PUnit.unit, 𝟙 (B tail)⟩ : Tuple model.inner .t (B tail)) ∈
      model.incl .t (B tail) ((model.inner (.rel .t)).map collapse witness) := by
    rw [model.incl_map, Intension.mem_map, Category.comp_id]
    exact witness_after_collapse
  rw [he] at hm
  exact witness_false hm

def FixedAt (W : cone.Ob) (q : model.Dom W (.rel .t)) : Prop :=
  ∀ m : W ⟶ W, (model.inner (.rel .t)).map m q = q

/-- At every target, select precisely the propositions fixed by all its
endomorphisms. This is an actual root intension. -/
def fixedRaw : Intension model.inner (.arr (.rel .t) .t) (A tail) :=
  fun p => FixedAt p.1 p.2.1.1

theorem fixedRaw_mem :
    fixedRaw ∈ Set.range (model.incl (.arr (.rel .t) .t) (A tail)) := by
  apply (SymmetricExternal.mem_range_symIncl cone.De pointAction (syms tail)
    (PinIdeal.fin cone.De) (.arr (.rel .t) .t) (A tail) fixedRaw).2
  refine ⟨⟨∅, Set.finite_empty, ?_⟩, ?_⟩
  · intro V h i _
    have he : h = i := (root_hom_subsingleton tail V).elim h i
    subst i
    rfl
  · intro V a k g _ ha
    change FixedAt V a.1 at ha
    change FixedAt V ((model.inner (.rel .t)).map g a.1)
    rw [ha g]
    exact ha

def fixedEntity : model.Dom (A tail) (.rel (.arr (.rel .t) .t)) :=
  Classical.choose fixedRaw_mem

theorem incl_fixedEntity :
    model.incl (.arr (.rel .t) .t) (A tail) fixedEntity = fixedRaw :=
  Classical.choose_spec fixedRaw_mem

theorem transported_root_fixed (q : model.Dom (A tail) (.rel .t))
    {V : cone.Ob} (h : A tail ⟶ V) : FixedAt V ((model.inner (.rel .t)).map h q) := by
  intro m
  have he : h ≫ m = h := (root_hom_subsingleton tail V).elim _ _
  have hm := congrArg (fun k : A tail ⟶ V => (model.inner (.rel .t)).map k q) he
  rw [Functor.map_comp] at hm
  exact hm

/-- The official propositional Barcan sentence fails at the root. -/
theorem not_barcan_t : ¬ model.HoldsSentence (P.Barcan.quoted (.rel .t)) := by
  change ¬ model.Holds (𝟙 (A tail)) (Sentence.bf (.rel .t)) .nil
  refine model.not_holds_bf_of isModel (𝟙 (A tail)) fixedEntity
    (fun q V h => ?_) (entrance tail) witness ?_
  · rw [incl_fixedEntity]
    exact transported_root_fixed q h
  · rw [incl_fixedEntity]
    change ¬ FixedAt (B tail) witness
    intro hw
    exact witness_changed (hw collapse)

end
end Classicism.Meta.Intensional.FixedPointEntrance.Qualitative.Barcan
