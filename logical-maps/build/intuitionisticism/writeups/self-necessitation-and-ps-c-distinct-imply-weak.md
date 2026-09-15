# Universal self-necessitation ∧ PSc (≠⊥) ⇒ WLEM

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- **Universal self-necessitation.** $\forall p:t. p \to \Box p$
- **PSc (≠⊥).** For every p and $q, (p \lor q) \ne \bot$ implies $p \ne \bot$ or $q \ne \bot$.

## Conclusion

- **WLEM.** $\forall p:t. \neg p \lor \neg \neg p$

## Proof

For arbitrary $p, \neg \neg (p\lor \neg p)$ is an intuitionistic theorem. It implies $(p\lor \neg p)\ne \bot$, since identity with $\bot$ would contradict its double negation. PSc for $\ne \bot$ gives $p\ne \bot \lor \neg p\ne \bot$. The self-necessitation instances at $\neg p$ and $\neg \neg p$, followed by contraposition and triple-negation reduction, turn these disjuncts into $\neg \neg p$ and $\neg p$ respectively. Generalize p.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §3.2, Eqs. (14)–(16), p. 10; §5.5, pp. 37–38.

<p class='cert'>Record: <code>topics/intuitionisticism/results/self-necessitation-and-ps-c-distinct-imply-weak.yaml</code></p>

## Paper references

- **Proof: Possibility in Intuitionistic Higher-Order Logic.** Zachary Goodsell (21 August 2026). Possibility in Intuitionistic Higher-Order Logic. Manuscript.
 — §3.2, Eqs. (14)–(16), p. 10; §5.5, pp. 37–38
