# Full frame: extensional branching

Informally proved model; no independent checker or Lean verification.

**Verified true at the root:** Propositional extensionality, Universal self-necessitation, Stability of $=\bot$, Stability of $\Box \neg$.

**Verified failures at the root:** WLEM, LEM, Nonfalsity distributes over $\lor , \operatorname{PSc} (\ne \bot )$, Nonfalsity gives distinct disjunct.

Take the full model on worlds a,b,c, rooted at a, with $\le _{i}=\le _{m}$ the reflexive branching order $a\le b$ and $a\le c$. This makes the paper’s extensional-frame discussion concrete. Interpret all types and logical constants by Definitions 8–9 and Theorem 22.

For informational upsets, truth at a world already implies truth at all of its metaphysical successors, so $\Box p$ and p have the same truth set. Equality of propositions at w is equivalence on the informational cone, exactly the truth condition of their material biconditional at w. This verifies universal self-necessitation and propositional extensionality. Also $p=\bot$ is $\neg p$; stability of negations therefore verifies both stability principles for every proposition.

Let $p=\{b\}$ and $q=\{c\}$. At $a, \neg p$ and $\neg \neg p$ have truth sets {c} and {b}, so weak excluded middle fails, as does excluded middle. The union $p\lor q$ is dense: $\neg \neg (p\lor q)$ holds at a. But neither $\neg \neg p$ nor $\neg \neg q$ holds there. Since $\ne \bot$ has the truth function of double negation in this frame, PSc for $\ne \bot$ and the nonfalsity-to-distinct-disjunct condition fail at the same evaluation. These are failures of the universally quantified formulas, witnessed by the displayed propositions.

Informal model verification; no independent checker or Lean verification.

**Source:** Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §3.2, Eqs. (13)–(16), p. 10; §5.5, p. 37.

Mathematical credit: Zachary Goodsell; construction transcribed and made explicit from the manuscript. Transcription: Codex (GPT-6), 13 September 2026.

## Paper references

- **Proof: Possibility in Intuitionistic Higher-Order Logic.** Zachary Goodsell (21 August 2026). Possibility in Intuitionistic Higher-Order Logic. Manuscript.
 — §3.2, Eqs. (13)–(16), p. 10; §5.5, p. 37
