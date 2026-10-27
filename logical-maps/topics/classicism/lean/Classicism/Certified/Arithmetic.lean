import Classicism.Tools.QuoteTerm
import Classicism.Background.Arithmetic
import Classicism.Certified.Signatures

/-!
# The arithmetical sentences, and Necessity of Arithmetic

Goodsell's *Arithmetic is Necessary*, Definitions 3–8, as the map's Background states them,
with the paper's `ν`, `0` and successor taken to be `(σ → t) → t`, `𝟎_σ` and `Suc_σ` at every
type `σ`:

- the shallow vocabulary, `Arith.zero σ`, `Arith.suc σ`, `Arith.N σ` (`ℕ_σ`, the finite
  cardinalities of properties of type `σ`), `Arith.Sum σ` and `Arith.Prod σ`, quoted into pure
  terms with a type parameter by `#classicism_quote_term`, each with its reflection checked;
  and from them `arithI σ`, `I_σ := ◇I*_σ`, possibly zero is not a successor and successor is
  injective on numbers;
- the **arithmetical formulas** (`AForm k`, in `k` free number variables): atomic `ℕt`,
  `Sum(t, t', t'')`, `Prod(t, t', t'')` and `t = t'`, whose terms are variables, zero and
  successors (`ATerm k`), closed under `¬`, `∨`, `∧` and `∀v ∈ ℕ`; read as formulas of the
  pure language at a type `σ` by `AForm.toTerm σ`;
- **Necessity of Arithmetic**: `□(I_σ → A) ∨ □(I_σ → ¬A)` for each closed type `σ` and each
  arithmetical sentence `A` read at `σ` (`AxiomSet.necessityOfArithmetic`), the map's
  `necessity-of-arithmetic` at every signature by `ofPure`.
-/


namespace Classicism.Arith

/-- The type of the numbers counted at `σ`, `ν_σ := (σ → t) → t`. -/
abbrev ν (σ : Type) : Type := (σ → Prop) → Prop

/-- `𝟎_σ`. -/
def zero (σ : Type) [Ty σ] : ν σ := ZeroCard σ
/-- `Suc_σ`. -/
def suc (σ : Type) [Ty σ] : ν σ → ν σ := SucCard
/-- `ℕ_σ`: the finite cardinalities of properties of type `σ`. -/
def N (σ : Type) [Ty σ] : ν σ → Prop := FiniteCardinality

/-- `Sum_σ(m, n, o)`. -/
def Sum (σ : Type) [Ty σ] : ν σ → ν σ → ν σ → Prop := fun m n o =>
  ∀ R : ν σ → ν σ → Prop, R (zero σ) m →
    (∀ i j, N σ i → N σ j → R i j → R (suc σ i) (suc σ j)) → R n o

/-- `Prod_σ(m, n, o)`. -/
def Prod (σ : Type) [Ty σ] : ν σ → ν σ → ν σ → Prop := fun m n o =>
  ∀ R : ν σ → ν σ → Prop, R (zero σ) (zero σ) →
    (∀ i j k, N σ i → N σ j → N σ k → R i j → Sum σ m j k → R (suc σ i) k) → R n o


end Classicism.Arith

#classicism_quote_term Classicism.Arith.zero Classicism.Arith.suc Classicism.Arith.N
  Classicism.Arith.Sum Classicism.Arith.Prod

noncomputable section

namespace Classicism.Meta

/-- The type `ν_σ` of the object language. -/
abbrev Ty.nu (σ : Ty) : Ty := .rel (.arr (.rel (.arr σ .t)) .t)

/-- The context of `k` number variables at `σ`. -/
abbrev numCtx (σ : Ty) (k : Nat) : Ctx := List.replicate k (Ty.nu σ)

/-- The `i`-th of `k` number variables, innermost first. -/
noncomputable def numVar (σ : Ty) : ∀ {k : Nat}, Fin k → Var (numCtx σ k) (Ty.nu σ)
  | _ + 1, ⟨0, _⟩ => .zero
  | _ + 1, ⟨i + 1, h⟩ => .succ (numVar σ ⟨i, Nat.lt_of_succ_lt_succ h⟩)

/-- Terms of arithmetic in `k` free variables: variables, zero and successors. -/
inductive ATerm (k : Nat)
  | var : Fin k → ATerm k
  | zero : ATerm k
  | suc : ATerm k → ATerm k

