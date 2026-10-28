# Atomlessness ∧ Forcing Possibilism ⇒ ⊥

<p class='cert'>Result — Source: Misc.; produced by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 25 October 2026; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 25 October 2026.</p>

## Premises

- **Atomlessness.** Atomlessness in the displayed closed propositional formulation.
- **Forcing Possibilism.** Every complete Boolean algebra that is finite or has strictly fewer elements than there are propositions is isomorphic to the entailment algebra below some proposition other than top.

## Conclusion

- **⊥.** These premises cannot all hold together.

## Proof

Apply Forcing Possibilism at $\sigma=t$ to the two-element algebra: $X:=\lambda p\, .\,p=\bot\lor p=\top$ and $R:=\lambda p\,q\, .\,Xp\land Xq\land p\le q$. In C, $\bot\ne\top$, so $X$ has exactly two instances; $R$ orders them as a Boolean algebra, every property of instances of $X$ has a least upper bound among them, and every injective relation from $X$ to itself is onto, so $X$ is Dedekind finite. Forcing Possibilism then gives $p\ne\top$ and an order isomorphism between $(X,R)$ and the propositions entailing $p$, ordered by $\le$. So exactly two propositions entail $p$: $\bot$ and $p$, with $p\ne\bot$. Then $p$ is possible, and every $q\le p$ with $q\ne p$ is $\bot$, so no possible $q$ is strictly below $p$, contrary to Atomlessness.

## Notes

More generally, Forcing Possibilism applied to the finite algebras makes, for each $n$, some proposition other than $\top$ the join of exactly $n$ atoms; the two-element case is all this record uses.

## Sources

- **Opus 25 Oct** — Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, argument of 25 October 2026 (the proof below).

<p class='cert'>Record: <code>topics/classicism/results/atomlessness-incompatible-with-forcing-possibilism.yaml</code></p>
