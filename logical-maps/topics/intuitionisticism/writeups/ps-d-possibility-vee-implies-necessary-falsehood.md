# PSd ($\Diamond_\vee$) ⇒ Impossibility ⇒ necessary falsehood ($\Diamond_\vee$)

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- **PSd ($\Diamond_\vee$).** For every p and q, if $\Diamond_\vee$(p) implies $\Box q$, then $\Box (p \to q)$, with $\Box p$ defined as $p = \top$.

## Conclusion

- **Impossibility ⇒ necessary falsehood ($\Diamond_\vee$).** $\forall p:t. \neg$$\Diamond_\vee$$(p) \to \Box \neg p$

## Proof

Fix p and assume $\neg$$\Diamond_\vee$(p). Then $\Diamond_\vee$$(p)\to \Box \bot$ by explosion. Instantiate PSd at p and $q=\bot$ to get $\Box (p\to \bot )$, which is $\Box \neg p$. Discharge and generalize p.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.1, after Eq. (25), pp. 16–17.

<p class='cert'>Record: <code>topics/intuitionisticism/results/ps-d-possibility-vee-implies-necessary-falsehood.yaml</code></p>
