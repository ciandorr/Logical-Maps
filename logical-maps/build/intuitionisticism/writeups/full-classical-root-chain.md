# Full frame: classical root over a chain

Informally proved model; no independent checker or Lean verification.

**Verified true at the root:** LEM, Necessary nonfalsity without necessity.

**Verified failures at the root:** □LEM.

Take worlds a,b,c, rooted at a. Informational accessibility consists of the reflexive arrows and b≤ᵢc. Metaphysical accessibility additionally has a≤ₘb and a≤ₘc. Use the full model from Definitions 8–9 and Theorem 22.

Only a is informationally accessible from a, so every proposition is either true or false there and the universally quantified excluded-middle sentence holds. At b, the proposition {c} is neither true nor false, so the quantified excluded-middle sentence fails at b. Since b is metaphysically accessible from a, that sentence is not identical to ⊤ at a. This verifies the strict separation in §2.5 without treating selected excluded middle as a new necessitation rule.

For Eq. (85), take p={a,c}. Its intuitionistic negation is empty and its double negation is all three worlds, so □¬¬p holds at a. Its identity with ⊤ fails at a because p is false at the accessible world b. Since a has no proper informational extensions, the negation of that identity is true at a: p≠⊤. Thus p witnesses the positive existential sentence □¬¬p∧p≠⊤ at the root.

Informal model verification; no independent checker or Lean verification.

**Source:** Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §2.5, p. 7; §6.4, Eq. (85), p. 45.

Mathematical credit: Zachary Goodsell; construction transcribed and made explicit from the manuscript. Transcription: Codex (GPT-6), 13 September 2026.

## Paper references

- **Proof: Possibility in Intuitionistic Higher-Order Logic.** Zachary Goodsell (21 August 2026). Possibility in Intuitionistic Higher-Order Logic. Manuscript.
 — §2.5, p. 7; §6.4, Eq. (85), p. 45
