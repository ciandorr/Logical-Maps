# Atomlessness ∧ Mathematical Possibilism ⇒ ⊥

<p class='cert'>Result — Source: Misc.; produced by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 25 October 2026; recorded by Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, 25 October 2026.</p>

## Premises

- **Atomlessness.** Atomlessness in the displayed closed propositional formulation.
- **Mathematical Possibilism.** At each admitted carrier type, every complete Boolean algebra whose carrier contains no power-closed subcollection strictly larger than the inexact ordinal benchmark over individuals is relationally order-isomorphic to the propositions entailing some proposition.

## Conclusion

- **⊥.** These premises cannot all hold together.

## Proof

Apply Forcing Possibilism at $\sigma=t$ to the two-element algebra: $X:=\lambda p\, .\,p=\bot\lor p=\top$ and $R:=\lambda p\,q\, .\,Xp\land Xq\land p\le q$. In C, $\bot\ne\top$, so $X$ has exactly two instances; $R$ orders them as a Boolean algebra, every property of instances of $X$ has a least upper bound among them, and every injective relation from $X$ to itself is onto, so $X$ is Dedekind finite. Forcing Possibilism then gives $p$ and an order isomorphism between $(X,R)$ and the propositions entailing $p$, ordered by $\le$. So exactly two propositions entail $p$: $\bot$ and $p$, with $p\ne\bot$. Then $p$ is possible, and every $q\le p$ with $q\ne p$ is $\bot$, so no possible $q$ is strictly below $p$, contrary to Atomlessness.

## Notes

Every finite carrier is small. In any nonempty finite subcollection of size k, removing one member gives a smaller subcollection whose power has 2^(k−1) members, at least k. It cannot be represented by a smaller part of that subcollection. The empty subcollection cannot be larger than H. Finite enumerations and their subset codes are definable by finite disjunctions. The proof applies even when the representing proposition is top.

## Revisions

- **2026-11-16** (OpenAI Codex (GPT-6), prompted by Andrew Bacon) — Checked the finite-algebra argument for the revised smallness and interval clauses.

## Sources

- **Opus 25 Oct** — Claude Opus 5.5 (Anthropic), prompted by Cian Dorr, argument of 25 October 2026 (the proof below).

<p class='cert'>Record: <code>topics/classicism/results/atomlessness-incompatible-with-forcing-possibilism.yaml</code></p>
