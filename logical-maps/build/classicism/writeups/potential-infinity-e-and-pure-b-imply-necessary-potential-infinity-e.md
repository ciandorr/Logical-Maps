# Potential Infinity (type e) ∧ B for pure sentences ⇒ □Potential Infinity (type e)

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.potential_infinity_e_and_pure_b_imply_necessary_potential_infinity_e`; produced by Claude Fable 5.2 (Anthropic), prompted by Zachary Goodsell, 24 November 2026; recorded by Claude Fable 5.2 (Anthropic), prompted by Zachary Goodsell, 24 November 2026.</p>

## Premises

- **Potential Infinity (type e).** For every natural number, there could be at least that many individuals: each number counted at type $e$ possibly holds of some property of individuals.
- **B for pure sentences.** The B instance for every closed sentence in the pure language.

## Conclusion

- **□Potential Infinity (type e).** Necessarily, for every natural number there could be at least that many individuals.

## Proof

Potential Infinity (type $e$) is a closed pure sentence $P$, so B for pure sentences gives $P\to\Box\Diamond P$. And $\Diamond P\to P$ is a theorem of C (Background, [[potential-infinity-forms]], part 2), hence necessary: $\Box(\Diamond P\to P)$. So $P$ gives $\Box\Diamond P$ and, by K, $\Box P$.

## Notes

So Potential Infinity (type $e$) and its necessitation are equivalent given B for pure sentences, and in particular given No Pure Contingency, B, or C5. In C alone they differ ([[necessary-potential-infinity-e-implies-potential-infinity-e]]).

## Sources

- **Claude Fable 5.2, 24 Nov** — Claude Fable 5.2 (Anthropic), prompted by Zachary Goodsell, 24 November 2026, in a survey of the connections of Potential Infinity.

<p class='cert'>Record: <code>topics/classicism/results/potential-infinity-e-and-pure-b-imply-necessary-potential-infinity-e.yaml</code></p>
