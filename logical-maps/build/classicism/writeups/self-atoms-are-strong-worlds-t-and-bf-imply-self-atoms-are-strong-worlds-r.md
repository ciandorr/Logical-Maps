# Self-atoms are strong worlds (type t) ∧ BF ⇒ Self-atoms are strong worlds

<p class='cert'>Result — Source: Misc.; produced by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026; recorded by Claude Fable 5.1 (Anthropic), prompted by Cian Dorr, 25 October 2026.</p>

## Premises

- **Self-atoms are strong worlds (type t).** Every self-atom is a strong world proposition.
- **BF.** The Barcan Formula at every type. The predicate formulation closes the formula schema using lambda abstraction.

## Conclusion

- **Self-atoms are strong worlds.** At each relational type, every self-atom is a strong world: it necessarily entails every entity of the type or its negation.

## Proof

Let $X^{\bar\sigma t}\ne\bot$. As in the recorded [[atomicity-t-and-bf-imply-atomicity]], $\Diamond\exists\bar y\, .\,X\bar y$ and BF at the argument types give $\bar x$ with $\Diamond X\bar x$; for a proposition $w\le X\bar x$ write $A_w:=\lambda\bar y\, .\,w\land\bar y=\bar x$, which lies below $X$. Two facts about $A_w$ are theorems of C and so hold necessarily: $A_w$ is instantiated iff $w$ is true, and $A_w$ is an atom iff $w$ is one (the atom step of that record, which uses only Leibniz’s law and Intensionality). Self-atoms are strong worlds (type t) gives Self-atoms are atoms (type t), so by the argument of [[self-atoms-are-atoms-t-and-bf-imply-self-atoms-are-atoms-r]] a self-atom $X$ is $A_w$ with $w=X\bar x$ a self-atom, hence a strong world. Then $X$ is a strong world: at any world and for any $Y$, $A_w\le Y$ iff $w\le Y\bar x$ and $A_w\le\neg Y$ iff $w\le\neg Y\bar x$, by Leibniz’s law under the box, and $w$ decides $Y\bar x$.

## Notes

The lift of Self-atoms are strong worlds from type $t$ to every relational type under BF, on the pattern of [[atomicity-t-and-bf-imply-atomicity]]; BF is used at the argument types, to pass from a possible relation to a possible instance. Atoms are strong worlds needs no such lift, since BF at relational types gives it outright ([[barcan-relational-implies-atoms-are-strong-worlds-r]]).

## Sources

- **Dorr 25 Oct** — Cian Dorr, suggestion of 25 October 2026 that under BF the type-t forms of the new principles lift to their full forms, as Atomicity does; proofs by Claude Fable 5.1 (Anthropic) the same day (session transcript).

<p class='cert'>Record: <code>topics/classicism/results/self-atoms-are-strong-worlds-t-and-bf-imply-self-atoms-are-strong-worlds-r.yaml</code></p>
