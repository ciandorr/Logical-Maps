import Classicism.Results.Research.NPCPureActionSyntax

/-!
# Object-derivation transport for typed conjugation

Source: `topics/classicism/writeups/c5-and-atomicity-imply-no-pure-contingency.md`,
section 4, Lemmas 5--7 (unpaginated), following Cian Dorr's 23 September 2026
sketch with Zachary Goodsell's permission. New formal transcription.

The interface below records explicit derivations under a guard. In the intended
application Ax is C.axioms and the guard includes boxed ND together with the two
distinct-atom hypotheses. In particular, `xi` is NOT asserted for arbitrary Ax:
its caller must supply the actual rigid-guard lifting proof. This module never
necessitates an optional hypothesis.
-/

namespace Classicism.Meta.Research.NPCPureAction

variable {Sig : Signature}

/-- Syntactic seed and guard, with their weakening identities. -/
structure Seed (Sig : Signature) where
  guard : {Γ : Ctx} → Formula Sig Γ → Formula Sig Γ → Formula Sig Γ
  map : {Γ : Ctx} → Formula Sig Γ → Formula Sig Γ → Term Sig Γ (Ty.t ⇒ RTy.t)
  guard_weaken : ∀ {Γ : Ctx} {σ : Ty} (w v : Formula Sig Γ),
    (guard w v).weaken (τ := σ) = guard w.weaken v.weaken
  map_weaken : ∀ {Γ : Ctx} {σ : Ty} (w v : Formula Sig Γ),
    (map w v).weaken (τ := σ) = map w.weaken v.weaken

