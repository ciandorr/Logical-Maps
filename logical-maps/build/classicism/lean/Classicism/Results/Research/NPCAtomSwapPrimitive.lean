import Classicism.Results.Research.NPCAtomSwapSeed
import Classicism.Results.Research.NPCPureActionConstants

/-!
# Concrete primitive laws for the typed atom-swap action

Instantiations of the checked shallow certificates from the Dorr/Goodsell proof,
`topics/classicism/writeups/c5-and-atomicity-imply-no-pure-contingency.md`, §§1–4.
These are actual C derivations under the concrete guard, not new assumptions.
-/

namespace Classicism.Meta.Research.NPCAtomSwap
open NPCPureAction
variable {Sig : Signature}

/-- Four-binder form of the library's simultaneous specialization lemma.
Proof pattern reused from `ActualityCoreApplication.allE₄β`. -/
private theorem allE₄β {Γ : Ctx} {Ax : AxiomSet Sig} {Δ : List (Formula Sig Γ)}
    {σ τ υ κ : Ty} {b : Formula Sig (κ :: υ :: τ :: σ :: Γ)}
    (h : Derivable Ax Δ (Term.forall' (Term.forall' (Term.forall' (Term.forall' b)))))
    (a₁ : Term Sig Γ σ) (a₂ : Term Sig Γ τ) (a₃ : Term Sig Γ υ) (a₄ : Term Sig Γ κ) :
    Derivable Ax Δ (b.subst (Sub.cons a₄ (Sub.cons a₃ (Sub.cons a₂ (Sub.cons a₁ Sub.id))))) := by
  have h₄ : Derivable Ax Δ
      ((b.subst (Sub.lift (Sub.cons a₃ (Sub.cons a₂ (Sub.cons a₁ Sub.id))))).subst
        (Sub.cons a₄ Sub.id)) := Derivable.allEβ (Derivable.allE₃β h a₁ a₂ a₃) a₄
  rw [Term.subst_subst, Sub.comp_cons_lift] at h₄
  exact h₄

theorem under_guard {Γ : Ctx} (w v p : Formula Sig Γ)
    (h : Derivable C.axioms [guard w v] (Term.imp c5 (Term.imp (hyp w v) p))) :
    Derivable C.axioms [guard w v] p :=
  Derivable.impE (Derivable.impE h (Derivable.andE₁ Derivable.hyp₀))
    (Derivable.andE₂ Derivable.hyp₀)

theorem primitive_neg {Γ : Ctx} (w v p : Formula Sig Γ) :
    EqUnder C.axioms seed w v (.app (map w v) (Term.neg p))
      (Term.neg (.app (map w v) p)) := by
  have h := Derivable.allE₃β (Ax := C.axioms) (Δ := [guard w v])
    (Derivable.ofTheorem (Derivable.mono (fun _ h => h.elim)
      (C.TheoremMinus.ofPure Classicism.Research.NPCAtomSwap.swap_neg.derivable))) w v p
  have hb : EqUnder C.axioms seed w v (body w v (Term.neg p)) (Term.neg (body w v p)) :=
    under_guard w v _ h
  exact eqUnder_convert hb (Conv.symm (map_beta w v _))
    (Conv.app_congr (Conv.refl _) (Conv.symm (map_beta w v p)))

theorem primitive_conj {Γ : Ctx} (w v p q : Formula Sig Γ) :
    EqUnder C.axioms seed w v (.app (map w v) (Term.conj p q))
      (Term.conj (.app (map w v) p) (.app (map w v) q)) := by
  have h := allE₄β (Ax := C.axioms) (Δ := [guard w v])
    (Derivable.ofTheorem (Derivable.mono (fun _ h => h.elim)
      (C.TheoremMinus.ofPure Classicism.Research.NPCAtomSwap.swap_and.derivable))) w v p q
  have hb : EqUnder C.axioms seed w v (body w v (Term.conj p q))
      (Term.conj (body w v p) (body w v q)) := under_guard w v _ h
  exact eqUnder_convert hb (Conv.symm (map_beta w v _))
    (Conv.app_congr (Conv.app_congr (Conv.refl _) (Conv.symm (map_beta w v p)))
      (Conv.symm (map_beta w v q)))

theorem primitive_disj {Γ : Ctx} (w v p q : Formula Sig Γ) :
    EqUnder C.axioms seed w v (.app (map w v) (Term.disj p q))
      (Term.disj (.app (map w v) p) (.app (map w v) q)) := by
  have h := allE₄β (Ax := C.axioms) (Δ := [guard w v])
    (Derivable.ofTheorem (Derivable.mono (fun _ h => h.elim)
      (C.TheoremMinus.ofPure Classicism.Research.NPCAtomSwap.swap_or.derivable))) w v p q
  have hb : EqUnder C.axioms seed w v (body w v (Term.disj p q))
      (Term.disj (body w v p) (body w v q)) := under_guard w v _ h
  exact eqUnder_convert hb (Conv.symm (map_beta w v _))
    (Conv.app_congr (Conv.app_congr (Conv.refl _) (Conv.symm (map_beta w v p)))
      (Conv.symm (map_beta w v q)))

