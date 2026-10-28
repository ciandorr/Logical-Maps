import Classicism.Models.FiniteCompressionPower
import Classicism.Models.FiniteCompressionWitness

/-!
# Full Tame Rigidity and Rigid Power do not entail Weakly Rigid Power

Original model certificate (misc), 23 October 2026.
Source: research/2026-10-23/finite-compression-labelled-entrance.md,
sections 2–8 (unpaginated).

TR and RP are full schemas at the root; the failure is WRP at et.
No Barcan or boxed RP premise occurs. Every profile lemma is instantiated
with the value of an admitted object-language term.
-/

namespace Classicism.Meta.Intensional.FiniteCompression

open CategoryTheory AxiomSet
noncomputable section

theorem weak_power_not_weak : ¬ WeakData (weakPowerEntity (𝟙 A) oldBound) := by
  intro hwQ
  let Q := weakPowerEntity (𝟙 A) oldBound
  let Z := rigidTestEntity (𝟙 A) et
  have ht : ∀ a : TA (.arr (.rel et) .t) A, prof Q (𝟙 A) a →
      ∀ {V : cat.Ob} (h : A ⟶ V),
        prof Z h (Args.map model.inner (.arr (.rel et) .t) h a) := by
    rintro ⟨X, xu⟩ hx V h
    cases xu
    have hwX : WeakData X := ((prof_weakPowerEntity (𝟙 A) oldBound (𝟙 A) X).1 hx).1
    have hrX : RigidData X := weak_rigid_at_root X hwX
    change prof Z h ((model.inner (.rel et)).map h X, PUnit.unit)
    exact (prof_rigidTestEntity (𝟙 A) h _).2 (rigid_map hrX h)
  have hmember : prof Q entrance (fibreEntity (.block 0), PUnit.unit) :=
    (prof_weakPowerEntity (𝟙 A) oldBound entrance _).2
      ⟨block_weak 0, fibre_below_oldBound (.block 0)⟩
  have hr : RigidData (fibreEntity (.block 0)) :=
    (prof_rigidTestEntity (𝟙 A) entrance _).1 ((hwQ.2 Z ht) hmember)
  exact block_not_rigid hr

theorem not_weakly_rigid_power_et :
    ¬ model.HoldsSentence (P.WeaklyRigidPower.quoted et) := by
  intro hp
  exact weak_power_not_weak
    (((holds_weaklyRigidPower_iff (𝟙 A) et).1 hp) oldBound (rigid_weak oldBound_rigid))

theorem holds_tame_schema : model.HoldsAx P.TameRigidity.schema := by
  rintro _ ⟨ρ, _, rfl⟩
  exact tame_at_root ρ

abbrev Background : AxiomSet Signature.pure :=
  P.TameRigidity.schema ∪ P.RigidPower.schema

theorem holds_background : model.HoldsAx Background :=
  model.holdsAx_union holds_tame_schema holds_rigid_power_schema

theorem background_consistent : Background.Consistent :=
  AxiomSet.Consistent.of_model model isModel holds_background

theorem not_theorem_weakly_rigid_power_et :
    ¬ Theorem (Classicism.Meta.C.axioms ∪ Background) (P.WeaklyRigidPower.quoted et) :=
  model.not_theorem_of_model isModel holds_background not_weakly_rigid_power_et

theorem not_entails_weakly_rigid_power : ¬ (Background ⟹ P.WeaklyRigidPower.schema) :=
  fun h => not_theorem_weakly_rigid_power_et (h _ ⟨et, ⟨trivial, trivial⟩, rfl⟩)

/-- The complete concrete countermodel, with both positive principles at
every admitted relational type and failure of the official WRP_et sentence. -/
theorem central_countermodel :
    model.IsModel ∧ model.HoldsAx P.TameRigidity.schema ∧
      model.HoldsAx P.RigidPower.schema ∧
        ¬ model.HoldsSentence (P.WeaklyRigidPower.quoted et) :=
  ⟨isModel, holds_tame_schema, holds_rigid_power_schema, not_weakly_rigid_power_et⟩

end
end Classicism.Meta.Intensional.FiniteCompression
