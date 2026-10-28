import Classicism.Results.Research.NPCSwapConclusion
import Classicism.Results.Research.NPCAtomSwapSeed
import Classicism.Results.Research.NPCPureActionInduction
import Classicism.Certified.Schemas
import Classicism.Syntax.SentenceSchemas

/-!
# Closing the pure-sentence argument

Source: `topics/classicism/writeups/c5-and-atomicity-imply-no-pure-contingency.md`,
sections 4--5 (unpaginated), Cian Dorr's 23 September 2026 sketch with Zachary
Goodsell's permission. This intermediate assembly takes the explicit logical
constructor certificate; the final theorem supplies that certificate concretely.
-/

namespace Classicism.Meta.Research.NPC
open NPCPureAction

variable {Sig : Signature}

theorem closed_pure_swap_fixed
    (L : LogicalLaws C.axioms (NPCAtomSwap.seed (Sig := Sig)))
    (p : Sentence Sig) (hp : p.pure = true) :
    C.Theorem (Term.forall' (σ := Ty.t) (Term.forall' (σ := Ty.t)
      (Term.imp (NPCAtomSwap.guard Term.v1 Term.v0)
        (Term.eq' (NPCAtomSwap.body Term.v1 Term.v0 p.close) p.close)))) := by
  apply Derivable.allI
  apply Derivable.allI
  apply Derivable.impI
  have h := closed_pure_fixed L
    (Term.v1 : Formula Sig [Ty.t, Ty.t]) Term.v0 p hp
  exact Derivable.conv h (Conv.app_congr
    (Conv.app_congr (Conv.refl _) (NPCAtomSwap.map_beta _ _ _)) (Conv.refl _))

theorem pure_sentence_necessary
    (L : LogicalLaws C.axioms (NPCAtomSwap.seed (Sig := Sig)))
    (p : Sentence Sig) (hp : p.pure = true) :
    C.Theorem (Term.imp NPCAtomSwap.c5
      (Term.imp (Term.ofPure P.AtomicityT.quoted) (Term.imp p (Term.box p)))) := by
  have hc := Derivable.allEβ (Ax := C.axioms) (Δ := [])
    (Derivable.mono (fun _ h => h.elim)
      (C.TheoremMinus.ofPure
        Classicism.Research.NPC.necessary_of_guarded_swap_fixed.derivable)) p
  have hclose : (p.close : Formula Sig [Ty.t, Ty.t]) = p.weaken.weaken := by
    simp only [Term.close, Term.weaken, Term.rename_rename]
    congr 1
    funext τ x
    exact nomatch x
  have hf := closed_pure_swap_fixed L p hp
  rw [hclose] at hf
  exact Derivable.impE hc hf

end Classicism.Meta.Research.NPC

#print axioms Classicism.Meta.Research.NPC.pure_sentence_necessary
