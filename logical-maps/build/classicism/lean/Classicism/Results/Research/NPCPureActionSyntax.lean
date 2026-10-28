import Classicism.Syntax.Pure

/-!
# Typed conjugation for the No Pure Contingency argument

Source: `topics/classicism/writeups/c5-and-atomicity-imply-no-pure-contingency.md`,
section 4, Lemmas 5--7 (unpaginated), following Cian Dorr's 23 September 2026
sketch with Zachary Goodsell's permission. This is a new formal transcription.

`act` is a metalevel operation on intrinsically typed object terms. At the
individual type it returns its input; it never forms an object term of the
inadmissible type e -> e. At a relational type it constructs the displayed
conjugation using valid object-language abstraction. The seed F : t -> t is
explicit. No automorphism or pure-invariance claim is assumed or proved here.
-/

namespace Classicism.Meta.Research.NPCPureAction

variable {Sig : Signature}

mutual
  def act (σ : Ty) {Γ : Ctx} (F : Term Sig Γ (Ty.t ⇒ RTy.t))
      (a : Term Sig Γ σ) : Term Sig Γ σ :=
    match σ with
    | .e => a
    | .var _ => a
    | .rel ρ => actR ρ F a

  def actR (ρ : RTy) {Γ : Ctx} (F : Term Sig Γ (Ty.t ⇒ RTy.t))
      (a : Term Sig Γ ρ) : Term Sig Γ ρ :=
    match ρ with
    | .t => .app F a
    | .arr σ τ =>
      .lam (actR τ F.weaken (.app a.weaken (act σ F.weaken Term.v0)))
end

@[simp] theorem act_e {Γ : Ctx} (F : Term Sig Γ (Ty.t ⇒ RTy.t))
    (a : Term Sig Γ Ty.e) : act Ty.e F a = a := rfl

@[simp] theorem act_t {Γ : Ctx} (F : Term Sig Γ (Ty.t ⇒ RTy.t))
    (a : Formula Sig Γ) : act Ty.t F a = .app F a := rfl

theorem subst_weaken {Γ Δ : Ctx} {σ τ : Ty} (s : Sub Sig Γ Δ)
    (a : Term Sig Γ σ) :
    (a.weaken (τ := τ)).subst (Sub.lift s) = (a.subst s).weaken := by
  simp only [Term.weaken, Term.subst_rename, Term.rename_subst]
  rfl

mutual
  theorem act_subst (σ : Ty) {Γ Δ : Ctx} (s : Sub Sig Γ Δ)
      (F : Term Sig Γ (Ty.t ⇒ RTy.t)) (a : Term Sig Γ σ) :
      (act σ F a).subst s = act σ (F.subst s) (a.subst s) := by
    cases σ with
    | e => rfl
    | var _ => rfl
    | rel ρ => exact actR_subst ρ s F a

  theorem actR_subst (ρ : RTy) {Γ Δ : Ctx} (s : Sub Sig Γ Δ)
      (F : Term Sig Γ (Ty.t ⇒ RTy.t)) (a : Term Sig Γ ρ) :
      (actR ρ F a).subst s = actR ρ (F.subst s) (a.subst s) := by
    cases ρ with
    | t => rfl
    | arr σ τ =>
      simp only [actR, Term.subst_lam, actR_subst τ, Term.subst_app,
        act_subst σ, subst_weaken, Term.subst_var, Sub.lift_zero]
end

theorem act_rename (σ : Ty) {Γ Δ : Ctx} (r : Ren Γ Δ)
    (F : Term Sig Γ (Ty.t ⇒ RTy.t)) (a : Term Sig Γ σ) :
    (act σ F a).rename r = act σ (F.rename r) (a.rename r) := by
  simp only [Term.rename_eq_subst, act_subst]

theorem actR_rename (ρ : RTy) {Γ Δ : Ctx} (r : Ren Γ Δ)
    (F : Term Sig Γ (Ty.t ⇒ RTy.t)) (a : Term Sig Γ ρ) :
    (actR ρ F a).rename r = actR ρ (F.rename r) (a.rename r) :=
  act_rename (.rel ρ) r F a

theorem act_weaken (σ : Ty) {Γ : Ctx} {τ : Ty}
    (F : Term Sig Γ (Ty.t ⇒ RTy.t)) (a : Term Sig Γ σ) :
    (act σ F a).weaken (τ := τ) = act σ F.weaken a.weaken :=
  act_rename σ Ren.shift F a

theorem actR_weaken (ρ : RTy) {Γ : Ctx} {τ : Ty}
    (F : Term Sig Γ (Ty.t ⇒ RTy.t)) (a : Term Sig Γ ρ) :
    (actR ρ F a).weaken (τ := τ) = actR ρ F.weaken a.weaken :=
  act_weaken (.rel ρ) F a

