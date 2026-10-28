import Classicism.Results.Research.NPCPureActionDerivation

/-!
# Structural pure-term invariance as an object-language derivation

Source: `topics/classicism/writeups/c5-and-atomicity-imply-no-pure-contingency.md`,
section 4, Lemma 7 and Corollary 8 (unpaginated), following Cian Dorr's
23 September 2026 sketch with Zachary Goodsell's permission. New transcription.

This module proves the actual deep-syntax induction, including the lambda case
and simultaneous substitutions. Its explicit premises are guarded involution,
rigid-guard lambda congruence and the finite constructor family of logical
constant identities. It does not assert that the concrete atom swap satisfies
those premises; that is the separate certificate-assembly obligation.
-/

namespace Classicism.Meta.Research.NPCPureAction

variable {Sig : Signature} {Ax : AxiomSet Sig} {S : Seed Sig}

/-- The logical constructor nodes of the intrinsic syntax, including the
type-indexed abbreviations with their delta rules. -/
inductive LogicalConstant : {Γ : Ctx} → {σ : Ty} → Term Sig Γ σ → Prop
  | and {Γ : Ctx} : LogicalConstant (Term.and (Sig := Sig) (Γ := Γ))
  | or {Γ : Ctx} : LogicalConstant (Term.or (Sig := Sig) (Γ := Γ))
  | not {Γ : Ctx} : LogicalConstant (Term.not (Sig := Sig) (Γ := Γ))
  | all {Γ : Ctx} (σ : Ty) : LogicalConstant (Term.all (Sig := Sig) (Γ := Γ) σ)
  | ex {Γ : Ctx} (σ : Ty) : LogicalConstant (Term.ex (Sig := Sig) (Γ := Γ) σ)
  | eq {Γ : Ctx} (σ : Ty) : LogicalConstant (Term.eq (Sig := Sig) (Γ := Γ) σ)
  | constR {Γ : Ctx} (ρ : RTy) : LogicalConstant (Term.constR (Sig := Sig) (Γ := Γ) ρ)
  | negR {Γ : Ctx} (ρ : RTy) : LogicalConstant (Term.negR (Sig := Sig) (Γ := Γ) ρ)
  | andR {Γ : Ctx} (ρ : RTy) : LogicalConstant (Term.andR (Sig := Sig) (Γ := Γ) ρ)
  | orR {Γ : Ctx} (ρ : RTy) : LogicalConstant (Term.orR (Sig := Sig) (Γ := Γ) ρ)
  | coextR {Γ : Ctx} (ρ : RTy) : LogicalConstant (Term.coextR (Sig := Sig) (Γ := Γ) ρ)
  | boxR {Γ : Ctx} (ρ : RTy) : LogicalConstant (Term.boxR (Sig := Sig) (Γ := Γ) ρ)
  | inclR {Γ : Ctx} (ρ : RTy) : LogicalConstant (Term.inclR (Sig := Sig) (Γ := Γ) ρ)

structure LogicalLaws (Ax : AxiomSet Sig) (S : Seed Sig)
    extends InvolutionLaws Ax S : Prop where
  fixes : ∀ {Γ : Ctx} {σ : Ty} (w v : Formula Sig Γ) (c : Term Sig Γ σ),
    LogicalConstant c → EqUnder Ax S w v (act σ (S.map w v) c) c

/-- The two substitutions assign action-related values to every free variable. -/
def RelatedSub {Γ Δ : Ctx} (w v : Formula Sig Δ)
    (s t : Sub Sig Γ Δ) : Prop :=
  ∀ σ (x : Var Γ σ), EqUnder Ax S w v (act σ (S.map w v) (s σ x)) (t σ x)

theorem relatedSub_lift (L : InvolutionLaws Ax S)
    {Γ Δ : Ctx} {σ : Ty} (w v : Formula Sig Δ) (s t : Sub Sig Γ Δ)
    (h : RelatedSub (Ax := Ax) (S := S) w v s t) :
    RelatedSub (Ax := Ax) (S := S) w.weaken v.weaken
      (twistedLift (σ := σ) (S.map w v) s) (Sub.lift t) := by
  intro τ x
  cases x with
  | zero =>
    change EqUnder Ax S w.weaken v.weaken
      (act σ (S.map w.weaken v.weaken) (act σ (S.map w v).weaken Term.v0)) Term.v0
    rw [S.map_weaken]
    exact act_involution L σ w.weaken v.weaken Term.v0
  | succ x =>
    have hx := eqUnder_weaken (τ := σ) (h τ x)
    simpa only [act_weaken, S.map_weaken, twistedLift, Sub.cons_succ,
      Ren.compSub, Sub.lift_succ] using hx

