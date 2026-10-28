# Strong Atomicity ⇒ Self-Atomicity

<p class='cert'>Result — Source: Misc.; produced by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026; recorded by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.</p>

## Premises

- **Strong Atomicity.** At each relational type, every possible entity (one distinct from bottom) is entailed by a strong atom: a possible entity that necessarily entails every entity of the type or its negation. The right-to-left direction is a theorem of C; the principle records the substantive direction.

## Conclusion

- **Self-Atomicity.** At each relational type, every possible entity (one distinct from bottom) is entailed by a self-atom: a possible entity that necessarily, if instantiated, is an atom.

## Proof

A strong atom is a self-atom. From $\Box\forall Y\, .\,W\le Y\lor W\le\neg Y$, reason under the box: if $W$ is instantiated it is not bottom, and an entity that is not bottom and lies below every entity of its type or its negation is an atom, since a strict part $Z$ of $W$ has $W\le\neg Z$ (else $W\le Z$ and $Z=W$), so $Z\le W\le\neg Z$ is bottom. Hence $\Box(\exists\bar x\, .\,W\bar x\to\operatorname{Atom}(W))$, and with $W\ne\bot$, $\operatorname{SelfAtom}(W)$. The strong atom below a possible entity is therefore a self-atom below it.

## Notes

Self-Atomicity is a weakening of Strong Atomicity: the fork model [[full-three-object-fork]] and the monoid model [[full-monoid-ac-equals-bc]] satisfy it, with Atomicity and Strong Actuality, and fail them.

## Sources

- **Dorr 25 Oct** — Cian Dorr, the notion of a self-atom and the bridge principles, 25 October 2026; the proof by Claude Fable 5.1 (Anthropic) the same day, from the survey of Strong Atomicity results that Cian Dorr requested (session transcript of 25 October 2026).

<p class='cert'>Record: <code>topics/classicism/results/strong-atomicity-r-implies-self-atomicity-r.yaml</code></p>
