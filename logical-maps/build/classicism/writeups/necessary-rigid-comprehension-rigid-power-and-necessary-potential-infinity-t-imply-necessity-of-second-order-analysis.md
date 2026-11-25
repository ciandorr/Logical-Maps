# □Rigid Comprehension ∧ Rigid Power ∧ □Potential Infinity (type t) ⇒ Necessity of Second-Order Analysis

<p class='cert'>Result — Source: Misc.; produced by Cian Dorr (the idea, 30 October 2026), by Barton and Goodsell's Theorems 3–7; the weakening of the infinity premise by Claude Fable 5.2 (Anthropic), prompted by Zachary Goodsell, 24 November 2026; recorded by Claude Fable 5.2 (Anthropic), prompted by Zachary Goodsell, 24 November 2026.</p>

## Premises

- **□Rigid Comprehension.** Necessarily, every relation, including a proposition, is coextensive with a rigid one.
- **Rigid Power.** If a relation is rigid, so is the property of being a rigid relation that entails it.
- **□Potential Infinity (type t).** Necessarily, for every natural number there could be at least that many propositions.

## Conclusion

- **Necessity of Second-Order Analysis.** Every second-order analytical sentence is either true in every real number structure in every possible world or false in every real number structure in every possible world. One sentence for each type $\sigma$ and each second-order analytical sentence.

## Proof

The write-up of [[necessary-rigid-comprehension-rigid-power-and-necessary-axiom-of-infinity-e-imply-necessity-of-second-order-analysis]], read at $\sigma:=t$, uses the boxed Axiom of Infinity only in its first step, to obtain $\Box I^*_t$; every later step rests on Arithmetic Necessitism at $t$, which □Rigid Comprehension gives from $\Box I^*_t$, on Rigid Power at $\mathbb N_t$ and one type up, and on the second-order Peano axioms holding at every world, which is $\Box I^*_t$ again. And $\Box I^*_t$ is the Peano form of □Potential Infinity (type $t$) (Background, [[potential-infinity-forms]], necessitated). So the argument goes through from this premise.

## Notes

Strengthens the record with the boxed Axiom of Infinity at type $t$, which implies □Potential Infinity there: one type that is necessarily potentially infinite is all the argument needs. This is Barton and Goodsell's own infinity premise, their eq. (22). Not Lean-verified.

## Sources

- **Dorr 30 Oct** — Cian Dorr, observation of 30 October 2026 that Rigid Power at the numbers and at the reals rules out continuum contingency under □Rigid Comprehension; the argument is Barton and Goodsell's, Continuum Contingency, Theorems 3–7, as written out for the record with the boxed Axiom of Infinity.
- **Claude Fable 5.2, 24 Nov** — Claude Fable 5.2 (Anthropic), prompted by Zachary Goodsell, 24 November 2026, observing that the argument uses its infinity premise only through the necessitated Peano conditions.

<p class='cert'>Record: <code>topics/classicism/results/necessary-rigid-comprehension-rigid-power-and-necessary-potential-infinity-t-imply-necessity-of-second-order-analysis.yaml</code></p>

## Paper references

- **Proof: Continuum Contingency.** Barton, Neil, and Zachary Goodsell. Continuum Contingency. Draft dated 14 October 2026, 47 pages. Stitches a ground model of set theory to the canonical model of a forcing extension to show that Classicism with □Rigid Comprehension, □Relational Choice and an axiom of infinity is consistent with first- and second-order continuum contingency, together with □Atomicity at type t (Theorem 21) or with Recombination (Theorem 22, which refutes Atomicity at type t, Corollary 23); formalizes the coin-toss argument (Theorem 9). Read directly on 19 October 2026; locators refer to this draft. — §§5.6–5.9, Theorems 3–7 and eqs. (22)–(33), pp. 16–21. Their axiom of Infinity, eq. (22), is the Peano form of the premise; their Theorem 7 derives the non-contingency of analytical sentences from continuum necessitism, which Rigid Power at N and at R supplies.
