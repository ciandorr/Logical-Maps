# Full frame: infinite comb

Informally proved model; no independent checker or Lean verification.

**Verified true at the root:** $\operatorname{PSc} (\ne \bot )$, $\Diamond_\vee$ $= \ne \bot$.

**Verified failures at the root:** A PSb–PSd operator exists, A PSb–PSc–PSd operator exists, Stability of $=\bot$, Stability of $\Box \neg , \operatorname{PSd}$ ($\Diamond_\vee$)$, \operatorname{PSd} (\ne \bot )$, LEM.

Let the worlds be $a_{i},b_{i}$ for $i\in \mathbb{N}$, rooted at $a_{0}$. Informational accessibility is $a_{i}\le _{i}a_{j}$ exactly when $i\le j$, together with the reflexive arrows at the $b_{i}$. Metaphysical accessibility additionally has $a_{i}\le _{m} b_{j}$ whenever $i\le j$. Each $b_{i}$ sees only itself. Take the full model at all types, as in Definitions 8–9.

For $p_{i}=\{b_{i}\}$, the identity $p_{i}=\bot$ fails at $a_{i}$ and holds at every $a_{j}$ with $j>i$. Hence $\neg \neg (p_{i}=\bot )$ holds at $a_{i}$ while the identity itself fails. If f satisfies PSb at $a_{i}$, then $fp_{i}$ cannot hold at any informational extension of $a_{i}$: at a later spine world $p_{i}=\bot$, and persistence and substitution would contradict PSb. Thus $\neg fp_{i}$ holds at $a_{i}$, and $\operatorname{PSd}(f)$ would imply $p_{i}=\bot$. The same argument works at every $a_{j}$ and for every function in its local domain. Consequently the root forces $\neg \exists f.(\operatorname{PSb}(f)\land \operatorname{PSd}(f))$, exactly Eq. (26), not merely failure of that existential. This also refutes the three-clause existence principle and PSd for the two named operators with proved PSb. LEM fails at $a_{0}$ for the upset $\{a_{j}:j\ge 1\}$.

The operator $\ne \bot$ holds of X at $a_{i}$ exactly when every later metaphysical cone meets X. For an informational upset this means X contains a spine tail or infinitely many teeth $b_{j}$. Finite unions have this property only if at least one summand does, by the ordinary classical reasoning used in the external model construction. At a tooth the operator is Truth. Thus its PSc formula holds at every world.

Here is the verification of the part of Theorem 30 used in the map. The displayed cofinal truth function respects local congruence and satisfies PSa, PSb and PSc everywhere, so $\ne \bot$ is a $\mathrm{Possibility}_\vee$ in this full model. Conversely, any X without a spine tail or infinitely many teeth has only finitely many teeth. Each singleton tooth is impossible for any PSb candidate at $a_{i}$ by the persistence argument above; finite union distribution therefore makes X impossible for every $\mathrm{Possibility}_\vee$ candidate. At teeth, PSb forces bottom to be impossible and the Truth candidate supplies the other case. Thus $\Diamond_\vee$ and $\ne \bot$ agree at all worlds on all propositions, which is their function congruence at $a_{0}$ in the full structure. This verifies the operator identity, not merely a pointwise biconditional at $a_{0}$.

The claim in Theorem 30 that $\Diamond_\infty$ is Truth is tracked separately as pending; this model record does not assume a repair of the manuscript’s infinitary definition.

Informal model verification; no independent checker or Lean verification.

**Source:** Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.1, Theorem 5(i), Eq. (26), p. 17; §6.2, Eq. (81), pp. 42–44; Theorem 30, p. 44.

Mathematical credit: Zachary Goodsell; construction transcribed and made explicit from the manuscript. Transcription: Codex (GPT-6), 13 September 2026.
