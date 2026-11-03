import Classicism.Syntax.VectorizeDerivable
import Classicism.Syntax.ClosedTypes
import Classicism.Syntax.Conservativity
import Classicism.Completeness.Theories

/-!
# Existence at the type variables

The canonical worlds say that every type is inhabited, type variables included
(`World.exists_self_mem`), and `C` does not prove that of a type variable. For a theory
in the paper's language this costs nothing: if `Ax`, all of whose types are closed, is
consistent, so is `Ax` together with **Existence at the type variables**, `∃x:var i. x = x`
for every `i` (`AxiomSet.varExistence`). A derivation of `⊥` from them, vectorized along the
assignment putting `e` for every type variable (`Syntax/VectorizeDerivable.lean`), is a
derivation of `⊥` from `Ax` and Existence at `e`: a sentence of the paper's language is its
own vectorization (`Term.vecG1_of_closedTypes`), and Existence at `var i` becomes Existence
at `e`. The signature is the paper's (`Signature.Closed`), so its constants are untouched.
-/

namespace Classicism.Meta

variable {Sig : Signature}

/-- Existence at the type variables: `∃x:var i. x = x`, for every `i`. -/
def AxiomSet.varExistence : AxiomSet Sig := fun a =>
  ∃ i : Nat, a = Term.exists' (σ := Ty.var i) (Term.eq' (Term.var .zero) (Term.var .zero))

/-- The assignment putting `e` for every type variable. -/
def Assign.toE : Assign := fun _ => [Ty.e]

namespace Vectorize

/-! ### A sentence of the paper's language is its own vectorization -/

theorem Terms.cast_heq {Γ : Ctx} {σs σs' : List Ty} (h : σs = σs') (as : Terms Sig Γ σs) :
    HEq (Terms.cast h as) as := by subst h; rfl

/-- A closed context is unchanged. -/
theorem Ctx.vec_closed (θ : Assign) : ∀ {Γ : Ctx}, (∀ τ ∈ Γ, τ.Closed) → Ctx.vec θ Γ = Γ
  | [], _ => rfl
  | σ :: Γ, h => by
    rw [Ctx.vec_cons, Ty.vec_closed θ (h σ List.mem_cons_self),
      Ctx.vec_closed θ (fun τ hτ => h τ (List.mem_cons_of_mem _ hτ))]

