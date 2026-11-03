import Classicism.Syntax.Entailment
import Classicism.Syntax.Constants

/-!
# The reserve of witness constants

The canonical model for the completeness theorem (`Completeness/Canonical.lean`) is built
from worlds in the manner of Bacon, *A Philosophical Introduction to Higher-Order Logics*,
Definition 18.8: a world is a language together with a maximal consistent, witnessed
theory in it. All the languages are fragments of one ambient signature, `Sig` with a
**reserve** of fresh constants added, countably many at every type; a world's language is
`Sig` together with a set `S` of reserve constants, leaving infinitely many unused at every
type (`Roomy`), so that a successor world can always find fresh witnesses.

Working in one ambient signature means that every world's sentences are terms of the same
type, `Sentence (ext Sig)`, and a world's language is a predicate on them (`InLang`).
-/

namespace Classicism.Meta

namespace Completeness

/-- The reserve: countably many fresh constants at each type. -/
abbrev Reserve : Type := Ty × ℕ

/-- `Sig` with the reserve added. -/
def ext (Sig : Signature) : Signature where
  Const := Sig.Const ⊕ Reserve
  typeOf := Sum.elim Sig.typeOf Prod.fst

variable {Sig : Signature}

/-- The structural implementation of `lift`. -/
def liftImpl : ∀ {Γ : Ctx} {σ : Ty}, Term Sig Γ σ → Term (ext Sig) Γ σ
  | _, _, .var v => .var v
  | _, _, .const c => .const (Sig := ext Sig) (Sum.inl c)
  | _, _, .app f a => .app (liftImpl f) (liftImpl a)
  | _, _, .lam b => .lam (liftImpl b)
  | _, _, .and => .and
  | _, _, .or => .or
  | _, _, .not => .not
  | _, _, .all σ => .all σ
  | _, _, .ex σ => .ex σ
  | _, _, .eq σ => .eq σ
  | _, _, .constR ρ => .constR ρ
  | _, _, .negR ρ => .negR ρ
  | _, _, .andR ρ => .andR ρ
  | _, _, .orR ρ => .orR ρ
  | _, _, .coextR ρ => .coextR ρ
  | _, _, .boxR ρ => .boxR ρ
  | _, _, .inclR ρ => .inclR ρ

/-- A term of `Sig`, read in the ambient signature: each constant `c` as `Sum.inl c`.
Through `Term.rec`, as `ofPure` is, for the kernel's sake. -/
@[implemented_by liftImpl]
def lift : ∀ {Γ : Ctx} {σ : Ty}, Term Sig Γ σ → Term (ext Sig) Γ σ :=
  fun {_ _} t =>
    Term.rec (motive := fun Γ σ _ => Term (ext Sig) Γ σ)
      (var := fun v => Term.var v)
      (const := fun c => Term.const (Sig := ext Sig) (Sum.inl c))
      (app := fun _ _ f a => Term.app f a)
      (lam := fun _ b => Term.lam b)
      (and := Term.and) (or := Term.or) (not := Term.not)
      (all := fun σ => Term.all σ) (ex := fun σ => Term.ex σ) (eq := fun σ => Term.eq σ)
      (constR := fun ρ => Term.constR ρ) (negR := fun ρ => Term.negR ρ)
      (andR := fun ρ => Term.andR ρ) (orR := fun ρ => Term.orR ρ)
      (coextR := fun ρ => Term.coextR ρ) (boxR := fun ρ => Term.boxR ρ)
      (inclR := fun ρ => Term.inclR ρ)
      t

/-- An axiom set of `Sig`, read in the ambient signature. -/
def AxiomSet.lift (Ax : AxiomSet Sig) : AxiomSet (ext Sig) := fun a => ∃ b, Ax b ∧ a = Completeness.lift b

/-- A term is in the language with reserve constants `S` when every reserve constant
occurring in it is in `S`. -/
def InLang (S : Set Reserve) {Γ : Ctx} {σ : Ty} (t : Term (ext Sig) Γ σ) : Prop :=
  ∀ r : Reserve, (Sum.inr r : (ext Sig).Const) ∈ t.consts → r ∈ S

/-- `S` leaves infinitely many reserve constants unused at every type. -/
def Roomy (S : Set Reserve) : Prop := ∀ τ : Ty, {n : ℕ | (τ, n) ∉ S}.Infinite

end Completeness

end Classicism.Meta
