import Classicism.Paper
import Classicism.Background.Rigidity
import Classicism.Background.Lattice
import Classicism.Background.Atoms

/-!
# Principles of the map's category `comprehension`

Each says that every relation of the type, including a proposition, is coextensive with
one of the stated kind. The map's `∀ᵀʸ σ̄` over argument tuples is the parameter `τ`,
since a relational type *is* a tuple type ending in `t`. See `Classicism/Principles.lean`
for how a principle is stated and where its forms go.
-/

namespace Classicism.P
open Classicism.Paper

/-- `rigid-comprehension-r` at `τ`. -/
def RigidComprehension (τ : Type) [Rel τ] : Prop :=
  ∀ X : τ, ∃ Y : τ, Rigid Y ∧ coext X Y
/-- `necessary-rigid-comprehension-r` at `τ`: the instance boxed. -/
def NecRigidComprehension (τ : Type) [Rel τ] : Prop := □ (RigidComprehension τ)
/-- `weak-rigid-comprehension-r` at `τ`: every relation is coextensive with a weakly
persistent and weakly inextensible one. -/
def WeakRigidComprehension (τ : Type) [Rel τ] : Prop :=
  ∀ X : τ, ∃ Y : τ, WeaklyRigid Y ∧ coext X Y
/-- `weak-rigid-comprehension-r`, form `persistent`, at `τ`: every relation is coextensive
with a persistent and weakly inextensible one. -/
def WeakRigidComprehensionPersistent (τ : Type) [Rel τ] : Prop :=
  ∀ X : τ, ∃ Y : τ, (Persistent Y ∧ WeaklyInextensible Y) ∧ coext X Y
/-- `persistent-comprehension-r` at `τ`. -/
def PersistentComprehension (τ : Type) [Rel τ] : Prop :=
  ∀ X : τ, ∃ Y : τ, Persistent Y ∧ coext X Y
/-- `inextensible-comprehension-r` at `τ`. -/
def InextensibleComprehension (τ : Type) [Rel τ] : Prop :=
  ∀ X : τ, ∃ Y : τ, Inextensible Y ∧ coext X Y
/-- `weakly-inextensible-comprehension-r` at `τ`: every relation, including a proposition,
is coextensive with a weakly inextensible one. -/
def WeaklyInextensibleComprehension (τ : Type) [Rel τ] : Prop :=
  ∀ X : τ, ∃ Y : τ, WeaklyInextensible Y ∧ coext X Y
/-- `necessary-weakly-inextensible-comprehension-r` at `τ`: the instance boxed. -/
def NecWeaklyInextensibleComprehension (τ : Type) [Rel τ] : Prop :=
  □ (WeaklyInextensibleComprehension τ)

/-- `gallin-extensional-comprehension-r` at `τ`: every relation is coextensive with one
that is persistent and has a persistent pointwise negation. Gallin's rigidity convention. -/
def GallinExtensionalComprehension (τ : Type) [Rel τ] : Prop :=
  ∀ X : τ, ∃ Y : τ, Persistent Y ∧ Persistent (¬ Y) ∧ coext X Y
/-- `necessary-gallin-extensional-comprehension-r` at `τ`: the instance boxed. -/
def NecGallinExtensionalComprehension (τ : Type) [Rel τ] : Prop :=
  □ (GallinExtensionalComprehension τ)

/-- `necessary-weak-rigid-comprehension-r` at `τ`: the instance boxed. -/
def NecWeakRigidComprehension (τ : Type) [Rel τ] : Prop := □ (WeakRigidComprehension τ)
/-- `necessary-weak-rigid-comprehension-r`, form `persistent`, at `τ`: that form, boxed. -/
def NecWeakRigidComprehensionPersistent (τ : Type) [Rel τ] : Prop :=
  □ (WeakRigidComprehensionPersistent τ)

section
variable {τ : Type} [Rel τ] [Pointwise τ]

/-- `weak-rigid-comprehension-r` to its persistent form: a weakly rigid relation is persistent
(`persistent_of_weaklyRigid`). -/
theorem WeakRigidComprehension.to_persistent :
    WeakRigidComprehension τ → WeakRigidComprehensionPersistent τ :=
  fun wrc X => (wrc X).elim fun Y hY => ⟨Y, ⟨persistent_of_weaklyRigid hY.1, hY.1.2⟩, hY.2⟩

