import Classicism.Results.Research.NPCPureActionConstants

/-!
# The defined relational operations under typed conjugation

Source: `topics/classicism/writeups/c5-and-atomicity-imply-no-pure-contingency.md`,
section 4, Lemmas 6--7 (unpaginated), following Cian Dorr's 23 September 2026
sketch with Zachary Goodsell's permission. New formal transcription.

Each defined operation is unfolded by its actual delta conversion. The expanded
term respects action-related substitutions by application and guarded abstraction;
the recursive occurrences concern strictly smaller relational types. This supplies
all constructor cases of `LogicalLaws`, without assuming invariance of pure terms.
-/

namespace Classicism.Meta.Research.NPCPureAction

variable {Sig : Signature} {Ax : AxiomSet Sig} {S : Seed Sig}

/-- Compatibility with action-related simultaneous substitutions. This property
can be assembled for individual templates without presupposing `LogicalLaws`. -/
def Respects {Γ : Ctx} {σ : Ty} (a : Term Sig Γ σ) : Prop :=
  ∀ {Δ : Ctx} (w v : Formula Sig Δ) (s t : Sub Sig Γ Δ),
    RelatedSub (Ax := Ax) (S := S) w v s t →
    EqUnder Ax S w v (act σ (S.map w v) (a.subst s)) (a.subst t)

theorem respects_var {Γ : Ctx} {σ : Ty} (x : Var Γ σ) :
    Respects (Ax := Ax) (S := S) (.var x) := by
  intro Δ w v s t h
  exact h σ x

theorem respects_app (L : InvolutionLaws Ax S) {Γ : Ctx} {σ : Ty} {ρ : RTy}
    {f : Term Sig Γ (σ ⇒ ρ)} {a : Term Sig Γ σ}
    (hf : Respects (Ax := Ax) (S := S) f) (ha : Respects (Ax := Ax) (S := S) a) :
    Respects (Ax := Ax) (S := S) (.app f a) := by
  intro Δ w v s t h
  have h₁ := act_app L w v (f.subst s) (a.subst s)
  have h₂ := Derivable.eqCongrFun (hf w v s t h) (act _ (S.map w v) (a.subst s))
  have h₃ := Derivable.eqCongr (f.subst t) (ha w v s t h)
  exact Derivable.eqTrans h₁ (Derivable.eqTrans h₂ h₃)

theorem respects_lam (L : InvolutionLaws Ax S) {Γ : Ctx} {σ : Ty} {ρ : RTy}
    {b : Term Sig (σ :: Γ) ρ} (hb : Respects (Ax := Ax) (S := S) b) :
    Respects (Ax := Ax) (S := S) (.lam b) := by
  intro Δ w v s t h
  have hb' := hb w.weaken v.weaken
    (twistedLift (S.map w v) s) (Sub.lift t) (relatedSub_lift L w v s t h)
  have hx := L.xi w v hb'
  have hβ := eqUnder_conv (Ax := Ax) (S := S) w v (actR_lam (S.map w v) s b)
  rw [S.map_weaken] at hβ
  exact Derivable.eqTrans hβ hx

/-- A delta expansion is transported through both substitutions, before any
guarded object equality is used. -/
theorem respects_delta {Γ : Ctx} {σ : Ty} {a b : Term Sig Γ σ}
    (hb : Respects (Ax := Ax) (S := S) b)
    (hd : ∀ {Δ : Ctx} (s : Sub Sig Γ Δ), (a.subst s).unfoldR = some (b.subst s)) :
    Respects (Ax := Ax) (S := S) a := by
  intro Δ w v s t h
  exact eqUnder_convert (hb w v s t h)
    (Conv.symm (act_conv σ (S.map w v) (Conv.delta (hd s))))
    (Conv.symm (Conv.delta (hd t)))

theorem respects_and (L : PrimitiveLaws Ax S) {Γ : Ctx} :
    Respects (Ax := Ax) (S := S) (Term.and (Γ := Γ)) := by
  intro Δ w v s t h
  exact fixes_and L w v