/-- Application of a relational conjugate unfolds by one beta conversion.
This is a conversion of the actual object terms, not a denotational equality. -/
theorem actR_app {Γ : Ctx} {σ : Ty} {ρ : RTy}
    (F : Term Sig Γ (Ty.t ⇒ RTy.t)) (f : Term Sig Γ (σ ⇒ ρ))
    (a : Term Sig Γ σ) :
    Term.app (actR (σ ⇒ ρ) F f) a ≡ actR ρ F (.app f (act σ F a)) := by
  change Term.app (.lam (actR ρ F.weaken
    (.app f.weaken (act σ F.weaken Term.v0)))) a ≡ _
  have h := Conv.beta' (actR ρ F.weaken
    (.app f.weaken (act σ F.weaken Term.v0))) a
  simpa only [Term.instantiate, actR_subst, Term.subst_app, act_subst,
    Term.subst_var, Sub.cons_zero, Term.instantiate_weaken] using h

mutual
  theorem act_conv (σ : Ty) {Γ : Ctx}
      (F : Term Sig Γ (Ty.t ⇒ RTy.t)) {a b : Term Sig Γ σ}
      (h : a ≡ b) : act σ F a ≡ act σ F b := by
    cases σ with
    | e => exact h
    | var _ => exact h
    | rel ρ => exact actR_conv ρ F h

  theorem actR_conv (ρ : RTy) {Γ : Ctx}
      (F : Term Sig Γ (Ty.t ⇒ RTy.t)) {a b : Term Sig Γ ρ}
      (h : a ≡ b) : actR ρ F a ≡ actR ρ F b := by
    cases ρ with
    | t => exact Conv.app_congr (Conv.refl F) h
    | arr σ τ => exact Conv.lam_congr (actR_conv τ F.weaken
        (Conv.app_congr (Conv.rename Ren.shift h) (Conv.refl _)))
end

/-- The simultaneous action on the values of a substitution. -/
def actSub {Γ Δ : Ctx} (F : Term Sig Δ (Ty.t ⇒ RTy.t))
    (s : Sub Sig Γ Δ) : Sub Sig Γ Δ := fun σ v => act σ F (s σ v)

@[simp] theorem actSub_apply {Γ Δ : Ctx} (F : Term Sig Δ (Ty.t ⇒ RTy.t))
    (s : Sub Sig Γ Δ) {σ : Ty} (v : Var Γ σ) :
    actSub F s σ v = act σ F (s σ v) := rfl

/-- For the empty variable context the action substitution is the unique
substitution. This is the closed-sentence step after the open-term induction. -/
theorem actSub_empty {Δ : Ctx} (F : Term Sig Δ (Ty.t ⇒ RTy.t))
    (s : Sub Sig [] Δ) : actSub F s = s := by
  funext σ v
  exact nomatch v

/-- Substitution for a lambda body after conjugating its fresh argument. -/
def twistedLift {Γ Δ : Ctx} {σ : Ty}
    (F : Term Sig Δ (Ty.t ⇒ RTy.t)) (s : Sub Sig Γ Δ) :
    Sub Sig (σ :: Γ) (σ :: Δ) :=
  Sub.cons (act σ F.weaken Term.v0) (Ren.compSub Ren.shift s)

theorem twistedLift_beta {Γ Δ : Ctx} {σ : Ty} {ρ : RTy}
    (F : Term Sig Δ (Ty.t ⇒ RTy.t)) (s : Sub Sig Γ Δ)
    (b : Term Sig (σ :: Γ) ρ) :
    ((b.subst (Sub.lift s)).rename (Ren.lift Ren.shift)).instantiate
        (act σ F.weaken Term.v0) = b.subst (twistedLift F s) := by
  rw [Term.instantiate, Term.rename_subst, Term.subst_subst]
  congr 1
  funext τ v
  cases v with
  | zero => rfl
  | succ v =>
    change ((s τ v).weaken.rename (Ren.lift Ren.shift)).instantiate _ = (s τ v).weaken
    rw [← Term.weaken_rename, Term.instantiate_weaken]

theorem actR_lam {Γ Δ : Ctx} {σ : Ty} {ρ : RTy}
    (F : Term Sig Δ (Ty.t ⇒ RTy.t)) (s : Sub Sig Γ Δ)
    (b : Term Sig (σ :: Γ) ρ) :
    actR (σ ⇒ ρ) F ((Term.lam b).subst s) ≡
      .lam (actR ρ F.weaken (b.subst (twistedLift F s))) := by
  change Term.lam (actR ρ F.weaken
      (.app (.lam ((b.subst (Sub.lift s)).rename (Ren.lift Ren.shift)))
        (act σ F.weaken Term.v0))) ≡ _
  apply Conv.lam_congr
  apply actR_conv
  have h := Conv.beta' ((b.subst (Sub.lift s)).rename (Ren.lift Ren.shift))
    (act σ F.weaken Term.v0)
  rw [twistedLift_beta] at h
  exact h

end Classicism.Meta.Research.NPCPureAction
