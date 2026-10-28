# Strong Leibniz Biconditionals (type t) ⇒ Self-Atomicity (type t)

<p class='cert'>Result — Source: Misc.; produced by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026; recorded by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.</p>

## Premises

- **Strong Leibniz Biconditionals (type t).** Every possible proposition is entailed by a strong world proposition, one that is possible and necessarily entails every proposition or its negation.

## Conclusion

- **Self-Atomicity (type t).** Every possible proposition is entailed by a self-atom: a possible proposition that necessarily, if true, is an atom, that is, one that entails that it is the actual world.

## Proof

A strong world is a self-atom. From $\Box\forall Y\, .\,W\le Y\lor W\le\neg Y$, reason under the box: if $W$ is true it is not bottom, and an entity that is not bottom and lies below every entity of its type or its negation is an atom, since a strict part $Z$ of $W$ has $W\le\neg Z$ (else $W\le Z$ and $Z=W$), so $Z\le W\le\neg Z$ is bottom. Hence $\Box(W\to\operatorname{Atom}(W))$, and with $W\ne\bot$, $\operatorname{SAtom}(W)$. The strong world below a possible entity is therefore a self-atom below it.

## Notes

Self-Atomicity is a weakening of the Strong Leibniz Biconditionals: the fork model [[full-three-object-fork]] and the monoid model [[full-monoid-ac-equals-bc]] satisfy it, with Atomicity and Strong Actuality, and fail them.

## Sources

- **Dorr 25 Oct** — Cian Dorr, the notion of a self-atom and the bridge principles, 25 October 2026; the proof by Claude Fable 5.1 (Anthropic) the same day, from the survey of the Strong Leibniz results that Cian Dorr requested (session transcript of 25 October 2026).

<p class='cert'>Record: <code>topics/classicism/results/strong-leibniz-t-implies-self-atomicity-t.yaml</code></p>