theorem heq_app {Γ Γ' : Ctx} {σs : List Ty} {σ : Ty} {ρ ρ' : RTy} (eΓ : Γ' = Γ) (eσ : σs = [σ])
    (eρ : ρ' = ρ) {F : Terms Sig Γ' [Ty.rel (σs ⇒* ρ')]} {A : Terms Sig Γ' σs}
    {f : Term Sig Γ (σ ⇒ ρ)} {a : Term Sig Γ σ}
    (hF : HEq F (Terms.single f)) (hA : HEq A (Terms.single a)) :
    HEq (Terms.single (Term.appBlock F.head1 A)) (Terms.single (Term.app f a)) := by
  subst eΓ eσ eρ
  cases eq_of_heq hF; cases eq_of_heq hA; rfl

theorem heq_lam {Γ Γ' : Ctx} {σs : List Ty} {σ : Ty} {ρ ρ' : RTy} (eΓ : Γ' = Γ) (eσ : σs = [σ])
    (eρ : ρ' = ρ) {B : Terms Sig (Ctx.block σs Γ') [Ty.rel ρ']} {b : Term Sig (σ :: Γ) ρ}
    (hB : HEq B (Terms.single b)) :
    HEq (Terms.single (Term.lamBlock σs B.head1)) (Terms.single (Term.lam b)) := by
  subst eΓ eσ eρ
  cases eq_of_heq hB; rfl

theorem heq_ctx {Γ Γ' : Ctx} {σ : Ty} (eΓ : Γ' = Γ) (t : Term Sig Γ' σ) (t' : Term Sig Γ σ)
    (h : HEq t t') : HEq (Terms.single t) (Terms.single t') := by
  subst eΓ; cases eq_of_heq h; rfl

theorem heq_var_zero {Γ Γ' : Ctx} {σs : List Ty} {σ : Ty} (eΓ : Γ' = Γ) (eσ : σs = [σ]) :
    HEq (Terms.vars (Sig := Sig) σs Γ') (Terms.single (Sig := Sig) (Term.var (Var.zero : Var (σ :: Γ) σ))) := by
  subst eΓ eσ; rfl

theorem heq_var_succ {Γ Γ' : Ctx} {σs τs : List Ty} {σ τ : Ty} (eΓ : Γ' = Γ) (eσ : σs = [σ])
    (eτ : τs = [τ]) {V : Terms Sig Γ' σs} {v : Var Γ σ} (hV : HEq V (Terms.single (Sig := Sig) (Term.var v))) :
    HEq (V.rename (Ren.wkBlock τs)) (Terms.single (Sig := Sig) (Term.var (Var.succ v : Var (τ :: Γ) σ))) := by
  subst eΓ eσ eτ; cases eq_of_heq hV; rfl

theorem heq_op {Γ Γ' : Ctx} {σ σ' : Ty} (eΓ : Γ' = Γ) (eσ : σ' = σ) {t : Term Sig Γ' σ'}
    {t' : Term Sig Γ σ} (h : HEq t t') : HEq (Terms.single t) (Terms.single t') := by
  subst eΓ eσ; cases eq_of_heq h; rfl

theorem heq_allC {Γ Γ' : Ctx} {σs : List Ty} {σ : Ty} (eΓ : Γ' = Γ) (eσ : σs = [σ]) :
    HEq (Terms.single (Term.allC (Sig := Sig) σs (Γ := Γ'))) (Terms.single (Term.all (Sig := Sig) (Γ := Γ) σ)) := by
  subst eΓ eσ; rfl
theorem heq_exC {Γ Γ' : Ctx} {σs : List Ty} {σ : Ty} (eΓ : Γ' = Γ) (eσ : σs = [σ]) :
    HEq (Terms.single (Term.exC (Sig := Sig) σs (Γ := Γ'))) (Terms.single (Term.ex (Sig := Sig) (Γ := Γ) σ)) := by
  subst eΓ eσ; rfl
theorem heq_eqC {Γ Γ' : Ctx} {σs : List Ty} {σ : Ty} (eΓ : Γ' = Γ) (eσ : σs = [σ]) :
    HEq (Terms.single (Term.eqC (Sig := Sig) σs (Γ := Γ'))) (Terms.single (Term.eq (Sig := Sig) (Γ := Γ) σ)) := by
  subst eΓ eσ; rfl

theorem heq_family {Γ Γ' : Ctx} {σ : Ty} (op : ∀ (Δ : Ctx), Term Sig Δ σ) (eΓ : Γ' = Γ) :
    HEq (Terms.single (op Γ')) (Terms.single (op Γ)) := by
  subst eΓ; rfl

theorem heq_R {Γ Γ' : Ctx} {ρ ρ' : RTy} (T : RTy → Ty)
    (op : ∀ {Δ : Ctx} (ρ : RTy), Term Sig Δ (T ρ)) (eΓ : Γ' = Γ) (eρ : ρ' = ρ) :
    HEq (Terms.single (op (Δ := Γ') ρ')) (Terms.single (op (Δ := Γ) ρ)) := by
  subst eΓ eρ; rfl

variable (θ : Assign) (hc : Sig.VecFixed θ)

theorem var_heq : ∀ {Γ : Ctx} {σ : Ty} (v : Var Γ σ), (∀ τ ∈ Γ, τ.Closed) →
    HEq (Var.vec (Sig := Sig) θ v) (Terms.single (Sig := Sig) (Term.var v))
  | σ :: Γ, _, .zero, h =>
    heq_var_zero (Ctx.vec_closed θ (fun τ hτ => h τ (List.mem_cons_of_mem _ hτ)))
      (Ty.vec_closed θ (h σ List.mem_cons_self))
  | τ :: Γ, σ, .succ v, h => by
    rw [Var.vec_succ]
    have hΓ : ∀ τ ∈ Γ, τ.Closed := fun τ hτ => h τ (List.mem_cons_of_mem _ hτ)
    have hσ : σ.Closed := by
      have : ∀ {Γ : Ctx} {σ : Ty}, Var Γ σ → σ ∈ Γ := by
        intro Γ σ v; induction v with
        | zero => exact List.mem_cons_self
        | succ _ ih => exact List.mem_cons_of_mem _ ih
      exact hΓ σ (this v)
    exact heq_var_succ (Ctx.vec_closed θ hΓ) (Ty.vec_closed θ hσ)
      (Ty.vec_closed θ (h τ List.mem_cons_self)) (var_heq v hΓ)

/-- **A term of the paper's language, in a closed context, is its own vectorization.** -/
theorem vecG_heq : ∀ {Γ : Ctx} {σ : Ty} (t : Term Sig Γ σ), t.closedTypes = true →
    (∀ τ ∈ Γ, τ.Closed) → HEq (t.vecG θ hc) (Terms.single t)
  | _, _, .var v, _, hΓ => var_heq θ v hΓ
  | _, _, .const c, _, hΓ => by
    show HEq (Terms.cast (hc c).symm (.single (.const c))) _
    exact (Terms.cast_heq _ _).trans (heq_family (fun Δ => .const c) (Ctx.vec_closed θ hΓ))
  | Γ, _, .app (σ := σ) (ρ := ρ) f a, ht, hΓ => by
    simp only [Term.closedTypes, Bool.and_eq_true] at ht
    have hf := Term.closed_of_closedTypes ht.1
    exact heq_app (Ctx.vec_closed θ hΓ) (Ty.vec_closed θ hf.1) (RTy.vec_closed θ hf.2)
      (vecG_heq f ht.1 hΓ) (vecG_heq a ht.2 hΓ)
  | Γ, _, .lam (σ := σ) (ρ := ρ) b, ht, hΓ => by
    simp only [Term.closedTypes, Bool.and_eq_true, decide_eq_true_eq] at ht
    have hΓ' : ∀ τ ∈ σ :: Γ, τ.Closed := fun τ hτ =>
      (List.mem_cons.1 hτ).elim (fun e => e ▸ ht.1) (hΓ τ)
    exact heq_lam (Ctx.vec_closed θ hΓ) (Ty.vec_closed θ ht.1)
      (RTy.vec_closed θ (Term.closed_of_closedTypes ht.2)) (vecG_heq b ht.2 hΓ')
  | _, _, .and, _, hΓ | _, _, .or, _, hΓ | _, _, .not, _, hΓ => by
    exact heq_family (fun Δ => _) (Ctx.vec_closed θ hΓ)
  | _, _, .all σ, ht, hΓ => by
    simp only [Term.closedTypes, decide_eq_true_eq] at ht
    exact heq_allC (Ctx.vec_closed θ hΓ) (Ty.vec_closed θ ht)
  | _, _, .ex σ, ht, hΓ => by
    simp only [Term.closedTypes, decide_eq_true_eq] at ht
    exact heq_exC (Ctx.vec_closed θ hΓ) (Ty.vec_closed θ ht)
  | _, _, .eq σ, ht, hΓ => by
    simp only [Term.closedTypes, decide_eq_true_eq] at ht
    exact heq_eqC (Ctx.vec_closed θ hΓ) (Ty.vec_closed θ ht)
  | _, _, .constR ρ, ht, hΓ | _, _, .negR ρ, ht, hΓ | _, _, .andR ρ, ht, hΓ
  | _, _, .orR ρ, ht, hΓ | _, _, .coextR ρ, ht, hΓ | _, _, .boxR ρ, ht, hΓ
  | _, _, .inclR ρ, ht, hΓ => by
    simp only [Term.closedTypes, decide_eq_true_eq] at ht
    exact heq_R _ (fun ρ => _) (Ctx.vec_closed θ hΓ) (RTy.vec_closed θ ht)

/-- **A sentence of the paper's language is its own vectorization.** -/
theorem vecG1_of_closedTypes {p : Sentence Sig} (h : p.closedTypes = true) : p.vecG1 θ hc = p := by
  have := eq_of_heq (vecG_heq θ hc p h (fun _ h => absurd h List.not_mem_nil))
  exact congrArg Terms.head1 this

end Vectorize

/-- Existence at a type variable, vectorized along `var i ↦ e`, is Existence at `e`. -/
theorem varExistence_vecG1 (hc : Sig.VecFixed Assign.toE) (i : Nat) :
    (Term.exists' (σ := Ty.var i) (Term.eq' (Term.var .zero) (Term.var .zero)) :
      Sentence Sig).vecG1 Assign.toE hc = existence_e := rfl

/-- **Existence at the type variables is consistent with a theory of the paper's
language**, in a signature of the paper's language. -/
theorem AxiomSet.Consistent.union_varExistence (hS : Sig.Closed) {Ax : AxiomSet Sig}
    (hAx : AxiomSet.ClosedTypes Ax) (h : AxiomSet.Consistent Ax) :
    AxiomSet.Consistent (Ax ∪ AxiomSet.varExistence) := by
  intro hb
  have hc : Sig.VecFixed Assign.toE := Signature.VecFixed.of_closed hS Assign.toE
  refine h ?_
  have d := Derivable.vecG Assign.toE hc (Ax' := C.axioms ∪ Ax)
    (fun a ha => by
      rcases ha with ha | ha | ⟨i, rfl⟩
      · exact Or.inl (Logical.vecG1 _ hc ha)
      · rw [Vectorize.vecG1_of_closedTypes _ hc (hAx a ha)]; exact Or.inr ha
      · rw [varExistence_vecG1 hc i]; exact Or.inl rfl)
    (fun a ha => by
      have e : a = existence_e := ha.2
      subst e
      exact (C.logical_union Ax _).2 rfl) hb
  rwa [Vectorize.vecG1_of_closedTypes _ hc (by simp [Term.closedTypes])] at d


end Classicism.Meta
