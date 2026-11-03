import Classicism.Models.Conditions
import Classicism.Semantics.IntensionalFull
import Mathlib.CategoryTheory.SingleObj
import Mathlib.SetTheory.Cardinal.Finite

/-!
# The full Henkin models

The map's group `henkin`: the one-world full Henkin interpretation of Classicism (Definition 3.6,
a model of C by Proposition 3.7), over an individual domain `D`. Here it is the full intensional
action model (`Premodel.full`) on the one-object category of the trivial monoid, `SingleObj Unit`,
whose only arrow is the identity, with individuals `D` and the pure language: there is one world,
and every relational type holds every set of tuples, so every function between the domains.

* `model D`, a model (`isModel`) and full (`full`), hence extensionally full (`extFull`), the
  condition `extensionally-full` that every member meets.
* The group's conditions: `FinitelyManyIndividuals D` (`D` finite) and `SeveralIndividuals D`
  (`D` nontrivial). The topic's conditions met at particular domains: one individual
  (`oneIndividual`, `D` a subsingleton) and infinitely many (`infinitelyManyIndividuals`).
* The group's shared arguments, for every premodel on `SingleObj Unit` where they need no more:
  `extensionality`, since every tuple of an intension is one at the identity arrow, coextensive
  relations are identical (`holds_extensionality`); `functional-choice`, in a full one, a serial
  relation's selecting operation chosen by `Classical.choose` is in the domain
  (`holds_functionalChoice`). The third, `finitely-many-individuals` (with `k` individuals there
  are no `k + 1` distinct ones), is `Premodel.holds_count`, applied in `MapArguments.lean`.

The members: `full-henkin-finite-base` at `Fin 2`, `full-henkin-infinite-base` at `ℕ`,
`full-henkin-singleton-base` at `Unit`. The fourth member, `henkin-without-relational-choice`, is
read in ZF with a serial relation that has no functional subrelation; Lean's metatheory has
choice, so it has no model here. The coalesced sum's components `Coalesced.AllFinite.comp n` are
the models `model (Fin (n + 1))`.
-/

namespace Classicism.Meta.Intensional.Henkin

open CategoryTheory

/-! ### The model -/

/-- The individuals: `D` at the one object. -/
abbrev De (D : Type) : SingleObj Unit ⥤ Type := (Functor.const (SingleObj Unit)).obj D

/-- **The full Henkin model over `D`**: the full intensional action model on the one-object
category of the trivial monoid, with individuals `D`, of the pure language. -/
noncomputable abbrev model (D : Type) [Nonempty D] : Premodel Signature.pure (SingleObj Unit) :=
  Premodel.full (De D) (SingleObj.star Unit) (fun _ => inferInstanceAs (Nonempty D)) (fun c => nomatch c)

variable (D : Type) [Nonempty D]

/-- The individuals are `D`. -/
example : (model D).Dom (model D).W₀ .e = D := rfl

theorem isModel : (model D).IsModel := Premodel.full_isModel _

/-- **The model is full**: every set of tuples is an element of its relational type. -/
theorem full : (model D).Full := fun ρ W => fullIncl_surjective (De D) ρ W

/-- `extensionally-full`. -/
theorem extFull : (model D).ExtFull := Premodel.Full.extFull _ (full D)

/-! ### Conditions -/

/-- The group's condition `finitely-many-individuals`. -/
def FinitelyManyIndividuals : Prop := Finite D

/-- The group's condition `several-individuals`. -/
def SeveralIndividuals : Prop := Nontrivial D

/-- `one-individual`, with a singleton domain. -/
theorem oneIndividual [Subsingleton D] : (model D).OneIndividual :=
  fun _ => (inferInstance : Subsingleton D)

/-- `infinitely-many-individuals`, with an infinite domain. -/
theorem infinitelyManyIndividuals [Infinite D] : (model D).InfinitelyManyIndividuals :=
  inferInstanceAs (Infinite D)

/-- `Fin 2` has two individuals. -/
theorem fin_two_finitelyMany : FinitelyManyIndividuals (Fin 2) := inferInstanceAs (Finite (Fin 2))

