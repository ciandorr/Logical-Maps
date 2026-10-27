import Classicism.Paper
import Classicism.Background.Necessity

/-!
# Finite cardinalities and countability

The Background of `topics/classicism` defines, at a type `σ`,

    𝟎_σ                  := λX. ∀u. ¬Xu
    Suc_σ(Z)             := λX. ∃y. Xy ∧ Z(λu. Xu ∧ u ≠ y)
    FiniteCardinality_σ(Z) := ∀W. (W𝟎_σ ∧ ∀Y. WY → W(Suc_σ Y)) → WZ

so `𝟎_σ` is the cardinality of the empty property, `Suc_σ` adds one, and the finite
cardinalities are those reached from `𝟎_σ` by finitely many successors, in the
impredicative sense: they have every property of cardinalities that `𝟎_σ` has and that
passes from a cardinality to its successor. Every type here ends in `t`, so no type `σσ` is
needed. The Axioms of Infinity (`Principles.lean`) say that no finite cardinality holds of
the universal property.

Following Goodsell's *Arithmetic is Necessary*, the numbers counted at a type `σ` are its
finite cardinalities, of type `ν_σ := (σ → t) → t`, and a property `X` is countable
relative to `σ` when it injects into them:

    Ctbl_{σ,τ}(X) := ∃R^{τν_σt}. ∀y z. Xy ∧ Xz → ((∃n ∈ ℕ_σ. Ryn ∧ Rzn) ↔ y = z)

with `n ∈ ℕ_σ` for `FiniteCardinality_σ(n)`. Countable Boolean Completeness uses it, as a
schema in `σ`.

The lemmas below are the two of the write-up for
`possible-infinity-t-and-bf-t-imply-axiom-of-infinity-t`: finite cardinalities respect
coextension (Lemma A, `finiteCardinality_coext`), and under BF at the type a finite count is
necessary, of a property including the one counted (Lemma B, `finite_count_necessary`).
-/

namespace Classicism

/-- `𝟎_σ := λX. ∀u. ¬Xu`, the cardinality of the empty property. -/
def ZeroCard (σ : Type) [Ty σ] : (σ → Prop) → Prop := λ X ↦ ∀ u, ¬ X u

/-- `Suc_σ Z := λX. ∃y. Xy ∧ Z(λu. Xu ∧ u ≠ y)`, one more than the cardinality `Z`. -/
def SucCard {σ : Type} [Ty σ] (Z : (σ → Prop) → Prop) : (σ → Prop) → Prop :=
  λ X ↦ ∃ y, X y ∧ Z (λ u ↦ X u ∧ u ≠ y)

/-- `FiniteCardinality_σ(Z)`: `Z` has every property of cardinalities that `𝟎_σ` has and
that passes from a cardinality to its successor. -/
def FiniteCardinality {σ : Type} [Ty σ] (Z : (σ → Prop) → Prop) : Prop :=
  ∀ W : ((σ → Prop) → Prop) → Prop, (W (ZeroCard σ) ∧ ∀ Y, W Y → W (SucCard Y)) → W Z

/-- `Ctbl_{σ,τ}(X)`: `X` injects into the natural numbers counted at `σ`, the finite
cardinalities of properties of type `σ`. -/
def Ctbl (σ : Type) [Ty σ] {τ : Type} [Ty τ] (X : τ → Prop) : Prop :=
  ∃ R : τ → ((σ → Prop) → Prop) → Prop, ∀ y z : τ, X y ∧ X z →
    ((∃ n, FiniteCardinality n ∧ R y n ∧ R z n) ↔ y = z)

section lemmas

variable {σ : Type} [Ty σ]

/-- `𝟎` is a finite cardinality. -/
theorem finiteCardinality_zero : FiniteCardinality (ZeroCard σ) := fun _ hW => hW.1

/-- The successor of a finite cardinality is one. -/
theorem finiteCardinality_suc (Z : (σ → Prop) → Prop) (hZ : FiniteCardinality Z) :
    FiniteCardinality (SucCard Z) := fun W hW => hW.2 Z (hZ W hW)

