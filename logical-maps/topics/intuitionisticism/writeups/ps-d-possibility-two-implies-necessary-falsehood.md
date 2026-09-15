# PSd (◇₂) ⇒ Impossibility ⇒ necessary falsehood (◇₂)

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- **PSd (◇₂).** For every p and q, if $\Diamond _{2}(p)$ implies $\Box q$, then $\Box (p \to q)$, with $\Box p$ defined as $p = \top$.

## Conclusion

- **Impossibility ⇒ necessary falsehood (◇₂).** $\forall p:t. \neg \Diamond _{2}(p) \to \Box \neg p$

## Proof

Fix p and assume $\neg \Diamond _{2}(p)$. Then $\Diamond _{2}(p)\to \Box \bot$ by explosion. Instantiate PSd at p and $q=\bot$ to get $\Box (p\to \bot )$, which is $\Box \neg p$. Discharge and generalize p.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.1, after Eq. (25), pp. 16–17.

<p class='cert'>Record: <code>topics/intuitionisticism/results/ps-d-possibility-two-implies-necessary-falsehood.yaml</code></p>