theorem fin_two_several : SeveralIndividuals (Fin 2) := inferInstanceAs (Nontrivial (Fin 2))

theorem nat_several : SeveralIndividuals ℕ := inferInstanceAs (Nontrivial ℕ)

theorem unit_finitelyMany : FinitelyManyIndividuals Unit := inferInstanceAs (Finite Unit)

/-! ### One world -/

section OneWorld

variable {B : Premodel Signature.pure (SingleObj Unit)}

/-- With one object and only the identity arrow, every tuple of an intension is a tuple at the
identity arrow. -/
theorem tuple_eq {ρ : RTy} {W : SingleObj Unit} (p : Tuple B.inner ρ W) :
    ∃ a : Args B.inner ρ W, p = ⟨W, a, 𝟙 W⟩ := by
  obtain ⟨V, a, k⟩ := p
  cases V; cases W
  exact ⟨a, by rw [show k = 𝟙 _ from rfl]⟩

/-- So an intension is determined by its extension. -/
theorem incl_eq_of_ext {ρ : RTy} {W : SingleObj Unit} {x y : B.Dom W (.rel ρ)}
    (h : ∀ a : Args B.inner ρ W, (⟨W, a, 𝟙 W⟩ : Tuple B.inner ρ W) ∈ B.incl ρ W x ↔
      (⟨W, a, 𝟙 W⟩ : Tuple B.inner ρ W) ∈ B.incl ρ W y) : x = y := by
  refine B.Incl_injective (.rel ρ) W (Set.ext fun p => ?_)
  obtain ⟨a, rfl⟩ := tuple_eq p
  exact h a

/-- **Extensionality** at `ρ`, at every arrow: coextensive relations are identical. -/
theorem holds_extensionality (M : B.IsModel) {W : SingleObj Unit} (h : B.W₀ ⟶ W) (ρ : RTy) :
    B.Holds h (P.Extensionality.quoted ρ) .nil := by
  simp only [P.Extensionality.quoted, B.holds_forall M, B.holds_imp M, Premodel.holds_coextR M,
    Premodel.holds_eq_var M, Premodel.sem_var, IEnv.get]
  exact fun X Y hXY => incl_eq_of_ext hXY

/-- **Functional Choice** at `σ`, `ρ`, at every arrow of a full model: a serial relation's
extension gives, by choice, a function `f` from `σ` to `ρ`, and the relation whose extension
holds of `x` followed by the arguments of `f x` is in the domain. -/
theorem holds_functionalChoice (M : B.IsModel) (hF : B.Full) {W : SingleObj Unit} (h : B.W₀ ⟶ W)
    (σ : Ty) (ρ : RTy) : B.Holds h (P.FunctionalChoice.quoted σ ρ) .nil := by
  simp only [P.FunctionalChoice.quoted, B.holds_forall M, B.holds_imp M, B.holds_exists M,
    Premodel.holds_app_var2, IEnv.get]
  intro U hU
  choose f hf using hU
  obtain ⟨X, hX⟩ := Premodel.Full.extFull B hF (.arr σ ρ) W
    {a | (⟨W, a.2, 𝟙 W⟩ : Tuple B.inner ρ W) ∈ B.incl ρ W (f a.1)}
  refine ⟨X, fun x => ?_⟩
  have hfx : B.incl ρ W (f x) = (B.incl (.arr σ ρ) W X).app B.inner x := by
    ext p
    obtain ⟨a, rfl⟩ := tuple_eq p
    rw [Intension.mem_app, Functor.map_id_apply]
    have := congrArg (fun E => (x, a) ∈ E) hX
    simp only [Intension.ext', eq_iff_iff, Set.mem_ofPred_eq] at this
    exact this.symm
  rw [B.holds_app h _ _ _ (a' := f x) (by
    show B.incl ρ W (f x) = B.apply (B.incl (.arr σ ρ) W X) (B.Incl σ W x)
    rw [B.apply_Incl]; exact hfx)]
  show _ ∈ B.apply (B.incl _ W U) (B.Incl σ W x)
  rw [B.apply_Incl, Intension.mem_app, Functor.map_id_apply]
  exact hf x

end OneWorld

end Classicism.Meta.Intensional.Henkin