/-- **Finite cardinalities respect coextension** (Lemma A): if `Z` is finite and `ZX`,
then `ZX'` for every `X'` coextensive with `X`. By the induction `FiniteCardinality`
provides; `𝟎` and `Suc` are defined by quantification over instances. -/
theorem finiteCardinality_coext (Z : (σ → Prop) → Prop) (hZ : FiniteCardinality Z) :
    ∀ X X' : σ → Prop, Z X → (∀ u, X u ↔ X' u) → Z X' :=
  hZ (λ Z ↦ ∀ X X' : σ → Prop, Z X → (∀ u, X u ↔ X' u) → Z X')
    ⟨fun _ _ hX h u hu => hX u ((h u).2 hu),
     fun _ hY _ _ hX h => hX.elim fun y hy =>
       ⟨y, (h y).1 hy.1, hY _ _ hy.2 fun u =>
         ⟨fun hu => ⟨(h u).1 hu.1, hu.2⟩, fun hu => ⟨(h u).2 hu.1, hu.2⟩⟩⟩⟩

/-- The step of Lemma B, a theorem of `C`: a finite cardinality of a property including `X`
less `y` gives one of a property including `X`, either the same or, with `y` added, its
successor. -/
theorem finite_superset_step (X : σ → Prop) (y : σ) :
    (∃ Z', FiniteCardinality Z' ∧ ∃ X', Z' X' ∧ ∀ u, (X u ∧ u ≠ y) → X' u) →
    ∃ Z'', FiniteCardinality Z'' ∧ ∃ X'', Z'' X'' ∧ ∀ u, X u → X'' u :=
  fun h => h.elim fun Z' hZ' => hZ'.2.elim fun X' hX' =>
    (em (X' y)).elim
      (fun hy => ⟨Z', hZ'.1, X', hX'.1, fun u hu =>
        (em (u = y)).elim (fun e => e ▸ hy) (fun ne => hX'.2 u ⟨hu, ne⟩)⟩)
      (fun hy => ⟨SucCard Z', finiteCardinality_suc Z' hZ'.1, λ u ↦ X' u ∨ u = y,
        ⟨y, Or.inr rfl, finiteCardinality_coext Z' hZ'.1 X' _ hX'.1 fun _ =>
          ⟨fun hu => ⟨Or.inl hu, fun e => hy (e ▸ hu)⟩,
           fun hu => hu.1.elim id (fun e => absurd e hu.2)⟩⟩,
        fun u hu => (em (u = y)).elim Or.inr (fun ne => Or.inl (hX'.2 u ⟨hu, ne⟩))⟩)

/-- **A finite count is necessary, under BF** (Lemma B): if a finite cardinality holds of
`X`, and what is not `X` is necessarily not `X`, then necessarily some finite cardinality
holds of a property including `X`. BF at the type is used in the base case only. -/
theorem finite_count_necessary (bf : ∀ X : σ → Prop, (∀ x, □ (X x)) → □ (∀ x, X x))
    (Z : (σ → Prop) → Prop) (hZ : FiniteCardinality Z) :
    ∀ X : σ → Prop, Z X → (∀ u, ¬ X u → □ (¬ X u)) →
      □ (∃ Z', FiniteCardinality Z' ∧ ∃ X', Z' X' ∧ ∀ u, X u → X' u) :=
  (hZ (λ Z ↦ FiniteCardinality Z ∧ ∀ X : σ → Prop, Z X → (∀ u, ¬ X u → □ (¬ X u)) →
      □ (∃ Z', FiniteCardinality Z' ∧ ∃ X', Z' X' ∧ ∀ u, X u → X' u))
    ⟨⟨finiteCardinality_zero, fun X hX hc =>
        modal_K _ _ (nec% (fun (h : ∀ u, ¬ X u) =>
          ⟨ZeroCard σ, finiteCardinality_zero, X, h, fun _ hu => hu⟩))
          (bf (λ u ↦ ¬ X u) fun u => hc u (hX u))⟩,
     fun Y hY => ⟨finiteCardinality_suc Y hY.1, fun X hX hc => hX.elim fun y hy =>
       modal_K _ _ (nec% (finite_superset_step X y))
         (hY.2 _ hy.2 fun u hu => (em (X u)).elim
           (fun hXu => modal_K _ _ (nec% (fun (e : u = y) (h : X u ∧ u ≠ y) => h.2 e))
             (necessity_of_identity u y ((em (u = y)).elim id fun ne => absurd ⟨hXu, ne⟩ hu)))
           (fun hXu => modal_K _ _ (nec% (fun (h : ¬ X u) (h' : X u ∧ u ≠ y) => h h'.1)) (hc u hXu)))⟩⟩).2

end lemmas

end Classicism
