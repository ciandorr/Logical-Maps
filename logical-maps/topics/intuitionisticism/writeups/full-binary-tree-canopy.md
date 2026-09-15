# Full frame: binary tree with canopy

Informally proved model; no independent checker or Lean verification.

**Verified true at the root:** Uniform impossibility counterexamples, $\Diamond_\vee$ $= \operatorname{Truth}, \Diamond _{2} = \operatorname{Truth}$, $\Diamond_\vee$ $= \Diamond _{2}, \operatorname{Spouse}$ ($\Diamond_\vee$).

**Verified failures at the root:** A PSb–PSc–PSd operator exists, $\operatorname{PSc} (\ne \bot ), \operatorname{PSd}$ ($\Diamond_\vee$)$, \operatorname{PSd} (\Diamond _{2})$, Propositional intensionalism $(\Box _{2}), \Box = \Box _{2}$, LEM.

The branching worlds are finite binary words $s\in \{0,1\}*$, and the canopy worlds are infinite binary sequences $\alpha \in \{0,1\}^\mathbb{N}$. Root at the empty word. On branching worlds, informational accessibility is the prefix order; a canopy world informationally sees only itself. Metaphysical accessibility extends the informational relation by $s\le _{m} \alpha$ whenever s is a prefix of $\alpha$. A canopy world metaphysically sees only itself. This makes precise the infinite tree and canopy in Figure 1. Use the full domains and logical relations of Definitions 8–9.

Write C for all canopy worlds and $C_{s}$ for the canopy extending s. At any branching world s, C is congruent to $C_{s0}\lor C_{s1}$. If f has PSb and PSc there and fC holds, PSc gives $fC_{s0}\lor fC_{s1}$. The first disjunct persists to s1, where $C_{s0}=\bot$, contradicting PSb; the second similarly contradicts PSb at s0. The argument works at every informational extension. Thus $\neg fC$ holds at s. Meanwhile every branching world sees a canopy point, so $C=\bot$ holds at no informational extension of $s: C\ne \bot$ holds. This proves the fully quantified Eq. (27), including its existential witness C for every f and at every informational extension. Combining it with a PSd candidate would give $C=\bot$, so the three-clause existential and PSd for $\Diamond_\vee$ and $\Diamond _{2}$ fail.

At the root, C is the union of $C_{0}$ and $C_{1}$. The whole union is distinct from $\bot$, but $C_{0}$ becomes identical to $\bot$ at world 1 and $C_{1}$ at world 0. Thus neither disjunct is distinct from $\bot$ at the root, which refutes PSc for $\ne \bot$. LEM fails for the upset of branching worlds extending 0: it is false at the root and true at its 0-extension.

To verify Theorem 31’s tree assertion, let X be any proposition false at s. On the metaphysical cone of s it splits into its two child-cone parts, each including the associated canopy. As in the previous splitting argument, PSb and PSc prevent fX at s for every such candidate f. At canopy points the local propositional quotient has just bottom and top, and PSb excludes the bottom case. Truth itself is a candidate for both $\mathrm{Possibility}_\vee$ and $\operatorname{Possibility}_{2}$ (Theorems 7 and 16). Hence $\Diamond_\vee$ and $\Diamond _{2}$ each have exactly the truth function X↦X throughout the model. Their identities with Truth, and with each other, follow from full function congruence on every accessible cone. Truth is married to itself and is $\operatorname{Necessity}_{2}$, so $\Diamond_\vee$ has a qualified spouse here.

Finally $\neg \Diamond _{2}C$ holds at every branching world. The proved paired $\operatorname{PSd}_{2}$ theorem at $C,\bot$ gives $\Box _{2}\neg C$, and normality transports this to $\Box _{2}(C\leftrightarrow \bot )$. Yet $C\ne \bot$ holds. Thus $(C,\bot )$ witnesses Eq. (61), refuting propositional intensionalism for $\Box _{2}$. Also $\Box _{2}\neg C$ holds at the root while $\Box \neg C$ does not, which refutes identity of $\Box _{2}$ with $\Box$. No conclusion about $\Diamond_\infty$ is used.

The explicit canopy is the set of infinite binary paths, a precise realization of Figure 1. The phrase on p. 43 saying $\ne \bot$ fails PSb is inconsistent with its definition; this record verifies the stated target, failure of PSc, instead. No claim from the unfinished comb-spouse sentence of Theorem 31 is used.

**Source:** Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.1, Theorem 5(ii), Eq. (27), p. 17; §4.5, Theorem 18, p. 27; §6.2, Figure 1 and Theorem 31, pp. 43–44.

Mathematical credit: Zachary Goodsell; construction transcribed and made explicit from the manuscript. Transcription: Codex (GPT-6), 13 September 2026.
