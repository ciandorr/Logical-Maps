# Full frame: infinite comb

Informally proved model; no independent checker or Lean verification.

**Verified true at the root:** PSc (≠⊥), $\Diamond_\vee$ = ≠⊥.

**Verified failures at the root:** A PSb–PSd operator exists, A PSb–PSc–PSd operator exists, Stability of =⊥, Stability of □¬, PSd ($\Diamond_\vee$), PSd (≠⊥), LEM.

Let the worlds be aᵢ,bᵢ for i∈ℕ, rooted at a₀. Informational accessibility is aᵢ≤ᵢaⱼ exactly when i≤j, together with the reflexive arrows at the bᵢ. Metaphysical accessibility additionally has aᵢ≤ₘbⱼ whenever i≤j. Each bᵢ sees only itself. Take the full model at all types, as in Definitions 8–9.

For pᵢ={bᵢ}, the identity pᵢ=⊥ fails at aᵢ and holds at every aⱼ with j>i. Hence ¬¬(pᵢ=⊥) holds at aᵢ while the identity itself fails. If f satisfies PSb at aᵢ, then fpᵢ cannot hold at any informational extension of aᵢ: at a later spine world pᵢ=⊥, and persistence and substitution would contradict PSb. Thus ¬fpᵢ holds at aᵢ, and PSd(f) would imply pᵢ=⊥. The same argument works at every aⱼ and for every function in its local domain. Consequently the root forces ¬∃f.(PSb(f)∧PSd(f)), exactly Eq. (26), not merely failure of that existential. This also refutes the three-clause existence principle and PSd for the two named operators with proved PSb. LEM fails at a₀ for the upset {aⱼ:j≥1}.

The operator ≠⊥ holds of X at aᵢ exactly when every later metaphysical cone meets X. For an informational upset this means X contains a spine tail or infinitely many teeth bⱼ. Finite unions have this property only if at least one summand does, by the ordinary classical reasoning used in the external model construction. At a tooth the operator is Truth. Thus its PSc formula holds at every world.

Here is the verification of the part of Theorem 30 used in the map. The displayed cofinal truth function respects local congruence and satisfies PSa, PSb and PSc everywhere, so ≠⊥ is a $\mathrm{Possibility}_\vee$ in this full model. Conversely, any X without a spine tail or infinitely many teeth has only finitely many teeth. Each singleton tooth is impossible for any PSb candidate at aᵢ by the persistence argument above; finite union distribution therefore makes X impossible for every $\mathrm{Possibility}_\vee$ candidate. At teeth, PSb forces bottom to be impossible and the Truth candidate supplies the other case. Thus $\Diamond_\vee$ and ≠⊥ agree at all worlds on all propositions, which is their function congruence at a₀ in the full structure. This verifies the operator identity, not merely a pointwise biconditional at a₀.

The claim in Theorem 30 that $\Diamond_\infty$ is Truth is tracked separately as pending; this model record does not assume a repair of the manuscript’s infinitary definition.

Informal model verification; no independent checker or Lean verification.

**Source:** Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.1, Theorem 5(i), Eq. (26), p. 17; §6.2, Eq. (81), pp. 42–44; Theorem 30, p. 44.

Mathematical credit: Zachary Goodsell; construction transcribed and made explicit from the manuscript. Transcription: Codex (GPT-6), 13 September 2026.