/-- Open pure terms respect simultaneous action-related substitutions.
The result is an actual `Derivable` judgment, not semantic invariance. -/
theorem pure_substitution (L : LogicalLaws Ax S) :
    ∀ {Γ : Ctx} {σ : Ty} (a : Term Sig Γ σ), a.pure = true →
    ∀ {Δ : Ctx} (w v : Formula Sig Δ) (s t : Sub Sig Γ Δ),
      RelatedSub (Ax := Ax) (S := S) w v s t →
      EqUnder Ax S w v (act σ (S.map w v) (a.subst s)) (a.subst t)
  | _, _, .var x, _, _, w, v, s, t, h => h _ x
  | _, _, .const _, hp, _, _, _, _, _, _ => Bool.noConfusion hp
  | _, _, .app f a, hp, _, w, v, s, t, h => by
    have hp' : f.pure = true ∧ a.pure = true := by
      simpa only [Term.pure, Bool.and_eq_true] using hp
    have hf := pure_substitution L f hp'.1 w v s t h
    have ha := pure_substitution L a hp'.2 w v s t h
    have h₁ := act_app L.toInvolutionLaws w v (f.subst s) (a.subst s)
    have h₂ := Derivable.eqCongrFun hf (act _ (S.map w v) (a.subst s))
    have h₃ := Derivable.eqCongr (f.subst t) ha
    exact Derivable.eqTrans h₁ (Derivable.eqTrans h₂ h₃)
  | _, _, .lam b, hp, _, w, v, s, t, h => by
    have hb := pure_substitution L b hp w.weaken v.weaken
      (twistedLift (S.map w v) s) (Sub.lift t)
      (relatedSub_lift L.toInvolutionLaws w v s t h)
    have hx := L.xi w v hb
    have hβ := eqUnder_conv (Ax := Ax) (S := S) w v (actR_lam (S.map w v) s b)
    rw [S.map_weaken] at hβ
    exact Derivable.eqTrans hβ hx
  | _, _, .and, _, _, w, v, _, _, _ => L.fixes w v .and .and
  | _, _, .or, _, _, w, v, _, _, _ => L.fixes w v .or .or
  | _, _, .not, _, _, w, v, _, _, _ => L.fixes w v .not .not
  | _, _, .all σ, _, _, w, v, _, _, _ => L.fixes w v (.all σ) (.all σ)
  | _, _, .ex σ, _, _, w, v, _, _, _ => L.fixes w v (.ex σ) (.ex σ)
  | _, _, .eq σ, _, _, w, v, _, _, _ => L.fixes w v (.eq σ) (.eq σ)
  | _, _, .constR ρ, _, _, w, v, _, _, _ => L.fixes w v (.constR ρ) (.constR ρ)
  | _, _, .negR ρ, _, _, w, v, _, _, _ => L.fixes w v (.negR ρ) (.negR ρ)
  | _, _, .andR ρ, _, _, w, v, _, _, _ => L.fixes w v (.andR ρ) (.andR ρ)
  | _, _, .orR ρ, _, _, w, v, _, _, _ => L.fixes w v (.orR ρ) (.orR ρ)
  | _, _, .coextR ρ, _, _, w, v, _, _, _ => L.fixes w v (.coextR ρ) (.coextR ρ)
  | _, _, .boxR ρ, _, _, w, v, _, _, _ => L.fixes w v (.boxR ρ) (.boxR ρ)
  | _, _, .inclR ρ, _, _, w, v, _, _, _ => L.fixes w v (.inclR ρ) (.inclR ρ)

theorem pure_action (L : LogicalLaws Ax S) {Γ : Ctx} {σ : Ty}
    (w v : Formula Sig Γ) (a : Term Sig Γ σ) (hp : a.pure = true) :
    EqUnder Ax S w v (act σ (S.map w v) a) (a.subst (actSub (S.map w v) Sub.id)) := by
  have h := pure_substitution L a hp w v Sub.id (actSub (S.map w v) Sub.id)
    (fun _ _ => Derivable.refl _)
  simpa only [Term.subst_id] using h

/-- Closed pure terms are fixed, once the constructor laws have been certified. -/
theorem closed_pure_fixed (L : LogicalLaws Ax S) {Γ : Ctx} {σ : Ty}
    (w v : Formula Sig Γ) (a : Term Sig [] σ) (hp : a.pure = true) :
    EqUnder Ax S w v (act σ (S.map w v) a.close) a.close := by
  let s : Sub Sig [] Γ := Sub.ofRen Ren.ofEmpty
  have h := pure_substitution L a hp w v s s (fun _ x => nomatch x)
  simpa only [s, ← Term.rename_eq_subst] using h

end Classicism.Meta.Research.NPCPureAction
