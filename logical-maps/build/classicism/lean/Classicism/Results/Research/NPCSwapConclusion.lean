import Classicism.Results.Research.NPCAtomicityConclusionCertificates
import Classicism.Results.Research.NPCAtomSwapCertificates

/-!
# From concrete atom-swap invariance to necessity

Source: `topics/classicism/writeups/c5-and-atomicity-imply-no-pure-contingency.md`,
section 5 (unpaginated), Cian Dorr's 23 September 2026 sketch with Zachary
Goodsell's permission. The theorem is attributed there to Goodsell and Yli-Vakkuri.
This bridge uses only propositional Atomicity. Its swap-invariance premise is
discharged for closed pure syntax by the separate structural induction.
-/

namespace Classicism.Research.NPC
open Classicism.Paper Classicism.P NPCAtomSwap

theorem necessary_of_guarded_swap_fixed (p : Prop) :
    (∀ w v : Prop, (NecNecessityOfDistinctness Prop ∧ SwapHyp w v) →
      swap w v p = p) →
    NecNecessityOfDistinctness Prop → AtomicityT → p → □ p := by
  intro hf hnd hat
  apply necessary_of_atom_agreement p hat
  intro w v hw hv hn
  have hh : SwapHyp w v := ⟨hw, hv, hn⟩
  have he := congrArg (fun q => w ≤ q) (hf w v ⟨hnd, hh⟩)
  exact ⟨fun hp => (swap_le_left w v p hnd hh).mp (he.mpr hp),
    fun hp => he.mp ((swap_le_left w v p hnd hh).mpr hp)⟩

#classicism_check necessary_of_guarded_swap_fixed
#classicism_types necessary_of_guarded_swap_fixed
#classicism_derive necessary_of_guarded_swap_fixed
#print axioms necessary_of_guarded_swap_fixed.derivable

end Classicism.Research.NPC
