import Classicism.Results.Records.Lattice

/-!
# The final propositional Atomicity step for No Pure Contingency

Formalization of section 5 of
`topics/classicism/writeups/c5-and-atomicity-imply-no-pure-contingency.md`:
Cian Dorr's proof sketch of 23 September 2026, with Zachary Goodsell's
permission, for the theorem attributed to Goodsell and Yli-Vakkuri.
The human-authored argument and its attribution are unchanged.

This is only the final C lemma. Atom agreement is an explicit intermediate
premise here; the complete pure-sentence theorem must discharge it by the
concrete swap construction and typed syntactic induction.
-/

namespace Classicism.Research.NPC
open Classicism.Paper Classicism.P

theorem necessary_of_atom_agreement (p : Prop) :
    AtomicityT →
    (∀ w v : Prop, Atom w → Atom v → w ≠ v → (w ≤ p ↔ v ≤ p)) →
    p → □ p := by
  intro at_ agree hp
  exact (em (□ p)).elim id fun hn =>
    (at_ p).elim
      (fun h => (incl_of_le h hp hp).elim)
      (fun h => h.elim fun w hw =>
        (at_ (¬ p)).elim
          (fun h => (hn (Classicism.Proofs.box_of_neg_le_neg_neg p h)).elim)
          (fun h => h.elim fun v hv => by
            have hne : w ≠ v := by
              intro he
              have hwp : w ≤ ¬ p := by
                rw [he]
                exact hv.2
              exact not_le_neg_of_atom hw.1 (le_neg_of_le_both_rel w p hw.2 hwp)
            have hvp : v ≤ p := (agree w v hw.1 hv.1 hne).mp hw.2
            exact (not_le_neg_of_atom hv.1
              (le_neg_of_le_both_rel v p hvp hv.2)).elim))

end Classicism.Research.NPC
