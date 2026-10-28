import Classicism.Results.Research.NPCPureActionInduction

/-!
# Fixing logical constants under typed conjugation

Source: `topics/classicism/writeups/c5-and-atomicity-imply-no-pure-contingency.md`,
section 4, Lemma 6 (unpaginated), following Cian Dorr's 23 September 2026 sketch
with Zachary Goodsell's permission. New formal transcription. The seed laws are
explicit object derivations; no Boolean-valued or extensional model is used.
-/

namespace Classicism.Meta.Research.NPCPureAction

variable {Sig : Signature} {Ax : AxiomSet Sig} {S : Seed Sig}

/-- Propositional seed laws proved by the concrete atom-swap argument. -/
structure PrimitiveLaws (Ax : AxiomSet Sig) (S : Seed Sig)
    extends InvolutionLaws Ax S : Prop where
  lift_iff : ∀ {Γ : Ctx} (w v p q : Formula Sig Γ),
    Derivable Ax [S.guard w v] (Term.iff p q) → EqUnder Ax S w v p q
  neg : ∀ {Γ : Ctx} (w v p : Formula Sig Γ),
    EqUnder Ax S w v (Term.app (S.map w v) (Term.neg p)) (Term.neg (Term.app (S.map w v) p))
  conj : ∀ {Γ : Ctx} (w v p q : Formula Sig Γ),
    EqUnder Ax S w v (Term.app (S.map w v) (Term.conj p q))
      (Term.conj (Term.app (S.map w v) p) (Term.app (S.map w v) q))
  disj : ∀ {Γ : Ctx} (w v p q : Formula Sig Γ),
    EqUnder Ax S w v (Term.app (S.map w v) (Term.disj p q))
      (Term.disj (Term.app (S.map w v) p) (Term.app (S.map w v) q))
  eq : ∀ {Γ : Ctx} (w v : Formula Sig Γ) {σ : Ty} (a b : Term Sig Γ σ),
    EqUnder Ax S w v (Term.app (S.map w v) (Term.eq' a b)) (Term.eq' a b)
  all : ∀ {Γ : Ctx} (w v : Formula Sig Γ) {σ : Ty} (b : Formula Sig (σ :: Γ)),
    EqUnder Ax S w v (Term.app (S.map w v) (Term.forall' b))
      (Term.forall' (Term.app (S.map w v).weaken b))
  ex : ∀ {Γ : Ctx} (w v : Formula Sig Γ) {σ : Ty} (b : Formula Sig (σ :: Γ)),
    EqUnder Ax S w v (Term.app (S.map w v) (Term.exists' b))
      (Term.exists' (Term.app (S.map w v).weaken b))

theorem eqUnder_convert {Γ : Ctx} {σ : Ty} {w v : Formula Sig Γ}
    {a b a' b' : Term Sig Γ σ} (h : EqUnder Ax S w v a b)
    (ha : a ≡ a') (hb : b ≡ b') : EqUnder Ax S w v a' b' :=
  Derivable.conv h (Conv.app_congr (Conv.app_congr (Conv.refl _) ha) hb)

/-- A guarded pointwise identity yields equality with a function, using only
the explicitly supplied guarded xi and eta conversion. -/
theorem arrow_action_eq (L : InvolutionLaws Ax S) {Γ : Ctx} {σ : Ty} {ρ : RTy}
    (w v : Formula Sig Γ) (c d : Term Sig Γ (σ ⇒ ρ))
    (h : EqUnder Ax S w.weaken v.weaken
      (actR ρ (S.map w.weaken v.weaken)
        (Term.app c.weaken (act σ (S.map w.weaken v.weaken) Term.v0)))
      (Term.app d.weaken Term.v0)) :
    EqUnder Ax S w v (actR (σ ⇒ ρ) (S.map w v) c) d := by
  have hx := L.xi w v h
  have he : EqUnder Ax S w v (actR (σ ⇒ ρ) (S.map w v) c)
      (.lam (Term.app d.weaken Term.v0)) := by
    change EqUnder Ax S w v
      (.lam (actR ρ (S.map w v).weaken
        (Term.app c.weaken (act σ (S.map w v).weaken Term.v0)))) _
    rw [S.map_weaken]
    exact hx
  exact Derivable.eqTrans he (eqUnder_conv w v (Conv.eta d))

theorem arrow_fixed (L : InvolutionLaws Ax S) {Γ : Ctx} {σ : Ty} {ρ : RTy}
    (w v : Formula Sig Γ) (c : Term Sig Γ (σ ⇒ ρ))
    (h : EqUnder Ax S w.weaken v.weaken
      (actR ρ (S.map w.weaken v.weaken)
        (Term.app c.weaken (act σ (S.map w.weaken v.weaken) Term.v0)))
      (Term.app c.weaken Term.v0)) :
    EqUnder Ax S w v (actR (σ ⇒ ρ) (S.map w v) c) c :=
  arrow_action_eq L w v c c h

theorem fixes_not (L : PrimitiveLaws Ax S) {Γ : Ctx} (w v : Formula Sig Γ) :
    EqUnder Ax S w v (act _ (S.map w v) Term.not) Term.not := by
  apply arrow_fixed L.toInvolutionLaws
  exact Derivable.eqTrans
    (L.neg w.weaken v.weaken (Term.app (S.map w.weaken v.weaken) Term.v0))
    (Derivable.eqCongr Term.not (L.involution w.weaken v.weaken Term.v0))

theorem fixes_and (L : PrimitiveLaws Ax S) {Γ : Ctx} (w v : Formula Sig Γ) :
    EqUnder Ax S w v (act _ (S.map w v) Term.and) Term.and := by
  apply arrow_fixed L.toInvolutionLaws
  apply arrow_action_eq L.toInvolutionLaws
  simp only [act, actR, Term.weaken, Term.rename_app, Term.rename_and,
    Term.rename_var, S.map_weaken]
  change EqUnder Ax S _ _
    (Term.app (S.map w.weaken.weaken v.weaken.weaken)
      (Term.conj (Term.app (S.map w.weaken.weaken v.weaken.weaken) Term.v1)
        (Term.app (S.map w.weaken.weaken v.weaken.weaken) Term.v0)))
    (Term.app (Term.app Term.and Term.v1) Term.v0)
  exact Derivable.eqTrans (L.conj _ _ _ _)
    (Derivable.eqTrans
      (Derivable.eqCongrFun (Derivable.eqCongr Term.and (L.involution _ _ Term.v1)) _)
      (Derivable.eqCongr (Term.app Term.and Term.v1) (L.involution _ _ Term.v0)))

theorem fixes_or (L : PrimitiveLaws Ax S) {Γ : Ctx} (w v : Formula Sig Γ) :
    EqUnder Ax S w v (act _ (S.map w v) Term.or) Term.or := by
  apply arrow_fixed L.toInvolutionLaws
  apply arrow_action_eq L.toInvolutionLaws
  simp only [act, actR, Term.weaken, Term.rename_app, Term.rename_or,
    Term.rename_var, S.map_weaken]
  change EqUnder Ax S _ _
    (Term.app (S.map w.weaken.weaken v.weaken.weaken)
      (Term.disj (Term.app (S.map w.weaken.weaken v.weaken.weaken) Term.v1)
        (Term.app (S.map w.weaken.weaken v.weaken.weaken) Term.v0)))
    (Term.app (Term.app Term.or Term.v1) Term.v0)
  exact Derivable.eqTrans (L.disj _ _ _ _)
    (Derivable.eqTrans
      (Derivable.eqCongrFun (Derivable.eqCongr Term.or (L.involution _ _ Term.v1)) _)
      (Derivable.eqCongr (Term.app Term.or Term.v1) (L.involution _ _ Term.v0)))

/-- The metalevel action at a relational type is represented by an admitted
unary relation when an ordinary LL congruence is needed. No e -> e term occurs. -/
theorem action_beta {Γ : Ctx} {ρ : RTy}
    (F : Term Sig Γ (Ty.t ⇒ RTy.t)) (a : Term Sig Γ ρ) :
    Term.app (.lam (actR ρ F.weaken Term.v0)) a ≡ actR ρ F a := by
  have h := Conv.beta' (actR ρ F.weaken Term.v0) a
  simpa only [Term.instantiate, actR_subst, Term.subst_var, Sub.cons_zero,
    Term.instantiate_weaken] using h

/-- Congruence in arbitrary local hypotheses, proved by LL rather than ξ. -/
theorem action_congr_local {Γ : Ctx} {Δ : List (Formula Sig Γ)} (σ : Ty)
    (F : Term Sig Γ (Ty.t ⇒ RTy.t)) {a b : Term Sig Γ σ}
    (h : Derivable Ax Δ (Term.eq' a b)) :
    Derivable Ax Δ (Term.eq' (act σ F a) (act σ F b)) := by
  cases σ with
  | e => exact h
  | var _ => exact h
  | rel ρ =>
    exact Derivable.conv (Derivable.eqCongr (.lam (actR ρ F.weaken Term.v0)) h)
      (Conv.app_congr (Conv.app_congr (Conv.refl _) (action_beta F a)) (action_beta F b))

theorem equality_reindex (L : PrimitiveLaws Ax S) {Γ : Ctx} {σ : Ty}
    (w v : Formula Sig Γ) (a b : Term Sig Γ σ) :
    EqUnder Ax S w v
      (Term.eq' (act σ (S.map w v) a) (act σ (S.map w v) b)) (Term.eq' a b) := by
  apply L.lift_iff
  apply Derivable.iffI
  · exact Derivable.eqTrans
      (Derivable.eqSymm (Derivable.weaken₁ (act_involution L.toInvolutionLaws σ w v a)))
      (Derivable.eqTrans (action_congr_local σ (S.map w v) Derivable.hyp₀)
        (Derivable.weaken₁ (act_involution L.toInvolutionLaws σ w v b)))
  · exact action_congr_local σ (S.map w v) Derivable.hyp₀

theorem fixes_eq (L : PrimitiveLaws Ax S) {Γ : Ctx} (w v : Formula Sig Γ) (σ : Ty) :
    EqUnder Ax S w v (act _ (S.map w v) (.eq σ)) (.eq σ) := by
  apply arrow_fixed L.toInvolutionLaws
  apply arrow_action_eq L.toInvolutionLaws
  simp only [Term.weaken, Term.rename_app, Term.rename_eq,
    act_rename, Term.rename_var, S.map_weaken]
  change EqUnder Ax S _ _
    (Term.app (S.map w.weaken.weaken v.weaken.weaken)
      (Term.eq' (act σ (S.map w.weaken.weaken v.weaken.weaken) Term.v1)
        (act σ (S.map w.weaken.weaken v.weaken.weaken) Term.v0)))
    (Term.eq' Term.v1 Term.v0)
  exact Derivable.eqTrans (L.eq _ _ _ _) (equality_reindex L _ _ Term.v1 Term.v0)

/-- Precomposition by the typed action is an admitted predicate at every type. -/
def pullback {Γ : Ctx} {σ : Ty} (F : Term Sig Γ (Ty.t ⇒ RTy.t))
    (P : Term Sig Γ (σ ⇒ RTy.t)) : Term Sig Γ (σ ⇒ RTy.t) :=
  .lam (Term.app P.weaken (act σ F.weaken Term.v0))

theorem pullback_beta {Γ : Ctx} {σ : Ty} (F : Term Sig Γ (Ty.t ⇒ RTy.t))
    (P : Term Sig Γ (σ ⇒ RTy.t)) (a : Term Sig Γ σ) :
    Term.app (pullback F P) a ≡ .app P (act σ F a) := by
  change Term.app (.lam (.app P.weaken (act σ F.weaken Term.v0))) a ≡ _
  have h := Conv.beta' (Term.app P.weaken (act σ F.weaken Term.v0)) a
  simpa only [Term.instantiate, Term.subst_app, act_subst, Term.subst_var,
    Sub.cons_zero, Term.instantiate_weaken] using h

theorem pullback_weaken {Γ : Ctx} {σ τ : Ty} (F : Term Sig Γ (Ty.t ⇒ RTy.t))
    (P : Term Sig Γ (σ ⇒ RTy.t)) :
    (pullback F P).weaken (τ := τ) = pullback F.weaken P.weaken := by
  simp only [pullback, Term.weaken, Term.rename_lam, Term.rename_app, act_rename,
    Term.rename_var, Term.rename_rename]
  rfl

theorem forall_reindex (L : PrimitiveLaws Ax S) {Γ : Ctx} {σ : Ty}
    (w v : Formula Sig Γ) (P : Term Sig Γ (σ ⇒ RTy.t)) :
    EqUnder Ax S w v (Term.app (.all σ) (pullback (S.map w v) P)) (Term.app (.all σ) P) := by
  apply L.lift_iff
  apply Derivable.iffI
  · have hInst : Derivable Ax
        [(Term.app (.all σ) (pullback (S.map w v) P)).weaken,
          S.guard w.weaken v.weaken]
        (Term.app (pullback (S.map w v) P).weaken
          (act σ (S.map w.weaken v.weaken) Term.v0)) :=
      Derivable.allE Derivable.hyp₀ _
    rw [pullback_weaken, S.map_weaken] at hInst
    have hPoint := Derivable.eqMp
      (Derivable.eqCongr P.weaken (Derivable.weaken₁
        (act_involution L.toInvolutionLaws σ w.weaken v.weaken
          (Term.v0 : Term Sig (σ :: Γ) σ))))
      (Derivable.conv hInst (pullback_beta _ _ _))
    have hAll : Derivable Ax
        [.app (.all σ) (pullback (S.map w v) P), S.guard w v]
        (Term.forall' (Term.app P.weaken Term.v0)) := by
      apply Derivable.allI
      simpa only [Hyps.weaken, List.map_cons, List.map_nil, S.guard_weaken] using hPoint
    exact Derivable.conv hAll (Conv.app_congr (Conv.refl _) (Conv.eta P))
  · have hPoint : Derivable Ax
        [(Term.app (.all σ) P).weaken, S.guard w.weaken v.weaken]
        (Term.app P.weaken (act σ (S.map w v).weaken Term.v0)) :=
      Derivable.allE Derivable.hyp₀ _
    apply Derivable.allI
    simpa only [Hyps.weaken, List.map_cons, List.map_nil, S.guard_weaken] using hPoint

theorem exists_reindex (L : PrimitiveLaws Ax S) {Γ : Ctx} {σ : Ty}
    (w v : Formula Sig Γ) (P : Term Sig Γ (σ ⇒ RTy.t)) :
    EqUnder Ax S w v (Term.app (.ex σ) (pullback (S.map w v) P)) (Term.app (.ex σ) P) := by
  apply L.lift_iff
  apply Derivable.iffI
  · apply Derivable.exE Derivable.hyp₀
    have hPoint : Derivable Ax
        [.app (pullback (S.map w v) P).weaken Term.v0,
          (Term.app (.ex σ) (pullback (S.map w v) P)).weaken, (S.guard w v).weaken]
        (Term.app P.weaken (act σ (S.map w v).weaken Term.v0)) := by
      have hc := pullback_beta (S.map w v).weaken P.weaken Term.v0
      rw [← pullback_weaken] at hc
      exact Derivable.conv Derivable.hyp₀ hc
    exact Derivable.exI (act σ (S.map w v).weaken Term.v0) hPoint
  · apply Derivable.exE Derivable.hyp₀
    have hInv := Derivable.weaken₁ (q := .app P.weaken Term.v0)
      (Derivable.weaken₁ (q := (Term.app (.ex σ) P).weaken)
        (act_involution L.toInvolutionLaws σ w.weaken v.weaken
          (Term.v0 : Term Sig (σ :: Γ) σ)))
    have hPoint : Derivable Ax
        [.app P.weaken Term.v0, (Term.app (.ex σ) P).weaken, (S.guard w v).weaken]
        (Term.app P.weaken (act σ (S.map w v).weaken (act σ (S.map w v).weaken Term.v0))) := by
      rw [S.guard_weaken, S.map_weaken]
      exact Derivable.eqMpr (Derivable.eqCongr P.weaken hInv) Derivable.hyp₀
    have hc := pullback_beta (S.map w v).weaken P.weaken
      (act σ (S.map w v).weaken Term.v0)
    rw [← pullback_weaken] at hc
    exact Derivable.exI (act σ (S.map w v).weaken Term.v0)
      (Derivable.conv hPoint (Conv.symm hc))

theorem fixes_all (L : PrimitiveLaws Ax S) {Γ : Ctx} (w v : Formula Sig Γ) (σ : Ty) :
    EqUnder Ax S w v (act _ (S.map w v) (.all σ)) (.all σ) := by
  apply arrow_fixed L.toInvolutionLaws
  let P : Term Sig ((σ ⇒ RTy.t) :: Γ) (σ ⇒ RTy.t) := Term.v0
  let F := S.map (w.weaken (τ := σ ⇒ RTy.t)) v.weaken
  let b : Formula Sig (σ :: (σ ⇒ RTy.t) :: Γ) :=
    .app P.weaken (act σ F.weaken Term.v0)
  have h₁ := L.all w.weaken v.weaken (Term.app F.weaken b)
  simp only [F, S.map_weaken] at h₁
  have hb := L.involution w.weaken.weaken v.weaken.weaken b
  have h₂ := Derivable.eqCongr (.all σ) (L.xi w.weaken v.weaken hb)
  have h₃ := forall_reindex L w.weaken v.weaken P
  have h := Derivable.eqTrans h₁ (Derivable.eqTrans h₂ h₃)
  simpa only [act, actR, F, P, b, S.map_weaken, pullback,
    Term.weaken, Term.rename_all] using h

theorem fixes_ex (L : PrimitiveLaws Ax S) {Γ : Ctx} (w v : Formula Sig Γ) (σ : Ty) :
    EqUnder Ax S w v (act _ (S.map w v) (.ex σ)) (.ex σ) := by
  apply arrow_fixed L.toInvolutionLaws
  let P : Term Sig ((σ ⇒ RTy.t) :: Γ) (σ ⇒ RTy.t) := Term.v0
  let F := S.map (w.weaken (τ := σ ⇒ RTy.t)) v.weaken
  let b : Formula Sig (σ :: (σ ⇒ RTy.t) :: Γ) :=
    .app P.weaken (act σ F.weaken Term.v0)
  have h₁ := L.ex w.weaken v.weaken (Term.app F.weaken b)
  simp only [F, S.map_weaken] at h₁
  have hb := L.involution w.weaken.weaken v.weaken.weaken b
  have h₂ := Derivable.eqCongr (.ex σ) (L.xi w.weaken v.weaken hb)
  have h₃ := exists_reindex L w.weaken v.weaken P
  have h := Derivable.eqTrans h₁ (Derivable.eqTrans h₂ h₃)
  simpa only [act, actR, F, P, b, S.map_weaken, pullback,
    Term.weaken, Term.rename_ex] using h

end Classicism.Meta.Research.NPCPureAction
