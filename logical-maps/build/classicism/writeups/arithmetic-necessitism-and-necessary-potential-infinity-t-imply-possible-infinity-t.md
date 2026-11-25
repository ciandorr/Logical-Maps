# Arithmetic Necessitism ∧ □Potential Infinity (type t) ⇒ Possible Infinity (type t)

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.arithmetic_necessitism_and_necessary_potential_infinity_t_imply_possible_infinity_t`; produced by Zachary Goodsell (the argument from Potential Infinity to Possible Infinity, 24–25 November 2026); the premise that the numbers be weakly inextensible, and the proof as written out, by Claude Fable 5.2 (Anthropic); recorded by Claude Fable 5.2 (Anthropic), prompted by Zachary Goodsell, 25 November 2026.</p>

## Premises

- **Arithmetic Necessitism.** Given that necessarily zero is not a successor and successor is injective on numbers, the numbers at $\sigma$ form a rigid property with necessarily distinct instances. One sentence for each type $\sigma$.
- **□Potential Infinity (type t).** Necessarily, for every natural number there could be at least that many propositions.

## Conclusion

- **Possible Infinity (type t).** Possibly there are not finitely many propositions: the Axiom of Infinity at this type, under a diamond.

## Proof

□Potential Infinity (type $t$) is $\Box I^*_t$ in its Peano form (Background, [[potential-infinity-forms]]), the antecedent of Arithmetic Necessitism at $t$; so the numbers counted at type $t$ are rigid, and in particular weakly inextensible. Potential Infinity (type $t$) holds by T. With weakly inextensible numbers it gives Possible Infinity (type $t$) (Background, [[potential-infinity-and-possible-infinity]]): otherwise every possible count of the propositions would be one of our numbers, the possible counts would be bounded, we having finitely many propositions and the propositions that there are exactly $n$ propositions being pairwise distinct, and Potential Infinity at the bound would give a possible count below it at a world with at least that many propositions.

## Notes

Rigid numbers carry Potential Infinity to Possible Infinity at type $t$; this is the form of that with the map's principle about rigid numbers, which is conditional on □Potential Infinity. The companion record [[countable-boolean-completeness-and-potential-infinity-t-imply-possible-infinity-t]] gets weak inextensibility from Countable Boolean Completeness, and needs Potential Infinity only unboxed. Only the weak inextensibility of $\mathbb N_t$ at the evaluation point is used, not the necessary distinctness of the numbers.

## Sources

- **Goodsell 24–25 Nov** — Zachary Goodsell, argument of 24–25 November 2026, in conversation with Claude Fable 5.2 (Anthropic), that Potential Infinity (type t) without Possible Infinity (type t) would make the propositions actually infinite; the proof as recorded, by Claude Fable 5.2 (Anthropic).

<p class='cert'>Record: <code>topics/classicism/results/arithmetic-necessitism-and-necessary-potential-infinity-t-imply-possible-infinity-t.yaml</code></p>
