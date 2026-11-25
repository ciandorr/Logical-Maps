# Countable Boolean Completeness ∧ Potential Infinity (type t) ⇒ Possible Infinity (type t)

<p class='cert'>Result — Source: Misc., Lean `Classicism.Map.countable_boolean_completeness_and_potential_infinity_t_imply_possible_infinity_t`; produced by Zachary Goodsell (the argument from Potential Infinity to Possible Infinity, 24–25 November 2026); the premise that the numbers be weakly inextensible, its derivation from Countable Boolean Completeness, and the proof as written out, by Claude Fable 5.2 (Anthropic); recorded by Claude Fable 5.2 (Anthropic), prompted by Zachary Goodsell, 25 November 2026.</p>

## Premises

- **Countable Boolean Completeness.** Every countable property of entities of a relational type has a least upper bound in that type, where a property is countable relative to a type $\sigma$ when it injects into the finite cardinalities of properties of type $\sigma$; one instance for each $\sigma$.
- **Potential Infinity (type t).** For every natural number, there could be at least that many propositions: each number counted at type $t$ possibly holds of some property of propositions.

## Conclusion

- **Possible Infinity (type t).** Possibly there are not finitely many propositions: the Axiom of Infinity at this type, under a diamond.

## Proof

Countable Boolean Completeness, at $\sigma=t$ and $\tau=((tt)t)t$, makes the numbers counted at type $t$ weakly inextensible (Background, [[weakly-inextensible-numbers]]): the haecceities of the numbers are countable relative to $t$, their least upper bound $Z$ necessarily holds of zero and is necessarily closed under successor, so $\mathbb N_t\le Z$, and $Z$ lies below whatever necessarily holds of each number. With weakly inextensible numbers, Potential Infinity (type $t$) gives Possible Infinity (type $t$) (Background, [[potential-infinity-and-possible-infinity]]). Suppose not, so that necessarily the propositions are finitely many. Each possible count of the propositions is then one of our numbers, by weak inextensibility. The propositions that there are exactly $n$ propositions, for possible counts $n$, are pairwise distinct, numbers that could hold of one property being identical; and we have finitely many propositions, so the possible counts are bounded by some number $b$. But Potential Infinity at $b$ gives a world with at least $b$ propositions, whose count is a possible count below $b$: impossible.

## Notes

The premise is used only to make $\mathbb N_t$ weakly inextensible, so that the count of a possible world is one of the numbers we have; Boolean Completeness, Weak Rigid Comprehension and Rigid Comprehension give it through Countable Boolean Completeness, and Arithmetic Necessitism gives it from □Potential Infinity ([[arithmetic-necessitism-and-necessary-potential-infinity-t-imply-possible-infinity-t]]). Without it the argument fails at its first step: the possible worlds with many propositions may each have a count that is a number only there. Whether Potential Infinity (type $t$) implies Possible Infinity (type $t$) in C alone is open; see the notes to [[potential-infinity-t]]. The conclusion is Possible Infinity and not the Axiom of Infinity: [[full-two-object-chain-free-loop]] has □Rigid Comprehension and Potential Infinity (type $t$), with four propositions at its evaluation point. At type $e$ there is no such result: in [[full-omega-chain-new-individuals]], which has □Rigid Comprehension, the propositions that there are exactly $n$ individuals are infinitely many, and no world has infinitely many individuals.

## Sources

- **Goodsell 24–25 Nov** — Zachary Goodsell, argument of 24–25 November 2026, in conversation with Claude Fable 5.2 (Anthropic), that Potential Infinity (type t) without Possible Infinity (type t) would make the propositions actually infinite; the proof as recorded, by Claude Fable 5.2 (Anthropic).

<p class='cert'>Record: <code>topics/classicism/results/countable-boolean-completeness-and-potential-infinity-t-imply-possible-infinity-t.yaml</code></p>
