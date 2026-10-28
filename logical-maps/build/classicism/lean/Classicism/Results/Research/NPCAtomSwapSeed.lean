import Classicism.Results.Research.NPCAtomSwapCertificates
import Classicism.Results.Research.NPCPureActionDerivation
import Classicism.Results.Research.NPCLifting

/-!
# Concrete syntactic seed for the No Pure Contingency typed action

Source: `topics/classicism/writeups/c5-and-atomicity-imply-no-pure-contingency.md`,
§§1–4 (unpaginated), Cian Dorr's 23 September 2026 sketch with Zachary Goodsell's
permission. The seed is the actual Boolean atom swap; its guard includes boxed
ND at t and the two distinct atoms. No automorphism premise is added.
-/

namespace Classicism.Meta.Research.NPCAtomSwap
open NPCPureAction

variable {Sig : Signature}

def le {Γ : Ctx} (p q : Formula Sig Γ) : Formula Sig Γ := Term.eq' q (Term.disj p q)

def atom {Γ : Ctx} (w : Formula Sig Γ) : Formula Sig Γ :=
  Term.forall' (Term.iff
    (Term.conj (le Term.v0 w.weaken) (Term.neg (Term.eq' Term.v0 w.weaken)))
    (le Term.v0 (Term.neg Term.v0)))

def hyp {Γ : Ctx} (w v : Formula Sig Γ) : Formula Sig Γ :=
  Term.conj (atom w) (Term.conj (atom v) (Term.neg (Term.eq' w v)))

def c5 {Γ : Ctx} : Formula Sig Γ :=
  Term.box (Term.forall' (σ := Ty.t) (Term.forall' (σ := Ty.t)
    (Term.imp (Term.neg (Term.eq' Term.v1 Term.v0))
      (Term.box (Term.neg (Term.eq' Term.v1 Term.v0))))))

def guard {Γ : Ctx} (w v : Formula Sig Γ) : Formula Sig Γ := Term.conj c5 (hyp w v)

def body {Γ : Ctx} (w v p : Formula Sig Γ) : Formula Sig Γ :=
  Term.disj
    (Term.disj (Term.conj (Term.neg (Term.disj w v)) p) (Term.conj w (le v p)))
    (Term.conj v (le w p))

def map {Γ : Ctx} (w v : Formula Sig Γ) : Term Sig Γ (Ty.t ⇒ RTy.t) :=
  Term.lam (body w.weaken v.weaken Term.v0)

theorem atom_rename {Γ Δ : Ctx} (r : Ren Γ Δ) (w : Formula Sig Γ) :
    (atom w).rename r = atom (w.rename r) := by
  simp only [atom, le, Term.forall', Term.iff, Term.conj, Term.imp, Term.disj,
    Term.neg, Term.eq', Term.rename_app, Term.rename_lam, Term.rename_all,
    Term.rename_and, Term.rename_or, Term.rename_not, Term.rename_eq,
    Term.rename_var, Ren.lift_zero, Term.weaken_rename]

theorem guard_rename {Γ Δ : Ctx} (r : Ren Γ Δ) (w v : Formula Sig Γ) :
    (guard w v).rename r = guard (w.rename r) (v.rename r) := by
  simp only [guard, hyp, Term.conj, Term.neg, Term.eq', Term.rename_app,
    Term.rename_and, Term.rename_not, Term.rename_eq, atom_rename]
  rfl

theorem body_rename {Γ Δ : Ctx} (r : Ren Γ Δ) (w v p : Formula Sig Γ) :
    (body w v p).rename r = body (w.rename r) (v.rename r) (p.rename r) := by
  simp only [body, le, Term.conj, Term.disj, Term.neg, Term.eq', Term.rename_app,
    Term.rename_and, Term.rename_or, Term.rename_not, Term.rename_eq]

theorem map_rename {Γ Δ : Ctx} (r : Ren Γ Δ) (w v : Formula Sig Γ) :
    (map w v).rename r = map (w.rename r) (v.rename r) := by
  simp only [map, Term.rename_lam, body_rename, Term.weaken_rename,
    Term.v0, Term.rename_var, Ren.lift_zero]

def seed : Seed Sig where
  guard := guard
  map := map
  guard_weaken := guard_rename Ren.shift
  map_weaken := map_rename Ren.shift

theorem persistent {Γ : Ctx} (w v : Formula Sig Γ) :
    Derivable C.axioms [] (Term.imp (guard w v) (Term.box (guard w v))) := by
  have h := Derivable.allE₂β (Ax := C.axioms) (Δ := [])
    (Derivable.ofTheorem (Derivable.mono (fun _ h => h.elim)
      (C.TheoremMinus.ofPure Classicism.Research.NPCAtomSwap.guard_persistent.derivable))) w v
  exact h

theorem map_beta {Γ : Ctx} (w v p : Formula Sig Γ) :
    Term.app (map w v) p ≡ body w v p := by
  have h := Conv.beta' (body w.weaken v.weaken Term.v0) p
  simpa only [map, Term.instantiate, body, le, Term.conj, Term.disj, Term.neg, Term.eq',
    Term.subst_app, Term.subst_var, Sub.cons_zero, Term.instantiate_weaken,
    Term.subst_and, Term.subst_or, Term.subst_not, Term.subst_eq] using h

theorem body_conv {Γ : Ctx} (w v : Formula Sig Γ) {p q : Formula Sig Γ}
    (h : p ≡ q) : body w v p ≡ body w v q := by
  exact Conv.trans (Conv.symm (map_beta w v p))
    (Conv.trans (Conv.app_congr (Conv.refl _) h) (map_beta w v q))

theorem involution {Γ : Ctx} (w v p : Formula Sig Γ) :
    EqUnder C.axioms seed w v (.app (map w v) (.app (map w v) p)) p := by
  have h := Derivable.allE₃β (Ax := C.axioms) (Δ := [guard w v])
    (Derivable.ofTheorem (Derivable.mono (fun _ h => h.elim)
      (C.TheoremMinus.ofPure Classicism.Research.NPCAtomSwap.swap_involution.derivable))) w v p
  have hbody : Derivable C.axioms [guard w v] (Term.eq' (body w v (body w v p)) p) :=
    Derivable.impE (Derivable.impE h (Derivable.andE₁ Derivable.hyp₀))
      (Derivable.andE₂ Derivable.hyp₀)
  exact Derivable.conv hbody
    (Conv.app_congr (Conv.app_congr (Conv.refl _) (Conv.symm
      (Conv.trans (map_beta w v _) (body_conv w v (map_beta w v p))))) (Conv.refl p))

theorem involutionLaws : InvolutionLaws C.axioms (seed (Sig := Sig)) where
  involution := involution
  xi := by
    intro Γ σ ρ w v a b h
    apply NPC.guarded_lam (guard w v) a b (persistent w v)
    simpa only [EqUnder, seed, ← guard_rename Ren.shift] using h

end Classicism.Meta.Research.NPCAtomSwap

#print axioms Classicism.Meta.Research.NPCAtomSwap.persistent
#print axioms Classicism.Meta.Research.NPCAtomSwap.involution
#print axioms Classicism.Meta.Research.NPCAtomSwap.involutionLaws