abbrev EqUnder (Ax : AxiomSet Sig) (S : Seed Sig) {Γ : Ctx}
    (w v : Formula Sig Γ) {σ : Ty} (a b : Term Sig Γ σ) : Prop :=
  Derivable Ax [S.guard w v] (Term.eq' a b)

/-- Exactly the nonstructural premises needed for typed involution. -/
structure InvolutionLaws (Ax : AxiomSet Sig) (S : Seed Sig) : Prop where
  involution : ∀ {Γ : Ctx} (w v p : Formula Sig Γ),
    EqUnder Ax S w v (.app (S.map w v) (.app (S.map w v) p)) p
  xi : ∀ {Γ : Ctx} {σ : Ty} {ρ : RTy} (w v : Formula Sig Γ)
    {a b : Term Sig (σ :: Γ) ρ},
    EqUnder Ax S w.weaken v.weaken a b →
    EqUnder Ax S w v (.lam a) (.lam b)

variable {Ax : AxiomSet Sig} {S : Seed Sig}

theorem eqUnder_weaken {Γ : Ctx} {σ τ : Ty} {w v : Formula Sig Γ}
    {a b : Term Sig Γ σ} (h : EqUnder Ax S w v a b) :
    EqUnder Ax S (w.weaken (τ := τ)) v.weaken a.weaken b.weaken := by
  have h' := Derivable.rename (Ren.shift (σ := τ)) h
  change Derivable Ax [(S.guard w v).weaken]
    (Term.eq' a.weaken b.weaken) at h'
  rw [S.guard_weaken] at h'
  exact h'

theorem eqUnder_conv {Γ : Ctx} {σ : Ty} (w v : Formula Sig Γ)
    {a b : Term Sig Γ σ} (h : a ≡ b) : EqUnder Ax S w v a b :=
  Derivable.conv (Derivable.refl a)
    (Conv.app_congr (Conv.refl _) h)

mutual
  theorem act_congr (L : InvolutionLaws Ax S) (σ : Ty) {Γ : Ctx}
      (w v : Formula Sig Γ) {a b : Term Sig Γ σ}
      (h : EqUnder Ax S w v a b) :
      EqUnder Ax S w v (act σ (S.map w v) a) (act σ (S.map w v) b) := by
    cases σ with
    | e => exact h
    | var _ => exact h
    | rel ρ => exact actR_congr L ρ w v h

  theorem actR_congr (L : InvolutionLaws Ax S) (ρ : RTy) {Γ : Ctx}
      (w v : Formula Sig Γ) {a b : Term Sig Γ ρ}
      (h : EqUnder Ax S w v a b) :
      EqUnder Ax S w v (actR ρ (S.map w v) a) (actR ρ (S.map w v) b) := by
    cases ρ with
    | t => exact Derivable.eqCongr (S.map w v) h
    | arr σ τ =>
      have h' := actR_congr L τ w.weaken v.weaken
        (Derivable.eqCongrFun (eqUnder_weaken h)
          (act σ (S.map w.weaken v.weaken) Term.v0))
      have hx := L.xi w v h'
      simpa only [actR, S.map_weaken] using hx
end

mutual
  theorem act_involution (L : InvolutionLaws Ax S) (σ : Ty) {Γ : Ctx}
      (w v : Formula Sig Γ) (a : Term Sig Γ σ) :
      EqUnder Ax S w v (act σ (S.map w v) (act σ (S.map w v) a)) a := by
    cases σ with
    | e => exact Derivable.refl a
    | var _ => exact Derivable.refl a
    | rel ρ => exact actR_involution L ρ w v a

  theorem actR_involution (L : InvolutionLaws Ax S) (ρ : RTy) {Γ : Ctx}
      (w v : Formula Sig Γ) (a : Term Sig Γ ρ) :
      EqUnder Ax S w v (actR ρ (S.map w v) (actR ρ (S.map w v) a)) a := by
    cases ρ with
    | t => exact L.involution w v a
    | arr σ τ =>
      let F : Term Sig (σ :: Γ) (Ty.t ⇒ RTy.t) := S.map w.weaken v.weaken
      let x : Term Sig (σ :: Γ) σ := Term.v0
      have hc := actR_conv τ F (actR_app F a.weaken (act σ F x))
      have h₁ : EqUnder Ax S w.weaken v.weaken
          (actR τ F (.app (actR (σ ⇒ τ) F a.weaken) (act σ F x)))
          (actR τ F (actR τ F (.app a.weaken (act σ F (act σ F x))))) :=
        eqUnder_conv w.weaken v.weaken hc
      have h₂ := actR_involution L τ w.weaken v.weaken
        (.app a.weaken (act σ F (act σ F x)))
      have h₃ := Derivable.eqCongr a.weaken (act_involution L σ w.weaken v.weaken x)
      have hb := Derivable.eqTrans h₁ (Derivable.eqTrans h₂ h₃)
      have hx := L.xi w v hb
      have hy : EqUnder Ax S w v
          (actR (σ ⇒ τ) (S.map w v) (actR (σ ⇒ τ) (S.map w v) a))
          (.lam (.app a.weaken Term.v0)) := by
        change EqUnder Ax S w v
          (.lam (actR τ (S.map w v).weaken
            (.app (actR (σ ⇒ τ) (S.map w v) a).weaken
              (act σ (S.map w v).weaken Term.v0)))) _
        rw [actR_weaken, S.map_weaken]
        exact hx
      exact Derivable.eqTrans hy (eqUnder_conv w v (Conv.eta a))
end

/-- Equivariance of application, derived from the recursive definition and
typed involution, rather than assumed as a new law. -/
theorem act_app (L : InvolutionLaws Ax S) {Γ : Ctx} {σ : Ty} {ρ : RTy}
    (w v : Formula Sig Γ) (f : Term Sig Γ (σ ⇒ ρ)) (a : Term Sig Γ σ) :
    EqUnder Ax S w v
      (actR ρ (S.map w v) (.app f a))
      (.app (actR (σ ⇒ ρ) (S.map w v) f) (act σ (S.map w v) a)) := by
  have h₁ := eqUnder_conv (Ax := Ax) (S := S) w v
    (actR_app (S.map w v) f (act σ (S.map w v) a))
  have h₂ := actR_congr L ρ w v
    (Derivable.eqCongr f (act_involution L σ w v a))
  exact Derivable.eqSymm (Derivable.eqTrans h₁ h₂)

end Classicism.Meta.Research.NPCPureAction