/-- `weak-rigid-comprehension-r` from its persistent form: `T` strips persistence to weak
persistence. -/
theorem WeakRigidComprehension.of_persistent :
    WeakRigidComprehensionPersistent τ → WeakRigidComprehension τ :=
  fun wrc X => (wrc X).elim fun Y hY => ⟨Y, ⟨weaklyPersistent_of_persistent hY.1.1, hY.1.2⟩, hY.2⟩

/-- `necessary-weak-rigid-comprehension-r` to its persistent form. -/
theorem NecWeakRigidComprehension.to_persistent :
    NecWeakRigidComprehension τ → NecWeakRigidComprehensionPersistent τ :=
  modal_K _ _ (nec% (WeakRigidComprehension.to_persistent (τ := τ)))
/-- `necessary-weak-rigid-comprehension-r` from its persistent form. -/
theorem NecWeakRigidComprehension.of_persistent :
    NecWeakRigidComprehensionPersistent τ → NecWeakRigidComprehension τ :=
  modal_K _ _ (nec% (WeakRigidComprehension.of_persistent (τ := τ)))

end
/-- `necessary-persistent-comprehension-r` at `τ`: the instance boxed. -/
def NecPersistentComprehension (τ : Type) [Rel τ] : Prop := □ (PersistentComprehension τ)
/-- `necessary-inextensible-comprehension-r` at `τ`: the instance boxed. -/
def NecInextensibleComprehension (τ : Type) [Rel τ] : Prop := □ (InextensibleComprehension τ)

/-- `tame-rigidity-r` at `τ`: every weakly rigid relation, including a proposition, is
rigid. -/
def TameRigidity (τ : Type) [Rel τ] : Prop := ∀ F : τ, WeaklyRigid F → Rigid F
/-- `necessary-tame-rigidity-r` at `τ`: the instance boxed. -/
def NecTameRigidity (τ : Type) [Rel τ] : Prop := □ (TameRigidity τ)

/-- `rigid-power-r` at `τ`: if `F` is rigid, so is the property of being a rigid relation
entailing it, `λX. Rigid(X) ∧ X ≤ F`. -/
def RigidPower (τ : Type) [Rel τ] : Prop :=
  ∀ F : τ, Rigid F → Rigid (fun X : τ => Rigid X ∧ X ≤ F)
/-- `necessary-rigid-power-r` at `τ`: the instance boxed. -/
def NecRigidPower (τ : Type) [Rel τ] : Prop := □ (RigidPower τ)

/-- `weakly-rigid-power-r` at `τ`: if `F` is weakly rigid, so is the property of being a
weakly rigid relation entailing it, `λX. WeaklyRigid(X) ∧ X ≤ F`. -/
def WeaklyRigidPower (τ : Type) [Rel τ] : Prop :=
  ∀ F : τ, WeaklyRigid F → WeaklyRigid (fun X : τ => WeaklyRigid X ∧ X ≤ F)
/-- `necessary-weakly-rigid-power-r` at `τ`: the instance boxed. -/
def NecWeaklyRigidPower (τ : Type) [Rel τ] : Prop := □ (WeaklyRigidPower τ)

/-- `rigid-rigidity-r` at `τ`: being rigid is a rigid property of relations of type `τ`. -/
def RigidRigidity (τ : Type) [Rel τ] : Prop := Rigid (fun X : τ => Rigid X)
/-- `necessary-rigid-rigidity-r` at `τ`: the instance boxed. -/
def NecRigidRigidity (τ : Type) [Rel τ] : Prop := □ (RigidRigidity τ)

/-- `weakly-rigid-weak-rigidity-r` at `τ`: being weakly rigid is a weakly rigid property of
relations of type `τ`. -/
def WeaklyRigidWeakRigidity (τ : Type) [Rel τ] : Prop := WeaklyRigid (fun X : τ => WeaklyRigid X)
/-- `necessary-weakly-rigid-weak-rigidity-r` at `τ`: the instance boxed. -/
def NecWeaklyRigidWeakRigidity (τ : Type) [Rel τ] : Prop := □ (WeaklyRigidWeakRigidity τ)

end Classicism.P
