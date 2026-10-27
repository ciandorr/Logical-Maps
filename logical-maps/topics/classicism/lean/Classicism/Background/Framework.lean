import Classicism.Core

/-!
# Background: framework and conventions

The lemmas of the Background page *Framework and conventions*: two theorems of `H`,
Existence and Ordinary Comprehension.
-/

namespace Classicism

/-! ### Existence

`H` proves `∃x.x = x` at every type. At every `R`-type other than `e` a closed term is
available, so Existence there is a theorem of `C⁻` and needs no axiom. At `e` it is the
axiom `e_exists`, and these two theorems are the only place in the library where the
distinction can arise (Classicism, §1.1 and nn. 12–13). -/

/-- Existence at every relational type: the closed term `⊤_τ` is the witness. A theorem
of `C⁻`; its axiom report does not name `e_exists`. -/
theorem existence_rel {τ : Type} [Rel τ] : ∃ x : τ, x = x := ⟨Rel.top τ, rfl⟩

/-- Existence at `e`, the one instance `H⁻` does not prove. This is the only theorem in
the library whose axiom report names `e_exists`. -/
theorem existence_e : ∃ x : e, x = x := e_exists

/-! ### Ordinary Comprehension

The schema is in a formula `P`, which no shallow statement can quantify over. Its instance
for `P` is the theorem below at the λ-term `λȳ. P`, which is how the object language proves
it: `λȳ. P` is the witness, by β-conversion. -/

/-- Ordinary Comprehension, nullary: some proposition is equivalent to `P`. -/
theorem ordinary_comprehension_nullary (P : Prop) : ∃ X : Prop, X ↔ P := ⟨P, Iff.rfl⟩

/-- Ordinary Comprehension, one distinguished variable. -/
theorem ordinary_comprehension {σ : Type} [Ty σ] (P : σ → Prop) :
    ∃ X : σ → Prop, ∀ y, X y ↔ P y := ⟨fun y => P y, fun _ => Iff.rfl⟩

/-- Ordinary Comprehension, two distinguished variables. -/
theorem ordinary_comprehension₂ {σ₁ σ₂ : Type} [Ty σ₁] [Ty σ₂] (P : σ₁ → σ₂ → Prop) :
    ∃ X : σ₁ → σ₂ → Prop, ∀ y₁ y₂, X y₁ y₂ ↔ P y₁ y₂ := ⟨fun y₁ y₂ => P y₁ y₂, fun _ _ => Iff.rfl⟩

end Classicism
