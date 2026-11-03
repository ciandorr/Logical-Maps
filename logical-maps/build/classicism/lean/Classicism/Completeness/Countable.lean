import Mathlib.Tactic.DeriveCountable
import Mathlib.Data.Countable.Basic
import Classicism.Syntax.Term

/-!
# Countably many terms

Over a countable signature there are countably many terms of each type in each context.
The Lindenbaum–Henkin construction (`Completeness/Lindenbaum.lean`) enumerates the
sentences of the ambient signature, and this is what it needs.

The types are counted by the deriving handler. The terms, an indexed family, are not
(the handler's dependent elimination fails at `const`, whose index is the constant's
type), so they are injected into an untyped tree, `RawTerm`, that it can count: a term
forgets its indices, keeping the binder type of each abstraction and the type parameter of
each logical constant, which is enough to recover it.
-/

namespace Classicism.Meta

deriving instance Countable for Ty, RTy

namespace Completeness

/-- Untyped term trees: variables as de Bruijn numbers, and each logical constant as a
code number with its type parameter. -/
inductive RawTerm (C : Type) where
  | var (n : ℕ)
  | const (c : C)
  | app (f a : RawTerm C)
  | lam (σ : Ty) (b : RawTerm C)
  | op (k : ℕ) (σ : Ty)
  deriving Countable

/-- A variable's de Bruijn number. -/
def Var.toNat : ∀ {Γ : Ctx} {σ : Ty}, Var Γ σ → ℕ
  | _, _, .zero => 0
  | _, _, .succ v => Var.toNat v + 1

theorem Var.toNat_inj : ∀ {Γ : Ctx} {σ σ' : Ty} (v : Var Γ σ) (v' : Var Γ σ'),
    Var.toNat v = Var.toNat v' → σ = σ' ∧ HEq v v'
  | _, _, _, .zero, .zero, _ => ⟨rfl, HEq.rfl⟩
  | _, _, _, .zero, .succ _, h => by simp [Var.toNat] at h
  | _, _, _, .succ _, .zero, h => by simp [Var.toNat] at h
  | _, _, _, .succ v, .succ v', h => by
    obtain ⟨rfl, h'⟩ := Var.toNat_inj v v' (by simpa [Var.toNat] using h)
    cases h'
    exact ⟨rfl, HEq.rfl⟩

variable {Sig : Signature}

/-- A term, forgetting its indices. -/
def toRaw : ∀ {Γ : Ctx} {σ : Ty}, Term Sig Γ σ → RawTerm Sig.Const
  | _, _, .var v => .var (Var.toNat v)
  | _, _, .const c => .const c
  | _, _, .app f a => .app (toRaw f) (toRaw a)
  | _, _, .lam (σ := σ) b => .lam σ (toRaw b)
  | _, _, .and => .op 0 .e
  | _, _, .or => .op 1 .e
  | _, _, .not => .op 2 .e
  | _, _, .all σ => .op 3 σ
  | _, _, .ex σ => .op 4 σ
  | _, _, .eq σ => .op 5 σ
  | _, _, .constR ρ => .op 6 ρ
  | _, _, .negR ρ => .op 7 ρ
  | _, _, .andR ρ => .op 8 ρ
  | _, _, .orR ρ => .op 9 ρ
  | _, _, .coextR ρ => .op 10 ρ
  | _, _, .boxR ρ => .op 11 ρ
  | _, _, .inclR ρ => .op 12 ρ

/-- Forgetting the indices loses nothing: two terms in one context with the same tree have
the same type and are the same term. -/
theorem toRaw_inj : ∀ {Γ : Ctx} {σ σ' : Ty} (t : Term Sig Γ σ) (t' : Term Sig Γ σ'),
    toRaw t = toRaw t' → σ = σ' ∧ HEq t t' := by
  intro Γ σ σ' t t' h
  induction t generalizing σ' with
  | var v =>
    cases t' <;> simp [toRaw] at h
    obtain ⟨rfl, h'⟩ := Var.toNat_inj _ _ h
    cases h'; exact ⟨rfl, HEq.rfl⟩
  | const c =>
    cases t' <;> simp [toRaw] at h
    subst h; exact ⟨rfl, HEq.rfl⟩
  | app f a ihf iha =>
    cases t' with
    | app f' a' =>
      simp only [toRaw, RawTerm.app.injEq] at h
      obtain ⟨e₁, h₁⟩ := ihf f' h.1
      obtain ⟨e₂, h₂⟩ := iha a' h.2
      cases e₁; cases e₂; cases h₁; cases h₂
      exact ⟨rfl, HEq.rfl⟩
    | _ => simp [toRaw] at h
  | lam b ih =>
    cases t' with
    | lam b' =>
      simp only [toRaw, RawTerm.lam.injEq] at h
      obtain ⟨rfl, h₂⟩ := h
      obtain ⟨e, h₃⟩ := ih b' h₂
      cases e; cases h₃
      exact ⟨rfl, HEq.rfl⟩
    | _ => simp [toRaw] at h
  | and | or | not => cases t' <;> simp [toRaw] at h; exact ⟨rfl, HEq.rfl⟩
  | all σ | ex σ | eq σ =>
    cases t' <;> simp [toRaw] at h; subst h; exact ⟨rfl, HEq.rfl⟩
  | constR ρ | negR ρ | andR ρ | orR ρ | coextR ρ | boxR ρ | inclR ρ =>
    cases t' <;> simp [toRaw] at h; cases h; exact ⟨rfl, HEq.rfl⟩

theorem toRaw_injective {Γ : Ctx} {σ : Ty} : Function.Injective (toRaw (Sig := Sig) (Γ := Γ) (σ := σ)) :=
  fun t t' h => eq_of_heq (toRaw_inj t t' h).2

/-- **Countably many terms**, over a countable signature. -/
instance countable_term [Countable Sig.Const] {Γ : Ctx} {σ : Ty} : Countable (Term Sig Γ σ) :=
  toRaw_injective.countable

end Completeness

end Classicism.Meta