theorem respects_or (L : PrimitiveLaws Ax S) {Γ : Ctx} :
    Respects (Ax := Ax) (S := S) (Term.or (Γ := Γ)) := by
  intro Δ w v s t h
  exact fixes_or L w v

theorem respects_not (L : PrimitiveLaws Ax S) {Γ : Ctx} :
    Respects (Ax := Ax) (S := S) (Term.not (Γ := Γ)) := by
  intro Δ w v s t h
  exact fixes_not L w v

theorem respects_all (L : PrimitiveLaws Ax S) {Γ : Ctx} (σ : Ty) :
    Respects (Ax := Ax) (S := S) (Term.all (Γ := Γ) σ) := by
  intro Δ w v s t h
  exact fixes_all L w v σ

theorem respects_ex (L : PrimitiveLaws Ax S) {Γ : Ctx} (σ : Ty) :
    Respects (Ax := Ax) (S := S) (Term.ex (Γ := Γ) σ) := by
  intro Δ w v s t h
  exact fixes_ex L w v σ

theorem respects_eq (L : PrimitiveLaws Ax S) {Γ : Ctx} (σ : Ty) :
    Respects (Ax := Ax) (S := S) (Term.eq (Γ := Γ) σ) := by
  intro Δ w v s t h
  exact fixes_eq L w v σ

theorem respects_conj (L : PrimitiveLaws Ax S) {Γ : Ctx} {p q : Formula Sig Γ}
    (hp : Respects (Ax := Ax) (S := S) p) (hq : Respects (Ax := Ax) (S := S) q) :
    Respects (Ax := Ax) (S := S) (Term.conj p q) :=
  respects_app L.toInvolutionLaws (respects_app L.toInvolutionLaws (respects_and L) hp) hq

theorem respects_disj (L : PrimitiveLaws Ax S) {Γ : Ctx} {p q : Formula Sig Γ}
    (hp : Respects (Ax := Ax) (S := S) p) (hq : Respects (Ax := Ax) (S := S) q) :
    Respects (Ax := Ax) (S := S) (Term.disj p q) :=
  respects_app L.toInvolutionLaws (respects_app L.toInvolutionLaws (respects_or L) hp) hq

theorem respects_neg (L : PrimitiveLaws Ax S) {Γ : Ctx} {p : Formula Sig Γ}
    (hp : Respects (Ax := Ax) (S := S) p) :
    Respects (Ax := Ax) (S := S) (Term.neg p) :=
  respects_app L.toInvolutionLaws (respects_not L) hp

theorem respects_imp (L : PrimitiveLaws Ax S) {Γ : Ctx} {p q : Formula Sig Γ}
    (hp : Respects (Ax := Ax) (S := S) p) (hq : Respects (Ax := Ax) (S := S) q) :
    Respects (Ax := Ax) (S := S) (Term.imp p q) :=
  respects_disj L (respects_neg L hp) hq

theorem respects_iff (L : PrimitiveLaws Ax S) {Γ : Ctx} {p q : Formula Sig Γ}
    (hp : Respects (Ax := Ax) (S := S) p) (hq : Respects (Ax := Ax) (S := S) q) :
    Respects (Ax := Ax) (S := S) (Term.iff p q) :=
  respects_conj L (respects_imp L hp hq) (respects_imp L hq hp)

