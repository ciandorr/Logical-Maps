# Full frame: three-world fork

Informally proved model; no independent checker or Lean verification.

**Verified true at the root:** No additional flags recorded.

**Verified failures at the root:** Stability of =⊥, Stability of □¬, LEM, PSd ($\Diamond_\vee$), PSd (≠⊥), A PSb–PSd operator exists.

Use the full bimodalized domain model of Definition 9, with distinguished world a. The worlds are a,b,c. Informational accessibility consists of the reflexive arrows and a≤ᵢc; metaphysical accessibility adds a≤ₘb. Both are preorders and ≤ᵢ is included in ≤ₘ. At propositional type use all informational upsets; at every function type use the full construction of Definition 8, with its recursively defined partial equivalence relations. Theorem 22 supplies an II model, including the higher types.

Take p={b}. The truth set of p=⊥ is {c}. Its double negation holds at a, whereas p=⊥ does not. This verifies the two stability failures, using p=⊥↔□¬p. LEM fails at a for the proposition {c}: neither it nor its negation holds there.

For any f in the domain at a satisfying PSb, suppose fp holds at a. It persists to c, where p=⊥ and PSb still holds. Substitution gives f⊥ there, a contradiction. Thus ¬fp holds at a. PSd(f) at p,⊥ would now yield □¬p, which fails at a. No f satisfies PSb and PSd at a, so the existential fails there. In particular, since II proves PSb for $\Diamond_\vee$ and ≠⊥, their PSd sentences fail at a.

This is failure of the existential at a, not truth of its intuitionistic negation: the terminal world c admits the Truth candidate. The infinite comb is needed for the stronger negative sentence in Theorem 5(i).

Informal model verification; no independent checker or Lean verification.

**Source:** Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §6.2, Eq. (80), p. 42.

Mathematical credit: Zachary Goodsell; construction transcribed and made explicit from the manuscript. Transcription: Codex (GPT-6), 13 September 2026.
