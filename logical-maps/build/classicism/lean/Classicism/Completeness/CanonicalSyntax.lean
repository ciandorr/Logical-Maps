import Classicism.Completeness.Worlds

/-!
# Syntactic facts for the canonical model

Two kinds of bookkeeping the canonical model (`Completeness/Canonical.lean`) needs about
the terms of the ambient signature `ext Sig`.

* **Languages.** Which terms are in a world's language (`InLang`): a term is when its
  parts are, renaming and substitution of terms in the language stay in it, and a term
  read from `Sig` (`lift`) is in every language, having no reserve constants.
* **β with several arguments.** A closed abstraction over two or three variables applied
  to closed terms converts to the body under the simultaneous substitution, which then
  computes to the expected term: the form in which the δ-unfoldings of the
  type-subscripted operations are applied to their arguments.

And the deductive closure of a world in the form used throughout: what a world's
sentences derive, in its language, is in it (`mem_of_th`).
-/

namespace Classicism.Meta

namespace Completeness

open Term

variable {Sig : Signature} {S S' : Set Reserve}

/-! ### Languages -/

section InLang

variable {Γ : Ctx}

theorem inLang_of_consts_empty {σ : Ty} {t : Term (ext Sig) Γ σ} (h : t.consts = ∅) : InLang S t := by
  intro r hr; rw [h] at hr; exact hr.elim

@[simp] theorem inLang_var {σ : Ty} (v : Var Γ σ) : InLang S (.var v : Term (ext Sig) Γ σ) :=
  inLang_of_consts_empty rfl
@[simp] theorem inLang_and : InLang S (.and : Term (ext Sig) Γ _) := inLang_of_consts_empty rfl
@[simp] theorem inLang_or : InLang S (.or : Term (ext Sig) Γ _) := inLang_of_consts_empty rfl
@[simp] theorem inLang_not : InLang S (.not : Term (ext Sig) Γ _) := inLang_of_consts_empty rfl
@[simp] theorem inLang_all (σ : Ty) : InLang S (.all σ : Term (ext Sig) Γ _) := inLang_of_consts_empty rfl
@[simp] theorem inLang_ex (σ : Ty) : InLang S (.ex σ : Term (ext Sig) Γ _) := inLang_of_consts_empty rfl
@[simp] theorem inLang_eq (σ : Ty) : InLang S (.eq σ : Term (ext Sig) Γ _) := inLang_of_consts_empty rfl
@[simp] theorem inLang_constR (ρ : RTy) : InLang S (.constR ρ : Term (ext Sig) Γ _) := inLang_of_consts_empty rfl
@[simp] theorem inLang_negR (ρ : RTy) : InLang S (.negR ρ : Term (ext Sig) Γ _) := inLang_of_consts_empty rfl
@[simp] theorem inLang_andR (ρ : RTy) : InLang S (.andR ρ : Term (ext Sig) Γ _) := inLang_of_consts_empty rfl
@[simp] theorem inLang_orR (ρ : RTy) : InLang S (.orR ρ : Term (ext Sig) Γ _) := inLang_of_consts_empty rfl
@[simp] theorem inLang_coextR (ρ : RTy) : InLang S (.coextR ρ : Term (ext Sig) Γ _) := inLang_of_consts_empty rfl
@[simp] theorem inLang_boxR (ρ : RTy) : InLang S (.boxR ρ : Term (ext Sig) Γ _) := inLang_of_consts_empty rfl
@[simp] theorem inLang_inclR (ρ : RTy) : InLang S (.inclR ρ : Term (ext Sig) Γ _) := inLang_of_consts_empty rfl

/-- A constant of `Sig` is in every language. -/
@[simp] theorem inLang_const_inl (c : Sig.Const) :
    InLang S (.const (Sig := ext Sig) (Γ := Γ) (Sum.inl c)) := by
  intro r hr
  exact (Sum.inr_ne_inl (Set.mem_singleton_iff.1 hr)).elim

end InLang

/-- Substituting terms of a language into a term of it stays in it. -/
theorem inLang_subst : ∀ {Γ Δ : Ctx} {s : Sub (ext Sig) Γ Δ} {σ : Ty} {t : Term (ext Sig) Γ σ},
    InLang S t → (∀ τ (v : Var Γ τ), InLang S (s τ v)) → InLang S (t.subst s)
  | _, _, s, _, .var v, _, hs => hs _ v
  | _, _, _, _, .const _, ht, _ => ht
  | _, _, _, _, .and, _, _ | _, _, _, _, .or, _, _ | _, _, _, _, .not, _, _
  | _, _, _, _, .all _, _, _ | _, _, _, _, .ex _, _, _ | _, _, _, _, .eq _, _, _
  | _, _, _, _, .constR _, _, _ | _, _, _, _, .negR _, _, _ | _, _, _, _, .andR _, _, _
  | _, _, _, _, .orR _, _, _ | _, _, _, _, .coextR _, _, _ | _, _, _, _, .boxR _, _, _
  | _, _, _, _, .inclR _, _, _ => inLang_of_consts_empty rfl
  | _, _, s, _, .app f a, ht, hs => by
    rw [inLang_app] at ht
    exact inLang_app.2 ⟨inLang_subst ht.1 hs, inLang_subst ht.2 hs⟩
  | _, _, s, _, .lam b, ht, hs => by
    show InLang S (Term.lam (b.subst (Sub.lift s)))
    refine inLang_lam.2 (inLang_subst ht ?_)
    intro τ v
    cases v with
    | zero => exact inLang_var _
    | succ v => exact (inLang_rename _).2 (hs _ v)

theorem inLang_instantiate {Γ : Ctx} {σ τ : Ty} {b : Term (ext Sig) (σ :: Γ) τ} {a : Term (ext Sig) Γ σ}
    (hb : InLang S b) (ha : InLang S a) : InLang S (b.instantiate a) :=
  inLang_subst hb fun _ v => by cases v with
    | zero => exact ha
    | succ v => exact inLang_var _

theorem consts_lift : ∀ {Γ : Ctx} {σ : Ty} (t : Term Sig Γ σ) {c : (ext Sig).Const},
    c ∈ (lift t).consts → ∃ c', c = Sum.inl c'
  | _, _, .var _, _, h => h.elim
  | _, _, .const c, _, h => ⟨c, h⟩
  | _, _, .app f a, _, h => h.elim (consts_lift f) (consts_lift a)
  | _, _, .lam b, _, h => consts_lift b h
  | _, _, .and, _, h | _, _, .or, _, h | _, _, .not, _, h | _, _, .all _, _, h
  | _, _, .ex _, _, h | _, _, .eq _, _, h | _, _, .constR _, _, h | _, _, .negR _, _, h
  | _, _, .andR _, _, h | _, _, .orR _, _, h | _, _, .coextR _, _, h | _, _, .boxR _, _, h
  | _, _, .inclR _, _, h => h.elim

/-! ### β with several arguments -/

theorem conv_beta2 {Γ : Ctx} {σ τ : Ty} {ρ : RTy} (B : Term Sig (τ :: σ :: Γ) ρ)
    (a : Term Sig Γ σ) (b : Term Sig Γ τ) :
    Term.app (Term.app (.lam (.lam B)) a) b ≡ B.subst (Sub.cons b (Sub.cons a Sub.id)) := by
  refine Conv.trans (Conv.app_congr (Conv.beta _ a) (Conv.refl b)) ?_
  show Term.app (Term.lam (B.subst (Sub.lift (Sub.cons a Sub.id)))) b ≡ _
  refine Conv.trans (Conv.beta _ b) ?_
  rw [Term.instantiate, Term.subst_subst, Sub.comp_cons_lift]
  exact Conv.refl _

theorem conv_beta3 {Γ : Ctx} {σ τ υ : Ty} {ρ : RTy} (B : Term Sig (υ :: τ :: σ :: Γ) ρ)
    (a : Term Sig Γ σ) (b : Term Sig Γ τ) (c : Term Sig Γ υ) :
    Term.app (Term.app (Term.app (.lam (.lam (.lam B))) a) b) c
      ≡ B.subst (Sub.cons c (Sub.cons b (Sub.cons a Sub.id))) := by
  refine Conv.trans (Conv.app_congr (conv_beta2 (Term.lam B) a b) (Conv.refl c)) ?_
  show Term.app (Term.lam (B.subst (Sub.lift (Sub.cons b (Sub.cons a Sub.id))))) c ≡ _
  refine Conv.trans (Conv.beta _ c) ?_
  rw [Term.instantiate, Term.subst_subst, Sub.comp_cons_lift]
  exact Conv.refl _

/-! ### Deductive closure of a world -/

/-- What a world's theory derives, with `C`. -/
abbrev Th (w : World Sig) (p : Sentence (ext Sig)) : Prop :=
  Theorem (C.axioms ∪ fun q => q ∈ w.Γ) p

namespace World

variable {w : World Sig}

theorem th_of_mem {p : Sentence (ext Sig)} (h : p ∈ w.Γ) : Th w p :=
  Theorem.ax (Ax := fun q => q ∈ w.Γ) h

theorem th_of_C {p : Sentence (ext Sig)} (h : C.Theorem p) : Th w p := Theorem.ofC h

theorem mem_of_th {p : Sentence (ext Sig)} (h : Th w p) (hp : InLang w.S p) : p ∈ w.Γ :=
  mem_of_theorem hp h

theorem inLang_of_mem {p : Sentence (ext Sig)} (h : p ∈ w.Γ) : InLang w.S p := w.lang p h

theorem not_mem_and_neg {p : Sentence (ext Sig)} (h : p ∈ w.Γ) (hn : Term.neg p ∈ w.Γ) : False :=
  (mem_neg_iff (inLang_of_mem h)).1 hn h

/-- A sentence of the language converting to a member is a member. -/
theorem mem_of_conv {p q : Sentence (ext Sig)} (hpq : p ≡ q) (hq : InLang w.S q) (hp : p ∈ w.Γ) :
    q ∈ w.Γ := mem_conv hpq hq hp

theorem mem_iff_conv {p q : Sentence (ext Sig)} (hpq : p ≡ q) (hp : InLang w.S p) (hq : InLang w.S q) :
    p ∈ w.Γ ↔ q ∈ w.Γ :=
  ⟨mem_conv hpq hq, mem_conv (Conv.symm hpq) hp⟩

theorem mem_imp_iff {p q : Sentence (ext Sig)} (hp : InLang w.S p) (hq : InLang w.S q) :
    Term.imp p q ∈ w.Γ ↔ (p ∈ w.Γ → q ∈ w.Γ) := by
  rw [mem_disj_iff (inLang_app.2 ⟨inLang_not, hp⟩) hq, mem_neg_iff hp]
  exact imp_iff_not_or.symm

theorem mem_iff_iff {p q : Sentence (ext Sig)} (hp : InLang w.S p) (hq : InLang w.S q) :
    Term.iff p q ∈ w.Γ ↔ (p ∈ w.Γ ↔ q ∈ w.Γ) := by
  have hpq : InLang w.S (Term.imp p q) := by simp [hp, hq]
  have hqp : InLang w.S (Term.imp q p) := by simp [hp, hq]
  rw [mem_conj_iff hpq hqp, mem_imp_iff hp hq, mem_imp_iff hq hp]
  exact iff_def.symm

end World

end Completeness

end Classicism.Meta
