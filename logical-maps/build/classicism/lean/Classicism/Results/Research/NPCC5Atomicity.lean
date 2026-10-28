import Classicism.Results.Research.NPCSchemaBridge
import Classicism.Results.Research.NPCAtomSwapPrimitive
import Classicism.Results.Research.NPCPureActionDelta
import Classicism.Statements

/-!
# C5 and propositional Atomicity imply No Pure Contingency

Direct mathematical source:
`topics/classicism/writeups/c5-and-atomicity-imply-no-pure-contingency.md`,
sections 1--5 (unpaginated), Cian Dorr's proof sketch of 23 September 2026,
with Zachary Goodsell's permission; theorem attributed to Goodsell and
Yli-Vakkuri. Formal transcription: Codex, 23 October 2026.

The proof constructs the Boolean atom swap, extends it by typed conjugation,
proves invariance by induction on pure syntax, and applies Atomicity only at t.
The individual-type action is a metalevel identity, so no e-to-e object term
is introduced. Every conditional lambda step uses the persistent C5/atom
guard and a C-only derivation. This declaration inhabits the exact generated
record statement; it assumes no separate automorphism or invariance principle.
-/

namespace Classicism.Meta.Research.NPC

theorem c5_and_atomicity_t_imply_no_pure_contingency :
    Classicism.Statements.c5_and_atomicity_t_imply_no_pure_contingency := by
  intro Sig _ Ax hnd hat
  exact schema_of_logical_laws
    (NPCPureAction.logicalLaws NPCAtomSwap.primitiveLaws) Ax hnd hat

end Classicism.Meta.Research.NPC

#print axioms Classicism.Meta.Research.NPC.c5_and_atomicity_t_imply_no_pure_contingency
