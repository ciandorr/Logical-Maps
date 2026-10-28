import Classicism.Models.FixedPointEntranceModel
import Classicism.Semantics.FullModels

/-!
# Root Relational Choice in the fixed-point entrance model

Original formalization (misc), 23 October 2026, of
`research/2026-10-22/notes/fixed-point-entrance-cone.md`, sections 1--3
(unpaginated). Any actual extension is represented by the intension with
that extension at the root and an empty future extension. Empty pinning and
symmetry are verified directly. Metatheoretic choice supplies the graph of
a selector for an actual serial relation, yielding the official Relational
Choice sentence for arbitrary input and output types, including individual
output. No global fullness or Choice verdict is assumed, and no boxed
Relational Choice conclusion is asserted.
-/

namespace Classicism.Meta.Intensional.FixedPointEntrance.Qualitative.RelationalChoice

open CategoryTheory
noncomputable section

/-- The actual extension D, with no future tuples. -/
def rootOnly {ρ : RTy} (D : Set (Args model.inner ρ (A tail))) :
    Intension model.inner ρ (A tail) :=
  fun p => match p with
  | ⟨false, a, _⟩ => a ∈ D
  | ⟨true, _, _⟩ => False

/-- An arbitrary actual extension with an empty future is admitted. -/
theorem rootOnly_mem {ρ : RTy} (D : Set (Args model.inner ρ (A tail))) :
    rootOnly D ∈ Set.range (model.incl ρ (A tail)) := by
  apply (SymmetricExternal.mem_range_symIncl cone.De pointAction (syms tail)
    (PinIdeal.fin cone.De) ρ (A tail) (rootOnly D)).2
  refine ⟨⟨∅, Set.finite_empty, ?_⟩, ?_⟩
  · intro V h i _
    have he : h = i := (root_hom_subsingleton tail V).elim h i
    subst i
    rfl
  · intro V a k g _ ha
    cases V with
    | false =>
      have he := root_endo_unique tail g
      subst g
      change Args model.inner ρ (A tail) at a
      change Args.map model.inner ρ (𝟙 (A tail)) a ∈ D
      rw [Args.map_id]
      exact ha
    | true => exact False.elim ha

/-- Extensional fullness is proved at the root, rather than postulated at
every object. The witness has an empty future extension. -/
theorem root_extension_full (ρ : RTy) (D : Set (Args model.inner ρ model.W₀)) :
    ∃ F : model.Dom model.W₀ (.rel ρ),
      (model.incl ρ model.W₀ F).ext' model.inner = D := by
  change Set (Args model.inner ρ (A tail)) at D
  change ∃ F : model.Dom (A tail) (.rel ρ),
    (model.incl ρ (A tail) F).ext' model.inner = D
  obtain ⟨F, hF⟩ := rootOnly_mem D
  refine ⟨F, ?_⟩
  ext a
  rw [hF]
  rfl

/-- The official unboxed Relational Choice instance at the root. Both
type parameters are unrestricted Ty, so output e is included. -/
theorem relational_choice_at_root (σ τ : Ty) :
    model.HoldsSentence (P.RelationalChoice.quoted σ τ) := by
  simp only [Premodel.HoldsSentence, P.RelationalChoice.quoted,
    model.holds_forall isModel, model.holds_imp isModel, model.holds_exists isModel,
    model.holds_conj isModel, Premodel.holds_app_var2,
    Premodel.holds_eq_var isModel, IEnv.get]
  intro U hU
  choose f hf using hU
  obtain ⟨S, hS⟩ := root_extension_full (.arr σ (.arr τ .t)) {a | a.2.1 = f a.1}
  refine ⟨S, fun x => ⟨f x, ?_, fun z hz => ?_⟩, fun x y hxy => ?_⟩
  · rw [hS]
    rfl
  · rw [hS] at hz
    exact hz.symm
  · rw [hS] at hxy
    have hy : y = f x := hxy
    exact hy ▸ hf x

/-- Every closed input/output instance of the root schema holds. -/
theorem holds_relational_choice_schema : model.HoldsAx P.RelationalChoice.schema := by
  rintro _ ⟨σ, τ, _, _, rfl⟩
  exact relational_choice_at_root σ τ

end
end Classicism.Meta.Intensional.FixedPointEntrance.Qualitative.RelationalChoice
