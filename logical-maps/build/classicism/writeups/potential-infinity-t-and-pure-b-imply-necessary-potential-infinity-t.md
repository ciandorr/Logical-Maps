# Potential Infinity (type t) ∧ B for pure sentences ⇒ □Potential Infinity (type t)

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.potential_infinity_t_and_pure_b_imply_necessary_potential_infinity_t`; produced by Claude Fable 5.2 (Anthropic), prompted by Zachary Goodsell, 24 November 2026; recorded by Claude Fable 5.2 (Anthropic), prompted by Zachary Goodsell, 24 November 2026.</p>

## Premises

- **Potential Infinity (type t).** For every natural number, there could be at least that many propositions: each number counted at type $t$ possibly holds of some property of propositions.
- **B for pure sentences.** The B instance for every closed sentence in the pure language.

## Conclusion

- **□Potential Infinity (type t).** Necessarily, for every natural number there could be at least that many propositions.

## Proof

Potential Infinity (type $t$) is a closed pure sentence $P$, so B for pure sentences gives $P\to\Box\Diamond P$. And $\Diamond P\to P$ is a theorem of C (Background, [[potential-infinity-forms]], part 2), hence necessary: $\Box(\Diamond P\to P)$. So $P$ gives $\Box\Diamond P$ and, by K, $\Box P$.

## Notes

So Potential Infinity (type $t$) and its necessitation are equivalent given B for pure sentences, and in particular given No Pure Contingency, B, or C5. In C alone they differ ([[necessary-potential-infinity-t-implies-potential-infinity-t]]).

## Sources

- **Claude Fable 5.2, 24 Nov** — Claude Fable 5.2 (Anthropic), prompted by Zachary Goodsell, 24 November 2026, in a survey of the connections of Potential Infinity.

<p class='cert'>Record: <code>topics/classicism/results/potential-infinity-t-and-pure-b-imply-necessary-potential-infinity-t.yaml</code></p>
