# PSd (≠⊥) ⇒ Impossibility ⇒ necessary falsehood (≠⊥)

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- **PSd (≠⊥).** For every p and q, if $p \ne \bot$ implies $\Box q$, then $\Box (p \to q)$, with $\Box p$ defined as $p = \top$.

## Conclusion

- **Impossibility ⇒ necessary falsehood (≠⊥).** $\forall p:t. \neg (p \ne \bot ) \to \Box \neg p$

## Proof

Fix p and assume $\neg (p\ne \bot )$. Then $(p\ne \bot )\to \Box \bot$ by explosion. Instantiate PSd at p and $q=\bot$ to get $\Box (p\to \bot )$, which is $\Box \neg p$. Discharge and generalize p.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.1, after Eq. (25), pp. 16–17.

<p class='cert'>Record: <code>topics/intuitionisticism/results/ps-d-distinct-from-bottom-implies-necessary-falsehood.yaml</code></p>

## Paper references

- **Proof: Possibility in Intuitionistic Higher-Order Logic.** Zachary Goodsell (21 August 2026). Possibility in Intuitionistic Higher-Order Logic. Manuscript.
 — §4.1, after Eq. (25), pp. 16–17