/-- Formulas of arithmetic in `k` free variables (Goodsell, Definitions 3–8). -/
inductive AForm : Nat → Type
  | nat {k} : ATerm k → AForm k
  | sum {k} : ATerm k → ATerm k → ATerm k → AForm k
  | prod {k} : ATerm k → ATerm k → ATerm k → AForm k
  | eq {k} : ATerm k → ATerm k → AForm k
  | neg {k} : AForm k → AForm k
  | disj {k} : AForm k → AForm k → AForm k
  | conj {k} : AForm k → AForm k → AForm k
  /-- `∀v ∈ ℕ. φ`. -/
  | all {k} : AForm (k + 1) → AForm k

/-- An arithmetical term as a term of the pure language, counting at `σ`. -/
noncomputable def ATerm.toTerm (σ : Ty) {k : Nat} : ATerm k → Term Signature.pure (numCtx σ k) (Ty.nu σ)
  | .var i => .var (numVar σ i)
  | .zero => (Arith.zero.term σ).close
  | .suc t => .app (Arith.suc.term σ).close (t.toTerm σ)

/-- An arithmetical formula as a formula of the pure language, counting at `σ`. -/
noncomputable def AForm.toTerm (σ : Ty) : ∀ {k : Nat}, AForm k → Formula Signature.pure (numCtx σ k)
  | _, .nat t => .app (Arith.N.term σ).close (t.toTerm σ)
  | _, .sum t u v => .app (.app (.app (Arith.Sum.term σ).close (t.toTerm σ)) (u.toTerm σ)) (v.toTerm σ)
  | _, .prod t u v => .app (.app (.app (Arith.Prod.term σ).close (t.toTerm σ)) (u.toTerm σ)) (v.toTerm σ)
  | _, .eq t u => Term.eq' (t.toTerm σ) (u.toTerm σ)
  | _, .neg φ => Term.neg (φ.toTerm σ)
  | _, .disj φ ψ => Term.disj (φ.toTerm σ) (ψ.toTerm σ)
  | _, .conj φ ψ => Term.conj (φ.toTerm σ) (ψ.toTerm σ)
  | _, .all φ => Term.forall' (Term.imp (.app (Arith.N.term σ).close (.var .zero)) (φ.toTerm σ))

