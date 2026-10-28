import Classicism.Results.Research.NPCSentenceBridge
import Classicism.Certified.Signatures

/-!
# The exact No Pure Contingency schema wrapper

Source: the closed-sentence conclusion in sections 4--5 of
`topics/classicism/writeups/c5-and-atomicity-imply-no-pure-contingency.md`
(unpaginated; Dorr's 23 September 2026 sketch, with Goodsell's permission).
The input is the concrete seed's logical-constructor certificate, not a
semantic model. The final theorem supplies the certificate with no premise.
-/

namespace Classicism.Meta.Research.NPC
open AxiomSet NPCPureAction

variable {Sig : Signature}

theorem schema_of_logical_laws
    (L : LogicalLaws C.axioms (NPCAtomSwap.seed (Sig := Sig)))
    (Ax : AxiomSet Sig)
    (hnd : Entails Ax P.NecNecessityOfDistinctness.schemaIn)
    (hat : Entails Ax P.AtomicityT.schemaIn) :
    Entails Ax (pureVersion noContingency) := by
  rw [← npc_eq_pureVersion]
  rintro a ⟨_, p, hp, rfl⟩
  have hc5 := hnd (Term.ofPure (P.NecNecessityOfDistinctness.quoted Ty.t))
    ⟨P.NecNecessityOfDistinctness.quoted Ty.t, ⟨Ty.t, trivial, rfl⟩, rfl⟩
  have ha := hat (Term.ofPure P.AtomicityT.quoted)
    ⟨P.AtomicityT.quoted, rfl, rfl⟩
  exact Theorem.mp₂ (Theorem.ofC (pure_sentence_necessary L p hp)) hc5 ha

end Classicism.Meta.Research.NPC

#print axioms Classicism.Meta.Research.NPC.schema_of_logical_laws
