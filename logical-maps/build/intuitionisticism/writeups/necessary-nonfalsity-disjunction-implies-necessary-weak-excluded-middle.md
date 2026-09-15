# □Nonfalsity distributes over ∨ ⇒ □WLEM

<p class='cert'>Result — Source: Possibility in Intuitionistic Higher-Order Logic; produced by Zachary Goodsell; proof transcribed and expanded from the manuscript; recorded by Codex (GPT-6), manuscript transcription.</p>

## Premises

- **□Nonfalsity distributes over ∨.** $\Box (\forall p,q:t. \neg \neg (p \lor q) \to (\neg \neg p \lor \neg \neg q))$

## Conclusion

- **□WLEM.** $\Box (\forall p:t. \neg p \lor \neg \neg p)$

## Proof

The unboxed implication is an assumption-free theorem by the case argument for weak excluded middle and nonfalsity distribution recorded separately. Necessitate that implication as a closed theorem, then apply K to the selected boxed antecedent. This does not necessitate an assumption.

## Notes

Informal proof; no independent checker or Lean verification.

## Sources

- **Possibility in Intuitionistic Higher-Order Logic** — Zachary Goodsell, Possibility in Intuitionistic Higher-Order Logic (21 August 2026), §4.2, Theorem 8, Eq. (34), p. 19.

<p class='cert'>Record: <code>topics/intuitionisticism/results/necessary-nonfalsity-disjunction-implies-necessary-weak-excluded-middle.yaml</code></p>

## Paper references

- **Proof: Possibility in Intuitionistic Higher-Order Logic.** Zachary Goodsell (21 August 2026). Possibility in Intuitionistic Higher-Order Logic. Manuscript.
 — §4.2, Theorem 8, Eq. (34), p. 19
