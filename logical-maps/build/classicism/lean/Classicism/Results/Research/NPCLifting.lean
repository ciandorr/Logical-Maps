import Classicism.Modal
import Classicism.Tools.Check
import Classicism.Tools.TypeSystem
import Classicism.Tools.Schema
import Classicism.Syntax.Pure

/-!
# Conditional lambda congruence from a persistent guard

The lifting step in section 1, Lemma 2, of the Dorr/Goodsell proof in
`topics/classicism/writeups/c5-and-atomicity-imply-no-pure-contingency.md`.
The boxed implication below is supplied by necessitating a C-only derivation,
not by necessitating an arbitrary optional axiom set.
-/

namespace Classicism.Research.NPC

theorem guarded_functionality {σ τ : Type} [Ty σ] [Rel τ]
    (g : Prop) (A B : σ → τ) :
    (g → □ g) → □ (g → ∀ x, A x = B x) → g → A = B :=
  fun hg hAB h => modalized_functionality A B (modal_K _ _ hAB (hg h))

#classicism_check guarded_functionality
#classicism_types guarded_functionality
#classicism_derive guarded_functionality

theorem guarded_fregean (g p q : Prop) :
    (g → □ g) → □ (g → (p ↔ q)) → g → p = q :=
  fun hg hpq h => modalized_fregean p q (modal_K _ _ hpq (hg h))

#classicism_check guarded_fregean
#classicism_types guarded_fregean
#classicism_derive guarded_fregean

end Classicism.Research.NPC

namespace Classicism.Meta.Research.NPC

variable {Sig : Signature}

/-- Necessitation at an open variable context, still restricted to C-only
derivations with no local hypotheses. -/
theorem nec_open {Γ : Ctx} {p : Formula Sig Γ}
    (h : Derivable C.axioms [] p) : Derivable C.axioms [] (Term.box p) :=
  Derivable.subst (P := Term.top) (Q := p)
    (Hole.appL (Hole.appR (Term.eq _) Hole.hole) Term.top)
    (Derivable.weaken₁ (Derivable.mono (fun _ ha => ⟨ha, ha⟩) h))
    Derivable.top
    (Derivable.refl Term.top)

theorem beta_lam_weaken {Γ : Ctx} {σ : Ty} {ρ : RTy}
    (a : Term Sig (σ :: Γ) ρ) :
    Term.app (Term.lam a).weaken Term.v0 ≡ a := by
  have hs : Sub.compRen
      (Sub.cons (Term.v0 : Term Sig (σ :: Γ) σ) Sub.id)
      (Ren.lift (Ren.shift : Ren Γ (σ :: Γ))) = Sub.id := by
    funext τ x
    cases x <;> rfl
  have he : (a.rename (Ren.lift (Ren.shift : Ren Γ (σ :: Γ)))).instantiate
      (Term.v0 : Term Sig (σ :: Γ) σ) = a := by
    rw [Term.instantiate, Term.subst_rename, hs, Term.subst_id]
  have hb := Conv.beta (a.rename (Ren.lift (Ren.shift : Ren Γ (σ :: Γ)))) Term.v0
  rw [he] at hb
  exact hb

/-- Conditional ξ, with both the body proof and guard-persistence proof in C.
There is no closure claim for proofs using arbitrary optional axioms. -/
theorem guarded_lam {Γ : Ctx} {σ : Ty} {ρ : RTy}
    (g : Formula Sig Γ) (a b : Term Sig (σ :: Γ) ρ)
    (hg : Derivable C.axioms [] (Term.imp g (Term.box g)))
    (hab : Derivable C.axioms [g.weaken] (Term.eq' a b)) :
    Derivable C.axioms [g] (Term.eq' (Term.lam a) (Term.lam b)) := by
  have hc := Derivable.allE₃β (Ax := C.axioms) (Δ := [])
    (Derivable.ofTheorem (Derivable.mono (fun _ h => h.elim)
      (C.TheoremMinus.ofPure
        (Classicism.Research.NPC.guarded_functionality.derivable σ ρ))))
    g (Term.lam a) (Term.lam b)
  have he : Derivable C.axioms [g.weaken]
      (Term.eq' (Term.app (Term.lam a).weaken Term.v0)
        (Term.app (Term.lam b).weaken Term.v0)) :=
    Derivable.conv hab (Conv.symm (Conv.app_congr
      (Conv.app_congr (Conv.refl (Term.eq ρ)) (beta_lam_weaken a))
      (beta_lam_weaken b)))
  have hall : Derivable C.axioms [g]
      (Term.forall' (Term.eq' (Term.app (Term.lam a).weaken Term.v0)
        (Term.app (Term.lam b).weaken Term.v0))) := Derivable.allI he
  have hbox := nec_open (Derivable.impI hall)
  exact Derivable.impE (Derivable.weaken₁
    (Derivable.impE (Derivable.impE hc hg) hbox)) Derivable.hyp₀

theorem guarded_eq {Γ : Ctx} (g p q : Formula Sig Γ)
    (hg : Derivable C.axioms [] (Term.imp g (Term.box g)))
    (hpq : Derivable C.axioms [g] (Term.iff p q)) :
    Derivable C.axioms [g] (Term.eq' p q) := by
  have hc := Derivable.allE₃β (Ax := C.axioms) (Δ := [])
    (Derivable.ofTheorem (Derivable.mono (fun _ h => h.elim)
      (C.TheoremMinus.ofPure
        Classicism.Research.NPC.guarded_fregean.derivable))) g p q
  have hbox := nec_open (Derivable.impI hpq)
  exact Derivable.impE (Derivable.weaken₁
    (Derivable.impE (Derivable.impE hc hg) hbox)) Derivable.hyp₀

end Classicism.Meta.Research.NPC

#print axioms Classicism.Meta.Research.NPC.nec_open
#print axioms Classicism.Meta.Research.NPC.guarded_lam
#print axioms Classicism.Meta.Research.NPC.guarded_eq