theorem respects_forall (L : PrimitiveLaws Ax S) {Γ : Ctx} {σ : Ty}
    {b : Formula Sig (σ :: Γ)} (hb : Respects (Ax := Ax) (S := S) b) :
    Respects (Ax := Ax) (S := S) (Term.forall' b) :=
  respects_app L.toInvolutionLaws (respects_all L σ) (respects_lam L.toInvolutionLaws hb)

theorem respects_top (L : PrimitiveLaws Ax S) {Γ : Ctx} :
    Respects (Ax := Ax) (S := S) (Term.top (Γ := Γ)) :=
  respects_disj L (respects_forall L (respects_var .zero))
    (respects_neg L (respects_forall L (respects_var .zero)))

theorem respects_box (L : PrimitiveLaws Ax S) {Γ : Ctx} {p : Formula Sig Γ}
    (hp : Respects (Ax := Ax) (S := S) p) :
    Respects (Ax := Ax) (S := S) (Term.box p) :=
  respects_app L.toInvolutionLaws
    (respects_app L.toInvolutionLaws (respects_eq L Ty.t) hp) (respects_top L)

theorem respects_constR (L : PrimitiveLaws Ax S) (ρ : RTy) {Γ : Ctx} :
    Respects (Ax := Ax) (S := S) (Term.constR (Γ := Γ) ρ) := by
  cases ρ with
  | t =>
    exact respects_delta (respects_lam L.toInvolutionLaws (respects_var .zero)) (fun _ => rfl)
  | arr σ τ =>
    exact respects_delta
      (respects_lam L.toInvolutionLaws (respects_lam L.toInvolutionLaws
        (respects_app L.toInvolutionLaws (respects_constR L τ) (respects_var (.succ .zero)))))
      (fun _ => rfl)

theorem respects_negR (L : PrimitiveLaws Ax S) (ρ : RTy) {Γ : Ctx} :
    Respects (Ax := Ax) (S := S) (Term.negR (Γ := Γ) ρ) := by
  cases ρ with
  | t => exact respects_delta (respects_not L) (fun _ => rfl)
  | arr σ τ =>
    exact respects_delta
      (respects_lam L.toInvolutionLaws (respects_lam L.toInvolutionLaws
        (respects_app L.toInvolutionLaws (respects_negR L τ)
          (respects_app L.toInvolutionLaws (respects_var (.succ .zero)) (respects_var .zero)))))
      (fun _ => rfl)

theorem respects_andR (L : PrimitiveLaws Ax S) (ρ : RTy) {Γ : Ctx} :
    Respects (Ax := Ax) (S := S) (Term.andR (Γ := Γ) ρ) := by
  cases ρ with
  | t => exact respects_delta (respects_and L) (fun _ => rfl)
  | arr σ τ =>
    exact respects_delta
      (respects_lam L.toInvolutionLaws (respects_lam L.toInvolutionLaws
        (respects_lam L.toInvolutionLaws
          (respects_app L.toInvolutionLaws
            (respects_app L.toInvolutionLaws (respects_andR L τ)
              (respects_app L.toInvolutionLaws (respects_var (.succ (.succ .zero))) (respects_var .zero)))
            (respects_app L.toInvolutionLaws (respects_var (.succ .zero)) (respects_var .zero))))))
      (fun _ => rfl)

theorem respects_orR (L : PrimitiveLaws Ax S) (ρ : RTy) {Γ : Ctx} :
    Respects (Ax := Ax) (S := S) (Term.orR (Γ := Γ) ρ) := by
  cases ρ with
  | t => exact respects_delta (respects_or L) (fun _ => rfl)
  | arr σ τ =>
    exact respects_delta
      (respects_lam L.toInvolutionLaws (respects_lam L.toInvolutionLaws
        (respects_lam L.toInvolutionLaws
          (respects_app L.toInvolutionLaws
            (respects_app L.toInvolutionLaws (respects_orR L τ)
              (respects_app L.toInvolutionLaws (respects_var (.succ (.succ .zero))) (respects_var .zero)))
            (respects_app L.toInvolutionLaws (respects_var (.succ .zero)) (respects_var .zero))))))
      (fun _ => rfl)

theorem respects_coextR (L : PrimitiveLaws Ax S) (ρ : RTy) {Γ : Ctx} :
    Respects (Ax := Ax) (S := S) (Term.coextR (Γ := Γ) ρ) := by
  cases ρ with
  | t =>
    exact respects_delta (respects_lam L.toInvolutionLaws (respects_lam L.toInvolutionLaws
      (respects_iff L (respects_var (.succ .zero)) (respects_var .zero)))) (fun _ => rfl)
  | arr σ τ =>
    exact respects_delta
      (respects_lam L.toInvolutionLaws (respects_lam L.toInvolutionLaws
        (respects_forall L
          (respects_app L.toInvolutionLaws
            (respects_app L.toInvolutionLaws (respects_coextR L τ)
              (respects_app L.toInvolutionLaws (respects_var (.succ (.succ .zero))) (respects_var .zero)))
            (respects_app L.toInvolutionLaws (respects_var (.succ .zero)) (respects_var .zero))))))
      (fun _ => rfl)

theorem respects_boxR (L : PrimitiveLaws Ax S) (ρ : RTy) {Γ : Ctx} :
    Respects (Ax := Ax) (S := S) (Term.boxR (Γ := Γ) ρ) := by
  cases ρ with
  | t =>
    exact respects_delta (respects_lam L.toInvolutionLaws (respects_box L (respects_var .zero)))
      (fun _ => rfl)
  | arr σ τ =>
    exact respects_delta
      (respects_lam L.toInvolutionLaws (respects_lam L.toInvolutionLaws
        (respects_app L.toInvolutionLaws (respects_boxR L τ)
          (respects_app L.toInvolutionLaws (respects_var (.succ .zero)) (respects_var .zero)))))
      (fun _ => rfl)

theorem respects_inclR (L : PrimitiveLaws Ax S) (ρ : RTy) {Γ : Ctx} :
    Respects (Ax := Ax) (S := S) (Term.inclR (Γ := Γ) ρ) := by
  cases ρ with
  | t =>
    exact respects_delta (respects_lam L.toInvolutionLaws (respects_lam L.toInvolutionLaws
      (respects_imp L (respects_var (.succ .zero)) (respects_var .zero)))) (fun _ => rfl)
  | arr σ τ =>
    exact respects_delta
      (respects_lam L.toInvolutionLaws (respects_lam L.toInvolutionLaws
        (respects_forall L
          (respects_app L.toInvolutionLaws
            (respects_app L.toInvolutionLaws (respects_inclR L τ)
              (respects_app L.toInvolutionLaws (respects_var (.succ (.succ .zero))) (respects_var .zero)))
            (respects_app L.toInvolutionLaws (respects_var (.succ .zero)) (respects_var .zero))))))
      (fun _ => rfl)

theorem fixed_of_respects_closed {σ : Ty} {a : Term Sig [] σ}
    (h : Respects (Ax := Ax) (S := S) a) {Γ : Ctx} (w v : Formula Sig Γ) :
    EqUnder Ax S w v (act σ (S.map w v) a.close) a.close := by
  let s : Sub Sig [] Γ := Sub.ofRen Ren.ofEmpty
  have hx := h w v s s (fun _ x => nomatch x)
  simpa only [s, ← Term.rename_eq_subst] using hx

/-- All intrinsic logical constructor nodes are now accounted for. The only
nonstructural premises are the concrete propositional seed laws. -/
def logicalLaws (L : PrimitiveLaws Ax S) : LogicalLaws Ax S where
  toInvolutionLaws := L.toInvolutionLaws
  fixes := by
    intro Γ σ w v c hc
    cases hc with
    | and => exact fixes_and L w v
    | or => exact fixes_or L w v
    | not => exact fixes_not L w v
    | all σ => exact fixes_all L w v σ
    | ex σ => exact fixes_ex L w v σ
    | eq σ => exact fixes_eq L w v σ
    | constR ρ => exact fixed_of_respects_closed (respects_constR L ρ) w v
    | negR ρ => exact fixed_of_respects_closed (respects_negR L ρ) w v
    | andR ρ => exact fixed_of_respects_closed (respects_andR L ρ) w v
    | orR ρ => exact fixed_of_respects_closed (respects_orR L ρ) w v
    | coextR ρ => exact fixed_of_respects_closed (respects_coextR L ρ) w v
    | boxR ρ => exact fixed_of_respects_closed (respects_boxR L ρ) w v
    | inclR ρ => exact fixed_of_respects_closed (respects_inclR L ρ) w v

end Classicism.Meta.Research.NPCPureAction