/-- `I_σ := ◇I*_σ`, `I*_σ := ∀m n ∈ ℕ_σ. 𝟎_σ ≠ Suc_σ m ∧ (Suc_σ m = Suc_σ n → m = n)`: possibly
zero is not a successor and successor is injective on numbers. Built from the quoted terms. -/
noncomputable def arithI (σ : Ty) : Sentence Signature.pure :=
  let m : Term Signature.pure [Ty.nu σ, Ty.nu σ] (Ty.nu σ) := .var (.succ .zero)
  let n : Term Signature.pure [Ty.nu σ, Ty.nu σ] (Ty.nu σ) := .var .zero
  let s (t : Term Signature.pure [Ty.nu σ, Ty.nu σ] (Ty.nu σ)) := Term.app (Arith.suc.term σ).close t
  let N (t : Term Signature.pure [Ty.nu σ, Ty.nu σ] (Ty.nu σ)) := Term.app (Arith.N.term σ).close t
  Term.dia (Term.forall' (Term.forall' (Term.imp (N m) (Term.imp (N n)
    (Term.conj (Term.neg (Term.eq' (Arith.zero.term σ).close (s m)))
      (Term.imp (Term.eq' (s m) (s n)) (Term.eq' m n)))))))

namespace AxiomSet

/-- **Necessity of Arithmetic**, in the pure language: `□(I_σ → A) ∨ □(I_σ → ¬A)` for each
closed type `σ` and each arithmetical sentence `A` read at `σ`. -/
def necessityOfArithmetic : AxiomSet Signature.pure := fun a =>
  ∃ σ : Ty, σ.Closed ∧ ∃ A : AForm 0, a = Term.disj (Term.box (Term.imp (arithI σ) (A.toTerm σ)))
    (Term.box (Term.imp (arithI σ) (Term.neg (A.toTerm σ))))

end AxiomSet

/-! ### The arithmetical sentences are in the paper's language, and No Pure Contingency
gives Necessity of Arithmetic -/

theorem closedTypes_close {σ : Ty} {Γ : Ctx} (t : Term Signature.pure [] σ) (h : t.closedTypes = true) :
    (t.close : Term Signature.pure Γ σ).closedTypes = true := by
  rw [Term.closedTypes_rename]; exact h

section
variable {σ : Ty} (hσ : σ.Closed)
include hσ

theorem Arith.zero_closedTypes : (Arith.zero.term σ).closedTypes = true := by
  simp [Arith.zero.term, Term.closedTypes, hσ]
theorem Arith.suc_closedTypes : (Arith.suc.term σ).closedTypes = true := by
  simp [Arith.suc.term, Term.closedTypes, hσ]
theorem Arith.N_closedTypes : (Arith.N.term σ).closedTypes = true := by
  simp [Arith.N.term, Term.closedTypes, hσ]
theorem Arith.Sum_closedTypes : (Arith.Sum.term σ).closedTypes = true := by
  simp [Arith.Sum.term, Term.closedTypes, hσ]
theorem Arith.Prod_closedTypes : (Arith.Prod.term σ).closedTypes = true := by
  simp [Arith.Prod.term, Term.closedTypes, hσ]

theorem ATerm.closedTypes_toTerm : ∀ {k : Nat} (t : ATerm k), (t.toTerm σ).closedTypes = true
  | _, .var _ => by simp [ATerm.toTerm, Term.closedTypes, hσ]
  | _, .zero => closedTypes_close _ (Arith.zero_closedTypes hσ)
  | _, .suc t => by
    simp only [ATerm.toTerm, Term.closedTypes, closedTypes_close _ (Arith.suc_closedTypes hσ),
      ATerm.closedTypes_toTerm t, Bool.and_self]

theorem AForm.closedTypes_toTerm : ∀ {k : Nat} (φ : AForm k), (φ.toTerm σ).closedTypes = true
  | _, .nat t => by
    simp only [AForm.toTerm, Term.closedTypes, closedTypes_close _ (Arith.N_closedTypes hσ),
      ATerm.closedTypes_toTerm hσ t, Bool.and_self]
  | _, .sum t u v => by
    simp only [AForm.toTerm, Term.closedTypes, closedTypes_close _ (Arith.Sum_closedTypes hσ),
      ATerm.closedTypes_toTerm hσ, Bool.and_self]
  | _, .prod t u v => by
    simp only [AForm.toTerm, Term.closedTypes, closedTypes_close _ (Arith.Prod_closedTypes hσ),
      ATerm.closedTypes_toTerm hσ, Bool.and_self]
  | _, .eq t u => by
    simp [AForm.toTerm, Term.closedTypes, ATerm.closedTypes_toTerm hσ]
  | _, .neg φ => by
    simp [AForm.toTerm, AForm.closedTypes_toTerm φ]
  | _, .disj φ ψ => by
    simp [AForm.toTerm, AForm.closedTypes_toTerm φ, AForm.closedTypes_toTerm ψ]
  | _, .conj φ ψ => by
    simp [AForm.toTerm, AForm.closedTypes_toTerm φ, AForm.closedTypes_toTerm ψ]
  | _, .all φ => by
    simp [AForm.toTerm, Term.closedTypes, closedTypes_close _ (Arith.N_closedTypes hσ),
      AForm.closedTypes_toTerm φ, hσ]

theorem arithI_closedTypes : (arithI σ).closedTypes = true := by
  simp [arithI, Term.closedTypes, closedTypes_close _ (Arith.N_closedTypes hσ),
    closedTypes_close _ (Arith.suc_closedTypes hσ), closedTypes_close _ (Arith.zero_closedTypes hσ), hσ]

end

open AxiomSet in
/-- **No Pure Contingency gives Necessity of Arithmetic**: `I_σ → A` and `I_σ → ¬A` are closed
pure sentences, so each is necessary if true; and by excluded middle on `A` one of them is
true. -/
theorem npc_entails_necessityOfArithmetic :
    noContingency Signature.pure ⟹ necessityOfArithmetic := by
  rintro _ ⟨σ, hσ, A, rfl⟩
  have hA := A.closedTypes_toTerm hσ
  have hI := arithI_closedTypes hσ
  have nc : ∀ p : Sentence Signature.pure, p.closedTypes = true →
      Theorem (C.axioms ∪ noContingency Signature.pure) (Term.imp p (Term.box p)) := fun p hp =>
    Theorem.ax ⟨by simp [Term.closedTypes, hp], p, rfl⟩
  have h1 := nc (Term.imp (arithI σ) (A.toTerm σ)) (by simp [Term.closedTypes, hA, hI])
  have h2 := nc (Term.imp (arithI σ) (Term.neg (A.toTerm σ)))
    (by simp [Term.closedTypes, hA, hI])
  refine Derivable.orE (Derivable.em (A.toTerm σ)) ?_ ?_
  · exact Derivable.orI₁ (Derivable.impE (Derivable.weaken₁ h1)
      (Derivable.impI (Derivable.hyp (by simp))))
  · exact Derivable.orI₂ (Derivable.impE (Derivable.weaken₁ h2)
      (Derivable.impI (Derivable.hyp (by simp))))

end Classicism.Meta

end
