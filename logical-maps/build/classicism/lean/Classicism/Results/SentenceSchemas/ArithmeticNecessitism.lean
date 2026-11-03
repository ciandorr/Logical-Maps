import Classicism.Certified.Arithmetic
import Classicism.Results.Consistency.Consistency
import Mathlib.Data.Finite.Prod
import Mathlib.Data.Fintype.EquivFin

/-!
# Arithmetic Necessitism holds vacuously where `□I*` fails

The instance of Arithmetic Necessitism at `σ` is `□I*_σ → …`, so it holds wherever `□I*_σ`
fails. `¬I*_σ` is consistent with `C`: it holds in the full Henkin model on one individual
(`Interp.ofDomain Unit`), where every type is finite. There the numerals `𝟎, Suc 𝟎, …` are
infinitely many numbers in a finite type, so two differ while having the same successor, or a
successor is zero (`not_iStar_of_finite`): were `I*` true, the numerals would be pairwise
distinct, by induction.

* `P.ArithmeticNecessitism.quoted_eq`: the instance at `σ` is `□(IStar.term σ) → …`, the
  quoted `I*_σ` (`Certified/Arithmetic.lean`) boxed.
* `not_iStar_consistent`: `¬I*_σ` is consistent with `C`, at every type.
* `box_iStar_not_theorem`: `I*_σ = ⊤`, that is `□I*_σ`, is not a theorem of `C`.
* `distinctness_entails_arithmeticNecessitism`: **Maximalism (pure), distinctness form,
  gives Arithmetic Necessitism**, vacuously: `I*_σ ≠ ⊤` is one of its instances, and it is
  `¬□I*_σ`. The map's `maximalism-implies-arithmetic-necessitism`.
-/

namespace Classicism

/-- The numerals at `σ`: `𝟎_σ`, `Suc_σ 𝟎_σ`, …. -/
def numeral (σ : Type) [Ty σ] : Nat → (σ → Prop) → Prop
  | 0 => ZeroCard σ
  | n + 1 => SucCard (numeral σ n)

theorem finiteCardinality_numeral (σ : Type) [Ty σ] :
    ∀ n, FiniteCardinality (numeral σ n)
  | 0 => finiteCardinality_zero
  | n + 1 => finiteCardinality_suc _ (finiteCardinality_numeral σ n)

/-- Under `I*`, the numerals are pairwise distinct. -/
theorem numeral_injective (σ : Type) [Ty σ] (h : IStar σ) : Function.Injective (numeral σ) := by
  intro a
  induction a with
  | zero =>
    intro b hb
    cases b with
    | zero => rfl
    | succ b =>
      exact absurd hb ((h _ _ (finiteCardinality_numeral σ b) (finiteCardinality_numeral σ b)).1)
  | succ a ih =>
    intro b hb
    cases b with
    | zero =>
      exact absurd hb.symm
        ((h _ _ (finiteCardinality_numeral σ a) (finiteCardinality_numeral σ a)).1)
    | succ b =>
      exact congrArg _ (ih ((h _ _ (finiteCardinality_numeral σ a)
        (finiteCardinality_numeral σ b)).2 hb))

/-- **`I*` fails at a finite type**: the numerals would be infinitely many distinct
cardinalities, which form a finite type. -/
theorem not_iStar_of_finite (σ : Type) [Ty σ] [Finite σ] : ¬ IStar σ := fun h =>
  not_injective_infinite_finite (numeral σ) (numeral_injective σ h)

end Classicism

namespace Classicism.Meta

open AxiomSet

mutual
  /-- Over one individual every type is finite. -/
  theorem finite_denote_unit : ∀ σ : Ty, Finite (Ty.denote Unit σ)
    | .e => inferInstanceAs (Finite Unit)
    | .rel ρ => finite_rdenote_unit ρ
    | .var _ => inferInstanceAs (Finite Unit)
  /-- Over one individual every relational type is finite. -/
  theorem finite_rdenote_unit : ∀ ρ : RTy, Finite (RTy.denote Unit ρ)
    | .t => inferInstanceAs (Finite Prop)
    | .arr σ ρ => haveI := finite_denote_unit σ; haveI := finite_rdenote_unit ρ; Pi.finite
end

/-- `I*_σ` read over a domain is `I*` at the reading of `σ`. -/
theorem holds_iStar (D : Type) (σ : Ty) :
    Sentence.holds (Interp.ofDomain D) (IStar.term σ) = @IStar (Ty.denote D σ) ⟨()⟩ := by
  simp only [IStar.term, Sentence.holds, Term.denote, Var.denote, imp_eq,
    IStar, FiniteCardinality]
  rfl

theorem iStar_closedTypes {σ : Ty} (hσ : σ.Closed) : (IStar.term σ).closedTypes = true := by
  simp [IStar.term, Term.closedTypes, hσ]

/-- The instance of Arithmetic Necessitism at `σ` is `□I*_σ → …`. -/
theorem P.ArithmeticNecessitism.quoted_eq (σ : Ty) :
    ∃ R, P.ArithmeticNecessitism.quoted σ = Term.imp (Term.box (IStar.term σ)) R := ⟨_, rfl⟩

/-- `I*_σ` is false over one individual. -/
theorem not_holds_iStar_henkin (σ : Ty) : ¬ Sentence.holds henkin (IStar.term σ) := by
  rw [holds_iStar]
  have := finite_denote_unit σ
  exact @not_iStar_of_finite _ ⟨()⟩ _

/-- **`¬I*_σ` is consistent with `C`**, at every type. -/
theorem not_iStar_consistent (σ : Ty) : Consistent (single (Term.neg (IStar.term σ))) :=
  Consistent.of_interp henkin fun _ h => h ▸ not_holds_iStar_henkin σ

/-- **`□I*_σ`, the identity `I*_σ = ⊤`, is not a theorem of `C`**: it is false over one
individual. -/
theorem box_iStar_not_theorem (σ : Ty) :
    ¬ Theorem (C.axioms ∪ empty) (Term.eq' (IStar.term σ) Term.top) :=
  not_theorem_of_interp henkin (fun _ h => h.elim) fun h => not_holds_iStar_henkin σ (by
    have h' : Sentence.holds henkin (IStar.term σ) = Sentence.holds henkin Term.top := h
    rw [h']
    show (∀ q : Prop, q) ∨ ¬ ∀ q : Prop, q
    rw [top_eq]; trivial)

/-- **Maximalism (pure), distinctness form, gives Arithmetic Necessitism**, vacuously: at
each closed type `σ`, `I*_σ ≠ ⊤`, an instance since `I*_σ = ⊤` is not a theorem of `C`
(`box_iStar_not_theorem`), is the negation of the antecedent `□I*_σ`. -/
theorem distinctness_entails_arithmeticNecessitism :
    distinctnessC Signature.pure ⟹ P.ArithmeticNecessitism.schema := by
  rintro _ ⟨σ, hσ, rfl⟩
  obtain ⟨R, hR⟩ := P.ArithmeticNecessitism.quoted_eq σ
  rw [hR]
  have hd : Theorem (C.axioms ∪ distinctnessC Signature.pure)
      (Term.neg (Term.eq' (IStar.term σ) Term.top)) :=
    Theorem.ax ⟨by simp [Term.closedTypes, iStar_closedTypes hσ],
      _, _, _, box_iStar_not_theorem σ, rfl⟩
  exact Derivable.impI (Derivable.notE (Derivable.hyp (List.mem_cons_self ..))
    (Derivable.weaken₁ hd))

end Classicism.Meta