theorem primitive_eq {Γ : Ctx} {σ : Ty} (w v : Formula Sig Γ) (a b : Term Sig Γ σ) :
    EqUnder C.axioms seed w v (.app (map w v) (Term.eq' a b)) (Term.eq' a b) := by
  have h := allE₄β (Ax := C.axioms) (Δ := [guard w v])
    (Derivable.ofTheorem (Derivable.mono (fun _ h => h.elim)
      (C.TheoremMinus.ofPure (Classicism.Research.NPCAtomSwap.swap_eq.derivable σ)))) w v a b
  have hb : EqUnder C.axioms seed w v (body w v (Term.eq' a b)) (Term.eq' a b) :=
    under_guard w v _ h
  exact eqUnder_convert hb (Conv.symm (map_beta w v _)) (Conv.refl _)

theorem primitive_all {Γ : Ctx} {σ : Ty} (w v : Formula Sig Γ)
    (b : Formula Sig (σ :: Γ)) :
    EqUnder C.axioms seed w v (.app (map w v) (Term.forall' b))
      (Term.forall' (.app (map w v).weaken b)) := by
  have h := Derivable.allE₃β (Ax := C.axioms) (Δ := [guard w v])
    (Derivable.ofTheorem (Derivable.mono (fun _ h => h.elim)
      (C.TheoremMinus.ofPure (Classicism.Research.NPCAtomSwap.swap_forall.derivable σ))))
    w v (Term.lam b)
  have hb : EqUnder C.axioms seed w v
      (body w v (Term.forall' (.app (Term.lam b).weaken Term.v0)))
      (Term.forall' (body w.weaken v.weaken (.app (Term.lam b).weaken Term.v0))) :=
    under_guard w v _ h
  have hβ := NPC.beta_lam_weaken b
  have ha := body_conv w v (Conv.app_congr (Conv.refl (Term.all σ)) (Conv.lam_congr hβ))
  have hc := Conv.app_congr (Conv.refl (Term.all σ)) (Conv.lam_congr
    (Conv.trans (body_conv w.weaken v.weaken hβ) (Conv.symm (map_beta w.weaken v.weaken b))))
  have he := eqUnder_convert hb (Conv.trans ha (Conv.symm (map_beta w v _))) hc
  simpa only [Term.weaken, map_rename] using he

theorem primitive_ex {Γ : Ctx} {σ : Ty} (w v : Formula Sig Γ)
    (b : Formula Sig (σ :: Γ)) :
    EqUnder C.axioms seed w v (.app (map w v) (Term.exists' b))
      (Term.exists' (.app (map w v).weaken b)) := by
  have h := Derivable.allE₃β (Ax := C.axioms) (Δ := [guard w v])
    (Derivable.ofTheorem (Derivable.mono (fun _ h => h.elim)
      (C.TheoremMinus.ofPure (Classicism.Research.NPCAtomSwap.swap_exists.derivable σ))))
    w v (Term.lam b)
  have hb : EqUnder C.axioms seed w v
      (body w v (Term.exists' (.app (Term.lam b).weaken Term.v0)))
      (Term.exists' (body w.weaken v.weaken (.app (Term.lam b).weaken Term.v0))) :=
    under_guard w v _ h
  have hβ := NPC.beta_lam_weaken b
  have ha := body_conv w v (Conv.app_congr (Conv.refl (Term.ex σ)) (Conv.lam_congr hβ))
  have hc := Conv.app_congr (Conv.refl (Term.ex σ)) (Conv.lam_congr
    (Conv.trans (body_conv w.weaken v.weaken hβ) (Conv.symm (map_beta w.weaken v.weaken b))))
  have he := eqUnder_convert hb (Conv.trans ha (Conv.symm (map_beta w v _))) hc
  simpa only [Term.weaken, map_rename] using he

theorem primitiveLaws : PrimitiveLaws C.axioms (seed (Sig := Sig)) where
  toInvolutionLaws := involutionLaws
  lift_iff := fun w v p q h => NPC.guarded_eq (guard w v) p q (persistent w v) h
  neg := primitive_neg
  conj := primitive_conj
  disj := primitive_disj
  eq := by
    intro Γ w v σ a b
    exact primitive_eq w v a b
  all := by
    intro Γ w v σ b
    exact primitive_all w v b
  ex := by
    intro Γ w v σ b
    exact primitive_ex w v b

end Classicism.Meta.Research.NPCAtomSwap

#print axioms Classicism.Meta.Research.NPCAtomSwap.primitiveLaws
